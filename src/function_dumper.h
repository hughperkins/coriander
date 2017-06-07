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
#include "LocalValueInfo.h"
#include "new_instruction_dumper.h"
#include "shims.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Type.h"

#include <string>
#include <set>
#include <map>
#include <sstream>
#include <iostream>

namespace cocl {

class FunctionDumper {
public:
    FunctionDumper(
                llvm::Module *M,
                llvm::Function *F, std::string shortName, bool isKernel, int kernelNumUniqueClmems, std::vector<int> &kernelClmemIndexByArgIndex,
                GlobalNames *globalNames, TypeDumper *typeDumper,
                FunctionNamesMap *functionNamesMap,
                bool offsets_32bit) :
                // std::map<std::string, std::string> *shortFnNameByOrigName) :
            M(M),
            F(F),
            shortName(shortName),
            isKernel(isKernel),
            kernelNumUniqueClmems(kernelNumUniqueClmems),
            kernelClmemIndexByArgIndex(kernelClmemIndexByArgIndex),
            globalNames(globalNames),
            typeDumper(typeDumper),
            structCloner(typeDumper, globalNames),
            functionNamesMap(functionNamesMap),
            offsets_32bit(offsets_32bit) {
            // shortFnNameByOrigName(shortFnNameByOrigName) {
        // block_it = F->begin();
        // std::cout << "functiondumper, numuniqueclmems " << this->kernelNumUniqueClmems << std::endl;
        instructionDumper.reset(new NewInstructionDumper(
            M,
            globalNames,
            &localNames,
            typeDumper,
            functionNamesMap,

            &shims,
            &neededFunctions,

            &globalExpressionByValue,
            &localValueInfos
            // shortFnNameByOrigName
        ));
        // if(F->getParent() == 0) {
        //     std::cout << "FunctionDumper constr() F->getParent is 0 func " << shortName << std::endl;
        //     throw std::runtime_error("FunctionDumper constr() F->getParent is 0 " + shortName);
        // }
    }
    virtual ~FunctionDumper() {
        instructionDumper.release();
    }

    bool runGeneration(const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);
    void toCl(std::ostream &os);
    bool generationDone();

    std::string getOffsetType();
    std::string createOffsetDeclaration(std::string argName);
    std::string createOffsetShim(llvm::Type *argType, std::string argName, int clmemIndex);
    std::string dumpKernelFunctionDeclarationWithoutReturn(llvm::Function *F);
    std::string dumpInternalFunctionDeclarationWithoutReturn(llvm::Function *F);
    std::string dumpFunctionDeclarationWithoutReturn(llvm::Function *F);
    void generateBlockIndex();

    void addPHIDeclaration(llvm::PHINode *phi);
    std::string dumpPhi(std::string indent, llvm::BranchInst *branchInstr, llvm::BasicBlock *nextBlock);
    std::string dumpBranch(llvm::BranchInst *instr);
    std::string dumpReturn(llvm::Type **pReturnType, llvm::ReturnInst *retInst);
    std::string dumpTerminator(llvm::Type **pReturnType, llvm::Instruction *terminator);
    std::vector<std::string> dumpSharedDefinition(llvm::Value *value);
    std::string dumpSharedDefinitions(std::string indent);
    std::string getDeclaration();
    void writeDeclarations(std::string indent, std::ostream &os);

    FunctionDumper *addIRToCl() {
        _addIRToCl = true;
        return this;
    }

    // std::set<std::string> shimFunctionsNeeded; // for __shfldown_3 etc, that we provide as opencl directly
    cocl::Shims shims;
    std::set<llvm::Function *> neededFunctions;
    std::set<llvm::StructType *> structsToDefine;
    std::map<llvm::Value *, std::string> globalExpressionByValue;
    std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > localValueInfos;

    std::map<std::string, std::string> phiDeclarationsByName;

    std::string shimCode = "";
    std::string functionDeclaration;
    std::string functionDeclarations = "";

    llvm::Type *returnType = 0;
    bool usesVmem = false;
    bool usesScratch = false;

protected:
    // llvm::Function::iterator block_it;

    bool _generationDone = false;
    std::ostringstream ouros;
    std::string declaration;

    llvm::Module *M;
    llvm::Function *F;
    std::string shortName;
    bool isKernel = false;
    int kernelNumUniqueClmems;
    std::vector<int> &kernelClmemIndexByArgIndex;
    bool _addIRToCl = false;
    std::map<llvm::BasicBlock *, int> functionBlockIndex;

    GlobalNames *globalNames;
    LocalNames localNames;
    TypeDumper *typeDumper;
    StructCloner structCloner;
    const FunctionNamesMap *functionNamesMap;
    bool offsets_32bit;
    // std::map<std::string, std::string> *shortFnNameByOrigName;

    std::unique_ptr<NewInstructionDumper> instructionDumper;
};

} // namespace cocl
