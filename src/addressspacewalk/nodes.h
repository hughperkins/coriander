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

#include <set>

namespace llvm {
class Type;
class Value;
class Function;
class BasicBlock;
class Module;
}

namespace cocl {
namespace addressspacewalk {

class CoclValue {
public:
    CoclValue(int globalId) : globalId(globalId) {}

    // std::set<CoclValue *> uses;
    // std::set<CoclValue *> usedBy;
    // std::

    llvm::Type *type = nullptr;

    // back pointers:
    llvm::Value *value = nullptr;
    llvm::BasicBlock *block = nullptr;
    llvm::Function *function = nullptr;
    llvm::Module *module = nullptr;

    const int globalId;

    int addressSpace = -1;  // -1 means, not yet deduced
};

}
}
