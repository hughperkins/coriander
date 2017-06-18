#pragma once

#include "cocl/cocl_device.h"

#include <map>
#include <set>
#include <memory>
#include <mutex>

extern "C" {
    size_t cuCtxSynchronize(void);
    size_t cuCtxCreate_v2(char **pcontext, unsigned int flags, long long device);
    size_t cuCtxCreate(char **pcontext, unsigned int flags, long long device);
    size_t cuCtxGetCurrent(char **pcontext);
    size_t cuCtxSetCurrent(char *context);
    size_t cuCtxGetDevice(CUdevice *pdevice);
}

// numbers are arbitrary.  symbols must match the projects we are trying to build
enum ContextEnum {
    CU_CTX_LMEM_RESIZE_TO_MAX = 30000,
    CU_CTX_SCHED_SPIN,
    CU_CTX_SCHED_YIELD,
    CU_CTX_SCHED_BLOCKING,
    CU_CTX_SCHED_BLOCKING_SYNC
};

namespace easycl {
    class EasyCL;
    class CLKernel;
}

namespace cocl {
    class Memory;
    class CoclStream;

    class KernelInfo {
    public:
        // CLKernel *kernel = 0;
        bool usesVmem = false;
        bool usesScratch = false;
    };

    class Context {
    public:
        Context(int device);
        ~Context();
        std::unique_ptr<easycl::EasyCL> cl;
        std::unique_ptr<cocl::CoclStream> default_stream;
        std::map<std::string, easycl::CLKernel *> kernelCache;
        std::map<std::string, cocl::KernelInfo> kernelInfoByUniqueName;
        std::map<std::string, std::string > clSourceCodeCache;
        std::set<cocl::Memory *>memories;
        long long nextAllocPos = 1;
        std::map< long long, cocl::Memory *>memoryByAllocPos;
        int numKernelCalls = 0;
        const int gpuOrdinal;
        easycl::EasyCL *getCl() {
            return cl.get();
        }
        std::mutex mu;
    };

    class ContextMutex {
    public:
        ContextMutex(Context *context);
        ~ContextMutex();
        Context *context;
    };

    class ThreadVars {
    public:
        ThreadVars();
        ~ThreadVars();
        Context *getContext();
        cocl::Context *currentContext = 0;
        int currentGpuOrdinal = 0;
        bool offsets_32bit = false;
    };

    ThreadVars *getThreadVars();
}

typedef char *CUcontext;
