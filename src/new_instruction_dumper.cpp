#include "new_instruction_dumper.h"

#include "LocalNames.h"
#include "GlobalNames.h"
#include "type_dumper.h"
#include "function_names_map.h"
#include "LocalValueInfo.h"
#include "mutations.h"

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
        // case Instruction::Store:
        //     instructionCode = dumpStore(cast<StoreInst>(instruction));
        //     break;
        // case Instruction::Call:
        //     instructionCode = dumpCall(localValueInfo, returnTypeByFunction);
        //     break;
        // case Instruction::Load:
        //     instructionCode = dumpLoad(cast<LoadInst>(instruction));
        //     break;
        // case Instruction::Alloca:
        //     dumpAlloca(localValueInfo);
        //     // return "";
        //     return;
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
