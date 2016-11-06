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

int DoWhile::getNumChildren() const {
    return 1;
}
Block *DoWhile::getChild(int idx) {
    if(idx == 0) {
        return body;
    }
    throw runtime_error("illegal request");
}
std::string DoWhile::generateCl(std::string indent, bool noLabel) {
    dumped = true;
    string gencode = "";
    gencode += indent + "do {\n";
    gencode += body->generateCl(indent + "    ");
    gencode += indent + "} while(" + dumpOperand(condition) + ");\n";
    if(next != 0) {
        gencode += next->generateCl(indent);
    }
    return gencode;
}
void DoWhile::walk(std::function<void(Block *block)> fn) {
    fn(this);
    if(body != 0) {
        body->walk(fn);
    }
    if(next != 0) {
        next->walk(fn);
    }
}
string DoWhile::blockType() const {
    return "DoWhile";
}
int DoWhile::numSuccessors() const {
    if(next != 0) {
        return 1;
    }
    return 0;
}
Block *DoWhile::getSuccessor(int idx) {
    if(idx > 0) {
        throw runtime_error("illegal request");
    }
    return next;
}
void DoWhile::replaceSuccessor(Block *oldChild, Block *newChild) {
    if(next == oldChild) {
        next = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
void DoWhile::replaceChildOrSuccessor(Block *oldChild, Block *newChild) {
    if(body == oldChild) {
        body = newChild;
        return;
    }
    if(next == oldChild) {
        next = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
void DoWhile::dump(set<const Block *> &seen, string indent) const {
    seen.insert(this);
    cout << indent << "DoWhile " << this->id << gotoFreeString() << isExitString() << endl;
    cout << indent << "  Body:" << endl;
    body->dump(seen, indent + "    ");
    if(next != 0) {
        if(seen.find(next) == seen.end()) {
            next->dump(seen, indent);
        } else {
            cout << "(*" << next->id << endl;
        }
    }
}

} // flowcontrol
} // cocl
