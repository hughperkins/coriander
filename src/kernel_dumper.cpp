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

#include <stdexcept>
#include <iostream>

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

    kernelFunctionCl = FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);
    cout << "kernelFunctionCl:\n" << kernelFunctionCl << endl;
    set<Function *> neededFunctions;
    for(auto it=functionDumper.)
}

} // namespace cocl
