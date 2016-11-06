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

int Sequence::getNumChildren() const {
    return children.size();
}
Block *Sequence::getChild(int idx) {
    if(idx < children.size()) {
        return children[idx];
    }
    throw runtime_error("illegal request");
}
std::string Sequence::generateCl(std::string indent, bool noLabel) {
    dumped = true;
    string gencode = "";
    for(auto it=children.begin(); it != children.end(); it++) {
        Block *child = *it;
        gencode += child->generateCl(indent);
    }
    if(next != 0) {
        gencode += next->generateCl(indent);
    }
    return gencode;
}
void Sequence::walk(std::function<void(Block *block)> fn) {
    fn(this);
    for(auto it=children.begin(); it != children.end(); it++) {
        Block *child = *it;
        child->walk(fn);
    }
    if(next != 0) {
        next->walk(fn);
    }
}
string Sequence::blockType() const {
    return "Sequence";
}
void Sequence::dump(set<const Block *> &seen, string indent) const {
    seen.insert(this);
    cout << indent << "Sequence " << this->id << gotoFreeString() << " succ=" << numSuccessors() << " inc=" << incoming.size() << isExitString() << uncontainedJumpsString() << endl;
    for(auto it = children.begin(); it != children.end(); it++) {
        Block *child = *it;
        if(seen.find(child) == seen.end()) {
            child->dump(seen, indent + "  ");
        } else {
            cout << indent << "  (*" << child->id << endl;
        }
    }
    if(next != 0) {
        if(seen.find(next) == seen.end()) {
            next->dump(seen, indent + "");
        } else {
            cout << indent << "(*" << next->id << endl;
        }
    }
}
void Sequence::replaceSuccessor(Block *oldChild, Block *newChild) {
    // int i = 0;
    if(next == oldChild) {
        next = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
void Sequence::replaceChildOrSuccessor(Block *oldChild, Block *newChild) {
    if(next == oldChild) {
        next = newChild;
        return;
    }
    int i = 0;
    bool foundChild = false;
    for(auto it = children.begin(); it != children.end(); it++) {
        Block *child = *it;
        if(child == oldChild) {
            foundChild = true;
            break;
        }
        i++;
    }
    if(foundChild) {
        children[i] = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
int Sequence::numSuccessors() const {
    int count = 0;
    if(next != 0) {
        count++;
    }
    return count;
}
Block *Sequence::getSuccessor(int idx) {
    return next;
}

} // flowcontrol
} // cocl
