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

using namespace llvm;
using namespace std;

namespace cocl {
namespace flowcontrol {

int ConditionalBranch::getNumChildren() const {
    int count = 0;
    if(trueNext != 0) {
        count++;
    }
    if(falseNext != 0) {
        count++;
    }
    return count;
}
Block *ConditionalBranch::getChild(int idx) {
    if(trueNext != 0) {
        if(idx == 0) {
            return trueNext;
        }
        return falseNext;
    }
    return falseNext;
}
std::string ConditionalBranch::generateCl(std::string indent, bool noLabel) {
    dumped = true;
    string gencode = "";
    // cout << "condition " << (void *)condition << endl;
    bool invertCondition = false;
    if(trueNext == 0) {
        invertCondition = true;
    }
    if(invertCondition) {
        gencode += indent + "if(!" + dumpOperand(condition) + ") {\n";
    } else {
        gencode += indent + "if(" + dumpOperand(condition) + ") {\n";
    }
    if(invertCondition) {
        gencode += indent + "    goto " + falseNext->getLabel() + ";\n";
        gencode += indent + "}\n";
    } else {
        gencode += indent + "    goto " + trueNext->getLabel() + ";\n";
        if(falseNext != 0) {
            gencode += indent + "} else {\n";
            gencode += indent + "    goto " + falseNext->getLabel() + ";\n";
        }
        gencode += indent + "}\n";
    }
    return gencode;
}
void ConditionalBranch::walk(std::function<void(Block *block)> fn) {
    fn(this);
    if(trueNext != 0) {
        trueNext->walk(fn);
    }
    if(falseNext != 0) {
        falseNext->walk(fn);
    }
}
string ConditionalBranch::blockType() const {
    return "ConditionalBranch";
}
void ConditionalBranch::dump(set<const Block *> &seen, string indent) const {
    seen.insert(this);
    cout << indent << "ConditionalBranch " << this->id << gotoFreeString() << isExitString() << endl;
    cout << indent << "  True:" << endl;
    if(seen.find(trueNext) == seen.end()) {
        trueNext->dump(seen, indent + "    ");
    } else {
        cout << indent << "    (*" << trueNext->id << endl;
    }
    if(falseNext != 0) {
        cout << indent << "  False:" << endl;
        if(seen.find(falseNext) == seen.end()) {
            falseNext->dump(seen, indent + "    ");
        } else {
            cout << indent << "    (*" << falseNext->id << endl;
        }
    }
}
void ConditionalBranch::replaceSuccessor(Block *oldChild, Block *newChild) {
    if(trueNext == oldChild) {
        trueNext = newChild;
        return;
    }
    if(falseNext == oldChild) {
        falseNext = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
void ConditionalBranch::replaceChildOrSuccessor(Block *oldChild, Block *newChild) {
    if(trueNext == oldChild) {
        trueNext = newChild;
        return;
    }
    if(falseNext == oldChild) {
        falseNext = newChild;
        return;
    }
    throw runtime_error("couldnt find old child");
}
int ConditionalBranch::numSuccessors() const {
    int count = 0;
    if(trueNext != 0) {
        count++;
    }
    if(falseNext != 0) {
        count++;
    }
    return count;
}
Block *ConditionalBranch::getSuccessor(int idx) {
    if(idx == 0) {
        if(trueNext != 0) {
            return trueNext;
        } else {
            return falseNext;
        }
    }
    if(idx == 1) {
        if(trueNext != 0) {
            return falseNext;
        }
    }
    throw runtime_error("illegal request");
}

} // flowcontrol
} // cocl
