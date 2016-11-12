#pragma once

#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"

#include <string>
#include <map>

namespace cocl {

class TypeDumper {
public:
    std::string dumpType(llvm::Type *type);
    std::string dumpFunctionType(llvm::FunctionType *fn);
    std::string dumpPointerType(llvm::PointerType *ptr);
    std::string dumpIntegerType(llvm::IntegerType *type);
    std::string dumpStructType(llvm::StructType *type);
    std::string dumpAddressSpace(llvm::Type *type);
    std::string dumpArrayType(llvm::ArrayType *type);

    // std::map<llvm::GlobalVariable *, std::string> globalVariablesToDefine;
    std::map<llvm::StructType *, std::string> structsToDefine;
    std::map<llvm::FunctionType *, std::string> functionsToDefine;
};

} // namespace cocl
