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

using namespace llvm;
using namespace std;

namespace cocl {
namespace flowcontrol {

std::string BasicBlockBlock::generateCl(std::string indent, bool noLabel) {
    dumped = true;
    string gencode = "";
    if(needsLabel && !noLabel) {
        gencode += "\n";
        gencode += indent + getLabel() + ":;\n";
    }
    for(auto it=instructions.begin(); it != instructions.end(); it++) {
        Instruction *inst = *it;
        gencode += dumpInstruction(indent, inst);
    }
    // phis...
    for(auto it=migratedIntoOutgoingPhis.begin(); it != migratedIntoOutgoingPhis.end(); it++) {
        PHINode *phi = it->first;
        Value *value = it->second;
        copyAddressSpace(value, phi);
        gencode += dumpOperand((PHINode *)phi) + " = " + dumpOperand(value) + ";\n";
        addPHIDeclaration(phi);
    }
    if(next != 0) {
        if(!next->dumped) {
            gencode += next->generateCl(indent);
        } else {
            gencode += indent + "goto " + next->getLabel() + ";\n";
        }
    }
    return gencode;
}
void BasicBlockBlock::walk(std::function<void(Block *block)> fn) {
    fn(this);
    if(next != 0) {
        next->walk(fn);
    }
}
std::string BasicBlockBlock::getLabel() const {
    return "label" + toString(id);
}
string BasicBlockBlock::blockType() const {
    return "BasicBlockBlock";
}
void BasicBlockBlock::dump(set<const Block *> &seen, string indent) const {
    seen.insert(this);
    cout << indent << "BasicBlockBlock " << this->id << endl;
    if(next == 0) {
        return;
    }
    if(seen.find(next) == seen.end()) {
        next->dump(seen, indent);
    } else {
        cout << indent << "(*" << next->id << endl;
    }
}
void BasicBlockBlock::replaceSuccessor(Block *oldChild, Block *newChild) {
    if(next == oldChild) {
        next = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
void BasicBlockBlock::replaceChildOrSuccessor(Block *oldChild, Block *newChild) {
    if(next == oldChild) {
        next = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
int BasicBlockBlock::numSuccessors() {
    int count = 0;
    if(next != 0) {
        count++;
    }
    return count;
}
Block *BasicBlockBlock::getSuccessor(int idx) {
    return next;
}

} // flowcontrol
} // cocl
