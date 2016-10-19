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

#include "hostside_opencl_funcs.h"
// #include "cocl_kernellaunch.h"
#include "cocl.h"
#include "cocl_memory.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "EasyCL.h"

#include "CL/cl.h"
#include "cocl.h"

using namespace std;
using namespace easycl;

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
}

dim3 nulldim3;

namespace cocl {
    class LaunchConfiguration {
    public:
        size_t grid[3];
        size_t block[3];
        unique_ptr<CLKernel> kernel;
        CLQueue *queue = 0;  // NOT owned by us

        vector<cl_mem> kernelArgsToBeReleased;
    };
    LaunchConfiguration launchConfiguration;

    unique_ptr<EasyCL> cl;
    cl_context *ctx;
    cl_command_queue *queue;

    bool initialized = false;
}

using namespace cocl;

void hostside_opencl_funcs_init() {
    COCL_PRINT(cout << "initialize cl context" << endl);
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
    COCL_PRINT(cout << "redirected cuInit()" << endl);
    hostside_opencl_funcs_assure_initialized();
    return 0;
}

// #include "/usr/local/include/cuda.h"

// size_t cudaConfigureCall(
//         unsigned long long grid_xy, unsigned int grid_z,
//         unsigned long long block_xy, unsigned int block_z, size_t sharedMem, void *queue_as_voidstar) {
int cudaConfigureCall(
        dim3 grid,
        dim3 block, long long sharedMem, char *queue_as_voidstar) {
    CLQueue *queue = (CLQueue *)queue_as_voidstar;
    COCL_PRINT(cout << "cudaConfigureCall queue=" << queue << endl);
    if(sharedMem != 0) {
        COCL_PRINT(cout << "cudaConfigureCall: Not implemented: non-zero shared memory" << endl);
        throw runtime_error("cudaConfigureCall: Not implemented: non-zero shared memory");
    }
    if(queue == 0) {
        queue = cl->default_queue;
        COCL_PRINT(cout << "using default_queue " << queue << endl);
    }
    // COCL_PRINT(cout << "grid_xy " << grid_xy << " grid_z " << grid_z << endl);
    // COCL_PRINT(cout << "block_xy " << block_xy << " grid_z " << block_z << endl);
    // int grid_x = grid_xy & ((1ul << 31) - 1);
    // int grid_y = grid_xy >> 32;
    // int block_x = block_xy & ((1ul << 31) - 1);
    // int block_y = block_xy >> 32;
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
    // cout << "configureKernel (name=" << kernelName << ", source=" << clSourcecodeString << ")" << endl;
    hostside_opencl_funcs_assure_initialized();
    launchConfiguration.kernel.reset(cl->buildKernelFromString(clSourcecodeString, kernelName, "", "__internal__"));
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

void setKernelArgFloatStar(float *memory_as_floatstar) {
    COCL_PRINT(cout << "setKernelArgFloatStar " << memory_as_floatstar << endl);
    Memory *memory = (Memory *)memory_as_floatstar;
    cl_mem clmem = memory->clmem;
    launchConfiguration.kernel->inout(&clmem);
}

void setKernelArgIntStar(int *memory_as_intstar) {
    COCL_PRINT(cout << "setKernelArgFloatStar " << memory_as_intstar << endl);
    Memory *memory = (Memory *)memory_as_intstar;
    cl_mem clmem = memory->clmem;
    launchConfiguration.kernel->inout(&clmem);
}

void setKernelArgCharStar(char *memory_as_charstar) {
    COCL_PRINT(cout << "setKernelArgCharStar " << memory_as_charstar << endl);
    Memory *pMemory = (Memory *)memory_as_charstar;
    cl_mem clmem = pMemory->clmem;
    launchConfiguration.kernel->inout(&clmem);
}

// void setKernelArgCharStar(char *clmem_as_charstar) {
//     cout << "setKernelArgCharStar" << endl;
//     cl_mem *p_mem = (cl_mem *)clmem_as_charstar;
//     // cout << "setKernelArgFloatStar" << endl;
//     kernel->inout(p_mem);
// }

// void setKernelArgStruct() {
//     cout << "setKernelArgStruct" << endl;
//     // cl_mem *p_mem = (cl_mem *)clmem_as_charstar;
//     // cout << "setKernelArgFloatStar" << endl;
//     // kernel->inout(p_mem);
// }

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
    COCL_PRINT(cout << "kernelGo " << endl);
    size_t global[3];
    for(int i = 0; i < 3; i++) {
        global[i] = launchConfiguration.grid[i] * launchConfiguration.block[i];
        COCL_PRINT(cout << "global[" << i << "]=" << global[i] << endl);
    }
    for(int i = 0; i < 3; i++) {
        COCL_PRINT(cout << "block[" << i << "]=" << launchConfiguration.block[i] << endl);
    }
    // cout << "launching kernel, using OpenCL..." << endl;
    launchConfiguration.kernel->run(launchConfiguration.queue, 3, global, launchConfiguration.block);
    COCL_PRINT(cout << ".. kernel queued" << endl);
    // cl->finish();
    // cout << ".. kernel finished" << endl;
    for(auto it=launchConfiguration.kernelArgsToBeReleased.begin(); it != launchConfiguration.kernelArgsToBeReleased.end(); it++) {
        COCL_PRINT(cout << "release arg" << endl);
        cl_mem memObject = *it;
        cl_int err = clReleaseMemObject(memObject);
        cl->checkError(err);
    }
    launchConfiguration.kernelArgsToBeReleased.clear();
}
