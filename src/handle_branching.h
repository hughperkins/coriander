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

// this si going to try to convert branch instructions into `if`s and stuff
// input: not sure :-P
// output: ditto :-P

#include "flowcontrolinstructions.h"

#include "llvm/IR/Function.h"

// namespace llvm {
//     class Function;
// }

namespace cocl {
    void eraseBlock(flowcontrol::Block *block);
    std::string handle_branching_simplify(llvm::Function *F);
    std::unique_ptr<flowcontrol::RootBlock> load_branching_tree(llvm::Function *F);
    // void run_branching_transforms(flowcontrol::RootBlock *root);
    std::string branching_write_cl(flowcontrol::RootBlock *root);

    extern std::vector<std::unique_ptr<flowcontrol::Block> > blocks;
}
