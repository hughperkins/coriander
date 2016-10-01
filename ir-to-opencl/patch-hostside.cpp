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

using namespace llvm;
using namespace std;

static llvm::LLVMContext TheContext;
static llvm::IRBuilder<> Builder(TheContext);
static std::unique_ptr<llvm::Module> TheModule;

bool single_precision = true;

std::string dumpType(Type *type);

std::string dumpFunctionType(FunctionType *fn) {
    cout << "function" << endl;
    // cout << "name " << string(fn->getName()) << endl;
    std::string params_str = "";
    int i = 0;
    for(auto it=fn->param_begin(); it != fn->param_end(); it++) {
        Type * paramType = *it;
        if(i > 0) {
            params_str += ", ";
        }
        params_str += dumpType(paramType);
        i++;
    }
    cout << "params_str " << params_str << endl;
    return params_str;
}

std::string dumpPointerType(PointerType *ptr) {
    string gencode = "";
    Type *elementType = ptr->getPointerElementType();
    string elementTypeString = dumpType(elementType);
    int addressspace = ptr->getAddressSpace();
    if(addressspace == 1) {
        gencode += "global ";
    }
    gencode += elementTypeString + "*";
    return gencode;
}

std::string dumpIntegerType(IntegerType *type) {
    switch(type->getPrimitiveSizeInBits()) {
        case 32:
            return "int";
        case 64:
            return "long";
        case 8:
            return "char";
        case 1:
            return "bool";
        default:
            cout << "integer size " << type->getPrimitiveSizeInBits() << endl;
            throw runtime_error("unrecognized size");
    }
}

std::string dumpStructType(StructType *type) {
    if(type->hasName()) {
        string name = type->getName();
        if(name == "struct.float4") {
            return "float4";
        } else {
            cout << "struct name: " << name << endl;
            throw runtime_error("not implemented: struct name " + name);
        }
    } else {
        throw runtime_error("not implemented: anonymous struct types");
    }
}

std::string dumpType(Type *type) {
    Type::TypeID typeID = type->getTypeID();
    switch(typeID) {
        case Type::VoidTyID:
            return "void";
        case Type::FloatTyID:
            return "float";
        // case Type::UnionTyID:
        //     throw runtime_error("not implemented: union type");
        case Type::StructTyID:
            return dumpStructType((StructType *)type);
        case Type::VectorTyID:
            throw runtime_error("not implemented: vector type");
        case Type::ArrayTyID:
            throw runtime_error("not implemented: array type");
        case Type::DoubleTyID:
            if(single_precision) {
                return "float";
            } else {
                return "double";
            }
        case Type::FunctionTyID:
            return dumpFunctionType(dyn_cast<FunctionType>(type));
        case Type::PointerTyID:
            // cout << "pointer type" << endl;
            return dumpPointerType((PointerType *)type);
        case Type::IntegerTyID:
            return dumpIntegerType((IntegerType *)type);
        default:
            cout << "type id " << typeID << endl;
            throw runtime_error("unrecognized type");
    }
}

class LaunchCallInfo {
public:
    LaunchCallInfo() {
        launchInstruction = 0;
    }
    std::string kernelName;
    CallInst *launchInstruction;
    vector<Type *> callTypes;
    vector<Value *> callValues;
};

ostream &operator<<(ostream &os, const LaunchCallInfo &info) {
    int i = 0;
    raw_os_ostream my_raw_os_ostream(os);
    my_raw_os_ostream << "LaunchCallInfo " << info.kernelName << "(";
    for(auto it=info.callTypes.begin(); it != info.callTypes.end(); it++) {
        if(i > 0){
            my_raw_os_ostream << ", ";
        }
        Type *type = *it;
        type->print(my_raw_os_ostream);
        i++;
    }
    my_raw_os_ostream << ");\n";
    for(auto it=info.callValues.begin(); it != info.callValues.end(); it++) {
        Value *value = *it;
        my_raw_os_ostream << "value " << dumpType(value->getType()) << "\n";
    }
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
    Instruction *op0 = dyn_cast<Instruction>(inst->getOperand(0));
    Instruction *op0_0 = dyn_cast<Instruction>(op0->getOperand(0));
    for(auto it=op0_0->user_begin(); it != op0_0->user_end(); it++) {
        if(Instruction *useInst = dyn_cast<Instruction>(*it)) {
            if(StoreInst *store = dyn_cast<StoreInst>(useInst)) {
                // cout << "store operand 0 type " << dumpType(store->getOperand(0)->getType()) << endl;
                info->callValues.push_back(store->getOperand(0));
            }
        }
    }
}


void patchFunction(Function *F) {
    vector<Instruction *> to_erase;
    unique_ptr<LaunchCallInfo> launchCallInfo(new LaunchCallInfo);
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        // cout << "block name " << string(basicBlock->getName()) << endl;
        for(auto insit=basicBlock->begin(); insit != basicBlock->end(); insit++) {
            if(CallInst *inst = dyn_cast<CallInst>(&*insit)) {
                // cout << "got a call instruction " << endl;
                // cout << string(inst->getName()) << endl;
                // if(!inst->hasName()) {
                //     cout << "no name" << endl;
                //     continue;
                // }
                // // cout << "no name" << endl;
                // cout << "call inst name " << string(inst->getName()) << endl;
                Function *called = inst->getCalledFunction();
                if(called == 0) {
                    // cout << "called is null" << endl;
                    continue;
                }
                // cout << "got called" << endl;
                if(!called->hasName()) {
                    // cout << "called has no name" << endl;
                    continue;
                }
                string calledFunctionName = called->getName();
                // cout << calledFunctionName << endl;
                if(calledFunctionName == "cudaLaunch") {
                    getLaunchTypes(inst, launchCallInfo.get());
                    // inst->eraseFromParent();
                    to_erase.push_back(inst);
                    // launchCallInfo->launchInstruction = dyn_cast<CallInst>(inst);
                    // cout << "erased from parent" << endl;
                    cout << *launchCallInfo << endl;
                    launchCallInfo.reset(new LaunchCallInfo);
                } else if(calledFunctionName == "cudaSetupArgument") {
                    getLaunchArgValue(inst, launchCallInfo.get());
                    // to_erase.push_back(inst->)
                    // to_erase.push_back(inst);
                }
            }
                // break;
        }
    }
    cout << *launchCallInfo << endl;
    for(auto it=to_erase.begin(); it != to_erase.end(); it++) {
        Instruction *inst = *it;
        inst->eraseFromParent();
    }
    // if(launchCallInfo != 0 && launchCallInfo->launchInstruction != 0) {
    //     cout << "erasing" << endl;
    //     launchCallInfo->launchInstruction->eraseFromParent();
    // }
}


void patchModule(Module *M) {
    int i = 0;
    for(auto it = M->begin(); it != M->end(); it++) {
        // nameByValue.clear();
        // nextNameIdx = 0;
        string name = it->getName();
        // cout << "name " << name << endl;
        Function *F = &*it;
        if(name == "_Z14launchSetValuePfif") {
            cout << "Function " << name << endl;
            patchFunction(F);
        }
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
    if(argc != 3) {
        cout << "Usage: " << argv[0] << " infile.ll outfile.o" << endl;
        return 1;
    }
    string infile = argv[1];
    // debug = false;
    // if(argc == 3) {
    //     if(string(argv[1]) != "--debug") {
    //         cout << "Usage: " << argv[0] << " [--debug] target.ll" << endl;
    //         return 1;
    //     } else {
    //         debug = true;
    //     }
    // }
    TheModule = parseIRFile(infile, Err, TheContext);
    if(!TheModule) {
        Err.print(argv[0], errs());
        return 1;
    }

    patchModule(TheModule.get());

    AssemblyAnnotationWriter assemblyAnnotationWriter;
    ofstream ofile;
    ofile.open(argv[2]);
    raw_os_ostream my_raw_os_ostream(ofile);
    TheModule->print(my_raw_os_ostream, &assemblyAnnotationWriter);
    // my_raw_os_ostream.close();
    ofile.close();
    // TheModule->dump();
//    dumpModule(TheModule.get());
    return 0;
}
