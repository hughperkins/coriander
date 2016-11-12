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

#include "GlobalNames.h"
#include "LocalNames.h"
#include "type_dumper.h"
#include "ExpressionsHelper.h"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"

#include <map>
#include <set>

namespace cocl {

class BasicBlockDumper {
public:
    // will block all non-controlflow instructions, meaning:
    // - ignores branches
    // - ignores returns
    // - ignores phis
    BasicBlockDumper(llvm::BasicBlock *block, GlobalNames *globalNames, LocalNames *localNames,
            TypeDumper *typeDumper) :
        block(block),
        globalNames(globalNames),
        localNames(localNames),
        typeDumper(typeDumper) {

    }
    std::string toCl();
    // void storeValueName(llvm::Value *value);
    std::string dumpConstant(llvm::Constant *constant);

    std::string dumpBinaryOperator(llvm::BinaryOperator *instr, std::string opstring);
    std::string dumpIcmp(llvm::ICmpInst *instr);
    std::string dumpFcmp(llvm::FCmpInst *instr);

    std::string dumpBitCast(llvm::BitCastInst *instr);
    std::string dumpAddrSpaceCast(llvm::AddrSpaceCastInst *instr);
    std::string dumpFPExt(llvm::CastInst *instr);
    std::string dumpZExt(llvm::CastInst *instr);
    std::string dumpSExt(llvm::CastInst *instr);
    std::string dumpFPToUI(llvm::FPToUIInst *instr);
    std::string dumpFPToSI(llvm::FPToSIInst *instr);
    std::string dumpUIToFP(llvm::UIToFPInst *instr);
    std::string dumpSIToFP(llvm::SIToFPInst *instr);
    std::string dumpFPTrunc(llvm::CastInst *instr);
    std::string dumpTrunc(llvm::CastInst *instr);

    std::string dumpOperand(llvm::Value *value);
    std::string dumpReturn(llvm::ReturnInst *retInst);
    std::string dumpInstruction(std::string indent, llvm::Instruction *instruction);
    std::vector<std::string> dumpInsertValue(llvm::InsertValueInst *instr);
    std::string dumpExtractValue(llvm::ExtractValueInst *instr);
    std::string dumpLoad(llvm::LoadInst *instr);
    std::string dumpStore(llvm::StoreInst *instr);
    std::string dumpAlloca(llvm::Instruction *alloca);
    std::string dumpGetElementPtr(llvm::GetElementPtrInst *instr);
    std::string dumpSelect(llvm::SelectInst *instr);

    std::string getAllocaDeclarations(std::string indent);
    std::string writeDeclarations(std::string indent);

    BasicBlockDumper *addIRToCl() {
        _addIRToCl = true;
        return this;
    }

protected:
    llvm::BasicBlock *block;
    bool _addIRToCl = false;

    // const std::map<llvm::Value *, std::string> &existingNameByValue;
    // std::map<llvm::Value *, std::string> neededPrivateNameByValue;
    // std::map<llvm::Value *, std::string> neededGlobalNameByValue;
    // std::map<llvm::Value *, std::string> neededLocalNameByValue;

    std::set<llvm::Function *> neededFunctionCalls;
    std::map<llvm::Value *, std::string> exprByValue;
    std::set<llvm::Value *> variablesToDeclare;
    std::set<llvm::Value *> sharedVariablesToDeclare;
    std::set<std::string> allocaDeclarations;

    GlobalNames *globalNames;
    LocalNames *localNames;
    TypeDumper *typeDumper;
};

} // namespace cocl
