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

#include "handle_branching.h"
#include "flowcontrolinstructions.h"
#include "branching_transforms.h"
#include "ir-to-opencl.h"
#include "ir-to-opencl-common.h"

#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <map>
#include <set>
#include <iostream>
#include <stdexcept>
#include <sstream>
#include <fstream>

#include <iostream>
#include <cassert>

using namespace std;
using namespace llvm;
using namespace cocl::flowcontrol;

namespace cocl {

vector<unique_ptr<Block> > blocks; // doesnt include the root. I guess. ???
map<BasicBlock *, BasicBlockBlock *> blockByBasicBlock;
set<PHINode *> phis;

void eraseBlock(Block *block) {
    int id = 0;
    bool found = false;
    for(auto it=blocks.begin(); it != blocks.end(); it++) {
        Block *thisblock = it->get();
        if(thisblock == block) {
            found = true;
            break;
        }
        id++;
    }
    if(found) {
        blocks.erase(blocks.begin() + id);
        return;
    }
    throw runtime_error("couldnt find block to erease");
}

void verify(Block *) {

}

string handlePhis(Block *root) {
    string phiDeclarations = "";
    for(auto it = blocks.begin(); it != blocks.end(); it++) {
        Block *block = it->get();
        // cout << "block " << block->blockType() << " " << block->id << endl;
        if(BasicBlockBlock *basicBlockBlock = dynamic_cast<BasicBlockBlock *>(block)) {
            for(auto it2 = basicBlockBlock->originalIncomingPhis.begin(); it2 != basicBlockBlock->originalIncomingPhis.end(); it2++) {
                PHINode *phi = *it2;
                // phi->dump();
                // cout << endl;
                phiDeclarations += dumpType(phi->getType()) + " " + dumpOperand(phi) + ";\n";
                int numIncoming = phi->getNumIncomingValues();
                // cout << "numincoming: " << numIncoming << endl;
                for(int i = 0; i < numIncoming; i++) {
                    BasicBlock *incomingBasicBlock = phi->getIncomingBlock(i);
                    BasicBlockBlock *incomingBlock = blockByBasicBlock[incomingBasicBlock];
                    // cout << "  incoming block: " << incomingBlock->id << endl;
                    incomingBlock->migratedIntoOutgoingPhis[phi] = phi->getIncomingValue(i);
                }
            }
        }
    }
    // cout << "phi declarations: [\n" << phiDeclarations << "]" << endl;
    return phiDeclarations;
}

std::unique_ptr<RootBlock> load_branching_tree(Function *F) {
    resetNextId();
    blocks.clear();
    phis.clear();
    blockByBasicBlock.clear();
    cout << "simplify " << string(F->getName()) << endl;
    unique_ptr<RootBlock> root(new RootBlock());
    for(auto it=F->begin(); it != F->end(); it++) {
        // cout << "block" << endl;
        BasicBlock *basicBlock = &*it;
        unique_ptr<BasicBlockBlock> block(new BasicBlockBlock());
        block->basicBlock = basicBlock;
        for(auto instit=basicBlock->begin(); instit != basicBlock->end(); instit++) {
            Instruction *inst = &*instit;
            // skip branches, phis and so on, which we'll handle later, somehow...
            if(isa<BranchInst>(inst)) {
                continue;
            }
            if(PHINode *phi = dyn_cast<PHINode>(inst)) {
                phis.insert(phi);
                block->originalIncomingPhis.push_back(phi);
                continue;
            }
            if(isa<ReturnInst>(inst)) {
                continue;
            }
            block->instructions.push_back(inst);
        }
        blockByBasicBlock[basicBlock] = block.get();
        blocks.push_back(std::move(block));
    }

    if(F->begin() == F->end()) {
        // cout << "empty function" << endl;
        return root;
        // return "";
    }
    root->first = blockByBasicBlock[&F->getEntryBlock()];
    root->first->incoming.push_back(root.get());
    // go through, and start linking stuff togehter, now that we have a map from basic block to block
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        BasicBlockBlock *block = dynamic_cast<BasicBlockBlock *>(blockByBasicBlock[basicBlock]);
        // I think that each block has to end initially either with a branch or a return?
        Instruction *lastInst = basicBlock->getTerminator();
        // cout << "lastinst:" << endl;
        // lastInst->dump();
        // cout << endl;
        if(isa<ReturnInst>(lastInst)) {
            // cout << "finishes in ret" << endl;
            unique_ptr<ReturnBlock> retBlock(new ReturnBlock());
            block->next = retBlock.get();
            block->next->incoming.push_back(block);
            retBlock->retInst = lastInst;
            blocks.push_back(std::move(retBlock));
        } else if(BranchInst* branchInst = dyn_cast<BranchInst>(lastInst)) {
            // cout << "its a branch" << endl;
            // if its unconditional, we just link directly to the next block
            // otherwise we link to a ConditionalBranch block
            if(branchInst->isUnconditional()) {
                // cout << "unconditonal branch" << endl;
                BasicBlock *next = branchInst->getSuccessor(0);
                Block *nextBlock = blockByBasicBlock[next];
                block->next = nextBlock;
                block->next->incoming.push_back(block);
            } else {
                // conditional
                // create a ConditionalBranch block
                // cout << "conditonal branch" << endl;
                unique_ptr<ConditionalBranch> conditionalBranch(new ConditionalBranch());
                BasicBlock *trueBasicBlock = branchInst->getSuccessor(0);
                Block *trueBlock = blockByBasicBlock[trueBasicBlock];
                conditionalBranch->condition = branchInst->getCondition();
                conditionalBranch->trueNext = trueBlock;
                conditionalBranch->trueNext->incoming.push_back(conditionalBranch.get());
                conditionalBranch->falseNext = 0;
                if(branchInst->getNumSuccessors() == 2) {
                    BasicBlock *falseBasicBlock = branchInst->getSuccessor(1);
                    Block *falseBlock = blockByBasicBlock[falseBasicBlock];
                    conditionalBranch->falseNext = falseBlock;
                    conditionalBranch->falseNext->incoming.push_back(conditionalBranch.get());
                }
                block->next = conditionalBranch.get();
                block->next->incoming.push_back(block);
                blocks.push_back(std::move(conditionalBranch));
            }
        } else {
            cout << "hmmm, how did we get here???" << endl;
            cout << "lastinst:" << endl;
            lastInst->dump();
            cout << endl;
            throw runtime_error("dont know how we got here...");
        }
    }
    return root;
}
// void run_branching_transforms(RootBlock *root) {
//     runTransforms(root);
// }
void addLabels() {
    // find any conditionalbranch, and set `needsLabel` to true for its destinations
    for(auto it=blocks.begin(); it != blocks.end(); it++) {
        Block *block = it->get();
        if(ConditionalBranch *branch = dynamic_cast<ConditionalBranch *>(block)) {
            if(branch->trueNext != 0) {
                // cout << "truenext type " << branch->trueNext->blockType() << endl;
                // BasicBlockBlock *next = dynamic_cast<BasicBlockBlock *>(branch->trueNext);
                // cout << "next " << (void *)next << endl;
                // next->needsLabel = true;
            }
            if(branch->falseNext != 0) {
                // cout << "falseNext type " << branch->falseNext->blockType() << endl;
                // BasicBlockBlock *next = dynamic_cast<BasicBlockBlock *>(branch->falseNext);
                // cout << "next " << (void *)next << endl;
                // next->needsLabel = true;
            }
            // cout << "after add labels for cond " << branch->id << endl;
        }
    }
}
void markBlocksUnwritten() {
    // will tag each block as not having being dumped
    // after dumping, we'll dump any that weren't dumped yet
    for(auto it=blocks.begin(); it != blocks.end(); it++) {
        Block *block = it->get();
        block->dumped = false;
    }
}
string dumpUnwrittenBlocks() {
    string gencode = "";
    for(auto it=blocks.begin(); it != blocks.end(); it++) {
        Block *block = it->get();
        if(!block->dumped) {
            block->dumped = true;
            gencode += block->generateCl("    ");
        }
    }
    return gencode;
}
string branching_write_cl(RootBlock *root) {
    string phiDeclarations = handlePhis(root);

    addLabels();
    markBlocksUnwritten();
    string cl = root->generateCl("    ");
    cl += dumpUnwrittenBlocks();
    // cout << "cl: [\n" << cl << "]" << endl;
    return cl;
}

} // namespace cocl
