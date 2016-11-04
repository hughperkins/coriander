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
            if(seen.find(next) == seen.end()) {
                next->dump(seen, indent);
            } else {
                cout << indent << "  (*" << next->id << endl;
            }
        }
    };
    class Sequence : public Block {
    public:
        vector<Block *> children;
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
    };
    vector<unique_ptr<Block> > blocks; // doesnt include the root. I guess. ???
    map<BasicBlock *, Block *> blockByBasicBlock;

    // void dumpBlock(Block *block) {
    //     cout << "dumping block" << endl;
    //     block->dump();
    // }

    void mergeSequences(Block *root) {
        // basically we look for any block with one single incoming, and that incoming is a basicblockblock
        bool didAMerge = false;
        while(didAMerge) {
            for(auto it = blocks.begin(); it != blocks.end(); it++) {
                Block *block = it->get();
                if(block->incoming.size() == 1) {
                    cout << "block " << block->id << " has only one incoming" << endl;
                    Block *parent = block->incoming[0];
                    if(BasicBlockBlock *parentBlockBlock = dynamic_cast<BasicBlockBlock*>(parent)) {
                        cout << "its a blockblock" << endl;
                        if(BasicBlockBlock *thisBlockBlock = dynamic_cast<BasicBlockBlock*>(block)) {
                            // so merge...
                            unique_ptr<Sequence> sequence(new Sequence());
                            sequence->children.push_back(parent);
                            sequence->children.push_back(block);
                            for(auto parentincit = parent->incoming.begin(); parentincit != parent->incoming.end(); parentincit++) {
                                Block *parentinc = *parentincit;
                                sequence->incoming.push_back(parentinc);
                            }
                            parent->incoming.clear();
                            parent->incoming.push_back(sequence.get());
                            parentBlockBlock->next = 0;
                            block->incoming.clear();
                            block->incoming.push_back(sequence.get());
                            thisBlockBlock->next = 0;
                            blocks.push_back(std::move(sequence));
                            didAMerge = true;
                        }
                    } else {
                        cout << "but not a basicblockblock" << endl;
                    }
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

        mergeSequences(root.get());

        set<const Block *>seen;
        root->dump(seen, "");
    }
}
