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

// input: IR from cuda compilation

#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"
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
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <map>
#include <set>
#include <iostream>
#include <stdexcept>
#include <sstream>
#include <fstream>

using namespace llvm;
using namespace std;

#include "ir-to-opencl-common.h"

static llvm::LLVMContext TheContext;
static llvm::IRBuilder<> Builder(TheContext);
static std::unique_ptr<llvm::Module> TheModule;
static std::map<std::string, Value *> NamedValues;
static std::map<string, bool> iskernel_by_name;
static std::set<string> ignoredFunctionNames;
static std::map<string, string> knownFunctionsMap; // from cuda to opencl, eg tid.x => get_global_id

map<Value *, string> nameByValue;
static int nextNameIdx;
static string currentFunctionSharedDeclarations = "";

static bool debug;
bool single_precision = true;

static int instructions_processed = 0;

std::string dumpInstruction(Instruction *instruction);

std::string dumpValue(Value *value) {
    std::string gencode = "";
    unsigned int valueTy = value->getValueID();
    switch(valueTy) {
        case AShrOperator::ConstantIntVal:
            cout << "constant " << (cast<ConstantInt>(value))->getSExtValue() << endl;
    }
    string name = nameByValue[value];
    gencode += name;
    return gencode;
}

string dumpConstant(Constant *constant) {
    unsigned int valueTy = constant->getValueID();
    ostringstream oss;
    // if(valueTy == AShrOperator::ConstantIntVal) {
    // cout << "constant" << endl;
    if(ConstantInt *constantInt = dyn_cast<ConstantInt>(constant)) {
        // cout << "constantint" << endl;
        oss << constantInt->getSExtValue();
    } else if(isa<ConstantStruct>(constant)) {
        throw runtime_error("constantStruct not implemented in dumpconstnat");
    } else if(ConstantExpr *expr = dyn_cast<ConstantExpr>(constant)) {
        cout << "constantexp" << endl;
        cout << "opcode name " << expr->getOpcodeName() << endl;
        Instruction *instr = expr->getAsInstruction();
        instr->dump();
        cout << dumpInstruction(instr) << endl;
        return dumpInstruction(instr);
        // throw runtime_error("ConstantExpr not implemented in dumpconstnat");
    } else if(ConstantFP *constantFP = dyn_cast<ConstantFP>(constant)) {
        // cout << "constantfp" << endl;
        float floatvalue = constantFP->getValueAPF().convertToFloat();
        // cout << "floatvalue " << floatvalue << endl;
        ostringstream oss;
        oss << floatvalue;
        string floatvaluestr = oss.str();
        if(single_precision) {
            if(floatvaluestr.find('.') == string::npos) {
                floatvaluestr += ".0";
            }
            floatvaluestr += "f";
        }
        return floatvaluestr;
    } else if(GlobalValue *global = dyn_cast<GlobalValue>(constant)) {
        cout << "globalvalue" << endl;
        // PointerType *pointerType = global->getType();
        // Type *elementType = pointerType->getPointerElementType();
        // cout << "element type " << elementType << endl;
        // oss << dumpType(elementType) << endl;
        oss << string(global->getName());
        // cout << "constant has name " << constant->hasName() << " " << string(constant->getName()) << endl;
    } else if(isa<UndefValue>(constant)) {
        cout << "undef" << endl;
        return "";
    } else {
        cout << "valueTy " << valueTy << endl;
        // cout << GlobalValue::classof(constant) << endl;
        oss << "unknown";
        constant->dump();
        throw runtime_error("unknown constnat type");
    }
    return oss.str();
}


//     return cast<ConstantInt>(value)->getSExtValue();
// }

// float readFloatConstant(Value *value) {
//     return cast<ConstantFP>(value)->getValueAPF().convertToFloat();

string dumpOperand(Value *value) {
    unsigned int valueTy = value->getValueID();
    // cout << "dumpOperand " << endl;
    if(Constant *constant = dyn_cast<Constant>(value)) {
        // cout << "constant" << endl;
        // constant->dump();
        return dumpConstant(constant);
        // if(valueTy == AShrOperator::ConstantIntVal) {
        //     int intvalue = readInt32Constant(value);
        //     ostringstream oss;
        //     oss << intvalue;
        //     return oss.str();
        // }
        // if(valueTy == AShrOperator::ConstantFPVal) {
        //     float floatvalue = readFloatConstant(value);
        //     ostringstream oss;
        //     oss << floatvalue;
        //     string floatvaluestr = oss.str();
        //     if(single_precision) {
        //         if(floatvaluestr.find('.') == string::npos) {
        //             floatvaluestr += ".0";
        //         }
        //         floatvaluestr += "f";
        //     }
        //     return floatvaluestr;
        // }
    }
    // if(GlobalVariable *glob = dyn_cast<GlobalVariable>(value)) {
    //     cout << "global variable " << string(glob->getName()) << endl;
    //     return string(glob->getName());
    // }
    string name = nameByValue[value];
    // cout << "dumpOperand name " << name << endl;
    // value->dump();
    // cout << "op type name " << dumpType(value->getType()) << endl;
    // cout << "is bitcast " << isa<BitCastInst>(value) << endl;
    // cout << "is addrspacecast " << isa<AddrSpaceCastInst>(value) << endl;
    // cout << "is globavalue " << isa<GlobalValue>(value) << endl;
    // cout << "is instruction " << isa<Instruction>(value) << endl;
    // cout << "is constant " << isa<Constant>(value) << endl;
    // cout << "is pointer " << isa<Po>(value) << endl;
    return name;
}

void storeValueName(Value *value) {
    if(value->hasName()) {
        string name = string(value->getName());
        if(name[0] == '.') {
            name = "v" + name;
        }
        size_t pos = name.find(".");
        while(pos != string::npos) {
            name[pos] = '_';
            pos = name.find(".");
        }
        nameByValue[value] = name;
    } else {
        int idx = nextNameIdx;
        nextNameIdx++;
        ostringstream oss;
        oss << "v" << idx;
        string name = oss.str();
        nameByValue[value] = name;
    }
}

std::string dumpReturn(ReturnInst *retInst) {
    std::string gencode = "";
    Value *retValue = retInst->getReturnValue();
    if(retValue != 0) {
        gencode += "return " + dumpOperand(retValue) + ";\n";
    }
    return gencode;
}

std::string dumpAlloca(Instruction *alloca) {
    // std::string gencode = "";
    PointerType *ptrElementType = cast<PointerType>(alloca->getType()->getPointerElementType());
    std::string typestring = dumpType(ptrElementType);
    cout << "alloca typestring " << typestring << endl;
    int count = readInt32Constant(alloca->getOperand(0));
    cout << "count " << count << endl;
    if(count == 1) {
        if(ArrayType *arrayType = dyn_cast<ArrayType>(ptrElementType)) {
            cout << "its an array" << endl;
            int innercount = arrayType->getNumElements();
            cout << "length " << innercount << endl;
            Type *elementType = arrayType->getElementType();
            cout << "element type " << dumpType(elementType) << endl;
            // throw runtime_error("not implemented: alloca for arraytype");
            return dumpType(elementType) + " " + dumpOperand(alloca) + "[" + toString(innercount) + "];\n";
        } else {
            return typestring + " " + dumpOperand(alloca) + "[1];\n";
        }
    } else {
        throw runtime_error("not implemented: alloca for count != 1");
    }
}

void updateAddressSpace(Value *value, int newSpace) {
    Type *elementType = value->getType()->getPointerElementType();
    Type *newType = PointerType::get(elementType, newSpace);
    value->mutateType(newType);
}

void copyAddressSpace(Value *dest, Value *src) {
    // copies address space from src value to dest value
    int srcTypeID = src->getType()->getTypeID();
    if(srcTypeID != Type::PointerTyID) { // not a pointer, so skipe
        return;
    }
    PointerType *srcType = cast<PointerType>(src->getType());
    int addressspace = srcType->getAddressSpace();
    if(addressspace != 0) {
        updateAddressSpace(dest, addressspace);
    }
}

string dumpLoad(LoadInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = " + dumpOperand(instr->getOperand(0)) + "[0];\n";
    return gencode;
}

string dumpStore(StoreInst *instr) {
    string gencode = "";
    gencode += dumpOperand(instr->getOperand(1)) + "[0] = " + dumpOperand(instr->getOperand(0)) + ";\n";
    return gencode;
}

void addSharedDeclaration(Value *value) {
    value ->dump();
    if(nameByValue.find(value) != nameByValue.end()) {
        return;
    }
    GlobalVariable *glob = cast<GlobalVariable>(value);
    string name = glob->getName();
    cout << name << endl;
    string declaration = "";
    Type *type = glob->getType();
    type->dump();
    ArrayType *arraytype = cast<ArrayType>(type->getPointerElementType());
    arraytype->dump();
    int length = arraytype->getNumElements();
    Type *elementType = arraytype->getElementType();
    string typestr = dumpType(elementType);
    declaration += "    local " + typestr + " " + name + "[" + toString(length) + "];\n";
    if(debug) {
        cout << declaration << endl;
    }
    nameByValue[value] = name;
    currentFunctionSharedDeclarations += declaration;
}

string dumpGetElementPtr(GetElementPtrInst *instr) {
    string gencode = "";
    int numOperands = instr->getNumOperands();
    Type *currentType = instr->getOperand(0)->getType();
    string rhs = "";
    rhs += "" + dumpOperand(instr->getOperand(0));
    copyAddressSpace(instr, instr->getOperand(0));
    int addressspace = cast<PointerType>(instr->getOperand(0)->getType())->getAddressSpace();
    if(addressspace == 3) { // local/shared memory
        cout << "got access to local memory." << endl;
        cout << "dumpoperand(instr) " << dumpOperand(instr) << endl;
        // pointer into shared memory.
        addSharedDeclaration(instr->getOperand(0));
        cout << "rhs " << rhs << endl;
        // throw runtime_error("dumpgep stop");
    }
    for(int d=0; d < numOperands - 1; d++) {
        Type *newType = 0;
        if(currentType->isPointerTy() || isa<ArrayType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    rhs = "(&" + rhs + ")";
                }
            }
            rhs += string("[") + dumpOperand(instr->getOperand(d + 1)) + "]";
            newType = currentType->getPointerElementType();
        } else if(currentType->isStructTy()) {
            StructType *structtype = cast<StructType>(currentType);
            string structName = structtype->getName();
            if(structName == "struct.float4") {
                int idx = readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, addressspace);
                newType = elementType;
                rhs = "((" + dumpType(castType) + ")&" + rhs + ")";
                rhs += string("[") + toString(idx) + "]";
            } else {
                // generic struct
                int idx = readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                rhs += string(".f") + toString(idx);
                newType = elementType;
            }
        } else {
            currentType->dump();
            throw runtime_error("type not implemented in gpe");
        }
        currentType = newType;
    }
    rhs = "&" + rhs;
    Type *lhsType = PointerType::get(currentType, addressspace);
    gencode += dumpType(lhsType) + " " + dumpOperand(instr) + " = " + rhs;
    gencode += ";\n";
    return gencode;
}

std::string dumpInsertValue(InsertValueInst *instr) {
    string gencode = "";
    string lhs = "";
    string incomingOperand = dumpOperand(instr->getOperand(0));
    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getType();
    bool declaredVar = false;
    if(incomingOperand == "") {
        gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + ";\n";
        gencode += "    ";
        incomingOperand = dumpOperand(instr);
        declaredVar = true;
    }
    lhs += incomingOperand;
    ArrayRef<unsigned> indices = instr->getIndices();
    int numIndices = instr->getNumIndices();
    for(int d=0; d < numIndices; d++) {
        int idx = indices[d];
        Type *newType = 0;
        if(currentType->isPointerTy() || isa<ArrayType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    lhs = "(&" + lhs + ")";
                }
            }
            lhs += string("[") + dumpOperand(instr->getOperand(d + 1)) + "]";
            newType = currentType->getPointerElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = structtype->getName();
            if(structName == "struct.float4") {
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, 0);
                newType = elementType;
                lhs = "((" + dumpType(castType) + ")&" + lhs + ")";
                lhs += string("[") + toString(idx) + "]";
            } else {
                // generic struct
                Type *elementType = structtype->getElementType(idx);
                lhs += string(".f") + toString(idx);
                newType = elementType;
            }
        } else {
            currentType->dump();
            throw runtime_error("type not implemented in insertvalue");
        }
        currentType = newType;
    }
    gencode += lhs + " = " + dumpOperand(instr->getOperand(1)) + ";\n";
    if(!declaredVar) {
        gencode += "    " + dumpType(instr->getType()) + " " + dumpOperand(instr) + " = " + incomingOperand + ";\n";
    }
    return gencode;
}

std::string dumpExtractValue(ExtractValueInst *instr) {
    string gencode = "";
    string lhs = "";
    string incomingOperand = dumpOperand(instr->getAggregateOperand());
    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getAggregateOperand()->getType();
    lhs += incomingOperand;
    ArrayRef<unsigned> indices = instr->getIndices();
    int numIndices = instr->getNumIndices();
    for(int d=0; d < numIndices; d++) {
        int idx = indices[d];
        Type *newType = 0;
        if(currentType->isPointerTy() || isa<ArrayType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    lhs = "(&" + lhs + ")";
                }
            }
            lhs += string("[") + dumpOperand(instr->getOperand(d + 1)) + "]";
            newType = currentType->getPointerElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = structtype->getName();
            if(structName == "struct.float4") {
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, 0);
                newType = elementType;
                lhs = "((" + dumpType(castType) + ")&" + lhs + ")";
                lhs += string("[") + toString(idx) + "]";
            } else {
                // generic struct
                Type *elementType = structtype->getElementType(idx);
                lhs += string(".f") + toString(idx);
                newType = elementType;
            }
        } else {
            currentType->dump();
            throw runtime_error("type not implemented in extractvalue");
        }
        currentType = newType;
    }
    gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + " = " + lhs + ";\n";
    return gencode;
}

std::string dumpBinaryOperator(BinaryOperator *instr, std::string opstring) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    Value *op1 = instr->getOperand(0);
    gencode += dumpValue(op1) + " ";
    gencode += opstring + " ";
    Value *op2 = instr->getOperand(1);
    gencode += dumpOperand(op2) + ";\n";
    return gencode;
}

std::string dumpBitcast(BitCastInst *instr) {
    string gencode = "";
    Value *op0 = instr->getOperand(0);
    // Type *op0type = instr->getOperand(0)->getType();
    copyAddressSpace(instr, instr->getOperand(0));
    gencode += dumpType(instr->getType());
    gencode += dumpOperand(instr) + " = (" + dumpType(instr->getType()) + ")" + dumpOperand(op0) + ";\n";
    return gencode;
}

std::string dumpAddrSpaceCast(AddrSpaceCastInst *instr) {
    string gencode = "";
    cout << "addrspacecast";
    copyAddressSpace(instr, instr->getOperand(0));
    gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + " = ";
    gencode += "(" + dumpType(instr->getType()) + ")" + dumpOperand(instr->getOperand(0)) + ";\n";
    // throw runtime_error("not implemented");
    return gencode;
}

std::string dumpMemcpyCharCharLong(CallInst *instr) {
    std::string gencode = "";
        // int intvalue = readInt32Constant(value);
    int totalLength = cast<ConstantInt>(instr->getOperand(2))->getSExtValue();
    cout << "totalLength " << totalLength << endl;
    int align = cast<ConstantInt>(instr->getOperand(3))->getSExtValue();
    cout << "align " << align << endl;
    string dstAddressSpaceStr = dumpAddressSpace(instr->getOperand(0)->getType());
    string srcAddressSpaceStr = dumpAddressSpace(instr->getOperand(1)->getType());
    string elementTypeString = "";
    if(align == 4) {
        elementTypeString = "int";
    } else if(align == 8) {
        elementTypeString = "int2";
    } else if(align == 16) {
        elementTypeString = "int4";
    } else {
        throw runtime_error("not implemented dumpmemcpy for align " + toString(align));
    }
    int numElements = totalLength / align;
    if(numElements >1) {
        gencode += "#pragma unroll\n";
        gencode += "    for(int __i=0; __i < " + toString(numElements) + "; __i++) {\n";
        gencode += "        ((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(0)) + ")[__i] = ";
        gencode += "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(1)) + ")[__i];\n";
        gencode += "    }\n";
    } else {
        gencode += "((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(0)) + ")[0] = ";
        gencode += "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(1)) + ")[0];\n";
    }
    return gencode;
}

std::string dumpCall(CallInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    if(typestr != "void") {
        gencode += typestr + " " + dumpOperand(instr) + " = ";
    }

    string functionName = string(instr->getCalledValue()->getName());
    if(functionName == "llvm.ptx.read.tid.x") {
        return gencode + "get_global_id(0);\n";
    }
    if(functionName == "llvm.ptx.read.tid.y") {
        return gencode + "get_global_id(1);\n";
    }
    if(functionName == "llvm.ptx.read.tid.z") {
        return gencode + "get_global_id(2);\n";
    }
    if(functionName == "llvm.ptx.read.ctaid.x") {
        return gencode + "get_group_id(0);\n";
    }
    if(functionName == "llvm.ptx.read.ctaid.y") {
        return gencode + "get_group_id(1);\n";
    }
    if(functionName == "llvm.ptx.read.ctaid.z") {
        return gencode + "get_group_id(2);\n";
    }
    if(functionName == "llvm.ptx.read.nctaid.x") {
        return gencode + "get_num_groups(0);\n";
    }
    if(functionName == "llvm.ptx.read.nctaid.y") {
        return gencode + "get_num_groups(1);\n";
    }
    if(functionName == "llvm.ptx.read.nctaid.z") {
        return gencode + "get_num_groups(2);\n";
    }
    if(functionName == "llvm.ptx.read.ntid.x") {
        return gencode + "get_local_size(0);\n";
    }
    if(functionName == "llvm.ptx.read.ntid.y") {
        return gencode + "get_local_size(1);\n";
    }
    if(functionName == "llvm.ptx.read.ntid.z") {
        return gencode + "get_local_size(2);\n";
    }
    if(functionName == "llvm.cuda.syncthreads") {
        return gencode + "barrier(CLK_GLOBAL_MEM_FENCE);\n";
    }
    if(functionName == "llvm.lifetime.start") {
        return "";  // just ignore for now
    }
    if(functionName == "llvm.lifetime.end") {
        return "";  // just ignore for now
    }
    if(functionName == "llvm.memcpy.p0i8.p0i8.i64") {
        return dumpMemcpyCharCharLong(instr);  // just ignore for now
    }
    if(knownFunctionsMap.find(functionName) != knownFunctionsMap.end()) {
        // cout << "replace " << functionName << " with " << knownFunctionsMap[functionName] << endl;
        functionName = knownFunctionsMap[functionName];
    }
    gencode += functionName + "(";
    int i = 0;
    for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
        Value *op = &*it->get();
        if(i > 0) {
            gencode += ", ";
        }
        gencode += dumpValue(op);
        i++;
    }
    gencode += ");\n";
    return gencode;
}

std::string dumpFPExt(CastInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpZExt(CastInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpSExt(CastInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpUIToFP(UIToFPInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpInttoPtr(IntToPtrInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += "(" + typestr + ")" + dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpFPTrunc(CastInst *instr) {
    // since this is float point trunc, lets just assume we're going from double to float
    // fix any exceptiosn to this rule later
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += "(float)" + dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpTrunc(CastInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += "(" + typestr + ")" + dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpIcmp(ICmpInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    CmpInst::Predicate predicate = instr->getSignedPredicate();  // note: we should detect signedness...
    string predicate_string = "";
    switch(predicate) {
        case CmpInst::ICMP_SLT:
            predicate_string = "<";
            break;
        case CmpInst::ICMP_SGT:
            predicate_string = ">";
            break;
        case CmpInst::ICMP_SGE:
            predicate_string = ">=";
            break;
        case CmpInst::ICMP_SLE:
            predicate_string = "<=";
            break;
        case CmpInst::ICMP_EQ:
            predicate_string = "==";
            break;
        case CmpInst::ICMP_NE:
            predicate_string = "!=";
            break;
        default:
            cout << "predicate " << predicate << endl;
            throw runtime_error("predicate not supported");
    }
    gencode += dumpOperand(instr->getOperand(0));
    gencode += " " + predicate_string + " ";
    gencode += dumpOperand(instr->getOperand(1)) + ";\n";
    return gencode;
}

std::string dumpFcmp(FCmpInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    gencode += typestr + " " + dumpOperand(instr) + " = ";
    CmpInst::Predicate predicate = instr->getPredicate();
    string predicate_string = "";
    switch(predicate) {
        case CmpInst::FCMP_ULT:
        case CmpInst::FCMP_OLT:
            predicate_string = "<";
            break;
        case CmpInst::FCMP_UGT:
        case CmpInst::FCMP_OGT:
            predicate_string = ">";
            break;
        case CmpInst::FCMP_UGE:
        case CmpInst::FCMP_OGE:
            predicate_string = ">=";
            break;
        case CmpInst::FCMP_ULE:
        case CmpInst::FCMP_OLE:
            predicate_string = "<=";
            break;
        case CmpInst::FCMP_UEQ:
        case CmpInst::FCMP_OEQ:
            predicate_string = "==";
            break;
        case CmpInst::FCMP_UNE:
        case CmpInst::FCMP_ONE:
            predicate_string = "!=";
            break;
        default:
            cout << "predicate " << predicate << endl;
            throw runtime_error("predicate not supported");
    }
    gencode += dumpOperand(instr->getOperand(0));
    gencode += " " + predicate_string + " ";
    gencode += dumpOperand(instr->getOperand(1)) + ";\n";
    return gencode;
}

std::string dumpPhi(BranchInst *branchInstr, BasicBlock *nextBlock) {
    std::string gencode = "";
    for(auto it = nextBlock->begin(); it != nextBlock->end(); it++) {
    // auto it = nextBlock->begin();
    // if(it != nextBlock->end()) {
        Instruction *instr = &*it;
        if(instr->getOpcode() != Instruction::PHI) {
            break;
        }
        // if(firstInstruction->getOpcode() == Instruction::PHI) {
        PHINode *phi = cast<PHINode>(instr);
        storeValueName(phi);
        BasicBlock *ourBlock = branchInstr->getParent();
        Value *sourceValue = phi->getIncomingValueForBlock(ourBlock);
        string sourceValueCode = dumpOperand(sourceValue);
        if(sourceValueCode == "") { // this is a hack really..
            continue;  // assume its an undef. which it might be
        }
        gencode += dumpOperand(phi) + " = ";
        gencode += sourceValueCode + ";\n";
        // }
    }
    return gencode;
}

std::string dumpBranch(BranchInst *instr) {
    string gencode = "";
    if(instr->isConditional()) {
        gencode += "if(" + dumpOperand(instr->getCondition()) + ") {\n";
        string phicode = dumpPhi(instr, instr->getSuccessor(0));
        if(phicode != "") {
            gencode += "        " + phicode;
        }
        gencode += "        goto " + dumpOperand(instr->getSuccessor(0)) + ";\n";
        if(instr->getNumSuccessors() == 1) {
        } else if(instr->getNumSuccessors() == 2) {
            gencode += "    } else {\n";
            string phicode = dumpPhi(instr, instr->getSuccessor(1));
            if(phicode != "") {
                gencode += "        " + phicode;
            }
            gencode += "        goto " + dumpOperand(instr->getSuccessor(1)) + ";\n";
        } else {
            throw runtime_error("not implemented for this numsuccessors br");
        }
        gencode += "    }\n";
    } else {
        if(instr->getNumSuccessors() == 1) {
            BasicBlock *nextBlock = instr->getSuccessor(0);
            string phicode = dumpPhi(instr, nextBlock);
            if(phicode != "") {
                gencode += "    " + phicode;
            }
            gencode += "    goto " + dumpOperand(instr->getSuccessor(0)) + ";\n";
        } else {
            throw runtime_error("not implemented sucessors != 1 for unconditional br");
        }
    }
    return gencode;
}

std::string dumpSelect(SelectInst *instr) {
    string gencode = "";
    copyAddressSpace(instr, instr->getOperand(1));
    gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + " = ";
    gencode += dumpOperand(instr->getCondition()) + " ? ";
    gencode += dumpOperand(instr->getOperand(1)) + " : ";
    gencode += dumpOperand(instr->getOperand(2)) + ";\n";
    return gencode;
}

std::string dumpInstruction(Instruction *instruction) {
    auto opcode = instruction->getOpcode();
    storeValueName(instruction);
    string resultName = nameByValue[instruction];
    string resultType = dumpType(instruction->getType());

    string instructioncode = "";
    if(debug) {
        cout << resultType << " " << resultName << " =";
        cout << " " << string(instruction->getOpcodeName());
        for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
            Value *op = &*it->get();
            cout << " " << dumpOperand(op);
        }
        cout << endl;
    }
    switch(opcode) {
        case Instruction::FAdd:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "+");
            break;
        case Instruction::FSub:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "-");
            break;
        case Instruction::FMul:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "*");
            break;
        case Instruction::FDiv:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
            break;
        case Instruction::Sub:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "-");
            break;
        case Instruction::Add:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "+");
            break;
        case Instruction::Mul:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "*");
            break;
        case Instruction::SDiv:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
            break;
        case Instruction::SRem:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "%");
            break;
        case Instruction::And:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "&");
            break;
        case Instruction::Or:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "|");
            break;
        case Instruction::Xor:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "^");
            break;
        case Instruction::LShr:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), ">>");
            break;
        case Instruction::Shl:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "<<");
            break;
        case Instruction::AShr:
            instructioncode = dumpBinaryOperator(cast<BinaryOperator>(instruction), ">>");
            break;
        case Instruction::Store:
            instructioncode = dumpStore(cast<StoreInst>(instruction));
            break;
        case Instruction::Call:
            instructioncode = dumpCall(cast<CallInst>(instruction));
            break;
        case Instruction::Load:
            instructioncode = dumpLoad(cast<LoadInst>(instruction));
            break;
        case Instruction::ICmp:
            instructioncode = dumpIcmp(cast<ICmpInst>(instruction));
            break;
        case Instruction::FCmp:
            instructioncode = dumpFcmp(cast<FCmpInst>(instruction));
            break;
        case Instruction::SExt:
            instructioncode = dumpSExt(cast<CastInst>(instruction));
            break;
        case Instruction::ZExt:
            instructioncode = dumpZExt(cast<CastInst>(instruction));
            break;
        case Instruction::FPExt:
            instructioncode = dumpFPExt(cast<CastInst>(instruction));
            break;
        case Instruction::FPTrunc:
            instructioncode = dumpFPTrunc(cast<CastInst>(instruction));
            break;
        case Instruction::Trunc:
            instructioncode = dumpTrunc(cast<CastInst>(instruction));
            break;
        case Instruction::BitCast:
            instructioncode = dumpBitcast(cast<BitCastInst>(instruction));
            break;
        case Instruction::AddrSpaceCast:
            instructioncode = dumpAddrSpaceCast(cast<AddrSpaceCastInst>(instruction));
            break;
        case Instruction::IntToPtr:
            instructioncode = dumpInttoPtr(cast<IntToPtrInst>(instruction));
            break;
        case Instruction::UIToFP:
            instructioncode = dumpUIToFP(cast<UIToFPInst>(instruction));
            break;
        case Instruction::GetElementPtr:
            instructioncode = dumpGetElementPtr(cast<GetElementPtrInst>(instruction));
            break;
        case Instruction::InsertValue:
            instructioncode = dumpInsertValue(cast<InsertValueInst>(instruction));
            break;
        case Instruction::ExtractValue:
            instructioncode = dumpExtractValue(cast<ExtractValueInst>(instruction));
            break;
        case Instruction::Alloca:
            instructioncode = dumpAlloca(cast<AllocaInst>(instruction));
            break;
        case Instruction::Br:
            instructioncode = dumpBranch(cast<BranchInst>(instruction));
            break;
        case Instruction::Select:
            instructioncode = dumpSelect(cast<SelectInst>(instruction));
            break;
        case Instruction::Ret:
            instructioncode = dumpReturn(cast<ReturnInst>(instruction));
            break;
        case Instruction::PHI:
            // just ignore, we dealt with it in the br (hopefully)
            break;
        default:
            cout << "opcode string " << instruction->getOpcodeName() << endl;
            throw runtime_error("unknown opcode");
    }
    return instructioncode;
}

std::string dumpBasicBlock(BasicBlock *basicBlock) {
    if(debug) {
        cout << "basicblock" << endl;
    //     cout << "hasname " << string(basicBlock->getName()) << endl;
    }
    string label = "";
    if(nameByValue.find(basicBlock) != nameByValue.end()) {
        label = nameByValue[basicBlock];
    } else {
        ostringstream oss;
        oss << "label" << nextNameIdx;
        nextNameIdx++;
        label = oss.str();
        nameByValue[basicBlock] = label;
    }
    std::string gencode = "";
    gencode += "    " + label + ":;\n";
    for(BasicBlock::iterator it=basicBlock->begin(), e=basicBlock->end(); it != e; it++) {
        Instruction *instruction = &*it;
        string instructioncode = dumpInstruction(instruction);
        if(debug) {
            cout <<  instructioncode << endl;
        }
        if(instructioncode != "") {
            instructions_processed++;
            gencode += "    " + instructioncode;
        }
    }
    return gencode;
}

std::string dumpFunctionDeclaration(Function *F) {
    string declaration = "";
    Type *retType = F->getReturnType();
    std::string retTypeString = dumpType(retType);
    string fname = F->getName();
    if(iskernel_by_name[fname]) {
        declaration += "kernel ";
    }
    declaration += dumpType(retType) + " " + fname + "(";
    int i = 0;
    cout << "dumping function " << fname << endl;
    // cout << "getting arg types " << endl;
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        storeValueName(arg);
        Type *argType = arg->getType();
        if(iskernel_by_name[fname]) {
            if(argType->getTypeID() == Type::PointerTyID) {
                Type *elementType = argType->getPointerElementType();
                Type *newtype = PointerType::get(elementType, 1);
                arg->mutateType(newtype);
            }
        }
        string argname = dumpType(arg->getType()) + " " + dumpOperand(arg);
        // cout << "arg " << argname << endl;
        if(i > 0) {
            declaration += ", ";
        }
        declaration += argname;
        i++;
    }
    declaration += ")";
    return declaration;
}

std::string dumpFunction(Function *F) {
    currentFunctionSharedDeclarations = "";
    // currentFunctionDeclaredShareds.clear();
    // Type *retType = F->getReturnType();
    // std::string retTypeString = dumpType(retType);
    // string fname = F->getName();
    string gencode = "";
    // string declaration = "";
    string declaration = dumpFunctionDeclaration(F);
    cout << declaration << endl;
    // cout << "finished getting arg types" << endl;
    // label the blocks first
    // also dump phi declarations
    string body = "";
    int i = 0;
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        ostringstream oss;
        oss << "label" << i;
        string label = oss.str();
        nameByValue[basicBlock] = label;
        // write out phi declarations
        for(auto instructionIt = basicBlock->begin(); instructionIt != basicBlock->end(); instructionIt++) {
            Instruction *instr = &*instructionIt;
            if(!PHINode::classof(instr)) {
                break;
            }
            PHINode *phi = cast<PHINode>(instr);
            storeValueName(phi);
            body += dumpType(phi->getType()) + " " + dumpOperand(phi) + ";\n";
        }
        i++;
    }
    // if(debug) {
    //     cout << "function code so far " << gencode << endl;
    // }
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        body += dumpBasicBlock(basicBlock);
    }
    gencode =
        declaration + " {\n" +
        currentFunctionSharedDeclarations +
        body +
    "}\n";
    cout << gencode;
    return gencode;
}

std::string dumpModule(Module *M) {
    string gencode;
    // figure out which functions are kernels
    for(auto it=M->named_metadata_begin(); it != M->named_metadata_end(); it++) {
        NamedMDNode *namedMDNode = &*it;
        for(auto it2=namedMDNode->op_begin(); it2 != namedMDNode->op_end(); it2++) {
            MDNode *mdNode = *it2;
            bool isKernel = false;
            string kernelName = "";
            for(auto it3=mdNode->op_begin(); it3 != mdNode->op_end(); it3++) {
                const MDOperand *op = it3;
                Metadata *metadata = op->get();
                if(metadata != 0) {
                    if(MDString::classof(metadata)) {
                        string meta_value = string((cast<MDString>(metadata))->getString());
                        if(meta_value == "kernel") {
                            isKernel = true;
                        }
                    } else if(ConstantAsMetadata::classof(metadata)) {
                        Constant *constant = (cast<ConstantAsMetadata>(metadata))->getValue();
                        if(GlobalValue::classof(constant)) {
                            GlobalValue *global = cast<GlobalValue>(constant);
                            if(global->getType()->getPointerElementType()->getTypeID() == Type::FunctionTyID) {
                                string functionName = string(constant->getName());
                                kernelName = functionName;
                            }
                        }
                    }
                }
            }
            if(isKernel) {
                iskernel_by_name[kernelName] = true;
            }
        }
    }

    // dump function declarations
    for(auto it = M->begin(); it != M->end(); it++) {
        string name = it->getName();
        if(iskernel_by_name[name]) {
            continue;  // no point in declaring kernels I think
        }
        if(ignoredFunctionNames.find(name) == ignoredFunctionNames.end() &&
                knownFunctionsMap.find(name) == knownFunctionsMap.end()) {
            Function *F = &*it;
            gencode += dumpFunctionDeclaration(F) + ";\n";
        }
    }
    gencode += "\n";

    // cout << "dumpvaluesymboltable" << endl;
    // ValueSymbolTable *valueSymbolTable = &M->getValueSymbolTable();
    // for(auto it=valueSymbolTable->begin(); it != valueSymbolTable->end(); it++) {
    //     cout << "vst entry " << endl;
    //     // Value *value = &*it;
    //     StringMapEntry<Value *> *sme = &*it;
    //     cout << string(sme->getKey()) << endl;
    //     // sme->dump;
    //     // value->dump();
    // }
    // return "";

    int i = 0;
    for(auto it = M->begin(); it != M->end(); it++) {
        nameByValue.clear();
        nextNameIdx = 0;
        string name = it->getName();
        if(ignoredFunctionNames.find(name) == ignoredFunctionNames.end() &&
                knownFunctionsMap.find(name) == knownFunctionsMap.end()) {
            Function *F = &*it;
            if(i > 0) {
                gencode += "\n";
            }
            gencode += dumpFunction(F);
            i++;
        }
    }
    gencode = getDeclarationsToWrite() + "\n" + gencode;
    return gencode;
}

int main(int argc, char *argv[]) {
    SMDiagnostic Err;
    if(argc < 3) {
        cout << "Usage: " << argv[0] << " [--debug] <input ir file> <output cl file>" << endl;
        return 1;
    }
    string target = argv[argc - 2];
    string outputfilepath = argv[argc - 1];
    debug = false;
    cout << "argc " << argc << " argv[1] " << argv[1] << endl;
    if(argc == 4) {
        if(string(argv[1]) != "--debug") {
            cout << "Usage: " << argv[0] << " [--debug] <input ir file> <output cl file>" << endl;
            return 1;
        } else {
            cout << "enabling debug mode" << endl;
            debug = true;
        }
    }
    TheModule = parseIRFile(target, Err, TheContext);
    if(!TheModule) {
        Err.print(argv[0], errs());
        return 1;
    }
    ignoredFunctionNames.insert("llvm.ptx.read.tid.x");
    ignoredFunctionNames.insert("llvm.ptx.read.tid.y");
    ignoredFunctionNames.insert("llvm.ptx.read.tid.z");
    ignoredFunctionNames.insert("llvm.cuda.syncthreads");
    ignoredFunctionNames.insert("_ZL21__nvvm_reflect_anchorv");
    ignoredFunctionNames.insert("__nvvm_reflect");
    ignoredFunctionNames.insert("llvm.ptx.read.ctaid.x");
    ignoredFunctionNames.insert("llvm.ptx.read.ctaid.y");
    ignoredFunctionNames.insert("llvm.ptx.read.ctaid.z");
    ignoredFunctionNames.insert("llvm.ptx.read.nctaid.x");
    ignoredFunctionNames.insert("llvm.ptx.read.nctaid.y");
    ignoredFunctionNames.insert("llvm.ptx.read.nctaid.z");
    ignoredFunctionNames.insert("llvm.ptx.read.ntid.x");
    ignoredFunctionNames.insert("llvm.ptx.read.ntid.y");
    ignoredFunctionNames.insert("llvm.ptx.read.ntid.z");
    ignoredFunctionNames.insert("llvm.memcpy.p0i8.p0i8.i64");
    ignoredFunctionNames.insert("llvm.memcpy.p0i8.p0i8.i32");
    ignoredFunctionNames.insert("llvm.lifetime.start");
    ignoredFunctionNames.insert("llvm.lifetime.end");

    knownFunctionsMap["_ZSt4sqrtf"] = "sqrt";
    knownFunctionsMap["llvm.nvvm.sqrt.rn.d"] = "sqrt";
    knownFunctionsMap["_Z16our_pretend_tanhf"] = "tanh";
    knownFunctionsMap["_Z15our_pretend_logf"] = "log";
    knownFunctionsMap["_Z15our_pretend_expf"] = "exp";

    try {
        string gencode = dumpModule(TheModule.get());
        ofstream of;
        of.open(outputfilepath, ios_base::out);
        of << gencode;
        of.close();
    } catch(const runtime_error &e) {
        cout << "instructions processed before crash " << instructions_processed << endl;
        throw e;
    } catch(...) {
        cout << "some unknown exception" << endl;
    }
    return 0;
}
