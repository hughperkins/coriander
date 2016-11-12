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

#include "basicblockdumper.h"

#include "readIR.h"

#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"

#include <iostream>
#include <stdexcept>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {

// void BasicBlockDumper::storeValueName(Value *value) {
//     if(exprByValue.find(value) != exprByValue.end()) {
//         return;
//     }
//     if(value->hasName()) {
//         string name = getName(value);
//         if(name[0] == '.') {
//             name = "v" + name;
//         }
//         name = replace(name, '.', '_');
//         name = replace(name, '-', '_');
//         name = replace(name, '$', '_');
//         if(name == "kernel") {
//             name = "_kernel";
//         }
//         exprByValue[value] = name;
//     } else {
//         int idx = nextNameIdx;
//         nextNameIdx++;
//         ostringstream oss;
//         oss << "v" << idx;
//         string name = oss.str();
//         exprByValue[value] = name;
//     }
// }

// maybe this should be somewhere more generic?
string BasicBlockDumper::dumpConstant(Constant *constant) {
    unsigned int valueTy = constant->getValueID();
    ostringstream oss;
    if(ConstantInt *constantInt = dyn_cast<ConstantInt>(constant)) {
        oss << constantInt->getSExtValue();
        string constantintval = oss.str();
        return constantintval;
    } else if(isa<ConstantStruct>(constant)) {
        throw runtime_error("constantStruct not implemented in basicblockdumper.dumpconstnat");
    } else if(ConstantExpr *expr = dyn_cast<ConstantExpr>(constant)) {
        throw runtime_error("constantExpr not implemented in basicblockdumper.dumpconstnat");
        // Instruction *instr = expr->getAsInstruction();
        // copyAddressSpace(constant, instr);
        // string dcires = dumpChainedInstruction(0, instr);
        // // copyAddressSpace(instr, constant);
        // nameByValue[constant] = dcires;
        // return dcires;
    } else if(ConstantFP *constantFP = dyn_cast<ConstantFP>(constant)) {
        return dumpFloatConstant(constantFP);
    } else if(GlobalValue *global = dyn_cast<GlobalValue>(constant)) {
        throw runtime_error("GlobalValue not implemented in basicblockdumper.dumpconstnat");
         // if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
         //     int addressspace = pointerType->getAddressSpace();
         //     string name = getName(global);
         //     if(addressspace == 3) {  // if it's local memory, it's not really 'global', juts return the name
         //         return name;
         //     }
         // }
         // if(nameByValue.find(constant) != nameByValue.end()) {
         //    return nameByValue[constant];
         // }
         // string name = getName(global);
         // string ourinstrstr = "(&" + name + ")";
         // updateAddressSpace(constant, 4);
         // nameByValue[constant] = ourinstrstr;

         // return ourinstrstr;
    } else if(isa<UndefValue>(constant)) {
        return "";
    } else if(isa<ConstantPointerNull>(constant)) {
        return "0";
    } else {
        cout << "valueTy " << valueTy << endl;
        oss << "unknown";
        constant->dump();
        throw runtime_error("unknown constnat type");
    }
    return oss.str();
}

std::string BasicBlockDumper::dumpBinaryOperator(BinaryOperator *instr, std::string opstring) {
    string gencode = "";
    Value *op1 = instr->getOperand(0);
    gencode += dumpOperand(op1) + " ";
    gencode += opstring + " ";
    Value *op2 = instr->getOperand(1);
    gencode += dumpOperand(op2);
    return gencode;
}

string BasicBlockDumper::dumpOperand(Value *value) {
    if(exprByValue.find(value) != exprByValue.end()) {
        return exprByValue[value];
    }
    if(Constant *constant = dyn_cast<Constant>(value)) {
        return dumpConstant(constant);
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
    string resultName = localNames->getOrCreateName(instruction);
    // string 
    // storeValueName(instruction);
    // string resultName = localNames->getOrCreateName(instruction);
    // string resultName = exprByValue[instruction];
    exprByValue[instruction] = resultName;
    string resultType = typeDumper->dumpType(instruction->getType());

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
    string originalInstruction ="";
    originalInstruction += resultType + " " + resultName + " =";
    originalInstruction += " " + string(instruction->getOpcodeName());
    for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
        Value *op = &*it->get();
        originalInstruction += " ";
        string originalName = localNames->getNameOrEmpty(op);
        if(originalName == "") {
            originalName = "<unk";
        }
        originalInstruction += originalName;
        // if(origNameByValue.find(op) != exprByValue.end()) {
        //     originalInstruction += exprByValue[op];
        // } else {
        //     originalInstruction += "<unk>";
        // }
    }
    // gencode += "/* " + originalInstruction + " */\n    ";
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
    string typestr = typeDumper->dumpType(instruction->getType());
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
        exprByValue[instruction] = instructionCode;
        // nameByValue[instruction] = instructionCode;
        if(_addIRToCl) {
            return "/* " + originalInstruction + " */\n" + indent;
        } else {
            return "";
        }
        // return "";
    } else {
        if(_addIRToCl) {
            gencode += "/* " + originalInstruction + " */\n" + indent;
        }
        if(instructionCode != "") {
            gencode += indent;
            if(typestr != "void") {
                instructionCode = stripOuterParams(instructionCode);
                // functionNeededForwardDeclarations.insert(instruction);
                variablesToDeclare[instruction] = resultName;
                gencode += dumpOperand(instruction) + " = ";
            }
            gencode += instructionCode + ";\n";
        }
    }
    return gencode;
}

std::string BasicBlockDumper::toCl() {
    string gencode = "";
    for(auto it = block->begin(); it != block->end(); it++) {
        Instruction *inst = &*it;
        inst->dump();
        // cout << endl;
        string instructionCode = dumpInstruction("    ", inst);
        cout << "instructionCode [" << instructionCode << "]" << endl;
        gencode += instructionCode;
    }
    return gencode;
}

} // namespace cocl
