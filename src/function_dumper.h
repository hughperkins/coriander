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
#include "function_names_map.h"
#include "type_dumper.h"
#include "struct_clone.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Type.h"

#include <string>
#include <set>
#include <map>

namespace cocl {

class FunctionDumper {
public:
    FunctionDumper(llvm::Function *F, bool isKernel, GlobalNames *globalNames, TypeDumper *typeDumper,
        FunctionNamesMap *functionNamesMap) :
            F(F),
            isKernel(isKernel),
            globalNames(globalNames),
            typeDumper(typeDumper),
            structCloner(typeDumper, globalNames),
            functionNamesMap(functionNamesMap) {
    }
    virtual ~FunctionDumper() {

    }

    std::string toCl();
    std::string createOffsetDeclaration(std::string argName);
    std::string createOffsetShim(llvm::Type *argType, std::string argName);
    std::string dumpFunctionDeclarationWithoutReturn(llvm::Function *F);

    void addPHIDeclaration(llvm::PHINode *phi);
    std::string dumpPhi(llvm::BranchInst *branchInstr, llvm::BasicBlock *nextBlock);
    std::string dumpBranch(llvm::BranchInst *instr, std::map<llvm::Value *, std::string> &exprByValue);
    std::string dumpReturn(llvm::Type **pReturnType, llvm::ReturnInst *retInst, std::map<llvm::Value *, std::string> &exprByValue);

    std::set<llvm::Function *> neededFunctions;
    std::set<llvm::StructType *> structsToDefine;
    std::string shimCode = "";
    std::string functionDeclarations = "";
    std::map<llvm::Value *, std::string> exprByValue;
    std::map<std::string, std::string> phiDeclarationsByName;

protected:
    llvm::Function *F;
    bool isKernel = false;
    bool _addIRToCl = false;
    std::map<llvm::BasicBlock *, int> functionBlockIndex;

    std::set<llvm::Value *> variablesToDeclare;
    std::set<llvm::Value *> sharedVariablesToDeclare;
    std::set<std::string> allocaDeclarations;

    FunctionDumper *addIRToCl() {
        _addIRToCl = true;
        return this;
    }

    GlobalNames *globalNames;
    LocalNames localNames;
    TypeDumper *typeDumper;
    StructCloner structCloner;
    const FunctionNamesMap *functionNamesMap;
};

} // namespace cocl
