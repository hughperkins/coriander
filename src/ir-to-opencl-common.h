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
