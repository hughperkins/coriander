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

#pragma once

#include "llvm/IR/Value.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"

#include <vector>
#include <string>
#include <set>
#include <iostream>
#include <stdexcept>

namespace cocl {
namespace flowcontrol {

void resetNextId();
int getNextId();
void incNextId();

// a Block has one or more links to child blocks
// a Block can be linked to by one or more blocks
// we probably need a root block, which holds the others
class Block {
public:
    int id;
    std::vector<Block *>incoming;
    bool dumped = false;
    bool gotoFree = false;

    Block();
    virtual void walk(std::function<void(Block *block)> fn) = 0;
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent = "") const = 0;
    virtual void replaceSuccessor(Block *oldSuccessor, Block *newSuccessor) = 0;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) = 0;
    virtual int getNumChildren() = 0;
    virtual Block *getChild(int idx) = 0;
    virtual int numSuccessors() = 0;
    virtual Block *getSuccessor(int idx) = 0;
    void replaceIncoming(Block *oldIncoming, Block *newIncoming);
    void removeIncoming(Block *targetIncoming);
    virtual std::string generateCl(std::string indent, bool noLabel=false) = 0;
    virtual std::string getLabel() const;
};

class RootBlock : public Block {
public:
    Block *first = 0;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual std::string blockType() const override;
    virtual void dump(std::set<const Block *> &seen, std::string indent = "") const  override;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
};

class For : public Block {
public:
    Block *preBlock = 0;
    llvm::Value *condition = 0;
    Block *body = 0;
    Block *next = 0;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
};

class If : public Block {
public:
    llvm::Value *condition = 0;
    Block *trueBlock = 0;
    Block *falseBlock = 0;
    Block *next = 0;
    bool invertCondition = false;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual std::string blockType() const override;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const override;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
};

class DoWhile : public Block {
public:
    llvm::Value *condition = 0;
    Block *body = 0;
    Block *next = 0;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual std::string blockType() const override;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const override;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
};

class ConditionalBranch : public Block {
public:
    llvm::Value *condition = 0;
    Block *trueNext = 0;
    Block *falseNext = 0;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual std::string blockType() const override;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const override;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
    // virtual std::string generateCl(std::string indent) {
    //     std::cout << "ConditionalBranch not wiped it seems" << std::endl;
    //     throw std::runtime_error("we're trying to get rid of these...");
    // }
};

class BasicBlockBlock : public Block {
public:
    bool needsLabel = true;
    llvm::BasicBlock *basicBlock = 0;
    std::vector<llvm::Instruction *> instructions;
    std::vector<llvm::PHINode *>originalIncomingPhis;
    std::map<llvm::PHINode *, llvm::Value *> migratedIntoOutgoingPhis;
    Block *next; // initially will probalby point to a Branch block
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual std::string getLabel() const override;
    virtual std::string blockType() const override;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const override;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
};

class Sequence : public Block {
public:
    std::vector<Block *> children;
    Block *next = 0;
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual std::string blockType() const override;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const override;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
};

class ReturnBlock : public Block {
public:
    llvm::Instruction *retInst = 0;
    virtual int getNumChildren() override;
    virtual Block *getChild(int idx) override;
    virtual void walk(std::function<void(Block *block)> fn) override;
    virtual std::string blockType() const override;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const override;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild) override;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) override;
    virtual int numSuccessors() override;
    virtual Block *getSuccessor(int idx) override;
    virtual std::string generateCl(std::string indent, bool noLabel=false) override;
};

} // flowcontrol
} // cocl
