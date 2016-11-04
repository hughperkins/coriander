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
map<BasicBlock *, Block *> blockByBasicBlock;

template<typename T>
void vectorErase(vector<T> &targetvector, T &element) {
    int i = 0;
    bool found = false;
    for(auto it=targetvector.begin(); it != targetvector.end(); it++) {
        const T &thiselement = *it;
        if(thiselement == element) {
            found = true;
            break;
        }
        i++;
    }
    if(found) {
        targetvector.erase(targetvector.begin() + i);
        return;
    }
    throw runtime_error("couldnt find element to erease");
}

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

void migrateIncoming(Block *oldChild, Block *newChild) {
    for(auto it=oldChild->incoming.begin(); it != oldChild->incoming.end(); it++) {
        Block *incoming = *it;
        newChild->incoming.push_back(incoming);
        incoming->replaceChildOrSuccessor(oldChild, newChild);
    }
    oldChild->incoming.clear();
}

// void swapParentInChildren(Block *oldParent, Block *newParent) {
//     if(oldParent->numSuccessors() != 1) {
//         throw runtime_error("not yet implemented: more than one child");
//     }
//     Block *successor = oldParent->getSuccessor(0);
//     successor->replaceIncoming(oldParent, newParent);
// }

bool mergeSequences(Block *root) {
    // basically we look for any block with one single incoming, and that incoming is a basicblockblock
    bool didAMerge = true;
    int numChanges = 0;
    while(didAMerge) {
        didAMerge = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(block->incoming.size() != 1) {
                continue;
            }
            // cout << "block " << block->id << " has only one incoming" << endl;
            Block *parent = block->incoming[0];
            if(parent->numSuccessors() != 1) {
                continue;
            }
            if(block->numSuccessors() != 1) {
                continue;
            }
            if(parent->getSuccessor(0) != block) {
                continue;
            }
            // so merge...
            cout << "merging ... " << block->id << ", " << parent->id << endl;
            unique_ptr<Sequence> sequence(new Sequence());
            sequence->children.push_back(parent);
            sequence->children.push_back(block);
            migrateIncoming(parent, sequence.get());
            parent->incoming.push_back(sequence.get());
            parent->replaceSuccessor(block, 0);
            block->incoming.clear();
            block->incoming.push_back(sequence.get());
            Block *blockSuccessor = block->getSuccessor(0);
            blockSuccessor->replaceIncoming(block, sequence.get());
            sequence->next = blockSuccessor;
            block->replaceSuccessor(blockSuccessor, 0);
            blocks.push_back(std::move(sequence));
            didAMerge = true;
            numChanges++;
            return true;
        }
    }
    return numChanges > 0;
}
bool huntTrueIfs(Block *block) {
    // an 'if' looks like (we're handling only the 'true' case ):
    // (something)
    // ConditionalBlock
    // true: BlockA => BlockB
    // false: BlockB (constraint: 1 successor exactly)
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                Block *trueChild = cond->trueNext;
                Block *falseChild = cond->falseNext;
                if(trueChild->numSuccessors() != 1) {
                    continue;
                }
                if(trueChild->incoming.size() != 1) {
                    continue;
                }
                if(trueChild->getSuccessor(0) != falseChild) {
                    continue;
                }

                unique_ptr<If> ifBlock(new If());
                migrateIncoming(cond, ifBlock.get());
                ifBlock->condition = cond->condition;
                ifBlock->trueBlock = trueChild;
                ifBlock->falseBlock = 0;
                ifBlock->next = falseChild;

                trueChild->incoming.clear();
                trueChild->incoming.push_back(ifBlock.get());
                trueChild->replaceSuccessor(falseChild, 0);

                falseChild->replaceIncoming(trueChild, ifBlock.get());
                falseChild->removeIncoming(cond);

                eraseBlock(cond);
                blocks.push_back(std::move(ifBlock));
                foundFor = true;
                numChanges++;
                return true;
            }
        }
    }
    return numChanges > 0;
}
bool huntTrueIfElses(Block *block) {
    // an 'if' looks like (we're handling only the 'true' case ):
    // (something)
    // ConditionalBlock
    // true: BlockA => BlockC
    // false: BlockB => blockC
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                Block *trueChild = cond->trueNext;
                Block *falseChild = cond->falseNext;
                if(trueChild->numSuccessors() != 1) {
                    continue;
                }
                if(trueChild->incoming.size() != 1) {
                    continue;
                }

                if(falseChild->numSuccessors() != 1) {
                    continue;
                }
                if(falseChild->incoming.size() != 1) {
                    continue;
                }

                if(falseChild->getSuccessor(0) != trueChild->getSuccessor(0)) {
                    continue;
                }

                Block *successor = falseChild->getSuccessor(0);
                unique_ptr<If> ifBlock(new If());
                migrateIncoming(cond, ifBlock.get());
                ifBlock->condition = cond->condition;
                ifBlock->trueBlock = trueChild;
                ifBlock->falseBlock = falseChild;
                ifBlock->next = successor;

                trueChild->incoming.clear();
                trueChild->incoming.push_back(ifBlock.get());
                trueChild->replaceSuccessor(successor, 0);

                falseChild->incoming.clear();
                falseChild->incoming.push_back(ifBlock.get());
                falseChild->replaceSuccessor(successor, 0);

                successor->removeIncoming(trueChild);
                successor->removeIncoming(falseChild);
                successor->incoming.push_back(ifBlock.get());

                eraseBlock(cond);
                blocks.push_back(std::move(ifBlock));
                foundFor = true;
                numChanges++;
                return true;
            }
        }
    }
    return numChanges > 0;
}
bool huntDoWhiles(Block *block) {
    // an 'if' looks like (we're handling only the 'true' case ):
    // (something)
    // BlockA
    // ConditionalBlock
    // true: blockA
    // false: (doesnt matter)
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                Block *trueChild = cond->trueNext;
                Block *falseChild = cond->falseNext;
                if(trueChild->numSuccessors() != 1) {
                    continue;
                }
                if(trueChild->getSuccessor(0) != cond) {
                    continue;
                }
                cout << "creating dowhile" << endl;

                Block *body = trueChild;
                unique_ptr<DoWhile> doWhile(new DoWhile());

                doWhile->body = body;
                doWhile->condition = cond->condition;
                doWhile->next = falseChild;
                cout << "body: " << body->id << endl;
                cout << "cond: " << cond->id << endl;
                cout << "next: " << doWhile->next->id << endl;

                migrateIncoming(body, doWhile.get());
                doWhile->removeIncoming(cond);

                body->incoming.clear();
                body->incoming.push_back(doWhile.get());
                body->replaceSuccessor(cond, 0);

                falseChild->removeIncoming(cond);
                falseChild->incoming.push_back(doWhile.get());

                // // check a bit
                // for(auto i=doWhile->incoming.begin(); i != doWhile->end(); i++) {
                //     Block *inc = *i;
                //     assert(ppinc->numSuccessors() == 1);
                //     assert(inc->getSuccessor(0) == doWhile);
                // }

                eraseBlock(cond);
                blocks.push_back(std::move(doWhile));
                foundFor = true;
                numChanges++;
                return true;
            }
        }
    }
    return numChanges > 0;
}
void huntWhiles(Block *block) {
    // BlockA
    // ConditonalBlock
    // true: BlockA
    // false: BlockB
}
bool huntFors(Block *block) {
    //BlockA
    //ConditionalBlock
    // true: BlockB => blockA
    // false: blockC
    // blockC
    int numChanges = 0;
    bool foundFor = true;
    while(foundFor) {
        foundFor = false;
        for(auto it = blocks.begin(); it != blocks.end(); it++) {
            Block *block = it->get();
            if(ConditionalBranch *cond = dynamic_cast<ConditionalBranch *>(block)) {
                if(cond->incoming.size() != 1) {
                    continue;
                }
                Block *parent = cond->incoming[0];
                Block *child = cond->trueNext;
                if(child->incoming.size() != 1) {
                    continue;
                }
                if(child->numSuccessors() != 1) {
                    continue;
                }
                if(child->getSuccessor(0) != parent) {
                    continue;
                }
                // cout << "found a for :-)" << endl;
                // cout << "pre: " << parent->id << endl;
                // cout << "condiiotn: " << block->id << endl;
                // cout << "body: " << child->id << endl;
                // cout << "next: " << cond->falseNext->id << endl;

                unique_ptr<For> forBlock(new For());
                // migrateIncoming(parent, forBlock.get());
                // vectorErase(forBlock->incoming, child);
                for(auto parentincit = parent->incoming.begin(); parentincit != parent->incoming.end(); parentincit++) {
                    Block *parentinc = *parentincit;
                    if(parentinc != child) {
                        // cout << "parentinc " << parentinc->id << endl;
                        forBlock->incoming.push_back(parentinc);
                        parentinc->replaceSuccessor(parent, forBlock.get());
                    }
                }
                parent->incoming.clear();
                parent->replaceSuccessor(cond, 0);
                child->replaceSuccessor(parent, 0);
                child->incoming.clear();
                forBlock->next = cond->falseNext;
                forBlock->preBlock = parent;
                forBlock->body = child;
                forBlock->condition = cond->condition;
                cond->falseNext->replaceIncoming(cond, forBlock.get());
                eraseBlock(cond);
                blocks.push_back(std::move(forBlock));
                foundFor = true;
                numChanges++;
            }
        }
    }
    return numChanges > 0;
}
void verify(Block *) {

}
void handle_branching_simplify(Function *F) {
    resetNextId();
    blocks.clear();
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
            if(isa<PHINode>(inst)) {
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

    set<const Block *>seen;
    root->dump(seen, "");

    // int numChanges = 1;
    bool madeChanges =  true;
    while(madeChanges > 0) {
        madeChanges = false;
        if(mergeSequences(root.get())) {
            madeChanges = true;
            // seen.clear();
            // root->dump(seen, "");
        }

        if(huntTrueIfs(root.get())) {
            madeChanges = true;
            // seen.clear();
            // root->dump(seen, "");
        }

        if(huntTrueIfElses(root.get())) {
            madeChanges = true;
            // seen.clear();
            // root->dump(seen, "");
        }

        if(huntFors(root.get())) {
            madeChanges = true;
            // seen.clear();
            // root->dump(seen, "");
        }

        seen.clear();
        root->dump(seen, "");
        if(huntDoWhiles(root.get())) {
            madeChanges = true;
            seen.clear();
            root->dump(seen, "");
        }

        // if(huntWhiles(root.get())) {
        //     madeChanges = true;
        //     seen.clear();
        //     root->dump(seen, "");
        // }

        // seen.clear();
        // root->dump(seen, "");
    }
    seen.clear();
    root->dump(seen, "");

}

} // namespace cocl
