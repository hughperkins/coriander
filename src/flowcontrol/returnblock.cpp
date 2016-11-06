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

ReturnBlock::ReturnBlock() {
    gotoFree = true;
}
int ReturnBlock::getNumChildren() {
    return 0;
}
Block *ReturnBlock::getChild(int idx) {
    throw runtime_error("illegal request");
}
std::string ReturnBlock::generateCl(std::string indent, bool noLabel) {
    dumped = true;
    string gencode = "";
    gencode += dumpInstruction(indent, retInst);
    return gencode;
}
void ReturnBlock::walk(std::function<void(Block *block)> fn) {
    fn(this);
}
string ReturnBlock::blockType() const {
    return "ReturnBlock";
}
void ReturnBlock::dump(set<const Block *> &seen, string indent) const {
    cout << indent << "ReturnBlock " << this->id << endl;
}
void ReturnBlock::replaceSuccessor(Block *oldChild, Block *newChild) {
    throw runtime_error("couldnt find old child");
}
void ReturnBlock::replaceChildOrSuccessor(Block *oldChild, Block *newChild) {
    throw runtime_error("couldnt find old child");
}
int ReturnBlock::numSuccessors() {
    return 0;
}
Block *ReturnBlock::getSuccessor(int idx) {
    throw runtime_error("illegal request");
}

} // flowcontrol
} // cocl
