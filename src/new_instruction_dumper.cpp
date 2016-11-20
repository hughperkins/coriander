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

#include <vector>
#include <string>
#include <memory>
#include <iostream>

using namespace std;
using namespace llvm;

namespace cocl {

NewInstructionDumper::NewInstructionDumper(
        GlobalNames *globalNames, LocalNames *localNames, TypeDumper *typeDumper, const FunctionNamesMap *functionNamesMap,

        std::set<std::string> *shimFunctionsNeeded,
        std::set<llvm::Function *> *neededFunctions,

        std::map<llvm::Value *, std::string> *globalExpressionByValue,
        std::map<llvm::Value *, unique_ptr<LocalValueInfo > > *localValueInfos,
        std::vector<AllocaInfo> *allocaDeclarations
        ) :
    globalNames(globalNames),
    localNames(localNames),
    typeDumper(typeDumper),
    functionNamesMap(functionNamesMap),

    shimFunctionsNeeded(shimFunctionsNeeded),
    neededFunctions(neededFunctions),

    globalExpressionByValue(globalExpressionByValue),
    localValueInfos(localValueInfos),
    allocaDeclarations(allocaDeclarations)
        {
}

void NewInstructionDumper::dumpIcmp(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    CmpInst *instr = cast<CmpInst>(localValueInfo->value);
    localValueInfo->setAddressSpace(0);

    // cout << "newinstructiondumpre, dumpicmp, instr:" << endl;
    // instr->dump();
    // cout << endl;
    string gencode = "";
    // CmpInst::Predicate predicate = instr->getSignedPredicate();  // note: we should detect signedness...
    CmpInst::Predicate predicate = instr->getPredicate();  // note: we should detect signedness...
    // cout << "predicate " << instr->getPredicate() << endl;
    // cout << "signed predicate " << predicate << endl;
    // cout << "unsigned predicate " << instr->getUnsignedPredicate() << endl;
    string predicate_string = "";
    switch(predicate) {
        case CmpInst::ICMP_SLT:
        case CmpInst::ICMP_ULT:
            cout << "slt" << endl;
            predicate_string = "<";
            break;
        case CmpInst::ICMP_SGT:
        case CmpInst::ICMP_UGT:
            cout << "sgt" << endl;
            predicate_string = ">";
            break;
        case CmpInst::ICMP_SGE:
        case CmpInst::ICMP_UGE:
            cout << "sge" << endl;
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
    cout << "newinstructiondumepr::dumpIcmp, predicatestring: " << predicate_string << endl;

    LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();

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

    localValueInfo->setExpression(gencode);
    // return gencode;
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

    LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();

    op0 = stripOuterParams(op0);
    op1 = stripOuterParams(op1);
    gencode += op0;
    gencode += " " + predicate_string + " ";
    gencode += op1;

    localValueInfo->setExpression(gencode);
    // return gencode;
}

void NewInstructionDumper::dumpExt(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    string op0 = op0info->getExpr();

    localValueInfo->setExpression(op0);
}

// void NewInstructionDumper::dumpZExt(cocl::LocalValueInfo *localValueInfo) {
//     localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
//     Instruction *instr = cast<Instruction>(localValueInfo->value);

//     LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
//     string op0 = op0info->getExpr();

//     localValueInfo->setExpression(op0);
// }

// void NewInstructionDumper::dumpFPExt(cocl::LocalValueInfo *localValueInfo) {
//     localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
//     Instruction *instr = cast<Instruction>(localValueInfo->value);

//     LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
//     string op0 = op0info->getExpr();

//     localValueInfo->setExpression(op0);
// }

void NewInstructionDumper::dumpTrunc(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    string op0 = op0info->getExpr();

    // since this is float point trunc, lets just assume we're going from double to float
    // fix any exceptiosn to this rule later
    string typestr = typeDumper->dumpType(instr->getType());
    localValueInfo->setExpression("(" + typestr + ")" + op0);
}

void NewInstructionDumper::dumpStore(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new StoreClWriter(localValueInfo));
    StoreInst *instr = cast<StoreInst>(localValueInfo->value);
    // string gencode = "";
    localValueInfo->setAddressSpaceFrom(instr->getOperand(1));
    copyAddressSpace(instr->getOperand(0), instr->getOperand(1));

    LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();

    string rhs = op0info->getExpr(); // dumpOperand(instr->getOperand(0));
    rhs = stripOuterParams(rhs);
    string inlinecode = op1info->getExpr() + "[0] = " + rhs;
    cout << "dumpStore, gencode=[" << inlinecode << "]" << endl;
    localValueInfo->inlineCl.push_back(inlinecode);
    // localValueInfo->setExpression(o1info->getExpr());
    // (*localExpressionByValue)[instr] = 
    // return gencode;
}

void NewInstructionDumper::dumpAlloca(cocl::LocalValueInfo *localValueInfo) {
    string gencode = "";
    // AllocaInst *alloca = cast<AllocaInst>(localValueInfo->value);
    AllocaInfo allocaInfo;
    localValueInfo->clWriter.reset(new AllocaClWriter(localValueInfo));
    string name = localValueInfo->name;
    localValueInfo->setExpression(name);
}

void NewInstructionDumper::dumpInsertValue(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new InsertValueClWriter(localValueInfo));
    InsertValueClWriter *clWriter = cast<InsertValueClWriter>(localValueInfo->clWriter.get());
    InsertValueInst *instr = cast<InsertValueInst>(localValueInfo->value);

    // bool incomingIsUndef = false;
    LocalValueInfo *op0info = 0;
    if(isa<UndefValue>(instr->getOperand(0))) {
        clWriter->fromUndef = true;
    } else {
        op0info = localValueInfos->at(instr->getOperand(0)).get();
    }
    LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();

    string lhs = "";

    // cout << "lhs undef value? " << isa<UndefValue>(instr->getOperand(0)) << endl;
    // string incomingOperand = dumpOperand(instr->getOperand(0));
    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getType();
    // bool declaredVar = false;
    string incomingOperand = "";
    if(clWriter->fromUndef) {
        cout << "incomingoperand is undef, so adding insertvalue instr to variables to declare" << endl;
        localValueInfo->toBeDeclared = true;
        // variablesToDeclare->insert(instr);
        // localNames->getOrCreateName(instr);
        // incomingOperand = dumpOperand(instr);
        localValueInfo->toBeDeclared = true;
        localValueInfo->setExpression(localValueInfo->name);
        incomingOperand = localValueInfo->getExpr();
        // declaredVar = true;
    } else {
        incomingOperand = op0info->getExpr();
    }
    lhs += incomingOperand;
    ArrayRef<unsigned> indices = instr->getIndices();
    int numIndices = instr->getNumIndices();
    for(int d=0; d < numIndices; d++) {
        int idx = indices[d];
        Type *newType = 0;
        if(currentType->isPointerTy() || isa<ArrayType>(currentType)) {
            cout << "insertvalue: pointer or array type" << endl;
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    lhs = "(&" + lhs + ")";
                }
            }
            // Value *thisop = instr->getOperand(d + 1);
            // LocalValueInfo* thisvalueinfo = localValueInfos->at(thisop).get();
            // lhs += string("[") + thisvalueinfo->getExpr() + "]";
            lhs += string("[") + easycl::toString(idx) + "]";
            newType = currentType->getPointerElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            cout << "insertvalue: struct type" << endl;
            string structName = getName(structtype);
            if(structName == "struct.float4") {
                cout << "is struct.float4" << endl;
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, 0);
                newType = elementType;
                lhs = "((" + typeDumper->dumpType(castType) + ")&" + lhs + ")";
                lhs += string("[") + easycl::toString(idx) + "]";
            } else {
                // generic struct
                cout << "is generic struct" << endl;
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
    // std::vector<std::string> res;
    // string updateline = lhs + " = " + dumpOperand(instr->getOperand(1));
    string updateline = lhs + " = " + op1info->getExpr();
    // extralines->push_back(updateline);
    localValueInfo->inlineCl.push_back(updateline);
    // res.push_back(lhs + " = " + dumpOperand(instr->getOperand(1)));
    cout << "dumpinsertvalue lhs=" << lhs << endl;
    // if(false && declaredVar) {
    //     // variablesToDeclare->insert(instr);
    //     string assignline = dumpOperand(instr) + " = " + incomingOperand;
    //     cout << "declaredvar=" << declaredVar << " so adding line " << assignline << endl;
    //     extralines->push_back(assignline);
    // }
    // (*localExpressionByValue)[instr] = dumpOperand(instr);
    // (*localExpressionByValue)[instr] = incomingOperand;
    localValueInfo->setExpression(incomingOperand);
    // return "";
}

void NewInstructionDumper::dumpBinaryOperator(LocalValueInfo *localValueInfo, std::string opstring) {
    Instruction *instr = cast<Instruction>(localValueInfo->value);
    string gencode = "";
    // copyAddressSpace(instr->getOperand(0), instr);
    Value *op1 = instr->getOperand(0);
    LocalValueInfo *op1info = localValueInfos->at(op1).get();
    // gencode += dumpOperand(op1) + " ";
    gencode += op1info->getExpr() + " ";

    gencode += opstring + " ";

    Value *op2 = instr->getOperand(1);
    LocalValueInfo *op2info = localValueInfos->at(op2).get();
    gencode += op2info->getExpr();

    localValueInfo->setExpression(gencode);
    localValueInfo->setAddressSpace(0);
    localValueInfo->clWriter.reset(new BinaryClWriter(localValueInfo));
    // localValueInfo->setAddressSpace()
    // return gencode;
}

void NewInstructionDumper::runGeneration(LocalValueInfo *localValueInfo) {
    Instruction *instruction = cast<Instruction>(localValueInfo->value);
    needDependencies = false;
    auto opcode = instruction->getOpcode();
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

        // case Instruction::BitCast:
        //     instructionCode = dumpBitCast(cast<BitCastInst>(instruction));
        //     break;
        // case Instruction::AddrSpaceCast:
        //     instructionCode = dumpAddrSpaceCast(cast<AddrSpaceCastInst>(instruction));
        //     break;
        // // case Instruction::PtrToInt:
        // //     instructionCode = dumpPtrToInt(cast<PtrToIntInst>(instruction));
        // //     break;
        // // case Instruction::IntToPtr:
        // //     instructionCode = dumpInttoPtr(cast<IntToPtrInst>(instruction));
        // //     break;
        // case Instruction::Select:
        //     instructionCode = dumpSelect(cast<SelectInst>(instruction));
        //     break;
        // case Instruction::GetElementPtr:
        //     instructionCode = dumpGetElementPtr(cast<GetElementPtrInst>(instruction));
        //     break;
        case Instruction::InsertValue:
            dumpInsertValue(localValueInfo);
            break;
            // return;
            // return true;
        // case Instruction::ExtractValue:
        //     instructionCode = dumpExtractValue(cast<ExtractValueInst>(instruction));
        //     break;
        case Instruction::Store:
            dumpStore(localValueInfo);
            break;
        // case Instruction::Call:
        //     instructionCode = dumpCall(localValueInfo, returnTypeByFunction);
        //     break;
        // case Instruction::Load:
        //     instructionCode = dumpLoad(cast<LoadInst>(instruction));
        //     break;
        case Instruction::Alloca:
            dumpAlloca(localValueInfo);
            // return "";
            // return;
            break;
            // return true;
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
}

} // namespace cocl
