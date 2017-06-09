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

#include "cocl/cocl_launch_args.h"

#include <memory>
#include <cstdint>

#include "EasyCL/EasyCL.h"

#include "cocl/cocl_defs.h"

namespace easycl {
    class CLKernel;
    class EasyCL;
}

namespace cocl {
    class CoclStream;

    int32_t getNumCachedKernels(); // this should be per-context or something, though right now, it is not yet
    int32_t getNumKernelCalls();

    struct GenerateOpenCLResult {
        std::string clSourcecode;
        std::string originalKernelName;
        std::string shortKernelName;
        std::string uniqueKernelName;
    };
    GenerateOpenCLResult generateOpenCL(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, std::string origKernelName, std::string devicellsourcecode);
    easycl::CLKernel *compileOpenCLKernel(std::string originalKernelName, std::string uniqueKernelName, std::string shortKernelName, std::string clSourcecode);
    easycl::CLKernel *compileOpenCLKernel(std::string shortKernelName, std::string clSourcecode);


    class LaunchConfiguration {
    public:
        size_t grid[3];
        size_t block[3];
        easycl::CLQueue *queue = 0;  // NOT owned by us
        cocl::CoclStream *coclStream = 0; // NOT owned

        std::vector<std::unique_ptr<Arg> > args;

        std::map<cl_mem, int> clmemIndexByClmem;
        std::vector<cl_mem> clmems;
        std::vector<int> clmemIndexByClmemArgIndex;

        std::vector<cl_mem> kernelArgsToBeReleased;
        std::string kernelName = "";
        std::string uniqueKernelName = "";
        std::string shortKernelName = "";
        std::string devicellsourcecode = "";
    };
}

class  dim3 {
public:
dim3(unsigned int x, unsigned y, unsigned int z ) :x(x), y(y), z(z) {}
dim3(unsigned int x, unsigned y ) :x(x), y(y), z(1) {}
dim3(unsigned int x ) :x(x), y(1), z(1) {}
dim3() :x(1), y(1), z(1) {}
unsigned int x;
unsigned int y;
unsigned int z;
};

std::ostream &operator<<(std::ostream &os, const dim3 &value);

// #define __launch_bounds__(x) __attribute__((launch_bounds(x)))
// #define __launch_bounds__(x)
// #define __launch_bounds__(x, y)

// found this at https://gist.github.com/eliben/b014ac17cbe5a452803f
#define __launch_bounds__(...) __attribute__((launch_bounds(__VA_ARGS__)))

extern "C" {
    int cudaConfigureCall(const dim3 grid, const dim3 block, long long shared = 0,  char * stream = 0);

    void configureKernel(
        const char *kernelName, const char *llsourcecode);

    size_t cuInit(unsigned int flags);

    void configureKernel(const char *kernelName, const char *devicellsourcecode);
    void addClmemArg(cl_mem clmem);
    void setKernelArgHostsideBuffer(char *pCpuStruct, int structAllocateSize);
    void setKernelArgGpuBuffer(char *memory_as_charstar, int32_t elementSize);
    void setKernelArgInt64(int64_t value);
    void setKernelArgInt32(int value);
    void setKernelArgInt8(char value);
    void setKernelArgFloat(float value);
    void kernelGo();
}
