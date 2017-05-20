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

// #include <iostream>
#include <memory>
// #include <vector>
// #include <map>
// #include <set>
#include <cstdint>

#include "EasyCL/EasyCL.h"

// #include "CL/cl.h"

#include "cocl/cocl_defs.h"

namespace easycl {
    class CLKernel;
    class EasyCL;
}

namespace cocl {
    class CoclStream;

    int32_t getNumCachedKernels(); // this should be per-context or something, though right now, it is not yet
    int32_t getNumKernelCalls();
    // std::string  convertLlToCl(std::string devicellsourcecode, std::string kernelName);
    // easycl::CLKernel *getKernelForNameCl(std::string kernelName, std::string clSourcecode);

    struct GenerateOpenCLResult {
        std::string clSourcecode;
        std::string originalKernelName;
        std::string shortKernelName;
        std::string uniqueKernelName;
    };
    GenerateOpenCLResult generateOpenCL(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, std::string origKernelName, std::string devicellsourcecode);
    easycl::CLKernel *compileOpenCLKernel(std::string uniqueKernelName, std::string shortKernelName, std::string clSourcecode);
    // easycl::CLKernel *getKernelForNameLl(std::string kernelName, std::string devicellsourcecode);

}

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
    void configureKernel(
        const char *kernelName, const char *llsourcecode);

    size_t cuInit(unsigned int flags);
}

void configureKernel(const char *kernelName, const char *devicellsourcecode);
void addClmemArg(cl_mem clmem);
void setKernelArgStruct(char *pCpuStruct, int structAllocateSize);
void setKernelArgCharStar(char *memory_as_charstar, int32_t elementSize);
void setKernelArgInt64(int64_t value);
void setKernelArgInt32(int value);
void setKernelArgInt8(char value);
void setKernelArgFloat(float value);
void kernelGo();
