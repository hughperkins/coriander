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

#include "cocl/GlobalNames.h"
#include "cocl/llvm_dump.h"

#include "EasyCL/util/easycl_stringhelper.h"

#include <iostream>
#include <stdexcept>

using namespace std;
using namespace llvm;

namespace cocl {

bool GlobalNames::isNameAvailable(std::string name) {
    return valueByName.find(name) == valueByName.end() &&
        typeByName.find(name) == typeByName.end();
}

// values

std::string GlobalNames::getName(Value *value) {
    auto it = nameByValue.find(value);
    if(it == nameByValue.end()) {
        cout << "this value not found in global name map:" << endl;
        COCL_LLVM_DUMP(value);
        cout << endl;
        throw runtime_error("value not found in global name map");
    }
    return it->second;
}

bool GlobalNames::hasName(std::string name) {
    return valueByName.find(name) != valueByName.end() ||
        typeByName.find(name) != typeByName.end();
}

llvm::Value *GlobalNames::getValueByName(std::string name) {
    return valueByName[name];
}

bool GlobalNames::hasName(Value *value) {
    return nameByValue.find(value) != nameByValue.end();
}

bool GlobalNames::hasName(Type *type) {
    return nameByType.find(type) != nameByType.end();
}

std::string GlobalNames::getOrCreateName(Value *value, std::string proposedName) {
    auto it = nameByValue.find(value);
    if(it != nameByValue.end()) {
        return it->second;
    }
    int indexFromOne = 1;
    int *pindex = &nextIndex;
    if(proposedName != "") {
        if(isNameAvailable(proposedName)) {
            return createName(value, proposedName);
        }
        pindex = &indexFromOne;
    }
    while(true) {
        std::string candidateName = proposedName;
        if(candidateName == "") {
            candidateName = "v";
        }
        candidateName += easycl::toString(*pindex);
        (*pindex)++;
        if(isNameAvailable(candidateName)) {
            return createName(value, candidateName);
        }
    }
}

std::string GlobalNames::createName(Value *value, std::string name) {
    if(!isNameAvailable(name)) {
        throw runtime_error("duplicate name " + name);
    }
    valueByName[name] = value;
    nameByValue[value] = name;
    return name;
}

// types

std::string GlobalNames::getName(Type *type) {
    auto it = nameByType.find(type);
    if(it == nameByType.end()) {
        COCL_LLVM_DUMP(type);
        cout << endl;
        throw runtime_error("type not found in name map");
    }
    return it->second;
}

std::string GlobalNames::getOrCreateName(Type *type, std::string proposedName) {
    auto it = nameByType.find(type);
    if(it != nameByType.end()) {
        return it->second;
    }
    int indexFromOne = 1;
    int *pindex = &nextIndex;
    if(proposedName != "") {
        if(isNameAvailable(proposedName)) {
            return createName(type, proposedName);
        }
        pindex = &indexFromOne;
    }
    while(true) {
        std::string candidateName = proposedName;
        if(candidateName == "") {
            candidateName = "v";
        }
        candidateName += easycl::toString(*pindex);
        (*pindex)++;
        if(isNameAvailable(candidateName)) {
            return createName(type, candidateName);
        }
    }
}

std::string GlobalNames::createName(Type *type, std::string name) {
    if(!isNameAvailable(name)) {
        throw runtime_error("duplicate name " + name);
    }
    typeByName[name] = type;
    nameByType[type] = name;
    return name;
}

} // namespace cocl
