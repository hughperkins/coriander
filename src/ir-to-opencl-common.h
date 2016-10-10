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

#include <string>
#include <sstream>

// #include "llvm/IR/Instructions.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"

std::string getDeclarationsToWrite();

std::string dumpType(llvm::Type *type);
std::string dumpFunctionType(llvm::FunctionType *fn);
std::string dumpPointerType(llvm::PointerType *ptr);
std::string dumpIntegerType(llvm::IntegerType *type);
std::string dumpStructType(llvm::StructType *type);
std::string dumpType(llvm::Type *type);
std::string dumpAddressSpace(llvm::Type *type);

llvm::GlobalVariable *addGlobalVariable(llvm::Module *M, std::string name, std::string value);
llvm::Instruction *addStringInstr(llvm::Module *M, std::string name, std::string value);
llvm::Instruction *addStringInstrExistingGlobal(llvm::Module *M, std::string name);

llvm::Constant *createInt32Constant(llvm::LLVMContext *context, int value);

template<typename T>
std::string toString(T value) {
    std::ostringstream oss;
    oss << value;
    return oss.str();
}
std::string replace(std::string target, char old_char, char new_char);

int readInt32Constant(llvm::Value *value);
float readFloatConstant(llvm::Value *value);

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

// offset: since we're walking a tree, over a base type, what is our offset into
// the base type?
void walkStructType(llvm::Module *M, StructInfo *structInfo, int level, int offset, std::vector<int> indices, std::string path, llvm::StructType *type);
void walkType(llvm::Module *M, StructInfo *structInfo, int level, int offset, std::vector<int> indices, std::string path, llvm::Type *type);
std::string getIndent(int level);

std::string getName(llvm::StructType *type);
std::string getName(llvm::Function *type);
