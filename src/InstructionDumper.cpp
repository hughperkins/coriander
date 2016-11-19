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

#include "InstructionDumper.h"
#include "mutations.h"
#include "ExpressionsHelper.h"
#include "readIR.h"
#include "EasyCL/util/easycl_stringhelper.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include <iostream>

using namespace std;
using namespace llvm;

namespace cocl {

InstructionDumper::InstructionDumper(
        GlobalNames *globalNames, LocalNames *localNames, TypeDumper *typeDumper, const FunctionNamesMap *functionNamesMap,
        std::vector<AllocaInfo> *allocaDeclarations, std::set<llvm::Value *> *variablesToDeclare,
        std::set<llvm::Value *> *sharedVariablesToDeclare, std::set<std::string> *shimFunctionsNeeded,
        std::set<llvm::Function *> *neededFunctions,
        std::map<llvm::Value *, std::string> *globalExpressionByValue, std::map<llvm::Value *, std::string> *localExpressionByValue
        ) :
    allocaDeclarations(allocaDeclarations),
    variablesToDeclare(variablesToDeclare),
    sharedVariablesToDeclare(sharedVariablesToDeclare),
    shimFunctionsNeeded(shimFunctionsNeeded),
    neededFunctions(neededFunctions),

    globalExpressionByValue(globalExpressionByValue),
    localExpressionByValue(localExpressionByValue),

    localNames(localNames),
    typeDumper(typeDumper),
    globalNames(globalNames),

    functionNamesMap(functionNamesMap)
        {
}
InstructionDumper::~InstructionDumper() {
}

void InstructionDumper::dumpConstant(std::ostream &oss, llvm::Constant *constant) {
// maybe this should be somewhere more generic?
// string BasicBlockDumper::dumpConstant(Constant *constant) {
    unsigned int valueTy = constant->getValueID();
    // ostringstream oss;
    if(ConstantInt *constantInt = dyn_cast<ConstantInt>(constant)) {
        oss << constantInt->getSExtValue();
        // string constantintval = oss.str();
        // return constantintval;
        return;
    } else if(isa<ConstantStruct>(constant)) {
        throw runtime_error("constantStruct not implemented in basicblockdumper.dumpconstant");
    } else if(ConstantExpr *expr = dyn_cast<ConstantExpr>(constant)) {
        // cout << "constantexpr" << endl;
        // return dumpConstantExpr(expr);
        oss << dumpConstantExpr(expr);
        return;
        // throw runtime_error("constantExpr not implemented in basicblockdumper.dumpconstnat");
        // Instruction *instr = expr->getAsInstruction();
        // cout << "dumping:" << endl;
        // instr->dump();
        // copyAddressSpace(constant, instr);
        // string dcires = dumpInstruction(instr);
        // cout << "calling dci" << endl;
        // string dcires = dumpChainedInstruction(0, instr, true);
        // cout << "dcires " << dcires << endl;
        // // copyAddressSpace(instr, constant);
        // nameByValue[constant] = dcires;
        // cout << "exprByValue has constant? " << (exprByValue.find(constant) != exprByValue.end()) << endl;
        // exprByValue[constant] = dcires;
        // return dcires;
    } else if(ConstantFP *constantFP = dyn_cast<ConstantFP>(constant)) {
        oss << dumpFloatConstant(forceSingle, constantFP);
        return;
    } else if(GlobalValue *global = dyn_cast<GlobalValue>(constant)) {
        cout << "globalvalue" << endl;
        // throw runtime_error("GlobalValue not implemented in basicblockdumper.dumpconstant");
        if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
            int addressspace = pointerType->getAddressSpace();
            if(addressspace == 3) {  // if it's local memory, it's not really 'global', juts return the name
                sharedVariablesToDeclare->insert(global);
                string name = global->getName().str();
                localNames->getOrCreateName(global, name);
                (*localExpressionByValue)[global] = name;
                cout << "shared memory, creating in localnames name=" << name << endl;
                oss << name;
                return;
                // return name;
            }
        }
        if(globalNames->hasName(constant)) {
            cout << "found constnat in globalanesm, returning" << endl;
           // return globalNames->getName(constant);
            oss << globalNames->getName(constant);
            return;
        }
        string name = global->getName().str();
        cout << "using global's native name " << name << endl;
        string ourinstrstr = "(&" + name + ")";
        updateAddressSpace(constant, 4);  // 4 means constant
        cout << "adding to globalExpressionByValue [" << ourinstrstr << "]" << endl;
        globalExpressionByValue->operator[](constant) = ourinstrstr;

        oss << ourinstrstr;
        return;
        // return ourinstrstr;
    } else if(isa<UndefValue>(constant)) {
        // return "";
        return;
    } else if(isa<ConstantPointerNull>(constant)) {
        // return "0";
        oss << "0";
        return;
    } else {
        cout << "valueTy " << valueTy << endl;
        oss << "unknown";
        constant->dump();
        throw runtime_error("unknown constnat type");
    }
    // return oss.str();
}

string InstructionDumper::dumpConstantExpr(ConstantExpr *expr) {
    // this means things like:
    // shared memory 
    cout << "dumping constnat expr:" << endl;
    expr->dump();
    cout << endl;
    Instruction *instr = expr->getAsInstruction();
    // InstructionDumper childInstructionDumper;
    // string rhs = dumpInstruction(instr);
    vector<string> excessLines;
    std::set< llvm::Function *> dumpedFunctions;
    std::map<llvm::Function *, llvm::Type*> returnTypeByFunction;
    runRhsGeneration(instr, &excessLines, dumpedFunctions, returnTypeByFunction);
    string rhs = (*localExpressionByValue)[instr];
    // string rhs = dumpInstructionRhs(instr, &excessLines);
    cout << "rhs: [" << rhs << "]" << endl;
    if(excessLines.size() > 0) {
        throw runtime_error("InstructionDumper::dumpConstantExpr cannot handle excess lines > 0");
    }
    string thisinstrstr = "";
    if((*localExpressionByValue).find(instr) != localExpressionByValue->end()) {
        thisinstrstr = (*localExpressionByValue)[instr];
    } else {
        thisinstrstr = (*globalExpressionByValue)[instr];
    }
    // string thisinstrstr = globalExpressionByValue->operator[](instr);
    cout << "thisinstrstr: [" << thisinstrstr << "]" << endl;
    return thisinstrstr;
    // throw runtime_error("not implemented");
}

string InstructionDumper::dumpOperand(Value *value) {
    if(localExpressionByValue->find(value) != localExpressionByValue->end()) {
        return localExpressionByValue->operator[](value);
    }
    if(Constant *constant = dyn_cast<Constant>(value)) {
        ostringstream oss;
        dumpConstant(oss, constant);
        return oss.str();
    }
    if(localNames->hasValue(value)) {
        return localNames->getName(value);
    }
    // if(isa<BasicBlock>(value)) {
    //     storeValueName(value);
    //     return nameByValue[value];
    // }
    // if(PHINode *phi = dyn_cast<PHINode>(value)) {
    //     addPHIDeclaration(phi);
    //     string name = nameByValue[value];
    //     return name;
    // }
    // lets just declare it???
    // storeValueName(value);
    // functionNeededForwardDeclarations.insert(value);
    // return nameByValue[value];
    cout << "dumpoperand, not implemented for value:" << endl;
    value->dump();
    cout << endl;
    throw runtime_error("dumpoperand not implemented for this value");
}

std::string InstructionDumper::dumpBinaryOperator(BinaryOperator *instr, std::string opstring) {
    string gencode = "";
    copyAddressSpace(instr->getOperand(0), instr);
    Value *op1 = instr->getOperand(0);
    gencode += dumpOperand(op1) + " ";
    gencode += opstring + " ";
    Value *op2 = instr->getOperand(1);
    gencode += dumpOperand(op2);
    return gencode;
}

std::string InstructionDumper::dumpIcmp(llvm::ICmpInst *instr) {
    string gencode = "";
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
    string op0 = dumpOperand(instr->getOperand(0));
    string op1 = dumpOperand(instr->getOperand(1));
    // handle case like `a & 3 == 0`
    if(op0.find('&') == string::npos) {
        op0 = stripOuterParams(op0);
    }
    if(op1.find('&') == string::npos) {
        op1 = stripOuterParams(op1);
    }
    gencode += op0;
    gencode += " " + predicate_string + " ";
    gencode += op1;
    return gencode;
}

std::string InstructionDumper::dumpFcmp(llvm::FCmpInst *instr) {
    string gencode = "";
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
    string op0 = dumpOperand(instr->getOperand(0));
    string op1 = dumpOperand(instr->getOperand(1));
    op0 = stripOuterParams(op0);
    op1 = stripOuterParams(op1);
    gencode += op0;
    gencode += " " + predicate_string + " ";
    gencode += op1;
    return gencode;
}

std::string InstructionDumper::dumpBitCast(BitCastInst *instr) {
    string gencode = "";
    string op0str = dumpOperand(instr->getOperand(0));
    if(PointerType *srcType = dyn_cast<PointerType>(instr->getSrcTy())) {
        if(PointerType *destType = dyn_cast<PointerType>(instr->getDestTy())) {
            Type *castType = PointerType::get(destType->getElementType(), srcType->getAddressSpace());
            gencode += "((" + typeDumper->dumpType(castType) + ")" + op0str + ")";
            copyAddressSpace(instr->getOperand(0), instr);
        }
    } else {
        // just pass through?
        // cout << "bitcast, not a pointer" << endl;
        gencode += "*(" + typeDumper->dumpType(instr->getDestTy()) + " *)&(" + op0str + ")";
    }
    return gencode;
}

std::string InstructionDumper::dumpAddrSpaceCast(llvm::AddrSpaceCastInst *instr) {
    string gencode = "";
    string op0str = dumpOperand(instr->getOperand(0));
    copyAddressSpace(instr->getOperand(0), instr);
    // hackily ignore casts if shared address space
    // actually, just ignore all address space casts, since they're all illegal in opencl...
    // gencode += "((" + typeDumper->dumpType(instr->getType()) + ")" + op0str + ")";
    gencode += op0str;
    return gencode;
}

std::string InstructionDumper::dumpFPExt(llvm::CastInst *instr) {
    string gencode = "";
    gencode += dumpOperand(instr->getOperand(0));
    return gencode;
}

std::string InstructionDumper::dumpZExt(llvm::CastInst *instr) {
    string gencode = "";
    gencode += dumpOperand(instr->getOperand(0));
    return gencode;
}

std::string InstructionDumper::dumpSExt(llvm::CastInst *instr) {
    string gencode = "";
    gencode += dumpOperand(instr->getOperand(0));
    return gencode;
}

std::string InstructionDumper::dumpFPToUI(llvm::FPToUIInst *instr) {
    string gencode = "";
    string typestr = typeDumper->dumpType(instr->getType());
    gencode += "(" + typestr + ")" + dumpOperand(instr->getOperand(0)) + "";
    return gencode;
}

std::string InstructionDumper::dumpFPToSI(llvm::FPToSIInst *instr) {
    string gencode = "";
    string typestr = typeDumper->dumpType(instr->getType());
    gencode += "(" + typestr + ")" + dumpOperand(instr->getOperand(0)) + "";
    return gencode;
}

std::string InstructionDumper::dumpUIToFP(llvm::UIToFPInst *instr) {
    string gencode = "";
    string typestr = typeDumper->dumpType(instr->getType());
    gencode += "(" + typestr + ")" + dumpOperand(instr->getOperand(0)) + "";
    return gencode;
}

std::string InstructionDumper::dumpSIToFP(llvm::SIToFPInst *instr) {
    string gencode = "";
    string typestr = typeDumper->dumpType(instr->getType());
    gencode += "(" + typestr + ")" + dumpOperand(instr->getOperand(0)) + "";
    return gencode;
}

std::string InstructionDumper::dumpFPTrunc(llvm::CastInst *instr) {
    // since this is float point trunc, lets just assume we're going from double to float
    // fix any exceptiosn to this rule later
    string gencode = "";
    string typestr = typeDumper->dumpType(instr->getType());
    gencode += "(" + typestr + ")" + dumpOperand(instr->getOperand(0));
    return gencode;
}

std::string InstructionDumper::dumpTrunc(llvm::CastInst *instr) {
    string gencode = "";
    string typestr = typeDumper->dumpType(instr->getType());
    gencode += "(" + typestr + ")" + dumpOperand(instr->getOperand(0));
    return gencode;
}

void InstructionDumper::dumpAlloca(llvm::AllocaInst *alloca) {
    string gencode = "";
    AllocaInfo allocaInfo;
    if(PointerType *allocatypeptr = dyn_cast<PointerType>(alloca->getType())) {
        Type *ptrElementType = allocatypeptr->getPointerElementType();
        std::string typestring = typeDumper->dumpType(ptrElementType);
        int count = readInt32Constant(alloca->getOperand(0));
        string name = localNames->getOrCreateName(alloca);
        // cout << "alloca var name [" << name << "]" << endl;
        localExpressionByValue->operator[](alloca) = name;
        if(count == 1) {
            if(ArrayType *arrayType = dyn_cast<ArrayType>(ptrElementType)) {
                int innercount = arrayType->getNumElements();
                Type *elementType = arrayType->getElementType();
                string allocaDeclaration = typeDumper->dumpType(elementType) + " " + 
                    dumpOperand(alloca) + "[" + easycl::toString(innercount) + "]";
                allocaInfo.alloca = alloca;
                allocaInfo.refValue = alloca;
                allocaInfo.definition = allocaDeclaration;
                allocaDeclarations->push_back(allocaInfo);
                return;
            } else {
                Value *refInstruction = alloca;
                // if the elementType is a pointer, assume its global?
                if(isa<PointerType>(ptrElementType)) {
                    // find the store
                    for(auto it=alloca->user_begin(); it != alloca->user_end(); it++) {
                        User *user = *it;
                        if(StoreInst *store = dyn_cast<StoreInst>(user)) {
                            int storeop0space = cast<PointerType>(store->getOperand(0)->getType())->getAddressSpace();
                            refInstruction = store->getOperand(0);
                            if(storeop0space == 1) {
                                gencode += "global ";
                                updateAddressSpace(alloca, 1);
                            }
                            copyAddressSpace(user, alloca);
                            typestring = typeDumper->dumpType(ptrElementType);
                        }
                    }
                }
                string allocaDeclaration = gencode + typestring + " " + dumpOperand(alloca) + "[1]";
                // just declare this at the head of th efunction
                allocaInfo.alloca = alloca;
                allocaInfo.refValue = refInstruction;
                allocaInfo.definition = allocaDeclaration;
                allocaDeclarations->push_back(allocaInfo);
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

std::string InstructionDumper::dumpLoad(llvm::LoadInst *instr) {
    string rhs = dumpOperand(instr->getOperand(0)) + "[0]";
    copyAddressSpace(instr->getOperand(0), instr);
    return rhs;
}

std::string InstructionDumper::dumpStore(llvm::StoreInst *instr) {
    string gencode = "";
    copyAddressSpace(instr->getOperand(0), instr->getOperand(1));
    string rhs = dumpOperand(instr->getOperand(0));
    rhs = stripOuterParams(rhs);
    gencode += dumpOperand(instr->getOperand(1)) + "[0] = " + rhs;
    return gencode;
}

std::vector<std::string> InstructionDumper::dumpInsertValue(llvm::InsertValueInst *instr) {
    string lhs = "";
    // cout << "lhs undef value? " << isa<UndefValue>(instr->getOperand(0)) << endl;
    string incomingOperand = dumpOperand(instr->getOperand(0));
    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getType();
    bool declaredVar = false;
    if(incomingOperand == "") {
        variablesToDeclare->insert(instr);
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
                lhs = "((" + typeDumper->dumpType(castType) + ")&" + lhs + ")";
                lhs += string("[") + easycl::toString(idx) + "]";
            } else {
                // generic struct
                Type *elementType = structtype->getElementType(idx);
                lhs += string(".f") + easycl::toString(idx);
                newType = elementType;
            }
        } else {
            currentType->dump();
            throw runtime_error("type not implemented in insertvalue");
        }
        currentType = newType;
    }
    std::vector<std::string> res;
    res.push_back(lhs + " = " + dumpOperand(instr->getOperand(1)));
    if(!declaredVar) {
        variablesToDeclare->insert(instr);
        res.push_back(dumpOperand(instr) + " = " + incomingOperand);
    }
    return res;
}

std::string InstructionDumper::dumpExtractValue(llvm::ExtractValueInst *instr) {
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
                lhs = "((" + typeDumper->dumpType(castType) + ")&" + lhs + ")";
                lhs += string("[") + easycl::toString(idx) + "]";
            } else {
                // generic struct
                Type *elementType = structtype->getElementType(idx);
                lhs += string(".f") + easycl::toString(idx);
                newType = elementType;
            }
        } else {
            currentType->dump();
            throw runtime_error("type not implemented in extractvalue");
        }
        currentType = newType;
    }
    gencode += lhs;
    return gencode;
}

std::string InstructionDumper::dumpGetElementPtr(llvm::GetElementPtrInst *instr) {
    string gencode = "";
    int numOperands = instr->getNumOperands();
    string rhs = "";
    rhs += "" + dumpOperand(instr->getOperand(0));
    Type *currentType = instr->getOperand(0)->getType();
    PointerType *op0typeptr = dyn_cast<PointerType>(instr->getOperand(0)->getType());
    if(op0typeptr == 0) {
        throw runtime_error("dumpgetelementptr op0typeptr is 0");
    }
    int addressspace = op0typeptr->getAddressSpace();
    if(addressspace == 3) { // local/shared memory
        // pointer into shared memory.
        sharedVariablesToDeclare->insert(instr->getOperand(0));
    }
    for(int d=0; d < numOperands - 1; d++) {
        Type *newType = 0;
        if(currentType->isPointerTy() || isa<ArrayType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    rhs = "(&" + rhs + ")";
                }
            }
            string idxstring = dumpOperand(instr->getOperand(d + 1));
            idxstring = stripOuterParams(idxstring);
            rhs += string("[") + idxstring + "]";
            newType = currentType->getPointerElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = getName(structtype);
            if(structName == "struct.float4") {
                int idx = readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, addressspace);
                newType = elementType;
                rhs = "((" + typeDumper->dumpType(castType) + ")&" + rhs + ")";
                rhs += string("[") + easycl::toString(idx) + "]";
            } else {
                // generic struct
                int idx = readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                rhs += string(".f") + easycl::toString(idx);
                newType = elementType;
                if(isa<PointerType>(newType)) {
                    // if its a pointer in a struct, hackily assume gloal for now
                    addressspace = 1;
                } else {
                    addressspace = 0;
                }
            }
        } else {
            currentType->dump();
            throw runtime_error("type not implemented in gpe");
        }
        // if new type is a pointer, and old type was a struct, then we assume its a global pointer, and therefore
        // update the addressspace to be global, ie 1.  This is a bit hacky I know
        currentType = newType;
    }
    updateAddressSpace(instr, addressspace);
    rhs = "(&" + rhs + ")";
    cout << "gep rhs=" << rhs << endl;
    return rhs;
}

std::string InstructionDumper::dumpSelect(SelectInst *instr) {
    string gencode = "";
    copyAddressSpace(instr->getOperand(1), instr);
    gencode += dumpOperand(instr->getCondition()) + " ? ";
    gencode += dumpOperand(instr->getOperand(1)) + " : ";
    gencode += dumpOperand(instr->getOperand(2));
    return gencode;
}

std::string InstructionDumper::dumpMemcpyCharCharLong(llvm::CallInst *instr) {
    std::string gencode = "";
    int totalLength = cast<ConstantInt>(instr->getOperand(2))->getSExtValue();
    int align = cast<ConstantInt>(instr->getOperand(3))->getSExtValue();
    string dstAddressSpaceStr = typeDumper->dumpAddressSpace(instr->getOperand(0)->getType());
    string srcAddressSpaceStr = typeDumper->dumpAddressSpace(instr->getOperand(1)->getType());
    string elementTypeString = "";
    if(align == 4) {
        elementTypeString = "int";
    } else if(align == 8) {
        elementTypeString = "int2";
    } else if(align == 16) {
        elementTypeString = "int4";
    } else {
        throw runtime_error("not implemented dumpmemcpy for align " + easycl::toString(align));
    }
    int numElements = totalLength / align;
    if(numElements >1) {
        gencode += "#pragma unroll\n";
        gencode += "    for(int __i=0; __i < " + easycl::toString(numElements) + "; __i++) {\n";
        gencode += "        ((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(0)) + ")[__i] = ";
        gencode += "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(1)) + ")[__i];\n";
        gencode += "    }\n";
    } else {
        gencode += "((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(0)) + ")[0] = ";
        gencode += "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + dumpOperand(instr->getOperand(1)) + ")[0];\n";
    }
    return gencode;
}

std::string InstructionDumper::dumpCall(llvm::CallInst *instr, const std::set< llvm::Function *> &dumpedFunctions, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    string gencode = "";
    string functionName = instr->getCalledValue()->getName().str();
    bool internalfunc = false;
    if(functionName == "llvm.ptx.read.tid.x") {
        return gencode + "get_local_id(0)";
    } else if(functionName == "llvm.ptx.read.tid.y") {
        return gencode + "get_local_id(1)";
    } else if(functionName == "llvm.ptx.read.tid.z") {
        return gencode + "get_local_id(2)";
    } else if(functionName == "llvm.ptx.read.ctaid.x") {
        return gencode + "get_group_id(0)";
    } else if(functionName == "llvm.ptx.read.ctaid.y") {
        return gencode + "get_group_id(1)";
    } else if(functionName == "llvm.ptx.read.ctaid.z") {
        return gencode + "get_group_id(2)";
    } else if(functionName == "llvm.ptx.read.nctaid.x") {
        return gencode + "get_num_groups(0)";
    } else if(functionName == "llvm.ptx.read.nctaid.y") {
        return gencode + "get_num_groups(1)";
    } else if(functionName == "llvm.ptx.read.nctaid.z") {
        return gencode + "get_num_groups(2)";
    } else if(functionName == "llvm.ptx.read.ntid.x") {
        return gencode + "get_local_size(0)";
    } else if(functionName == "llvm.ptx.read.ntid.y") {
        return gencode + "get_local_size(1)";
    } else if(functionName == "llvm.ptx.read.ntid.z") {
        return gencode + "get_local_size(2)";
    } else if(functionName == "llvm.cuda.syncthreads" || functionName == "_Z11syncthreadsv") {
        return gencode + "barrier(CLK_GLOBAL_MEM_FENCE)";
    } else if(functionName == "llvm.dbg.value") {
        // ignore
        return "";
    } else if(functionName == "llvm.dbg.declare") {
        // ignore
        return "";
    } else if(functionName == "_Z11__shfl_downIfET_S0_ii") {
        gencode += "__shfl_down_3(scratch, ";
        int i = 0;
        for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
            Value *op = &*it->get();
            if(i > 0) {
                gencode += ", ";
            }
            gencode += stripOuterParams(dumpOperand(op));
            i++;
        }
        gencode += ")";
        cout << "inserting " << functionName << " into shimfunctionsneeded" << endl;
        shimFunctionsNeeded->insert("__shfl_down_3");
        return gencode;
    } else if(functionName == "_Z11__shfl_downIfET_S0_i") {
        gencode += "__shfl_down_2(scratch, ";
        int i = 0;
        for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
            Value *op = &*it->get();
            if(i > 0) {
                gencode += ", ";
            }
            gencode += stripOuterParams(dumpOperand(op));
            i++;
        }
        gencode += ")";
        cout << "inserting " << functionName << " into shimfunctionsneeded" << endl;
        shimFunctionsNeeded->insert("__shfl_down_2");
        return gencode;
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
        return gencode + "barrier(CLK_GLOBAL_MEM_FENCE)";
    } else if(functionName == "llvm.lifetime.start") {
        return "";  // just ignore for now
    } else if(functionName == "llvm.lifetime.end") {
        return "";  // just ignore for now
    } else if(functionName == "_Z11make_float4ffff") {
        // change this into something like: (float4)(a, b, c, d)
        functionName = "(float4)";
        internalfunc = true;
    } else if(functionName == "_GLOBAL__sub_I_struct_initializer.cu") {
        cerr << "WARNING: skipping _GLOBAL__sub_I_struct_initializer.cu" << endl;
        return "";
    } else if(functionName == "__nvvm_reflect") {
        return gencode + " 0"; //ignore, (but pretend to return 0)
    } else if(functionName == "llvm.memcpy.p0i8.p0i8.i64") {
        return dumpMemcpyCharCharLong(instr);  // just ignore for now
    } else if(functionNamesMap->isMappedFunction(functionName)) {
        functionName = functionNamesMap->getFunctionMappedName(functionName);
        internalfunc = true;
    }
    gencode += functionName + "(";
    int i = 0;
    for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
        Value *op = &*it->get();
        if(i > 0) {
            gencode += ", ";
        }
        gencode += stripOuterParams(dumpOperand(op));
        i++;
    }
    if(!internalfunc) {
        if(i > 0) {
            gencode += ", ";
        }
        gencode += "scratch";
        Module *M = instr->getModule();
        Function *F = M->getFunction(StringRef(functionName));
        if(F != 0) {
            // check arguments...
            bool addressSpacesMatch = true;
            // auto callit = instr->arg_begin();
            int i = 0;
            ostringstream manglingpostfix;
            for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
                Value *callArg = instr->getArgOperand(i);
                Argument *calleeArg = &*it;
                if(PointerType *callPtr = dyn_cast<PointerType>(callArg->getType())) {
                    PointerType *calleePtr = cast<PointerType>(calleeArg->getType());
                    char thisaddressspacechar = 'p'; // private
                    switch(callPtr->getAddressSpace()) {
                        case 0:
                            break;
                        case 1:
                            thisaddressspacechar = 'g';  // global
                            break;
                        case 3:
                            thisaddressspacechar = 's';  // shared
                            break;
                        case 4:
                            thisaddressspacechar = 'c';  // constant
                            break;
                        default:
                            cout << "address space: " << callPtr->getAddressSpace() << endl;
                            throw runtime_error("unhandled address space");
                    }
                    manglingpostfix << thisaddressspacechar;
                    if(callPtr->getAddressSpace() != calleePtr->getAddressSpace()) {
                        addressSpacesMatch = false;
                        cout << "arg " << callArg->getName().str() << " needs address space mutation" << endl;
                        // break;
                    }
                }
                i++;
            }
            if(!addressSpacesMatch) {
                string newName = F->getName().str() + "_" + manglingpostfix.str();
                cout << "new name [" << newName << "]" << endl;
                bool alreadyExists = globalNames->hasName(newName);
                cout << "alreadyeists? " << alreadyExists << endl;

                int numArgs = instr->getNumArgOperands();
                cout << "numArgs " << numArgs << endl;
                int i;

                Function *newFunc = 0;
                if(!alreadyExists) {
                    cout << "cloning new funciton " << newName << endl;
                    ValueToValueMapTy valueMap;
                    newFunc = CloneFunction(F,
                                   valueMap,
                                   false);
                    newFunc->setName(newName);
                    i = 0;
                    for(auto it=newFunc->arg_begin(); it != newFunc->arg_end(); it++) {
                        // Argument *callArg = callit->;
                        Value *callArg = instr->getArgOperand(i);
                        Argument *calleeArg = &*it;
                        copyAddressSpace(callArg, calleeArg);
                        i++;
                    }
                    if(globalNames->getOrCreateName(newFunc, newName) != newName) {
                        cout << "somehow created same name twice" << endl;
                        throw runtime_error("somehow created same name twice");
                    }
                }
                newFunc = cast<Function>(globalNames->getValueByName(newName));
                // at this point, we only really want to insert it into needed functions if 
                // its not there already yet
                // also we need to mangle the name anyway....
                // maybe we use the name mangling to check if it's already there???
                cout << "inserting new funciton into neededfunctions" << endl;
                neededFunctions->insert(newFunc);
                if(isa<PointerType>(newFunc->getReturnType()) && dumpedFunctions.find(newFunc) == dumpedFunctions.end()) {
                    needDependencies = true;
                    return "";
                }
                F = newFunc;
                functionName = newName;
            } else {
                neededFunctions->insert(F);
                if(isa<PointerType>(F->getReturnType()) && dumpedFunctions.find(F) == dumpedFunctions.end()) {
                    needDependencies = true;
                    return "";
                }
            // do we need to walk this function first?
            // check the return code
            }

            gencode = functionName + "(";
            i = 0;
            for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
                Value *op = &*it->get();
                if(i > 0) {
                    gencode += ", ";
                }
                gencode += stripOuterParams(dumpOperand(op));
                i++;
            }
            if(isa<PointerType>(F->getReturnType())) {
                Type *returnType = returnTypeByFunction.at(F);
                cout << "function return type:" << endl;
                returnType->dump();
                cout << endl;
                if(PointerType *retptr = dyn_cast<PointerType>(returnType)) {
                    int functionReturnAddressSpace = retptr->getAddressSpace();
                    cout << " updating call instruction to addressspace " << functionReturnAddressSpace << endl;
                    updateAddressSpace(instr, functionReturnAddressSpace);
                }
            }
        } else {
            cout << "couldnt find function " + functionName << endl;
            throw runtime_error("couldnt find function " + functionName);
        }
    }
    gencode += ")";
    return gencode;
}

bool InstructionDumper::runRhsGeneration(llvm::Instruction *instruction, std::vector<std::string> *additionalLinesNeeded, const std::set< llvm::Function *> &dumpedFunctions, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    needDependencies = false;
    auto opcode = instruction->getOpcode();
    string instructionCode = "";
    switch(opcode) {
        case Instruction::FAdd:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "+");
            break;
        case Instruction::FSub:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "-");
            break;
        case Instruction::FMul:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "*");
            break;
        case Instruction::FDiv:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
            break;
        case Instruction::Sub:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "-");
            break;
        case Instruction::Add:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "+");
            break;
        case Instruction::Mul:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "*");
            break;
        case Instruction::SDiv:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
            break;
        case Instruction::UDiv:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
            break;
        case Instruction::SRem:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "%");
            break;
        case Instruction::And:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "&");
            break;
        case Instruction::Or:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "|");
            break;
        case Instruction::Xor:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "^");
            break;
        case Instruction::LShr:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), ">>");
            break;
        case Instruction::Shl:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "<<");
            break;
        case Instruction::AShr:
            instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), ">>");
            break;
        case Instruction::ICmp:
            instructionCode = dumpIcmp(cast<ICmpInst>(instruction));
            break;
        case Instruction::FCmp:
            instructionCode = dumpFcmp(cast<FCmpInst>(instruction));
            break;
        case Instruction::SExt:
            instructionCode = dumpSExt(cast<CastInst>(instruction));
            break;
        case Instruction::ZExt:
            instructionCode = dumpZExt(cast<CastInst>(instruction));
            break;
        case Instruction::FPExt:
            instructionCode = dumpFPExt(cast<CastInst>(instruction));
            break;
        case Instruction::FPTrunc:
            instructionCode = dumpFPTrunc(cast<CastInst>(instruction));
            break;
        case Instruction::Trunc:
            instructionCode = dumpTrunc(cast<CastInst>(instruction));
            break;
        case Instruction::UIToFP:
            instructionCode = dumpUIToFP(cast<UIToFPInst>(instruction));
            break;
        case Instruction::SIToFP:
            instructionCode = dumpSIToFP(cast<SIToFPInst>(instruction));
            break;
        case Instruction::FPToUI:
            instructionCode = dumpFPToUI(cast<FPToUIInst>(instruction));
            break;
        case Instruction::FPToSI:
            instructionCode = dumpFPToSI(cast<FPToSIInst>(instruction));
            break;
        case Instruction::BitCast:
            instructionCode = dumpBitCast(cast<BitCastInst>(instruction));
            break;
        case Instruction::AddrSpaceCast:
            instructionCode = dumpAddrSpaceCast(cast<AddrSpaceCastInst>(instruction));
            break;
        // case Instruction::PtrToInt:
        //     instructionCode = dumpPtrToInt(cast<PtrToIntInst>(instruction));
        //     break;
        // case Instruction::IntToPtr:
        //     instructionCode = dumpInttoPtr(cast<IntToPtrInst>(instruction));
        //     break;
        case Instruction::Select:
            instructionCode = dumpSelect(cast<SelectInst>(instruction));
            break;
        case Instruction::GetElementPtr:
            instructionCode = dumpGetElementPtr(cast<GetElementPtrInst>(instruction));
            break;
        case Instruction::InsertValue:
            *additionalLinesNeeded = dumpInsertValue(cast<InsertValueInst>(instruction));
            return true;
        case Instruction::ExtractValue:
            instructionCode = dumpExtractValue(cast<ExtractValueInst>(instruction));
            break;
        case Instruction::Store:
            instructionCode = dumpStore(cast<StoreInst>(instruction));
            break;
        case Instruction::Call:
            instructionCode = dumpCall(cast<CallInst>(instruction), dumpedFunctions, returnTypeByFunction);
            break;
        case Instruction::Load:
            instructionCode = dumpLoad(cast<LoadInst>(instruction));
            break;
        case Instruction::Alloca:
            dumpAlloca(cast<AllocaInst>(instruction));
            // return "";
            return true;
        // case Instruction::Br:
        //     instructionCode = dumpBranch(cast<BranchInst>(instruction));
        //     return instructionCode;
        //     // break;
        // case Instruction::Ret:
        //     instructionCode = dumpReturn(cast<ReturnInst>(instruction));
        //     return instructionCode + ";\n";
        //     // break;
        // case Instruction::PHI:
        //     addPHIDeclaration(cast<PHINode>(instruction));
        //     return "";
        //     // break;
        default:
            cout << "opcode string " << instruction->getOpcodeName() << endl;
            throw runtime_error("unknown opcode");
    }
    if(isa<StoreInst>(instruction)) {
        additionalLinesNeeded->push_back(instructionCode);
        return true;
    }
    if(instructionCode != "") {
        cout << "instructiondumper.runRhsGeneration instructioncode=[" << instructionCode <<"] localnames hasvalue? " <<
            localNames->hasValue(instruction) << " additionalines.size()=" << additionalLinesNeeded->size() << endl;
        (*localExpressionByValue)[instruction] = instructionCode;
    }
    if(needDependencies) {
        cout << "dumpinstruction: need dependencies" << endl;
        return false;
    }
    return true;
}

} // namespace cocl
