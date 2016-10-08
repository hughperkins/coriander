// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


// This is going to patch the cuda launch instrutions, in the hostside ir. hopefully

#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_os_ostream.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <map>
#include <set>
#include <iostream>
#include <stdexcept>
#include <sstream>
#include <fstream>

#include "ir-to-opencl-common.h"

using namespace llvm;
using namespace std;

static llvm::LLVMContext TheContext;
static llvm::IRBuilder<> Builder(TheContext);
static std::unique_ptr<llvm::Module> TheModule;

bool single_precision = true;

class LaunchCallInfo {
public:
    LaunchCallInfo() {
        // launchInstruction = 0;
        // kernelName = "";
        for(int i = 0; i < 3; i++) {
            grid[i] = 0;
            block[i] = 0;
        }
    }
    std::string kernelName = "";
    // CallInst *launchInstruction;
    vector<Type *> callTypes;
    vector<Value *> callValues;
    int grid[3];
    int block[3];
};

ostream &operator<<(ostream &os, const LaunchCallInfo &info) {
    raw_os_ostream my_raw_os_ostream(os);
    my_raw_os_ostream << "LaunchCallInfo " << info.kernelName;
    my_raw_os_ostream << "<<<";

    my_raw_os_ostream << "dim3(";
    for(int j = 0; j < 3; j++) {
        if(j > 0) {
            my_raw_os_ostream << ", ";
        }
        my_raw_os_ostream << info.grid[j];
    }
    my_raw_os_ostream << ")";
    my_raw_os_ostream << ", ";

    my_raw_os_ostream << "dim3(";
    for(int j = 0; j < 3; j++) {
        if(j > 0) {
            my_raw_os_ostream << ", ";
        }
        my_raw_os_ostream << info.block[j];
    }
    my_raw_os_ostream << ")";

    my_raw_os_ostream << ">>>";
    my_raw_os_ostream << "(";
    int i = 0;
    for(auto it=info.callTypes.begin(); it != info.callTypes.end(); it++) {
        if(i > 0){
            my_raw_os_ostream << ", ";
        }
        Type *type = *it;
        type->print(my_raw_os_ostream);
        i++;
    }
    my_raw_os_ostream << ");\n";
    my_raw_os_ostream << "value types: ";
    i = 0;
    for(auto it=info.callValues.begin(); it != info.callValues.end(); it++) {
        Value *value = *it;
        if(i > 0) {
            my_raw_os_ostream << ", ";
        }
        my_raw_os_ostream << dumpType(value->getType());
        i ++;
    }
    // my_raw_os_ostream << "\n";
    return os;
}

void getLaunchTypes(CallInst *inst, LaunchCallInfo *info) {
    // unique_ptr<LaunchCallInfo> launchCallInfo(new LaunchCallInfo);
    Value *argOperand = inst->getArgOperand(0);
    if(ConstantExpr *expr = dyn_cast<ConstantExpr>(argOperand)) {
        Instruction *instr = expr->getAsInstruction();
        Type *op0type = instr->getOperand(0)->getType();
        Type *op0typepointed = op0type->getPointerElementType();
        if(FunctionType *fn = dyn_cast<FunctionType>(op0typepointed)) {
            for(auto it=fn->param_begin(); it != fn->param_end(); it++) {
                Type * paramType = *it;
                info->callTypes.push_back(paramType);
            }
        }
        info->kernelName = instr->getOperand(0)->getName();
    }
    // return launchCallInfo;
}

void getLaunchArgValue(CallInst *inst, LaunchCallInfo *info) {
    // ok, so we have:
    // - inst is cudaSetupArgument
    // - the first operand of inst was created as bitcast(i8*)(alloca (type-of-arg))
    // - the alloca instruction is inst->getOperand(0)->getOperand(0)
    // - so if we load from the alloca instruction, we should have the value we want?
    // cout << "getLaunchArgValue " << endl;
    Instruction *bitcast = cast<Instruction>(inst->getOperand(0));
    Instruction *alloca = cast<Instruction>(bitcast->getOperand(0));
    Instruction *load = new LoadInst(alloca, "loadCudaArg");
    load->insertBefore(inst);
    info->callValues.push_back(load);
}

uint64_t readIntConstant_uint64(ConstantInt *constant) {
    return constant->getZExtValue();
}

uint32_t readIntConstant_uint32(ConstantInt *constant) {
    assert(contant->getBitWidth() <= 32);
    return (uint32_t)constant->getZExtValue();
}

void getBlockGridDimensions(CallInst *inst, LaunchCallInfo *info) {
    // there are 6 args:
    // grid:
    // 0 i64: x, y, as 32-bit ints
    // 1 i32: z
    // block:
    // 2 i64: x, y, as 32-bit ints
    // 3 i32: z
    // 4 shared memory.  since we're not handling it right now, must be 0
    // 5 stream must be null, for now

    uint64_t grid_xy = readIntConstant_uint64(cast<ConstantInt>(inst->getArgOperand(0)));
    uint32_t grid_x = grid_xy & ((1 << 31) - 1);
    uint32_t grid_y = grid_xy >> 32;
    uint32_t grid_z = readIntConstant_uint32(cast<ConstantInt>(inst->getArgOperand(1)));
    // cout << "grid " << grid_x << " " << grid_y << " " << grid_z << endl;

    uint64_t block_xy = readIntConstant_uint64(cast<ConstantInt>(inst->getArgOperand(2)));
    uint32_t block_x = block_xy & ((1 << 31) - 1);
    uint32_t block_y = block_xy >> 32;
    uint32_t block_z = readIntConstant_uint32(cast<ConstantInt>(inst->getArgOperand(3)));
    // cout << "block " << block_x << " " << block_y << " " << block_z << endl;

    info->grid[0] = grid_x;
    info->grid[1] = grid_y;
    info->grid[2] = grid_z;

    info->block[0] = block_x;
    info->block[1] = block_y;
    info->block[2] = block_z;

    assert(readIntConstant_uint64(inst->getArgOperand(4)) == 0);
    // we should assert on the stream too really TODO: FIXME:
    // assert(readIntConstant_uint64(inst->getArgOperand(5)) == 0);
}

void patchFunction(Function *F) {
    vector<Instruction *> to_erase;
    unique_ptr<LaunchCallInfo> launchCallInfo(new LaunchCallInfo);
    vector<Instruction *> to_replace_with_zero;
    IntegerType *inttype = IntegerType::get(TheContext, 32);
    ConstantInt *constzero = ConstantInt::getSigned(inttype, 0);
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        for(auto insit=basicBlock->begin(); insit != basicBlock->end(); insit++) {
            if(CallInst *inst = dyn_cast<CallInst>(&*insit)) {
                Function *called = inst->getCalledFunction();
                if(called == 0) {
                    continue;
                }
                if(!called->hasName()) {
                    continue;
                }
                string calledFunctionName = called->getName();
                if(calledFunctionName == "cudaLaunch") {
                    getLaunchTypes(inst, launchCallInfo.get());
                    to_erase.push_back(inst);
                    cout << "patching launch in " << string(F->getName()) << endl;
                    cout << *launchCallInfo << endl;

                    Instruction *stringInstr = addStringInstr(F->getParent(), "s." + launchCallInfo->kernelName, launchCallInfo->kernelName);
                    stringInstr->insertBefore(inst);

                    Instruction *clSourcecodeInstr = addStringInstrExistingGlobal(F->getParent(), "__opencl_sourcecode");
                    clSourcecodeInstr->insertBefore(inst);

                    Function *configureKernel = cast<Function>(F->getParent()->getOrInsertFunction(
                        "_Z15configureKernelPKcS0_iiiiii",
                        Type::getVoidTy(TheContext),
                        PointerType::get(IntegerType::get(TheContext, 8), 0),
                        PointerType::get(IntegerType::get(TheContext, 8), 0),
                        IntegerType::get(TheContext, 32),
                        IntegerType::get(TheContext, 32),
                        IntegerType::get(TheContext, 32),
                        IntegerType::get(TheContext, 32),
                        IntegerType::get(TheContext, 32),
                        IntegerType::get(TheContext, 32),
                        NULL));
                    Value *args[8];
                    args[0] = stringInstr;
                    args[1] = clSourcecodeInstr;
                    args[2] = createInt32Constant(&TheContext, launchCallInfo->grid[0]);
                    args[3] = createInt32Constant(&TheContext, launchCallInfo->grid[1]);
                    args[4] = createInt32Constant(&TheContext, launchCallInfo->grid[2]);
                    args[5] = createInt32Constant(&TheContext, launchCallInfo->block[0]);
                    args[6] = createInt32Constant(&TheContext, launchCallInfo->block[1]);
                    args[7] = createInt32Constant(&TheContext, launchCallInfo->block[2]);
                    CallInst *callLaunch = CallInst::Create(configureKernel, ArrayRef<Value *>(args));
                    callLaunch->insertAfter(stringInstr);

                    Instruction *lastInst = callLaunch;
                    // pass args now
                    int i = 0;
                    for(auto argit=launchCallInfo->callValues.begin(); argit != launchCallInfo->callValues.end(); argit++) {
                        Value *value = *argit;
                        // cout << " arg " << i << " ";
                        // value->dump();
                        // cout << endl;
                        if(IntegerType *intType = dyn_cast<IntegerType>(value->getType())) {
                            // cout << "got an int" << endl;
                            Function *setKernelArgInt = cast<Function>(F->getParent()->getOrInsertFunction(
                                "_Z15setKernelArgInti",
                                Type::getVoidTy(TheContext),
                                IntegerType::get(TheContext, 32),
                                NULL));
                            CallInst *call = CallInst::Create(setKernelArgInt, value);
                            call->insertAfter(lastInst);
                            lastInst = call;
                        } else if(value->getType()->isFloatingPointTy()) {
                            // cout << "got a float" << endl;
                            Function *setKernelArgFloat = cast<Function>(F->getParent()->getOrInsertFunction(
                                "_Z17setKernelArgFloatf",
                                Type::getVoidTy(TheContext),
                                Type::getFloatTy(TheContext),
                                NULL));
                            CallInst *call = CallInst::Create(setKernelArgFloat, value);
                            call->insertAfter(lastInst);
                            lastInst = call;
                        } else if(value->getType()->isPointerTy()) {
                            // cout << "got a pointer " << endl;
                            Type *elementType = value->getType()->getPointerElementType();
                            if(elementType->isFloatingPointTy()) {
                                // cout << "got a float *" << endl;
                                Function *setKernelArgFloatStar = cast<Function>(F->getParent()->getOrInsertFunction(
                                    "_Z21setKernelArgFloatStarPf",
                                    Type::getVoidTy(TheContext),
                                    PointerType::get(Type::getFloatTy(TheContext), 0),
                                    NULL));
                                CallInst *call = CallInst::Create(setKernelArgFloatStar, value);
                                call->insertAfter(lastInst);
                                lastInst = call;
                            }
                        }
                        i++;
                    }
                    // trigger the kernel...
                    Function *kernelGo = cast<Function>(F->getParent()->getOrInsertFunction(
                        "_Z8kernelGov",
                        Type::getVoidTy(TheContext),
                        NULL));
                    CallInst *kernelGoInst = CallInst::Create(kernelGo);
                    kernelGoInst->insertAfter(lastInst);
                    lastInst = kernelGoInst;

                    launchCallInfo.reset(new LaunchCallInfo);
                } else if(calledFunctionName == "cudaSetupArgument") {
                    getLaunchArgValue(inst, launchCallInfo.get());
                    to_replace_with_zero.push_back(inst);
                } else if(calledFunctionName == "cudaConfigureCall") {
                    getBlockGridDimensions(inst, launchCallInfo.get());
                    to_replace_with_zero.push_back(inst);
                }
            }
        }
    }
    // cout << *launchCallInfo << endl;
    for(auto it=to_erase.begin(); it != to_erase.end(); it++) {
        Instruction *inst = *it;
        if(!inst->use_empty()) {
            throw runtime_error("cannot erase used instructions");
        }
        inst->eraseFromParent();
    }
    for(auto it=to_replace_with_zero.begin(); it != to_replace_with_zero.end(); it++) {
        Instruction *inst = *it;
        BasicBlock::iterator ii(inst);
        ReplaceInstWithValue(inst->getParent()->getInstList(), ii, constzero);
        // cout << "after replacevalue" << endl;
    }

    // if(launchCallInfo != 0 && launchCallInfo->launchInstruction != 0) {
    //     cout << "erasing" << endl;
    //     launchCallInfo->launchInstruction->eraseFromParent();
    // }
}


void patchModule(string deviceclfilename, Module *M) {
    // int i = 0;

    // add in opencl sourcecode
    ifstream f_in(deviceclfilename);
    string cl_sourcecode(
        (std::istreambuf_iterator<char>(f_in)),
        (std::istreambuf_iterator<char>()));

    addGlobalVariable(M, "__opencl_sourcecode", cl_sourcecode);

    vector<Function *> functionsToRemove;
    for(auto it = M->begin(); it != M->end(); it++) {
        // nameByValue.clear();
        // nextNameIdx = 0;
        Function *F = &*it;
        string name = F->getName();
        // cout << "name " << name << endl;
        // if(name.find("cuda") == 0) {
            // functionsToRemove.push_back(F);
            // https://groups.google.com/forum/#!topic/llvm-dev/ovvfIe_zU3Y
            // F->replaceAllUsesWith(UndefValue::get(F->getType()));
            // F->eraseFromParent();
            // continue;
        // }
        // if(name == "_Z14launchSetValuePfif") {
            // cout << "Function " << name << endl;
            patchFunction(F);
            // cout << "verifying function..." << endl;
            verifyFunction(*F);
            // cout << "function verified" << endl;
        // }
        // if(ignoredFunctionNames.find(name) == ignoredFunctionNames.end() &&
        //         knownFunctionsMap.find(name) == knownFunctionsMap.end()) {
        //     Function *F = &*it;
        //     if(i > 0) {
        //         cout << endl;
        //     }
        //     dumpFunction(F);
        //     i++;
        // }
    }
}

int main(int argc, char *argv[]) {
    SMDiagnostic Err;
    if(argc != 4) {
        cout << "Usage: " << argv[0] << " infile-rawhost.ll infile-device.cl outfile-patchedhost.ll" << endl;
        return 1;
    }

    string rawhostfilename = argv[1];
    string deviceclfilename = argv[2];
    string patchedhostfilename = argv[3];
    cout << "reading rawhost ll file " << rawhostfilename << endl;
    cout << "reading device cl file " << deviceclfilename << endl;
    cout << "outputing to patchedhost file " << patchedhostfilename << endl;

    // debug = false;
    // if(argc == 3) {
    //     if(string(argv[1]) != "--debug") {
    //         cout << "Usage: " << argv[0] << " [--debug] target.ll" << endl;
    //         return 1;
    //     } else {
    //         debug = true;
    //     }
    // }
    TheModule = parseIRFile(rawhostfilename, Err, TheContext);
    if(!TheModule) {
        Err.print(argv[0], errs());
        return 1;
    }

    patchModule(deviceclfilename, TheModule.get());

    AssemblyAnnotationWriter assemblyAnnotationWriter;
    ofstream ofile;
    ofile.open(patchedhostfilename);
    raw_os_ostream my_raw_os_ostream(ofile);
    verifyModule(*TheModule);
    // cout << "printing module" << endl;
    TheModule->print(my_raw_os_ostream, &assemblyAnnotationWriter);
    // my_raw_os_ostream.close();
    ofile.close();
    // TheModule->dump();
//    dumpModule(TheModule.get());
    return 0;
}
