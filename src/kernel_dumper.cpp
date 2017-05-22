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
#include "EasyCL/util/easycl_stringhelper.h"

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

static std::string createShortKernelName(string origName, std::set<std::string> &usedShortNames) {
        // std::map<std::string, std::string> &shortNameByOrigName) {
    // string origName = name;
    std::string name = origName;
    // if(name == )
    // std::cout << "kernel_dumper toCl func orig name = " << name << std::endl;
    // if(name.size() > 32) {
    name = name.substr(0, 27);
    // }
    // if(name.find("llvm.") == std::string::npos) {
    //     name = easycl::replaceGlobal(name, ".", "_");
    // }
    int i = 0;
    while(usedShortNames.find(name) != usedShortNames.end()) {
        name = name.substr(0, 27) + easycl::toString(i);
        i++;
    }
    // thisF->setName(name);
    usedShortNames.insert(name);
    // shortNameByOrigName[origName] = name;
    return name;
}

std::string KernelDumper::toCl(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex) {
    Function *F = M->getFunction(kernelName);
    if(F == 0) {
        throw runtime_error("Couldnt find kernel " + kernelName);
    }
    // kernel name will simply be truncated to 32 characters
    // other names will fit around it

    F->setName(generatedName);
    // std::cout << "kernel_dumper toCl generatedName=" << generatedName << std::endl;
    // if(kernelName.size() > 32) {
    //     kernelName = kernelName.substr(0, 31);
    //     F->setName(kernelName);
    // }
    // cout << "F name " << F->getName().str() << endl;

    std::set<std::string> usedShortNames;
    usedShortNames.insert(generatedName);
    // std::map<std::string, std::string> shortNameByOrigName;
    // shortNameByOrigName[kernelName] = generatedName;
    for(auto it = M->begin(); it != M->end(); it++) {
        Function *thisF = &*it;
        if(thisF == F) {
            // std::cout << "skipping " << F->getName().str() << std::endl;
            continue;
        }
        string origName = thisF->getName().str();
        if(origName.find("llvm.") != string::npos) {
            continue;
        }
        std::string shortName = createShortKernelName(origName, usedShortNames);
            // shortNameByOrigName);
        if(M->getFunction(origName) == 0) {
            cout << "ERROR: couldnt find kernel " << origName << endl;
            throw runtime_error("ERROR: couldnt find kernel " + origName);
        }
        if(thisF->getParent() == 0) {
            cout << "ERROR: couldnt find parent module " << origName << endl;
            throw runtime_error("ERROR: couldnt find parent module " + origName);
        }
        // std::cout << "   generatedname=" << name << std::endl;
        thisF->setName(shortName);
        std::cout << "kernel_dumper toCl() " << origName << " => " << shortName << std::endl;
    }

    // GlobalNames globalNames;
    // TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    Shims shims;

    ostringstream moduleClStream;

    set<Function *> neededFunctions;
    set<Function *> isKernel;
    map<Function *, Type *> returnTypeByFunction;
    map<string, string> oldNameByNewName;

    isKernel.insert(F);
    neededFunctions.insert(F);

    int nothingHappenedCount = 0;
    while(returnTypeByFunction.size() < neededFunctions.size()) {
        bool changedSomething = false;
        // put the functions in a list ordered by name first, so we get repeatable output
        vector<string> neededFunctionNames;
        map<string, Function*> neededFunctionByName;
        for(auto it = neededFunctions.begin(); it != neededFunctions.end(); it++) {
            Function *childF = *it;
            if(returnTypeByFunction.find(childF) != returnTypeByFunction.end()) {
                continue;
            }
            string functionName = childF->getName().str();
            // cout << "  neededFuncion=" << functionName << endl;
            neededFunctionNames.push_back(functionName);
            neededFunctionByName[functionName] = childF;
        }
        std::sort(neededFunctionNames.begin(), neededFunctionNames.end());
        // for(auto it = neededFunctions.begin(); it != neededFunctions.end(); it++) {
        for(auto it = neededFunctionNames.begin(); it != neededFunctionNames.end(); it++) {
            string functionName = *it;
            // Function *childF = *it;
            Function *childF = neededFunctionByName.at(functionName);
            // if(returnTypeByFunction.find(childF) != returnTypeByFunction.end()) {
            //     continue;
            // }
            // cout << "dumping function " << functionName << endl;
            bool _isKernel = isKernel.find(childF) != isKernel.end();
            std::string origName = childF->getName().str();
            // if(shortNameByOrigName.find(origName) == shortNameByOrigName.end()) {
            //     createShortKernelName(origName, usedShortNames, shortNameByOrigName);
            // }
            // std::string shortName = shortNameByOrigName[functionName];
            FunctionDumper childFunctionDumper(
                M, childF, origName, _isKernel, uniqueClmemCount, clmemIndexByClmemArgIndex, &globalNames, typeDumper.get(), &functionNamesMap);
                // &shortNameByOrigName);
            if(_addIRToCl) {
                childFunctionDumper.addIRToCl();
            }
            // cout << " running generation on " << childF->getName().str() << endl;
            if(!childFunctionDumper.runGeneration(returnTypeByFunction)) {
                // cout << "couldnt run generation to completion yet for " << childF->getName().str() << endl;
                neededFunctions.insert(childFunctionDumper.neededFunctions.begin(), childFunctionDumper.neededFunctions.end());
                // for(auto it2=neededFunctions.begin(); it2 != neededFunctions.end(); it2++) {
                //     cout << "needed function: " << (*it2)->getName().str() << endl;
                // }
                continue;
            }

            // dumpedFunctions.insert(childF);
            returnTypeByFunction[childF] = childFunctionDumper.returnType;
            changedSomething = true;
            ostringstream os;
            childFunctionDumper.toCl(os);
            string childFunctionCl = os.str();

            structsToDefine.insert(childFunctionDumper.structsToDefine.begin(), childFunctionDumper.structsToDefine.end());
            functionDeclarations.insert(childFunctionDumper.getDeclaration());
            shimFunctionsNeeded.insert(childFunctionDumper.shimFunctionsNeeded.begin(), childFunctionDumper.shimFunctionsNeeded.end());
            neededFunctions.insert(childFunctionDumper.neededFunctions.begin(), childFunctionDumper.neededFunctions.end());
            // for(auto it2=neededFunctions.begin(); it2 != neededFunctions.end(); it2++) {
            //     cout << "needed function: " << (*it2)->getName().str() << endl;
            // }

            // cout << "childFunctionCl:\n" << childFunctionCl << endl;
            moduleClStream << childFunctionCl;
        }
        if(!changedSomething) {
            nothingHappenedCount++;
            if(nothingHappenedCount >= 2) {
                cout << "no new function dependency found to update => failing" << endl;
                throw runtime_error("no new function dependency found to update => failing");
            }
        } else {
            nothingHappenedCount = 0;
        }
    }

    // get all shim names
    for(auto it=shimFunctionsNeeded.begin(); it != shimFunctionsNeeded.end(); it++) {
        string shimName = *it;
        // cout << "kerneldumper, shim name needed=" << shimName << endl;
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
