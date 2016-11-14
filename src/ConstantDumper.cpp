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

#include "ConstantDumper.h"

// I guess that constants dont need other values and so on, therefore can be dumped outside of a basicblock context?

#include <iostream>

using namespace std;
using namespace llvm;

namespace cocl {

void ConstantDumper::dumpConstant(std::ostream &oss, llvm::Constant *constant) {
// maybe this should be somewhere more generic?
// string BasicBlockDumper::dumpConstant(Constant *constant) {
    unsigned int valueTy = constant->getValueID();
    // ostringstream oss;
    if(ConstantInt *constantInt = dyn_cast<ConstantInt>(constant)) {
        oss << constantInt->getSExtValue();
        // string constantintval = oss.str();
        // return constantintval;
        return;
    } else if(isa<ConstantStruct>(constant)) {
        throw runtime_error("constantStruct not implemented in basicblockdumper.dumpconstant");
    } else if(ConstantExpr *expr = dyn_cast<ConstantExpr>(constant)) {
        // cout << "constantexpr" << endl;
        // return dumpConstantExpr(expr);
        oss << dumpConstantExpr(expr);
        return;
        // throw runtime_error("constantExpr not implemented in basicblockdumper.dumpconstnat");
        // Instruction *instr = expr->getAsInstruction();
        // cout << "dumping:" << endl;
        // instr->dump();
        // copyAddressSpace(constant, instr);
        // string dcires = dumpInstruction(instr);
        // cout << "calling dci" << endl;
        // string dcires = dumpChainedInstruction(0, instr, true);
        // cout << "dcires " << dcires << endl;
        // // copyAddressSpace(instr, constant);
        // nameByValue[constant] = dcires;
        // cout << "exprByValue has constant? " << (exprByValue.find(constant) != exprByValue.end()) << endl;
        // exprByValue[constant] = dcires;
        // return dcires;
    } else if(ConstantFP *constantFP = dyn_cast<ConstantFP>(constant)) {
        oss << dumpFloatConstant(forceSingle, constantFP);
        return;
    } else if(GlobalValue *global = dyn_cast<GlobalValue>(constant)) {
        // cout << "globalvalue" << endl;
        // throw runtime_error("GlobalValue not implemented in basicblockdumper.dumpconstant");
        if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
            int addressspace = pointerType->getAddressSpace();
            if(addressspace == 3) {  // if it's local memory, it's not really 'global', juts return the name
                sharedVariablesToDeclare.insert(global);
                string name = global->getName().str();
                localNames->getOrCreateName(global, name);
                // cout << "shared memory, creating in localnames name=" << name << endl;
                oss << name;
                return;
                // return name;
            }
        }
        if(globalNames->hasName(constant)) {
            // cout << "found constnat in globalanesm, returning" << endl;
           return globalNames->getName(constant);
        }
        string name = global->getName().str();
        // cout << "using global's native name " << name << endl;
        string ourinstrstr = "(&" + name + ")";
        updateAddressSpace(constant, 4);  // 4 means constant
        // cout << "adding to exprByValue [" << ourinstrstr << "]" << endl;
        exprByValue[constant] = ourinstrstr;

        oss << ourinstrstr;
        return;
        // return ourinstrstr;
    } else if(isa<UndefValue>(constant)) {
        // return "";
        return;
    } else if(isa<ConstantPointerNull>(constant)) {
        // return "0";
        oss << "0";
        return;
    } else {
        cout << "valueTy " << valueTy << endl;
        oss << "unknown";
        constant->dump();
        throw runtime_error("unknown constnat type");
    }
    // return oss.str();
}

} //namespace cocl
