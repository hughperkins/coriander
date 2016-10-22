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

#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"

#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
// #include "llvm/IR/IRBuilder.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_os_ostream.h"

#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include <cstdio>
#include <cstdlib>
#include <vector>
#include <map>
#include <set>
#include <stdexcept>
#include <sstream>
#include <fstream>

#include "mutations.h"
#include "struct_clone.h"
#include "ir-to-opencl-common.h"

using namespace llvm;
using namespace std;

static llvm::LLVMContext context;
static std::string sourcecode_stringname;

bool single_precision = true;

class LaunchCallInfo {
public:
    LaunchCallInfo() {
        // launchInstruction = 0;
        // kernelName = "";
        // for(int i = 0; i < 3; i++) {
        //     grid[i] = 0;
        //     block[i] = 0;
        // }
        grid_xy_value = 0;
        grid_z_value = 0;
        block_xy_value = 0;
        block_z_value = 0;
    }
    std::string kernelName = "";
    // CallInst *launchInstruction;
    vector<Type *> callTypes;
    vector<Value *> callValuesByValue;
    vector<Value *> callValuesAsPointers;
    Value *grid_xy_value;
    Value *grid_z_value;
    Value *block_xy_value;
    Value *block_z_value;
    // int grid[3];
    // int block[3];
};

static unique_ptr<LaunchCallInfo> launchCallInfo(new LaunchCallInfo);

ostream &operator<<(ostream &os, const LaunchCallInfo &info) {
    raw_os_ostream my_raw_os_ostream(os);
    my_raw_os_ostream << "LaunchCallInfo " << info.kernelName;
    my_raw_os_ostream << "<<<";

    // my_raw_os_ostream << "dim3(";
    // for(int j = 0; j < 3; j++) {
    //     if(j > 0) {
    //         my_raw_os_ostream << ", ";
    //     }
    //     my_raw_os_ostream << info.grid[j];
    // }
    // my_raw_os_ostream << ")";
    // my_raw_os_ostream << ", ";

    // my_raw_os_ostream << "dim3(";
    // for(int j = 0; j < 3; j++) {
    //     if(j > 0) {
    //         my_raw_os_ostream << ", ";
    //     }
    //     my_raw_os_ostream << info.block[j];
    // }
    // my_raw_os_ostream << ")";

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
    for(auto it=info.callValuesByValue.begin(); it != info.callValuesByValue.end(); it++) {
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
    // input to this is a cudaLaunch instruction
    // output is:
    // - name of the kernel
    // - type of each of the kernel parameters (without the actual Value's)
    info->callTypes.clear();
    outs() << "getLaunchTypes()\n";
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
        outs() << "got kernel name " << info->kernelName << "\n";
    } else {
        throw runtime_error("getlaunchtypes, didnt get ConstantExpr");
    }
}

void getLaunchArgValue(CallInst *inst, LaunchCallInfo *info) {
    // input to this is:
    // - inst is cudaSetupArgument instruction, with:
    //   - first operand is a value pointing to the value we want to send to the kernel
    //
    // - output of this method is
    //    populate info with a Value holding the actual concrete value w ewant to send to the kernel
    //    (note a pointer to it, since we Load the pointer)
    // Notes:
    // - the first operand of inst was created as bitcast(i8*)(alloca (type-of-arg))
    // - the alloca instruction is inst->getOperand(0)->getOperand(0)
    // - so if we load from the alloca instruction, we should have the value we want?
    // outs() << "getLaunchArgValue " << "\n";
    if(!isa<Instruction>(inst->getOperand(0))) {
        outs() << "getlaunchvalue, first operatnd of inst is not an instruction..." << "\n";
        inst->dump();
        outs() << "\n";
        inst->getOperand(0)->dump();
        outs() << "\n";
        throw runtime_error("getlaunchvalue, first operatnd of inst is not an instruction...");
    }
    Instruction *bitcast = cast<Instruction>(inst->getOperand(0));
    Value *alloca = bitcast->getOperand(0);
    Instruction *load = new LoadInst(alloca, "loadCudaArg");
    load->insertBefore(inst);
    info->callValuesByValue.push_back(load);
    info->callValuesAsPointers.push_back(alloca);
}

ostream &operator<<(ostream &os, const PointerInfo &pointerInfo) {
    os << "PointerInfo(offset=" << pointerInfo.offset << ", type=" << dumpType(pointerInfo.type);
    os << " indices=";
    int i = 0;
    for(auto it=pointerInfo.indices.begin(); it != pointerInfo.indices.end(); it++) {
        if(i > 0) {
            os << ",";
        }
        os << *it;
        i++;
    }
    os << ")";
    return os;
}

Instruction *addSetKernelArgInst_int(Instruction *lastInst, Value *value, IntegerType *intType) {
    Module *M = lastInst->getModule();

    int bitLength = intType->getBitWidth();
    string mangledName = "";
    if(bitLength == 32) {
        mangledName = "_Z17setKernelArgInt32i";
    } else if(bitLength == 64) {
        mangledName = "_Z17setKernelArgInt64l";
    } else if(bitLength == 8) {
        mangledName = "_Z16setKernelArgInt8c";
    } else {
        throw runtime_error("bitlength " + toString(bitLength) + " not implemented");
    }
    Function *setKernelArgInt = cast<Function>(M->getOrInsertFunction(
        mangledName,
        Type::getVoidTy(context),
        IntegerType::get(context, bitLength),
        NULL));
    CallInst *call = CallInst::Create(setKernelArgInt, value);
    call->insertAfter(lastInst);
    lastInst = call;
    return lastInst;
}

Instruction *addSetKernelArgInst_float(Instruction *lastInst, Value *value) {
    Module *M = lastInst->getModule();

    Function *setKernelArgFloat = cast<Function>(M->getOrInsertFunction(
        "_Z17setKernelArgFloatf",
        Type::getVoidTy(context),
        Type::getFloatTy(context),
        NULL));
    CallInst *call = CallInst::Create(setKernelArgFloat, value);
    call->insertAfter(lastInst);
    return call;
}

Instruction *addSetKernelArgInst_pointer(Instruction *lastInst, Value *value) {
    Module *M = lastInst->getModule();

    Type *elementType = value->getType()->getPointerElementType();
    // we can probably generalize these to all just send as a pointer to char
    // we'll need to cast them somehow first

    BitCastInst *bitcast = new BitCastInst(value, PointerType::get(IntegerType::get(context, 8), 0));
    bitcast->insertAfter(lastInst);
    lastInst = bitcast;

    Function *setKernelArgFloatStar = cast<Function>(M->getOrInsertFunction(
        "_Z20setKernelArgCharStarPc",
        Type::getVoidTy(context),
        PointerType::get(IntegerType::get(context, 8), 0),
        NULL));
    CallInst *call = CallInst::Create(setKernelArgFloatStar, bitcast);
    call->insertAfter(lastInst);
    lastInst = call;
    return lastInst;
}

Instruction *addSetKernelArgInst_byvaluestruct(Instruction *lastInst, Value *value, Value *valueAsPointerInstr) {
    Module *M = lastInst->getModule();

    outs() << "got a byvalue struct" << "\n";
    unique_ptr<StructInfo> structInfo(new StructInfo());
    walkStructType(M, structInfo.get(), 0, 0, vector<int>(), "", cast<StructType>(value->getType()));

    bool structHasPointers = structInfo->pointerInfos.size() > 0;
    outs() << "struct has pointers? " << structHasPointers << "\n";

    Type *newType = cloneStructTypeNoPointers(cast<StructType>(value->getType()));

    const DataLayout *dataLayout = &M->getDataLayout();
    int allocSize = dataLayout->getTypeAllocSize(newType);
    outs() << "original typeallocsize " << dataLayout->getTypeAllocSize(value->getType()) << "\n";
    outs() << "pointerfree typeallocsize " << allocSize << "\n";

    Function *setKernelArgStruct = cast<Function>(M->getOrInsertFunction(
        "_Z18setKernelArgStructPci",
        Type::getVoidTy(context),
        PointerType::get(IntegerType::get(context, 8), 0),
        IntegerType::get(context, 32),
        NULL));

    AllocaInst *alloca = new AllocaInst(newType, "newalloca");
    alloca->insertAfter(lastInst);
    lastInst = alloca;

    lastInst = copyStructValuesNoPointers(lastInst, valueAsPointerInstr, alloca);

    BitCastInst *bitcast = new BitCastInst(alloca, PointerType::get(IntegerType::get(context, 8), 0));
    bitcast->insertAfter(lastInst);
    lastInst = bitcast;

    Value *args[2];
    args[0] = bitcast;
    args[1] = createInt32Constant(&context, allocSize);

    CallInst *call = CallInst::Create(setKernelArgStruct, ArrayRef<Value *>(args));
    call->insertAfter(lastInst);
    lastInst = call;

    outs() << "pointers in struct:" << "\n";
    for(auto pointerit=structInfo->pointerInfos.begin(); pointerit != structInfo->pointerInfos.end(); pointerit++) {
        PointerInfo *pointerInfo = pointerit->get();
        int offset = pointerInfo->offset;
        Type *type = pointerInfo->type;
        vector<Value *> indices;
        indices.push_back(createInt32Constant(&context, 0));
        for(auto idxit = pointerInfo->indices.begin(); idxit != pointerInfo->indices.end(); idxit++) {
            int idx = *idxit;
            outs() << "idx " << idx << "\n";
            indices.push_back(createInt32Constant(&context, idx));
        }
        GetElementPtrInst *gep = GetElementPtrInst::CreateInBounds(value->getType(), valueAsPointerInstr, ArrayRef<Value *>(&indices[0], &indices[indices.size()]), "getfloatstaraddr");
        outs() << "gep type " << dumpType(gep->getType()) << "\n";
        gep->insertAfter(lastInst);
        lastInst = gep;

        LoadInst *loadgep = new LoadInst(gep, "loadgep");
        loadgep->insertAfter(lastInst);
        lastInst = loadgep;

        outs() << "loadgep type " << dumpType(loadgep->getType()) << "\n";
        Type *gepElementType = loadgep->getType()->getPointerElementType();
        outs() << "gepElementType " << dumpType(gepElementType) << "\n";
        if(IntegerType *integerType = dyn_cast<IntegerType>(gepElementType)) {
            if(integerType->getBitWidth() == 8) {
                Function *setKernelArgCharStar = cast<Function>(M->getOrInsertFunction(
                    "_Z20setKernelArgCharStarPc",
                    Type::getVoidTy(context),
                    PointerType::get(IntegerType::get(context, 8), 0),
                    NULL));
                CallInst *call = CallInst::Create(setKernelArgCharStar, loadgep);
                call->insertAfter(lastInst);
                lastInst = call;
            } else {
                throw runtime_error("integer type with bitwidth " + toString(integerType->getBitWidth()) + " not implemented for pointers in struct");
            }
        } else if(gepElementType->isFloatingPointTy()) {
            Function *setKernelArgFloatStar = cast<Function>(M->getOrInsertFunction(
                "_Z21setKernelArgFloatStarPf",
                Type::getVoidTy(context),
                PointerType::get(Type::getFloatTy(context), 0),
                NULL));
            CallInst *call = CallInst::Create(setKernelArgFloatStar, loadgep);
            call->insertAfter(lastInst);
            lastInst = call;
        } else {
            throw runtime_error("type " + dumpType(gepElementType) + " not implemented for pointers in structs");
        }
    }
    return lastInst;
}

Instruction *addSetKernelArgInst(Instruction *lastInst, Value *value, Value *valueAsPointerInstr) {
    Module *M = lastInst->getModule();

    if(IntegerType *intType = dyn_cast<IntegerType>(value->getType())) {
        lastInst = addSetKernelArgInst_int(lastInst, value, intType);
    } else if(value->getType()->isFloatingPointTy()) {
        lastInst = addSetKernelArgInst_float(lastInst, value);
    } else if(value->getType()->isPointerTy()) {
        lastInst = addSetKernelArgInst_pointer(lastInst, value);
    } else if(isa<StructType>(value->getType())) {
        lastInst = addSetKernelArgInst_byvaluestruct(lastInst, value, valueAsPointerInstr);
    } else {
        value->dump();
        outs() << "\n";
        throw runtime_error("kernel arg type type not implemented " + dumpType(value->getType()));
    }
    return lastInst;
}

void patchCudaLaunch(Function *F, CallInst *inst, vector<Instruction *> &to_replace_with_zero) {
    outs() << "cudaLaunch\n";

    Module *M = inst->getModule();

    getLaunchTypes(inst, launchCallInfo.get());
    to_replace_with_zero.push_back(inst);
    outs() << "patching launch in " << string(F->getName()) << "\n";

    string kernelName = launchCallInfo->kernelName;
    Instruction *kernelNameValue = addStringInstr(M, "s." + kernelName, kernelName);
    kernelNameValue->insertBefore(inst);

    Instruction *clSourcecodeValue = addStringInstrExistingGlobal(M, sourcecode_stringname);
    clSourcecodeValue->insertBefore(inst);

    Function *configureKernel = cast<Function>(F->getParent()->getOrInsertFunction(
        "configureKernel",
        Type::getVoidTy(context),
        PointerType::get(IntegerType::get(context, 8), 0),
        PointerType::get(IntegerType::get(context, 8), 0),
        NULL));
    Value *args[] = {kernelNameValue, clSourcecodeValue};
    CallInst *callConfigureKernel = CallInst::Create(configureKernel, ArrayRef<Value *>(&args[0], &args[2]));
    callConfigureKernel->insertBefore(inst);
    Instruction *lastInst = callConfigureKernel;

    // pass args now
    int i = 0;
    for(auto argit=launchCallInfo->callValuesByValue.begin(); argit != launchCallInfo->callValuesByValue.end(); argit++) {
        Value *value = *argit;
        Value *valueAsPointerInstr = launchCallInfo->callValuesAsPointers[i];
        lastInst = addSetKernelArgInst(lastInst, value, valueAsPointerInstr);
        i++;
    }
    // trigger the kernel...
    Function *kernelGo = cast<Function>(F->getParent()->getOrInsertFunction(
        "_Z8kernelGov",
        Type::getVoidTy(context),
        NULL));
    CallInst *kernelGoInst = CallInst::Create(kernelGo);
    kernelGoInst->insertAfter(lastInst);
    lastInst = kernelGoInst;

    launchCallInfo->callValuesByValue.clear();
    launchCallInfo->callValuesAsPointers.clear();
    // launchCallInfo.reset(new LaunchCallInfo);
}

void patchFunction(Function *F) {
    vector<Instruction *> to_replace_with_zero;
    IntegerType *inttype = IntegerType::get(context, 32);
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
                    patchCudaLaunch(F, inst, to_replace_with_zero);
                } else if(calledFunctionName == "cudaSetupArgument") {
                    outs() << "cudaSetupArgument\n";
                    inst->dump();
                    outs() << "\n";
                    getLaunchArgValue(inst, launchCallInfo.get());
                    to_replace_with_zero.push_back(inst);
                }
            }
        }
    }
    for(auto it=to_replace_with_zero.begin(); it != to_replace_with_zero.end(); it++) {
        Instruction *inst = *it;
        BasicBlock::iterator ii(inst);
        ReplaceInstWithValue(inst->getParent()->getInstList(), ii, constzero);
    }
}


void patchModule(string deviceclfilename, Module *M) {
    ifstream f_in(deviceclfilename);
    string cl_sourcecode(
        (std::istreambuf_iterator<char>(f_in)),
        (std::istreambuf_iterator<char>()));

    sourcecode_stringname = "__opencl_sourcecode" + deviceclfilename;
    addGlobalVariable(M, sourcecode_stringname, cl_sourcecode);

    vector<Function *> functionsToRemove;
    for(auto it = M->begin(); it != M->end(); it++) {
        Function *F = &*it;
        string name = F->getName();
            patchFunction(F);
            verifyFunction(*F);
    }
}

int main(int argc, char *argv[]) {
    SMDiagnostic smDiagnostic;
    if(argc != 4) {
        outs() << "Usage: " << argv[0] << " infile-rawhost.ll infile-device.cl outfile-patchedhost.ll" << "\n";
        return 1;
    }

    string rawhostfilename = argv[1];
    string deviceclfilename = argv[2];
    string patchedhostfilename = argv[3];
    outs() << "reading rawhost ll file " << rawhostfilename << "\n";
    outs() << "reading device cl file " << deviceclfilename << "\n";
    outs() << "outputing to patchedhost file " << patchedhostfilename << "\n";

    // debug = false;
    // if(argc == 3) {
    //     if(string(argv[1]) != "--debug") {
    //         outs() << "Usage: " << argv[0] << " [--debug] target.ll" << "\n";
    //         return 1;
    //     } else {
    //         debug = true;
    //     }
    // }
    std::unique_ptr<llvm::Module> module = parseIRFile(rawhostfilename, smDiagnostic, context);
    if(!module) {
        smDiagnostic.print(argv[0], errs());
        return 1;
    }

    patchModule(deviceclfilename, module.get());

    AssemblyAnnotationWriter assemblyAnnotationWriter;
    ofstream ofile;
    ofile.open(patchedhostfilename);
    raw_os_ostream my_raw_os_ostream(ofile);
    verifyModule(*module);
    module->print(my_raw_os_ostream, &assemblyAnnotationWriter);
    ofile.close();
    return 0;
}
