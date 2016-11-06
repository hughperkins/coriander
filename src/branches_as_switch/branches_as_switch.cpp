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

// implementation of the idea from section 2 of "Emscrypten: an LLVM-to-JavaScript Compiler", by Alon Zakai, 2013

// the paper describes more advanced optimiztaions than this, but at least this should get us code that compiles
// and runs ok on hd5500. hopefully.  we can make it faster later

#include "branches_as_switch/branches_as_switch.h"

#include "ir-to-opencl.h"
#include "ir-to-opencl-common.h"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"

#include <string>
#include <iostream>

using namespace std;
using namespace llvm;
using namespace cocl;

namespace cocl {

void BranchesAsSwitch::parse() {
    int blockId = 1;
    // if(F->getBasicBlockList().size() == 0) {
    //     return;
    // }
    cout << "parsing " << F->getName().str() << endl;
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *block = &*it;
        blockById[blockId] = block;
        idByBlock[block] = blockId;
        blockId++;
    }
    // for(auto it=F->begin(); it != F->end(); it++) {
    //     BasicBlock *block = &*it;
    //     for(auto it = block->begin; it != block->end(); it++) {
    //         Instruction *instr = &*it;
    //         if(PHINode *phi = dyn_cast<PHINode>(instr)) {
    //             for(auto it2 = phi->)
    //         } else {
    //             break;
    //         }
    //     }
    // }
    // phisToAddByBlock
}
const int indentLevelLength = 4;
map<int, std::string>indentStringByLevel;
inline std::string indentStr(int level) {
    if(indentStringByLevel.find(level) != indentStringByLevel.end()) {
        return indentStringByLevel[level];
    }
    string indentStr = "";
    int spacesLength = level * indentLevelLength;
    for(int i = 0; i < spacesLength; i++) {
        indentStr += " ";
    }
    indentStringByLevel[level] = indentStr;
    return indentStr;
}

#define layout(expr) indentStr(indentLevel) + expr + "\n"

std::string BranchesAsSwitch::writeNonFlowInstructions(int indentLevel, BasicBlock *block) {
    string gencode = "";
    string indentString = indentStr(indentLevel);
    for(auto it=block->begin(); it != block->end(); it++) {
        Instruction *inst = &*it;
        // if(isa<PHINode>(inst)) {
        //     continue;
        // }
        if(isa<ReturnInst>(inst)) {
            continue;
        }
        if(isa<BranchInst>(inst)) {
            continue;
        }
        gencode += dumpInstruction(indentString, inst);
    }
    // int numInstructions = block->getInstList().size() - 1;  // skip final terminator instruction
    // for(int i = 0; i < numInstructions; i++) {
    //     Instruction *inst = block->
    //     gencode += dumpInstruction
    // }
    return gencode;
}

std::string BranchesAsSwitch::writePhis(int indentLevel, BasicBlock *curr, BasicBlock *next) {
    // return dumpPhi()
    // string gencode = "";
    // for(auto it = next->begin(); it != next->end(); it++) {
    //     Instruction *instr = &*it;
    //     if(PHINode *phi = dyn_cast<PHINode>(instr)) {
    //         Value *value = phi->getIncomingValueForBlock(curr);
    //         gencode = dumpPhi(phi, curr);
    //         // copyAddressSpace(phi, value);
    //         // gencode += layout(dumpOperand(phi) + " = " + dumpValue(value) + ";");
    //         cout << "gencode from phi: " << gencode << endl;
    //     } else {
    //         break;
    //     }
    // }
    // return gencode;
    return "";
}

std::string BranchesAsSwitch::writeAsCl() {
    string gencode = "";

    // gencode += declareFunction(F);

    int indentLevel = 0;
    gencode += layout("int label = 1;");
    gencode += layout("while(true) {");
    indentLevel++;
    gencode += layout("switch(label) {");
    indentLevel++;
    for(auto it=blockById.begin(); it != blockById.end(); it++) {
        int blockId = it->first;
        cout << "block " << blockId << endl;
        BasicBlock *block = it->second;
        int numInstructions = block->getInstList().size();
        cout << "numInstructions " << numInstructions << endl;
        if(numInstructions == 0) {
            continue;
        }
        gencode += layout("case " + toString(blockId) + ":");
        indentLevel++;
        gencode += writeNonFlowInstructions(indentLevel, block);
        // find the branch, conditoinalbranch, or return
        Instruction *lastInst = block->getTerminator();
        if(ReturnInst *ret = dyn_cast<ReturnInst>(lastInst)) {
            gencode += layout(dumpReturn(ret) + ";");
        } else if(BranchInst *branch = dyn_cast<BranchInst>(lastInst)) {
            if(branch->isConditional()) {
                gencode += layout("if(" + dumpOperand(branch->getOperand(0)) + ") {");
                indentLevel++;
                gencode += writePhis(indentLevel, block, branch->getSuccessor(0));
                gencode += layout("label = " + toString(idByBlock[branch->getSuccessor(0)]) + ";");
                indentLevel--;
                gencode += layout("} else {");
                indentLevel++;
                gencode += writePhis(indentLevel, block, branch->getSuccessor(1));
                gencode += layout("label = " + toString(idByBlock[branch->getSuccessor(1)]) + ";");
                indentLevel--;
                gencode += layout("}");
                gencode += layout("break;");
            } else {
                BasicBlock *next = branch->getSuccessor(0);
                // int blockId = idByBlock[next];
                // gencode += writePhis(indentLevel, block, branch->getSuccessor(0));
                gencode += dumpPhi(branch, next);
                gencode += layout("label = " + toString(idByBlock[next]) + ";");
                gencode += layout("break;");
            }
        } else {
            lastInst->dump();
            cout << endl;
            throw runtime_error("unexpected instruction type " + dumpType(lastInst->getType()));
        }
        // gencode += layout("break;");
        indentLevel--;
        // BranchInst = 
    }
    indentLevel--;
    gencode += layout("};");
    indentLevel--;
    gencode += layout("}");
    return gencode;
}

} // namespace cocl
