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

#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"

#include <iostream>
#include <string>
#include <stdexcept>

namespace cocl {
namespace addressspacewalk {

CoclValue *ConnectionsWalker::getOrCreateCoclValue(llvm::Value *value) {
    if(coclValueByValue.find(value) == coclValueByValue.end()) {
        std::unique_ptr< CoclValue >newCoclValue(new CoclValue());
        newCoclValue->type = value->getType();
        newCoclValue->value = value;
        coclValueByValue[value] = newCoclValue.get();
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
            coclValue->needs.insert(childCoclValue);
            childCoclValue->neededBy.insert(coclValue);
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
    std::cout << "function " << F->getName().str() << std::endl;
    walkArgs(F);
    for(auto it=F->begin(); it != F->end(); it++) {
        llvm::BasicBlock *block = &*it;
        if(blocksDone.find(block) == blocksDone.end()) {
            blocksToWalk.insert(block);
            walk(F, block);
        }
    }
}

void ConnectionsWalker::walk() {
    llvm::Function *F = M->getFunction(kernelName);
    if(F == 0) {
        throw std::runtime_error("Couldnt find kernel " + kernelName);
    }
    functionsToWalk.insert(F);
    bool progressMade = true;
    while(!functionsToWalk.empty() && progressMade) {
        progressMade = false;
        for(auto it=functionsToWalk.begin(); it != functionsToWalk.end(); it++) {
            llvm::Function *fn = *it;
            walk(fn);
        }
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
