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

#include "type_dumper.h"

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

const int MAX_SPACE_DEPTH = 5;

class SpaceNode {
public:
    SpaceNode(int id, int spaceDepth) : id(id), spaceDepth(spaceDepth) {
        for(int i = 0; i < spaceDepth; i++) {
            assigned[i] = false;
        }
    }
    std::set<llvm::Value *> values;
    const int spaceDepth = 0;  // scalar will have spaceDepth 1
    // bool spaceAssigned = false;  // change to true once we've assigned it
    bool assigned[MAX_SPACE_DEPTH]; // we dont have to assign all spaces in one go
    int spaces[MAX_SPACE_DEPTH];  // eg a private pointer to local pointer to global would have conceptually spaces[] = {0, 3, 1};
    // in a struct, the first space will be -1, meaning whatever space the struct is in.

    const int id;
};

class SpaceGraph {
public:
    SpaceGraph(llvm::Module *M, std::string kernelName) :
        M(M),
        kernelName(kernelName),
        typeDumper(&globalNames) {

    }
    ~SpaceGraph() {

    }
    void acquire();
    void dump();

protected:
    void findLinkedValues(SpaceNode *node, llvm::Value *value);
    void walk(llvm::Function *F, llvm::BasicBlock *block);
    void walk(llvm::Function *function);
    void walkArgs(llvm::Function *F);
    // void walk(llvm::Module *block);

    SpaceNode *getOrCreateNode(llvm::Value *value);

    std::set<llvm::BasicBlock *> blocksToWalk;
    std::set<llvm::Function *> functionsToWalk;
    // std::set<llvm::Module *> modulesToWalk;

    std::set<llvm::BasicBlock *> blocksDone;
    std::set<llvm::Function *> functionsDone;
    // std::set<llvm::Module *> modulesDone;

    // llvm::Function *kernel = 0;

    std::set< std::unique_ptr<SpaceNode> > nodes;  // coclValues and coclValueByValue should ocntain the exact same values
    std::map<llvm::Value *, SpaceNode *> nodeByValue;

    // std::map<llvm::Value *, int> addressSpaceByValue; // either a value exists, and the space is known; or it doesnt
    // std::map<llvm::Argument *, int> addressSpaceByArg;
    // std::map<llvm::Function *, int> returnAddressSpaceByFunction;
    // std::map<llvm::StructType *, StructInfo *> structInfoByStructType;

    int nextNodeId = 1;
    // std::set<std::uni
    std::map<int, SpaceNode *> nodeById;

    llvm::Module *M;
    std::string kernelName;

    GlobalNames globalNames;
    TypeDumper typeDumper;
};

} // addressspaceSpaceGraph
} // cocl
