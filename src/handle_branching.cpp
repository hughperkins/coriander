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

namespace cocl {
    // a Block has one or more links to child blocks
    // a Block can be linked to by one or more blocks
    // we probably need a root block, which holds the others
    static int nextId = 0;

    class Block {
    public:
        int id;
        Block() {
            this->id = nextId;
            nextId++;
        }
        virtual string blockType() const {
            return "Block";
        }
        virtual void dump(set<const Block *> &seen, string indent = "") const = 0;
        vector<Block *>incoming;
        virtual void replaceChild(Block *oldChild, Block *newChild) = 0;
        virtual int numSuccessors() = 0;
        virtual Block *getSuccessor(int idx) = 0;
        void replaceIncoming(Block *oldIncoming, Block *newIncoming) {
            int id = 0;
            bool found = false;
            for(auto it=incoming.begin(); it != incoming.end(); it++) {
                Block *block = *it;
                if(block == oldIncoming) {
                    found = true;
                    break;
                }
                id++;
            }
            if(found) {
                incoming[id] = newIncoming;
                return;
            }
            throw runtime_error("illegal parameters");
        }
    };
    class RootBlock : public Block {
    public:
        Block *first = 0;
        virtual string blockType() const {
            return "RootBlock";
        }
        virtual void dump(set<const Block *> &seen, string indent = "") const {
            seen.insert(this);
            cout << indent << "RootBlock " << this->id << endl;
            if(seen.find(first) == seen.end()) {
                first->dump(seen, indent + "  ");
            }
        }
        void replaceChild(Block *oldChild, Block *newChild) {
            assert(first == oldChild);
            first = newChild;
        }
        virtual int numSuccessors() {
            if(first != 0) {
                return 1;
            }
            return 0;
        }
        virtual Block *getSuccessor(int idx) {
            return first;
        }
    };
    class For : public Block {
    public:
        Block *preBlock = 0;
        Value *condition = 0;
        Block *bodyBlock = 0;
        Block *next = 0;
        virtual int numSuccessors() {
            if(next != 0) {
                return 1;
            }
            return 0;
        }
        virtual Block *getSuccessor(int idx) {
            if(idx > 0) {
                throw runtime_error("illegal request");
            }
            return next;
        }
        void replaceChild(Block *oldChild, Block *newChild) {
            if(next == oldChild) {
                next = newChild;
                return;
            }
            throw runtime_error("couldnt find old child");
        }
        virtual void dump(set<const Block *> &seen, string indent) const {
            seen.insert(this);
            cout << indent << "For " << this->id << endl;
            cout << indent << "  Pre:" << endl;
            preBlock->dump(seen, indent + "    ");
            cout << indent << "  Body:" << endl;
            bodyBlock->dump(seen, indent + "    ");
            if(next != 0) {
                if(seen.find(next) == seen.end()) {
                    next->dump(seen, indent);
                } else {
                    cout << "(*" << next->id << endl;
                }
            }
        }
    };
    class If : public Block {
    public:
        Value *condition = 0;
        Block *trueBlock = 0;
        Block *falseBlock = 0;
        virtual string blockType() const {
            return "If";
        }
        virtual void dump(set<const Block *> &seen, string indent) const {
            seen.insert(this);
            cout << indent << "If " << this->id << endl;
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
        }
        void replaceChild(Block *oldChild, Block *newChild) {
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
        virtual int numSuccessors() {
            int count = 0;
            if(trueBlock != 0) {
                count++;
            }
            if(falseBlock != 0) {
                count++;
            }
            return count;
        }
        virtual Block *getSuccessor(int idx) {
            if(idx == 0) {
                if(trueBlock != 0) {
                    return trueBlock;
                } else {
                    return falseBlock;
                }
            }
            if(idx == 1) {
                if(trueBlock != 0) {
                    return falseBlock;
                }
            }
            throw runtime_error("illegal request");
        }
    };
    class ConditionalBranch : public Block {
    public:
        Value *condition = 0;
        Block *trueNext = 0;
        Block *falseNext = 0;
        virtual string blockType() const {
            return "ConditionalBranch";
        }
        virtual void dump(set<const Block *> &seen, string indent) const {
            seen.insert(this);
            cout << indent << "ConditionalBranch " << this->id << endl;
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
        void replaceChild(Block *oldChild, Block *newChild) {
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
        virtual int numSuccessors() {
            int count = 0;
            if(trueNext != 0) {
                count++;
            }
            if(falseNext != 0) {
                count++;
            }
            return count;
        }
        virtual Block *getSuccessor(int idx) {
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
    };
    class BasicBlockBlock : public Block {
    public:
        BasicBlock *basicBlock = 0;
        vector<Value *> instructions;
        Block *next; // initially will probalby point to a Branch block
        virtual string blockType() const {
            return "BasicBlockBlock";
        }
        virtual void dump(set<const Block *> &seen, string indent) const {
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
        void replaceChild(Block *oldChild, Block *newChild) {
            if(next == oldChild) {
                next = newChild;
                return;
            }
            throw runtime_error("couldnt find old child");
        }
        virtual int numSuccessors() {
            int count = 0;
            if(next != 0) {
                count++;
            }
            return count;
        }
        virtual Block *getSuccessor(int idx) {
            return next;
        }
    };
    class Sequence : public Block {
    public:
        vector<Block *> children;
        Block *next = 0;
        virtual string blockType() const {
            return "Sequence";
        }
        virtual void dump(set<const Block *> &seen, string indent) const {
            seen.insert(this);
            cout << indent << "Sequence " << this->id << endl;
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
        void replaceChild(Block *oldChild, Block *newChild) {
            // int i = 0;
            if(next == oldChild) {
                next = newChild;
                return;
            }
            // bool foundChild = false;
            // for(auto it = children.begin(); it != children.end(); it++) {
            //     Block *child = *it;
            //     if(child == oldChild) {
            //         foundChild = true;
            //         break;
            //     }
            //     i++;
            // }
            // if(foundChild) {
            //     children[i] = newChild;
            //     return;
            // }
            throw runtime_error("couldnt find old child");
        }
        virtual int numSuccessors() {
            int count = 0;
            if(next != 0) {
                count++;
            }
            return count;
        }
        virtual Block *getSuccessor(int idx) {
            return next;
        }
    };
    class ReturnBlock : public Block {
    public:
        virtual string blockType() const {
            return "ReturnBlock";
        }
        virtual void dump(set<const Block *> &seen, string indent) const {
            cout << indent << "ReturnBlock " << this->id << endl;
        }
        void replaceChild(Block *oldChild, Block *newChild) {
            throw runtime_error("couldnt find old child");
        }
        virtual int numSuccessors() {
            return 0;
        }
        virtual Block *getSuccessor(int idx) {
            throw runtime_error("illegal request");
        }
    };
    vector<unique_ptr<Block> > blocks; // doesnt include the root. I guess. ???
    map<BasicBlock *, Block *> blockByBasicBlock;
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

    // void dumpBlock(Block *block) {
    //     cout << "dumping block" << endl;
    //     block->dump();
    // }

    void mergeSequences(Block *root) {
        // basically we look for any block with one single incoming, and that incoming is a basicblockblock
        bool didAMerge = true;
        while(didAMerge) {
            didAMerge = false;
            for(auto it = blocks.begin(); it != blocks.end(); it++) {
                Block *block = it->get();
                if(block->incoming.size() == 1) {
                    // cout << "block " << block->id << " has only one incoming" << endl;
                    Block *parent = block->incoming[0];
                    if(BasicBlockBlock *parentBlockBlock = dynamic_cast<BasicBlockBlock*>(parent)) {
                        // cout << "its a blockblock" << endl;
                        if(BasicBlockBlock *thisBlockBlock = dynamic_cast<BasicBlockBlock*>(block)) {
                            // so merge...
                            cout << "merging ... " << block->id << ", " << parent->id << endl;
                            unique_ptr<Sequence> sequence(new Sequence());
                            sequence->children.push_back(parent);
                            sequence->children.push_back(block);
                            for(auto parentincit = parent->incoming.begin(); parentincit != parent->incoming.end(); parentincit++) {
                                Block *parentinc = *parentincit;
                                sequence->incoming.push_back(parentinc);
                                parentinc->replaceChild(parent, sequence.get());
                            }
                            parent->incoming.clear();
                            parent->incoming.push_back(sequence.get());
                            parentBlockBlock->next = 0;
                            block->incoming.clear();
                            block->incoming.push_back(sequence.get());
                            thisBlockBlock->next->replaceIncoming(thisBlockBlock, sequence.get());
                            sequence->next = thisBlockBlock->next;
                            thisBlockBlock->next = 0;
                            blocks.push_back(std::move(sequence));
                            didAMerge = true;
                        }
                    } else {
                        // cout << "but not a basicblockblock" << endl;
                    }
                }
            }
        }
    }
    void huntIfs(Block *block) {
        // an 'if' looks like (we're handling only the 'true' case):
        // (something)
        // ConditionalBlock
        // true: SomeSingleBlock => nextBlock
        // false: NextBlock
    }
    void huntWhiles(Block *block) {
        // BlockA
        // ConditonalBlock
        // true: BlockA
        // false: BlockB
    }
    void huntFors(Block *block) {
        //BlockA
        //ConditionalBlock
        // true: BlockB => blockA
        // false: blockC
        // blockC
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
                    cout << "found a for :-)" << endl;
                    cout << "pre: " << parent->id << endl;
                    cout << "condiiotn: " << block->id << endl;
                    cout << "body: " << child->id << endl;
                    cout << "next: " << cond->falseNext->id << endl;
            //             class For : public Block {
            // Block *preBlock = 0;
            // Value *condition = 0;
            // Block *bodyBlock = 0;
            // Block *next = 0;
                    unique_ptr<For> forBlock(new For());
                    for(auto parentincit = parent->incoming.begin(); parentincit != parent->incoming.end(); parentincit++) {
                        Block *parentinc = *parentincit;
                        if(parentinc != child) {
                            cout << "parentinc " << parentinc->id << endl;
                            forBlock->incoming.push_back(parentinc);
                            parentinc->replaceChild(parent, forBlock.get());
                        }
                    }
                    parent->incoming.clear();
                    parent->replaceChild(cond, 0);
                    child->replaceChild(parent, 0);
                    child->incoming.clear();
                    forBlock->next = cond->falseNext;
                    forBlock->preBlock = parent;
                    forBlock->bodyBlock = child;
                    forBlock->condition = cond->condition;
                    eraseBlock(cond);
                    blocks.push_back(std::move(forBlock));
                    foundFor = true;
                }
            }
        }
    }
    void handle_branching_simplify(Function *F) {
        cout << "simplify " << string(F->getName()) << endl;
        unique_ptr<RootBlock> root(new RootBlock());
        for(auto it=F->begin(); it != F->end(); it++) {
            cout << "block" << endl;
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
            cout << "lastinst:" << endl;
            lastInst->dump();
            cout << endl;
            if(isa<ReturnInst>(lastInst)) {
                cout << "finishes in ret" << endl;
                unique_ptr<ReturnBlock> retBlock(new ReturnBlock());
                block->next = retBlock.get();
                block->next->incoming.push_back(block);
                blocks.push_back(std::move(retBlock));
            } else if(BranchInst* branchInst = dyn_cast<BranchInst>(lastInst)) {
                cout << "its a branch" << endl;
                // if its unconditional, we just link directly to the next block
                // otherwise we link to a ConditionalBranch block
                if(branchInst->isUnconditional()) {
                    cout << "unconditonal branch" << endl;
                    BasicBlock *next = branchInst->getSuccessor(0);
                    Block *nextBlock = blockByBasicBlock[next];
                    block->next = nextBlock;
                    block->next->incoming.push_back(block);
                } else {
                    // conditional
                    // create a ConditionalBranch block
                    cout << "conditonal branch" << endl;
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

        mergeSequences(root.get());

        seen.clear();
        root->dump(seen, "");

        huntIfs(root.get());
        huntWhiles(root.get());
        huntFors(root.get());

        seen.clear();
        root->dump(seen, "");
    }
}
