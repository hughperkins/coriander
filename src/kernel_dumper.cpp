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

#include "kernel_dumper.h"

#include "GlobalNames.h"
#include "LocalNames.h"
#include "function_names_map.h"
#include "type_dumper.h"
#include "function_dumper.h"
#include "mutations.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include "llvm/IR/Constants.h"

#include <stdexcept>
#include <iostream>
#include <sstream>

using namespace std;
using namespace llvm;

namespace cocl {


void KernelDumper::declareGlobals(ostream &os) {
}

static std::string createShortKernelName(string origName, std::set<std::string> &usedShortNames) {
    std::string name = origName;
    name = name.substr(0, 27);
    int i = 0;
    while(usedShortNames.find(name) != usedShortNames.end()) {
        name = name.substr(0, 27) + easycl::toString(i);
        i++;
    }
    usedShortNames.insert(name);
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

    std::set<std::string> usedShortNames;
    usedShortNames.insert(generatedName);
    for(auto it = M->begin(); it != M->end(); it++) {
        Function *thisF = &*it;
        if(thisF == F) {
            continue;
        }
        string origName = thisF->getName().str();
        if(origName.find("llvm.") != string::npos) {
            continue;
        }
        std::string shortName = createShortKernelName(origName, usedShortNames);
        if(M->getFunction(origName) == 0) {
            cout << "ERROR: couldnt find kernel " << origName << endl;
            throw runtime_error("ERROR: couldnt find kernel " + origName);
        }
        if(thisF->getParent() == 0) {
            cout << "ERROR: couldnt find parent module " << origName << endl;
            throw runtime_error("ERROR: couldnt find parent module " + origName);
        }
        thisF->setName(shortName);
    }

    FunctionNamesMap functionNamesMap;
    // Shims shims;

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
            neededFunctionNames.push_back(functionName);
            neededFunctionByName[functionName] = childF;
        }
        std::sort(neededFunctionNames.begin(), neededFunctionNames.end());
        for(auto it = neededFunctionNames.begin(); it != neededFunctionNames.end(); it++) {
            string functionName = *it;
            Function *childF = neededFunctionByName.at(functionName);
            bool _isKernel = isKernel.find(childF) != isKernel.end();
            std::string origName = childF->getName().str();
            FunctionDumper childFunctionDumper(
                M, childF, origName, _isKernel, uniqueClmemCount, clmemIndexByClmemArgIndex,
                &globalNames, typeDumper.get(), &functionNamesMap, offsets_32bit);
            if(_addIRToCl) {
                childFunctionDumper.addIRToCl();
            }
            if(!childFunctionDumper.runGeneration(returnTypeByFunction)) {
                neededFunctions.insert(childFunctionDumper.neededFunctions.begin(), childFunctionDumper.neededFunctions.end());
                continue;
            }
            if(childFunctionDumper.usesVmem) {
                this->usesVmem = true;
            }
            if(childFunctionDumper.usesScratch) {
                this->usesScratch = true;
            }

            returnTypeByFunction[childF] = childFunctionDumper.returnType;
            changedSomething = true;
            ostringstream os;
            childFunctionDumper.toCl(os);
            string childFunctionCl = os.str();

            structsToDefine.insert(childFunctionDumper.structsToDefine.begin(), childFunctionDumper.structsToDefine.end());
            functionDeclarations.insert(childFunctionDumper.getDeclaration());
            shims.copyFrom(childFunctionDumper.shims);
            // shimFunctionsNeeded.insert(childFunctionDumper.shimFunctionsNeeded.begin(), childFunctionDumper.shimFunctionsNeeded.end());
            neededFunctions.insert(childFunctionDumper.neededFunctions.begin(), childFunctionDumper.neededFunctions.end());

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
    // for(auto it=shimFunctionsNeeded.begin(); it != shimFunctionsNeeded.end(); it++) {
    //     string shimName = *it;
    //     set<string> dependencies = shims.getDependenciesByName(shimName);
    //     shimFunctionsNeeded.insert(dependencies.begin(), dependencies.end());
    // }

    ostringstream functionDeclarationsStream;
    for(auto it=structsToDefine.begin(); it != structsToDefine.end(); it++) {
        typeDumper->structsToDefine.insert(*it);
    }

    functionDeclarationsStream << R"(// __vmem__ is just a marker, so we can see which bits are vmems
// It doesnt actually do anything; compiler ignores it
#define __vmem__

// vmem2 is a pointer to a pointer (so we have to unwrap twice)
#define __vmem2__

struct GlobalVars {
    local int *scratch;
    global char *clmem0;
    unsigned long clmem_vmem_offset0;
};

inline global float *getGlobalPointer(__vmem__ unsigned long vmemloc, const struct GlobalVars* const globalVars) {
    return (global float *)(globalVars->clmem0 + vmemloc - globalVars->clmem_vmem_offset0);
}

)";

    functionDeclarationsStream << typeDumper->dumpStructDefinitions() << "\n";

    shims.writeCl(functionDeclarationsStream);

    // for(auto it=shimFunctionsNeeded.begin(); it != shimFunctionsNeeded.end(); it++) {
    //     string shimName = *it;
    //     string shimCl = shims.getClByName(shimName);
    //     functionDeclarationsStream << shimCl << "\n";
    // }

    for(auto it=functionDeclarations.begin(); it != functionDeclarations.end(); it++) {
        functionDeclarationsStream << *it << ";\n";
    }
    return
        functionDeclarationsStream.str() + "\n" +
        moduleClStream.str();
}

} // namespace cocl
