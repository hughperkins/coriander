// Copyright Hugh Perkins 2016, 2017

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// handles walking address space graph, joining values together which must
// have identical address spaces

#include "addressspacewalk/spacegraph.h"
#include "addressspacewalk/spacegraph_instructionspecific.h"

#include "type_dumper.h"

#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Instructions.h"

#include <iostream>
#include <string>
#include <sstream>
#include <stdexcept>

namespace cocl {
namespace addressspacewalk {


// idea: can probably make a generic walk function. maybe llvm already provides one?

void SpaceGraph::dump(){
    GlobalNames globalNames;
    TypeDumper typeDumper(&globalNames);
    // for(int i = 0; i < nextNodeId; i++) {
    //     SpaceNode *node = nodeById[i];
    //     if(node != 0) {
    //         llvm::Value *value = node->value;
    //         std::string opName = "";
    //         if(llvm::Instruction *inst = llvm::dyn_cast<llvm::Instruction>(value)) {
    //             opName = inst->getOpcodeName();
    //         }

    //         std::ostringstream ins;
    //         for(auto it=node->needs.begin(); it != node->needs.end(); it++) {
    //             if(it != node->needs.begin()) {
    //                 ins << ",";
    //             }
    //             ins << "%" << (*it)->globalId;
    //         }

    //         std::ostringstream outs;
    //         for(auto it=node->neededBy.begin(); it != node->neededBy.end(); it++) {
    //             if(it != node->neededBy.begin()) {
    //                 outs << ",";
    //             }
    //             outs << "%" << (*it)->globalId;
    //         }

    //         std::cout << " [" << outs.str() << "]";
    //         std::cout << " <-";

    //         std::cout << " %" << i;

    //         if(llvm::CallInst *call = llvm::dyn_cast<llvm::CallInst>(value)) {
    //             std::cout << " call @" << call->getCalledFunction()->getName().str();
    //         } else if(llvm::Function *F = llvm::dyn_cast<llvm::Function>(value)) {
    //             std::cout << " define @" << F->getName().str();
    //         } else {
    //             std::cout << " " << opName;
    //         }

    //         std::cout << " " << typeDumper.dumpType(node->type);
    //         std::cout << " [" << ins.str() << "]" << std::endl;
    //     }
    // }
}

SpaceNode *SpaceGraph::getOrCreateNode(llvm::Value *value) {
    if(nodeByValue.find(value) == nodeByValue.end()) {
        int pointerDepth = typeDumper.getPointerDepth(value->getType());
        std::cout << "type " << typeDumper.dumpType(value->getType()) << " pointer depth " << pointerDepth << std::endl;
        std::unique_ptr< SpaceNode > newNode(new SpaceNode(nextNodeId, pointerDepth + 1));
        nextNodeId++;
        // newNode->type = value->getType();
        // newNode->value = value;
        nodeByValue[value] = newNode.get();
        nodeById[nextNodeId - 1] = newNode.get();
        // node = newNode.get();
        nodes.insert(std::move(newNode));
    }
    return nodeByValue[value];
}

void SpaceGraph::walk(llvm::Function *F, llvm::BasicBlock *block) {
    std::cout << "block " << block->getName().str() << std::endl;
    for(auto it=block->begin(); it != block->end(); it++) {
        llvm::Value *value = &*it;
        SpaceNode *node = getOrCreateNode(value);

        findLinkedValues(node, value);

        // node->block = block;
        // node->function = F;
        // node->module = this->M;
        for(auto childit = value->user_begin(); childit != value->user_end(); childit++) {
            llvm::Value *child = *childit;
            SpaceNode *childNode = getOrCreateNode(child);
            // node->neededBy.insert(childNode);
            // childNode->needs.insert(node);

            // address space mapping depends on the instruction ...
            // we're going to end up reproducing large swatches of new_instruction_dumper...
            // anyway...
        }
        if(llvm::CallInst *call = llvm::dyn_cast<llvm::CallInst>(value)) {
            llvm::Function *called = call->getCalledFunction();
            std::cout << "its a call, to " << called->getName().str() << std::endl;
            // std::cout << "F " << (long)called << std::endl;
            // called->dump();
            // std::cout << std::endl;
            if(functionsDone.find(called) == functionsDone.end()) {
                std::cout << "adding to to walk" << std::endl;
                // functionsToWalk.insert(called);
            }
            SpaceNode *functionSpaceNode = getOrCreateNode(called);
            // node->needs.insert(functionSpaceNode);
            // functionSpaceNode->neededBy.insert(node);

            // need to walk args to function to figure out reverse direction dependencies,
            // of the function on the current node
            // for(auto argit = called->arg_begin(); argit != called->arg_end(); argit++) {
            //     llvm::Value *arg = &*argit;
            //     SpaceNode *argSpaceNode = getOrCreateNode(arg);
            //     node->neededBy.insert(functionSpaceNode);
            //     functionSpaceNode->neededBy.insert(node);
            // }
        }
    }
}

void SpaceGraph::walkArgs(llvm::Function *F) {
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        llvm::Argument *arg = &*it;
        llvm::Type *type = arg->getType();

        // if(llvm::PointerType *ptr = llvm::dyn_cast<llvm::PointerType>(type)) {
        //     llvm::Type *elemType = ptr->getElementType();
        //     if(llvm::PointerType *l2ptr = llvm::dyn_cast<llvm::PointerType>(elemType)) {
        //         std::cout << "not implemented: double indirection to function args" << std::endl;
        //         throw std::runtime_error("Not hanlded: double indirection");
        //     }
        //     // addressSpaceByArg[arg] = 1;
        // } else {
        //     // addressSpaceByArg[arg] = 0;
        // }
        // addressSpaceByValue[arg] = addressSpaceByArg[arg];
        // std::cout << "arg " << arg->getName().str() << ": " << addressSpaceByArg[arg] << std::endl;
    }
}

void SpaceGraph::walk(llvm::Function *F) {
    std::cout << "F " << (long)F << std::endl;
    // if(F->hasName()) {
        std::cout << "function " << F->getName().str() << std::endl;
    // } else {
        // std::cout << "function " << std::endl;
    // }
    walkArgs(F);
    for(auto it=F->begin(); it != F->end(); it++) {
        llvm::BasicBlock *block = &*it;
        if(blocksDone.find(block) == blocksDone.end()) {
            blocksToWalk.insert(block);
            walk(F, block);
        }
    }
    functionsDone.insert(F);
    functionsToWalk.erase(F);
}

void SpaceGraph::acquire() {
    llvm::Function *F = M->getFunction(kernelName);
    if(F == 0) {
        throw std::runtime_error("Couldnt find kernel " + kernelName);
    }
    functionsToWalk.insert(F);
    // std::cout << "F " << (long)F << std::endl;
    bool progressMade = true;
    int iteration = 0;
    while(!functionsToWalk.empty() && progressMade && iteration < 100) {
        // progressMade = false;
        std::vector<llvm::Function *> todo;
        for(auto it=functionsToWalk.begin(); it != functionsToWalk.end(); it++) {
            llvm::Function *fn = *it;
            if(functionsDone.find(fn) == functionsDone.end()) {
                todo.push_back(fn);
            }
        }
        for(auto it=todo.begin(); it != todo.end() ;it++) {
            llvm::Function *fn = *it;
            if(functionsDone.find(fn) == functionsDone.end()) {
                // std::cout << "walk() fn: " << (long)fn << std::endl;
                walk(fn);
            }
        }
        iteration++;
    }
    std::cout << "size of nodes " << nodes.size() << std::endl;
    // for(auto it = M->begin(); it != M->end(); it++) {
    //     Function *F = &*it;
    //     walk(F);
    // }
}

// void walk(llvm::Module *block) {

// }

} // addressspaceSpaceGraph
} // cocl
