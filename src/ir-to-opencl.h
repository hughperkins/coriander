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

#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Function.h"

#include <string>
#include <vector>

// std::string dumpInstruction(std::string indent, llvm::Instruction *instruction);
// std::string dumpOperand(llvm::Value *value);
// std::string dumpChainedInstruction(int level, llvm::Instruction * instr);
// void updateAddressSpace(llvm::Value *value, int newSpace);
// void copyAddressSpace(llvm::Value *src, llvm::Value *dest);
// std::string getName(llvm::Value *value);
// std::string getName(llvm::StructType *value);
// std::string getName(llvm::Function *value);
// void addPHIDeclaration(llvm::PHINode *phi);
// std::string dumpValue(llvm::Value *value);
// std::string dumpReturn(llvm::ReturnInst *retInst);
// std::string dumpPhi(llvm::BranchInst *branchInstr, llvm::BasicBlock *nextBlock);
// std::string convertLlStringToCl(std::string llString, std::string specificFunction);

std::string convertModuleToCl(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, llvm::Module *M, std::string specificFunction);
std::string convertLlStringToCl(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, std::string llString, std::string specificFunction);
void convertLlFileToClFile(std::string llFilename, std::string ClFilename, std::string specificFunction);
