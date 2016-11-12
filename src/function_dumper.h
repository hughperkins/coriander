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

namespace cocl {

class FunctionDumper {
public:
    FunctionDumper(llvm::Function *F) :
        F(F) {

    }
    virtual ~FunctionDumper() {

    }

protected:
    llvm::Function *F;
    bool _addIRToCl = false;

    std::set<llvm::Function *> neededFunctionCalls;
    std::map<llvm::Value *, std::string> exprByValue;
    std::set<llvm::Value *> variablesToDeclare;
    std::set<llvm::Value *> sharedVariablesToDeclare;
    std::set<std::string> allocaDeclarations;

    FunctionDumper *addIRToCl() {
        _addIRToCl = true;
        return this;
    }

    GlobalNames *globalNames;
    LocalNames *localNames;
    TypeDumper *typeDumper;
};

} // namespace cocl
