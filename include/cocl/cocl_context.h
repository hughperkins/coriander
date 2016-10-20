#pragma once

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
