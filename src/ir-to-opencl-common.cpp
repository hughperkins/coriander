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

// #include <iostream>
#include <sstream>
#include <set>

#include "llvm/IR/AssemblyAnnotationWriter.h"
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
#include "llvm/Support/raw_os_ostream.h"

#include "mutations.h"
#include "ir-to-opencl-common.h"

using namespace std;
using namespace llvm;

string getIndent(int level) {
    ostringstream oss;
    for(int i = 0; i < level; i++) {
        oss << "  ";
    }
    return oss.str();
}

void walkType(Module *M, StructInfo *structInfo, int level, int offset, vector<int> indices, string path, Type *type) {
    if(StructType *structtype = dyn_cast<StructType>(type)) {
        walkStructType(M, structInfo, level, offset, indices, path, structtype);
    } else if(PointerType *pointerType = dyn_cast<PointerType>(type)) {
        Type *elementType = pointerType->getPointerElementType();
        int addressspace = pointerType->getAddressSpace();
        // outs() << getIndent(level) << "pointer type " << dumpType(elementType) << " addressspace " << addressspace << " offset=" << offset << "\n";
        // how to find out if this is gpu allocated or not?
        // let's just heuristically assume that all primitive*s are gpu allocated for now?
        // and lets assume that structs are just sent one at a time now, and any contained structs are one at a time
        // we can figure out how to generalize this later...
        // actually, anything except float *s, we're just going to leave as-is (or set to zero), for now
        if(elementType->getPrimitiveSizeInBits() != 0) {
            // outs() << "primitive type " << dumpType(pointerType) << "\n";
            structInfo->pointerInfos.push_back(unique_ptr<PointerInfo>(new PointerInfo(offset, pointerType, indices, path)));
        }
    } else if(ArrayType *arrayType = dyn_cast<ArrayType>(type)) {
        Type *elemType = arrayType->getElementType();
        int count = arrayType->getNumElements();
        // outs() << getIndent(level) << dumpType(elemType) << "[" << count << "] offset=" << offset << "\n";
    } else if(IntegerType *intType = dyn_cast<IntegerType>(type)) {
        int bitwidth = intType->getBitWidth();
        // outs() << getIndent(level) << "int" << bitwidth << " offset=" << offset << "\n";
    } else if(type->getPrimitiveSizeInBits() != 0) {
        // int bitwidth = intType->getBitWidth();
        // outs() << getIndent(level) << " someprimitive " << " offset=" << offset << "\n";
    } else {
        throw runtime_error("walktype type not handled: " + dumpType(type));
    }
}

void walkStructType(Module *M, StructInfo *structInfo, int level, int offset, vector<int> indices, string path, StructType *type) {
    // Type *type = value->getType();
    // if(isa<StructType>(type)) {
        // outs() << "walkvalue type is struct" << "\n";
        // walk each member of the struct

    // outs() << getIndent(level) << string(type->getName());
    // outs() << " offset=" << offset << " allocsize=" << M->getDataLayout().getTypeAllocSize(type) << "\n";
    int childoffset = offset;
    int i = 0;
    // Module *M = type->
    for(auto it=type->element_begin(); it != type->element_end(); it++) {
        Type *child = *it;
        // printIndent(level);
        // outs() << getIndent(level) + "child type " << dumpType(child) << "\n";
        vector<int> childindices(indices);
        childindices.push_back(i);
        walkType(M, structInfo, level + 1, childoffset, childindices, path + ".f" + toString(i), child);
        childoffset += M->getDataLayout().getTypeAllocSize(child);
        i++;
    }

    // } else {
    //     throw runtime_error("walkvalue unhandled type " + dumpType(type));
    // }
    //     throw runtime_error("walkvalue unhandled type " + dumpType(type));
    // }
}
