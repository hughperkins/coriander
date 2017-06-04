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

#include "function_names_map.h"

#include <set>
#include <map>

using namespace std;

namespace cocl {

void FunctionNamesMap::populateKnownValues() {
    knownFunctionsMap["_ZSt4sqrtf"] = "sqrt";
    knownFunctionsMap["llvm.nvvm.sqrt.rn.d"] = "sqrt";
    knownFunctionsMap["llvm.nvvm.fabs.f"] = "fabs";
    knownFunctionsMap["llvm.nvvm.fabs.ftz.f"] = "fabs";
    knownFunctionsMap["_Z16our_pretend_tanhf"] = "tanh";
    knownFunctionsMap["_Z15our_pretend_logf"] = "log";
    knownFunctionsMap["_Z15our_pretend_expf"] = "exp";
    knownFunctionsMap["_Z5__clzi"] = "clz";

    knownFunctionsMap["_ZSt16our_pretend_tanhf"] = "tanh";
    knownFunctionsMap["_ZSt15our_pretend_logf"] = "log";
    knownFunctionsMap["_ZSt15our_pretend_expf"] = "exp";

    knownFunctionsMap["_ZSt4tanhf"] = "tanh";
    knownFunctionsMap["_ZSt3logf"] = "log";
    knownFunctionsMap["_ZSt3expf"] = "exp";
    knownFunctionsMap["_ZSt3powff"] = "pow";
    knownFunctionsMap["_Z3minff"] = "fmin";
    knownFunctionsMap["_Z3maxff"] = "fmax";
    knownFunctionsMap["_Z4fabsf"] = "fabs";

    knownFunctionsMap["fminf"] = "fmin";
    knownFunctionsMap["fmaxf"] = "fmax";

    knownFunctionsMap["tanhf"] = "tanh";
    knownFunctionsMap["expf"] = "exp";
    knownFunctionsMap["fabsf"] = "fabs";
    knownFunctionsMap["fabs"] = "fabs";
    knownFunctionsMap["acosf"] = "acos";
    knownFunctionsMap["asinf"] = "asin";
    knownFunctionsMap["atanf"] = "atan";
    knownFunctionsMap["cosf"] = "cos";
    knownFunctionsMap["sinf"] = "sin";
    knownFunctionsMap["tanf"] = "tan";
    knownFunctionsMap["ceilf"] = "ceil";
    knownFunctionsMap["floorf"] = "floor";
    knownFunctionsMap["logf"] = "log";
    knownFunctionsMap["sqrtf"] = "sqrt";

    knownFunctionsMap["sqrt"] = "sqrt";
    knownFunctionsMap["pow"] = "pow";
    knownFunctionsMap["_Z3powff"] = "pow";
    knownFunctionsMap["_Z4sqrtf"] = "sqrt";
    knownFunctionsMap["_Z3logf"] = "log";

    knownFunctionsMap["_Z9atomicCASIjET_PS0_S0_S0_"] = "atomic_cmpxchg";   // int
    knownFunctionsMap["_Z10atomicExchIjET_PS0_S0_"] = "atomic_xchg";  // ints
    knownFunctionsMap["_Z10atomicExchIfET_PS0_S0_"] = "atomic_xchg";   // floats
    knownFunctionsMap["_Z9atomicIncIjET_PS0_S0_"] = "__atomic_inc";   // int

    // llvm 4.0:
    knownFunctionsMap["_Z5fminfff"] = "fmin";
    knownFunctionsMap["_Z5fmaxfff"] = "fmax";

    knownFunctionsMap["_Z5sqrtff"] = "sqrt";
    knownFunctionsMap["_Z4logff"] = "log";
    knownFunctionsMap["_Z5sqrtff"] = "sqrt";
    knownFunctionsMap["_Z5tanhff"] = "tanh";
    knownFunctionsMap["_Z4expff"] = "exp";
    knownFunctionsMap["_Z5fabsff"] = "fabs";
    knownFunctionsMap["_Z5acosff"] = "acos";
    knownFunctionsMap["_Z5asinff"] = "asin";
    knownFunctionsMap["_Z5atanff"] = "atan";
    knownFunctionsMap["_Z4cosff"] = "cos";
    knownFunctionsMap["_Z4sinff"] = "sin";
    knownFunctionsMap["_Z4tanff"] = "tan";
    knownFunctionsMap["_Z5ceilff"] = "ceil";
    knownFunctionsMap["_Z6floorff"] = "floor";
    // end llvm 4.0

    ignoredGlobalVariables.insert("blockIdx");
    ignoredGlobalVariables.insert("threadIdx");
    ignoredGlobalVariables.insert("gridDim");
    ignoredGlobalVariables.insert("blockDim");
}

// bool FunctionNamesMap::isIgnoredFunction(std::string name) const {
//     return ignoredFunctionNames.find(name) != ignoredFunctionNames.end();
// }

bool FunctionNamesMap::isMappedFunction(std::string name) const {
    return knownFunctionsMap.find(name) != knownFunctionsMap.end();
}

bool FunctionNamesMap::isIgnoredGlobalVariable(std::string name) const {
    return ignoredGlobalVariables.find(name) != ignoredGlobalVariables.end();
}

std::string FunctionNamesMap::getFunctionMappedName(std::string name) const {
    if(knownFunctionsMap.find(name) == knownFunctionsMap.end()) {
        return 0;
    }
    const string res = knownFunctionsMap.at(name);
    return res;
}

} // namespace cocl
