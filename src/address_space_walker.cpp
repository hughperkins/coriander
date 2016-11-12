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

#include "address_space_walker.h"

#include <iostream>

using llvm;
using cocl;
using std;

namespace cocl {

void AddressSpaceWalker::walkBlock(BasicBlock *block) {
    for(auto it=block->begin; it != block.end(); it++) {

    }
}

void AddressSpaceWalker::walk() {
    for(auto it = F->begin(); it != F->end(); it++) {
        BasicBlock *block = &*it;
        walkBlock(block);
    }
}

} // namespace cocl
