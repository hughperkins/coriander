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

int If::getNumChildren() const {
    int count = 0;
    if(trueBlock != 0) {
        count++;
    }
    if(falseBlock != 0) {
        count++;
    }
    return count;
}
Block *If::getChild(int idx) {
    if(trueBlock != 0) {
        if(idx == 0) {
            return trueBlock;
        } else if(idx == 1 && falseBlock != 0) {
            return falseBlock;
        }
        throw runtime_error("illegal request");
    }
    if(idx == 0 && falseBlock != 0) {
        return falseBlock;
    }
    throw runtime_error("illegal request");
}
std::string If::generateCl(std::string indent, bool noLabel) {
    dumped = true;
    string gencode = "";
    // cout << "condition " << (void *)condition << endl;
    if(invertCondition) {
        gencode += indent + "if(!" + dumpOperand(condition) + ") {\n";
    } else {
        gencode += indent + "if(" + dumpOperand(condition) + ") {\n";
    }
    gencode += trueBlock->generateCl(indent + "    ");
    if(falseBlock != 0) {
        gencode += indent + "} else {\n";
        gencode += falseBlock->generateCl(indent + "    ");
        gencode += indent + "}\n";
    } else {
        gencode += indent + "}\n";
    }
    if(next != 0) {
        gencode += next->generateCl(indent);
    }
    return gencode;
}
void If::walk(std::function<void(Block *block)> fn) {
    fn(this);
    if(trueBlock != 0) {
        trueBlock->walk(fn);
    }
    if(falseBlock != 0) {
        falseBlock->walk(fn);
    }
    if(next != 0) {
        next->walk(fn);
    }
}
string If::blockType() const {
    return "If";
}
void If::dump(set<const Block *> &seen, string indent) const {
    seen.insert(this);
    cout << indent << "If " << this->id << gotoFreeString() << isExitString() << endl;
    cout << indent << "  True:" << endl;
    if(seen.find(trueBlock) == seen.end()) {
        trueBlock->dump(seen, indent + "    ");
    } else {
        cout << indent << "    (*" << trueBlock->id << endl;
    }
    if(falseBlock != 0) {
        cout << indent << "  False:" << endl;
        if(seen.find(falseBlock) == seen.end()) {
            falseBlock->dump(seen, indent + "    ");
        } else {
            cout << indent << "    (*" << falseBlock->id << endl;
        }
    }
    if(next != 0) {
        if(seen.find(next) == seen.end()) {
            next->dump(seen, indent);
        } else {
            cout << "(*" << next->id << endl;
        }
    }
}
void If::replaceSuccessor(Block *oldChild, Block *newChild) {
    if(next == oldChild) {
        next = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
void If::replaceChildOrSuccessor(Block *oldChild, Block *newChild) {
    if(next == oldChild) {
        next = newChild;
        return;
    }
    if(trueBlock == oldChild) {
        trueBlock = newChild;
        return;
    }
    if(falseBlock == oldChild) {
        falseBlock = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
int If::numSuccessors() const {
    if(next != 0) {
        return 1;
    }
    return 0;
}
Block *If::getSuccessor(int idx) {
    return next;
}

} // flowcontrol
} // cocl
