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
#include "mutations.h"

#include "EasyCL/util/easycl_stringhelper.h"

#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include <iostream>
#include <stdexcept>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {

// string BasicBlockDumper::dumpChainedInstruction(int level, Instruction * instr, bool ignoreCasts) {
//     if(GetElementPtrInst *gep = dyn_cast<GetElementPtrInst>(instr)) {
//         string thisinstrstring = dumpGetElementPtr(gep);
//         exprByValue[instr] = thisinstrstring;
//         return thisinstrstring;
//     } else if(BitCastInst *bitcast = dyn_cast<BitCastInst>(instr)) {
//         string thisinstrstring = "";
//         if(ignoreCasts) {
//             thisinstrstring = dumpChainedInstruction(level+1, cast<Instruction>(instr->getOperand(0)), true);
//         } else {
//             thisinstrstring = dumpBitCast(bitcast);
//         }
//         return thisinstrstring;
//     } else if(AddrSpaceCastInst *addrspacecast = dyn_cast<AddrSpaceCastInst>(instr)) {
//         string thisinstrstring = "";
//         if(ignoreCasts) {
//             thisinstrstring = dumpChainedInstruction(level+1, cast<Instruction>(instr->getOperand(0)), true);
//             // thisinstrstring = dumpOperand(instr);
//         } else {
//             thisinstrstring = dumpAddrSpaceCast(addrspacecast);
//         }
//         exprByValue[addrspacecast] = thisinstrstring;
//         return thisinstrstring;
//     } else {
//         instr->dump();
//         throw runtime_error("dumpchained unknown instruction type ");
//     }
// }

// string BasicBlockDumper::dumpChainedInstruction(int level, Instruction * instr, bool ignoreCasts) {
//     if(!ignoreCasts) {
//         throw runtime_error("not implemented: dci with ignoreCasts false");
//     }

// }

void BasicBlockDumper::dumpInstruction(Instruction *instruction) {
    string resultName = localNames->getOrCreateName(instruction);
    // string 
    // storeValueName(instruction);
    // string resultName = localNames->getOrCreateName(instruction);
    // string resultName = exprByValue[instruction];
    localExpressionByValue[instruction] = resultName;
    string resultType = typeDumper->dumpType(instruction->getType());

    string gencode = "";
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
    vector<string> reslines;
    // InstructionDumper instructionDumper;
    string instructionCode = instructionDumper->dumpInstructionRhs(instruction, &reslines);
    clcode.insert(clcode.end(), reslines.begin(), reslines.end());
    if(instructionCode == "") {
        return;
    }

    string typestr = typeDumper->dumpType(instruction->getType());
    Use *use = 0;
    User *use_user = 0;
    bool weArePointer = isa<PointerType>(instruction->getType());
    bool useIsPointer = false;
    bool useIsAStore = false;
    bool useIsExtractValue = false;
    bool useIsAPhi = false;
    // bool useIsALoad = false;
    // cout << "end of dumpinstruction for " << localNames->getName(instruction) << endl;
    // exprByValue[instruction] = instructionCode;
    // cout << "numuses " << instruction->getNumUses() << " useisaphi " << useIsAPhi << " useIsExtractValue=" << useIsExtractValue << endl;
    if(instruction->getNumUses() == 1) {
        // cout << "one use" << endl;
        use = &*instruction->use_begin();
        use_user = use->getUser();
        useIsAStore = isa<StoreInst>(use_user);
        useIsPointer = isa<PointerType>(use_user->getType());
        useIsExtractValue = isa<ExtractValueInst>(use_user);
        useIsAPhi = isa<PHINode>(use_user);
        // useIsALoad = isa<LoadInst>(use_user);
    }
    if(!useIsAPhi && !useIsExtractValue && instruction->getNumUses() <= 1 && !isa<LoadInst>(instruction)
            && !isa<StoreInst>(instruction)
            && !isa<CallInst>(instruction)) { // } && !useIsAStore) {
        // cout << "handling as single use" << endl;
        if(!isSingleExpression(instructionCode)) {
            instructionCode= "(" + instructionCode + ")";
        }
        localExpressionByValue[instruction] = instructionCode;
        // cout << "storing expression for " << localNames->getName(instruction) << ": [" << instructionCode << "]" << endl;
        // nameByValue[instruction] = instructionCode;
        if(_addIRToCl) {
            // return "/* " + originalInstruction + " */\n" + indent;
            clcode.push_back("/* " + originalInstruction + " */");
            return;
        } else {
            // return "";
            return;
        }
    } else {
        // cout << "not single use, assigning to variable" << endl;
        if(_addIRToCl) {
            clcode.push_back("/* " + originalInstruction + " */");
        }
        if(instructionCode != "") {
            // gencode += indent;
            if(typestr != "void") {
                instructionCode = stripOuterParams(instructionCode);
                // functionNeededForwardDeclarations.insert(instruction);
                // variablesToDeclare[instruction] = resultName;
                variablesToDeclare.insert(instruction);
                gencode += localNames->getName(instruction) + " = ";
            }
            gencode += instructionCode;
            clcode.push_back(gencode);
            (localExpressionByValue)[instruction] = localNames->getName(instruction);
        }
    }
    // return gencode;
}

std::string BasicBlockDumper::getAllocaDeclarations(string indent) {
    // string gencode = "";
    ostringstream oss;
    for(auto it=allocaDeclarations.begin(); it != allocaDeclarations.end(); it++) {
        // string declaration = it->second;
        AllocaInfo allocaInfo = *it;
        string declaration = allocaInfo.definition;
        Value *refValue = allocaInfo.refValue;
        AllocaInst *alloca = allocaInfo.alloca;
        if(cast<PointerType>(refValue->getType())->getAddressSpace() == 1) {
            if(declaration.find("global") != 0) {
                declaration = "global " + declaration;
            }
        }
        // cout << "alloca declaration: " << declaration << endl;
        // alloca->dump();
        if(_addIRToCl) {
            oss << indent << "/* " << typeDumper->dumpType(alloca->getType()) << " " << localNames->getName(alloca) << " = alloca " << typeDumper->dumpType(alloca->getType()) << " */\n";
        }
        oss << indent << declaration << ";\n";
    }
    return oss.str();
}

std::string BasicBlockDumper::writeDeclarations(std::string indent) {
    // string gencode = "";
    ostringstream oss;
    for(auto it=variablesToDeclare.begin(); it != variablesToDeclare.end(); it++) {
        Value *value = *it;
        // value->dump();
        if(_addIRToCl) {
            oss << indent << "/* local variable declaration */\n";
        }
        string declaration = typeDumper->dumpType(value->getType(), true) + " " + localNames->getName(value);
        oss << indent << declaration << ";\n";
    }
    return oss.str();
}

std::string BasicBlockDumper::toCl() {
    for(auto it = block->begin(); it != block->end(); it++) {
        Instruction *inst = &*it;
        if(isa<PHINode>(inst) || isa<BranchInst>(inst) || isa<ReturnInst>(inst)) {
            continue;
        }
        // cout << endl;
        // string instructionCode = dumpInstruction("    ", inst);
        dumpInstruction(inst);
        // if(instructionCode != "") {
        //     cout << "instructionCode [" << instructionCode << "]" << endl;
        //     gencode += instructionCode;
        // }
        // inst->dump();
    }
    // string gencode = "";
    ostringstream oss;
    for(auto it=clcode.begin(); it != clcode.end(); it++) {
        oss << "    " << *it << ";\n";
    }
    return oss.str();
}

} // namespace cocl
