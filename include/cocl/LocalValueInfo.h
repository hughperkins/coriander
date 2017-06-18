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

#include "LocalNames.h"
#include "GlobalNames.h"
#include "type_dumper.h"
#include "function_names_map.h"
#include "ClWriter.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"

#include <vector>
#include <string>
#include <memory>

namespace cocl {

// Use-cases:
// - we want to be able to use this value in an expressoin
// - we want to declare a local variable for this value
//    - including as shared memory if necessary
// - we want to know what types this value needs (typedumper will handle this for us)
// - we want to know any functions this value needs
// - we want to know if generaiton has run on this value, and/or if it needs dependencies (and what dependencies perhaps?)
// - we want to be able to assign to a new local variable, and know what the name of that local variable is
class LocalValueInfo {
public:
    LocalValueInfo(llvm::Value *value, std::string name) : value(value), name(name) {

    }
    virtual ~LocalValueInfo(){}
    llvm::Value *const  value;
    const std::string name;  // name of this value, always a single identifier, like "v3"

    std::string expression = ""; // best expression for this value, might be compound, eg "v1 + v2"
    bool expressionValid = false;   // have we assigned some value to expression?

    bool _skip = false;

    bool toBeDeclared = false;  // do we plan on declaring it?

    int addressSpace = 0;
    bool addressSpaceValid = false; // have we assigned the address space?

    std::vector<std::string> inlineCl;  // eg ["v5 = v3 + v4"].  Note that this should NOT contain any code that consists of:
                                        // this->name + " = " this->getExpr()
                                        // this is already handled by getExpr()
    std::vector<std::string> declarationCl;  // eg ["int v5;"]
    bool needDependencies = false;

    std::unique_ptr<ClWriter> clWriter;
    LocalValueInfo *skip() {
        this->_skip = true;
        return this;
    }
    LocalValueInfo *setAddressSpace(int addressSpace);
    LocalValueInfo *setAddressSpaceFrom(llvm::Value *source);
    LocalValueInfo *setAddressSpaceFrom(LocalValueInfo *sourceInfo);
    LocalValueInfo *setExpression(std::string expression);
    bool hasExpr() { return expressionValid; }
    std::string getExpr();
    LocalValueInfo *setAsAssigned();
    virtual void writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os);  // if we set this as to be assigned, this will write something, otherwise it wont
    virtual void writeInlineCl(std::string indent, std::ostream &os); // writes any cl required, eg if we toggled setAsAssigned, we need to do the assignment
                                          // some instructoins will *always* write something, eg stores

    static LocalValueInfo *getOrCreate(cocl::LocalNames *localNames, std::map<llvm::Value *, std::unique_ptr< LocalValueInfo> > *localValueInfos, llvm::Value *value, std::string suggestedName="");
};

} // namespace cocl
