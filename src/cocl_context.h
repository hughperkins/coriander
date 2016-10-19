#pragma once

class PContext;

// #ifdef __cplusplus
extern "C" {
// #endif
    size_t cuCtxSynchronize(void);
    size_t cuCtxCreate_v2(PContext *context, unsigned int flags, void *device);
    size_t cuCtxGetCurrent(PContext *context);
    size_t cuCtxSetCurrent(PContext context);
// #ifdef __cplusplus
}
// #endif
