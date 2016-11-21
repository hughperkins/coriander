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

#include "ClWriter.h"

#include "readIR.h"
#include "LocalValueInfo.h"
#include "mutations.h"
#include "EasyCL/util/easycl_stringhelper.h"
#include "InstructionDumper.h"
#include "ExpressionsHelper.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"

#include <iostream>
using namespace std;
using namespace llvm;

namespace cocl {

void ClWriter::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) {  // if we set this as to be assigned, this will write something, otherwise it wont
    // cout << "base ClWriter::writeDelcaratoin" << endl;
    for(auto it = localValueInfo->declarationCl.begin(); it != localValueInfo->declarationCl.end(); it++) {
        // cout << "in localvalueinfo->declarationCl:" << endl;
        // cout << indent << *it << ";" << endl;
        os << indent << *it << ";\n";
    }
    if(localValueInfo->toBeDeclared) {
        // cout << "in localvalueinfo.toBeDeclared:" << endl;
        // cout << indent << typeDumper->dumpType(localValueInfo->value->getType(), true) << " " << localValueInfo->name << ";" << endl;
        os << indent << typeDumper->dumpType(localValueInfo->value->getType(), true) << " " << localValueInfo->name << ";\n";
    }
    // if(localValueInfo->toBeDeclared) {
    //     os << indent << typeDumper->dumpType(localValueInfo->value->getType(), true) << " " << localValueInfo->name;\n";
    // }
}

void ClWriter::writeInlineCl(std::string indent, std::ostream &os) { // writes any cl required, eg if we toggled setAsAssigned, we need to do the assignment
                                          // some instructoins will *always* write something, eg stores
    for(auto it = localValueInfo->inlineCl.begin(); it != localValueInfo->inlineCl.end(); it++) {
        os << indent << *it << ";\n";
    }
    if(localValueInfo->toBeDeclared) {
        if(!localValueInfo->expressionValid) {
            cout << "expression for " << localValueInfo->name + " not defined" << endl;
            throw runtime_error("expression for " + localValueInfo->name + " not defined");
        }
        string expression = stripOuterParams(localValueInfo->expression);
        os << indent << localValueInfo->name << " = " << expression << ";\n";
    }
    // expression = name;
}

void AllocaClWriter::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) {
    // cout << "AllocaClWriter::writeDelcaratoin" << endl;
    string gencode = "";
    LocalValueInfo *l = localValueInfo;
    AllocaInst *alloca = cast<AllocaInst>(l->value);
    // AllocaInfo allocaInfo;
    if(PointerType *allocatypeptr = dyn_cast<PointerType>(alloca->getType())) {
        Type *ptrElementType = allocatypeptr->getPointerElementType();
        std::string typestring = typeDumper->dumpType(ptrElementType);
        int count = readInt32Constant(alloca->getOperand(0));
        // string name = localNames->getOrCreateName(alloca);
        string name = l->name;
        // cout << "alloca var name [" << name << "]" << endl;
        // localExpressionByValue->operator[](alloca) = name;
        localValueInfo->setExpression(name);
        if(count == 1) {
            if(ArrayType *arrayType = dyn_cast<ArrayType>(ptrElementType)) {
                // cout << "alloca, is arraytype" << endl;
                int innercount = arrayType->getNumElements();
                Type *elementType = arrayType->getElementType();
                string allocaDeclaration = typeDumper->dumpType(elementType) + " " + 
                    localValueInfo->name + "[" + easycl::toString(innercount) + "]";
                // allocaInfo.alloca = alloca;
                // allocaInfo.refValue = alloca;
                // allocaInfo.definition = allocaDeclaration;
                // allocaDeclarations->push_back(allocaInfo);
                os << indent << allocaDeclaration << ";\n";
                return;
            } else {
                // cout << "alloca, non-arraytype" << endl;
                // Value *refInstruction = alloca;
                // if the elementType is a pointer, assume its global?
                if(isa<PointerType>(ptrElementType)) {
                    // cout << "alloca, pointertype" << endl;
                    // find the store
                    for(auto it=alloca->user_begin(); it != alloca->user_end(); it++) {
                        User *user = *it;
                        if(StoreInst *store = dyn_cast<StoreInst>(user)) {
                            int storeop0space = cast<PointerType>(store->getOperand(0)->getType())->getAddressSpace();
                            // refInstruction = store->getOperand(0);
                            if(storeop0space == 1) {
                                gencode += "global ";
                                updateAddressSpace(alloca, 1);
                            }
                            copyAddressSpace(user, alloca);
                            typestring = typeDumper->dumpType(ptrElementType);
                        }
                    }
                }
                string allocaDeclaration = gencode + typestring + " " + localValueInfo->name + "[1]";
                // find the store
                // for(auto it=alloca->user_begin(); it != alloca->user_end(); it++) {
                    // User *user = *it;
                    // if(StoreInst *store = dyn_cast<StoreInst>(user)) {
                        // cout << "found store:" << endl;
                        // store->dump();
                        // cout << endl;
                        // refInstruction = store->getOperand(0);
                    // }
                // }
                // allocaInfo.alloca = alloca;
                // allocaInfo.refValue = refInstruction;
                // allocaInfo.definition = allocaDeclaration;
                // allocaDeclarations->push_back(allocaInfo);
                os << indent << allocaDeclaration << ";\n";
                return;
            }
        } else {
            throw runtime_error("not implemented: alloca for count != 1");
        }
    } else {
        alloca->dump();
        throw runtime_error("dumpalloca not implemented for non pointer type");
    }
}

void AllocaClWriter::writeInlineCl(std::string indent, std::ostream &os) { // writes any cl required, eg if we toggled setAsAssigned, we need to do the assignment
                                          // some instructoins will *always* write something, eg stores
    // for(auto it = localValueInfo->inlineCl.begin(); it != localValueInfo->inlineCl.end(); it++) {
    //     os << indent << *it << ";\n";
    // }
    // if(localValueInfo->toBeDeclared) {
    //     os << indent << localValueInfo->name << " = " << localValueInfo->getExpr() << ";\n";
    // }
    // expression = name;
}

void StoreClWriter::writeInlineCl(std::string indent, std::ostream &os) { // writes any cl required, eg if we toggled setAsAssigned, we need to do the assignment
                                          // some instructoins will *always* write something, eg stores
    for(auto it = localValueInfo->inlineCl.begin(); it != localValueInfo->inlineCl.end(); it++) {
        os << indent << *it << ";\n";
    }
}

void InsertValueClWriter::writeInlineCl(std::string indent, std::ostream &os) { // writes any cl required, eg if we toggled setAsAssigned, we need to do the assignment
                                          // some instructoins will *always* write something, eg stores
    for(auto it = localValueInfo->inlineCl.begin(); it != localValueInfo->inlineCl.end(); it++) {
        os << indent << *it << ";\n";
    }
}

void InsertValueClWriter::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) {  // if we set this as to be assigned, this will write something, otherwise it wont
    // cout << "ClWriter::writeDelcaratoin" << endl;
    for(auto it = localValueInfo->declarationCl.begin(); it != localValueInfo->declarationCl.end(); it++) {
        os << indent << *it << ";\n";
    }
    if(fromUndef) {
        os << indent << typeDumper->dumpType(localValueInfo->value->getType()) << " " << localValueInfo->name << ";\n";
    }
}

void SharedClWriter::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) {
    // cout << "sharedclwriter::writedeclaration" << endl;
    Value *value = localValueInfo->value;
    // cout << "value:" << endl;
    // value->dump();
    // cout << endl;
    // Type *valueType = value->getType();
    // if(GlobalVariable *globalVariable = dyn_cast<GlobalVariable>(value)) {
    // cout << "value type:" << endl;
    // value->getType()->dump();
    if(PointerType *pointerType = dyn_cast<PointerType>(value->getType())) {
        // cout << "globalvariable" << endl;
        // globalVariable->dump();
        // cout << "globalvariable->getType()" << endl;
        // Type *type = globalVariable->getType();
        // type->dump();
        // int addressSpace = globalVariable->getAddressSpace();
        int addressSpace = pointerType->getAddressSpace();
        // cout << "addressSpace " << addressSpace << endl;
        if(addressSpace != 3) {
            throw runtime_error("shouldnt be here");
        }
        Type *elementType = pointerType->getPointerElementType();
        // cout << "elementType:" << endl;
        // elementType->dump();
        // cout << endl;
        int numElements = 0;
        Type *primitiveType = 0;
        if(ArrayType *arrayType = dyn_cast<ArrayType>(elementType)) {
            // cout << "got array type" << endl;
            numElements = arrayType->getNumElements();
            primitiveType = arrayType->getElementType();
            // cout << "numElements " << numElements << endl;
            // primitiveType->dump();
        } else {
            cout << "sharedclwriter::writedlecaraiotn, not implemneted for:" << endl;
            value->dump();
            cout << endl;
            throw runtime_error("not handled/implemented");
        }
        // GlobalVariable *globalVariable = cast<GlobalVariable>(value);
        // int count = pointerType->getArrayNumElements();
        // cout << "num elements " << count << endl;
        os << indent << "local " << localValueInfo->name << " " << typeDumper->dumpType(primitiveType) << "[" << numElements << "];\n";
    } else {
        cout << "sharedclwriter writedeclaration not implmeneted for htis type:" << endl;
        value->dump();
        cout << endl;
        throw runtime_error("not implemented: sharedclwriter for this type");
    }
}

} // namespace cocl;
