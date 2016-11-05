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

#include "flowcontrolinstructions.h"
#include "ir-to-opencl.h"
#include "util.h"

#include <iostream>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {
namespace flowcontrol {

Block::Block() {
    this->id = getNextId();
    incNextId();
}
string Block::blockType() const {
    return "Block";
}
void Block::replaceIncoming(Block *oldIncoming, Block *newIncoming) {
    int id = 0;
    bool found = false;
    for(auto it=incoming.begin(); it != incoming.end(); it++) {
        Block *block = *it;
        if(block == oldIncoming) {
            found = true;
            break;
        }
        id++;
    }
    if(found) {
        incoming[id] = newIncoming;
        return;
    }
    throw runtime_error("illegal parameters");
}
void Block::removeIncoming(Block *targetIncoming) {
    int id = 0;
    bool found = false;
    for(auto it=incoming.begin(); it != incoming.end(); it++) {
        Block *block = *it;
        if(block == targetIncoming) {
            found = true;
            break;
        }
        id++;
    }
    if(found) {
        incoming.erase(incoming.begin() + id);
        return;
    }
    throw runtime_error("illegal parameters");
}
std::string Block::getLabel() const {
        return "label" + toString(id);
}

} // flowcontrol
} // cocl
