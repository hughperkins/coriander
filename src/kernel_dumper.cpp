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

    ostringstream moduleClStream;

    set<Function *> dumpedFunctions;
    set<Function *> neededFunctions;

    dumpedFunctions.insert(F);
    neededFunctions.insert(F);

    FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);
    string kernelFunctionCl = functionDumper.toCl();
    cout << "kernelFunctionCl:\n" << kernelFunctionCl << endl;
    moduleClStream << kernelFunctionCl;
    for(auto it=functionDumper.neededFunctions.begin(); it != functionDumper.neededFunctions.end(); it++) {
        neededFunctions.insert(*it);
    }
    while(dumpedFunctions.size() < neededFunctions.size()) {
        for(auto it = neededFunctions.begin(); it != neededFunctions.end(); it++) {
            Function *childF = *it;
            if(dumpedFunctions.find(childF) != dumpedFunctions.end()) {
                continue;
            }
            cout << "dumping function " << childF->getName().str() << endl;
            dumpedFunctions.insert(childF);
            FunctionDumper childFunctionDumper(childF, false, &globalNames, &typeDumper, &functionNamesMap);
            string childFunctionCl = childFunctionDumper.toCl();
            cout << "childFunctionCl:\n" << childFunctionCl << endl;
            moduleClStream << childFunctionCl;
        }
    }
    return moduleClStream.str();
}

} // namespace cocl
