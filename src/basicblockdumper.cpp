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

// bool BasicBlockDumper::dumpInstruction(Instruction *instruction, const std::set< llvm::Function *> &dumpedFunctions, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
//     // string 
//     // storeValueName(instruction);
//     // string resultName = localNames->getOrCreateName(instruction);
//     // string resultName = exprByValue[instruction];

//     cout << "basicblockdumper dumpinstruction() begin" << endl;
//     instruction->dump();
//     cout << endl;

//     string gencode = "";
//     // if(debug) {
//         // COCL_PRINT(cout << resultType << " " << resultName << " =");
//         // COCL_PRINT(cout << " " << string(instruction->getOpcodeName()));
//         // for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
//         //     Value *op = &*it->get();
//         //     COCL_PRINT(cout << " " << dumpOperand(op));
//         // }
//         // COCL_PRINT(cout << endl);
//     // }
//     // lets dump the original isntruction, commented out
//     // vector<string> reslines;
//     // InstructionDumper instructionDumper;

//     LocalValueInfo *instrInfo = LocalValueInfo::getOrCreate(localNames, &localValueInfos, instruction);
//     instructionDumper->runGeneration(instrInfo, returnTypeByFunction);
//     if(instrInfo->needDependencies) {
//         cout << "basicblockdumper::dumpinstruction, instr:" << endl;
//         instruction->dump();
//         cout << endl;
//         cout << "insturcion needs depenendnecies" << endl;
//         return false;
//     }

//     // if(!instructionDumper->runRhsGeneration(instruction, &reslines, dumpedFunctions, returnTypeByFunction)) {
//     //     return false;
//     // }
//     // clcode.insert(clcode.end(), reslines.begin(), reslines.end());
//     // if(instructionDumper->localExpressionByValue->find(instruction) == instructionDumper->localExpressionByValue->end()) {
//     // LocalValueInfo *localValueInfo
//     //     return true;
//     // }
//     // string instructionCode = instructionDumper->localExpressionByValue->at(instruction);
//     // cout << "basicblockdumper dumpInstruction instrucitoncode=" << instructionCode << " reslines.size() " << reslines.size() << endl;
//     // if(instructionCode == "" || isa<AllocaInst>(instruction)) {
//     //     return true;
//     // }
//     // cout << "basicblockdumper dumpinstruction updating localexpressionbyvalue with [" << resultName << "]" << endl;
//     // localExpressionByValue[instruction] = resultName;
//     // string resultType = typeDumper->dumpType(instruction->getType());

//     // string originalInstruction ="";
//     // originalInstruction += resultType + " " + resultName + " =";
//     // originalInstruction += " " + string(instruction->getOpcodeName());
//     // for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
//     //     Value *op = &*it->get();
//     //     originalInstruction += " ";
//     //     string originalName = localNames->getNameOrEmpty(op);
//     //     if(originalName == "") {
//     //         originalName = "<unk>";
//     //     }
//     //     originalInstruction += originalName;
//     //     // if(origNameByValue.find(op) != exprByValue.end()) {
//     //     //     originalInstruction += exprByValue[op];
//     //     // } else {
//     //     //     originalInstruction += "<unk>";
//     //     // }
//     // }

//     // string typestr = typeDumper->dumpType(instruction->getType());
//     // Use *use = 0;
//     // User *use_user = 0;
//     // // bool weArePointer = isa<PointerType>(instruction->getType());
//     // // bool useIsPointer = false;
//     // bool useIsAStore = false;
//     // bool useIsExtractValue = false;
//     // bool useIsAPhi = false;
//     // // bool useIsALoad = false;
//     // // cout << "end of dumpinstruction for " << localNames->getName(instruction) << endl;
//     // // exprByValue[instruction] = instructionCode;
//     // // cout << "numuses " << instruction->getNumUses() << " useisaphi " << useIsAPhi << " useIsExtractValue=" << useIsExtractValue << endl;
//     // if(instruction->getNumUses() == 1) {
//     //     // cout << "one use" << endl;
//     //     use = &*instruction->use_begin();
//     //     use_user = use->getUser();
//     //     useIsAStore = isa<StoreInst>(use_user);
//     //     // useIsPointer = isa<PointerType>(use_user->getType());
//     //     useIsExtractValue = isa<ExtractValueInst>(use_user);
//     //     useIsAPhi = isa<PHINode>(use_user);
//     //     // useIsALoad = isa<LoadInst>(use_user);
//     // }
//     // if(     instruction->getNumUses() <= 1
//     //         && !useIsExtractValue 
//     //         && !useIsAPhi
//     //         && !isa<LoadInst>(instruction)
//     //         // && !isa<StoreInst>(instruction)
//     //         && !useIsAStore
//     //         && !isa<CallInst>(instruction)) { // } && !useIsAStore) {
//     //     // cout << "handling as single use" << endl;
//     //     if(!isSingleExpression(instructionCode)) {
//     //         instructionCode= "(" + instructionCode + ")";
//     //     }
//     //     cout << "basicblockdumper.dumpinstruction, updating localexpressionbyvalue to [" << instructionCode << "]" << endl;
//     //     localValueInfo->setExpression(instructionCode);
//     //     // localExpressionByValue[instruction] = instructionCode;
//     //     // cout << "storing expression for " << localNames->getName(instruction) << ": [" << instructionCode << "]" << endl;
//     //     // nameByValue[instruction] = instructionCode;
//     //     if(_addIRToCl) {
//     //         // return "/* " + originalInstruction + " */\n" + indent;
//     //         // clcode.push_back("/* " + originalInstruction + " */");
//     //         return true;
//     //     } else {
//     //         // return "";
//     //         return true;
//     //     }
//     // } else {
//     //     // cout << "not single use, assigning to variable" << endl;
//     //     if(_addIRToCl) {
//     //         // clcode.push_back("/* " + originalInstruction + " */");
//     //     }
//     //     if(instructionCode != "") {
//     //         // gencode += indent;
//     //         if(typestr != "void") {
//     //             // cout << "declaring local variable" << endl;
//     //             instructionCode = stripOuterParams(instructionCode);
//     //             // functionNeededForwardDeclarations.insert(instruction);
//     //             // variablesToDeclare[instruction] = resultName;
//     //             variablesToDeclare.insert(instruction);
//     //             string resultName = localNames->getOrCreateName(instruction);
//     //             cout << "basicblockdumper.dumpinstruction, adding to variables to declare name in localnames is [" << localNames->getName(instruction) << endl;
//     //             gencode += localNames->getName(instruction) + " = ";
//     //         }
//     //         gencode += instructionCode;
//     //         clcode.push_back(gencode);
//     //         cout << "basicblockdumper.dumpinstruction, updating localexpressionbyvalue to [" << instructionCode << "]" << endl;
//     //         (localExpressionByValue)[instruction] = localNames->getName(instruction);
//     //     }
//     // }
//     // return true;
//     // return gencode;
// }

std::string BasicBlockDumper::getAllocaDeclarations(string indent) {
    // string gencode = "";
    ostringstream oss;
    // for(auto it=allocaDeclarations.begin(); it != allocaDeclarations.end(); it++) {
    //     // string declaration = it->second;
    //     AllocaInfo allocaInfo = *it;
    //     string declaration = allocaInfo.definition;
    //     Value *refValue = allocaInfo.refValue;
    //     AllocaInst *alloca = allocaInfo.alloca;
    //     if(PointerType *ptrType = dyn_cast<PointerType>(refValue->getType())) {
    //         if(ptrType->getAddressSpace() == 1) {
    //             if(declaration.find("global") != 0) {
    //                 declaration = "global " + declaration;
    //             }
    //         }
    //     }
    //     // cout << "alloca declaration: " << declaration << endl;
    //     // alloca->dump();
    //     if(_addIRToCl) {
    //         oss << indent << "/* " << typeDumper->dumpType(alloca->getType()) << " " << localNames->getName(alloca) << " = alloca " << typeDumper->dumpType(alloca->getType()) << " */\n";
    //     }
    //     oss << indent << declaration << ";\n";
    // }
    return oss.str();
}

bool BasicBlockDumper::checkIfNeedsAssign(Instruction *instruction) {
    Use *use = 0;
    User *use_user = 0;
    // bool weArePointer = isa<PointerType>(instruction->getType());
    // bool useIsPointer = false;
    bool useIsAStore = false;
    bool useIsExtractValue = false;
    bool useIsAPhi = false;
    bool useIsABitcast = false;
    // // bool instIsNonvoidCall = false;
    // if(CallInst *call = dyn_cast<CallInst>(instruction)) {
    //     if(call->getType()->isVoidTy()) {
    //         // we should get the call written out though...
    //         return false;
    //     }
    // }
    // bool useIsALoad = false;
    // cout << "end of dumpinstruction for " << localNames->getName(instruction) << endl;
    // exprByValue[instruction] = instructionCode;
    // cout << "numuses " << instruction->getNumUses() << " useisaphi " << useIsAPhi << " useIsExtractValue=" << useIsExtractValue << endl;
    if(instruction->getNumUses() == 1) {
        // cout << "one use" << endl;
        use = &*instruction->use_begin();
        use_user = use->getUser();
        useIsAStore = isa<StoreInst>(use_user);
        // useIsPointer = isa<PointerType>(use_user->getType());
        useIsExtractValue = isa<ExtractValueInst>(use_user);
        useIsAPhi = isa<PHINode>(use_user);
        useIsABitcast = isa<BitCastInst>(use_user);
        // useIsALoad = isa<LoadInst>(use_user);
    }
    if(     instruction->getNumUses() <= 1
            && !useIsExtractValue 
            && !useIsAPhi
            && !useIsABitcast
            && !isa<LoadInst>(instruction)
            // && !isa<StoreInst>(instruction)
            && !useIsAStore
            && !isa<CallInst>(instruction)) { // } && !useIsAStore) {
        return false;
    }
    return true;
}

void BasicBlockDumper::writeDeclaration(std::ostream &os, llvm::Value *value) {
    // value->dump();
    os << typeDumper->dumpType(value->getType(), true) + " " + localNames->getName(value);
}

void BasicBlockDumper::writeDeclarations(std::string indent, ostream &os) {
    // ostringstream os;
    vector<string> declarations;
    for(auto it = localValueInfos->begin(); it != localValueInfos->end(); it++) {
        LocalValueInfo *localValueInfo = it->second.get();
        // cout << "basicblockdumper, writing declration for " << localValueInfo->name << ":" << endl;
        // it->first->dump();
        ostringstream oss;
        localValueInfo->writeDeclaration("    ", typeDumper, oss);
        declarations.push_back(oss.str());
    }
    std::sort(declarations.begin(), declarations.end());
    for(auto it=declarations.begin(); it != declarations.end(); it++) {
        os << *it;
    }
    // for(auto it=block->begin(); it != instruction_it; it++) {
    //     Value *value = &*it;
    //     if(isa<ReturnInst>(value) || isa<PHINode>(value) || isa<BranchInst>(value)) {
    //         continue;
    //     }
    //     // cout << "basicblockdumper value:" << endl;
    //     // value->dump();
    //     // cout << endl;
    //     LocalValueInfo *valueInfo = localValueInfos.at(value).get();
    //     valueInfo->writeDeclaration("    ", typeDumper, os);
    // }
    // string gencode = "";
    // for(auto it=variablesToDeclare.begin(); it != variablesToDeclare.end(); it++) {
    //     Value *value = *it;
    //     if(_addIRToCl) {
    //         os << indent << "/* local variable declaration */\n";
    //     }
    //     os << indent;
    //     writeDeclaration(os, value);
    //     os << ";\n";
    // }
    // return os.str();
}

bool BasicBlockDumper::runGeneration(const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    // returns true if finished, otherwise false, if missing some dependnecies and so on,
    // like child functions we need to walk over first ,to figure ou the address spcae of
    // the return value
    for(; (maxInstructionsToGenerate == -1 || maxInstructionsToGenerate > 0) && instruction_it != block->end(); instruction_it++) {
        Instruction *inst = &*instruction_it;
        if(isa<PHINode>(inst) || isa<BranchInst>(inst) || isa<ReturnInst>(inst)) {
            continue;
        }
        try {
            LocalValueInfo *instrInfo = LocalValueInfo::getOrCreate(localNames, localValueInfos, inst);
            // cout << "basicblockdumper rungeneration on inst:" << endl;
            // inst->dump();
            // cout << endl;
            instructionDumper->runGeneration(instrInfo, returnTypeByFunction);
            if(instrInfo->needDependencies) {
                // cout << "basicblockdumper::dumpinstruction, instr:" << endl;
                // inst->dump();
                // cout << endl;
                // cout << "insturcion needs depenendnecies" << endl;
                return false;
            }
            if(checkIfNeedsAssign(inst)) {
                instrInfo->setAsAssigned();
            }

            // if(!dumpInstruction(inst, returnTypeByFunction)) {
            //     return false;
            // }
        } catch(runtime_error &e) {
            cout << "basicblockdumper.runGeneration got exception whilst processing:" << endl;
            inst->dump();
            cout << endl;
            throw e;
        }
        if(maxInstructionsToGenerate > 0) {
            maxInstructionsToGenerate--;
        }
    }
    return true;
}

void BasicBlockDumper::toCl(ostream &os) {
    for(auto it=block->begin(); it != instruction_it; it++) {
        Value *value = &*it;
        if(isa<ReturnInst>(value) || isa<PHINode>(value) || isa<BranchInst>(value)) {
            continue;
        }
        // cout << "basicblockdumper value:" << endl;
        // value->dump();
        // cout << endl;
        LocalValueInfo *valueInfo = localValueInfos->at(value).get();
        valueInfo->writeInlineCl("    ", os);
    }
}

} // namespace cocl
