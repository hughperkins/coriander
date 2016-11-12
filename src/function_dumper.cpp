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

#include "function_dumper.h"

#include "struct_clone.h"
#include "basicblockdumper.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include "llvm/IR/Function.h"

using namespace std;
using namespace llvm;

namespace cocl {

string FunctionDumper::createOffsetDeclaration(string argName) {
    #ifdef OFFSET_32BIT
       return ", uint " + argName + "_offset";
    #else
       return ", long " + argName + "_offset";
    #endif
}

string FunctionDumper::createOffsetShim(Type *argType, string argName) {
    string shim = "    " + argName + " += " + argName + "_offset;\n";
    return shim;
}

std::string FunctionDumper::dumpFunctionDeclaration(Function *F) {
    string declaration = "";
    Type *retType = F->getReturnType();
    std::string retTypeString = typeDumper->dumpType(retType);
    string fname = F->getName().str();
    if(isKernel) {
        declaration += "kernel ";
    }
    declaration += typeDumper->dumpType(retType) + " " + fname + "(";
    int i = 0;
    // structpointershimcode = "";
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        string argName = localNames.getOrCreateName(arg, arg->getName().str());
        Type *argType = arg->getType();
        // string argName = dumpOperand(arg);
        string argdeclaration = "";
        bool is_struct_needs_cloning = false;
        bool ispointer = isa<PointerType>(argType);
        if(isKernel) {
            if(PointerType *ptrType = dyn_cast<PointerType>(argType)) {
                Type *elemType = ptrType->getPointerElementType();
                if(StructType *structType = dyn_cast<StructType>(elemType)) {
                    if(structType->getName().str() != "struct.float4") {
                        unique_ptr<StructInfo> structInfo(new StructInfo());
                        StructCloner::walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
                        if(structInfo->pointerInfos.size() > 0) { // struct has pointers...
                            StructType *noptrType = structCloner.cloneNoPointers(structType);
                            structsToDefine.insert(noptrType);
                            is_struct_needs_cloning = true;
                            argdeclaration = "global " + typeDumper->dumpType(noptrType) + "* " + argName + "_nopointers";
                        }
                    }
                }
            }
            if(!is_struct_needs_cloning) {
                if(argType->getTypeID() == Type::PointerTyID) {
                    Type *elementType = argType->getPointerElementType();
                    Type *newtype = PointerType::get(elementType, 1);
                    arg->mutateType(newtype);
                }
            }
        }
        if(!is_struct_needs_cloning) {
            argdeclaration = typeDumper->dumpType(arg->getType()) + " " + argName;
            // if(ispointer) {
                // argdeclaration += "_";
            // }
        }
        if(i > 0) {
            declaration += ", ";
        }
        declaration += argdeclaration;
        // if this is a kernel method, check for any structs containing pointers,
        // and add those pointers t othe argument list, with some appropriate shimcode
        // to copy those pointers into the struct, at the start of the kernel
        int j = 0;
        if(is_struct_needs_cloning) {
            StructType *structType = cast<StructType>(cast<PointerType>(argType)->getPointerElementType());
            // declare a pointerful struct, then copy the vlaues across, then copy the float *s in
            unique_ptr<StructInfo> structInfo(new StructInfo());
            StructCloner::walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
            shimCode += typeDumper->dumpType(structType) + " " + argName + "[1];\n";
            shimCode += structCloner.writeClCopyNoPtrToPtrfull(structType, argName + "_nopointers[0]", argName + "[0]");
            for(auto pointerit=structInfo->pointerInfos.begin(); pointerit != structInfo->pointerInfos.end(); pointerit++) {
                PointerInfo *pointerInfo = pointerit->get();
                pointerInfo->type = PointerType::get(pointerInfo->type->getPointerElementType(), 1);
                int offset = pointerInfo->offset;
                string pointerArgName = argName + "_ptr" + easycl::toString(j);
                declaration += ", " + typeDumper->dumpType(pointerInfo->type) + " " + pointerArgName;
                declaration += createOffsetDeclaration(pointerArgName);
                shimCode = 
                    createOffsetShim(pointerInfo->type, pointerArgName) +
                    shimCode +
                    argName + "[0]" + pointerInfo->path + " = " + pointerArgName + ";\n";
                j++;
            }
        }
        if(isKernel && ispointer && !is_struct_needs_cloning) {
            // add offset
            declaration += createOffsetDeclaration(argName);
            shimCode = 
                createOffsetShim(arg->getType(), argName) +
                shimCode;
        }
        i++;
    }
    if(i > 0) {
        declaration += ", ";
    }
    declaration += "local int *scratch";
    declaration += ")";
    return declaration;
}

std::string FunctionDumper::toCl() {
    string declaration = dumpFunctionDeclaration(F);

    string bodyCl = "";
    int i = 0;
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        functionBlockIndex[basicBlock] = i;
        i++;
    }

    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        BasicBlockDumper basicBlockDumper(
            basicBlock, globalNames, &localNames, typeDumper, functionNamesMap);
        bodyCl += basicBlockDumper.toCl();
        functionDeclarations += basicBlockDumper.getAllocaDeclarations("    ");
        functionDeclarations += basicBlockDumper.writeDeclarations("    ");
        for(auto it2=basicBlockDumper.neededFunctions.begin(); it2 != basicBlockDumper.neededFunctions.end(); it2++) {
            neededFunctions.insert(*it2);
        }
        // bodyCl += dumpBasicBlock(basicBlock);
    }

    Type *returnType = F->getReturnType();
    if(PointerType *ptr = dyn_cast<PointerType>(returnType)) {
        if(ptr->getAddressSpace() == 1) {
            declaration = "global " + declaration;  // a bit hacky, but maybe it works ok for now?
        }
    }

    string gencode = declaration + " {\n";
    gencode += functionDeclarations + "\n";
    // for(auto it=currentFunctionPhiDeclarationsByName.begin(); it != currentFunctionPhiDeclarationsByName.end(); it++){
    //     gencode += "    " + it->second + ";\n";
    // }

    if(shimCode != "") {
        gencode += shimCode + "\n";
    }
    gencode += bodyCl;
    gencode += "}\n";

    // COCL_PRINT(cout << endl);
    return gencode;
}

} // namespace cocl
