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

#include "basicblockdumper.h"

#include <iostream>
#include <stdexcept>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {


bool BasicBlockDumper::checkIfNeedsAssign(Instruction *instruction) {
    Use *use = 0;
    User *use_user = 0;

    bool useIsAStore = false;
    bool useIsExtractValue = false;
    bool useIsAPhi = false;
    bool useIsABitcast = false;

    if(instruction->getNumUses() == 1) {
        use = &*instruction->use_begin();
        use_user = use->getUser();
        useIsAStore = isa<StoreInst>(use_user);
        useIsExtractValue = isa<ExtractValueInst>(use_user);
        useIsAPhi = isa<PHINode>(use_user);
        useIsABitcast = isa<BitCastInst>(use_user);
    }
    if(     instruction->getNumUses() <= 1
            && !useIsExtractValue 
            && !useIsAPhi
            && !useIsABitcast
            && !isa<LoadInst>(instruction)
            && !isa<StoreInst>(instruction)
            && !useIsAStore
            && !isa<CallInst>(instruction)) {
        return false;
    }
    return true;
}

void BasicBlockDumper::writeDeclaration(std::ostream &os, llvm::Value *value) {
    os << typeDumper->dumpType(value->getType(), true) + " " + localNames->getName(value);
}

void BasicBlockDumper::writeDeclarations(std::string indent, ostream &os) {
    vector<string> declarations;
    for(auto it = localValueInfos->begin(); it != localValueInfos->end(); it++) {
        LocalValueInfo *localValueInfo = it->second.get();
        ostringstream oss;
        localValueInfo->writeDeclaration("    ", typeDumper, oss);
        declarations.push_back(oss.str());
    }
    std::sort(declarations.begin(), declarations.end());
    for(auto it=declarations.begin(); it != declarations.end(); it++) {
        os << *it;
    }
}

bool BasicBlockDumper::runGeneration(const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    // returns true if finished, otherwise false, if missing some dependnecies and so on,
    // like child functions we need to walk over first ,to figure ou the address spcae of
    // the return value
    for(; (maxInstructionsToGenerate == -1 || maxInstructionsToGenerate > 0) && instruction_it != block->end(); instruction_it++) {
        Instruction *inst = &*instruction_it;
        if(isa<PHINode>(inst) || isa<BranchInst>(inst) || isa<ReturnInst>(inst)) {
            continue;
        }
        try {
            LocalValueInfo *instrInfo = LocalValueInfo::getOrCreate(localNames, localValueInfos, inst);
            instructionDumper->runGeneration(instrInfo, returnTypeByFunction);
            if(instructionDumper->usesVmem) {
                this->usesVmem = true;
            }
            if(instructionDumper->usesScratch) {
                this->usesScratch = true;
            }
            if(instrInfo->needDependencies) {
                return false;
            }
            if(checkIfNeedsAssign(inst)) {
                instrInfo->setAsAssigned();
            }
        } catch(runtime_error &e) {
            cout << "basicblockdumper.runGeneration got exception whilst processing:" << endl;
            inst->dump();
            cout << endl;
            throw e;
        }
        if(maxInstructionsToGenerate > 0) {
            maxInstructionsToGenerate--;
        }
    }
    return true;
}

void BasicBlockDumper::toCl(ostream &os) {
    for(auto it=block->begin(); it != instruction_it; it++) {
        Value *value = &*it;
        if(isa<ReturnInst>(value) || isa<PHINode>(value) || isa<BranchInst>(value)) {
            continue;
        }
        LocalValueInfo *valueInfo = localValueInfos->at(value).get();
        valueInfo->writeInlineCl("    ", os);
    }
}

} // namespace cocl
