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

#pragma once

#include "type_dumper.h"
#include "GlobalNames.h"

#include <string>

#include "llvm/IR/Type.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/DerivedTypes.h"

namespace cocl {

// llvm::Type *cloneStructTypeNoPointers(llvm::StructType *inType);
// void declareStructNoPointers(std::string name, llvm::StructType *type);

// std::string writeStructCopyCodeNoPointers(llvm::StructType *structType, std::string srcName, std::string destName);
// llvm::Instruction *copyStructValuesNoPointers(llvm::Instruction *lastInst, llvm::Value *src, llvm::Value *dst);

// std::string dumpTypeNoPointers(llvm::Type *type);
// std::string dumpStructTypeNoPointers(llvm::StructType *type);

class PointerInfo {
public:
    PointerInfo(int offset, llvm::Type *type, std::vector<int> indices, std::string path) :
        offset(offset), type(type), indices(indices), path(path) {
    }
    int offset;
    llvm::Type *type;
    std::vector<int> indices;
    std::string path;
};

class StructInfo {
public:
    std::vector<std::unique_ptr<PointerInfo> > pointerInfos;
};

class StructCloner {
public:
    StructCloner(cocl::TypeDumper *typeDumper, cocl::GlobalNames *globalNames) :
        typeDumper(typeDumper), globalNames(globalNames) {

    }
    virtual ~StructCloner() {

    }
    // void makePointersGlobal(llvm::StructType *inStructType);
    llvm::StructType *createGlobalizedPointerStruct(std::map<llvm::StructType *, llvm::StructType *> &newByOld, llvm::StructType *inType);
    llvm::StructType *cloneNoPointers(llvm::StructType *inStructType);
    std::string writeClCopyNoPtrToPtrfull(llvm::StructType *ptrfullType, std::string srcName, std::string destName);
    llvm::Instruction *createHostsideIrCopyPtrfullToNoptr(
        llvm::Instruction *lastInst, llvm::StructType *ptrfullType,
        llvm::Value *src, llvm::Value *dest);
    static void walkType(
        llvm::Module *M, StructInfo *structInfo, int level, int offset, std::vector<int> indices,
        std::string path, llvm::Type *type);
    static void walkStructType(
        llvm::Module *M, StructInfo *structInfo, int level, int offset, std::vector<int> indices,
        std::string path, llvm::StructType *type);

protected:
    cocl::TypeDumper *typeDumper;
    cocl::GlobalNames *globalNames;
    std::map<llvm::StructType *, llvm::StructType *> pointerlessTypeByOriginalType;
};

} // namespace cocl
