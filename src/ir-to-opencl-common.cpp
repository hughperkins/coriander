#include <iostream>
#include <sstream>
#include <set>

#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_os_ostream.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include "ir-to-opencl-common.h"

using namespace std;
using namespace llvm;

std::string dumpType(Type *type);

extern bool single_precision;
// extern llvm::LLVMContext TheContext;

static std::string declarations_to_write = "";

std::string getDeclarationsToWrite() {
    return declarations_to_write;
}
std::set<string> declaredStructs;

GlobalVariable *addGlobalVariable(Module *M, string name, string value) {
    // string name = ".mystr1";
    // string desiredString = value;
    int N = value.size() + 1;
    LLVMContext &context = M->getContext();
    ArrayType *strtype = ArrayType::get(IntegerType::get(context, 8), N);
    M->getOrInsertGlobal(StringRef(name), strtype);
    // ConstantDataSequential *charConstSeq = cast<ConstantDataSequential>(charConst);

    ConstantDataArray *constchararray = cast<ConstantDataArray>(ConstantDataArray::get(context, ArrayRef<uint8_t>((uint8_t *)value.c_str(), N)));
    GlobalVariable *str = M->getNamedGlobal(StringRef(name));
    str->setInitializer(constchararray);
    return str;
}

std::string dumpAddressSpace(llvm::Type *type) {
    if(PointerType *ptr = dyn_cast<PointerType>(type)) {
        int addressspace = ptr->getAddressSpace();
        switch(addressspace) {
            case 0:
                return "";
            case 1:
                return "global";
            case 3:
                return "local";
            default:
                throw runtime_error("not implemented, addressspace " + toString(addressspace));
        }
    } else {
        return "";
    }
}

Instruction *addStringInstr(Module *M, string name, string value) {
    // Module *M = prev->getParent();
    GlobalVariable *var = addGlobalVariable(M, name, value);

    int N = value.size() + 1;
    LLVMContext &context = M->getContext();
    ArrayType *arrayType = ArrayType::get(IntegerType::get(context, 8), N);
    Value * indices[2];
    indices[0] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
    indices[1] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
    GetElementPtrInst *elem = GetElementPtrInst::CreateInBounds(arrayType, var, ArrayRef<Value *>(indices, 2));
    // elem->insertAfter(prev);
    return elem;
}

std::string dumpFunctionType(FunctionType *fn) {
    cout << "function" << endl;
    // cout << "name " << string(fn->getName()) << endl;
    std::string params_str = "";
    int i = 0;
    for(auto it=fn->param_begin(); it != fn->param_end(); it++) {
        Type * paramType = *it;
        if(i > 0) {
            params_str += ", ";
        }
        params_str += dumpType(paramType);
        i++;
    }
    cout << "params_str " << params_str << endl;
    return params_str;
}

std::string dumpPointerType(PointerType *ptr) {
    string gencode = "";
    Type *elementType = ptr->getPointerElementType();
    string elementTypeString = dumpType(elementType);
    int addressspace = ptr->getAddressSpace();
    if(addressspace == 1) {
        gencode += "global ";
    }
    if(addressspace == 3) {
        gencode += "local ";
    }
    gencode += elementTypeString + "*";
    return gencode;
}

std::string dumpIntegerType(IntegerType *type) {
    switch(type->getPrimitiveSizeInBits()) {
        case 32:
            return "int";
        case 64:
            return "long";
        case 16:
            return "short";
        case 8:
            return "char";
        case 1:
            return "bool";
        default:
            cout << "integer size " << type->getPrimitiveSizeInBits() << endl;
            throw runtime_error("unrecognized size");
    }
}

void declareStruct(string name, StructType *type) {
    // writes out the declaration to declarations_to_write
    // its not hte only way of doing this, nor necessarily the best, but seems easier than
    // eg querying global vraibales by hand
    std::string declaration = "";
    // declaredStructs.add()
    declaration += name + " {\n";
    int i = 0;
    for(auto it=type->element_begin(); it != type->element_end(); it++) {
        Type *elementType = *it;
        declaration += "    " + dumpType(elementType) + " f" + toString(i) + ";\n";
        i++;
    }
    declaration += "};\n";
    declarations_to_write += declaration + "\n";
    cout << "declarations_to_write " << declarations_to_write << endl;
}

std::string dumpStructType(StructType *type) {
    if(type->hasName()) {
        string name = type->getName();
        if(name == "struct.float4") {
            return "float4";
        } else {
            if(name.find("struct.") != string::npos) {
                name[6] = ' ';
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStruct(name, type);
                }
                return name;
            } else if(name.find("class.") != string::npos) {
                // name = "struct " + "class_" + name.substr(6);
                name[5] = '_';
                name = "struct " + name;
                size_t pos = name.find(':');
                while(pos != string::npos) {
                    name[pos] = '_';
                    pos = name.find(':');
                }
                cout << "name " << name << endl;
                // name[5] = ' ';
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStruct(name, type);
                }
                return name;
            } else {
                cout << "struct name: " << name << endl;
                throw runtime_error("dumpStructType() not implemented: struct name " + name);
            }
        }
    } else {
        throw runtime_error("not implemented: anonymous struct types");
    }
}

std::string dumpArrayType(ArrayType *type) {
    int length = type->getNumElements();
    // cout << "array length " << length << endl;
    Type *elementType = type->getElementType();
    // cout << "elemtn type " << dumpType(elementType) << endl;
    // throw runtime_error("not implemented: array type");
    // return "";
    return dumpType(elementType) + "[" + toString(length) + "]";
}

std::string dumpType(Type *type) {
    Type::TypeID typeID = type->getTypeID();
    switch(typeID) {
        case Type::VoidTyID:
            return "void";
        case Type::FloatTyID:
            return "float";
        // case Type::UnionTyID:
        //     throw runtime_error("not implemented: union type");
        case Type::StructTyID:
            return dumpStructType((StructType *)type);
        case Type::VectorTyID:
            throw runtime_error("not implemented: vector type");
        case Type::ArrayTyID:
            return dumpArrayType(cast<ArrayType>(type));
        case Type::DoubleTyID:
            if(single_precision) {
                return "float";
            } else {
                return "double";
            }
        case Type::FunctionTyID:
            return dumpFunctionType(dyn_cast<FunctionType>(type));
        case Type::PointerTyID:
            // cout << "pointer type" << endl;
            return dumpPointerType((PointerType *)type);
        case Type::IntegerTyID:
            return dumpIntegerType((IntegerType *)type);
        default:
            cout << "type id " << typeID << endl;
            throw runtime_error("unrecognized type");
    }
}

llvm::Constant *createInt32Constant(llvm::LLVMContext *context, int value) {
    return ConstantInt::getSigned(IntegerType::get(*context, 32), value);
}

int readInt32Constant(Value *value) {
    // unsigned int valueTy = value->getValueID();
    // // cout << "readIntConstant" << endl;
    // // value->dump();
    // if(valueTy != AShrOperator::ConstantIntVal) {
    //     throw runtime_error("not a constant int");
    // }
    return cast<ConstantInt>(value)->getSExtValue();
}

float readFloatConstant(Value *value) {
    // unsigned int valueTy = value->getValueID();
    // if(valueTy != AShrOperator::ConstantFPVal) {
    //     throw runtime_error("not a constant float");
    // }
    return cast<ConstantFP>(value)->getValueAPF().convertToFloat();
}
