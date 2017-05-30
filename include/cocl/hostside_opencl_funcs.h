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

    struct GenerateOpenCLResult {
        std::string clSourcecode;
        std::string originalKernelName;
        std::string shortKernelName;
        std::string uniqueKernelName;
    };
    GenerateOpenCLResult generateOpenCL(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, std::string origKernelName, std::string devicellsourcecode);
    easycl::CLKernel *compileOpenCLKernel(std::string originalKernelName, std::string uniqueKernelName, std::string shortKernelName, std::string clSourcecode);
    easycl::CLKernel *compileOpenCLKernel(std::string shortKernelName, std::string clSourcecode);

    // These Arg classes store kernel parameter values, which we can use
    // at kernel creation time, and then pass into the kernel at that point
    // we dont create the kernel until the actual launch command (which is after
    // the kernelSetArg commands), so we have all the information available at that
    // time about what kernel arguments we have
    // concretely, it means we can dedupe the underlying cl_mem buffers, for example
    class Arg {
    public:
        virtual ~Arg() {}
        virtual void inject(easycl::CLKernel *kernel) = 0;
        virtual std::string str() = 0;
    };
    class Int8Arg : public Arg {
    public:
        Int8Arg(char v) : v(v) {}
        void inject(easycl::CLKernel *kernel) {
            kernel->in(v);
        }
        virtual std::string str() { return "Int8Arg"; }
        char v;
    };
    class Int32Arg : public Arg {
    public:
        Int32Arg(int v) : v(v) {}
        void inject(easycl::CLKernel *kernel) {
            kernel->in(v);
        }
        virtual std::string str();
        int v;
    };
    class UInt32Arg : public Arg {
    public:
        UInt32Arg(uint32_t v) : v(v) {}
        void inject(easycl::CLKernel *kernel) {
            kernel->in_uint32(v);
        }
        virtual std::string str() { return "UInt32Arg"; }
        uint32_t v;
    };
    class Int64Arg : public Arg {
    public:
        Int64Arg(int64_t v) : v(v) {}
        void inject(easycl::CLKernel *kernel) {
            kernel->in(v);
        }
        virtual std::string str();
        int64_t v;
    };
    class FloatArg : public Arg {
    public:
        FloatArg(float v) : v(v) {}
        void inject(easycl::CLKernel *kernel) {
            kernel->in(v);
        }
        virtual std::string str() { return "FloatArg"; }
        float v;
    };
    class NullPtrArg : public Arg {
    public:
        NullPtrArg() {}
        void inject(easycl::CLKernel *kernel) {
            kernel->in_nullptr();
        }
        virtual std::string str() { return "NullPtrArg"; }
    };
    class ClmemArg : public Arg {
    public:
        ClmemArg(cl_mem v) : v(v) {}
        void inject(easycl::CLKernel *kernel) {
            kernel->inout(&v);
        }
        virtual std::string str() { return "ClmemArg"; }
        cl_mem v;
    };
    class StructArg : public Arg {
    public:
        StructArg(char *pCpuStruct, int structAllocateSize) :
            pCpuStruct(pCpuStruct), structAllocateSize(structAllocateSize)
        {}
        virtual std::string str() { return "StructArg"; }
        char *pCpuStruct;
        int structAllocateSize;
    };

    class LaunchConfiguration {
    public:
        size_t grid[3];
        size_t block[3];
        // CLKernel *kernel;
        easycl::CLQueue *queue = 0;  // NOT owned by us
        cocl::CoclStream *coclStream = 0; // NOT owned

        std::vector<std::unique_ptr<Arg> > args;

        // map<cl_mem *, int> clmemIndexByClmem;
        std::map<cl_mem, int> clmemIndexByClmem;
        std::vector<cl_mem> clmems;
        std::vector<int> clmemIndexByClmemArgIndex;

        std::vector<cl_mem> kernelArgsToBeReleased;
        std::string kernelName = "";
        std::string devicellsourcecode = "";
    };
}

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
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
