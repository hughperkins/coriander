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

// handles walking connections, pass 1

#include "addressspacewalk/connections_walker.h"

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
#include <stdexcept>

namespace cocl {
namespace addressspacewalk {


void ConnectionsWalker::dumpValues(){
    GlobalNames globalNames;
    TypeDumper typeDumper(&globalNames);
    for(int i = 0; i < nextValueId; i++) {
        CoclValue *coclValue = coclValueByGlobalId[i];
        if(coclValue != 0) {
            llvm::Value *value = coclValue->value;   
            llvm::Value *value = coclValue->value;
            std::string opName = "";
            if(llvm::Instruction *inst = llvm::dyn_cast<llvm::Instruction>(value)) {
                opName = inst->getOpcodeName();
            }

            ostringstream ins;
            for(auto it=coclValue->needs.begin(); it != coclValue->needs.end(); it++) {
                if(it != needs.begin()) {
                    outs << ",";
                }
                outs << (*it)->globalId;
            }

            ostringstream outs;
            for(auto it=coclValue->neededBy.begin(); it != coclValue->neededBy.end(); it++) {
                if(it != neededBy.begin()) {
                    outs << ",";
                }
                outs << (*it)->globalId << ",";
            }

            std::cout << "[" << ins.str() << "] => " << i << " " << typeDumper.dumpType(coclValue->type) <<
            std::cout << "[" << outs.str() << "]" << std::endl;
            std::cout << "]" << std::endl;
        }
    }
}

CoclValue *ConnectionsWalker::getOrCreateCoclValue(llvm::Value *value) {
    if(coclValueByValue.find(value) == coclValueByValue.end()) {
        std::unique_ptr< CoclValue >newCoclValue(new CoclValue(nextValueId));
        nextValueId++;
        newCoclValue->type = value->getType();
        newCoclValue->value = value;
        coclValueByValue[value] = newCoclValue.get();
        coclValueByGlobalId[nextValueId - 1] = newCoclValue.get();
        // coclValue = newCoclValue.get();
        coclValues.insert(std::move(newCoclValue));
    }
    return coclValueByValue[value];
}

void ConnectionsWalker::walk(llvm::Function *F, llvm::BasicBlock *block) {
    std::cout << "block " << block->getName().str() << std::endl;
    for(auto it=block->begin(); it != block->end(); it++) {
        llvm::Value *value = &*it;
        CoclValue *coclValue = getOrCreateCoclValue(value);
        coclValue->block = block;
        coclValue->function = F;
        coclValue->module = this->M;
        for(auto childit = value->user_begin(); childit != value->user_end(); childit++) {
            llvm::Value *child = *childit;
            CoclValue *childCoclValue = getOrCreateCoclValue(child);
            coclValue->neededBy.insert(childCoclValue);
            childCoclValue->needs.insert(coclValue);
        }
        if(llvm::CallInst *call = llvm::dyn_cast<llvm::CallInst>(value)) {
            std::cout << "its a call" << std::endl;
            llvm::Function *called = call->getCalledFunction();
            // std::cout << "F " << (long)called << std::endl;
            // called->dump();
            // std::cout << std::endl;
            if(functionsDone.find(called) == functionsDone.end()) {
                std::cout << "adding to to walk" << std::endl;
                functionsToWalk.insert(called);
            }
            CoclValue *childCoclValue = getOrCreateCoclValue(called);
            coclValue->neededBy.insert(childCoclValue);
            childCoclValue->needs.insert(coclValue);
        }
    }
}

void ConnectionsWalker::walkArgs(llvm::Function *F) {
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

void ConnectionsWalker::walk(llvm::Function *F) {
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

void ConnectionsWalker::walk() {
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
    std::cout << "size of coclValues " << coclValues.size() << std::endl;
    // for(auto it = M->begin(); it != M->end(); it++) {
    //     Function *F = &*it;
    //     walk(F);
    // }
}

// void walk(llvm::Module *block) {

// }

} // addressspaceConnectionsWalker
} // cocl
