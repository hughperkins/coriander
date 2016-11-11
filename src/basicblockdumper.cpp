#include "basicblockdumper.h"

#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"

#include <iostream>
#include <stdexcept>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {

void BasicBlockDumper::storeValueName(Value *value) {
    if(exprByValue.find(value) != exprByValue.end()) {
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
        exprByValue[value] = name;
    } else {
        int idx = nextNameIdx;
        nextNameIdx++;
        ostringstream oss;
        oss << "v" << idx;
        string name = oss.str();
        exprByValue[value] = name;
    }
}

string BasicBlockDumper::dumpOperand(Value *value) {
    if(exprByValue.find(value) != exprByValue.end()) {
        return exprByValue[value];
    }
    // if(Constant *constant = dyn_cast<Constant>(value)) {
    //     return dumpConstant(constant);
    // }
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
    throw runtime_error("Not implemented");
}

std::string BasicBlockDumper::dumpReturn(ReturnInst *retInst) {
    std::string gencode = "";
    Value *retValue = retInst->getReturnValue();
    if(retValue != 0) {
        Function *F = retInst->getFunction();
        // copyAddressSpace(retValue, F);
        gencode += "return " + dumpOperand(retValue);
    } else {
        // we still need to have "return" if no value, since some loops terminate with a `return` in the middle
        // of the codeblock.  Or rather, they dont terminate, if we dont write out a `return` :-P
        gencode += "return";
    }
    return gencode;
}

string BasicBlockDumper::dumpInstruction(string indent, Instruction *instruction) {
    auto opcode = instruction->getOpcode();
    storeValueName(instruction);
    string resultName = exprByValue[instruction];
    string resultType = dumpType(instruction->getType());

    string gencode = "";
    string instructionCode = "";
    // if(debug) {
        // COCL_PRINT(cout << resultType << " " << resultName << " =");
        // COCL_PRINT(cout << " " << string(instruction->getOpcodeName()));
        // for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
        //     Value *op = &*it->get();
        //     COCL_PRINT(cout << " " << dumpOperand(op));
        // }
        // COCL_PRINT(cout << endl);
    // }
    // lets dump the original isntruction, commented out
    string originalinstruction ="";
    originalinstruction += resultType + " " + resultName + " =";
    originalinstruction += " " + string(instruction->getOpcodeName());
    for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
        Value *op = &*it->get();
        originalinstruction += " ";
        if(origNameByValue.find(op) != exprByValue.end()) {
            originalinstruction += exprByValue[op];
        } else {
            originalinstruction += "<unk>";
        }
    }
    // gencode += "/* " + originalinstruction + " */\n    ";
    switch(opcode) {
        // case Instruction::FAdd:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "+");
        //     break;
        // case Instruction::FSub:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "-");
        //     break;
        // case Instruction::FMul:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "*");
        //     break;
        // case Instruction::FDiv:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
        //     break;
        // case Instruction::Sub:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "-");
        //     break;
        // case Instruction::Add:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "+");
        //     break;
        // case Instruction::Mul:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "*");
        //     break;
        // case Instruction::SDiv:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
        //     break;
        // case Instruction::UDiv:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "/");
        //     break;
        // case Instruction::SRem:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "%");
        //     break;
        // case Instruction::And:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "&");
        //     break;
        // case Instruction::Or:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "|");
        //     break;
        // case Instruction::Xor:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "^");
        //     break;
        // case Instruction::LShr:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), ">>");
        //     break;
        // case Instruction::Shl:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), "<<");
        //     break;
        // case Instruction::AShr:
        //     instructionCode = dumpBinaryOperator(cast<BinaryOperator>(instruction), ">>");
        //     break;
        // case Instruction::Store:
        //     instructionCode = dumpStore(cast<StoreInst>(instruction));
        //     break;
        // case Instruction::Call:
        //     instructionCode = dumpCall(cast<CallInst>(instruction));
        //     break;
        // case Instruction::Load:
        //     instructionCode = dumpLoad(cast<LoadInst>(instruction));
        //     break;
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
        // case Instruction::PtrToInt:
        //     instructionCode = dumpPtrToInt(cast<PtrToIntInst>(instruction));
        //     break;
        // case Instruction::BitCast:
        //     instructionCode = dumpBitCast(cast<BitCastInst>(instruction));
        //     break;
        // case Instruction::AddrSpaceCast:
        //     instructionCode = dumpAddrSpaceCast(cast<AddrSpaceCastInst>(instruction));
        //     break;
        // case Instruction::IntToPtr:
        //     instructionCode = dumpInttoPtr(cast<IntToPtrInst>(instruction));
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
        // case Instruction::GetElementPtr:
        //     instructionCode = dumpGetElementPtr(cast<GetElementPtrInst>(instruction));
        //     break;
        // case Instruction::InsertValue:
        //     instructionCode = dumpInsertValue(cast<InsertValueInst>(instruction));
        //     return instructionCode;
        //     // break;
        // case Instruction::ExtractValue:
        //     instructionCode = dumpExtractValue(cast<ExtractValueInst>(instruction));
        //     break;
        // case Instruction::Alloca:
        //     instructionCode = dumpAlloca(cast<AllocaInst>(instruction));
        //     return instructionCode + ";\n";
        //     // break;
        // case Instruction::Br:
        //     instructionCode = dumpBranch(cast<BranchInst>(instruction));
        //     return instructionCode;
        //     // break;
        // case Instruction::Select:
        //     // COCL_PRINT(cout << "its a select" << endl);
        //     instructionCode = dumpSelect(cast<SelectInst>(instruction));
        //     break;
        case Instruction::Ret:
            instructionCode = dumpReturn(cast<ReturnInst>(instruction));
            return instructionCode + ";\n";
            // break;
        // case Instruction::PHI:
        //     addPHIDeclaration(cast<PHINode>(instruction));
        //     return "";
        //     // break;
        default:
            cout << "opcode string " << instruction->getOpcodeName() << endl;
            throw runtime_error("unknown opcode");
    }
    string typestr = dumpType(instruction->getType());
    Use *use = 0;
    User *use_user = 0;
    bool weArePointer = isa<PointerType>(instruction->getType());
    bool useIsPointer = false;
    bool useIsAStore = false;
    bool useIsExtractValue = false;
    bool useIsAPhi = false;
    if(instruction->hasOneUse()) {
        use = &*instruction->use_begin();
        use_user = use->getUser();
        useIsAStore = isa<StoreInst>(use_user);
        useIsPointer = isa<PointerType>(use_user->getType());
        useIsExtractValue = isa<ExtractValueInst>(use_user);
        useIsAPhi = isa<PHINode>(use_user);
    }
    if(!useIsAPhi && !useIsExtractValue && instruction->hasOneUse()) { // } && !useIsAStore) {
        if(!isSingleExpression(instructionCode)) {
            instructionCode= "(" + instructionCode + ")";
        }
        nameByValue[instruction] = instructionCode;
        if(add_ir_to_cl) {
            return "/* " + originalinstruction + " */\n" + indent;
        } else {
            return "";
        }
        // return "";
    } else {
        if(add_ir_to_cl) {
            gencode += "/* " + originalinstruction + " */\n" + indent;
        }
        if(typestr != "void") {
            instructionCode = stripOuterParams(instructionCode);
            functionNeededForwardDeclarations.insert(instruction);
            gencode += dumpOperand(instruction) + " = ";
        }
        if(instructionCode != "") {
            gencode += indent + instructionCode + ";\n";
        }
    }
    return gencode;
}

std::string BasicBlockDumper::toCl() {
    gencode = "";
    for(auto it = block->begin(); it != block->end(); it++) {
        Instruction *inst = &*it;
        gencode += dumpInstruction("    ", inst);
    }
}

} // namespace cocl
