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
#include "cocl/cocl_streams.h"
#include "cocl/local_config.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>
#include "pthread.h"

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
    pthread_mutex_t launchMutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
    class LaunchConfiguration {
    public:
        size_t grid[3];
        size_t block[3];
        CLKernel *kernel;
        CLQueue *queue = 0;  // NOT owned by us
        CoclStream *coclStream = 0; // NOT owned

        vector<cl_mem> kernelArgsToBeReleased;
        std::string kernelName = "";;
        std::string kernelSource = "";
    };
    LaunchConfiguration launchConfiguration;

    // unique_ptr<EasyCL> cl;
    // pthread_mutex_t clByDeviceMutex = PTHREAD_MUTEX_INITIALIZER;
    // map<int, EasyCL *>clByDevice;
    // class ClByDeviceMutex {
    // public:
    //     ClByDeviceMutex() {
    //         pthread_mutex_lock(&clByDeviceMutex);
    //     }
    //     ~ClByDeviceMutex() {
    //         pthread_mutex_unlock(&clByDeviceMutex);
    //     }
    // };
    // cl_context *ctx;
    // cl_command_queue *queue;
    // CoclStream *defaultCoclStream = 0;

    // CoclStream *getDefaultCoclStream() {
    //     return defaultCoclStream;
    // }
    // bool initialized = false;
}

using namespace cocl;

void hostside_opencl_funcs_init() {
    // COCL_PRINT(cout << "initialize cl context" << endl);
    // cl.reset(EasyCL::createForFirstGpuOtherwiseCpu());
    // ctx = cl->context;
    // queue = cl->queue;
    // defaultCoclStream = new CoclStream(cl.get());
}

void hostside_opencl_funcs_assure_initialized(void) {
    // yes this is not threadsafe.  or anything safe really...
    // if(!initialized) {
    //     hostside_opencl_funcs_init();
    //     initialized = true;
    // }
}

extern "C" {
    void configureKernel(
        const char *kernelName, const char *clSourcecodeString);

    size_t cuInit(unsigned int flags);
}

size_t cuInit(unsigned int flags) {
    // COCL_PRINT(cout << "redirected cuInit()" << endl);
    // hostside_opencl_funcs_assure_initialized();
    return 0;
}

// size_t cudaConfigureCall(
//         unsigned long long grid_xy, unsigned int grid_z,
//         unsigned long long block_xy, unsigned int block_z, size_t sharedMem, void *queue_as_voidstar) {
int cudaConfigureCall(
        dim3 grid,
        dim3 block, long long sharedMem, char *queue_as_voidstar) {
    pthread_mutex_lock(&launchMutex);
    CoclStream *coclStream = (CoclStream *)queue_as_voidstar;
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    if(coclStream == 0) {
        coclStream = v->currentContext->default_stream.get();
        // coclStream = defaultCoclStream;
        // throw runtime_error("not implemented: default stream");
        // COCL_PRINT(cout << "using default_queue " << queue << endl);
    }
    CLQueue *clqueue = coclStream->clqueue;
    // COCL_PRINT(cout << "cudaConfigureCall queue=" << queue << endl);
    if(sharedMem != 0) {
        COCL_PRINT(cout << "cudaConfigureCall: Not implemented: non-zero shared memory" << endl);
        throw runtime_error("cudaConfigureCall: Not implemented: non-zero shared memory");
    }
    int grid_x = grid.x;
    int grid_y = grid.y;
    int grid_z = grid.z;
    int block_x = block.x;
    int block_y = block.y;
    int block_z = block.z;
    COCL_PRINT(cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl);
    COCL_PRINT(cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl);
    launchConfiguration.queue = clqueue;
    launchConfiguration.coclStream = coclStream;
    launchConfiguration.grid[0] = grid_x;
    launchConfiguration.grid[1] = grid_y;
    launchConfiguration.grid[2] = grid_z;
    launchConfiguration.block[0] = block_x;
    launchConfiguration.block[1] = block_y;
    launchConfiguration.block[2] = block_z;
    return 0;
}

namespace cocl {
    // pthread_mutex_t kernelByNameMutex = PTHREAD_MUTEX_INITIALIZER;
    // map<string, CLKernel *>kernelByName;
    // volatile int numKernelCalls = 0;

    // class KernelByNameMutex {
    // public:
    //     KernelByNameMutex() {
    //         // COCL_PRINT(cout << "locking KernelByNameMutex mutex" << endl);
    //         pthread_mutex_lock(&kernelByNameMutex);
    //     }
    //     ~KernelByNameMutex() {
    //         // COCL_PRINT(cout << "releasing KernelByNameMutex mutex" << endl);
    //         pthread_mutex_unlock(&kernelByNameMutex);
    //     }
    // };

    int getNumCachedKernels() {
        // KernelByNameMutex mutex;
        return getThreadVars()->getContext()->kernelByName.size();
    }

    int getNumKernelCalls() {
        // KernelByNameMutex mutex;
        return getThreadVars()->getContext()->numKernelCalls;
    }

    CLKernel *getKernelForName(string name, string sourcecode) {
        // KernelByNameMutex mutex;
        ThreadVars *v = getThreadVars();
        EasyCL *cl = v->getContext()->getCl();
        v->getContext()->numKernelCalls++;
        if(v->getContext()->kernelByName.find(name) != v->getContext()->kernelByName.end()) {
            return v->getContext()->kernelByName[name];
        }
        // compile the kernel.  we are still locking the mutex, but I cnat think of a better
        // way right now...
        cout << "building kernel " << name << endl;
        CLKernel *kernel = cl->buildKernelFromString(sourcecode, name, "", "__internal__");
        cout << " ... built" << endl;
        v->getContext()->kernelByName[name ] = kernel;
        cl->storeKernel(name, kernel, true);  // this will cause the kernel to be deleted with cl.  Not clean yet, but a start
        return kernel;
    }
}

void configureKernel(const char *kernelName, const char *clSourcecodeString) {
    pthread_mutex_lock(&launchMutex);
    COCL_PRINT(cout << "configureKernel name=" << kernelName << endl);
    // send in scratch buffer, local ints
    // make it have one int per core

    // cout << "clSources.size() " << getNumClSources() << endl;
    // for(auto it=clSources.begin(); it != clSources.end(); it++) {
    for(int i = 0; i < getNumClSources(); i++) {
        // cout << "clsource: [" << getClSource(i) << "]" << endl;
    }
    // hostside_opencl_funcs_assure_initialized();
    launchConfiguration.kernelName = kernelName;
    launchConfiguration.kernelSource = clSourcecodeString;
    try {
        launchConfiguration.kernel = getKernelForName(kernelName, clSourcecodeString);
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
        pthread_mutex_unlock(&launchMutex);
        pthread_mutex_unlock(&launchMutex);
        throw e;
    }
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgStruct(char *pCpuStruct, int structAllocateSize) {
    pthread_mutex_lock(&launchMutex);
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    cl_context *ctx = cl->context;
    // we're going to:
    // allocate a cl_mem for the struct
    // copy the cpu struct to the cl_mem
    // pass the cl_mem into the kernel

    // we should also:
    // deallocate the cl_mem after calling the kernel
    // (we assume hte struct is passed by-value, so we dont have to actually copy it back afterwards)
    COCL_PRINT(cout << "setKernelArgStruct structsize=" << structAllocateSize << endl);
    // int idx = 
    if(structAllocateSize < 4) {
        structAllocateSize = 4;
    }
    cl_int err;
    cl_mem gpu_struct = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, structAllocateSize,
                                           NULL, &err);
    cl->checkError(err);
    err = clEnqueueWriteBuffer(launchConfiguration.queue->queue, gpu_struct, CL_TRUE, 0,
                                      structAllocateSize, pCpuStruct, 0, NULL, NULL);
    cl->checkError(err);
    launchConfiguration.kernelArgsToBeReleased.push_back(gpu_struct);
    launchConfiguration.kernel->inout(&launchConfiguration.kernelArgsToBeReleased[launchConfiguration.kernelArgsToBeReleased.size() - 1]);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgCharStar(char *memory_as_charstar) {
    pthread_mutex_lock(&launchMutex);
    COCL_PRINT(cout << "setKernelArgCharStar " << (void *)memory_as_charstar << endl);
    Memory *memory = findMemory(memory_as_charstar);
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    cl_context *ctx = cl->context;
    cl_int err;
    if(memory == 0) {
        // lets just mak ea new buffer...
        cl_mem gpu_struct = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, 4,
                                               NULL, &err);
        cl->checkError(err);
        launchConfiguration.kernelArgsToBeReleased.push_back(gpu_struct);
        launchConfiguration.kernel->inout(&launchConfiguration.kernelArgsToBeReleased[launchConfiguration.kernelArgsToBeReleased.size() - 1]);
        launchConfiguration.kernel->in((int64_t)-1); // `-1` means `null pointer`
    } else {
        size_t offset = memory->getOffset(memory_as_charstar);
        cl_mem clmem = memory->clmem;
        launchConfiguration.kernel->inout(&clmem);
        launchConfiguration.kernel->in((int64_t)offset); // kernel expects a `long` which is 64-bit signed int
    }
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgInt64(int64_t value) {
    pthread_mutex_lock(&launchMutex);
    COCL_PRINT(cout << "setKernelArgInt64 " << value << endl);
    launchConfiguration.kernel->in(value);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgInt32(int value) {
    pthread_mutex_lock(&launchMutex);
    COCL_PRINT(cout << "setKernelArgInt32 " << value << endl);
    launchConfiguration.kernel->in(value);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgFloat(float value) {
    pthread_mutex_lock(&launchMutex);
    COCL_PRINT(cout << "setKernelArgFloat " << value << endl);
    launchConfiguration.kernel->in(value);
    pthread_mutex_unlock(&launchMutex);
}

void kernelGo() {
    pthread_mutex_lock(&launchMutex);
    COCL_PRINT(cout << "kernelGo " << endl);
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    cl_context *ctx = cl->context;
    size_t global[3];
    for(int i = 0; i < 3; i++) {
        global[i] = launchConfiguration.grid[i] * launchConfiguration.block[i];
        // COCL_PRINT(cout << "global[" << i << "]=" << global[i] << endl);
    }
    for(int i = 0; i < 3; i++) {
        // COCL_PRINT(cout << "block[" << i << "]=" << launchConfiguration.block[i] << endl);
    }
    // cout << "launching kernel, using OpenCL..." << endl;
    int workgroupSize = launchConfiguration.block[0] * launchConfiguration.block[1] * launchConfiguration.block[2];
    COCL_PRINT(cout << "workgroupSize=" << workgroupSize << endl);
    launchConfiguration.kernel->localInts(workgroupSize);

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
        pthread_mutex_unlock(&launchMutex);
        pthread_mutex_unlock(&launchMutex);
        throw e;
    }
    COCL_PRINT(cout << ".. kernel queued" << endl);
    // cout << "trying cl->finihs()" << endl;
    cl->finish();
    // cout << "cl->finihs() done" << endl;
    // cout << ".. kernel finished" << endl;
    for(auto it=launchConfiguration.kernelArgsToBeReleased.begin(); it != launchConfiguration.kernelArgsToBeReleased.end(); it++) {
        // COCL_PRINT(cout << "release arg" << endl);
        cl_mem memObject = *it;
        cl_int err = clReleaseMemObject(memObject);
        cl->checkError(err);
    }
    launchConfiguration.kernelArgsToBeReleased.clear();
    // cout << "released args done" << endl;
    pthread_mutex_unlock(&launchMutex);
    pthread_mutex_unlock(&launchMutex);
    // cout << "unlocked both mutexes" << endl;
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
