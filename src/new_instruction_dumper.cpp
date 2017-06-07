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

#include "new_instruction_dumper.h"

#include "ClWriter.h"
#include "LocalNames.h"
#include "GlobalNames.h"
#include "type_dumper.h"
#include "function_names_map.h"
#include "LocalValueInfo.h"
#include "mutations.h"
#include "ExpressionsHelper.h"
#include "readIR.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include <vector>
#include <string>
#include <memory>
#include <iostream>

using namespace std;
using namespace llvm;

namespace cocl {

NewInstructionDumper::NewInstructionDumper(
        llvm::Module *M,
        GlobalNames *globalNames, LocalNames *localNames, TypeDumper *typeDumper, const FunctionNamesMap *functionNamesMap,

        // std::set<std::string> *shimFunctionsNeeded,
        cocl::Shims *shims,
        std::set<llvm::Function *> *neededFunctions,

        std::map<llvm::Value *, std::string> *globalExpressionByValue,
        std::map<llvm::Value *, unique_ptr<LocalValueInfo > > *localValueInfos
        ) :
    M(M),
    globalNames(globalNames),
    localNames(localNames),
    typeDumper(typeDumper),
    functionNamesMap(functionNamesMap),

    shims(shims),
    neededFunctions(neededFunctions),

    globalExpressionByValue(globalExpressionByValue),
    localValueInfos(localValueInfos)
        {
    if(M == 0) {
        cout << "NewInstructionDumper constr() M is 0" << endl;
        throw runtime_error("NewInstructionDumper constr() M is 0");
    }
}

LocalValueInfo *NewInstructionDumper::dumpConstant(llvm::Constant *constant) {
    // maybe this should be somewhere more generic?
    LocalValueInfo *constantInfo = LocalValueInfo::getOrCreate(localNames, localValueInfos, constant, constant->getName().str());
    unsigned int valueTy = constant->getValueID();
    if(ConstantInt *constantInt = dyn_cast<ConstantInt>(constant)) {
        constantInfo->setAddressSpace(0);
        constantInfo->setExpression(easycl::toString(constantInt->getSExtValue()));
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        return constantInfo;
    } else if(isa<ConstantStruct>(constant)) {
        throw runtime_error("constantStruct not implemented in basicblockdumper.dumpconstant");
    } else if(isa<ConstantExpr>(constant)) {
        dumpConstantExpr(constantInfo);
        return constantInfo;
    } else if(ConstantFP *constantFP = dyn_cast<ConstantFP>(constant)) {
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        constantInfo->setAddressSpace(0);
        constantInfo->setExpression(ReadIR::dumpFloatConstant(forceSingle, constantFP));
        return constantInfo;
    } else if(GlobalValue *global = dyn_cast<GlobalValue>(constant)) {
        if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
            int addressspace = pointerType->getAddressSpace();
            if(addressspace == 3) {  // if it's local memory, it's not really 'global', juts return the name
                constantInfo->clWriter.reset(new SharedClWriter(constantInfo));
                constantInfo->setAddressSpace(3);
                constantInfo->setAsAssigned();
                constantInfo->setExpression(constantInfo->name);
                return constantInfo;
            }
        }
        // at about this point we should pehaps swap to come global-specific class to handle this?
        if(globalNames->hasName(constant)) {
            // hmmmm, shouldwe be handling global values too???
            constantInfo->clWriter.reset(new ClWriter(constantInfo));
            constantInfo->setAddressSpace(4);
            constantInfo->setExpression(globalNames->getName(constant));
            return constantInfo;
        }
        string name = global->getName().str();
        string ourinstrstr = "(&" + name + ")";
        updateAddressSpace(constant, 4);  // 4 means constant
        constantInfo->setAddressSpace(4);
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        globalExpressionByValue->operator[](constant) = ourinstrstr;

        constantInfo->setExpression(ourinstrstr);
        return constantInfo;
    } else if(isa<UndefValue>(constant)) {
        cout << "undef, not hnalded" << endl;
        throw runtime_error("dumpconstnat, doesnt handle undef, for now");
    } else if(isa<ConstantPointerNull>(constant)) {
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        constantInfo->setAddressSpace(0);
        constantInfo->setExpression("0");
        return constantInfo;
    } else {
        cout << "dumpconstant, unhandled valuetype valueTy " << valueTy << endl;
        constant->dump();
        cout << endl;
        throw runtime_error("unknown constnat type");
    }
}

// lets assumes hit is always local for now
// we'll create some separate thing for global constants, maybe just copy and paste, so we
// dont have to think about how to generalize local vs constant instruction dumping...
void NewInstructionDumper::dumpConstantExpr(LocalValueInfo *localValueInfo) {
    ConstantExpr *expr = cast<ConstantExpr>(localValueInfo->value);
    // this means things like:
    // shared memory 
    Instruction *instr = expr->getAsInstruction();
    std::map<llvm::Function *, llvm::Type*> returnTypeByFunction;
    LocalValueInfo *instrValueInfo = LocalValueInfo::getOrCreate(localNames, localValueInfos, instr);
    runGeneration(instrValueInfo, returnTypeByFunction);

    string rhs = instrValueInfo->getExpr();
    localValueInfo->setAddressSpaceFrom(instrValueInfo);
    localValueInfo->setExpression(rhs);
}

LocalValueInfo *NewInstructionDumper::getOperand(Value *op) {
    if(localValueInfos->find(op) != localValueInfos->end()) {
        return localValueInfos->at(op).get();
    }
    if(Constant *constant = dyn_cast<Constant>(op)) {
        LocalValueInfo *valueInfo = dumpConstant(constant);
        return valueInfo;
    }
    throw NeedValueDependencyException(op);
}

void NewInstructionDumper::dumpIcmp(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    CmpInst *instr = cast<CmpInst>(localValueInfo->value);
    localValueInfo->setAddressSpace(0);

    string gencode = "";
    CmpInst::Predicate predicate = instr->getPredicate();  // note: we should detect signedness...
    string predicate_string = "";
    switch(predicate) {
        case CmpInst::ICMP_SLT:
        case CmpInst::ICMP_ULT:
            predicate_string = "<";
            break;
        case CmpInst::ICMP_SGT:
        case CmpInst::ICMP_UGT:
            predicate_string = ">";
            break;
        case CmpInst::ICMP_SGE:
        case CmpInst::ICMP_UGE:
            predicate_string = ">=";
            break;
        case CmpInst::ICMP_SLE:
        case CmpInst::ICMP_ULE:
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

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();

    // handle case like `a & 3 == 0`
    op0 = ExpressionsHelper::stripOuterParams(op0);
    op1 = ExpressionsHelper::stripOuterParams(op1);

    bool parenthesizeOps = predicate_string == "==" || predicate_string == "!=";
    if(parenthesizeOps) {
        gencode += "(" + op0 + ") " + predicate_string + " (" + op1 + ")";
    } else {
        gencode += op0 + " " + predicate_string + " " + op1;
    }

    localValueInfo->setExpression("(" + gencode + ")");
}

void NewInstructionDumper::dumpFcmp(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    CmpInst *instr = cast<CmpInst>(localValueInfo->value);
    localValueInfo->setAddressSpace(0);

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

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();

    op0 = ExpressionsHelper::stripOuterParams(op0);
    op1 = ExpressionsHelper::stripOuterParams(op1);
    gencode += op0;
    gencode += " " + predicate_string + " ";
    gencode += op1;

    localValueInfo->setExpression("(" + gencode + ")");
}

void NewInstructionDumper::dumpBinaryOperator(LocalValueInfo *localValueInfo, std::string opstring) {
    Instruction *instr = cast<Instruction>(localValueInfo->value);
    string gencode = "";
    LocalValueInfo *op1info = getOperand(instr->getOperand(0));
    gencode += op1info->getExpr() + " ";

    gencode += opstring + " ";

    LocalValueInfo *op2info = getOperand(instr->getOperand(1));
    gencode += op2info->getExpr();

    localValueInfo->setExpression("(" + gencode + ")");
    localValueInfo->setAddressSpace(0);
    localValueInfo->clWriter.reset(new BinaryClWriter(localValueInfo));
}

void NewInstructionDumper::dumpExt(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    ostringstream gencode;
    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    gencode << "(" << typeDumper->dumpType(instr->getType()) << ")" << op0info->getExpr();

    localValueInfo->setExpression("(" + gencode.str() + ")");
    localValueInfo->setAddressSpace(0);
}

void NewInstructionDumper::dumpTrunc(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    string op0 = op0info->getExpr();

    // since this is float point trunc, lets just assume we're going from double to float
    // fix any exceptiosn to this rule later
    string typestr = typeDumper->dumpType(instr->getType());
    localValueInfo->setExpression("(" + typestr + ")" + op0);
}

void NewInstructionDumper::dumpBitCast(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    BitCastInst *instr = cast<BitCastInst>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    string op0 = op0info->getExpr();

    // we will split the code into two parts:
    // assignment, like:  v3 = incoming-expression;
    // bitcast, like v4 = *(int *)&v3;
    // actually, we can do this by just tweaking the conitions in which we do assign
    // lets do that for now

    string gencode = "";
    string op0str = op0;
    localValueInfo->setAddressSpace(0);
    if(PointerType *srcType = dyn_cast<PointerType>(instr->getSrcTy())) {
        if(PointerType *destType = dyn_cast<PointerType>(instr->getDestTy())) {
            Type *castType = PointerType::get(destType->getElementType(), srcType->getAddressSpace());
            gencode += "((" + typeDumper->dumpType(castType) + ")" + op0str + ")";
            copyAddressSpace(instr->getOperand(0), instr);
            localValueInfo->setAddressSpaceFrom(instr->getOperand(0));
        }
    } else {
        // just pass through?
        gencode += "*(" + typeDumper->dumpType(instr->getDestTy()) + " *)&(" + op0str + ")";
    }
    localValueInfo->setExpression(gencode);
}

void NewInstructionDumper::dumpAddrSpaceCast(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    AddrSpaceCastInst *instr = cast<AddrSpaceCastInst>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    string op0 = op0info->getExpr();

    string gencode = "";
    string op0str = op0;
    copyAddressSpace(instr->getOperand(0), instr);
    localValueInfo->setAddressSpaceFrom(instr->getOperand(0));
    // hackily ignore casts if shared address space
    // actually, just ignore all address space casts, since they're all illegal in opencl...
    gencode += op0str;
    localValueInfo->setExpression(gencode);
}

void NewInstructionDumper::dumpSelect(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));
    LocalValueInfo *op2info = getOperand(instr->getOperand(2));

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();
    string op2 = op2info->getExpr();

    string gencode = "";
    copyAddressSpace(instr->getOperand(1), instr);
    localValueInfo->setAddressSpaceFrom(instr->getOperand(1));
    gencode += op0 + " ? ";
    gencode += op1 + " : ";
    gencode += op2;
    gencode = "(" + gencode + ")";

    localValueInfo->setExpression(gencode);
}

void NewInstructionDumper::dumpGetElementPtr(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    GetElementPtrInst *instr = cast<GetElementPtrInst>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));

    string gencode = "";
    int numOperands = instr->getNumOperands();
    string rhs = "";
    rhs += "" + op0info->getExpr();  // dumpOperand(instr->getOperand(0));
    Type *currentType = instr->getOperand(0)->getType();
    PointerType *op0typeptr = cast<PointerType>(instr->getOperand(0)->getType());
    int addressspace = op0typeptr->getAddressSpace();
    if(addressspace == 3) { // local/shared memory
        // pointer into shared memory.
        // so, this isnt a local value in llvm, its a global one
        // so, we need to choose to add it as a local variable
        Value *sharedValue = instr->getOperand(0);
        LocalValueInfo *sharedInfo = LocalValueInfo::getOrCreate(
            localNames, localValueInfos, sharedValue, sharedValue->getName().str());
        sharedInfo->setAddressSpace(3);
    }
    llvm::Type *prevType = nullptr;
    for(int d=0; d < numOperands - 1; d++) {
        Type *newType = 0;
        // l << "   gep d=" << d << " currnettype=" << typeDumper->dumpType(currentType) << std::endl;
        if(SequentialType *seqType = dyn_cast<SequentialType>(currentType)) {
            // l << "    gep seqtype" << std::endl;
            if(d == 0) {
                if(isa<ArrayType>(seqType->getElementType())) {
                    rhs = "(&" + rhs + ")";
                }
            }

            LocalValueInfo *thisInfo = getOperand(instr->getOperand(d + 1));
            string idxstring = thisInfo->getExpr();
            idxstring = ExpressionsHelper::stripOuterParams(idxstring);
            rhs += string("[") + idxstring + "]";

            // if this is an array of pointers, inside a struct, we are going to assume
            // it is an array of virtual mem offsets
            // we should check the parent type
            // also, this should be an array of *pointers*, not just primitive elements
            if(prevType != nullptr &&
                    isa<StructType>(prevType) &&
                    isa<PointerType>(seqType->getElementType())
                    ) {
                addressspace = 5;
                newType = seqType->getElementType();
            } else {
                newType = seqType->getElementType();
            }
        } else if(PointerType *pointerType = dyn_cast<PointerType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(pointerType->getElementType())) {
                    rhs = "(&" + rhs + ")";
                }
            }
            LocalValueInfo *thisInfo = getOperand(instr->getOperand(d + 1));
            string idxstring = thisInfo->getExpr();
            idxstring = ExpressionsHelper::stripOuterParams(idxstring);
            rhs += string("[") + idxstring + "]";
            newType = pointerType->getElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = ReadIR::getName(structtype);
            if(structName == "struct.float4") {
                int idx = ReadIR::readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, addressspace);
                newType = elementType;
                rhs = "((" + typeDumper->dumpType(castType) + ")&" + rhs + ")";
                rhs += string("[") + easycl::toString(idx) + "]";
            } else {
                // generic struct
                int idx = ReadIR::readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                rhs += string(".f") + easycl::toString(idx);
                newType = elementType;
                if(PointerType *newTypeAsPointer = dyn_cast<PointerType>(newType)) {
                    // if its a pointer in a struct, hackily assume gloal for now
                    addressspace = 1;
                    // ~~assume addressspace 5, which we define to mean: virtual memory~~
                    // ~~addressspace = 5;~~

                    // if its a pointer to pointer, it's address space 5, otherwis 1
                    if(isa<PointerType>(newTypeAsPointer->getElementType())) {
                        // l << "gep   struct child is pointer to pointer" << std::endl;
                        addressspace = 5;
                        // probably should unwrap this.  something for hte future...
                    }
                } else {
                    // addressspace = 0;
                }
            }
        } else {
            cout << "type unimplemeneted in gep:" << endl;
            currentType->dump();
            cout << endl;
            cout << "isa pointer " << isa<PointerType>(currentType) << endl;
            cout << "isa struct " << isa<StructType>(currentType) << endl;
            cout << "isa composite " << isa<CompositeType>(currentType) << endl;
            cout << "isa sequential " << isa<SequentialType>(currentType) << endl;
            cout << "isa type " << isa<Type>(currentType) << endl;
            throw runtime_error("type not implemented in gep");
        }
        // if new type is a pointer, and old type was a struct, then we assume its a global pointer, and therefore
        // update the addressspace to be global, ie 1.  This is a bit hacky I know
        prevType = currentType;
        currentType = newType;
    }
    updateAddressSpace(instr, addressspace);
    localValueInfo->setAddressSpace(addressspace);
    rhs = "(" + ExpressionsHelper::stripOuterParams(rhs) + ")";
    rhs = "(&" + rhs + ")";

    localValueInfo->setExpression(rhs);
}

void NewInstructionDumper::dumpLoad(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    string rhs= "";
    bool destIsSinglePointer = false;
    if(PointerType *l1pointer = dyn_cast<PointerType>(instr->getType())) {
        if(PointerType *l2pointer = dyn_cast<PointerType>(l1pointer->getElementType())) {
        } else {
            destIsSinglePointer = true;
        }
    }
    if(cast<PointerType>(instr->getOperand(0)->getType())->getAddressSpace() == 5 && destIsSinglePointer) {
        localValueInfo->inlineCl.push_back(
            "global " + typeDumper->dumpType(instr->getType()) + " " + localValueInfo->name + "_gptrstep = getGlobalPointer(" +
                getOperand(instr->getOperand(0))->getExpr() + "[0], pGlobalVars" +
            ")"
        );
        this->usesVmem = true;
        rhs = localValueInfo->name + "_gptrstep";
        updateAddressSpace(instr, 1);
        localValueInfo->addressSpace = 1;
    } else {
        rhs = getOperand(instr->getOperand(0))->getExpr() + "[0]";
        copyAddressSpace(instr->getOperand(0), instr);
        localValueInfo->setAddressSpaceFrom(instr->getOperand(0));
    }

    localValueInfo->setExpression(rhs);
}

void NewInstructionDumper::dumpStore(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new StoreClWriter(localValueInfo));
    StoreInst *instr = cast<StoreInst>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));

    int destAddressSpace = cast<PointerType>(instr->getOperand(1)->getType())->getAddressSpace();
    std::string lhs = "";
    if(destAddressSpace == 5 && false) {  // vmem
        localValueInfo->inlineCl.push_back(
            "global float * " + localValueInfo->name + "_gptrstep = getGlobalPointer(" +
                op1info->getExpr() + ", pGlobalVars" +
            ")"
        );
        this->usesVmem = true;
        lhs = localValueInfo->name + "_gptrstep";
    } else {
        localValueInfo->setAddressSpaceFrom(instr->getOperand(1));
        copyAddressSpace(instr->getOperand(0), instr->getOperand(1));
        lhs = op1info->getExpr();
    }

    string rhs = op0info->getExpr();
    rhs = ExpressionsHelper::stripOuterParams(rhs);
    string inlinecode = lhs + "[0] = " + rhs;
    localValueInfo->inlineCl.push_back(inlinecode);
}

void NewInstructionDumper::dumpAlloca(cocl::LocalValueInfo *localValueInfo) {
    AllocaInfo allocaInfo;
    localValueInfo->clWriter.reset(new AllocaClWriter(localValueInfo));
    string name = localValueInfo->name;
    localValueInfo->setExpression(name);
}

void NewInstructionDumper::dumpExtractValue(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    ExtractValueInst *instr = cast<ExtractValueInst>(localValueInfo->value);

    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    LocalValueInfo *aggInfo = getOperand(instr->getAggregateOperand());
    localValueInfo->setAddressSpaceFrom(aggInfo);
    copyAddressSpace(instr, aggInfo->value);

    ostringstream gencode;
    ostringstream rhs;

    string incomingOperand = aggInfo->getExpr();

    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getAggregateOperand()->getType();
    rhs << incomingOperand;
    ArrayRef<unsigned> indices = instr->getIndices();
    int numIndices = instr->getNumIndices();

    for(int d=0; d < numIndices; d++) {
        int idx = indices[d];
        Type *newType = 0;
        if(PointerType *pointerType = dyn_cast<PointerType>(currentType)) {
            LocalValueInfo *thisInfo = getOperand(instr->getOperand(d + 1));
            rhs << "[" << thisInfo->getExpr() << "]";
            newType = pointerType->getElementType();
        } else if(ArrayType *arrayType = dyn_cast<ArrayType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(arrayType->getElementType())) {
                    string oldRhs = rhs.str();
                    rhs.str("");
                    rhs << "(&" << oldRhs << ")";
                }
            }
            rhs << "[" << idx << "]";
            newType = arrayType->getElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = ReadIR::getName(structtype);
            if(structName == "struct.float4") {
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, 0);
                newType = elementType;
                string oldRhs = rhs.str();
                rhs.str("");
                rhs << "((" << typeDumper->dumpType(castType) << ")&" << oldRhs << ")";
                rhs << "[" << idx << "]";
            } else {
                // generic struct
                Type *elementType = structtype->getElementType(idx);
                rhs << ".f" << idx;
                newType = elementType;
            }
        } else {
            cout << "NewInstructionDumper::dumpExtractValue unimplemented type" << endl;
            currentType->dump();
            throw runtime_error("type not implemented in extractvalue");
        }
        currentType = newType;
    }
    localValueInfo->setExpression(rhs.str());
}

void NewInstructionDumper::dumpInsertValue(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new InsertValueClWriter(localValueInfo));
    InsertValueClWriter *clWriter = cast<InsertValueClWriter>(localValueInfo->clWriter.get());
    InsertValueInst *instr = cast<InsertValueInst>(localValueInfo->value);

    LocalValueInfo *op0info = 0;
    if(isa<UndefValue>(instr->getOperand(0))) {
        clWriter->fromUndef = true;
    } else {
        op0info = getOperand(instr->getOperand(0));
    }
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));

    string lhs = "";

    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getType();
    string incomingOperand = "";
    if(clWriter->fromUndef) {
        localValueInfo->toBeDeclared = true;
        localValueInfo->toBeDeclared = true;
        localValueInfo->setExpression(localValueInfo->name);
        incomingOperand = localValueInfo->getExpr();
    } else {
        incomingOperand = op0info->getExpr();
    }
    lhs += incomingOperand;
    ArrayRef<unsigned> indices = instr->getIndices();
    int numIndices = instr->getNumIndices();
    for(int d=0; d < numIndices; d++) {
        int idx = indices[d];
        Type *newType = 0;
        if(SequentialType *seqType = dyn_cast<SequentialType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(seqType->getElementType())) {
                    lhs = "(&" + lhs + ")";
                }
            }
            lhs += string("[") + easycl::toString(idx) + "]";
            newType = seqType->getElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = ReadIR::getName(structtype);
            if(structName == "struct.float4") {
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, 0);
                newType = elementType;
                lhs = "((" + typeDumper->dumpType(castType) + ")&" + lhs + ")";
                lhs += string("[") + easycl::toString(idx) + "]";
            } else {
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
    string updateline = lhs + " = " + op1info->getExpr();
    localValueInfo->inlineCl.push_back(updateline);
    localValueInfo->setExpression(incomingOperand);
}

// this will be slowtastic, but at least it gets things working...
void NewInstructionDumper::dumpMemcpy(LocalValueInfo *localValueInfo, int align) {
    localValueInfo->clWriter.reset(new NoExpressionClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);
    int totalLength = cast<ConstantInt>(instr->getOperand(2))->getSExtValue();
    string dstAddressSpaceStr = typeDumper->dumpAddressSpace(instr->getOperand(0)->getType());
    string srcAddressSpaceStr = typeDumper->dumpAddressSpace(instr->getOperand(1)->getType());
    string elementTypeString = "";
    if(align == 1) {
        elementTypeString = "char";
    } else if(align == 4) {
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
        localValueInfo->inlineCl.push_back("for(int __i=0; __i < " + easycl::toString(numElements) + "; __i++) {");
        localValueInfo->inlineCl.push_back("    ((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(0))->getExpr() + ")[__i] = " +
            "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(1))->getExpr() + ")[__i]");
        localValueInfo->inlineCl.push_back("}\n");
    } else {
        localValueInfo->inlineCl.push_back("((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(0))->getExpr() + ")[0] = " +
            "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(1))->getExpr() + ")[0]");
    }
}

void NewInstructionDumper::writeShimCall(LocalValueInfo *localValueInfo, std::string shimName, std::string extraArgs, CallInst *instr) {
    // this probalby assumes:
    // - returns a primitive
    // - parameters are all primitives (no pointers)

    ostringstream gencode_ss;
    gencode_ss << shimName << "(" << extraArgs;
    int i = 0;
    for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
        Value *op = &*it->get();
        if(i > 0) {
            gencode_ss << ", ";
        }
        gencode_ss << ExpressionsHelper::stripOuterParams(getOperand(op)->getExpr());
        i++;
    }
    gencode_ss << ")";
    // shimFunctionsNeeded->insert(shimName);
    shims->use(shimName);
    localValueInfo->setAddressSpace(0);
    localValueInfo->setExpression(gencode_ss.str());
}

void NewInstructionDumper::dumpCall(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    localValueInfo->clWriter.reset(new CallClWriter(localValueInfo));
    CallInst *instr = cast<CallInst>(localValueInfo->value);

    Value *calledValue = instr->getCalledValue();
    string calledName = calledValue->getName().str();

    string functionName = instr->getCalledValue()->getName().str();
    bool internalfunc = false;
    if(functionName == "llvm.ptx.read.tid.x" || functionName == "llvm.nvvm.read.ptx.sreg.tid.x") { // second on is llvm 4.0, first is 3.8
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_id(0)");
        return;
    } else if(functionName == "llvm.ptx.read.tid.y" || functionName == "llvm.nvvm.read.ptx.sreg.tid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_id(1)");
        return;
    } else if(functionName == "llvm.ptx.read.tid.z" || functionName == "llvm.nvvm.read.ptx.sreg.tid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_id(2)");
        return;
    } else if(functionName == "llvm.ptx.read.ctaid.x" || functionName == "llvm.nvvm.read.ptx.sreg.ctaid.x") {  // second is for llvm4.0
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_group_id(0)");
        return;
    } else if(functionName == "llvm.ptx.read.ctaid.y" || functionName == "llvm.nvvm.read.ptx.sreg.ctaid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_group_id(1)");
        return;
    } else if(functionName == "llvm.ptx.read.ctaid.z" || functionName == "llvm.nvvm.read.ptx.sreg.ctaid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_group_id(2)");
        return;
    } else if(functionName == "llvm.ptx.read.nctaid.x" || functionName == "llvm.nvvm.read.ptx.sreg.nctaid.x") {  // second is for llvm 4.0
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_num_groups(0)");
        return;
    } else if(functionName == "llvm.ptx.read.nctaid.y" || functionName == "llvm.nvvm.read.ptx.sreg.nctaid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_num_groups(1)");
        return;
    } else if(functionName == "llvm.ptx.read.nctaid.z" || functionName == "llvm.nvvm.read.ptx.sreg.nctaid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_num_groups(2)");
        return;
    } else if(functionName == "llvm.ptx.read.ntid.x" || functionName == "llvm.nvvm.read.ptx.sreg.ntid.x") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_size(0)");
        return;
    } else if(functionName == "llvm.ptx.read.ntid.y" || functionName == "llvm.nvvm.read.ptx.sreg.ntid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_size(1)");
        return;
    } else if(functionName == "llvm.ptx.read.ntid.z" || functionName == "llvm.nvvm.read.ptx.sreg.ntid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_size(2)");
        return;
    } else if(functionName == "llvm.cuda.syncthreads" || functionName == "_Z11syncthreadsv") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("barrier(CLK_GLOBAL_MEM_FENCE)");
        return;
    } else if(functionName == "llvm.nvvm.barrier0") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("barrier(CLK_LOCAL_MEM_FENCE)");
        return;
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
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("barrier(CLK_GLOBAL_MEM_FENCE)");
        return;
    } else if(functionName == "llvm.dbg.value") {
        // ignore
        localValueInfo->skip();
        return;
    } else if(functionName == "llvm.dbg.declare") {
        // ignore
        localValueInfo->skip();
        return;
    } else if(functionName == "_Z8__umulhiii") {
        writeShimCall(localValueInfo, "__umulhi", "", instr);
        return;
    } else if(functionName == "_Z7sincosffPfS_") {
        localValueInfo->setAddressSpace(0);
        std::ostringstream gencode;
        gencode << "*" << getOperand(instr->getOperand(1))->getExpr() << " = sincos(";
        gencode << getOperand(instr->getOperand(0))->getExpr() << ", ";
        gencode << getOperand(instr->getOperand(2))->getExpr() << ");";
        localValueInfo->setExpression(gencode.str());
        return;
    } else if(functionName == "_Z9atomicAddIfET_PS0_S0_") {
        writeShimCall(localValueInfo, "__atomic_add_float", "", instr);
        return;
    } else if(functionName == "_Z9atomicIncPjj") {
        writeShimCall(localValueInfo, "__atomic_inc_uint", "", instr);
        return;
    } else if(functionName == "_Z11__shfl_downIfET_S0_ii") {
        writeShimCall(localValueInfo, "__shfl_down_3", "pGlobalVars->scratch, ", instr);
        this->usesScratch = true;
        return;
    } else if(functionName == "_Z11__shfl_downIfET_S0_i") {
        writeShimCall(localValueInfo, "__shfl_down_2", "pGlobalVars->scratch, ", instr);
        this->usesScratch = true;
        return;
    } else if(functionName == "llvm.lifetime.start") {
        // just ignore for now
        localValueInfo->skip();
        return;
    } else if(functionName == "llvm.lifetime.end") {
        // just ignore for now
        localValueInfo->skip();
        return;
    } else if(functionName == "_Z11make_float4ffff") {
        // change this into something like: (float4)(a, b, c, d)
        functionName = "(float4)";
        internalfunc = true;
    } else if(functionName == "_GLOBAL__sub_I_struct_initializer.cu") {
        cerr << "WARNING: skipping _GLOBAL__sub_I_struct_initializer.cu" << endl;
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("");
        return;
    } else if(functionName == "__nvvm_reflect") {
        localValueInfo->setExpression("0"); //ignore, (but pretend to return 0)
        localValueInfo->setAddressSpace(0);
        return;
    } else if(functionName == "llvm.memcpy.p0i8.p0i8.i64") {
        int align = cast<ConstantInt>(instr->getOperand(3))->getSExtValue();
        dumpMemcpy(localValueInfo, align);
        return;
    } else if(functionName == "_Z6memcpyPvPKvm") {
        dumpMemcpy(localValueInfo, 4);
        return;
    } else if(functionNamesMap->isMappedFunction(functionName)) {
        functionName = functionNamesMap->getFunctionMappedName(functionName);
        internalfunc = true;
    }
    string gencode = functionName + "(";
    int i = 0;
    for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
        Value *op = &*it->get();
        if(i > 0) {
            gencode += ", ";
        }
        gencode += ExpressionsHelper::stripOuterParams(getOperand(op)->getExpr());
        i++;
    }
    if(!internalfunc) {
        if(i > 0) {
            gencode += ", ";
        }
        localValueInfo->needDependencies = false;
        gencode += "pGlobalVars";
        Function *F = M->getFunction(functionName);
        if(checkCalledFunctionsDefined && F->isDeclaration()) { // ie, is it *just* a declaration, no definition?
            std::cout << functionName << " is called, but not defined" << std::endl;
            std::cout << "This is probalby a bug in Coriander. Please file an issue at https://github.com/hughperkins/coriander/issues/new" << std::endl;
            throw std::runtime_error(functionName + " is called, but not defined => cannot continue.  Sorry :-(");
        }
        if(F != 0) {
            // check arguments...
            bool addressSpacesMatch = true;
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
                    }
                }
                i++;
            }
            if(!addressSpacesMatch) {
                string newName = F->getName().str() + "_" + manglingpostfix.str();
                bool alreadyExists = globalNames->hasName(newName);
                int i;

                Function *newFunc = 0;
                if(!alreadyExists) {
                    ValueToValueMapTy valueMap;
                    newFunc = CloneFunction(F,
                                   valueMap);
                    newFunc->setName(newName);
                    i = 0;
                    for(auto it=newFunc->arg_begin(); it != newFunc->arg_end(); it++) {
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
                // cout << "inserting new funciton into neededfunctions" << endl;
                neededFunctions->insert(newFunc);
                if(isa<PointerType>(newFunc->getReturnType()) && returnTypeByFunction.find(newFunc) == returnTypeByFunction.end()) {
                    localValueInfo->needDependencies = true;
                    return;
                }
                F = newFunc;
                functionName = newName;
            } else {
                neededFunctions->insert(F);
                if(isa<PointerType>(F->getReturnType()) && returnTypeByFunction.find(F) == returnTypeByFunction.end()) {
                    localValueInfo->needDependencies = true;
                    return;
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
                gencode += ExpressionsHelper::stripOuterParams(getOperand(op)->getExpr());
                i++;
            }
            if(i > 0) {
                gencode += ", ";
            }
            gencode += "pGlobalVars";
            if(isa<PointerType>(F->getReturnType())) {
                Type *returnType = returnTypeByFunction.at(F);
                if(PointerType *retptr = dyn_cast<PointerType>(returnType)) {
                    int functionReturnAddressSpace = retptr->getAddressSpace();
                    updateAddressSpace(instr, functionReturnAddressSpace);
                    localValueInfo->setAddressSpace(functionReturnAddressSpace);
                }
            }
        } else {
            cout << "couldnt find function " + functionName << endl;
            throw runtime_error("couldnt find function " + functionName);
        }
    }
    gencode += ")";
    localValueInfo->setExpression(gencode);
}

void NewInstructionDumper::runGeneration(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    Instruction *instruction = cast<Instruction>(localValueInfo->value);
    localValueInfo->needDependencies = false;
    auto opcode = instruction->getOpcode();
    if(_addIRToCl) {
        string originalInstruction = "";
        originalInstruction += typeDumper->dumpType(instruction->getType()) + " " + localValueInfo->name + " =";
        originalInstruction += " " + string(instruction->getOpcodeName());
        for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
            Value *op = &*it->get();
            originalInstruction += " ";
            if(localNames->hasValue(op)) {
                originalInstruction += localNames->getName(op);
            } else {
                originalInstruction += "<unk>";
            }
        }
        localValueInfo->inlineCl.push_back("/* " + originalInstruction + " */");
    }
    string instructionCode = "";
    switch(opcode) {
        case Instruction::FAdd:
            dumpBinaryOperator(localValueInfo, "+");
            break;
        case Instruction::FSub:
            dumpBinaryOperator(localValueInfo, "-");
            break;
        case Instruction::FMul:
            dumpBinaryOperator(localValueInfo, "*");
            break;
        case Instruction::FDiv:
            dumpBinaryOperator(localValueInfo, "/");
            break;
        case Instruction::Sub:
            dumpBinaryOperator(localValueInfo, "-");
            break;
        case Instruction::Add:
            dumpBinaryOperator(localValueInfo, "+");
            break;
        case Instruction::Mul:
            dumpBinaryOperator(localValueInfo, "*");
            break;
        case Instruction::SDiv:
            dumpBinaryOperator(localValueInfo, "/");
            break;
        case Instruction::UDiv:
            dumpBinaryOperator(localValueInfo, "/");
            break;
        case Instruction::SRem:
            dumpBinaryOperator(localValueInfo, "%");
            break;
        case Instruction::And:
            dumpBinaryOperator(localValueInfo, "&");
            break;
        case Instruction::Or:
            dumpBinaryOperator(localValueInfo, "|");
            break;
        case Instruction::Xor:
            dumpBinaryOperator(localValueInfo, "^");
            break;
        case Instruction::LShr:
            dumpBinaryOperator(localValueInfo, ">>");
            break;
        case Instruction::Shl:
            dumpBinaryOperator(localValueInfo, "<<");
            break;
        case Instruction::AShr:
            dumpBinaryOperator(localValueInfo, ">>");
            break;

        case Instruction::ICmp:
            dumpIcmp(localValueInfo);
            break;
        case Instruction::FCmp:
            dumpFcmp(localValueInfo);
            break;

        case Instruction::SExt:
        case Instruction::ZExt:
        case Instruction::FPExt:
            dumpExt(localValueInfo);
            break;

        case Instruction::FPTrunc:
        case Instruction::Trunc:
        case Instruction::UIToFP:
        case Instruction::SIToFP:
        case Instruction::FPToUI:
        case Instruction::FPToSI:
            dumpTrunc(localValueInfo);
            break;

        case Instruction::BitCast:
            dumpBitCast(localValueInfo);
            break;
        case Instruction::AddrSpaceCast:
            dumpAddrSpaceCast(localValueInfo);
            break;
        // // case Instruction::PtrToInt:
        // //     instructionCode = dumpPtrToInt(cast<PtrToIntInst>(instruction));
        // //     break;
        // // case Instruction::IntToPtr:
        // //     instructionCode = dumpInttoPtr(cast<IntToPtrInst>(instruction));
        // //     break;
        case Instruction::Select:
            dumpSelect(localValueInfo);
            break;
        case Instruction::GetElementPtr:
            dumpGetElementPtr(localValueInfo);
            break;
        case Instruction::InsertValue:
            dumpInsertValue(localValueInfo);
            break;
        case Instruction::ExtractValue:
            dumpExtractValue(localValueInfo);
            break;
        case Instruction::Store:
            dumpStore(localValueInfo);
            break;
        case Instruction::Call:
            dumpCall(localValueInfo, returnTypeByFunction);
            break;
        case Instruction::Load:
            dumpLoad(localValueInfo);
            break;
        case Instruction::Alloca:
            dumpAlloca(localValueInfo);
            break;
        default:
            cout << "opcode string " << instruction->getOpcodeName() << endl;
            throw runtime_error("unknown opcode");
    }
}

} // namespace cocl
