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

#include "kernel_dumper.h"

#include "GlobalNames.h"
#include "LocalNames.h"
#include "function_names_map.h"
#include "type_dumper.h"
#include "function_dumper.h"
#include "shims.h"
#include "mutations.h"

#include "llvm/IR/Constants.h"

#include <stdexcept>
#include <iostream>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {

// void KernelDumper::declareGlobal(ostream &os, GlobalValue *global) {
//     // string gencode = "";
//     if(GlobalVariable *var = dyn_cast<GlobalVariable>(global)) {
//         string name = global->getName().str();
//         if(name == "$str") {
//             return;  // lazily skip $str for now...
//         }
//         // gencode += "constant " + dumpType(global->getType()->getPointerElementType()) + " " + name;
//         os << "constant " << typeDumper->dumpType(global->getType()->getPointerElementType()) << " " << name;
//         if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
//             int addressspace = pointerType->getAddressSpace();
//             if(addressspace == 3) { // shared/local => skip
//                 return;
//             } else {
//                 updateAddressSpace(var, 4);
//             }
//         }
//         if(var->hasInitializer()) {
//             Constant *initializer = var->getInitializer();
//             // gencode += " = {";
//             os << " = {";
//             if(ConstantStruct *constStruct = dyn_cast<ConstantStruct>(initializer)) {
//                 int i = 0;
//                 while(Value *aggel = constStruct->getAggregateElement(i)) {
//                     if(i == 0) {
//                     } else {
//                         // gencode += ", ";
//                         os << ", ";
//                     }
//                     if(Constant *constant = dyn_cast<Constant>(aggel)) {
//                         os << dumpOperand(aggel);
//                     } else {
//                         cout << "value not implemented in declareglobal:" << endl;
//                         aggel->dump();
//                         cout << endl;
//                         throw runtime_error("not implemetned in declareglobal");
//                     }
//                     // gencode += dumpOperand(aggel);
//                     i++;
//                 }
//                 if(i > 0) {
//                 }
//             }
//             // gencode += "}";
//             os << "}";
//         } else {
//             // gencode += " = {}";
//             os << " = {}";
//         }
//     } else {
//         global->dump();
//         throw runtime_error("unimplemented declareglobalvalue for this type");
//     }
//     // gencode += ";\n";
//     os << ";\n";
//     // globalDeclarations += gencode + "\n";
// }

void KernelDumper::declareGlobals(ostream &os) {
    // global_begin/end returns all the bits that start with '@', at the top of the .ll
    // cout << "begin declare global variables" << endl;
    // for(auto it=M->global_begin(); it != M->global_end(); it++) {
    //     GlobalVariable *glob = &*it;
    //     string name = getName(glob);
    //     if(name == "llvm.used") {
    //         continue;
    //     }
    //     if(name.find(".str") == 0) {
    //         // ignore global strings for now (probably add in locally; though I dont think opencl really uses strings..)
    //         continue;
    //     }
    //     if(name == "llvm.global_ctors") {
    //         // we should handle these sooner or later, but skip for now
    //         cerr << "warning: skipping @llvm.global_ctors" << endl;
    //         continue;
    //     }
    //     if(ignoredGlobalVariables.find(name) != ignoredGlobalVariables.end()) {
    //         continue;
    //     }
    //     glob->dump();
    //     declareGlobal(os, glob);
    // }
}

std::string KernelDumper::toCl() {
    Function *F = M->getFunction(kernelName);
    if(F == 0) {
        throw runtime_error("Couldnt find kernel " + kernelName);
    }

    // GlobalNames globalNames;
    // TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    Shims shims;

    ostringstream moduleClStream;

    set<Function *> dumpedFunctions;
    set<Function *> neededFunctions;
    set<Function *> isKernel;

    isKernel.insert(F);
    // dumpedFunctions.insert(F);
    neededFunctions.insert(F);

    // FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);
    // if(_addIRToCl) {
    //     functionDumper.addIRToCl();
    // }
    // string kernelFunctionCl = functionDumper.toCl();

    // functionDeclarations.insert(functionDumper.getDeclaration());
    // // cout << "kernelFunctionCl:\n" << kernelFunctionCl << endl;
    // moduleClStream << kernelFunctionCl;
    // shimFunctionsNeeded.insert(functionDumper.shimFunctionsNeeded.begin(), functionDumper.shimFunctionsNeeded.end());
    // neededFunctions.insert(functionDumper.neededFunctions.begin(), functionDumper.neededFunctions.end());
    // structsToDefine.insert(functionDumper.structsToDefine.begin(), functionDumper.structsToDefine.end());

    while(dumpedFunctions.size() < neededFunctions.size()) {
        for(auto it = neededFunctions.begin(); it != neededFunctions.end(); it++) {
            Function *childF = *it;
            if(dumpedFunctions.find(childF) != dumpedFunctions.end()) {
                continue;
            }
            cout << "dumping function " << childF->getName().str() << endl;
            dumpedFunctions.insert(childF);
            bool _isKernel = isKernel.find(childF) != isKernel.end();
            FunctionDumper childFunctionDumper(childF, _isKernel, &globalNames, typeDumper.get(), &functionNamesMap);
            if(_addIRToCl) {
                childFunctionDumper.addIRToCl();
            }
            childFunctionDumper.runGeneration();
            ostringstream os;
            childFunctionDumper.toCl(os);
            string childFunctionCl = os.str();

            structsToDefine.insert(childFunctionDumper.structsToDefine.begin(), childFunctionDumper.structsToDefine.end());
            functionDeclarations.insert(childFunctionDumper.getDeclaration());
            shimFunctionsNeeded.insert(childFunctionDumper.shimFunctionsNeeded.begin(), childFunctionDumper.shimFunctionsNeeded.end());
            neededFunctions.insert(childFunctionDumper.neededFunctions.begin(), childFunctionDumper.neededFunctions.end());

            // cout << "childFunctionCl:\n" << childFunctionCl << endl;
            moduleClStream << childFunctionCl;
        }
    }

    // get all shim names
    for(auto it=shimFunctionsNeeded.begin(); it != shimFunctionsNeeded.end(); it++) {
        string shimName = *it;
        cout << "kerneldumper, shim name needed=" << shimName << endl;
        set<string> dependencies = shims.getDependenciesByName(shimName);
        shimFunctionsNeeded.insert(dependencies.begin(), dependencies.end());
    }

    ostringstream functionDeclarationsStream;
    for(auto it=structsToDefine.begin(); it != structsToDefine.end(); it++) {
        typeDumper->structsToDefine.insert(*it);
    }
    functionDeclarationsStream << typeDumper->dumpStructDefinitions() << "\n";

    for(auto it=shimFunctionsNeeded.begin(); it != shimFunctionsNeeded.end(); it++) {
        string shimName = *it;
        string shimCl = shims.getClByName(shimName);
        functionDeclarationsStream << shimCl << "\n";
    }

    for(auto it=functionDeclarations.begin(); it != functionDeclarations.end(); it++) {
        functionDeclarationsStream << *it << ";\n";
    }
    // ostringstream structDeclarationsStream;
    // typeDumper.dumpStructDeclarations(structDeclarationsStream);
    return
        // structDeclarationsStream.str() + "\n" +
        functionDeclarationsStream.str() + "\n" +
        moduleClStream.str();
}

} // namespace cocl
