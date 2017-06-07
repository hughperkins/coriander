// Copyright Hugh Perkins 2016, 2017

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

#include "LocalValueInfo.h"
#include "InstructionDumper.h"
#include "shims.h"

#include <string>
#include <stdexcept>

namespace cocl {

class NeedValueDependencyException : public std::exception {
public:
    NeedValueDependencyException(llvm::Value *value) : value(value) {
    }
    virtual const char* what() const throw()
    {
        value->dump();
        return "Need dependent value";
    }
    llvm::Value *value;
};

class NewInstructionDumper {
public:
    NewInstructionDumper(
        llvm::Module *M,
        GlobalNames *globalNames,
        LocalNames *localNames,
        TypeDumper *typeDumper,
        const FunctionNamesMap *functionNamesMap,

        // std::set<std::string> *shimFunctionsNeeded,
        cocl::Shims *shims,
        std::set<llvm::Function *> *neededFunctions,

        std::map<llvm::Value *, std::string> *globalExpressionByValue,
        std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos
    );

    void dumpIcmp(LocalValueInfo *localValueInfo);
    void dumpFcmp(LocalValueInfo *localValueInfo);

    void dumpExt(LocalValueInfo *localValueInfo);
    void dumpTrunc(LocalValueInfo *localValueInfo);
    void dumpBitCast(LocalValueInfo *localValueInfo);
    void dumpAddrSpaceCast(LocalValueInfo *localValueInfo);
    void dumpBinaryOperator(LocalValueInfo *localValueInfo, std::string opstring);

    void dumpSelect(LocalValueInfo *localValueInfo);
    void dumpGetElementPtr(cocl::LocalValueInfo *localValueInfo);
    void dumpAlloca(cocl::LocalValueInfo *localValueInfo);
    void dumpLoad(cocl::LocalValueInfo *localValueInfo);
    void dumpStore(cocl::LocalValueInfo *localValueInfo);
    void dumpInsertValue(cocl::LocalValueInfo *localValueInfo);
    void dumpExtractValue(cocl::LocalValueInfo *localValueInfo);

    LocalValueInfo *getOperand(llvm::Value *op);
    LocalValueInfo *dumpConstant(llvm::Constant *constant);
    void dumpConstantExpr(LocalValueInfo *localValueInfo);
    void dumpMemcpy(LocalValueInfo *localValueInfo, int align);
    void writeShimCall(LocalValueInfo *localValueInfo, std::string shimName, std::string extraArgs, llvm::CallInst *instr);
    void dumpCall(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    void runGeneration(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    NewInstructionDumper *addIRToCl(bool set=true) {
        _addIRToCl = set;
        return this;
    }

    llvm::Module *M = 0;

    cocl::GlobalNames *globalNames = 0;
    cocl::LocalNames *localNames = 0;   // these are names for instructions etc, doesnt say anything about whether they've been declared
                                        // they're always some single idnetifier, eg "v3", never compound, ie never "v1 + v3"
    cocl::TypeDumper *typeDumper = 0;
    const cocl::FunctionNamesMap *functionNamesMap = 0;

    // std::set<std::string> *shimFunctionsNeeded = 0; // for __shfldown_3 etc, that we provide as opencl directly
    cocl::Shims *shims = 0;
    std::set<llvm::Function *> *neededFunctions = 0;

    std::map<llvm::Value *, std::string> *globalExpressionByValue = 0;
    std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos = 0;

    bool forceSingle = true;
    bool _addIRToCl = false;
    bool checkCalledFunctionsDefined = true;
    bool usesVmem = false;
    bool usesScratch = false;
};

} // namespace cocl
