#pragma once

#include <string>

#include "llvm/IR/Type.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/DerivedTypes.h"


llvm::Type *cloneStructTypeNoPointers(llvm::StructType *inType);

llvm::Instruction *copyStructValuesNoPointers(llvm::Instruction *lastInst, llvm::Value *src, llvm::Value *dst);

void declareStructNoPointers(std::string name, llvm::StructType *type);

std::string dumpStructTypeNoPointers(llvm::StructType *type);
std::string dumpTypeNoPointers(llvm::Type *type);
