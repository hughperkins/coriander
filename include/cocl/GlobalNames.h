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

#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Type.h"

#include <map>
#include <string>

namespace cocl {

class GlobalNames {
public:
    std::string getName(llvm::Value *value);
    std::string getOrCreateName(llvm::Value *value, std::string proposedName="");
    bool hasName(llvm::Value *value);
    llvm::Value *getValueByName(std::string name);

    bool hasName(std::string name);

    std::string getName(llvm::Type *type);
    std::string getOrCreateName(llvm::Type *type, std::string proposedName="");
    bool hasName(llvm::Type *type);

protected:
    std::string createName(llvm::Type *type, std::string name);
    std::string createName(llvm::Value *value, std::string name);
    bool isNameAvailable(std::string name);

    std::map<llvm::Value *, std::string> nameByValue;
    std::map<std::string, llvm::Value *> valueByName;

    std::map<llvm::Type *, std::string> nameByType;
    std::map<std::string, llvm::Type *> typeByName;

    int nextIndex = 1;
};

} // namespace cocl
