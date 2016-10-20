#pragma once

class Context;

// #ifdef __cplusplus
extern "C" {
// #endif
    size_t cuCtxSynchronize(void);
    size_t cuCtxCreate_v2(Context **pcontext, unsigned int flags, void *device);
    size_t cuCtxGetCurrent(Context **pcontext);
    size_t cuCtxSetCurrent(Context *context);
// #ifdef __cplusplus
}
// #endif
