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

#include "cocl/hostside_opencl_funcs.h"
// #include "cocl_kernellaunch.h"
#include "cocl/cocl.h"
#include "cocl/cocl_memory.h"
#include "cocl/cocl_clsources.h"
#include "cocl/local_config.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "EasyCL.h"

#include "CL/cl.h"
#include "cocl/cocl.h"
#include "cocl/cocl_memory.h"

using namespace std;
using namespace easycl;
using namespace cocl;

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
}

// #undef COCL_PRINT
// #define COCL_PRINT(stuff) \
//    stuff

// stubs
CUfunc_cache CU_FUNC_CACHE_PREFER_NONE;
CUfunc_cache CU_FUNC_CACHE_PREFER_SHARED;
CUfunc_cache CU_FUNC_CACHE_PREFER_L1;
CUfunc_cache CU_FUNC_CACHE_PREFER_EQUAL;

namespace cocl {
    class LaunchConfiguration {
    public:
        size_t grid[3];
        size_t block[3];
        unique_ptr<CLKernel> kernel;
        CLQueue *queue = 0;  // NOT owned by us

        vector<cl_mem> kernelArgsToBeReleased;
        std::string kernelName = "";;
        std::string kernelSource = "";
    };
    LaunchConfiguration launchConfiguration;

    unique_ptr<EasyCL> cl;
    cl_context *ctx;
    cl_command_queue *queue;

    bool initialized = false;
}

using namespace cocl;

void hostside_opencl_funcs_init() {
    // COCL_PRINT(cout << "initialize cl context" << endl);
    cl.reset(EasyCL::createForFirstGpuOtherwiseCpu());
    ctx = cl->context;
    queue = cl->queue;
}

void hostside_opencl_funcs_assure_initialized(void) {
    // yes this is not threadsafe.  or anything safe really...
    if(!initialized) {
        hostside_opencl_funcs_init();
        initialized = true;
    }
}

extern "C" {
    void configureKernel(
        const char *kernelName, const char *clSourcecodeString);

    size_t cuInit(unsigned int flags);
}

size_t cuInit(unsigned int flags) {
    // COCL_PRINT(cout << "redirected cuInit()" << endl);
    hostside_opencl_funcs_assure_initialized();
    return 0;
}

// size_t cudaConfigureCall(
//         unsigned long long grid_xy, unsigned int grid_z,
//         unsigned long long block_xy, unsigned int block_z, size_t sharedMem, void *queue_as_voidstar) {
int cudaConfigureCall(
        dim3 grid,
        dim3 block, long long sharedMem, char *queue_as_voidstar) {
    CLQueue *queue = (CLQueue *)queue_as_voidstar;
    // COCL_PRINT(cout << "cudaConfigureCall queue=" << queue << endl);
    if(sharedMem != 0) {
        COCL_PRINT(cout << "cudaConfigureCall: Not implemented: non-zero shared memory" << endl);
        throw runtime_error("cudaConfigureCall: Not implemented: non-zero shared memory");
    }
    if(queue == 0) {
        queue = cl->default_queue;
        // COCL_PRINT(cout << "using default_queue " << queue << endl);
    }
    int grid_x = grid.x;
    int grid_y = grid.y;
    int grid_z = grid.z;
    int block_x = block.x;
    int block_y = block.y;
    int block_z = block.z;
    COCL_PRINT(cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl);
    COCL_PRINT(cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl);
    launchConfiguration.queue = queue;
    launchConfiguration.grid[0] = grid_x;
    launchConfiguration.grid[1] = grid_y;
    launchConfiguration.grid[2] = grid_z;
    launchConfiguration.block[0] = block_x;
    launchConfiguration.block[1] = block_y;
    launchConfiguration.block[2] = block_z;
    return 0;
}

void configureKernel(
        const char *kernelName, const char *clSourcecodeString) {
    cout << "configureKernel (name=" << kernelName << endl;
    // cout << "clSources.size() " << getNumClSources() << endl;
    // for(auto it=clSources.begin(); it != clSources.end(); it++) {
    for(int i = 0; i < getNumClSources(); i++) {
        // cout << "clsource: [" << getClSource(i) << "]" << endl;
    }
    hostside_opencl_funcs_assure_initialized();
    launchConfiguration.kernelName = kernelName;
    launchConfiguration.kernelSource = clSourcecodeString;
    try {
        launchConfiguration.kernel.reset(cl->buildKernelFromString(clSourcecodeString, kernelName, "", "__internal__"));
    } catch(runtime_error &e) {
        cout << "kernel failed to build" << endl;
        cout << "kernel name: [" << launchConfiguration.kernelName << "]" << endl;
        cout << "saving kernel soucecode to /tmp/failed-kernel.cl" << endl;
        ofstream f;
        f.open("/tmp/failed-kernel.cl", ios_base::out);
        f << launchConfiguration.kernelName << endl;
        f << launchConfiguration.kernelSource << endl;
        f << e.what() << endl;
        f.close();
        throw e;
    }
}

void setKernelArgStruct(char *pCpuStruct, int structAllocateSize) {
    // we're going to:
    // allocate a cl_mem for the struct
    // copy the cpu struct to the cl_mem
    // pass the cl_mem into the kernel

    // we should also:
    // deallocate the cl_mem after calling the kernel
    // (we assume hte struct is passed by-value, so we dont have to actually copy it back afterwards)
    COCL_PRINT(cout << "setKernelArgStruct structsize=" << structAllocateSize << endl);
    // int idx = 
    cl_int err;
    cl_mem gpu_struct = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, structAllocateSize,
                                           NULL, &err);
    cl->checkError(err);
    err = clEnqueueWriteBuffer(launchConfiguration.queue->queue, gpu_struct, CL_TRUE, 0,
                                      structAllocateSize, pCpuStruct, 0, NULL, NULL);
    cl->checkError(err);
    launchConfiguration.kernelArgsToBeReleased.push_back(gpu_struct);
    launchConfiguration.kernel->inout(&launchConfiguration.kernelArgsToBeReleased[launchConfiguration.kernelArgsToBeReleased.size() - 1]);
}

void setKernelArgCharStar(char *memory_as_charstar) {
    COCL_PRINT(cout << "setKernelArgCharStar " << (void *)memory_as_charstar << endl);
    Memory *memory = findMemory(memory_as_charstar);
    cl_int err;
    if(memory == 0) {
        // lets just mak ea new buffer...
        cl_mem gpu_struct = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, 4,
                                               NULL, &err);
        cl->checkError(err);
        // err = clEnqueueWriteBuffer(launchConfiguration.queue->queue, gpu_struct, CL_TRUE, 0,
        //                                   structAllocateSize, pCpuStruct, 0, NULL, NULL);
        // cl->checkError(err);
        launchConfiguration.kernelArgsToBeReleased.push_back(gpu_struct);
        launchConfiguration.kernel->inout(&launchConfiguration.kernelArgsToBeReleased[launchConfiguration.kernelArgsToBeReleased.size() - 1]);
        launchConfiguration.kernel->in((int64_t)-1); // `-1` means `null pointer`
        return;
    }
    size_t offset = memory->getOffset(memory_as_charstar);
    // size_t offset = (char *)memory_as_charstar - (char *)memory;
    // Memory *pMemory = (Memory *)memory_as_charstar;
    cl_mem clmem = memory->clmem;
    // cout << "memory " << (void *)memory << " clmem " << (void *)clmem << " offset=" << offset << endl;
    launchConfiguration.kernel->inout(&clmem);
    launchConfiguration.kernel->in((int64_t)offset); // kernel expects a `long` which is 64-bit signed int
}

void setKernelArgInt64(int64_t value) {
    COCL_PRINT(cout << "setKernelArgInt64 " << value << endl);
    launchConfiguration.kernel->in(value);
}

void setKernelArgInt32(int value) {
    COCL_PRINT(cout << "setKernelArgInt32 " << value << endl);
    launchConfiguration.kernel->in(value);
}

void setKernelArgFloat(float value) {
    COCL_PRINT(cout << "setKernelArgFloat " << value << endl);
    launchConfiguration.kernel->in(value);
}

void kernelGo() {
    // COCL_PRINT(cout << "kernelGo " << endl);
    size_t global[3];
    for(int i = 0; i < 3; i++) {
        global[i] = launchConfiguration.grid[i] * launchConfiguration.block[i];
        // COCL_PRINT(cout << "global[" << i << "]=" << global[i] << endl);
    }
    for(int i = 0; i < 3; i++) {
        // COCL_PRINT(cout << "block[" << i << "]=" << launchConfiguration.block[i] << endl);
    }
    // cout << "launching kernel, using OpenCL..." << endl;
    try {
        launchConfiguration.kernel->run(launchConfiguration.queue, 3, global, launchConfiguration.block);
    } catch(runtime_error &e) {
        cout << "kernel failed to run" << endl;
        cout << "kernel name: [" << launchConfiguration.kernelName << "]" << endl;
        cout << "saving kernel soucecode to /tmp/failed-kernel.cl" << endl;
        ofstream f;
        f.open("/tmp/failed-kernel.cl", ios_base::out);
        f << launchConfiguration.kernelName << endl;
        f << launchConfiguration.kernelSource << endl;
        f.close();
        throw e;
    }
    COCL_PRINT(cout << ".. kernel queued" << endl);
    // cl->finish();
    // cout << ".. kernel finished" << endl;
    for(auto it=launchConfiguration.kernelArgsToBeReleased.begin(); it != launchConfiguration.kernelArgsToBeReleased.end(); it++) {
        // COCL_PRINT(cout << "release arg" << endl);
        cl_mem memObject = *it;
        cl_int err = clReleaseMemObject(memObject);
        cl->checkError(err);
    }
    launchConfiguration.kernelArgsToBeReleased.clear();
}

float4 make_float4(float x, float y, float z, float w) {
    return float4(x,y,z,w);
}

float2 make_float2(float x, float y) {
    return float2(x,y);
}

double2 make_double2(double x, double y) {
    return double2(x,y);
}

MyClass hostsidefuncs(__FILE__);
