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
#include "LocalValueInfo.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"

#include <vector>
#include <string>
#include <memory>

namespace cocl {

class AllocaInfo final {
public:
    llvm::AllocaInst *alloca = 0;
    llvm::Value *refValue = 0;
    std::string definition = "";
    std::string explain = "";
};

class InstructionDumper {
public:
    InstructionDumper(
            GlobalNames *globalNames, LocalNames *localNames, TypeDumper *typeDumper, const FunctionNamesMap *functionNamesMap,

            std::set<std::string> *shimFunctionsNeeded,
            std::set<llvm::Function *> *neededFunctions,

            std::map<llvm::Value *, std::string> *globalExpressionByValue,
            std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos,
            std::vector<AllocaInfo> *allocaDeclarations
            );
    virtual ~InstructionDumper();

    // std::string dumpInstructionRhs(llvm::Instruction *instruction, std::vector<std::string> *additionalLinesNeeded);
    void runRhsGeneration(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);
    std::string dumpOperand(llvm::Value *value);
    void dumpConstant(std::ostream &oss, llvm::Constant *constant);

    // void dumpConstant(std::ostream &os, llvm::Constant *constant);
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

    std::string dumpInsertValue(llvm::InsertValueInst *instr, std::vector<std::string> *extralines);
    std::string dumpExtractValue(llvm::ExtractValueInst *instr);
    std::string dumpLoad(llvm::LoadInst *instr);
    std::string dumpStore(llvm::StoreInst *instr);
    void dumpAlloca(LocalValueInfo *localValueInfo);
    std::string dumpGetElementPtr(llvm::GetElementPtrInst *instr);
    std::string dumpSelect(llvm::SelectInst *instr);
    std::string dumpMemcpyCharCharLong(llvm::CallInst *instr);
    std::string dumpCall(llvm::CallInst *instr, const std::set< llvm::Function *> &dumpedFunctions, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    // std::vector<std::string> generatedCl;

    cocl::GlobalNames *globalNames = 0;
    cocl::LocalNames *localNames = 0;   // these are names for instructions etc, doesnt say anything about whether they've been declared
                                        // they're always some single idnetifier, eg "v3", never compound, ie never "v1 + v3"
    cocl::TypeDumper *typeDumper = 0;
    const cocl::FunctionNamesMap *functionNamesMap = 0;

    std::set<std::string> *shimFunctionsNeeded = 0; // for __shfldown_3 etc, that we provide as opencl directly
    std::set<llvm::Function *> *neededFunctions = 0;

    std::map<llvm::Value *, std::string> *globalExpressionByValue = 0;
    std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos = 0;
    std::vector<AllocaInfo> *allocaDeclarations = 0;

    bool needDependencies = false;

    // std::string lastExpression;

    bool forceSingle = true;
};

} // namespace cocl
