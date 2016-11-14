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

#include <stdexcept>
#include <iostream>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {

std::string KernelDumper::toCl() {
    Function *F = M->getFunction(kernelName);
    if(F == 0) {
        throw runtime_error("Couldnt find kernel " + kernelName);
    }

    GlobalNames globalNames;
    TypeDumper typeDumper(&globalNames);
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
            FunctionDumper childFunctionDumper(childF, _isKernel, &globalNames, &typeDumper, &functionNamesMap);
            if(_addIRToCl) {
                childFunctionDumper.addIRToCl();
            }
            string childFunctionCl = childFunctionDumper.toCl();

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
        typeDumper.structsToDefine.insert(*it);
    }
    functionDeclarationsStream << typeDumper.dumpStructDefinitions() << "\n";

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
