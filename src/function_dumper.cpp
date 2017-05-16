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

#include "function_dumper.h"

#include "struct_clone.h"
#include "mutations.h"
#include "basicblockdumper.h"
#include "EasyCL/util/easycl_stringhelper.h"
#include "new_instruction_dumper.h"

#include "llvm/IR/Function.h"

#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {

string FunctionDumper::createOffsetDeclaration(string argName) {
    #ifdef OFFSET_32BIT
       return ", uint " + argName + "_offset";
    #else
       return ", long " + argName + "_offset";
    #endif
}

std::string FunctionDumper::createOffsetShim(Type *argType, std::string argName, int clmemIndex) {
    std::ostringstream oss;
    oss << "    global float *" << argName << " = clmem" << clmemIndex << " + " << argName + "_offset;\n";
    return oss.str();
}

std::string FunctionDumper::dumpPhi(std::string indent, llvm::BranchInst *branchInstr, llvm::BasicBlock *nextBlock) {
    // cout << "dumpPhi() block: [" << nextBlock->getName().str() << "]" << endl;
    std::string gencode = "";
    for(auto it = nextBlock->begin(); it != nextBlock->end(); it++) {
        Instruction *instr = &*it;
        if(instr->getOpcode() != Instruction::PHI) {
            break;
        }
        if(PHINode *phi = dyn_cast<PHINode>(instr)) {
            // cout << "dumping phi:" << endl;
            // instr->dump();
            // string name = localNames.getOrCreateName(phi);
            BasicBlock *ourBlock = branchInstr->getParent();
            Value *sourceValue = phi->getIncomingValueForBlock(ourBlock);
            // vector<AllocaInfo> allocaInfos;
            // NewInstructionDumper instructionDumper(
            //     globalNames, &localNames, typeDumper, functionNamesMap,
            //     // &allocaInfos, &variablesToDeclare,
            //     // &sharedVariablesToDeclare,
            //     &shimFunctionsNeeded, &neededFunctions,
            //     &globalExpressionByValue, &localValueInfos
            //     // &localExpressionByValue
            // );
            // vector<string> reslines;
            // string sourceValueCode = instructionDumper.runRhsGeneration(sourceValue, &reslines);
            if(isa<UndefValue>(sourceValue)) {
                // cout << "source value is undef => ignore" << endl;
                continue;
            }
            LocalValueInfo *sourceValueInfo = instructionDumper->getOperand(sourceValue);
            // LocalValueInfo *sourceValueInfo = LocalValueInfo::getOrCreate(
            //     &localNames, &localValueInfos, sourceValue);
            // const std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
            // instructionDumper->runGeneration(sourceValueInfo, returnTypeByFunction);
            // cout << "getting expr from sourcevalue:" << endl;
            // sourceValue->dump();
            string sourceValueCode = sourceValueInfo->getExpr();

            // string sourceValueCode = localNames.getName(sourceValue);
            // COCL_PRINT(cout << "adding phi " << sourceValueCode << endl);
            // if(sourceValueCode == "") { // this is a hack really..
            //     continue;  // assume its an undef. which it might be
            // }
            // variablesToDeclare.insert(phi);
            copyAddressSpace(sourceValue, phi);
            LocalValueInfo *phiValueInfo = LocalValueInfo::getOrCreate(
                &localNames, &localValueInfos, phi);
            phiValueInfo->setAsAssigned();
            // cout << "getting expression for:" << endl;
            // phi->dump();
            string phivarname = phiValueInfo->getExpr();
            if(_addIRToCl) {

                string originalInstruction = typeDumper->dumpType(phi->getType()) + " " + phiValueInfo->name + " =";
                originalInstruction += " phi " + sourceValueInfo->name;
                // originalInstruction += " " + string(phi->getOpcodeName());
                // for(auto it=phi->op_begin(); it != phi->op_end(); it++) {
                //     Value *op = &*it->get();
                //     originalInstruction += " ";
                //     // originalInstruction += getOperand(op)->getExpr();
                //     if(localNames.hasValue(op)) {
                //         originalInstruction += localNames.getName(op);
                //     } else {
                //         originalInstruction += "<unk>";
                //     }
                //     // if(origNameByValue.find(op) != origNameByValue.end()) {
                //     //     originalInstruction += origNameByValue[op];
                //     // } else {
                //     //     originalInstruction += "<unk>";
                //     // }
                // }
                gencode += indent + "/* " + originalInstruction + " */\n";
                // gencode += indent + "/* phi " + 
            }
            gencode += indent + phivarname + " = ";
            // gencode += localNames.getName(phi) + " = ";
            // string phivarname = localVal
            gencode += sourceValueCode + ";\n";
            // cout << "dumpphi gencode [" << gencode << "]" << endl;
        }
        // }
    }
    return gencode;
}

std::string FunctionDumper::dumpReturn(Type **pReturnType, ReturnInst *retInst) {
    // cout << "dumpReturn" << endl;
    // retInst->dump();
    std::string gencode = "";
    Value *retValue = retInst->getReturnValue();
    // cout << "retValue == 0 " << (retValue == 0) << endl;
    if(retValue != 0) {
        // cout << "retVAlue:" << endl;
        // retValue->dump();
        Function *F = retInst->getFunction();
        copyAddressSpace(retValue, F);
        *pReturnType = retValue->getType();
        // gencode += "return " + localExpressionByValue[retValue];
        // string retvaluestr = instructionDumper
        string retValueStr = instructionDumper->getOperand(retValue)->getExpr();
        gencode += "return " + retValueStr;
        // gencode += "return " + localValueInfos.at(retValue)->getExpr();
        // gencode += "return " + dumpOperand(retValue);
    } else {
        // we still need to have "return" if no value, since some loops terminate with a `return` in the middle
        // of the codeblock.  Or rather, they dont terminate, if we dont write out a `return` :-P
        gencode += "return";
    }
    return gencode;
}

std::string FunctionDumper::dumpBranch(llvm::BranchInst *instr) {
    // cout << "dumpbranch" << endl;
    // instr->dump();
    string gencode = "";
    if(instr->isConditional()) {
        // string conditionstring = localExpressionByValue[instr->getCondition()];
        string conditionstring = localValueInfos.at(instr->getCondition())->getExpr();

        if(_addIRToCl) {
            string originalInstruction = "if(" + localValueInfos.at(instr->getCondition())->name + ")";
            gencode += "    /* " + originalInstruction + " */\n";
        }

        if(!isSingleExpression(conditionstring) || conditionstring[0] != '(') {
            conditionstring = "(" + conditionstring + ")";
        }
        // gencode += "if " + conditionstring + " {\n";
        string trueSection = "";
        bool needTrueSection = false;
        string phicode = dumpPhi("        ", instr, instr->getSuccessor(0));
        if(phicode != "") {
            trueSection += phicode;
            needTrueSection = true;
        }
        if(instr->getNextNode() == 0) { // && functionBlockIndex[instr->getSuccessor(0)] != functionBlockIndex[instr->getParent()] + 1) {
            trueSection += "        goto " + localNames.getName(instr->getSuccessor(0)) + ";\n";
            needTrueSection = true;
        }
        string falseSection = "";
        bool needFalseSection = false;
        if(instr->getNumSuccessors() == 1) {
        } else if(instr->getNumSuccessors() == 2) {
            // gencode += "    } else {\n";
            string phicode = dumpPhi("        ", instr, instr->getSuccessor(1));
            if(phicode != "") {
                falseSection += phicode;
                needFalseSection = true;
            }
            if(instr->getNextNode() == 0) { //} && functionBlockIndex[instr->getSuccessor(1)] != functionBlockIndex[instr->getParent()] + 1) {
                falseSection += "        goto " + localNames.getName(instr->getSuccessor(1)) + ";\n";
                needFalseSection = true;
            }
        } else {
            throw runtime_error("not implemented for this numsuccessors br");
        }

        if(needTrueSection) {
            gencode += "    if " + conditionstring + " {\n";
            gencode += trueSection;
            if(needFalseSection) {
                gencode += "    } else {\n";
                gencode += falseSection;
            }
            gencode += "    }\n";
        } else if(needFalseSection) {
            gencode += "    if(!" + conditionstring + ") {\n";
            gencode += falseSection;
            gencode += "    }\n";
        }

        // gencode += "    }\n";
    } else {
        if(instr->getNumSuccessors() == 1) {
            BasicBlock *nextBlock = instr->getSuccessor(0);
            string phicode = dumpPhi("    ", instr, nextBlock);
            if(phicode != "") {
                gencode += phicode;
            }
            // bool needGoto = true;
            // if(instr->getNextNode() == 0) {
            //     if(functionBlockIndex[nextBlock] == functionBlockIndex[instr->getParent()] + 1) {
            //         needGoto = false;
            //     }
            // }
            // if(needGoto) {
                gencode += "    goto " + localNames.getName(instr->getSuccessor(0)) + ";\n";
            // }
        } else {
            throw runtime_error("not implemented sucessors != 1 for unconditional br");
        }
    }
    return gencode;
}

// adds declaratoin of the phi, to the start of hte functoin (via currentFunctionPhiDeclarationsByName)
// the address space should be correct on phi by the time this function is called
void FunctionDumper::addPHIDeclaration(llvm::PHINode *phi) {
    // cout << "addphideclaration" << endl;
    // phi->dump();
    // storeValueName(phi);
    // string name = nameByValue[phi];
    string name = localNames.getOrCreateName(phi);
    string declaration = typeDumper->dumpType(phi->getType()) + " " + name;
    // cout << "phi declaration: [" << declaration << "]" << endl;
    phiDeclarationsByName[name] = declaration;
}

std::vector<std::string> FunctionDumper::dumpSharedDefinition(llvm::Value *value) {
    std::vector<std::string> declarations;
    // value ->dump();
    // if(GlobalVariable *glob = dyn_cast<GlobalVariable>(value)) {
    //     string name = glob->getName().str();
    //     string declaration = "";
    //     Type *type = glob->getType();
    //     if(ArrayType *arraytype = dyn_cast<ArrayType>(type->getPointerElementType())) {
    //         int length = arraytype->getNumElements();
    //         Type *elementType = arraytype->getElementType();
    //         string typestr = typeDumper->dumpType(elementType);
    //         declarations.push_back("local " + typestr + " " + name + "[" + easycl::toString(length) + "]");
    //         // declarations.push_back("local " + typestr + "** " + name + " = &" + name + "__");
    //         localExpressionByValue[value] = name;
    //         // nameByValue[value] = name;
    //         // currentFunctionSharedDeclarations += declaration;
            return declarations;
    //     } else {
    //         cout << "dumpshared definition called with:" << endl;
    //         value->dump();
    //         cout << endl;
    //         throw runtime_error("didnt expect ot be here, globalvaraible, not array.  dumpshareddefinition, for htis value");
    //     }
    // } else {
    //     cout << "dumpshared definition called with:" << endl;
    //     value->dump();
    //     cout << endl;
    //     throw runtime_error("didnt expect ot be here.  dumpshareddefinition, for htis value");
    // }
}

std::string FunctionDumper::dumpSharedDefinitions(std::string indent) {
    ostringstream oss;
    // for(auto it=sharedVariablesToDeclare.begin(); it != sharedVariablesToDeclare.end(); it++) {
    //     Value *variable = *it;
    //     // cout << "declaring:" << endl;
    //     // variable->dump();
    //     // cout << endl;
    //     std::vector<std::string> declarations = dumpSharedDefinition(variable);
    //     for(auto it2=declarations.begin(); it2 != declarations.end(); it2++) {
    //         oss << indent << *it2 << ";\n";
    //     }
    //     // string definition = dumpSharedDefinition(variable);
    //     // cout << "defnition: " << definition << endl;
    //     // gencode += definition;
    //     // oss << indent << definition << ";\n";
    // }
    return oss.str();
}

std::string FunctionDumper::dumpFunctionDeclarationWithoutReturn(llvm::Function *F) {
    // string declaration = "";
    std::ostringstream declaration;
    shimCode = "";
    // Type *retType = F->getReturnType();
    // std::string retTypeString = typeDumper->dumpType(retType);
    string fname = F->getName().str();
    // cout << "dump function dclaratoin [" << fname << "]" << endl;
    // declaration += typeDumper->dumpType(retType) + " " + fname + "(";
    // declaration += fname + "(";
    declaration << fname;
    if(isKernel) {
        for(int clmemIdx = 0; clmemIdx < kernelClmemIndexByArgIndex.size(); clmemIdx++) {
            declaration << "_" << kernelClmemIndexByArgIndex[clmemIdx];
        }
    }
    declaration << "(";
    int i = 0;
    if(isKernel) {
        for(int clmemIdx = 0; clmemIdx < kernelClmemIndexByArgIndex.size(); clmemIdx++) {
            if(clmemIdx > 0) {
                // declaration += ", ";
                declaration << ", ";
            }
            // declaration += 'global float *clmem' + easycl::toString(clmemIdx);
            declaration << "global float *clmem" << clmemIdx;
            i++;
        }
    }
    // structpointershimcode = "";
    int clmemArgIndex = 0;
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        string argName = localNames.getOrCreateName(arg, arg->getName().str());
        Type *argType = arg->getType();
        // string argName = dumpOperand(arg);
        string argdeclaration = "";
        bool is_struct_needs_cloning = false;
        bool ispointer = isa<PointerType>(argType);
        if(isKernel) {
            if(PointerType *ptrType = dyn_cast<PointerType>(argType)) {
                Type *elemType = ptrType->getPointerElementType();
                if(StructType *structType = dyn_cast<StructType>(elemType)) {
                    if(structType->getName().str() != "struct.float4") {
                        unique_ptr<StructInfo> structInfo(new StructInfo());
                        StructCloner::walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
                        if(structInfo->pointerInfos.size() > 0) { // struct has pointers...
                            // mutate any pointers to be globals
                            map<StructType *, StructType *>oldnew;
                            // StructType *globalizedStruct = structCloner.createGlobalizedPointerStruct(oldnew, structType);
                            // cout << "globalizedstruct:" << endl;
                            // globalizedStruct->dump();
                            // structType->dump();
                            // if(structType->getName().str() == "") {
                            //     throw runtime_error("anonymous struct");
                            // }
                            // globalNames->getOrCreateName(structType, structType->getName().str());
                            StructType *noptrType = structCloner.cloneNoPointers(structType);
                            noptrType->setName(structType->getName().str() + "_nopointers");
                            // argType = PointerType::get(globalizedStruct, 0);
                            // arg->mutateType(argType);
                            // structsToDefine.insert(globalizedStruct);
                            // noptrType->dump();
                            structsToDefine.insert(noptrType);
                            is_struct_needs_cloning = true;
                            argdeclaration = "global " + typeDumper->dumpType(noptrType) + "* " + argName + "_nopointers";
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
        if(!is_struct_needs_cloning && !(isKernel && ispointer)) {
            argdeclaration = typeDumper->dumpType(arg->getType()) + " " + argName;
            // if(ispointer) {
                // argdeclaration += "_";
            // }
        }
        if(!(isKernel && ispointer)) {
            if(i > 0) {
                // declaration += ", ";
                declaration << ", ";
            }
        }
        // declaration += argdeclaration;
        declaration << argdeclaration;
        // if this is a kernel method, check for any structs containing pointers,
        // and add those pointers t othe argument list, with some appropriate shimcode
        // to copy those pointers into the struct, at the start of the kernel
        int j = 0;
        if(is_struct_needs_cloning) {
            StructType *structType = cast<StructType>(cast<PointerType>(argType)->getPointerElementType());
            // declare a pointerful struct, then copy the vlaues across, then copy the float *s in
            unique_ptr<StructInfo> structInfo(new StructInfo());
            StructCloner::walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
            shimCode += typeDumper->dumpType(structType) + " " + argName + "[1];\n";
            shimCode += structCloner.writeClCopyNoPtrToPtrfull(structType, argName + "_nopointers[0]", argName + "[0]");
            for(auto pointerit=structInfo->pointerInfos.begin(); pointerit != structInfo->pointerInfos.end(); pointerit++) {
                PointerInfo *pointerInfo = pointerit->get();
                Type *pointerElementType = pointerInfo->type->getPointerElementType();
                // for now only handle pointers to primitives
                if(pointerElementType->getPrimitiveSizeInBits() == 0) {
                    continue;
                }
                pointerInfo->type = PointerType::get(pointerInfo->type->getPointerElementType(), 1);
                string pointerArgName = argName + "_ptr" + easycl::toString(j);
                declaration << ", " << typeDumper->dumpType(pointerInfo->type) << " " << pointerArgName;
                declaration << createOffsetDeclaration(pointerArgName);
                int clmemIndex = kernelClmemIndexByArgIndex[clmemArgIndex];
                clmemArgIndex++;
                shimCode = 
                    createOffsetShim(pointerInfo->type, pointerArgName, clmemIndex) +
                    shimCode +
                    argName + "[0]" + pointerInfo->path + " = " + pointerArgName + ";\n";
                j++;
            }
        }
        if(isKernel && ispointer && !is_struct_needs_cloning) {
            // add offset
            int clmemIndex = kernelClmemIndexByArgIndex[clmemArgIndex];
            clmemArgIndex++;
            declaration << createOffsetDeclaration(argName);
            shimCode = 
                createOffsetShim(arg->getType(), argName, clmemIndex) +
                shimCode;
        }
        i++;
    }
    if(i > 0) {
        declaration << ", ";
    }
    declaration << "local int *scratch";
    declaration << ")";
    return declaration.str();
}

std::string FunctionDumper::dumpTerminator(Type **pReturnType, Instruction *terminator) {
    string terminatorCl = "";
    // LocalValueInfo *localValueInfo = LocalValueInfo::getOrCreate(&localNames, &localValueInfos, terminator);
    if(ReturnInst *retInst = dyn_cast<ReturnInst>(terminator)) {
        terminatorCl = "    " + dumpReturn(pReturnType, retInst) + ";\n";
        // returnType = retInst->getOperand(0)->getType();
    } else if(BranchInst *branch = dyn_cast<BranchInst>(terminator)) {
        terminatorCl = dumpBranch(branch);
    } else {
        cout << "unhandled terminator type:";
        terminator->dump();
        throw runtime_error("unhandled terminator type");
    }
    return terminatorCl;
}

void FunctionDumper::generateBlockIndex() {
    if(functionBlockIndex.size() == 0) {
        int i = 0;
        for(auto it=F->begin(); it != F->end(); it++) {
            BasicBlock *basicBlock = &*it;
            functionBlockIndex[basicBlock] = i;
            // localNames.getOrCreateName(basicBlock, "block");
            localNames.getOrCreateName(basicBlock);
            i++;
        }
    }
}

bool FunctionDumper::runGeneration(const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    // returns true means finished, false means missing some dependnecy, like a sub fucntion walk

    // these vars being instance variables is ugly and should probably be rethought sometime....
    // ouros.str("");
    // declaration = "";
    // shimCode = "";

    generateBlockIndex();

    // first time initializes the types of hte args and so on
    declaration = dumpFunctionDeclarationWithoutReturn(F);

    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        // sring name = localNames.getOrCreateName(arg, arg->getName().str());
        // arg->dump();
        LocalValueInfo *localValueInfo = LocalValueInfo::getOrCreate(&localNames, &localValueInfos, arg, arg->getName().str());
        localValueInfo->setExpression(localValueInfo->name);
    }

    //  set<BasicBlock *> blocksToDump;
    size_t numBlocks = 0;
    for(auto block_it=F->begin(); block_it != F->end(); block_it++) {
        // BasicBlock *basicBlock = &*block_it;
        // blocksToDump.insert(basicBlock);
        numBlocks++;
    }
    set<BasicBlock *> blocksDumped;

    int iteration = 0;
    while(blocksDumped.size() < numBlocks) {
        // cout << "iteration " << iteration << endl;
        for(auto block_it = F->begin(); block_it != F->end(); block_it++) {
        // for(auto it = blocksToDump.begin(); it != blocksToDump.end(); it++) {
            BasicBlock *basicBlock = &*block_it;
            if(blocksDumped.find(basicBlock) != blocksDumped.end()) {
                // already dumped this block
                continue;
            }
            string label = localNames.getOrCreateName(basicBlock);
            // cout << "dumping block " << basicBlock->getName().str() << endl;

            // check whether we have the address space for the phis yet
            bool phisOutstanding = false;
            for(auto phi_it=basicBlock->begin(); phi_it != basicBlock->end(); phi_it++) {
                Instruction *inst = &*phi_it;
                if(!isa<PHINode>(inst)) {
                    // phisOutstanding = true;
                    break;
                }
                PHINode *phi = cast<PHINode>(inst);
                if(localValueInfos.find(phi) == localValueInfos.end()) {
                    phisOutstanding = true;
                    break;
                }
            }
            if(phisOutstanding) {
                // cout << "some phis outstanding => skipping block" << endl;
                continue;
            }
            // cout << "all phis ok => continuing to dump block" << endl;

            BasicBlockDumper basicBlockDumper(
                basicBlock, globalNames, &localNames, typeDumper, functionNamesMap,
                &globalExpressionByValue, &localValueInfos);
            if(_addIRToCl) {
                basicBlockDumper.addIRToCl();
            }
            bool finished = false;
            try {
                finished = basicBlockDumper.runGeneration(returnTypeByFunction);
            } catch(NeedValueDependencyException &e) {
                // cout << "need dependent value!" << endl;
                // e.value->dump();
                continue;
            }
            // } catch(...) {
            //     cout << "caught SOMETHING" << endl;
            // }
            if(!finished) {
                // cout << "blockdumper generation didnt run to completion" << endl;
                neededFunctions.insert(basicBlockDumper.neededFunctions.begin(), basicBlockDumper.neededFunctions.end());
                // for(auto it2=neededFunctions.begin(); it2 != neededFunctions.end(); it2++) {
                //     cout << "function dumper, needed function: " << (*it2)->getName().str() << endl;
                // }
                // throw runtime_error("blockdumper generation didnt run to completion");
                return false;
            }

            // for(auto it2=basicBlock->begin(); it2 != basicBlock->end(); it2++) {
            //     Instruction *instr = &*it2;
            //     if(PHINode *phi = dyn_cast<PHINode>(instr)) {
            //         addPHIDeclaration(phi);
            //     }
            // }

            // bodyCl += label + ":;\n";
            // ostringstream oss;
            ostringstream blockstream;
            blockstream << label << ":;\n";
            basicBlockDumper.toCl(blockstream);
            // cout << "block cl [" << blockstream.str() << "]" << endl;
            // bodyCl += blockstream.str();

            // functionDeclarations += basicBlockDumper.getAllocaDeclarations("    ");
            // ostringstream funcdecos;
            // basicBlockDumper.writeDeclarations("    ", funcdecos);
            // functionDeclarations += funcdecos.str();

            // sharedVariablesToDeclare.insert(basicBlockDumper.sharedVariablesToDeclare.begin(), basicBlockDumper.sharedVariablesToDeclare.end());
            shimFunctionsNeeded.insert(basicBlockDumper.shimFunctionsNeeded.begin(), basicBlockDumper.shimFunctionsNeeded.end());
            neededFunctions.insert(basicBlockDumper.neededFunctions.begin(), basicBlockDumper.neededFunctions.end());

            try {
                blockstream << dumpTerminator(&returnType, basicBlock->getTerminator());
            } catch(NeedValueDependencyException &e) {
                cout << "need dependent value during dump block terminator" << endl;
                // e.value->dump();
                continue;
            }

            ouros << blockstream.str();
            blocksDumped.insert(basicBlock);
        }
        iteration++;
    }

    _generationDone = true;
    return true;
}

bool FunctionDumper::generationDone() {
    // return block_it == F->end();
    return _generationDone;
}

void FunctionDumper::writeDeclarations(std::string indent, ostream &os) {
    vector<string> declarations;
    for(auto it = localValueInfos.begin(); it != localValueInfos.end(); it++) {
        LocalValueInfo *localValueInfo = it->second.get();
        // cout << "FunctionDumper, writing declration for " << localValueInfo->name << ":" << endl;
        // it->first->dump();
        ostringstream oss;
        localValueInfo->writeDeclaration("    ", typeDumper, oss);
        declarations.push_back(oss.str());
    }
    std::sort(declarations.begin(), declarations.end());
    for(auto it=declarations.begin(); it != declarations.end(); it++) {
        os << *it;
    }
}

void FunctionDumper::toCl(ostream &os) {
    // if(block_it != F->end()) {
    if(!_generationDone) {
        throw runtime_error("Need to run generation completely first");
    }
    if(returnType != 0) {
        declaration = typeDumper->dumpType(returnType) + " " + declaration;
    } else {
        declaration = string("void") + " " + declaration;
    }
    if(isKernel) {
        declaration = "kernel " + declaration;
    }
    this->functionDeclaration = declaration;

    // string declaration = dumpFunctionDeclaration(F);

    // Type *returnType = F->getReturnType();
    // if(PointerType *ptr = dyn_cast<PointerType>(returnType)) {
    //     if(ptr->getAddressSpace() == 1) {
    //         declaration = "global " + declaration;  // a bit hacky, but maybe it works ok for now?
    //     }
    // }

    // ostringstream oss;
    os << declaration << " {\n";

    if(shimCode != "") {
        os << shimCode << "\n";
    }

    // os << functionDeclarations + "\n";
    writeDeclarations("    ", os);
    os << "\n";

    for(auto it=phiDeclarationsByName.begin(); it != phiDeclarationsByName.end(); it++){
        os << "    " << it->second << ";\n";
    }

    os << dumpSharedDefinitions("    ");

    os << ouros.str();
    // gencode += bodyCl;
    os << "}\n";

    // COCL_PRINT(cout << endl);
    // os << gencode;
    // return gencode;
}

std::string FunctionDumper::getDeclaration() {
    return functionDeclaration;
}

} // namespace cocl
