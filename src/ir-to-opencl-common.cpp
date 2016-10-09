// #include <iostream>
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
#include "llvm/Support/raw_os_ostream.h"

#include "ir-to-opencl-common.h"

using namespace std;
using namespace llvm;

std::string dumpType(Type *type);

extern bool single_precision;

static std::string declarations_to_write = "";

std::string getDeclarationsToWrite() {
    return declarations_to_write;
}
std::set<string> declaredStructs;

GlobalVariable *addGlobalVariable(Module *M, string name, string value) {
    int N = value.size() + 1;
    LLVMContext &context = M->getContext();
    ArrayType *strtype = ArrayType::get(IntegerType::get(context, 8), N);
    M->getOrInsertGlobal(StringRef(name), strtype);
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
    // check if already exists first
    GlobalVariable *probe = M->getNamedGlobal(name);
    outs() << "addStringInstr probe=" << probe << "\n";
    if(probe != 0) {
        outs() << "string aleady exists, reusing  " << "\n";
        return addStringInstrExistingGlobal(M, name);
    }

    GlobalVariable *var = addGlobalVariable(M, name, value);

    int N = value.size() + 1;
    LLVMContext &context = M->getContext();
    ArrayType *arrayType = ArrayType::get(IntegerType::get(context, 8), N);
    Value * indices[2];
    indices[0] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
    indices[1] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
    GetElementPtrInst *elem = GetElementPtrInst::CreateInBounds(arrayType, var, ArrayRef<Value *>(indices, 2));
    return elem;
}

Instruction *addStringInstrExistingGlobal(Module *M, string name) {
    // GlobalVariable *var = addGlobalVariable(M, name, value);
    GlobalVariable *var = M->getNamedGlobal(name);

    Type *varType = var->getType();
    if(ArrayType *arrayType1 = dyn_cast<ArrayType>(varType->getPointerElementType())) {
        int N = arrayType1->getNumElements();

        LLVMContext &context = M->getContext();
        ArrayType *arrayType = ArrayType::get(IntegerType::get(context, 8), N);
        // Type *varType = var->getType();
        // outs() << "arrayType->dump()" << "\n";
        // ArrayType *elemType = cast<ArrayType>(varType->getPointerElementType());
        // elemType->dump();
        // outs() << "\n";
        // outs() << "numelements " << elemType->getNumElements() << "\n";
        // return 0;
        Value * indices[2];
        indices[0] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
        indices[1] = ConstantInt::getSigned(IntegerType::get(context, 32), 0);
        GetElementPtrInst *elem = GetElementPtrInst::CreateInBounds(arrayType, var, ArrayRef<Value *>(indices, 2));
        return elem;
    } else {
        throw runtime_error("unexpected type at addStringInstrExistingGlobal, not an arraytype");
    }
}

std::string dumpFunctionType(FunctionType *fn) {
    outs() << "function" << "\n";
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
    outs() << "params_str " << params_str << "\n";
    return params_str;
}

std::string dumpPointerType(PointerType *ptr) {
    string gencode = "";
    Type *elementType = ptr->getPointerElementType();
    string elementTypeString = dumpType(elementType);
    int addressspace = ptr->getAddressSpace();
    string addressspacestr = "";
    if(addressspace == 1) {
        addressspacestr = "global";
    }
    if(addressspace == 3) {
        addressspacestr = "local";
    }
    if(addressspace == 4) {
        addressspacestr = "constant";
    }
    // we're just going to hackily assume that anything that is `global **` should be `global * global *`
    if(isa<PointerType>(ptr->getPointerElementType())) {
        return "global " + elementTypeString + addressspacestr + " *";
    }
    if(addressspacestr != "") {
        gencode += addressspacestr + " ";
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
            outs() << "integer size " << type->getPrimitiveSizeInBits() << "\n";
            throw runtime_error("unrecognized size");
    }
}

void declareStruct(string name, StructType *type) {
    // writes out the declaration to declarations_to_write
    // its not hte only way of doing this, nor necessarily the best, but seems easier than
    // eg querying global vraibales by hand
    std::string declaration = "";
    declaration += name + " {\n";
    int i = 0;
    for(auto it=type->element_begin(); it != type->element_end(); it++) {
        Type *elementType = *it;
        bool isPtrPtrFunction = false;
        if(PointerType *ptr = dyn_cast<PointerType>(elementType)) {
            Type *ptrElementType = ptr->getPointerElementType();
            if(PointerType *ptrptr = dyn_cast<PointerType>(ptrElementType)) {
                Type *ptrptrElementType = ptrptr->getPointerElementType();
                isPtrPtrFunction = isa<FunctionType>(ptrptrElementType);
            }
        }
        if(isPtrPtrFunction) {
            // we can ignore functions, whilst dumping structs
            continue;
        }
        std::string memberName = "f" + toString(i);
        if(ArrayType *arraytype = dyn_cast<ArrayType>(elementType)) {
            Type *arrayelementtype = arraytype->getPointerElementType();
            // outs() << "arrayelementtype " << dumpType(arrayelementtype) << "\n";
            int numElements = arraytype->getNumElements();
            // outs() << "numelements " << numElements << "\n";
            declaration += "    " + dumpType(arrayelementtype) + " ";
            declaration += memberName + "[" + toString(numElements) + "];\n";
            // throw runtime_error("not implemented declarestruct for arraytype elements");
        } else {
            declaration += "    ";
            // if its a pointer, lets assume its global, for now
            if(PointerType *ptr = dyn_cast<PointerType>(elementType)) {
                declaration += "global ";
            }
            declaration += dumpType(elementType) + " " + memberName + ";\n";
        }
        i++;
    }
    declaration += "};\n";
    declarations_to_write += declaration + "\n";
    // outs() << "declarations_to_write " << declarations_to_write << "\n";
}

std::string replace(std::string target, char old_char, char new_char) {
    size_t pos = target.find(old_char);
    while(pos != string::npos) {
        target[pos] = new_char;
        pos = target.find(old_char);
    }
    return target;
}

std::string dumpStructType(StructType *type) {
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
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStruct(name, type);
                }
                return name;
            } else if(name.find("class_") != string::npos) {
                // name[5] = '_';
                name = "struct " + name;
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStruct(name, type);
                }
                return name;
            } else {
                name = "struct " + name;
                if(declaredStructs.find(name) == declaredStructs.end()) {
                    declaredStructs.insert(name);
                    declareStruct(name, type);
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

std::string dumpArrayType(ArrayType *type) {
    int length = type->getNumElements();
    Type *elementType = type->getElementType();
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
            return dumpStructType(cast<StructType>(type));
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
            return dumpFunctionType(cast<FunctionType>(type));
        case Type::PointerTyID:
            return dumpPointerType(cast<PointerType>(type));
        case Type::IntegerTyID:
            return dumpIntegerType(cast<IntegerType>(type));
        default:
            outs() << "type id " << typeID << "\n";
            throw runtime_error("unrecognized type");
    }
}

llvm::Constant *createInt32Constant(llvm::LLVMContext *context, int value) {
    return ConstantInt::getSigned(IntegerType::get(*context, 32), value);
}

int readInt32Constant(Value *value) {
    return cast<ConstantInt>(value)->getSExtValue();
}

float readFloatConstant(Value *value) {
    return cast<ConstantFP>(value)->getValueAPF().convertToFloat();
}
