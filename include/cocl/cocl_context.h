#pragma once

#include <map>
#include <set>
#include <memory>

extern "C" {
    size_t cuCtxSynchronize(void);
    size_t cuCtxCreate_v2(char **pcontext, unsigned int flags, long long device);
    size_t cuCtxGetCurrent(char **pcontext);
    size_t cuCtxSetCurrent(char *context);
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

    class Context {
    public:
        Context(int device);
        ~Context();
        std::unique_ptr<easycl::EasyCL> cl;
        std::unique_ptr<cocl::CoclStream> default_stream;
        std::map<std::string, easycl::CLKernel *> kernelByName;
        std::set<cocl::Memory *>memories;
        long long nextAllocPos = 1;
        std::map< long long, cocl::Memory *>memoryByAllocPos;
        int numKernelCalls = 0;
        const int device;
        easycl::EasyCL *getCl() {
            return cl.get();
        }
        volatile bool inUse = false;
    };
    // typedef Context *PContext;

    class ThreadVars {
    public:
        ThreadVars();
        ~ThreadVars();
        Context *getContext();
        int currentDevice = 0;
        cocl::Context *currentContext = 0;
        // std::map<int, easycl::EasyCL*> clByDeviceIdx;
    };

    ThreadVars *getThreadVars();
}
