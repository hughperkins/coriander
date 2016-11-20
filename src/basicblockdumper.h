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
#include "function_names_map.h"
#include "new_instruction_dumper.h"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"

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
            TypeDumper *typeDumper, const FunctionNamesMap *functionNamesMap) :
        block(block),
        globalNames(globalNames),
        localNames(localNames),
        typeDumper(typeDumper),
        functionNamesMap(functionNamesMap)
             {
        instructionDumper.reset(
            new NewInstructionDumper(globalNames, localNames, typeDumper, functionNamesMap,
            &shimFunctionsNeeded, &neededFunctions,
            &globalExpressionByValue, &localValueInfos));
        instruction_it = block->begin();
    }
    bool runGeneration(const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);
    void toCl(std::ostream &os);
    // void storeValueName(llvm::Value *value);
    std::string dumpChainedInstruction(int level, llvm::Instruction * instr, bool ignoreCasts=false);
    // bool dumpInstruction(llvm::Instruction *instruction, const std::set< llvm::Function *> &dumpedFunctions, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    std::string getAllocaDeclarations(std::string indent);
    std::string writeDeclarations(std::string indent);
    void writeDeclaration(std::ostream &os, llvm::Value *value);

    BasicBlockDumper *addIRToCl(bool set=true) {
        _addIRToCl = set;
        return this;
    }

    std::set<std::string> shimFunctionsNeeded; // for __shfldown_3 etc, that we provide as opencl directly
    std::set<llvm::Function *> neededFunctions;
    // std::set<llvm::Value *> variablesToDeclare;
    // std::set<llvm::Value *> sharedVariablesToDeclare;
    std::map<llvm::Value *, std::string> globalExpressionByValue;
    std::map<llvm::Value *, std::unique_ptr<cocl::LocalValueInfo> > localValueInfos;
    // std::vector<AllocaInfo> allocaDeclarations;
    // std::map<llvm::Value *, std::string> localExpressionByValue;
    // std::vector<std::string> clcode;

    int maxInstructionsToGenerate = -1; // -1 means no limit, 0 will cause runGeneration to do nothing; otherwise however many instructions to process
    llvm::BasicBlock::iterator instruction_it;

protected:
    llvm::BasicBlock *block;
    bool _addIRToCl = false;
    bool forceSingle = true;

    GlobalNames *globalNames;
    LocalNames *localNames;
    TypeDumper *typeDumper;
    std::unique_ptr<NewInstructionDumper> instructionDumper;

    const FunctionNamesMap *functionNamesMap;
};

} // namespace cocl
