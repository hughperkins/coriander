// Copyright Hugh Perkins 2016, 2017

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


// the type used for kernel buffer offsets, ie unsigned 32bit (for beignet), or signed 64bit (default)
std::string FunctionDumper::getOffsetType() {
    if(offsets_32bit) {
       return "uint";
    } else {
       return "long";
   }
}

string FunctionDumper::createOffsetDeclaration(string argName) {
    ostringstream decl_ss;
    decl_ss << ", " << getOffsetType() << " " << argName << "_offset";
    return decl_ss.str();
}

std::string FunctionDumper::createOffsetShim(Type *argType, std::string argName, int clmemIndex) {
    std::ostringstream oss;
    oss << "    " << typeDumper->dumpType(argType) << " " << argName << " = ";
    oss << "(" << typeDumper->dumpType(argType) << ")(clmem" << clmemIndex << " + " << argName + "_offset);\n";
    return oss.str();
}

std::string FunctionDumper::dumpPhi(std::string indent, llvm::BranchInst *branchInstr, llvm::BasicBlock *nextBlock) {
    std::string gencode = "";
    for(auto it = nextBlock->begin(); it != nextBlock->end(); it++) {
        Instruction *instr = &*it;
        if(instr->getOpcode() != Instruction::PHI) {
            break;
        }
        if(PHINode *phi = dyn_cast<PHINode>(instr)) {
            BasicBlock *ourBlock = branchInstr->getParent();
            Value *sourceValue = phi->getIncomingValueForBlock(ourBlock);
            if(isa<UndefValue>(sourceValue)) {
                continue;
            }
            LocalValueInfo *sourceValueInfo = instructionDumper->getOperand(sourceValue);
            string sourceValueCode = sourceValueInfo->getExpr();
            copyAddressSpace(sourceValue, phi);
            LocalValueInfo *phiValueInfo = LocalValueInfo::getOrCreate(
                &localNames, &localValueInfos, phi);
            phiValueInfo->setAsAssigned();
            phiValueInfo->addressSpace = sourceValueInfo->addressSpace;

            string phivarname = phiValueInfo->getExpr();
            if(_addIRToCl) {
                string originalInstruction = typeDumper->dumpType(phi->getType()) + " " + phiValueInfo->name + " =";
                originalInstruction += " phi " + sourceValueInfo->name;
                gencode += indent + "/* " + originalInstruction + " */\n";
            }
            gencode += indent + phivarname + " = ";
            gencode += sourceValueCode + ";\n";
        }
    }
    return gencode;
}

std::string FunctionDumper::dumpReturn(Type **pReturnType, ReturnInst *retInst) {
    std::string gencode = "";
    Value *retValue = retInst->getReturnValue();
    if(retValue != 0) {
        Function *F = retInst->getFunction();
        copyAddressSpace(retValue, F);
        *pReturnType = retValue->getType();
        string retValueStr = instructionDumper->getOperand(retValue)->getExpr();
        gencode += "return " + retValueStr;
    } else {
        // we still need to have "return" if no value, since some loops terminate with a `return` in the middle
        // of the codeblock.  Or rather, they dont terminate, if we dont write out a `return` :-P
        gencode += "return";
    }
    return gencode;
}

std::string FunctionDumper::dumpBranch(llvm::BranchInst *instr) {
    string gencode = "";
    if(instr->isConditional()) {
        string conditionstring = localValueInfos.at(instr->getCondition())->getExpr();

        if(_addIRToCl) {
            string originalInstruction = "if(" + localValueInfos.at(instr->getCondition())->name + ")";
            gencode += "    /* " + originalInstruction + " */\n";
        }

        if(!ExpressionsHelper::isSingleExpression(conditionstring) || conditionstring[0] != '(') {
            conditionstring = "(" + conditionstring + ")";
        }
        string trueSection = "";
        bool needTrueSection = false;
        string phicode = dumpPhi("        ", instr, instr->getSuccessor(0));
        if(phicode != "") {
            trueSection += phicode;
            needTrueSection = true;
        }
        if(instr->getNextNode() == 0) {
            trueSection += "        goto " + localNames.getName(instr->getSuccessor(0)) + ";\n";
            needTrueSection = true;
        }
        string falseSection = "";
        bool needFalseSection = false;
        if(instr->getNumSuccessors() == 1) {
        } else if(instr->getNumSuccessors() == 2) {
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
    } else {
        if(instr->getNumSuccessors() == 1) {
            BasicBlock *nextBlock = instr->getSuccessor(0);
            string phicode = dumpPhi("    ", instr, nextBlock);
            if(phicode != "") {
                gencode += phicode;
            }
            gencode += "    goto " + localNames.getName(instr->getSuccessor(0)) + ";\n";
        } else {
            throw runtime_error("not implemented sucessors != 1 for unconditional br");
        }
    }
    return gencode;
}

// adds declaratoin of the phi, to the start of hte functoin (via currentFunctionPhiDeclarationsByName)
// the address space should be correct on phi by the time this function is called
void FunctionDumper::addPHIDeclaration(llvm::PHINode *phi) {
    string name = localNames.getOrCreateName(phi);
    string declaration = typeDumper->dumpType(phi->getType()) + " " + name;
    phiDeclarationsByName[name] = declaration;
}

std::vector<std::string> FunctionDumper::dumpSharedDefinition(llvm::Value *value) {
    std::vector<std::string> declarations;
    return declarations;
}

std::string FunctionDumper::dumpSharedDefinitions(std::string indent) {
    ostringstream oss;
    return oss.str();
}

std::string FunctionDumper::dumpKernelFunctionDeclarationWithoutReturn(llvm::Function *F) {
    std::ostringstream declaration;
    shimCode = "";

    declaration << shortName;
    declaration << "(";
    int i = 0;
    for(int clmemIdx = 0; clmemIdx < this->kernelNumUniqueClmems; clmemIdx++) {
        if(clmemIdx > 0) {
            declaration << ", ";
        }
        declaration << "global char* clmem" << clmemIdx;
        declaration << ", unsigned long clmem_vmem_offset" << clmemIdx;
        i++;
    }
    int clmemArgIndex = 0;
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        string argName = localNames.getOrCreateName(arg, arg->getName().str());
        Type *argType = arg->getType();

        string argdeclaration = "";
        bool is_struct_needs_cloning = false;
        bool ispointer = isa<PointerType>(argType);
        if(PointerType *ptrType = dyn_cast<PointerType>(argType)) {
            Type *elemType = ptrType->getElementType();
            if(StructType *structType = dyn_cast<StructType>(elemType)) {
                if(structType->getName().str() != "struct.float4") {
                    unique_ptr<StructInfo> structInfo(new StructInfo());
                    StructCloner::walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
                    if(structInfo->pointerInfos.size() > 0) { // struct has pointers...
                        // mutate any pointers to be globals
                        map<StructType *, StructType *>oldnew;

                        StructType *noptrType = structCloner.cloneNoPointers(structType);
                        noptrType->setName(structType->getName().str() + "_nopointers");
                        structsToDefine.insert(noptrType);
                        is_struct_needs_cloning = true;
                        argdeclaration = getOffsetType() + " " + argName + "_nopointers_offset";

                        PointerType *noptrTypePointer = PointerType::get(noptrType, 1);
                        int clmemIndex = kernelClmemIndexByArgIndex[clmemArgIndex];
                        clmemArgIndex++;
                        shimCode = 
                            createOffsetShim(noptrTypePointer, argName + "_nopointers", clmemIndex) +
                            shimCode;
                    }
                }
            }
        }
        if(!is_struct_needs_cloning) {
            if(argType->getTypeID() == Type::PointerTyID) {
                Type *elementType = cast<PointerType>(argType)->getElementType();
                Type *newtype = PointerType::get(elementType, 1);
                arg->mutateType(newtype);
            }
        }
        if(!is_struct_needs_cloning && !ispointer) {
            argdeclaration = typeDumper->dumpType(arg->getType()) + " " + argName;
        }
        if(is_struct_needs_cloning || !ispointer) {
            if(i > 0) {
                declaration << ", ";
            }
        }
        declaration << argdeclaration;
        // if this is a kernel method, check for any structs containing pointers,
        // and add those pointers t othe argument list, with some appropriate shimcode
        // to copy those pointers into the struct, at the start of the kernel
        // if(ispointer && !is_struct_needs_cloning) {
        if(ispointer && !is_struct_needs_cloning) {
            // add offset
            int clmemIndex = kernelClmemIndexByArgIndex[clmemArgIndex];
            clmemArgIndex++;
            declaration << createOffsetDeclaration(argName);
            shimCode = 
                createOffsetShim(arg->getType(), argName, clmemIndex) +
                shimCode;
        }
        int j = 0;
        if(is_struct_needs_cloning) {
            StructType *structType = cast<StructType>(cast<PointerType>(argType)->getElementType());
            // declare a pointerful struct, then copy the vlaues across, then copy the float *s in
            unique_ptr<StructInfo> structInfo(new StructInfo());
            StructCloner::walkStructType(F->getParent(), structInfo.get(), 0, 0, std::vector<int>(), "", structType);
            shimCode += typeDumper->dumpType(structType) + " " + argName + "[1];\n";
            shimCode += structCloner.writeClCopyToDevicesideStruct(structType, argName + "_nopointers[0]", argName + "[0]");
            for(auto pointerit=structInfo->pointerInfos.begin(); pointerit != structInfo->pointerInfos.end(); pointerit++) {
                PointerInfo *pointerInfo = pointerit->get();
                Type *pointerElementType = cast<PointerType>(pointerInfo->type)->getElementType();
                // for now only handle pointers to primitives
                if(pointerElementType->getPrimitiveSizeInBits() == 0) {
                    continue;
                }
                pointerInfo->type = PointerType::get(cast<PointerType>(pointerInfo->type)->getElementType(), 1);
                string pointerArgName = argName + "_ptr" + easycl::toString(j);
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
        i++;
    }
    if(i > 0) {
        declaration << ", ";
    }
    declaration << "local int *scratch";
    declaration << ")";
    return declaration.str();
}

std::string FunctionDumper::dumpInternalFunctionDeclarationWithoutReturn(llvm::Function *F) {
    std::ostringstream declaration;
    shimCode = "";
    declaration << shortName;
    declaration << "(";
    int i = 0;
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        if(i > 0) {
            declaration << ", ";
        }
        Argument *arg = &*it;
        string argName = localNames.getOrCreateName(arg, arg->getName().str());
        Type *argType = arg->getType();
        string argdeclaration = "";
        bool ispointer = isa<PointerType>(argType);
        argdeclaration = typeDumper->dumpType(arg->getType()) + " " + argName;
        declaration << argdeclaration;
        i++;
    }
    if(i > 0) {
        declaration << ", ";
    }
    declaration << "const struct GlobalVars *const pGlobalVars";
    declaration << ")";
    return declaration.str();
}

std::string FunctionDumper::dumpFunctionDeclarationWithoutReturn(llvm::Function *F) {
    if(isKernel) {
        return dumpKernelFunctionDeclarationWithoutReturn(F);
    } else {
        return dumpInternalFunctionDeclarationWithoutReturn(F);
    }
}

std::string FunctionDumper::dumpTerminator(Type **pReturnType, Instruction *terminator) {
    string terminatorCl = "";
    if(ReturnInst *retInst = dyn_cast<ReturnInst>(terminator)) {
        terminatorCl = "    " + dumpReturn(pReturnType, retInst) + ";\n";
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
            localNames.getOrCreateName(basicBlock);
            i++;
        }
    }
}

bool FunctionDumper::runGeneration(const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    // returns true means finished, false means missing some dependnecy, like a sub fucntion walk

    generateBlockIndex();

    // first time initializes the types of hte args and so on
    declaration = dumpFunctionDeclarationWithoutReturn(F);

    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        LocalValueInfo *localValueInfo = LocalValueInfo::getOrCreate(&localNames, &localValueInfos, arg, arg->getName().str());
        localValueInfo->setExpression(localValueInfo->name);
    }

    size_t numBlocks = 0;
    for(auto block_it=F->begin(); block_it != F->end(); block_it++) {
        numBlocks++;
    }
    set<BasicBlock *> blocksDumped;

    int iteration = 0;
    while(blocksDumped.size() < numBlocks) {
        for(auto block_it = F->begin(); block_it != F->end(); block_it++) {
            BasicBlock *basicBlock = &*block_it;
            if(blocksDumped.find(basicBlock) != blocksDumped.end()) {
                // already dumped this block
                continue;
            }
            string label = localNames.getOrCreateName(basicBlock);

            // check whether we have the address space for the phis yet
            bool phisOutstanding = false;
            for(auto phi_it=basicBlock->begin(); phi_it != basicBlock->end(); phi_it++) {
                Instruction *inst = &*phi_it;
                if(!isa<PHINode>(inst)) {
                    break;
                }
                PHINode *phi = cast<PHINode>(inst);
                if(localValueInfos.find(phi) == localValueInfos.end()) {
                    phisOutstanding = true;
                    break;
                }
            }
            if(phisOutstanding) {
                continue;
            }

            BasicBlockDumper basicBlockDumper(
                M, basicBlock, globalNames, &localNames, typeDumper, functionNamesMap,
                &globalExpressionByValue, &localValueInfos);
            if(_addIRToCl) {
                basicBlockDumper.addIRToCl();
            }
            bool finished = false;
            try {
                finished = basicBlockDumper.runGeneration(returnTypeByFunction);
            } catch(NeedValueDependencyException &e) {
                continue;
            }
            if(!finished) {
                neededFunctions.insert(basicBlockDumper.neededFunctions.begin(), basicBlockDumper.neededFunctions.end());
                return false;
            }

            ostringstream blockstream;
            blockstream << label << ":;\n";
            basicBlockDumper.toCl(blockstream);

            // shimFunctionsNeeded.insert(basicBlockDumper.shimFunctionsNeeded.begin(), basicBlockDumper.shimFunctionsNeeded.end());
            shims.copyFrom(basicBlockDumper.shims);
            neededFunctions.insert(basicBlockDumper.neededFunctions.begin(), basicBlockDumper.neededFunctions.end());
            if(basicBlockDumper.usesVmem) {
                this->usesVmem = true;
            }
            if(basicBlockDumper.usesScratch) {
                this->usesScratch = true;
            }

            try {
                blockstream << dumpTerminator(&returnType, basicBlock->getTerminator());
            } catch(NeedValueDependencyException &e) {
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
    return _generationDone;
}

void FunctionDumper::writeDeclarations(std::string indent, ostream &os) {
    vector<string> declarations;
    for(auto it = localValueInfos.begin(); it != localValueInfos.end(); it++) {
        LocalValueInfo *localValueInfo = it->second.get();
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

    os << declaration << " {\n";

    if(shimCode != "") {
        os << shimCode << "\n";
    }
    if(isKernel) {
    os << R"(    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

)";
}

    writeDeclarations("    ", os);
    os << "\n";

    for(auto it=phiDeclarationsByName.begin(); it != phiDeclarationsByName.end(); it++){
        os << "    " << it->second << ";\n";
    }

    os << dumpSharedDefinitions("    ");

    os << ouros.str();
    os << "}\n";
}

std::string FunctionDumper::getDeclaration() {
    return functionDeclaration;
}

} // namespace cocl
