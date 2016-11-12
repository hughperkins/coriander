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
            string sourceValueCode = localNames.getName(sourceValue);
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

std::string FunctionDumper::dumpReturn(ReturnInst *retInst, std::map<llvm::Value *, std::string> &exprByValue) {
    std::string gencode = "";
    Value *retValue = retInst->getReturnValue();
    if(retValue != 0) {
        Function *F = retInst->getFunction();
        copyAddressSpace(retValue, F);
        gencode += "return " + exprByValue[retValue];
        // gencode += "return " + dumpOperand(retValue);
    } else {
        // we still need to have "return" if no value, since some loops terminate with a `return` in the middle
        // of the codeblock.  Or rather, they dont terminate, if we dont write out a `return` :-P
        gencode += "return";
    }
    return gencode;
}

std::string FunctionDumper::dumpBranch(llvm::BranchInst *instr, std::map<Value *, std::string> &exprByValue) {
    string gencode = "";
    if(instr->isConditional()) {
        string conditionstring = exprByValue[instr->getCondition()];
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
            gencode += "if " + conditionstring + " {\n";
            gencode += trueSection;
            if(needFalseSection) {
                gencode += "    } else {\n";
                gencode += falseSection;
            }
            gencode += "    }\n";
        } else if(needFalseSection) {
            gencode += "if(!" + conditionstring + ") {\n";
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

std::string FunctionDumper::dumpFunctionDeclaration(llvm::Function *F) {
    string declaration = "";
    Type *retType = F->getReturnType();
    std::string retTypeString = typeDumper->dumpType(retType);
    string fname = F->getName().str();
    if(isKernel) {
        declaration += "kernel ";
    }
    declaration += typeDumper->dumpType(retType) + " " + fname + "(";
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
                            StructType *noptrType = structCloner.cloneNoPointers(structType);
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
                int offset = pointerInfo->offset;
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

std::string FunctionDumper::toCl() {
    string declaration = dumpFunctionDeclaration(F);

    string bodyCl = "";
    int i = 0;
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        functionBlockIndex[basicBlock] = i;
        i++;
    }

    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        string label = localNames.getOrCreateName(basicBlock);
        bodyCl += label + ":;\n";
        BasicBlockDumper basicBlockDumper(
            basicBlock, globalNames, &localNames, typeDumper, functionNamesMap);
        bodyCl += basicBlockDumper.toCl();
        functionDeclarations += basicBlockDumper.getAllocaDeclarations("    ");
        functionDeclarations += basicBlockDumper.writeDeclarations("    ");
        for(auto it2=basicBlockDumper.neededFunctions.begin(); it2 != basicBlockDumper.neededFunctions.end(); it2++) {
            neededFunctions.insert(*it2);
        }
        Instruction *terminator = basicBlock->getTerminator();
        string terminatorCl = "";
        if(ReturnInst *retInst = dyn_cast<ReturnInst>(terminator)) {
            terminatorCl = dumpReturn(retInst, basicBlockDumper.exprByValue);
        } else if(BranchInst *branch = dyn_cast<BranchInst>(terminator)) {
            terminatorCl = dumpBranch(branch, basicBlockDumper.exprByValue);
        } else {
            cout << "unhandled terminator type:";
            terminator->dump();
            throw runtime_error("unhandled terminator type");
        }
        bodyCl += terminatorCl;
    }

    // Type *returnType = F->getReturnType();
    // if(PointerType *ptr = dyn_cast<PointerType>(returnType)) {
    //     if(ptr->getAddressSpace() == 1) {
    //         declaration = "global " + declaration;  // a bit hacky, but maybe it works ok for now?
    //     }
    // }

    string gencode = declaration + " {\n";
    gencode += functionDeclarations + "\n";
    for(auto it=phiDeclarationsByName.begin(); it != phiDeclarationsByName.end(); it++){
        gencode += "    " + it->second + ";\n";
    }

    if(shimCode != "") {
        gencode += shimCode + "\n";
    }
    gencode += bodyCl;
    gencode += "}\n";

    // COCL_PRINT(cout << endl);
    return gencode;
}

} // namespace cocl
