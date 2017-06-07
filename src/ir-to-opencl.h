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

#pragma once

#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Function.h"

#include <string>
#include <vector>

namespace cocl {

class ModuleClRes {
public:
    std::string clSourcecode = "";
    bool usesVmem = false;
    bool usesScratch = false;
};

ModuleClRes convertModuleToCl(
    int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, llvm::Module *M, std::string specificFunction, std::string generatedName, bool offsets_32bit);
ModuleClRes convertLlStringToCl(
    int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, std::string llString, std::string specificFunction, std::string generatedName, bool offsets_32bit);

} // namespace cocl
