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

// implementation of the idea from section 2 of "Emscrypten: an LLVM-to-JavaScript Compiler", by Alon Zakai, 2013

// the paper describes more advanced optimiztaions than this, but at least this should get us code that compiles
// and runs ok on hd5500. hopefully.  we can make it faster later

#pragma once

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"

#include <string>
#include <map>


namespace cocl {

class BranchesAsSwitch {
public:
    BranchesAsSwitch(llvm::Function *F) {
        this->F = F;
    }
    void parse();
    std::string writeAsCl();
    llvm::Function *F;
    std::map<int, llvm::BasicBlock *>blockById;
    std::map<llvm::BasicBlock *, int>idByBlock;
    std::string writeNonFlowInstructions(int indentLevel, llvm::BasicBlock *block);
};

} // namespace coclq
