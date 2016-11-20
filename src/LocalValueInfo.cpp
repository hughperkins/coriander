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

#include "LocalValueInfo.h"
#include "mutations.h"

#include <iostream>
using namespace std;
using namespace llvm;

namespace cocl {

LocalValueInfo *LocalValueInfo::getOrCreate(cocl::LocalNames *localNames, std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > >*localValueInfos, Value *value, string suggestedName) {
    if(localValueInfos->find(value) != localValueInfos->end()) {
        return localValueInfos->at(value).get();
    }
    string name = localNames->getOrCreateName(value, suggestedName);
    unique_ptr<LocalValueInfo >localValueInfo;
    localValueInfo.reset(new LocalValueInfo(value, name));
    (*localValueInfos).insert(std::make_pair(value, std::move(localValueInfo)));
    return localValueInfos->at(value).get();
}

LocalValueInfo *LocalValueInfo::setAddressSpace(int addressSpace) {
    this->addressSpace = addressSpace;
    updateAddressSpace(value, addressSpace);
    addressSpaceValid = true;
    return this;
}

LocalValueInfo *LocalValueInfo::setAddressSpaceFrom(Value *source) {
    int addressSpace = 0;
    if(PointerType *pointerType = dyn_cast<PointerType>(source->getType())) {
        addressSpace = pointerType->getAddressSpace();
        // copyAddressSpace(source, value);
    }
    setAddressSpace(addressSpace);
    return this;
}

LocalValueInfo *LocalValueInfo::setExpression(std::string expression) {
    this->expression = expression;
    expressionValid = true;
    return this;
}

std::string LocalValueInfo::getExpr() {
    if(!expressionValid) {
        throw std::runtime_error("expression not yet assigned, name " + name);
    }
    return expression;
}

LocalValueInfo *LocalValueInfo::setAsAssigned() {
    // implies:
    // - we need to declare it
    // - any expression can directly use the new declared variable
    toBeDeclared = true;
    // this->expression = name;
    return this;
}

void LocalValueInfo::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) {
    for(auto it = declarationCl.begin(); it != declarationCl.end(); it++) {
        os << indent << *it << ";\n";
    }
    if(toBeDeclared) {
        os << indent << typeDumper->dumpType(value->getType()) << " " << name << ";\n";
    }
}

void LocalValueInfo::writeInlineCl(std::string indent, std::ostream &os) {
    for(auto it = inlineCl.begin(); it != inlineCl.end(); it++) {
        os << indent << *it << ";\n";
    }
    if(toBeDeclared) {
        os << indent << this->name << " = " << this->getExpr() << ";\n";
    }
    // expression = name;
}

} // namespace cocl;
