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
    class Block {
    public:
        virtual string blockType() const {
            return "Block";
        }
        virtual void dump(string indent = "") const = 0;
    };
    class RootBlock {
    public:
        Block *first = 0;
        virtual string blockType() const {
            return "RootBlock";
        }
        virtual void dump(string indent = "") const {
            cout << indent << "RootBlock" << endl;
            first->dump(indent + "  ");
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
        virtual void dump(string indent) const {
            cout << indent << "If" << endl;
            cout << indent << "  True:" << endl;
            trueBlock->dump(indent + "    ");
            if(falseBlock != 0) {
                cout << indent << "  False:" << endl;
                falseBlock->dump(indent + "    ");
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
        virtual void dump(string indent) const {
            cout << indent << "ConditionalBranch" << endl;
            cout << indent << "  True:" << endl;
            trueNext->dump(indent + "    ");
            if(falseNext != 0) {
                cout << indent << "  False:" << endl;
                falseNext->dump(indent + "    ");
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
        virtual void dump(string indent) const {
            cout << indent << "BasicBlockBlock" << endl;
            next->dump(indent);
        }
    };
    class ReturnBlock : public Block {
    public:
        virtual string blockType() const {
            return "ReturnBlock";
        }
        virtual void dump(string indent) const {
            cout << indent << "ReturnBlock" << endl;
        }
    };
    vector<unique_ptr<Block> > blocks; // doesnt include the root. I guess. ???
    map<BasicBlock *, Block *> blockByBasicBlock;

    void dumpBlock(Block *block) {
        cout << "dumping block" << endl;
        block->dump();
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
                } else {
                    // conditional
                    // create a ConditionalBranch block
                    cout << "conditonal branch" << endl;
                    unique_ptr<ConditionalBranch> conditionalBranch(new ConditionalBranch());
                    BasicBlock *trueBasicBlock = branchInst->getSuccessor(0);
                    Block *trueBlock = blockByBasicBlock[trueBasicBlock];
                    conditionalBranch->trueNext = trueBlock;
                    conditionalBranch->falseNext = 0;
                    if(branchInst->getNumSuccessors() == 2) {
                        BasicBlock *falseBasicBlock = branchInst->getSuccessor(1);
                        Block *falseBlock = blockByBasicBlock[falseBasicBlock];
                        conditionalBranch->falseNext = falseBlock;
                    }
                    block->next = conditionalBranch.get();
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
        root->dump();
    }
}
