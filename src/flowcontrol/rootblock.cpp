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

#include <iostream>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {
namespace flowcontrol {

int RootBlock::getNumChildren() {
    if(first != 0) {
        return 1;
    }
    return 0;
}
Block *RootBlock::getChild(int idx) {
    if(idx == 0 && first != 0) {
        return first;
    }
    throw runtime_error("illegal request");
}
std::string RootBlock::generateCl(std::string indent, bool noLabel) {
    dumped = true;
    string gencode = "";
    gencode += first->generateCl(indent);
    return gencode;
}
void RootBlock::walk(std::function<void(Block *block)> fn) {
    fn(this);
    if(first != 0) {
        first->walk(fn);
    }
}
string RootBlock::blockType() const {
    return "RootBlock";
}
void RootBlock::dump(set<const Block *> &seen, string indent) const {
    seen.insert(this);
    cout << indent << "RootBlock " << this->id << endl;
    if(seen.find(first) == seen.end()) {
        first->dump(seen, indent + "  ");
    }
}
void RootBlock::replaceSuccessor(Block *oldChild, Block *newChild) {
    throw runtime_error("illegal parameters");
}
void RootBlock::replaceChildOrSuccessor(Block *oldChild, Block *newChild) {
    assert(first == oldChild);
    first = newChild;
}
int RootBlock::numSuccessors() {
    return 0;
}
Block *RootBlock::getSuccessor(int idx) {
    throw runtime_error("illegal parameters");
}

} // flowcontrol
} // cocl
