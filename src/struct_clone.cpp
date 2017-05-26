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

#include "struct_clone.h"

#include "cocl_logging.h"

#include "ir-to-opencl-common.h"
#include "EasyCL/util/easycl_stringhelper.h"
#include "mutations.h"

#include "llvm/Support/raw_os_ostream.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

#include <map>
#include <set>

using namespace llvm;
using namespace std;
using namespace cocl;

namespace cocl {

// static std::map<Type *, Type *> pointerlessTypeByOriginalType;

// extern std::set<string> declaredStructs;
// extern std::string declarations_to_write;
// extern bool single_precision;

// StructType *StructCloner::cloneNoPointers(StructType *inStructType) {

// }

// Type *cloneStructTypeNoPointers(StructType *inType) {

llvm::StructType *StructCloner::createGlobalizedPointerStruct(std::map<llvm::StructType *, llvm::StructType *> &newByOld, llvm::StructType *inType) {
    LLVMContext &context = inType->getContext();
    if(newByOld.find(inType) != newByOld.end()) {
        return newByOld[inType];
    }
    string newName = inType->getName().str() + "_ptrglobal";
    vector<Type *>newChildren;
    for(auto it=inType->element_begin(); it != inType->element_end(); it++) {
        Type *childType = *it;
        if(StructType *childStructType = dyn_cast<StructType>(childType)) {
            childType = createGlobalizedPointerStruct(newByOld, childStructType);
            newChildren.push_back(childType);
        } else if(PointerType *ptr = dyn_cast<PointerType>(childType)) {
            Type *elementType = ptr->getElementType();
            // assume fundamental for now
            if(elementType->getPrimitiveSizeInBits() > 0) {
                PointerType *newPtr = PointerType::get(elementType, 1);
                newChildren.push_back(newPtr);
            } else {
                // just ignore...
                // elementType->dump();
                // throw runtime_error("not implemented");
            }
        } else {
            newChildren.push_back(childType);
        }
    }
    // outs() << "newchildren.size() " << newChildren.size() << "\n";
    StructType *newType = 0;
    if(newChildren.size() > 0) {
        newType = StructType::create(ArrayRef<Type *>(&newChildren[0], &newChildren[newChildren.size()]), newName);
    } else {
        newType = StructType::get(context);
    }
    newByOld[inType] = newType;
    return newType;
}

StructType *StructCloner::cloneNoPointers(StructType *inType) {
    Indentor indentor;
    // indentor << "StructClone::cloneNoPointers() " << typeDumper->dumpType(inType) << endl;
    LLVMContext &context = inType->getContext();
    if(pointerlessTypeByOriginalType.find(inType) != pointerlessTypeByOriginalType.end()) {
        return pointerlessTypeByOriginalType[inType];
    }
    // string name = globalNames->getName(inType);
    // string newName = name + "_nopointers";
    string newName = inType->getName().str() + "_nopointers";
    // cout << newName << " cloning " << newName << endl;
    vector<Type *>newChildren;
    for(auto it=inType->element_begin(); it != inType->element_end(); it++) {
        Type *childType = *it;
        // cout << newName << " child element:" << endl;
        // childType->dump();
        if(StructType *childStructType = dyn_cast<StructType>(childType)) {
            // cout << newName << " child is struct, so cloning that" << endl;
            childType = cloneNoPointers(childStructType);
            newChildren.push_back(childType);
        } else if(isa<PointerType>(childType)) {
            // ignore
            // cout << newName << " child is pointer type => ignoring" << endl;
        } else {
            // cout << newName << " child is neither pointer nor struct, so blindly adding..." << endl;
            newChildren.push_back(childType);
        }
    }
    if(newChildren.size() == 0) {
        // add some dummy thing...
        newChildren.push_back(IntegerType::get(context, 32));
    }
    // outs() << "newchildren.size() " << newChildren.size() << "\n";
    StructType *newType = 0;
    if(newChildren.size() > 0) {
        newType = StructType::create(ArrayRef<Type *>(&newChildren[0], &newChildren[newChildren.size()]), newName);
    } else {
        newType = StructType::get(context);
    }
    pointerlessTypeByOriginalType[inType] = newType;
    // cout << newName << " final struct:" << endl;
    // newType->dump();
    return newType;
}

std::string StructCloner::writeClCopyNoPtrToPtrfull(llvm::StructType *ptrfullType,  std::string srcName, std::string destName) {
    string gencode = "";
    int srcidx = 0;
    int dstidx = 0;
    // outs() << "writeStructCopyCodeNoPointers " << dumpType(structType) << "\n";
    for(auto it=ptrfullType->element_begin(); it != ptrfullType->element_end(); it++) {
        Type *childType = *it;
        string childSrcName = srcName + ".f" + easycl::toString(srcidx);
        string childDstName = destName + ".f" + easycl::toString(dstidx);
        if(PointerType *pointerType = dyn_cast<PointerType>(childType)) {
            // ignore
            // srcidx++;
            // as long as not pointer to pointer, set to 0 for now (think about how to generalize better later)
            if(!isa<PointerType>(pointerType->getPointerElementType())) {
                // pointerType->getPointerElementType()->dump();
                // if(isa<PointerType>(pointerType->getPointerElementType())) {
                //     cout << "pointer elemnet type is also poitner" << endl;
                // }
                // cout << "writing " << childDstName + " = 0;" << endl;
                gencode += childDstName + " = 0;\n";
            }
            dstidx++;
            continue;
        } else if(StructType *childStructType = dyn_cast<StructType>(childType)) {
            gencode += writeClCopyNoPtrToPtrfull(childStructType, childSrcName, childDstName);
            srcidx++;
            dstidx++;
        } else if(childType->getPrimitiveSizeInBits() > 0 ) {
            gencode += childDstName + " = " + childSrcName + ";\n";
            // outs() << "copying " << dumpType(childType) << "\n";
            srcidx++;
            dstidx++;
        } else if(ArrayType *arrayType = dyn_cast<ArrayType>(childType)) {
            int numElements = arrayType->getNumElements();
            // outs() << "numlemenets " << numElements << "\n";
            for(int i=0; i < numElements; i++) {
                gencode += childDstName + "[" + easycl::toString(i) + "] = " + childSrcName + "[" + easycl::toString(i) +  "];\n";
            }
            srcidx++;
            dstidx++;
            // throw runtime_error("unhandled type " + dumpType(childType));
        } else {
            outs() << "unhandled type\n";
            childType->dump();
            outs() << "\n";
            // outs() << "unhandled type " + dumpType(childType) << "\n";
            throw runtime_error("unhandled type");
            srcidx++;
            dstidx++;
        }
    }
    return gencode;
}

llvm::Instruction *StructCloner::createHostsideIrCopyPtrfullToNoptr(
        llvm::Instruction *lastInst, StructType *srcType, Value *srcPointer, Value *dstPointer) {
    // assumes incoming values are pointers to struct
    LLVMContext &context = srcPointer->getContext();
    int srcidx = 0;
    int dstidx = 0;

    Indentor indentor;
    // indentor << "StructClone::createHostsideIrCopyPtrfullToNoptr() srcType=" << typeDumper->dumpType(srcType) << endl;
    // indentor << "  srcPointer type=" << typeDumper->dumpType(srcPointer->getType()->getPointerElementType()) <<
    //     " dstPointer type=" << typeDumper->dumpType(dstPointer->getType()->getPointerElementType()) << endl;

    PointerType *srcPointerType = cast<PointerType>(srcPointer->getType());
    StructType *srcStructType = cast<StructType>(srcPointerType->getElementType());
        for(auto it=srcStructType->element_begin(); it != srcStructType->element_end(); it++) {
            Type *srcChildType = *it;
            if(isa<PointerType>(srcChildType)) {
                // ignore
                srcidx++;
                continue;
            }
            Value *srcIndex[2];
            srcIndex[0] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
            srcIndex[1] = ConstantInt::getSigned(IntegerType::get(context, 32), srcidx);
            Instruction *childSrcInst = GetElementPtrInst::CreateInBounds(srcPointer, ArrayRef<Value *>(&srcIndex[0], &srcIndex[2]));
            childSrcInst->insertAfter(lastInst);
            lastInst = childSrcInst;

            Value *dstIndex[2];
            dstIndex[0] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
            dstIndex[1] = ConstantInt::getSigned(IntegerType::get(context, 32), dstidx);
            Instruction *childDstInst = GetElementPtrInst::CreateInBounds(dstPointer, ArrayRef<Value *>(&dstIndex[0], &dstIndex[2]));
            childDstInst->insertAfter(lastInst);
            lastInst = childDstInst;

            if(StructType *srcChildStructType = dyn_cast<StructType>(srcChildType)) {
                lastInst = createHostsideIrCopyPtrfullToNoptr(lastInst, srcChildStructType, childSrcInst, childDstInst);
            // } else if(IntegerType *intType = dyn_cast<IntegerType>(childType)) {
            } else if(srcChildType->getPrimitiveSizeInBits() > 0 ) {
                // do we have to do `load` followed by `store`?
                // outs() << "copying " << dumpType(childType) << "\n";
                // Instruction *alloca = new AllocaInst(intType, "allocateint");
                // alloca->insertAfter(lastInst);
                // lastInst = alloca;

                Instruction *load = new LoadInst(childSrcInst, "loadint");
                load->insertAfter(lastInst);
                lastInst = load;

                Instruction *store = new StoreInst(load, childDstInst);
                store->insertAfter(lastInst);
                lastInst = store;
            } else if(ArrayType *arrayType = dyn_cast<ArrayType>(srcChildType)) {
                int numElements = arrayType->getNumElements();
                // outs() << "numlemenets " << numElements << "\n";
                for(int i=0; i < numElements; i++) {
                    Value *arrayindex[2];
                    arrayindex[0] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
                    arrayindex[1] = ConstantInt::getSigned(IntegerType::get(context, 32), i);
                    Instruction *arrsrc = GetElementPtrInst::CreateInBounds(childSrcInst, ArrayRef<Value *>(&arrayindex[0], &arrayindex[2]));
                    arrsrc->insertAfter(lastInst);
                    lastInst = arrsrc;

                    Instruction *arraydst = GetElementPtrInst::CreateInBounds(childDstInst, ArrayRef<Value *>(&arrayindex[0], &arrayindex[2]));
                    arraydst->insertAfter(lastInst);
                    lastInst = arraydst;

                    Instruction *load = new LoadInst(arrsrc, "loadarr");
                    load->insertAfter(arraydst);
                    lastInst = load;

                    Instruction *store = new StoreInst(load, arraydst);
                    store->insertAfter(load);
                    lastInst = store;
                }
                // throw runtime_error("unhandled type " + dumpType(childType));
            } else {
                outs() << "unhandled type:\n";
                srcChildType->dump();
                outs() << "\n";
                throw runtime_error("structcloner unhandled type");
            }
            srcidx++;
            dstidx++;
        }
    // } else {
    //     outs() << "skipping type:\n";
    //     // structType->dump();
    //     outs() << "\n";
    // }
    return lastInst;
}

void StructCloner::walkType(Module *M, StructInfo *structInfo, int level, int offset, vector<int> indices, string path, Type *type) {
    if(StructType *structtype = dyn_cast<StructType>(type)) {
        walkStructType(M, structInfo, level, offset, indices, path, structtype);
    } else if(PointerType *pointerType = dyn_cast<PointerType>(type)) {
        Type *elementType = pointerType->getPointerElementType();
        // outs() << getIndent(level) << "pointer type " << dumpType(elementType) << " addressspace " << addressspace << " offset=" << offset << "\n";
        // outs() << level << " pointer type     offset=" << offset << "\n";
        // pointerType->dump();
        // outs() << '\n';
        // how to find out if this is gpu allocated or not?
        // let's just heuristically assume that all primitive*s are gpu allocated for now?
        // ~~and lets assume that structs are just sent one at a time now, and any contained structs are one at a time~~
        // ~~we can figure out how to generalize this later...~~
        // new plan: anything htats a pointer, we assume is going to be global, therefore we should remove
        // pointer to pointer is not allowed, so we should remove
        // actually, anything except float *s, we're just going to leave as-is (or set to zero), for now
        if(elementType->getPrimitiveSizeInBits() != 0) {
            // outs() << "primitive type size " << elementType->getPrimitiveSizeInBits() << "\n";
            structInfo->pointerInfos.push_back(unique_ptr<PointerInfo>(new PointerInfo(offset, pointerType, indices, path)));
        }
    } else if(isa<ArrayType>(type)) {
        // outs() << getIndent(level) << dumpType(elemType) << "[" << count << "] offset=" << offset << "\n";
    } else if(isa<IntegerType>(type)) {
        // outs() << getIndent(level) << "int" << bitwidth << " offset=" << offset << "\n";
    } else if(type->getPrimitiveSizeInBits() != 0) {
        // int bitwidth = intType->getBitWidth();
        // outs() << getIndent(level) << " someprimitive " << " offset=" << offset << "\n";
    } else {
        type->dump();
        throw runtime_error("walktype type not handled");
    }
}

void StructCloner::walkStructType(Module *M, StructInfo *structInfo, int level, int offset, vector<int> indices, string path, StructType *type) {
    // Type *type = value->getType();
    // if(isa<StructType>(type)) {
        // outs() << "walkvalue type is struct" << "\n";
        // walk each member of the struct

    // outs() << getIndent(level) << string(type->getName());
    // outs() << " offset=" << offset << " allocsize=" << M->getDataLayout().getTypeAllocSize(type) << "\n";
    int childoffset = offset;
    int i = 0;
    // Module *M = type->
    for(auto it=type->element_begin(); it != type->element_end(); it++) {
        Type *child = *it;
        // printIndent(level);
        // outs() << getIndent(level) + "child type " << dumpType(child) << "\n";
        vector<int> childindices(indices);
        childindices.push_back(i);
        walkType(M, structInfo, level + 1, childoffset, childindices, path + ".f" + easycl::toString(i), child);
        childoffset += M->getDataLayout().getTypeAllocSize(child);
        i++;
    }

    // } else {
    //     throw runtime_error("walkvalue unhandled type " + dumpType(type));
    // }
    //     throw runtime_error("walkvalue unhandled type " + dumpType(type));
    // }
}

/*
void declareStructNoPointers(string name, StructType *type) {
    LLVMContext &context = type->getContext();
    // writes out the declaration to declarations_to_write
    // its not hte only way of doing this, nor necessarily the best, but seems easier than
    // eg querying global vraibales by hand
    std::string declaration = "";
    declaration += name + " {\n";
    int i = 0;
    for(auto it=type->element_begin(); it != type->element_end(); it++) {
        Type *elementType = *it;
        // bool isPtrPtrFunction = false;
        // if(PointerType *ptr = dyn_cast<PointerType>(elementType)) {
        //     Type *ptrElementType = ptr->getPointerElementType();
        //     if(PointerType *ptrptr = dyn_cast<PointerType>(ptrElementType)) {
        //         Type *ptrptrElementType = ptrptr->getPointerElementType();
        //         isPtrPtrFunction = isa<FunctionType>(ptrptrElementType);
        //     }
        // }
        // if(isPtrPtrFunction) {
        //     // we can ignore functions, whilst dumping structs
        //     continue;
        // }
        std::string memberName = "f" + toString(i);
        if(ArrayType *arraytype = dyn_cast<ArrayType>(elementType)) {
            Type *arrayelementtype = arraytype->getPointerElementType();
            // outs() << "arrayelementtype " << dumpType(arrayelementtype) << "\n";
            int numElements = arraytype->getNumElements();
            // // outs() << "numelements " << numElements << "\n";
            declaration += "    " + dumpType(arrayelementtype) + " ";
            declaration += memberName + "[" + toString(numElements) + "];\n";
            //throw runtime_error("not implemented declarestruct for arraytype elements");
        } else {
            declaration += "    ";
            // if its a pointer, we skip it, otherwise we handle it
            if(!isa<PointerType>(elementType)) {
                declaration += dumpTypeNoPointers(elementType) + " " + memberName + ";\n";
            }
        }
        i++;
    }
    declaration += "};\n";
    declarations_to_write += declaration + "\n";
    // outs() << "declarations_to_write " << declarations_to_write << "\n";
}

std::string dumpStructTypeNoPointers(StructType *type) {
    LLVMContext &context = type->getContext();
    // outs() << "dumpstructtype" << "\n";
    if(type->hasName()) {
        string name = type->getName();
        // outs() << "name " << name << "\n";
        name = replace(name, '.', '_');
                name = replace(name, ':', '_');
        if(name == "struct_float4") {
            return "float4";
        } else {
            if(name.find("struct_") == 0) {
                name[6] = ' ';
                name += "_nopointers";
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStructNoPointers(name, type);
                }
                return name;
            } else if(name.find("class_") != string::npos) {
                // name[5] = '_';
                name = "struct " + name;
                name += "_nopointers";
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStructNoPointers(name, type);
                }
                return name;
            } else {
                name = "struct " + name;
                name += "_nopointers";
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStructNoPointers(name, type);
                }
                return name;
                // outs() << "struct name: " << name << "\n";
                // throw runtime_error("dumpStructType() not implemented: struct name " + name);
            }
        }
    } else {
        throw runtime_error("not implemented: anonymous struct types");
    }
}

std::string dumpTypeNoPointers(Type *type) {
    LLVMContext &context = type->getContext();
    Type::TypeID typeID = type->getTypeID();
    switch(typeID) {
        case Type::VoidTyID:
            return "void";
        case Type::FloatTyID:
            return "float";
        // case Type::UnionTyID:
        //     throw runtime_error("not implemented: union type");
        case Type::StructTyID:
            return dumpStructTypeNoPointers(cast<StructType>(type));
        case Type::VectorTyID:
            throw runtime_error("not implemented: vector type");
        // case Type::ArrayTyID:
        //     return dumpArrayType(cast<ArrayType>(type));
        case Type::DoubleTyID:
            if(single_precision) {
                return "float";
            } else {
                return "double";
            }
        // case Type::FunctionTyID:
        //     return dumpFunctionType(cast<FunctionType>(type));
        // case Type::PointerTyID:
        //     return dumpPointerType(cast<PointerType>(type));
        case Type::IntegerTyID:
            return dumpIntegerType(cast<IntegerType>(type));
        // default:
        //     outs() << "type id " << typeID << "\n";
        //     throw runtime_error("unrecognized type");
    }
    return "";
}
*/

} // namespace cocl
