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
#include "struct_clone.h"
#include "local_config.h"

static llvm::LLVMContext context;
static std::map<std::string, Value *> NamedValues;
static std::map<string, bool> iskernel_by_name;
static std::set<string> ignoredFunctionNames;
static std::map<string, string> knownFunctionsMap; // from cuda to opencl, eg tid.x => get_global_id

map<Value *, string> nameByValue;
static int nextNameIdx;
static string currentFunctionSharedDeclarations = "";
static map<string, string> currentFunctionPhiDeclarationsByName;
static string globalDeclarations = "";
static string structpointershimcode = "";
static set<Value *> functionNeededForwardDeclarations;

static bool debug;
bool single_precision = true;

static int instructions_processed = 0;

std::string dumpInstruction(llvm::Instruction *instruction);
std::string dumpOperand(llvm::Value *value);
string dumpConstant(Constant *constant);
string dumpGetElementPtr(GetElementPtrInst *instr);
string dumpGetElementPtrRhs(GetElementPtrInst *instr);
string dumpChainedInstruction(int level, Instruction * instr);
std::string dumpBitCastRhs(BitCastInst *instr);
std::string dumpAddrSpaceCastRhs(AddrSpaceCastInst *instr);
void updateAddressSpace(Value *value, int newSpace);
void copyAddressSpace(Value *src, Value *dest);
std::string getName(Value *value);
std::string getName(StructType *value);
std::string getName(Function *value);
void addPHIDeclaration(PHINode *phi);
void storeValueName(Value *value);

static string cl_add_definitions = R"(
inline float __shfl_down(float v0, int v1, int v2) {
    local float mem[1024];
    int tid = get_local_id(0);
    int warpid = tid % 32;
    int warpstart = tid - warpid;
    mem[tid] = v0;
    //barrier(CLK_LOCAL_MEM_FENCE);
    int warpsrc = warpid + v1;
    warpsrc = warpsrc >= 32 ? warpid : warpsrc;
    return mem[warpstart + warpsrc];
}

// based on https://community.amd.com/thread/167462
inline int __atomic_inc(global volatile int *ptr, int val) {
    while( true ){
        int old = *ptr;
        if( old >= val ) {
            if(old == atomic_cmpxchg(ptr, old, 0)) {
               break;
            }
        }
        else {
            if(old == atomic_cmpxchg(ptr, old, old+1)) {
                break;
            }
        }
    }
    return 0;
}

)";

std::string dumpValue(Value *value) {
    std::string gencode = "";
    if(nameByValue.find(value) != nameByValue.end()) {
        string name = nameByValue[value];
        gencode += name;
        return gencode;
    }

    if(Constant *constant = dyn_cast<Constant>(value)) {
        // cout << "its a constant" << endl;
        if(ConstantInt *constInt = dyn_cast<ConstantInt>(constant)) {
            // cout << "constant int" << endl;
            int intvalue = readInt32Constant(constInt);
            string asstring = toString(intvalue);
            nameByValue[value] = asstring;
            return asstring;
        }
        if(ConstantFP *constFP = dyn_cast<ConstantFP>(constant)) {
            // cout << "constant float" << endl;
            int floatvalue = readFloatConstant(constFP);
            string asstring = toString(floatvalue);
            if(asstring.find('.') == string::npos) {
                asstring += ".0";
            }
            asstring += "f";
            nameByValue[value] = asstring;
            return asstring;
        }
    }

    // mark it as needing to be declared, then return it
    storeValueName(value);
    functionNeededForwardDeclarations.insert(value);
    // currentFunctionSharedDeclarations += dumpType(value->getType()) + " " + nameByValue[value] + ";\n";
    return nameByValue[value];

    // value->dump();
    // throw runtime_error("dumpvalue value not found");
}

void declareGlobal(GlobalValue *global) {
    string gencode = "";
    if(GlobalVariable *var = dyn_cast<GlobalVariable>(global)) {
        // cout << "hasinitializer() " << var->hasInitializer() << endl;
        // s << "name " << getName(global) << endl;
        string name = getName(global);
        if(name == "$str") {
            return;  // lazily skip $str for now...
        }
        // name = replace(name, '$', '_');
        gencode += "constant " + dumpType(global->getType()->getPointerElementType()) + " " + name;
        if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
            int addressspace = pointerType->getAddressSpace();
            if(addressspace == 3) { // shared/local => skip
                return;
            } else {
                // cout << "updating addressspace to 4" << endl;
                updateAddressSpace(var, 4);
            }
        }
        // cout << "declareGlobal name=" << name << " hasinitializer " << var->hasInitializer() << endl;
        if(var->hasInitializer()) {
            Constant *initializer = var->getInitializer();
            gencode += " = {";
            if(ConstantStruct *constStruct = dyn_cast<ConstantStruct>(initializer)) {
                int i = 0;
                while(Value *aggel = constStruct->getAggregateElement(i)) {
                    if(i == 0) {
                    } else {
                        gencode += ", ";
                    }
                    gencode += dumpOperand(aggel);
                    i++;
                }
                if(i > 0) {
                }
            }
            gencode += "}";
        } else {
            gencode += " = {}";
        }
    } else {
        global->dump();
        throw runtime_error("unimplemented declareglobalvalue for this type");
    }
    gencode += ";\n";
    // cout << gencode << endl;

    globalDeclarations += gencode + "\n";
}

string dumpChainedNextOp(int level, Value *op0) {
    string op0string = "";
    if(ConstantExpr*expr = dyn_cast<ConstantExpr>(op0)) {
        Instruction *childinstr = expr->getAsInstruction();
        string childresult = dumpChainedInstruction(level + 1, childinstr);
        op0string = "(" + childresult + ")";
    } else if(Constant*constant = dyn_cast<Constant>(op0)) {
        string constantstring = dumpConstant(constant);
        nameByValue[op0] = constantstring;
        return constantstring;
    } else {
        op0->dump();
        throw runtime_error("dumpchained gep unknown operand1 type ");
    }
    nameByValue[op0] = op0string;
    return op0string;
}

string dumpChainedInstruction(int level, Instruction * instr) {
    if(GetElementPtrInst *gep = dyn_cast<GetElementPtrInst>(instr)) {
        string thisinstrstring = dumpGetElementPtrRhs(gep);
        nameByValue[instr] = thisinstrstring;
        return thisinstrstring;
    } else if(BitCastInst *bitcast = dyn_cast<BitCastInst>(instr)) {
        string thisinstrstring = dumpBitCastRhs(bitcast);
        nameByValue[bitcast] = thisinstrstring;
        return thisinstrstring;
    } else if(AddrSpaceCastInst *addrspacecast = dyn_cast<AddrSpaceCastInst>(instr)) {
        string thisinstrstring = dumpAddrSpaceCastRhs(addrspacecast);
        nameByValue[addrspacecast] = thisinstrstring;
        return thisinstrstring;
    } else {
        instr->dump();
        throw runtime_error("dumpchained unknown instruction type ");
    }
}

    string dumpConstant(Constant *constant) {
    unsigned int valueTy = constant->getValueID();
    ostringstream oss;
    if(ConstantInt *constantInt = dyn_cast<ConstantInt>(constant)) {
        oss << constantInt->getSExtValue();
        string constantintval = oss.str();
        return constantintval;
    } else if(isa<ConstantStruct>(constant)) {
        throw runtime_error("constantStruct not implemented in dumpconstnat");
    } else if(ConstantExpr *expr = dyn_cast<ConstantExpr>(constant)) {
        Instruction *instr = expr->getAsInstruction();
        copyAddressSpace(constant, instr);
        string dcires = dumpChainedInstruction(0, instr);
        copyAddressSpace(instr, constant);
        nameByValue[constant] = dcires;
        return dcires;
    } else if(ConstantFP *constantFP = dyn_cast<ConstantFP>(constant)) {
        float floatvalue = constantFP->getValueAPF().convertToFloat();
        ostringstream oss;
        oss << floatvalue;
        string floatvaluestr = oss.str();
        if(floatvaluestr == "inf") {
            return "INFINITY";
        } else if(floatvaluestr == "-inf") {
            return "-INFINITY";
        }
        if(single_precision) {
            if(floatvaluestr.find('.') == string::npos) {
                floatvaluestr += ".0";
            }
            floatvaluestr += "f";
        }
        return floatvaluestr;
    } else if(GlobalValue *global = dyn_cast<GlobalValue>(constant)) {
         if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
             int addressspace = pointerType->getAddressSpace();
             string name = getName(global);
             if(addressspace == 3) {  // if it's local memory, it's not really 'global', juts return the name
                 return name;
             }
         }
         if(nameByValue.find(constant) != nameByValue.end()) {
            return nameByValue[constant];
         }
         string name = getName(global);
         string ourinstrstr = "(&" + name + ")";
         updateAddressSpace(constant, 4);
         nameByValue[constant] = ourinstrstr;

         return ourinstrstr;
    } else if(isa<UndefValue>(constant)) {
        // cout << "undef" << endl;
        return "";
    } else if(isa<ConstantPointerNull>(constant)) {
        // cout << "undef" << endl;
        return "0";
    } else {
        cout << "valueTy " << valueTy << endl;
        oss << "unknown";
        constant->dump();
        throw runtime_error("unknown constnat type");
    }
    return oss.str();
}


string dumpOperand(Value *value) {
    if(nameByValue.find(value) != nameByValue.end()) {
        return nameByValue[value];
    }
    if(Constant *constant = dyn_cast<Constant>(value)) {
        return dumpConstant(constant);
    }
    // cout << "isa phi " << isa<PHINode>(value) << endl;
    // cout << "isa basicblock " << isa<BasicBlock>(value) << endl;
    // cout << "isa label " << isa<LabelNode>(value) << endl;
    if(isa<BasicBlock>(value)) {
        // cout << "dumpoperand basicblock" << endl;
        storeValueName(value);
        return nameByValue[value];
    }
    if(PHINode *phi = dyn_cast<PHINode>(value)) {
        // cout << "dumpoperand got a phi node" << endl;
        addPHIDeclaration(phi);
        string name = nameByValue[value];
        // cout << "phi name " << name << endl;
        return name;
    }
    // lets just declare it???
    storeValueName(value);
    currentFunctionSharedDeclarations += dumpType(value->getType()) + " " + nameByValue[value] + ";\n";
    return nameByValue[value];
    // value->dump();
    // throw runtime_error("No way found to dump operand");
}

void storeValueName(Value *value) {
    if(nameByValue.find(value) != nameByValue.end()) {
        return;
    }
    if(value->hasName()) {
        string name = getName(value);
        if(name[0] == '.') {
            name = "v" + name;
        }
        name = replace(name, '.', '_');
        name = replace(name, '-', '_');
        name = replace(name, '$', '_');
        if(name == "kernel") {
            name = "_kernel";
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
    } else {
        // we still need to have "return" if no value, since some loops terminate with a `return` in the middle
        // of the codeblock.  Or rather, they dont terminate, if we dont write out a `return` :-P
        gencode += "return;\n";
    }
    return gencode;
}

std::string dumpAlloca(Instruction *alloca) {
    string gencode = "";
    if(PointerType *allocatypeptr = dyn_cast<PointerType>(alloca->getType())) {
        Type *ptrElementType = allocatypeptr->getPointerElementType();
        std::string typestring = dumpType(ptrElementType);
        // cout << "dumpAlloca typestring " << typestring << endl;
        int count = readInt32Constant(alloca->getOperand(0));
        if(count == 1) {
            if(ArrayType *arrayType = dyn_cast<ArrayType>(ptrElementType)) {
                // cout << "arraytype" << endl;
                int innercount = arrayType->getNumElements();
                Type *elementType = arrayType->getElementType();
                return dumpType(elementType) + " " + dumpOperand(alloca) + "[" + toString(innercount) + "];\n";
            } else {
                // if the elementType is a pointer, assume its global?
                if(isa<PointerType>(ptrElementType)) {
                    gencode += "global ";
                    updateAddressSpace(alloca, 1);
                    // return "global " + dumpType(elementType) + " " + dumpOperand(alloca) + "[" + toString(innercount) + "];\n";
                }
                return gencode + typestring + " " + dumpOperand(alloca) + "[1];\n";
            }
        } else {
            throw runtime_error("not implemented: alloca for count != 1");
        }
    } else {
        alloca->dump();
        throw runtime_error("dumpalloca not implemented for non pointer type");
    }
}

string dumpLoad(LoadInst *instr) {
    string gencode = "";
    string rhs = dumpOperand(instr->getOperand(0)) + "[0]";
    copyAddressSpace(instr->getOperand(0), instr);
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = " +
    gencode += rhs + ";\n";
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
    if(GlobalVariable *glob = dyn_cast<GlobalVariable>(value)) {
        string name = getName(glob);
        string declaration = "";
        Type *type = glob->getType();
        // type->dump();
        if(ArrayType *arraytype = dyn_cast<ArrayType>(type->getPointerElementType())) {
            // arraytype->dump();
            int length = arraytype->getNumElements();
            Type *elementType = arraytype->getElementType();
            string typestr = dumpType(elementType);
            declaration += "    local " + typestr + " " + name + "[" + toString(length) + "];\n";
            if(debug) {
                // cout << declaration << endl;
            }
            nameByValue[value] = name;
            currentFunctionSharedDeclarations += declaration;
        }
    }
}

string dumpGetElementPtrRhs(GetElementPtrInst *instr) {
    string gencode = "";
    int numOperands = instr->getNumOperands();
    string rhs = "";
    rhs += "" + dumpOperand(instr->getOperand(0));
    Type *currentType = instr->getOperand(0)->getType();
    PointerType *op0typeptr = dyn_cast<PointerType>(instr->getOperand(0)->getType());
    if(op0typeptr == 0) {
        throw runtime_error("dumpgetelementptrrhs op0typeptr is 0");
    }
    int addressspace = op0typeptr->getAddressSpace();
    if(addressspace == 3) { // local/shared memory
        // pointer into shared memory.
        addSharedDeclaration(instr->getOperand(0));
    }
    for(int d=0; d < numOperands - 1; d++) {
        Type *newType = 0;
        // if(PointerType *ptrtype = dyn_cast<PointerType>(currentType)) {
        //     outs() << "d " << d << " currenttype " << dumpType(currentType) << " addressspace " << ptrtype->getAddressSpace() << "\n";
        // }
        if(currentType->isPointerTy() || isa<ArrayType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    rhs = "(&" + rhs + ")";
                }
            }
            rhs += string("[") + dumpOperand(instr->getOperand(d + 1)) + "]";
            newType = currentType->getPointerElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = getName(structtype);
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
        // if new type is a pointer, and old type was a struct, then we assume its a global pointer, and therefore
        // update the addressspace to be global, ie 1.  This is a bit hacky I know
        if(isa<PointerType>(newType) && isa<StructType>(currentType)) {
            addressspace = 1;
        }
        currentType = newType;
    }
    updateAddressSpace(instr, addressspace);
    rhs = "(&" + rhs + ")";
    return rhs;
}

string dumpGetElementPtr(GetElementPtrInst *instr) {
    string gencode = "";
    string rhs = dumpGetElementPtrRhs(instr);
    // gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + " = " + 
    gencode += rhs;
    gencode += ";\n";
    // cout << gencode << endl;
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
            string structName = getName(structtype);
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
        currentFunctionSharedDeclarations += "    " + dumpType(instr->getType()) + " " + dumpOperand(instr) + " = " + incomingOperand + ";\n";
        // gencode += "    " + dumpType(instr->getType()) + " " + dumpOperand(instr) + " = " + incomingOperand + ";\n";
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
            string structName = getName(structtype);
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
    // gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + " = ";
    gencode += lhs + ";\n";
    return gencode;
}

std::string dumpBinaryOperator(BinaryOperator *instr, std::string opstring) {
    string gencode = "";
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    Value *op1 = instr->getOperand(0);
    gencode += dumpValue(op1) + " ";
    gencode += opstring + " ";
    Value *op2 = instr->getOperand(1);
    gencode += dumpOperand(op2) + ";\n";
    return gencode;
}

std::string dumpBitCastRhs(BitCastInst *instr) {
    string gencode = "";
    string op0str = dumpOperand(instr->getOperand(0));
    if(PointerType *srcType = dyn_cast<PointerType>(instr->getSrcTy())) {
        if(PointerType *destType = dyn_cast<PointerType>(instr->getDestTy())) {
            Type *castType = PointerType::get(destType->getElementType(), srcType->getAddressSpace());
            gencode += "((" + dumpType(castType) + ")" + op0str + ")";
            copyAddressSpace(instr->getOperand(0), instr);
        }
    } else {
        // just pass through?
        gencode += "((" + dumpType(instr->getDestTy()) + ")" + op0str + ")";
    }
    return gencode;
}

std::string dumpBitCast(BitCastInst *instr) {
    string gencode = "";
    string rhs = dumpBitCastRhs(instr);
    // gencode += dumpType(instr->getType()) + " ";
    // string instrop = dumpOperand(instr);
    // gencode += instrop + " = " +
    gencode += rhs + ";\n";
    return gencode;
}

std::string dumpAddrSpaceCastRhs(AddrSpaceCastInst *instr) {
    string gencode = "";
    string op0str = dumpOperand(instr->getOperand(0));
    copyAddressSpace(instr->getOperand(0), instr);
    gencode += "(" + op0str + ")";
    return gencode;
}

std::string dumpAddrSpaceCast(AddrSpaceCastInst *instr) {
    string gencode = "";
    copyAddressSpace(instr->getOperand(0), instr);
    string rhs = dumpAddrSpaceCastRhs(instr);
    // gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + " = ";
    gencode += rhs + ";\n";
    return gencode;
}

std::string dumpMemcpyCharCharLong(CallInst *instr) {
    std::string gencode = "";
    int totalLength = cast<ConstantInt>(instr->getOperand(2))->getSExtValue();
    // cout << "totalLength " << totalLength << endl;
    int align = cast<ConstantInt>(instr->getOperand(3))->getSExtValue();
    // cout << "align " << align << endl;
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
    // string typestr = dumpType(instr->getType());
    // if(typestr != "void") {
    //     gencode += typestr + " " + dumpOperand(instr) + " = ";
    // }

    string functionName = getName(instr->getCalledValue());
    COCL_PRINT(cout << "functionName " << functionName << endl);
    if(functionName == "llvm.ptx.read.tid.x") {
        return gencode + "get_local_id(0);\n";
    } else if(functionName == "llvm.ptx.read.tid.y") {
        return gencode + "get_local_id(1);\n";
    } else if(functionName == "llvm.ptx.read.tid.z") {
        return gencode + "get_local_id(2);\n";
    } else if(functionName == "llvm.ptx.read.ctaid.x") {
        return gencode + "get_group_id(0);\n";
    } else if(functionName == "llvm.ptx.read.ctaid.y") {
        return gencode + "get_group_id(1);\n";
    } else if(functionName == "llvm.ptx.read.ctaid.z") {
        return gencode + "get_group_id(2);\n";
    } else if(functionName == "llvm.ptx.read.nctaid.x") {
        return gencode + "get_num_groups(0);\n";
    } else if(functionName == "llvm.ptx.read.nctaid.y") {
        return gencode + "get_num_groups(1);\n";
    } else if(functionName == "llvm.ptx.read.nctaid.z") {
        return gencode + "get_num_groups(2);\n";
    } else if(functionName == "llvm.ptx.read.ntid.x") {
        return gencode + "get_local_size(0);\n";
    } else if(functionName == "llvm.ptx.read.ntid.y") {
        return gencode + "get_local_size(1);\n";
    } else if(functionName == "llvm.ptx.read.ntid.z") {
        return gencode + "get_local_size(2);\n";
    } else if(functionName == "llvm.cuda.syncthreads") {
        return gencode + "barrier(CLK_GLOBAL_MEM_FENCE);\n";
    } else if(functionName == "_Z13__threadfencev") {
        // Not sure if this is correct?
        // seems to be correct-ish???
        // what I understand:
        // (from https://stackoverflow.com/questions/5232689/cuda-threadfence/5233737#5233737 )
        // threadfence orders writes to memory, so if you do:
        // - write data
        // - threadfence
        // - write flag
        // => then if another thread sees the flag, the data that was written is guaranteed to be visible
        // to it too
        // I *think* that barrier(CLK_GLOBAL_MEM_FENCE) achieves the same thing, though it might be
        // a bit too "strong" (ie slow)?
        return gencode + "barrier(CLK_GLOBAL_MEM_FENCE);\n";
    } else if(functionName == "llvm.lifetime.start") {
        return "";  // just ignore for now
    } else if(functionName == "llvm.lifetime.end") {
        return "";  // just ignore for now
    } else if(functionName == "_Z11make_float4ffff") {
        // change this into something like: (float4)(a, b, c, d)
        functionName = "(float4)";
    // } else if(functionName == "_ZSt3minIfERKT_S2_S2_") { // hack :-P
    //     cout << "applying 'min' hack" << endl;
    //     gencode = "";
    //     string typestr = dumpType(cast<PointerType>(instr->getType())->getPointerElementType());
    //     if(typestr != "void") {
    //         gencode += typestr + " " + dumpOperand(instr) + " = ";
    //     }
    //     gencode += " min(";
    //     gencode += dumpValue(instr->getOperand(0)) + "[0]";
    //     gencode += ", ";
    //     gencode += dumpValue(instr->getOperand(1)) + "[0]";
    //     gencode += ");\n";
    //     return gencode;
    // } else if(functionName == "_ZSt3maxIfERKT_S2_S2_") { // hack :-P
    //     cout << "applying 'max' hack" << endl;
    //     gencode = "";
    //     string typestr = dumpType(cast<PointerType>(instr->getType())->getPointerElementType());
    //     if(typestr != "void") {
    //         gencode += typestr + " " + dumpOperand(instr) + " = ";
    //     }
    //     gencode += " max(";
    //     gencode += dumpValue(instr->getOperand(0)) + "[0]";
    //     gencode += ", ";
    //     gencode += dumpValue(instr->getOperand(1)) + "[0]";
    //     gencode += ");\n";
    //     return gencode;
    } else if(functionName == "_GLOBAL__sub_I_struct_initializer.cu") {
        cerr << "WARNING: skipping _GLOBAL__sub_I_struct_initializer.cu" << endl;
        return "";
    } else if(functionName == "__nvvm_reflect") {
        return gencode + " 0;\n"; //ignore, (but pretend to return 0)
    } else if(functionName == "llvm.memcpy.p0i8.p0i8.i64") {
        return dumpMemcpyCharCharLong(instr);  // just ignore for now
    } else if(knownFunctionsMap.find(functionName) != knownFunctionsMap.end()) {
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
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpZExt(CastInst *instr) {
    string gencode = "";
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpSExt(CastInst *instr) {
    string gencode = "";
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpUIToFP(UIToFPInst *instr) {
    string gencode = "";
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpSIToFP(SIToFPInst *instr) {
    string gencode = "";
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpInttoPtr(IntToPtrInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += "(" + typestr + ")" + dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpFPTrunc(CastInst *instr) {
    // since this is float point trunc, lets just assume we're going from double to float
    // fix any exceptiosn to this rule later
    string gencode = "";
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += "(float)" + dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpTrunc(CastInst *instr) {
    string gencode = "";
    string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
    gencode += "(" + typestr + ")" + dumpValue(instr->getOperand(0)) + ";\n";
    return gencode;
}

std::string dumpIcmp(ICmpInst *instr) {
    string gencode = "";
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
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
    // string typestr = dumpType(instr->getType());
    // gencode += typestr + " " + dumpOperand(instr) + " = ";
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
        Instruction *instr = &*it;
        if(instr->getOpcode() != Instruction::PHI) {
            break;
        }
        if(PHINode *phi = dyn_cast<PHINode>(instr)) {
            storeValueName(phi);
            BasicBlock *ourBlock = branchInstr->getParent();
            Value *sourceValue = phi->getIncomingValueForBlock(ourBlock);
            string sourceValueCode = dumpOperand(sourceValue);
            if(sourceValueCode == "") { // this is a hack really..
                continue;  // assume its an undef. which it might be
            }
            copyAddressSpace(sourceValue, phi);
            gencode += dumpOperand(phi) + " = ";
            gencode += sourceValueCode + ";\n";
        }
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
    copyAddressSpace(instr->getOperand(1), instr);
    // gencode += dumpType(instr->getType()) + " " + dumpOperand(instr) + " = ";
    gencode += dumpOperand(instr->getCondition()) + " ? ";
    gencode += dumpOperand(instr->getOperand(1)) + " : ";
    gencode += dumpOperand(instr->getOperand(2)) + ";\n";
    return gencode;
}

void addPHIDeclaration(PHINode *phi) {
    // currentFunctionPhiDeclarationsByName
    storeValueName(phi);
    string name = dumpOperand(phi);
    string declaration = dumpType(phi->getType()) + " " + dumpOperand(phi);
    // cout << declaration << endl;
    currentFunctionPhiDeclarationsByName[name] = declaration;
}

std::string dumpInstruction(Instruction *instruction) {
    auto opcode = instruction->getOpcode();
    storeValueName(instruction);
    string resultName = nameByValue[instruction];
    string resultType = dumpType(instruction->getType());

    string gencode = "";
    string instructioncode = "";
    if(debug) {
        // cout << resultType << " " << resultName << " =";
        // cout << " " << string(instruction->getOpcodeName());
        for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
            Value *op = &*it->get();
            // cout << " " << dumpOperand(op);
        }
        // cout << endl;
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
            instructioncode = dumpBitCast(cast<BitCastInst>(instruction));
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
        case Instruction::SIToFP:
            instructioncode = dumpSIToFP(cast<SIToFPInst>(instruction));
            break;
        case Instruction::GetElementPtr:
            instructioncode = dumpGetElementPtr(cast<GetElementPtrInst>(instruction));
            break;
        case Instruction::InsertValue:
            instructioncode = dumpInsertValue(cast<InsertValueInst>(instruction));
            return instructioncode;
            // break;
        case Instruction::ExtractValue:
            instructioncode = dumpExtractValue(cast<ExtractValueInst>(instruction));
            break;
        case Instruction::Alloca:
            instructioncode = dumpAlloca(cast<AllocaInst>(instruction));
            return instructioncode;
            // break;
        case Instruction::Br:
            instructioncode = dumpBranch(cast<BranchInst>(instruction));
            return instructioncode;
            // break;
        case Instruction::Select:
            instructioncode = dumpSelect(cast<SelectInst>(instruction));
            break;
        case Instruction::Ret:
            instructioncode = dumpReturn(cast<ReturnInst>(instruction));
            return instructioncode;
            // break;
        case Instruction::PHI:
            addPHIDeclaration(cast<PHINode>(instruction));
            return "";
            // break;
        default:
            cout << "opcode string " << instruction->getOpcodeName() << endl;
            throw runtime_error("unknown opcode");
    }
    string typestr = dumpType(instruction->getType());
    if(typestr != "void") {
        if(functionNeededForwardDeclarations.find(instruction) != functionNeededForwardDeclarations.end()) {
            currentFunctionSharedDeclarations += typestr + " " + dumpOperand(instruction);
        } else {
            gencode += typestr + " ";
        }
        gencode += dumpOperand(instruction) + " = ";
    }

    gencode += instructioncode;
    COCL_PRINT(cout << gencode << endl);
    return gencode;
}

std::string dumpBasicBlock(BasicBlock *basicBlock) {
    if(debug) {
        // cout << "basicblock" << endl;
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
            // cout <<  instructioncode << endl;
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
    string fname = getName(F);
    if(iskernel_by_name[fname]) {
        declaration += "kernel ";
    }
    declaration += dumpType(retType) + " " + fname + "(";
    int i = 0;
    // cout << "dumping function " << fname << endl;
    structpointershimcode = "";
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        storeValueName(arg);
        Type *argType = arg->getType();
        string argName = dumpOperand(arg);
        // bool isstruct = false;
        string argdeclaration = "";
        bool isKernel = iskernel_by_name[fname];
        bool is_struct_needs_cloning = false;
        bool ispointer = isa<PointerType>(argType);
        // cout << " arg ispointer " << ispointer << endl;
        if(isKernel) {
            // outs() << "    its a kernel function" << "\n";
            if(PointerType *ptrType = dyn_cast<PointerType>(argType)) {
                Type *elemType = ptrType->getPointerElementType();
                if(StructType *structType = dyn_cast<StructType>(elemType)) {
                    // outs() << "    name " << getName(structType) << "\n";
                    if(getName(structType) != "struct.float4") {
                        unique_ptr<StructInfo> structInfo(new StructInfo());
                        walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
                        if(structInfo->pointerInfos.size() > 0) { // struct has pointers...
                            is_struct_needs_cloning = true;
                            // isstruct = true;
                            argdeclaration = "global " + dumpTypeNoPointers(structType) + "* " + argName + "_nopointers";
                        }
                    }
                }
            }
            if(!is_struct_needs_cloning) {
                if(argType->getTypeID() == Type::PointerTyID) {
                    Type *elementType = argType->getPointerElementType();
                    Type *newtype = PointerType::get(elementType, 1);
                    arg->mutateType(newtype);
                }
            }
        }
        if(!is_struct_needs_cloning) {
            argdeclaration = dumpType(arg->getType()) + " " + argName;
        }
        if(i > 0) {
            declaration += ", ";
        }
        declaration += argdeclaration;
        // if this is a kernel method, check for any structs containing pointers,
        // and add those pointers t othe argument list, with some appropriate shimcode
        // to copy those pointers into the struct, at the start of the kernel
        int j = 0;
        // argType->dump();
        // outs() << "\n";
        if(is_struct_needs_cloning) {
            StructType *structType = cast<StructType>(cast<PointerType>(argType)->getPointerElementType());
            // declare a pointerful struct, then copy the vlaues across, then copy the float *s in
            unique_ptr<StructInfo> structInfo(new StructInfo());
            walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
            structpointershimcode += dumpType(structType) + " " + argName + "[1];\n";
            structpointershimcode += writeStructCopyCodeNoPointers(structType, argName + "_nopointers[0]", argName + "[0]");
            for(auto pointerit=structInfo->pointerInfos.begin(); pointerit != structInfo->pointerInfos.end(); pointerit++) {
                PointerInfo *pointerInfo = pointerit->get();
                int offset = pointerInfo->offset;
                declaration += ", global " + dumpType(pointerInfo->type) + " " + argName + "_ptr" + toString(j);
                declaration += ", long " + argName + "_ptr_offset" + toString(j);
                structpointershimcode = "    " + argName + "_ptr" + toString(j) + " = (global " + dumpType(pointerInfo->type) + ")((global char *)" + argName + "_ptr" + toString(j) + " + " + argName + "_ptr_offset" + toString(j) + ");\n" +
                    structpointershimcode;
                structpointershimcode += argName + "[0]" + pointerInfo->path + " = " + argName + "_ptr" + toString(j) + ";\n";
                j++;
            }
        }
        if(isKernel && ispointer && !is_struct_needs_cloning) {
        // cout << "v2" << endl;
        // if(isKernel && ispointer) {
            // add offset
            declaration += ", long " + argName + "_offset";
            structpointershimcode = "    " + argName + " = (" + dumpType(arg->getType()) + ")((global char *)" + argName + " + " + argName + "_offset);\n" +
                structpointershimcode; // put at front of shim
        }
        i++;
    }
    declaration += ")";
    return declaration;
}

std::string dumpFunction(Function *F) {
    currentFunctionSharedDeclarations = "";
    currentFunctionPhiDeclarationsByName.clear();
    string gencode = "";
    string declaration = dumpFunctionDeclaration(F);
    // cout << declaration << endl;
    string body = "";
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        body += dumpBasicBlock(basicBlock);
    }
    gencode =
        declaration + " {\n" +
        currentFunctionSharedDeclarations;
    for(auto it=currentFunctionPhiDeclarationsByName.begin(); it != currentFunctionPhiDeclarationsByName.end(); it++){
        gencode += "    " + it->second + ";\n";
    }
    if(structpointershimcode != "") {
        gencode += structpointershimcode + "\n";
    }
    gencode +=
        body +
    "}\n";
    // cout << gencode;
    return gencode;
}

std::string dumpModule(Module *M) {
    string gencode;

    // get struct declarations
    // global_begin/end returns all the bits that start with '@', at the top of the .ll
    // cout << "begin declare global variables" << endl;
    for(auto it=M->global_begin(); it != M->global_end(); it++) {
        GlobalVariable *glob = &*it;
        string name = getName(glob);
        if(name == "llvm.used") {
            continue;
        }
        if(name.find(".str") == 0) {
            // ignore global strings for now (probably add in locally; though I dont think opencl really uses strings..)
            continue;
        }
        if(name == "llvm.global_ctors") {
            // we should handle these sooner or later, but skip for now
            cerr << "warning: skipping @llvm.global_ctors" << endl;
            continue;
        }
        glob->dump();
        // cout << "name " << name << endl;
        declareGlobal(glob);
    }
    // cout << getDeclarationsToWrite() << endl;
    // cout << globalDeclarations << endl;
    // cout << "done declaring global variables" << endl;

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
                                string functionName = getName(constant);
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
    // cout << "beginning function declarations" << endl;
    for(auto it = M->begin(); it != M->end(); it++) {
        Function *F = &*it;
        string name = getName(F);
        if(iskernel_by_name[name]) {
            continue;  // no point in declaring kernels I think
        }
        // hack for tensorflow: remove anything with 4Half in it, which one we dont use and two copies pointers inside
        // pointers to structs, as kernel parameters...
        if(name.find("_4half") != string::npos) {
            continue;
        }
        if(ignoredFunctionNames.find(name) == ignoredFunctionNames.end() &&
                knownFunctionsMap.find(name) == knownFunctionsMap.end()) {
            string declaration = dumpFunctionDeclaration(F) + ";";
            // cout << declaration << endl;
            gencode += declaration + "\n";
        }
    }
    gencode += "\n";
    // cout << "done writing function declarations" << endl;
    // cout << endl;

    int i = 0;
    for(auto it = M->begin(); it != M->end(); it++) {
        nameByValue.clear();
        nextNameIdx = 0;
        Function *F = &*it;
        string name = getName(F);
        COCL_PRINT(cout << "dumping functoin " << name << endl);
        // hack for tensorflow: remove anything with 4Half in it, which one we dont use and two copies pointers inside
        // pointers to structs, as kernel parameters...
        if(name.find("_4half") != string::npos) {
            continue;
        }
        if(ignoredFunctionNames.find(name) == ignoredFunctionNames.end() &&
                knownFunctionsMap.find(name) == knownFunctionsMap.end()) {
            if(i > 0) {
                gencode += "\n";
            }
            gencode += dumpFunction(F);
            i++;
        }
    }
    gencode = getDeclarationsToWrite() + "\n" + globalDeclarations + "\n" + gencode;
    return gencode;
}

int main(int argc, char *argv[]) {
    SMDiagnostic smDiagnostic;
    if(argc < 3) {
        cout << "Usage: " << argv[0] << " [--debug] <input ir file> <output cl file>" << endl;
        return 1;
    }
    string target = argv[argc - 2];
    string outputfilepath = argv[argc - 1];
    debug = false;
    // cout << "argc " << argc << " argv[1] " << argv[1] << endl;
    if(argc == 4) {
        if(string(argv[1]) != "--debug") {
            cout << "Usage: " << argv[0] << " [--debug] <input ir file> <output cl file>" << endl;
            return 1;
        } else {
            cout << "enabling debug mode" << endl;
            debug = true;
        }
    }
    std::unique_ptr<llvm::Module> M = parseIRFile(target, smDiagnostic, context);
    if(!M) {
        smDiagnostic.print(argv[0], errs());
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
    ignoredFunctionNames.insert("pow");
    ignoredFunctionNames.insert("_Z11make_float4ffff");
    ignoredFunctionNames.insert("_GLOBAL__sub_I_struct_initializer.cu");
    ignoredFunctionNames.insert("_Z13__threadfencev");

    knownFunctionsMap["_ZSt4sqrtf"] = "sqrt";
    knownFunctionsMap["llvm.nvvm.sqrt.rn.d"] = "sqrt";
    knownFunctionsMap["llvm.nvvm.fabs.f"] = "fabs";
    knownFunctionsMap["llvm.nvvm.fabs.ftz.f"] = "fabs";
    knownFunctionsMap["_Z16our_pretend_tanhf"] = "tanh";
    knownFunctionsMap["_Z15our_pretend_logf"] = "log";
    knownFunctionsMap["_Z15our_pretend_expf"] = "exp";

    knownFunctionsMap["_ZSt16our_pretend_tanhf"] = "tanh";
    knownFunctionsMap["_ZSt15our_pretend_logf"] = "log";
    knownFunctionsMap["_ZSt15our_pretend_expf"] = "exp";

    knownFunctionsMap["_ZSt4tanhf"] = "tanh";
    knownFunctionsMap["_ZSt3logf"] = "log";
    knownFunctionsMap["_ZSt3expf"] = "exp";
    knownFunctionsMap["_ZSt3powff"] = "pow";
    knownFunctionsMap["_Z3minff"] = "fmin";
    knownFunctionsMap["_Z3maxff"] = "fmax";
    knownFunctionsMap["fminf"] = "fmin";
    knownFunctionsMap["fmaxf"] = "fmax";
    knownFunctionsMap["tanhf"] = "tanh";
    knownFunctionsMap["expf"] = "exp";
    knownFunctionsMap["fabsf"] = "fabs";
    knownFunctionsMap["acosf"] = "acos";
    knownFunctionsMap["asinf"] = "asin";
    knownFunctionsMap["atanf"] = "atan";
    knownFunctionsMap["cosf"] = "cos";
    knownFunctionsMap["sinf"] = "sin";
    knownFunctionsMap["tanf"] = "tan";
    knownFunctionsMap["ceilf"] = "ceil";
    knownFunctionsMap["floorf"] = "floor";
    knownFunctionsMap["logf"] = "log";
    knownFunctionsMap["sqrtf"] = "sqrt";

    knownFunctionsMap["_Z9atomicCASIjET_PS0_S0_S0_"] = "atomic_cmpxchg";   // int
    knownFunctionsMap["_Z10atomicExchIjET_PS0_S0_"] = "atomic_xchg";  // ints
    knownFunctionsMap["_Z10atomicExchIfET_PS0_S0_"] = "atomic_xchg";   // floats
    knownFunctionsMap["_Z9atomicIncIjET_PS0_S0_"] = "__atomic_inc";   // int
    knownFunctionsMap["_Z11__shfl_downIfET_S0_ii"] = "__shfl_down";   // float, and see cl_add_definitions, at top

    try {
        string gencode = "";
        gencode += cl_add_definitions;
        COCL_PRINT(cout << "cl_add_definitions " << cl_add_definitions << endl);
        gencode += dumpModule(M.get());
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
