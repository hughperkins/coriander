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

string FunctionDumper::createOffsetShim(Type *argType, string argName) {
    string shim = "    " + argName + " += " + argName + "_offset;\n";
    return shim;
}

            // GlobalNames *globalNames, LocalNames *localNames, TypeDumper *typeDumper, const FunctionNamesMap *functionNamesMap,
            // std::vector<AllocaInfo> *allocaDeclarations, std::set<llvm::Value *> *variablesToDeclare,
            // std::set<llvm::Value *> *sharedVariablesToDeclare, std::set<std::string> *shimFunctionsNeeded,
            // std::set<llvm::Function *> *neededFunctions,
            // std::map<llvm::Value *, std::string> *globalExpressionByValue, std::map<llvm::Value *, std::string> *localExpressionByValue

std::string FunctionDumper::dumpPhi(llvm::BranchInst *branchInstr, llvm::BasicBlock *nextBlock) {
    std::string gencode = "";
    for(auto it = nextBlock->begin(); it != nextBlock->end(); it++) {
        Instruction *instr = &*it;
        if(instr->getOpcode() != Instruction::PHI) {
            break;
        }
        if(PHINode *phi = dyn_cast<PHINode>(instr)) {
            string name = localNames.getOrCreateName(phi);
            BasicBlock *ourBlock = branchInstr->getParent();
            Value *sourceValue = phi->getIncomingValueForBlock(ourBlock);
            vector<AllocaInfo> allocaInfos;
            InstructionDumper instructionDumper(globalNames, &localNames, typeDumper, functionNamesMap,
                &allocaInfos, &variablesToDeclare,
                &sharedVariablesToDeclare, &shimFunctionsNeeded,
                &neededFunctions,
                &globalExpressionByValue, &localExpressionByValue);
            vector<string> reslines;
            // string sourceValueCode = instructionDumper.runRhsGeneration(sourceValue, &reslines);
            string sourceValueCode = instructionDumper.dumpOperand(sourceValue);

            // string sourceValueCode = localNames.getName(sourceValue);
            // COCL_PRINT(cout << "adding phi " << sourceValueCode << endl);
            if(sourceValueCode == "") { // this is a hack really..
                continue;  // assume its an undef. which it might be
            }
            copyAddressSpace(sourceValue, phi);
            gencode += localNames.getName(phi) + " = ";
            gencode += sourceValueCode + ";\n";
        }
        // }
    }
    return gencode;
}

std::string FunctionDumper::dumpReturn(Type **pReturnType, ReturnInst *retInst, std::map<llvm::Value *, std::string> &localExpressionByValue) {
    std::string gencode = "";
    Value *retValue = retInst->getReturnValue();
    if(retValue != 0) {
        Function *F = retInst->getFunction();
        copyAddressSpace(retValue, F);
        *pReturnType = retValue->getType();
        gencode += "return " + localExpressionByValue[retValue];
        // gencode += "return " + dumpOperand(retValue);
    } else {
        // we still need to have "return" if no value, since some loops terminate with a `return` in the middle
        // of the codeblock.  Or rather, they dont terminate, if we dont write out a `return` :-P
        gencode += "return";
    }
    return gencode;
}

std::string FunctionDumper::dumpBranch(llvm::BranchInst *instr, std::map<Value *, std::string> &localExpressionByValue) {
    string gencode = "";
    if(instr->isConditional()) {
        string conditionstring = localExpressionByValue[instr->getCondition()];
        if(!isSingleExpression(conditionstring) || conditionstring[0] != '(') {
            conditionstring = "(" + conditionstring + ")";
        }
        // gencode += "if " + conditionstring + " {\n";
        string trueSection = "";
        bool needTrueSection = false;
        string phicode = dumpPhi(instr, instr->getSuccessor(0));
        if(phicode != "") {
            trueSection += "        " + phicode;
            needTrueSection = true;
        }
        if(instr->getNextNode() == 0 && functionBlockIndex[instr->getSuccessor(0)] != functionBlockIndex[instr->getParent()] + 1) {
            trueSection += "        goto " + localNames.getName(instr->getSuccessor(0)) + ";\n";
            needTrueSection = true;
        }
        string falseSection = "";
        bool needFalseSection = false;
        if(instr->getNumSuccessors() == 1) {
        } else if(instr->getNumSuccessors() == 2) {
            // gencode += "    } else {\n";
            string phicode = dumpPhi(instr, instr->getSuccessor(1));
            if(phicode != "") {
                falseSection += "        " + phicode;
                needFalseSection = true;
            }
            if(instr->getNextNode() == 0 && functionBlockIndex[instr->getSuccessor(1)] != functionBlockIndex[instr->getParent()] + 1) {
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
            string phicode = dumpPhi(instr, nextBlock);
            if(phicode != "") {
                gencode += "    " + phicode;
            }
            bool needGoto = true;
            if(instr->getNextNode() == 0) {
                if(functionBlockIndex[nextBlock] == functionBlockIndex[instr->getParent()] + 1) {
                    needGoto = false;
                }
            }
            if(needGoto) {
                gencode += "    goto " + localNames.getName(instr->getSuccessor(0)) + ";\n";
            }
        } else {
            throw runtime_error("not implemented sucessors != 1 for unconditional br");
        }
    }
    return gencode;
}

// adds declaratoin of the phi, to the start of hte functoin (via currentFunctionPhiDeclarationsByName)
// the address space should be correct on phi by the time this function is called
void FunctionDumper::addPHIDeclaration(llvm::PHINode *phi) {
    // storeValueName(phi);
    // string name = nameByValue[phi];
    string name = localNames.getOrCreateName(phi);
    string declaration = typeDumper->dumpType(phi->getType()) + " " + name;
    phiDeclarationsByName[name] = declaration;
}

std::vector<std::string> FunctionDumper::dumpSharedDefinition(llvm::Value *value) {
    std::vector<std::string> declarations;
    value ->dump();
    if(GlobalVariable *glob = dyn_cast<GlobalVariable>(value)) {
        string name = glob->getName().str();
        string declaration = "";
        Type *type = glob->getType();
        if(ArrayType *arraytype = dyn_cast<ArrayType>(type->getPointerElementType())) {
            int length = arraytype->getNumElements();
            Type *elementType = arraytype->getElementType();
            string typestr = typeDumper->dumpType(elementType);
            declarations.push_back("local " + typestr + " " + name + "[" + easycl::toString(length) + "]");
            // declarations.push_back("local " + typestr + "** " + name + " = &" + name + "__");
            localExpressionByValue[value] = name;
            // nameByValue[value] = name;
            // currentFunctionSharedDeclarations += declaration;
            return declarations;
        } else {
            cout << "dumpshared definition called with:" << endl;
            value->dump();
            cout << endl;
            throw runtime_error("didnt expect ot be here, globalvaraible, not array.  dumpshareddefinition, for htis value");
        }
    } else {
        cout << "dumpshared definition called with:" << endl;
        value->dump();
        cout << endl;
        throw runtime_error("didnt expect ot be here.  dumpshareddefinition, for htis value");
    }
}

std::string FunctionDumper::dumpSharedDefinitions(std::string indent) {
    ostringstream oss;
    for(auto it=sharedVariablesToDeclare.begin(); it != sharedVariablesToDeclare.end(); it++) {
        Value *variable = *it;
        // cout << "declaring:" << endl;
        // variable->dump();
        // cout << endl;
        std::vector<std::string> declarations = dumpSharedDefinition(variable);
        for(auto it2=declarations.begin(); it2 != declarations.end(); it2++) {
            oss << indent << *it2 << ";\n";
        }
        // string definition = dumpSharedDefinition(variable);
        // cout << "defnition: " << definition << endl;
        // gencode += definition;
        // oss << indent << definition << ";\n";
    }
    return oss.str();
}

std::string FunctionDumper::dumpFunctionDeclarationWithoutReturn(llvm::Function *F) {
    string declaration = "";
    // Type *retType = F->getReturnType();
    // std::string retTypeString = typeDumper->dumpType(retType);
    string fname = F->getName().str();
    // declaration += typeDumper->dumpType(retType) + " " + fname + "(";
    declaration += fname + "(";
    int i = 0;
    // structpointershimcode = "";
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

                            // globalNames->getOrCreateName(structType, structType->getName().str());
                            StructType *noptrType = structCloner.cloneNoPointers(structType);
                            noptrType->setName(structType->getName().str() + "_nopointers");
                            // argType = PointerType::get(globalizedStruct, 0);
                            // arg->mutateType(argType);
                            // structsToDefine.insert(globalizedStruct);
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
        if(!is_struct_needs_cloning) {
            argdeclaration = typeDumper->dumpType(arg->getType()) + " " + argName;
            // if(ispointer) {
                // argdeclaration += "_";
            // }
        }
        if(i > 0) {
            declaration += ", ";
        }
        declaration += argdeclaration;
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
                pointerInfo->type = PointerType::get(pointerInfo->type->getPointerElementType(), 1);
                string pointerArgName = argName + "_ptr" + easycl::toString(j);
                declaration += ", " + typeDumper->dumpType(pointerInfo->type) + " " + pointerArgName;
                declaration += createOffsetDeclaration(pointerArgName);
                shimCode = 
                    createOffsetShim(pointerInfo->type, pointerArgName) +
                    shimCode +
                    argName + "[0]" + pointerInfo->path + " = " + pointerArgName + ";\n";
                j++;
            }
        }
        if(isKernel && ispointer && !is_struct_needs_cloning) {
            // add offset
            declaration += createOffsetDeclaration(argName);
            shimCode = 
                createOffsetShim(arg->getType(), argName) +
                shimCode;
        }
        i++;
    }
    if(i > 0) {
        declaration += ", ";
    }
    declaration += "local int *scratch";
    declaration += ")";
    return declaration;
}

std::string FunctionDumper::dumpTerminator(Type **pReturnType, Instruction *terminator, std::map<llvm::Value *, std::string> &localExpressionByValue) {
    string terminatorCl = "";
    if(ReturnInst *retInst = dyn_cast<ReturnInst>(terminator)) {
        terminatorCl = "    " + dumpReturn(pReturnType, retInst, localExpressionByValue) + ";\n";
        // returnType = retInst->getOperand(0)->getType();
    } else if(BranchInst *branch = dyn_cast<BranchInst>(terminator)) {
        terminatorCl = dumpBranch(branch, localExpressionByValue);
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
            localNames.getOrCreateName(basicBlock);
            i++;
        }
    }
}

bool FunctionDumper::runGeneration(const std::set<llvm::Function *> &dumpedFunctions, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    // returns true means finished, false means missing some dependnecy, like a sub fucntion walk

    generateBlockIndex();

    // first time initializes the types of hte args and so on
    declaration = dumpFunctionDeclarationWithoutReturn(F);

    for(; block_it != F->end(); block_it++) {
        BasicBlock *basicBlock = &*block_it;
        string label = localNames.getOrCreateName(basicBlock);

        for(auto it2=basicBlock->begin(); it2 != basicBlock->end(); it2++) {
            Instruction *instr = &*it2;
            if(PHINode *phi = dyn_cast<PHINode>(instr)) {
                addPHIDeclaration(phi);
            }
        }

        BasicBlockDumper basicBlockDumper(
            basicBlock, globalNames, &localNames, typeDumper, functionNamesMap);
        if(_addIRToCl) {
            basicBlockDumper.addIRToCl();
        }
        if(!basicBlockDumper.runGeneration(dumpedFunctions, returnTypeByFunction)) {
            cout << "blockdumper generation didnt run to completion" << endl;
            neededFunctions.insert(basicBlockDumper.neededFunctions.begin(), basicBlockDumper.neededFunctions.end());
            for(auto it2=neededFunctions.begin(); it2 != neededFunctions.end(); it2++) {
                cout << "function dumper, needed function: " << (*it2)->getName().str() << endl;
            }
            // throw runtime_error("blockdumper generation didnt run to completion");
            return false;
        }
        // bodyCl += label + ":;\n";
        // ostringstream oss;
        ouros << label << ":;\n";
        basicBlockDumper.toCl(ouros);
        // bodyCl += oss.str();

        functionDeclarations += basicBlockDumper.getAllocaDeclarations("    ");
        functionDeclarations += basicBlockDumper.writeDeclarations("    ");

        sharedVariablesToDeclare.insert(basicBlockDumper.sharedVariablesToDeclare.begin(), basicBlockDumper.sharedVariablesToDeclare.end());
        shimFunctionsNeeded.insert(basicBlockDumper.shimFunctionsNeeded.begin(), basicBlockDumper.shimFunctionsNeeded.end());
        neededFunctions.insert(basicBlockDumper.neededFunctions.begin(), basicBlockDumper.neededFunctions.end());

        ouros << dumpTerminator(&returnType, basicBlock->getTerminator(), basicBlockDumper.localExpressionByValue);
    }
    return true;
}

void FunctionDumper::toCl(ostream &os) {
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

    os << functionDeclarations + "\n";

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
