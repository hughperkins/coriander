#pragma once

#include <string>
#include <cstdint>

#include "llvm/IR/Constants.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Value.h"


uint64_t readIntConstant_uint64(llvm::ConstantInt *constant);
uint32_t readIntConstant_uint32(llvm::ConstantInt *constant);
std::string getName(llvm::StructType *type);
std::string getName(llvm::Function *type);
std::string getName(llvm::Value *value);
int readInt32Constant(llvm::Value *value);
float readFloatConstant(llvm::Value *value);
