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

#include <vector>
#include <string>
#include <set>

namespace cocl {
namespace flowcontrol {

void resetNextId();

// a Block has one or more links to child blocks
// a Block can be linked to by one or more blocks
// we probably need a root block, which holds the others
class Block {
public:
    int id;
    std::vector<Block *>incoming;

    Block();
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent = "") const = 0;
    virtual void replaceSuccessor(Block *oldSuccessor, Block *newSuccessor) = 0;
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild) = 0;
    virtual int numSuccessors() = 0;
    virtual Block *getSuccessor(int idx) = 0;
    void replaceIncoming(Block *oldIncoming, Block *newIncoming);
    void removeIncoming(Block *targetIncoming);
    virtual std::string generateCl(std::string indent) = 0;
};

class RootBlock : public Block {
public:
    Block *first = 0;
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent = "") const;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    virtual std::string generateCl(std::string indent);
};

class For : public Block {
public:
    Block *preBlock = 0;
    llvm::Value *condition = 0;
    Block *body = 0;
    Block *next = 0;
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual void dump(std::set<const Block *> &seen, std::string indent) const;
    virtual std::string generateCl(std::string indent) { return ""; }
};

class If : public Block {
public:
    llvm::Value *condition = 0;
    Block *trueBlock = 0;
    Block *falseBlock = 0;
    Block *next = 0;
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    virtual std::string generateCl(std::string indent);
};

class DoWhile : public Block {
public:
    llvm::Value *condition = 0;
    Block *body = 0;
    Block *next = 0;
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    virtual std::string generateCl(std::string indent) { return ""; }
};

class ConditionalBranch : public Block {
public:
    llvm::Value *condition = 0;
    Block *trueNext = 0;
    Block *falseNext = 0;
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    virtual std::string generateCl(std::string indent) { return ""; }
};

class BasicBlockBlock : public Block {
public:
    llvm::BasicBlock *basicBlock = 0;
    std::vector<llvm::Instruction *> instructions;
    Block *next; // initially will probalby point to a Branch block
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    virtual std::string generateCl(std::string indent);
};

class Sequence : public Block {
public:
    std::vector<Block *> children;
    Block *next = 0;
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    virtual std::string generateCl(std::string indent);
};

class ReturnBlock : public Block {
public:
    llvm::Instruction *retInst = 0;
    virtual std::string blockType() const;
    virtual void dump(std::set<const Block *> &seen, std::string indent) const;
    virtual void replaceSuccessor(Block *oldChild, Block *newChild);
    virtual void replaceChildOrSuccessor(Block *oldChild, Block *newChild);
    virtual int numSuccessors();
    virtual Block *getSuccessor(int idx);
    virtual std::string generateCl(std::string indent);
};

} // flowcontrol
} // cocl
