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
// mostly this handles figuring out which values are needed a value
// llvm, I think, only gives us direct access ot know which values need a value,
// not the other way around (as far as I know?)

#pragma once

#include "addressspacewalk/nodes.h"

#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IRReader/IRReader.h"

#include <string>
#include <set>
#include <map>

namespace cocl {
namespace addressspacewalk {

class ConnectionsWalker {
public:
    ConnectionsWalker(llvm::Module *M, std::string kernelName) : M(M), kernelName(kernelName) {

    }
    ~ConnectionsWalker() {

    }
    void walk(llvm::Function *F, llvm::BasicBlock *block);
    void walk(llvm::Function *function);
    void walkArgs(llvm::Function *F);
    void walk();
    void dumpValues();
    // void walk(llvm::Module *block);

    CoclValue *getOrCreateCoclValue(llvm::Value *value);

    std::set<llvm::BasicBlock *> blocksToWalk;
    std::set<llvm::Function *> functionsToWalk;
    // std::set<llvm::Module *> modulesToWalk;

    std::set<llvm::BasicBlock *> blocksDone;
    std::set<llvm::Function *> functionsDone;
    // std::set<llvm::Module *> modulesDone;

    // llvm::Function *kernel = 0;

    std::set< std::unique_ptr<CoclValue> > coclValues;  // coclValues and coclValueByValue should ocntain the exact same values
    std::map<llvm::Value *, CoclValue *> coclValueByValue;

    // std::map<llvm::Value *, int> addressSpaceByValue; // either a value exists, and the space is known; or it doesnt
    // std::map<llvm::Argument *, int> addressSpaceByArg;
    // std::map<llvm::Function *, int> returnAddressSpaceByFunction;
    // std::map<llvm::StructType *, StructInfo *> structInfoByStructType;

    int nextValueId = 1;
    std::map<int, CoclValue *> coclValueByGlobalId;

    llvm::Module *M;
    std::string kernelName;
};

} // addressspaceConnectionsWalker
} // cocl
