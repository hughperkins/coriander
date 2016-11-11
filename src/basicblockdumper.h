#pragma once

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"

#include <map>
#include <set>

namespace cocl {

class BasicBlockDumper {
public:
    BasicBlockDumper(llvm::BasicBlock *block) : 
        block(block) {

    }
    std::string toCl();
    void storeValueName(llvm::Value *value);
    std::string dumpOperand(llvm::Value *value);
    std::string dumpReturn(llvm::ReturnInst *retInst);
    std::string dumpInstruction(std::string indent, llvm::Instruction *instruction);

    llvm::BasicBlock *block;
    // const std::map<llvm::Value *, std::string> &existingNameByValue;
    std::map<llvm::Value *, std::string> neededPrivateNameByValue;
    std::map<llvm::Value *, std::string> neededGlobalNameByValue;
    std::map<llvm::Value *, std::string> neededLocalNameByValue;
    std::set<llvm::Function *> neededFunctionCalls;

    std::map<llvm::Value *, std::string> exprByValue;

    int nextNameIdx = 1;
};

} // namespace cocl
