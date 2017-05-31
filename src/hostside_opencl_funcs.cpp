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

#include "yaml-cpp/yaml.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>
#include <cstdlib>
#include "pthread.h"

#include "EasyCL/EasyCL.h"
#include "EasyCL/util/easycl_stringhelper.h"

// #include "CL/cl.h"
#include "cocl/cocl.h"
#include "cocl/cocl_memory.h"

#include "ir-to-opencl.h"
#include "ir-to-opencl-common.h"

using namespace std;
using namespace easycl;
using namespace cocl;

#ifdef COCL_PRINT
#undef COCL_PRINT
#endif

#ifdef COCL_SPAM_KERNELLAUNCH
#define COCL_PRINT(x) std::cout << "[LAUNCH] " << x << std::endl;
#else
#define COCL_PRINT(x) 
#endif

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

    LaunchConfiguration launchConfiguration;
}

using namespace cocl;


// static pthread_mutex_t dumpConfigCreationMutex = PTHREAD_MUTEX_INITIALIZER;
static bool checkedDumpEnabled = false;
static bool dumpEnabled = false;
static YAML::Node dumpConfig;

static void dump() {
    // we assume that dump config is enabled, and the dump config has been loaded ,successfully
    YAML::Node kernelConfig = dumpConfig[launchConfiguration.uniqueKernelName];
    if(kernelConfig) {
        cout << "Dumping for " << launchConfiguration.uniqueKernelName << " in dump config" << endl;
        // cout << dumpConfig[launchConfiguration.uniqueKernelName] << endl;
        // YAML::Node kernelConfig = 
        int argIdx = 0;
        for(auto it=kernelConfig.begin(); it != kernelConfig.end(); it++) {
            cout << "  Dumping buffer " << argIdx << endl;
            YAML::Node argConfig = *it;
            // cout << "kernelConfig: " << argConfig << endl;
            int offsetArg = argConfig["offsetarg"].as<int>();
            int count = argConfig["count"].as<int>();
            int clmemIndex = argConfig["clmem"].as<int>();
            if(clmemIndex >= launchConfiguration.clmems.size() || clmemIndex < 0) {
                cout << "clmemIndex out of bounds => skipping arg" << endl;
                continue;
            }
            if(offsetArg < 0 || offsetArg >= launchConfiguration.args.size()) {
                cout << "offsetArg out of bounds => skipping arg" << endl;
                continue;
            }
            // cout << "offsetarg: " << offsetArg << endl;
            uint64_t offsetBytes = llvm::cast<Int64Arg>(launchConfiguration.args[offsetArg].get())->v;
            // cout << "offsetBytes " << offsetBytes << endl;

            std::string argTypeName = argConfig["type"].as<std::string>();
            // cout << "argTypeName: [" << argTypeName << "]" << endl;
            if(argTypeName == "float") {
                float *hostBuffer = new float[count];
                cl_mem clmem = launchConfiguration.clmems[clmemIndex];
                // cout << "clmem " << clmem << endl;
                if(clmem == 0) {
                    cout << "    [Null]" << endl;
                } else {
                    cl_int err = clEnqueueReadBuffer(launchConfiguration.queue->queue, clmem, CL_TRUE, offsetBytes,
                                                     count * sizeof(float), hostBuffer, 0, NULL, NULL);
                    EasyCL::checkError(err);
                    ostringstream buf;
                    // buf << "    ";
                    for(int i = 0; i < count; i++) {
                        buf << hostBuffer[i] << " ";
                        if(buf.tellp() > 70) {
                            cout << "    " << buf.str() << endl;
                            buf.str("");
                        }
                    }
                    if(buf.tellp() > 0) {
                        cout << "    " << buf.str() << endl;
                    }
                }
            } else {
                cout << "type name [" + argTypeName + "] not recognized" << endl;
            }
            argIdx++;
        }
    }
}

static void maybeDump() {
    // we are going to assume we're already inside a mutex, and therefore
    // guaranteed to be running single-threaded
    if(!checkedDumpEnabled) {
        if(getenv("COCL_DUMP_CONFIG") != 0) {
            string dumpConfigFile = getenv("COCL_DUMP_CONFIG");
            cout << "Attemptign to load dump config from [" << dumpConfigFile << "]" << endl;
            dumpEnabled = true;
            dumpConfig = YAML::LoadFile(dumpConfigFile);
        }
        checkedDumpEnabled = true;
    }
    if(dumpEnabled) {
        dump();
    }
}

void hostside_opencl_funcs_assure_initialized(void) {
}

size_t cuInit(unsigned int flags) {
    // COCL_PRINT("redirected cuInit()");
    // hostside_opencl_funcs_assure_initialized();
    return 0;
}

// size_t cudaConfigureCall(
//         unsigned long long grid_xy, unsigned int grid_z,
//         unsigned long long block_xy, unsigned int block_z, size_t sharedMem, void *queue_as_voidstar) {
int cudaConfigureCall(
        dim3 grid,
        dim3 block, long long sharedMem, char *queue_as_voidstar) {
    // COCL_PRINT("locking launch mutex " << (void *)getThreadVars());
    pthread_mutex_lock(&launchMutex);
    // COCL_PRINT("... locked launch mutex " << (void *)getThreadVars());
    CoclStream *coclStream = (CoclStream *)queue_as_voidstar;
    ThreadVars *v = getThreadVars();
    if(coclStream == 0) {
        coclStream = v->currentContext->default_stream.get();
        // coclStream = defaultCoclStream;
        // throw runtime_error("not implemented: default stream");
        // COCL_PRINT("cudaConfigureCall using default_queue");
    }
    CLQueue *clqueue = coclStream->clqueue;
    // COCL_PRINT("cudaConfigureCall queue=" << (void *)clqueue);
    if(sharedMem != 0) {
        COCL_PRINT("cudaConfigureCall: Not implemented: non-zero shared memory");
        throw runtime_error("cudaConfigureCall: Not implemented: non-zero shared memory");
    }
    int grid_x = grid.x;
    int grid_y = grid.y;
    int grid_z = grid.z;
    int block_x = block.x;
    int block_y = block.y;
    int block_z = block.z;
    // COCL_PRINT("grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")");
    // COCL_PRINT("block(" << block_x << ", " << block_y << ", " << block_z << ")");
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

std::string Int32Arg::str() {
    ostringstream oss;
    oss << "Int32Arg=" << v;
    return oss.str();
}

std::string Int64Arg::str() {
    ostringstream oss;
    oss << "Int64Arg=" << v;
    return oss.str();
}

int32_t getNumCachedKernels() {
    return getThreadVars()->getContext()->kernelCache.size();
}

int32_t getNumKernelCalls() {
    return getThreadVars()->getContext()->numKernelCalls;
}

CLKernel *compileOpenCLKernel(string originalKernelName, string clSourcecode) {
    return compileOpenCLKernel(originalKernelName, originalKernelName, originalKernelName, clSourcecode);
}

CLKernel *compileOpenCLKernel(string originalKernelName, string uniqueKernelName, string shortKernelName, string clSourcecode) {
    // returns already-built kernel if available, based on the name
    // otherwise builds passed-in clsourcecode, caches that, and returns resulting kernel
    // (opencl generation has already happened prior to this function)

    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    ofstream f;
    v->getContext()->numKernelCalls++;
    if(v->getContext()->kernelCache.find(uniqueKernelName) != v->getContext()->kernelCache.end()) {
        return v->getContext()->kernelCache[uniqueKernelName];
    }
    // compile the kernel.  we are still locking the mutex, but I cnat think of a better
    // way right now...
    // cout << "compileOpenCLKernel building kernel unique name: " << uniqueKernelName << endl;
    // cout << "shortname: " << shortKernelName << endl;
    // cout << "source [" << clSourcecode << "]" << endl;

    // string filename = "/tmp/" + uniqueKernelName + ".cl";
    string filename = "/tmp/" + easycl::toString(v->getContext()->kernelCache.size()) + ".cl";
    if(getenv("COCL_LOAD_CL") != 0) {
        cout << "loading cl sourcecode from " << filename << endl;
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
    } else if(getenv("COCL_DUMP_CL") != 0) {
        cout << "saving cl sourcecode to " << filename << endl;
        ofstream f;
        f.open(filename, ios_base::out);
        f << "// original kernelName: [" << originalKernelName << "]" << endl;
        f << "// unique kernelName: [" << uniqueKernelName << "]" << endl;
        f << "// short kernelname: [" << shortKernelName << "]" << endl;
        f << endl;
        // f << launchConfiguration.kernelName << endl;
        f << clSourcecode << endl;
        f.close();
    }

    CLKernel *kernel = 0;
    try {
        // string shortKernelName = "" + kernelName;
        // if(shortKernelName.size() > 32) {
        //     shortKernelName = shortKernelName.substr(0, 31);
        // }
        // cout << "clSourcecode [" << clSourcecode << "]" << endl;
        kernel = cl->buildKernelFromString(clSourcecode, shortKernelName, "", "__internal__");
        // cout << "built kernel " << uniqueKernelName << endl;
        // std::cout << " ... built" << std::endl;
    } catch(runtime_error &e) {
        cout << "compileOpenCLKernel failed to compile opencl sourcecode" << endl;
        cout << "unique kernel name " << uniqueKernelName << endl;
        cout << "short kernel name " << shortKernelName << endl;
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
    // cout << " ... built" << endl;
    v->getContext()->kernelCache[uniqueKernelName] = kernel;
    cl->storeKernel(uniqueKernelName, kernel, true);  // this will cause the kernel to be deleted with cl.  Not clean yet, but a start
    return kernel;
}

GenerateOpenCLResult generateOpenCL(
        int uniqueClmemCount, std::vector<int> &clmemIndexByClmemArgIndex, string origKernelName, string devicellsourcecode) {
    // generates OpenCL source-code, based on passed-in bytecode
    // returns cached source-code if available

    // KernelByNameMutex mutex;
    ThreadVars *v = getThreadVars();

    // EasyCL *cl = v->getContext()->getCl();
    ofstream f;
    // std::cout << "generateOpenCL uniqueClmemCount=" << uniqueClmemCount << std::endl;
    // std::ostringstream shortKernelName_ss;
    launchConfiguration.shortKernelName = origKernelName.substr(0, 20);

    std::ostringstream uniqueKernelName_ss;
    uniqueKernelName_ss << origKernelName;
    for(int i = 0; i < clmemIndexByClmemArgIndex.size(); i++) {
        uniqueKernelName_ss << "_" << clmemIndexByClmemArgIndex[i];
    }
    launchConfiguration.uniqueKernelName = uniqueKernelName_ss.str();
    // cout << "generateOpenCL() kernelNameAfterGenerate " << kernelNameAfterGenerate << endl;
    if(v->getContext()->clSourceCodeCache.find(launchConfiguration.uniqueKernelName) != v->getContext()->clSourceCodeCache.end()) {
        std::string clSourcecode = v->getContext()->clSourceCodeCache[launchConfiguration.uniqueKernelName];
        return GenerateOpenCLResult { clSourcecode, origKernelName, launchConfiguration.shortKernelName, launchConfiguration.uniqueKernelName };
        // v->getContext()->numKernelCalls++;
        // return v->getContext()->clSourceCodeByGeneratedName[kernelNameAfterGenerate];
    }

    // convert to opencl first... based on the kernel name required
    try {
        // string filename = "/tmp/" + uniqueKernelName;
        string filename = "/tmp/" + easycl::toString(v->getContext()->clSourceCodeCache.size()) + "-device.ll";
        if(getenv("COCL_DUMP_BYTECODE") != 0) {
            cout << "saving deviceside bytecode to " << filename << endl;
            ofstream f;
            f.open(filename, ios_base::out);
            // f << launchConfiguration.kernelName << endl;
            f << devicellsourcecode << endl;
            f.close();
        }
        string clSourcecode = convertLlStringToCl(
            uniqueClmemCount, clmemIndexByClmemArgIndex, devicellsourcecode, origKernelName, launchConfiguration.shortKernelName, v->offsets_32bit);
        // std::string clSourcecode = convertLlToCl(uniqueClmemCount, clmemIndexByClmemArgIndex, devicellsourcecode, origKernelName, kernelNameAfterGenerate);
        v->getContext()->clSourceCodeCache[launchConfiguration.uniqueKernelName] = clSourcecode;
        return GenerateOpenCLResult { clSourcecode, origKernelName, launchConfiguration.shortKernelName, launchConfiguration.uniqueKernelName };
    } catch(runtime_error &e) {
        cout << "generateOpenCL failed to generate opencl sourcecode" << endl;
        cout << "kernel name orig=" << origKernelName << endl;
        cout << "kernel name short=" << launchConfiguration.shortKernelName << endl;
        cout << "kernel name unique=" << launchConfiguration.uniqueKernelName << endl;
        cout << "writing ll to /tmp/failed-kernel.ll" << endl;
        f.open("/tmp/failed-kernel.ll", ios_base::out);
        f << devicellsourcecode << endl;
        f.close();
        throw e;
    }
}

} // namespace cocl

void configureKernel(const char *kernelName, const char *devicellsourcecode) {
    pthread_mutex_lock(&launchMutex);
    COCL_PRINT("=========================================");
    // cout << "clSources.size() " << getNumClSources() << endl;
    // for(auto it=clSources.begin(); it != clSources.end(); it++) {
    // for(int i = 0; i < getNumClSources(); i++) {
        // cout << "clsource: [" << getClSource(i) << "]" << endl;
    // }
    launchConfiguration.kernelName = kernelName;
    launchConfiguration.devicellsourcecode = devicellsourcecode;
    pthread_mutex_unlock(&launchMutex);
}

void addClmemArg(cl_mem clmem) {
    int clmemIndex = 0;
    if(launchConfiguration.clmemIndexByClmem.find(clmem) == launchConfiguration.clmemIndexByClmem.end()) {
        clmemIndex = launchConfiguration.clmems.size();
        launchConfiguration.clmems.push_back(clmem);
        launchConfiguration.clmemIndexByClmem[clmem] = clmemIndex;
        // cout << "   new clmem" << clmemIndex << endl;
    } else {
        clmemIndex = launchConfiguration.clmemIndexByClmem.find(clmem)->second;
        // cout << "   existing clmem" << clmemIndex << endl;
    }
    launchConfiguration.clmemIndexByClmemArgIndex.push_back(clmemIndex);
}

void setKernelArgHostsideBuffer(char *pCpuStruct, int structAllocateSize) {
    // this receives a hostside struct. it will
    // - allocate a gpu buffer, to hold the struct
    // - queue an OpenCL command, to copy the hostside buffer to the gpu buffer
    // - adds the gpu buffer, and its offset, to the kernel parameters:
    //   - add the gpu buffer to list of unique clmems (if not already there)
    //   - records the unique clmem index, for use in generation
    //   - adds an integer arg, with value 0, as the offset arg
    //
    // Things this doesnt do:
    // - parse/walk the struct (thats handled during opencl generation, later on, not here)
    // - (well, and also in patch_hostside, which sends the other pointers through, separately)
    //
    // Things this does definitely need:
    // - struct allocate size, so we know how big to make the gpu buffer, and how much
    //   data to copy across, from the hostside struct pointer location
    // - we wont add the clmem to the virtualmem table, so we wont delegate
    //   anything to the setKernelArgGpuBuffer method (which expects an incoming
    //   pointer to be a virtual pointer, not a cl_mem)

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
    COCL_PRINT("setKernelArgHostsideBuffer size=" << structAllocateSize);
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

    addClmemArg(gpu_struct);

    int offsetElements = 0;
    if(v->offsets_32bit) {
       launchConfiguration.args.push_back(std::unique_ptr<Arg>(new UInt32Arg((uint32_t)offsetElements)));
    } else {
       launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int64Arg((int64_t)offsetElements)));
    }

    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgGpuBuffer(char *memory_as_charstar, int32_t elementSize) {
    // This adds a gpu buffer to the kernel args, adding it to the list of unique clmems,
    // if not already present, and adding the offset, as a kernel parameter
    //
    // The size of the buffer is not needed (though the virtual memory system knows it :-) )
    // The elementSize used to be used, but is no longer used/needed. Should probably be
    // removed from the method parameters at some point.

    pthread_mutex_lock(&launchMutex);
    ThreadVars *v = getThreadVars();

    Memory *memory = findMemory(memory_as_charstar);
    if(memory == 0) {
        COCL_PRINT("setKernelArgGpuBuffer nullptr");
        addClmemArg(0);
        if(v->offsets_32bit) {
            launchConfiguration.args.push_back(std::unique_ptr<Arg>(new UInt32Arg(0)));
        } else {
            launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int64Arg(0)));
        }
    } else {
        size_t offset = memory->getOffset(memory_as_charstar);
        cl_mem clmem = memory->clmem;

        // size_t offsetElements = offset / elementSize;
        size_t offsetElements = offset;

        // cout << "setKernelArgGpuBuffer offset=" << offset << " offsetElements=" << offsetElements << " newoffset=" << (offsetElements * elementSize) << endl;
        // COCL_PRINT("setKernelArgGpuBuffer offset=" << offsetElements << " elementSize=" << elementSize);

        addClmemArg(clmem);

        // COCL_PRINT("offset elements " << offsetElements);
        if(v->offsets_32bit) {
            launchConfiguration.args.push_back(std::unique_ptr<Arg>(new UInt32Arg((uint32_t)offsetElements)));
        } else {
            launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int64Arg((int64_t)offsetElements)));
        }
    }
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgInt64(int64_t value) {
    pthread_mutex_lock(&launchMutex);
    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int64Arg(value)));
    COCL_PRINT("setKernelArgInt64 " << value);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgInt32(int value) {
    pthread_mutex_lock(&launchMutex);
    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int32Arg(value)));
    COCL_PRINT("setKernelArgInt32 " << value);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgInt8(char value) {
    pthread_mutex_lock(&launchMutex);
    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new Int8Arg(value)));
    COCL_PRINT("setKernelArgInt8 " << value);
    pthread_mutex_unlock(&launchMutex);
}

void setKernelArgFloat(float value) {
    pthread_mutex_lock(&launchMutex);
    launchConfiguration.args.push_back(std::unique_ptr<Arg>(new FloatArg(value)));
    COCL_PRINT("setKernelArgFloat " << value);
    pthread_mutex_unlock(&launchMutex);
}

void kernelGo() {
    try {
    pthread_mutex_lock(&launchMutex);
    // COCL_PRINT("kernelGo queue=" << (void *)launchConfiguration.queue);

    // launchConfiguration.kernelName += "_";
    // for(int i = 0; i < launchConfiguration.clmemIndexByClmemArgIndex.size(); i++) {
    //     int clmemIndex = launchConfiguration.clmemIndexByClmemArgIndex[i];
    //     launchConfiguration.kernelName += "_" + EasyCL::toString(clmemIndex);
    // }
    // cout << "kernelGo() kernel name " << launchConfiguration.kernelName << " unique clmems=" << launchConfiguration.clmems.size() << endl;
    // cout << "kernelGo() clmems.size() " << launchConfiguration.clmems.size() << endl;
    // for(auto it = launchConfiguration.clmemIndexByClmemArgIndex.begin(); it != launchConfiguration.clmemIndexByClmemArgIndex.end(); it++) {
    //     cout << " clmem index " << *it << endl;
    // }
    // for(int i = 0; i < launchConfiguration.args.size(); i++) {
    //     cout << "  arg i=" << i << " " << launchConfiguration.args[i]->str() << endl;
    // }

    GenerateOpenCLResult res = generateOpenCL(
        launchConfiguration.clmems.size(), launchConfiguration.clmemIndexByClmemArgIndex, launchConfiguration.kernelName, launchConfiguration.devicellsourcecode);
    COCL_PRINT("kernelGo() kernel: " << launchConfiguration.kernelName);
    // cout << "kernelGo() OpenCL sourcecode:\n" << res.clSourcecode << endl;
    CLKernel *kernel = compileOpenCLKernel(launchConfiguration.kernelName, res.uniqueKernelName, res.shortKernelName, res.clSourcecode);
    COCL_PRINT("kernelGo() uniqueKernelName: " << launchConfiguration.uniqueKernelName);

    for(int i = 0; i < launchConfiguration.clmems.size(); i++) {
        COCL_PRINT("clmem" << i);
        kernel->inout(&launchConfiguration.clmems[i]);
    }
    for(int i = 0; i < launchConfiguration.args.size(); i++) {
        COCL_PRINT("i=" << i << " " << launchConfiguration.args[i]->str());
        launchConfiguration.args[i]->inject(kernel);
    }

    size_t global[3];
     // COCL_PRINT("<<< global=dim3(");
    for(int i = 0; i < 3; i++) {
        global[i] = launchConfiguration.grid[i] * launchConfiguration.block[i];
        // COCL_PRINT(global[i] << ",");
    }
    // COCL_PRINT("), workgroupsize=dim3(");
    // for(int i = 0; i < 3; i++) {
    //     COCL_PRINT(launchConfiguration.block[i] << ",");
    // }
    // COCL_PRINT(")>>>");
    // cout << "launching kernel, using OpenCL..." << endl;
    int workgroupSize = launchConfiguration.block[0] * launchConfiguration.block[1] * launchConfiguration.block[2];
    // COCL_PRINT("workgroupSize=" << workgroupSize);
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
    COCL_PRINT(".. kernel queued");
    cl_int err;
    err = clFinish(launchConfiguration.queue->queue);
    EasyCL::checkError(err);
    maybeDump();

    // cout << "trying cl->finihs()" << endl;
    //cl->finish();
    // cout << "cl->finihs() done" << endl;
    // cout << ".. kernel finished" << endl;
    for(auto it=launchConfiguration.kernelArgsToBeReleased.begin(); it != launchConfiguration.kernelArgsToBeReleased.end(); it++) {
        // COCL_PRINT("release arg");
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
    pthread_mutex_unlock(&launchMutex);
    pthread_mutex_unlock(&launchMutex);
    } catch(runtime_error &e) {
        std::cout << "caught runtime error " << e.what() << std::endl;
        throw e;
    }
}

MyClass hostsidefuncs(__FILE__);
