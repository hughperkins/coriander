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

// input: IR from cuda compilation

#include "ir-to-opencl.h"

#include "ir-to-opencl-common.h"
#include "kernel_dumper.h"

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/SourceMgr.h"


namespace cocl {

ModuleClRes convertModuleToCl(
        int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, llvm::Module *M, std::string specificFunction, std::string generatedName,
        bool offsets_32bit) {
    cocl::KernelDumper kernelDumper(M, specificFunction, generatedName, offsets_32bit);
    kernelDumper.addIRToCl();
    std::string cl = kernelDumper.toCl(uniqueClmemCount, clmemIndexByClmemArgIndex);
    ModuleClRes res;
    res.clSourcecode = cl;
    res.usesVmem = kernelDumper.usesVmem;
    res.usesScratch = kernelDumper.usesScratch;
    return res;
}

ModuleClRes convertLlStringToCl(
        int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, std::string llString, std::string specificFunction, std::string generatedName,
        bool offsets_32bit) {
    llvm::StringRef llStringRef(llString);
    std::unique_ptr<llvm::MemoryBuffer> llMemoryBuffer = llvm::MemoryBuffer::getMemBuffer(llStringRef);
    llvm::LLVMContext context;
    llvm::SMDiagnostic smDiagnostic;
    std::unique_ptr<llvm::Module> M = parseIR(llMemoryBuffer->getMemBufferRef(), smDiagnostic,
                                context);
    if(!M) {
        smDiagnostic.print("irtopencl", llvm::errs());
        throw std::runtime_error("failed to parse IR");
    }
    ModuleClRes res = convertModuleToCl(uniqueClmemCount, clmemIndexByClmemArgIndex, M.get(), specificFunction, generatedName, offsets_32bit);
    return res;
}

} // namespace cocl
