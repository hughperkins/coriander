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
    AllocaInst *alloca = cast<AllocaInst>(localValueInfo->value);
    AllocaInfo allocaInfo;
    localValueInfo->clWriter.reset(new AllocaClWriter(localValueInfo));
    if(PointerType *allocatypeptr = dyn_cast<PointerType>(alloca->getType())) {
        Type *ptrElementType = allocatypeptr->getPointerElementType();
        std::string typestring = typeDumper->dumpType(ptrElementType);
        int count = readInt32Constant(alloca->getOperand(0));
        // string name = localNames->getOrCreateName(alloca);
        string name = localValueInfo->name;
        // cout << "alloca var name [" << name << "]" << endl;
        // localExpressionByValue->operator[](alloca) = name;
        localValueInfo->setExpression(name);
        if(count == 1) {
            if(ArrayType *arrayType = dyn_cast<ArrayType>(ptrElementType)) {
                cout << "alloca, is arraytype" << endl;
                int innercount = arrayType->getNumElements();
                Type *elementType = arrayType->getElementType();
                string allocaDeclaration = typeDumper->dumpType(elementType) + " " + 
                    localValueInfo->name + "[" + easycl::toString(innercount) + "]";
                allocaInfo.alloca = alloca;
                allocaInfo.refValue = alloca;
                allocaInfo.definition = allocaDeclaration;
                allocaDeclarations->push_back(allocaInfo);
                return;
            } else {
                cout << "alloca, non-arraytype" << endl;
                Value *refInstruction = alloca;
                // if the elementType is a pointer, assume its global?
                if(isa<PointerType>(ptrElementType)) {
                    cout << "alloca, pointertype" << endl;
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
                for(auto it=alloca->user_begin(); it != alloca->user_end(); it++) {
                    User *user = *it;
                    if(StoreInst *store = dyn_cast<StoreInst>(user)) {
                        cout << "found store:" << endl;
                        store->dump();
                        cout << endl;
                        refInstruction = store->getOperand(0);
                    }
                }
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
        // case Instruction::ICmp:
        //     instructionCode = dumpIcmp(cast<ICmpInst>(instruction));
        //     break;
        // case Instruction::FCmp:
        //     instructionCode = dumpFcmp(cast<FCmpInst>(instruction));
        //     break;
        // case Instruction::SExt:
        //     instructionCode = dumpSExt(cast<CastInst>(instruction));
        //     break;
        // case Instruction::ZExt:
        //     instructionCode = dumpZExt(cast<CastInst>(instruction));
        //     break;
        // case Instruction::FPExt:
        //     instructionCode = dumpFPExt(cast<CastInst>(instruction));
        //     break;
        // case Instruction::FPTrunc:
        //     instructionCode = dumpFPTrunc(cast<CastInst>(instruction));
        //     break;
        // case Instruction::Trunc:
        //     instructionCode = dumpTrunc(cast<CastInst>(instruction));
        //     break;
        // case Instruction::UIToFP:
        //     instructionCode = dumpUIToFP(cast<UIToFPInst>(instruction));
        //     break;
        // case Instruction::SIToFP:
        //     instructionCode = dumpSIToFP(cast<SIToFPInst>(instruction));
        //     break;
        // case Instruction::FPToUI:
        //     instructionCode = dumpFPToUI(cast<FPToUIInst>(instruction));
        //     break;
        // case Instruction::FPToSI:
        //     instructionCode = dumpFPToSI(cast<FPToSIInst>(instruction));
        //     break;
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
        // case Instruction::InsertValue:
        //     dumpInsertValue(localValueInfo);
        //     return;
        //     // return true;
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
