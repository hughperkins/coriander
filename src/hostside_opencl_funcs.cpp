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

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>
#include <cstdlib>
#include "pthread.h"

#include "EasyCL/EasyCL.h"

// #include "CL/cl.h"
#include "cocl/cocl.h"
#include "cocl/cocl_memory.h"

#include "ir-to-opencl.h"
#include "ir-to-opencl-common.h"

using namespace std;
using namespace easycl;
using namespace cocl;

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
}

// #define COCL_PRINT(x)

// #undef COCL_PRINT
// #define COCL_PRINT(stuff) \
//    stuff

// stubs
CUfunc_cache CU_FUNC_CACHE_PREFER_NONE;
CUfunc_cache CU_FUNC_CACHE_PREFER_SHARED;
CUfunc_cache CU_FUNC_CACHE_PREFER_L1;
CUfunc_cache CU_FUNC_CACHE_PREFER_EQUAL;

namespace cocl {
    #ifdef __APPLE__
    pthread_mutex_t launchMutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER;
    #else
    pthread_mutex_t launchMutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
    #endif

    class Arg {
    public:
        virtual ~Arg() {}
        virtual void inject(CLKernel *kernel) = 0;
    };
    class Int32Arg : public Arg {
    public:
        Int32Arg(int v) : v(v) {}
        void inject(CLKernel *kernel) {
            kernel->in(v);
        }
        int v;
    };
    class UInt32Arg : public Arg {
    public:
        UInt32Arg(uint32_t v) : v(v) {}
        void inject(CLKernel *kernel) {
            kernel->in_uint32(v);
        }
        uint32_t v;
    };
    class Int64Arg : public Arg {
    public:
        Int64Arg(int64_t v) : v(v) {}
        void inject(CLKernel *kernel) {
            kernel->in(v);
        }
        int64_t v;
    };
    class FloatArg : public Arg {
    public:
        FloatArg(float v) : v(v) {}
        void inject(CLKernel *kernel) {
            kernel->in(v);
        }
        float v;
    };
    class NullPtrArg : public Arg {
    public:
        NullPtrArg() {}
        void inject(CLKernel *kernel) {
            kernel->in_nullptr();
        }
    };
    class ClmemArg : public Arg {
    public:
        ClmemArg(cl_mem v) : v(v) {}
        void inject(CLKernel *kernel) {
            kernel->inout(&v);
        }
        cl_mem v;
    };
    class StructArg : public Arg {
    public:
        StructArg(char *pCpuStruct, int structAllocateSize) :
            pCpuStruct(pCpuStruct), structAllocateSize(structAllocateSize)
        {}
        char *pCpuStruct;
        int structAllocateSize;
    };

    class LaunchConfiguration {
    public:
        size_t grid[3];
        size_t block[3];
        // CLKernel *kernel;
        CLQueue *queue = 0;  // NOT owned by us
        CoclStream *coclStream = 0; // NOT owned

        std::vector<std::unique_ptr<Arg> > args;

        // map<cl_mem *, int> clmemIndexByClmem;
        map<cl_mem, int> clmemIndexByClmem;
        vector<cl_mem> clmems;
        vector<int> clmemIndexByClmemArgIndex;

        vector<cl_mem> kernelArgsToBeReleased;
        std::string kernelName = "";
        std::string devicellsourcecode = "";
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

void hostside_opencl_funcs_assure_initialized(void) {
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
    COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);
    // COCL_PRINT(cout << "... locked launch mutex " << (void *)getThreadVars() << endl);
    CoclStream *coclStream = (CoclStream *)queue_as_voidstar;
    ThreadVars *v = getThreadVars();
    if(coclStream == 0) {
        coclStream = v->currentContext->default_stream.get();
        // coclStream = defaultCoclStream;
        // throw runtime_error("not implemented: default stream");
        COCL_PRINT(cout << "cudaConfigureCall using default_queue" << endl);
    }
    CLQueue *clqueue = coclStream->clqueue;
    COCL_PRINT(cout << "cudaConfigureCall queue=" << (void *)clqueue << endl);
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

    string  convertLlToCl(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, string devicellsourcecode, string kernelName) {
        // cout << "llsourcecode [" << devicellsourcecode << "]" << endl;  
        string clcode = convertLlStringToCl(uniqueClmemCount, clmemIndexByClmemArgIndex, devicellsourcecode, kernelName);
        // string clcode = convertLlStringToCl(devicellsourcecode, "");
        // cout << "clcode " << clcode << endl;
        return clcode;
    }

    CLKernel *getKernelForNameCl(string kernelName, string clSourcecode) {
        // KernelByNameMutex mutex;
        ThreadVars *v = getThreadVars();
        EasyCL *cl = v->getContext()->getCl();
        ofstream f;
        v->getContext()->numKernelCalls++;
        if(v->getContext()->kernelByName.find(kernelName) != v->getContext()->kernelByName.end()) {
            return v->getContext()->kernelByName[kernelName];
        }
        // compile the kernel.  we are still locking the mutex, but I cnat think of a better
        // way right now...
        cout << "building kernel " << kernelName << endl;
        // cout << "source [" << sourcecode << "]" << endl;

        string filename = "/tmp/out.cl";
        if(getenv("COCL_LOAD_KERNEL") != 0) {
            cout << "loading kernel from " << filename << endl;
            ifstream f;
            f.open(filename, ios_base::in);
            // f << launchConfiguration.kernelName << endl;
            // f >> sourcecode;
            clSourcecode = "";
            string line = "";
            while(getline(f, line)) {
                clSourcecode += line + "\n";
            }
            // cout << sourcecode << endl;
            f.close();
        } else if(getenv("COCL_DUMP_KERNEL") != 0) {
            cout << "saving kernel to " << filename << endl;
            ofstream f;
            f.open(filename, ios_base::out);
            // f << launchConfiguration.kernelName << endl;
            f << clSourcecode << endl;
            f.close();
        }
        if(getenv("COCL_DUMP_CL") != 0 && string(getenv("COCL_DUMP_CL")) == "1") {
            cout << "cocl dump cl set" << endl;
            cout << "cl: [" << clSourcecode << "]" << endl;
        }

        CLKernel *kernel = 0;
        try {
            string shortKernelName = "" + kernelName;
            if(shortKernelName.size() > 32) {
                shortKernelName = shortKernelName.substr(0, 31);
            }
            kernel = cl->buildKernelFromString(clSourcecode, shortKernelName, "", "__internal__");
        } catch(runtime_error &e) {
            cout << "failed to compile opencl sourcecode" << endl;
            cout << "kernel name " << kernelName << endl;
            cout << "writing ll to /tmp/failed-kernel.ll" << endl;

            // f.open("/tmp/failed-kernel.ll", ios_base::out);
            // f << devicellsourcecode << endl;
            // f.close();

            cout << "writing cl to /tmp/failed-kernel.cl" << endl;
            f.open("/tmp/failed-kernel.cl", ios_base::out);
            f << clSourcecode << endl;
            f.close();

            throw e;
        }
        cout << " ... built" << endl;
        v->getContext()->kernelByName[kernelName ] = kernel;
        cl->storeKernel(kernelName, kernel, true);  // this will cause the kernel to be deleted with cl.  Not clean yet, but a start
        return kernel;
    }

    CLKernel *getKernelForNameLl(int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, string kernelName, string devicellsourcecode) {
        // KernelByNameMutex mutex;
        ThreadVars *v = getThreadVars();
        // EasyCL *cl = v->getContext()->getCl();
        ofstream f;
        if(v->getContext()->kernelByName.find(kernelName) != v->getContext()->kernelByName.end()) {
            v->getContext()->numKernelCalls++;
            return v->getContext()->kernelByName[kernelName];
        }
        // compile the kernel.  we are still locking the mutex, but I cnat think of a better
        // way right now...
        cout << "building kernel " << kernelName << endl;
        // cout << "source [" << sourcecode << "]" << endl;

        // convert to opencl first... based on the kernel name required
        string clSourcecode = "";
        try {
           clSourcecode = convertLlToCl(uniqueClmemCount, clmemIndexByClmemArgIndex, devicellsourcecode, kernelName);
        } catch(runtime_error &e) {
            cout << "failed to generate opencl sourcecode" << endl;
            cout << "kernel name " << kernelName << endl;
            cout << "writing ll to /tmp/failed-kernel.ll" << endl;
            f.open("/tmp/failed-kernel.ll", ios_base::out);
            f << devicellsourcecode << endl;
            f.close();
            throw e;
        }
        return getKernelForNameCl(kernelName, clSourcecode);
    }
}

void configureKernel(const char *kernelName, const char *devicellsourcecode) {
    // we just ignore the devicellsourcecode mostly, but might be useful for debugging
    // COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);
    // COCL_PRINT(cout << "... locked launch mutex " << (void *)getThreadVars() << endl);
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
    launchConfiguration.devicellsourcecode = devicellsourcecode;
    // launchConfiguration.kernelSource = devicellsourcecode;
    // try {
        // launchConfiguration.kernel = getKernelForNameLl(kernelName, devicellsourcecode);
    // } catch(runtime_error &e) {
    //     cout << "kernel failed to build" << endl;
    //     cout << "kernel name: [" << launchConfiguration.kernelName << "]" << endl;
    //     cout << "saving kernel soucecode to /tmp/failed-kernel.cl" << endl;
    //     cout << "saving kernel ll sourcecode to /tmp/failed-kernel.ll" << endl;
    //     cout << "saving meta info to /tmp/failed-kernel-meta.txt" << endl;
    //     ofstream f;
    //     f.open("/tmp/failed-kernel.cl", ios_base::out);
    //     // f << launchConfiguration.kernelName << endl;
    //     f << launchConfiguration.kernelSource << endl;
    //     // f << e.what() << endl;
    //     f.close();
    //     f.open("/tmp/failed-kernel.ll", ios_base::out);
    //     // f << launchConfiguration.kernelName << endl;
    //     f << devicellsourcecode << endl;
    //     // f << e.what() << endl;
    //     f.close();
    //     f.open("/tmp/failed-kernel-meta.txt", ios_base::out);
    //     // f << launchConfiguration.kernelName << endl;
    //     f << "kernel name: " << launchConfiguration.kernelName << endl;
    //     f << e.what() << endl;
    //     f.close();
    // // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    // // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    //     pthread_mutex_unlock(&launchMutex);
    //     pthread_mutex_unlock(&launchMutex);
    //     throw e;
    // }
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_unlock(&launchMutex);
}

void indexClmemArg(cl_mem clmem) {
    int clmemIndex = 0;
    if(launchConfiguration.clmemIndexByClmem.find(clmem) == launchConfiguration.clmemIndexByClmem.end()) {
        clmemIndex = launchConfiguration.clmems.size();
        launchConfiguration.clmems.push_back(clmem);
        launchConfiguration.clmemIndexByClmem[clmem] = clmemIndex;
    } else {
        clmemIndex = launchConfiguration.clmemIndexByClmem.find(clmem)->second;
    }
    launchConfiguration.clmemIndexByClmemArgIndex.push_back(clmemIndex);
}

void setKernelArgStruct(char *pCpuStruct, int structAllocateSize) {
    COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);
    // COCL_PRINT(cout << "...lcoked launch mutex " << (void *)getThreadVars() << endl);
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
    EasyCL::checkError(err);
    err = clEnqueueWriteBuffer(launchConfiguration.queue->queue, gpu_struct, CL_TRUE, 0,
                                      structAllocateSize, pCpuStruct, 0, NULL, NULL);
    EasyCL::checkError(err);
    launchConfiguration.kernelArgsToBeReleased.push_back(gpu_struct);

    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new ClmemArg(launchConfiguration.kernelArgsToBeReleased[launchConfiguration.kernelArgsToBeReleased.size() - 1])));
    indexClmemArg(gpu_struct);

    // launchConfiguration.kernel->inout(&launchConfiguration.kernelArgsToBeReleased[launchConfiguration.kernelArgsToBeReleased.size() - 1]);
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgCharStar(char *memory_as_charstar, int32_t elementSize) {
    COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);

    // COCL_PRINT(cout << "...locked launch mutex " << (void *)getThreadVars() << endl);
    COCL_PRINT(cout << "setKernelArgCharStar " << (void *)memory_as_charstar << endl);
    Memory *memory = findMemory(memory_as_charstar);
    if(memory == 0) {
        launchConfiguration.args.push_back(std::unique_ptr<Arg>(new NullPtrArg()));
        // launchConfiguration.kernel->in_nullptr();
        #ifdef OFFSET_32BIT
        launchConfiguration.args.push_back(std::unique_ptr<Arg>(new UInt32Arg(0)));
        // launchConfiguration.kernel->in_uint32(0);
        #else
        launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int64Arg(0)));
        // launchConfiguration.kernel->in_int64(0);
        #endif
    } else {
        size_t offset = memory->getOffset(memory_as_charstar);
        cl_mem clmem = memory->clmem;
        launchConfiguration.args.push_back(std::unique_ptr<Arg>(new ClmemArg(clmem)));
        indexClmemArg(clmem);

        // launchConfiguration.kernel->inout(&clmem);
        size_t offsetElements = offset / elementSize;
        // COCL_PRINT(cout << "offset elements " << offsetElements << endl);
        #ifdef OFFSET_32BIT
        launchConfiguration.args.push_back(std::unique_ptr<Arg>(new UInt32Arg((uint32_t)offsetElements)));
        // launchConfiguration.kernel->in_uint32((uint32_t)offsetElements); // kernel expects a `long` which is 64-bit signed int
        #else
        launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int64Arg((int64_t)offsetElements)));
        // launchConfiguration.kernel->in_int64((int64_t)offsetElements); // kernel expects a `long` which is 64-bit signed int
        #endif
    }
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgInt64(int64_t value) {
    COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);
    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int64Arg(value)));

    // COCL_PRINT(cout << "...loocked launch mutex " << (void *)getThreadVars() << endl);
    COCL_PRINT(cout << "setKernelArgInt64 " << value << endl);
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgInt32(int value) {
    COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);
    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int32Arg(value)));
    // COCL_PRINT(cout << "...locked launch mutex " << (void *)getThreadVars() << endl);
    COCL_PRINT(cout << "setKernelArgInt32 " << value << endl);
    // launchConfiguration.kernel->in(value);
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgFloat(float value) {
    COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);
    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new FloatArg(value)));
    // COCL_PRINT(cout << "... locked launch mutex " << (void *)getThreadVars() << endl);
    COCL_PRINT(cout << "setKernelArgFloat " << value << endl);
    // launchConfiguration.kernel->in(value);
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_unlock(&launchMutex);
}

void kernelGo() {
    COCL_PRINT(cout << "locking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_lock(&launchMutex);
    // COCL_PRINT(cout << "...locked launch mutex " << (void *)getThreadVars() << endl);
    COCL_PRINT(cout << "kernelGo queue=" << (void *)launchConfiguration.queue << endl);

    // launchConfiguration.kernelName += "_";
    for(int i = 0; i < launchConfiguration.clmemIndexByClmemArgIndex.size(); i++) {
        int clmemIndex = launchConfiguration.clmemIndexByClmemArgIndex[i];
        launchConfiguration.kernelName += "_" + EasyCL::toString(clmemIndex);
    }
    cout << "kernel name " << launchConfiguration.kernelName << endl;
    CLKernel *kernel = getKernelForNameLl(launchConfiguration.clmems.size(), launchConfiguration.clmemIndexByClmemArgIndex, launchConfiguration.kernelName, launchConfiguration.devicellsourcecode);
    for(int i = 0; i < launchConfiguration.args.size(); i++) {
        // cout << "i=" << i << endl;
        launchConfiguration.args[i]->inject(kernel);
    }

    size_t global[3];
     COCL_PRINT(cout << "<<< global=dim3(");
    for(int i = 0; i < 3; i++) {
        global[i] = launchConfiguration.grid[i] * launchConfiguration.block[i];
        COCL_PRINT(cout << global[i] << ",");
    }
    COCL_PRINT(cout << "), workgroupsize=dim3(");
    for(int i = 0; i < 3; i++) {
        COCL_PRINT(cout << launchConfiguration.block[i] << ",");
    }
    COCL_PRINT(cout << ")>>>" << endl);
    // cout << "launching kernel, using OpenCL..." << endl;
    int workgroupSize = launchConfiguration.block[0] * launchConfiguration.block[1] * launchConfiguration.block[2];
    COCL_PRINT(cout << "workgroupSize=" << workgroupSize << endl);
    kernel->localInts(workgroupSize);

    try {
        kernel->run(launchConfiguration.queue, 3, global, launchConfiguration.block);
    } catch(runtime_error &e) {
        cout << "kernel failed to run" << endl;
        cout << "kernel name: [" << launchConfiguration.kernelName << "]" << endl;
        // cout << "saving kernel soucecode to /tmp/failed-kernel.cl" << endl;
        // ofstream f;
        // f.open("/tmp/failed-kernel.cl", ios_base::out);
        // f << launchConfiguration.kernelName << endl;
        // f << launchConfiguration.kernelSource << endl;
        // f.close();
        pthread_mutex_unlock(&launchMutex);
        pthread_mutex_unlock(&launchMutex);
        throw e;
    }
    COCL_PRINT(cout << ".. kernel queued" << endl);
    cl_int err;
    err = clFinish(launchConfiguration.queue->queue);
    EasyCL::checkError(err);

    // cout << "trying cl->finihs()" << endl;
    //cl->finish();
    // cout << "cl->finihs() done" << endl;
    // cout << ".. kernel finished" << endl;
    for(auto it=launchConfiguration.kernelArgsToBeReleased.begin(); it != launchConfiguration.kernelArgsToBeReleased.end(); it++) {
        // COCL_PRINT(cout << "release arg" << endl);
        cl_mem memObject = *it;
        err = clReleaseMemObject(memObject);
        EasyCL::checkError(err);
    }
    launchConfiguration.kernelArgsToBeReleased.clear();
    launchConfiguration.args.clear();

    launchConfiguration.clmemIndexByClmem.clear();
    launchConfiguration.clmems.clear();
    launchConfiguration.clmemIndexByClmemArgIndex.clear();

    err = clFinish(launchConfiguration.queue->queue);
    EasyCL::checkError(err);
    // cout << "released args done" << endl;
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
    pthread_mutex_unlock(&launchMutex);
    // COCL_PRINT(cout << " --- unlocking launch mutex " << (void *)getThreadVars() << endl);
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
