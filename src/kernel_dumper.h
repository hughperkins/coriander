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

// this takes in the module, and the name of a kernel, and does whatever we need to do to get some
// working opencl code out of it :-)

#include "GlobalNames.h"
#include "type_dumper.h"
#include "shims.h"

#include "llvm/IR/Module.h"

#include <string>
#include <set>

namespace cocl {

class KernelDumper {
public:
    KernelDumper(llvm::Module *M, std::string kernelName, std::string generatedName, bool offsets_32bit) :
            M(M), kernelName(kernelName), generatedName(generatedName), offsets_32bit(offsets_32bit) {
        typeDumper.reset(new cocl::TypeDumper(&globalNames));
    }
    virtual ~KernelDumper() {}
    std::string toCl(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex);
    void declareGlobals(std::ostream &os);
    void declareGlobal(std::ostream &os, llvm::GlobalValue *var);

    llvm::Module *M;
    std::string kernelName;
    std::string generatedName;
    bool offsets_32bit;

    std::set<std::string> functionDeclarations;
    std::set<llvm::StructType *>structsToDefine;
    // std::set<std::string> shimFunctionsNeeded; // for __shfldown_3 etc, that we provide as opencl directly

    KernelDumper *addIRToCl() {
        _addIRToCl = true;
        return this;
    }

    bool usesVmem = false;
    bool usesScratch = false;

protected:
    bool _addIRToCl = false;
    cocl::GlobalNames globalNames;
    std::unique_ptr<cocl::TypeDumper> typeDumper;
    cocl::Shims shims;
};

} // namespace cocl
