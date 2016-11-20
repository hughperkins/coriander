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

#include "LocalValueInfo.h"
#include "mutations.h"
#include "ClWriter.h"

#include <iostream>
#include <ostream>

using namespace std;
using namespace llvm;

namespace cocl {

LocalValueInfo *LocalValueInfo::getOrCreate(cocl::LocalNames *localNames, std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > >*localValueInfos, Value *value, string suggestedName) {
    if(localValueInfos->find(value) != localValueInfos->end()) {
        return localValueInfos->at(value).get();
    }
    string name = localNames->getOrCreateName(value, suggestedName);
    unique_ptr<LocalValueInfo >localValueInfo;
    localValueInfo.reset(new LocalValueInfo(value, name));
    (*localValueInfos).insert(std::make_pair(value, std::move(localValueInfo)));
    return localValueInfos->at(value).get();
}

LocalValueInfo *LocalValueInfo::setAddressSpace(int addressSpace) {
    this->addressSpace = addressSpace;
    updateAddressSpace(value, addressSpace);
    addressSpaceValid = true;
    return this;
}

LocalValueInfo *LocalValueInfo::setAddressSpaceFrom(Value *source) {
    int addressSpace = 0;
    if(PointerType *pointerType = dyn_cast<PointerType>(source->getType())) {
        addressSpace = pointerType->getAddressSpace();
        // copyAddressSpace(source, value);
    }
    setAddressSpace(addressSpace);
    return this;
}

LocalValueInfo *LocalValueInfo::setAddressSpaceFrom(LocalValueInfo *srcInfo) {
    setAddressSpaceFrom(srcInfo->value);
    return this;
}

LocalValueInfo *LocalValueInfo::setExpression(std::string expression) {
    this->expression = expression;
    expressionValid = true;
    return this;
}

std::string LocalValueInfo::getExpr() {
    if(toBeDeclared) {
        return name;
    }
    if(!expressionValid) {
        cout << "expression not yet assigned for " << name << endl;
        throw std::runtime_error("expression not yet assigned, name " + name);
    }
    return expression;
}

LocalValueInfo *LocalValueInfo::setAsAssigned() {
    // implies:
    // - we need to declare it
    // - any expression can directly use the new declared variable
    toBeDeclared = true;
    // this->expression = name;
    return this;
}

void LocalValueInfo::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) {
    clWriter->writeDeclaration(indent, typeDumper, os);
}

void LocalValueInfo::writeInlineCl(std::string indent, std::ostream &os) {
    clWriter->writeInlineCl(indent, os);
}

// void AllocaValueInfo::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) override {
//     Value alloca = value;
//     if(PointerType *allocatypeptr = dyn_cast<PointerType>(alloca->getType())) {
//         Type *ptrElementType = allocatypeptr->getPointerElementType();
//         std::string typestring = typeDumper->dumpType(ptrElementType);
//         int count = readInt32Constant(alloca->getOperand(0));
//         // string name = localNames->getOrCreateName(alloca);
//         string name = localValueInfo->name;
//         // cout << "alloca var name [" << name << "]" << endl;
//         // localExpressionByValue->operator[](alloca) = name;
//         localValueInfo->setExpression(name);
//         if(count == 1) {
//             if(ArrayType *arrayType = dyn_cast<ArrayType>(ptrElementType)) {
//                 cout << "alloca, is arraytype" << endl;
//                 int innercount = arrayType->getNumElements();
//                 Type *elementType = arrayType->getElementType();
//                 string allocaDeclaration = typeDumper->dumpType(elementType) + " " + 
//                     localValueInfo->name + "[" + easycl::toString(innercount) + "]";
//                 allocaInfo.alloca = alloca;
//                 allocaInfo.refValue = alloca;
//                 allocaInfo.definition = allocaDeclaration;
//                 allocaDeclarations->push_back(allocaInfo);
//                 return;
//             } else {
//                 cout << "alloca, non-arraytype" << endl;
//                 Value *refInstruction = alloca;
//                 // if the elementType is a pointer, assume its global?
//                 if(isa<PointerType>(ptrElementType)) {
//                     cout << "alloca, pointertype" << endl;
//                     // find the store
//                     for(auto it=alloca->user_begin(); it != alloca->user_end(); it++) {
//                         User *user = *it;
//                         if(StoreInst *store = dyn_cast<StoreInst>(user)) {
//                             int storeop0space = cast<PointerType>(store->getOperand(0)->getType())->getAddressSpace();
//                             // refInstruction = store->getOperand(0);
//                             if(storeop0space == 1) {
//                                 gencode += "global ";
//                                 updateAddressSpace(alloca, 1);
//                             }
//                             copyAddressSpace(user, alloca);
//                             typestring = typeDumper->dumpType(ptrElementType);
//                         }
//                     }
//                 }
//                 string allocaDeclaration = gencode + typestring + " " + localValueInfo->name + "[1]";
//                 // find the store
//                 for(auto it=alloca->user_begin(); it != alloca->user_end(); it++) {
//                     User *user = *it;
//                     if(StoreInst *store = dyn_cast<StoreInst>(user)) {
//                         cout << "found store:" << endl;
//                         store->dump();
//                         cout << endl;
//                         refInstruction = store->getOperand(0);
//                     }
//                 }
//                 allocaInfo.alloca = alloca;
//                 allocaInfo.refValue = refInstruction;
//                 allocaInfo.definition = allocaDeclaration;
//                 allocaDeclarations->push_back(allocaInfo);
//                 return;
//             }
//         } else {
//             throw runtime_error("not implemented: alloca for count != 1");
//         }
//     } else {
//         alloca->dump();
//         throw runtime_error("dumpalloca not implemented for non pointer type");
//     }
// }

} // namespace cocl;
