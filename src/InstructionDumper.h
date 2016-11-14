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

// dumps one single instruction. yay!

#pragma once

#include "LocalNames.h"
#include "GlobalNames.h"
#include "type_dumper.h"
#include "function_names_map.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"

#include <vector>
#include <string>

namespace cocl {

class AllocaInfo {
public:
    llvm::AllocaInst *alloca = 0;
    llvm::Value *refValue = 0;
    std::string definition = "";
    std::string explain = "";
};

class InstructionDumper {
public:
    InstructionDumper(LocalNames *localNames, TypeDumper *typeDumper, FunctionNamesMap *functionNamesMap) :
        localNames(localNames),
        typeDumper(typeDumper),
        functionNamesMap(functionNamesMap) {

    }
    virtual ~InstructionDumper() {}
    std::string dumpInstructionRhs(llvm::Instruction *instruction, std::vector<std::string> *additionalLinesNeeded);
    std::string dumpOperand(llvm::Value *value);

    std::string dumpConstant(llvm::Constant *constant);
    std::string dumpConstantExpr(llvm::ConstantExpr *expr);
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

    std::vector<std::string> dumpInsertValue(llvm::InsertValueInst *instr);
    std::string dumpExtractValue(llvm::ExtractValueInst *instr);
    std::string dumpLoad(llvm::LoadInst *instr);
    std::string dumpStore(llvm::StoreInst *instr);
    void dumpAlloca(llvm::AllocaInst *alloca);
    std::string dumpGetElementPtr(llvm::GetElementPtrInst *instr);
    std::string dumpSelect(llvm::SelectInst *instr);
    std::string dumpMemcpyCharCharLong(llvm::CallInst *instr);
    std::string dumpCall(llvm::CallInst *instr);

    std::vector<std::string> generatedCl;
    std::vector<AllocaInfo> allocaDeclarations;
    std::set<llvm::Value *> variablesToDeclare;
    std::set<llvm::Value *> sharedVariablesToDeclare;
    std::set<std::string> shimFunctionsNeeded; // for __shfldown_3 etc, that we provide as opencl directly
    std::set<llvm::Function *> neededFunctions;

    std::map<llvm::Value *, std::string>globalExpressionByValue;
    std::map<llvm::Value *, std::string>localExpressionByValue;

    cocl::LocalNames *localNames;
    cocl::TypeDumper *typeDumper;
    cocl::GlobalNames *globalNames;
protected:
    const cocl::FunctionNamesMap *functionNamesMap;
};

} // namespace cocl
