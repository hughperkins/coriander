#pragma once

#include "/home/ubuntu/git/cuda-ir-to-opencl/src/EasyCL/EasyCL.h"
#include "cocl_events.h"

extern "C" {
    size_t cuStreamCreate(char **pqueue, unsigned int flags);
    size_t cudaStreamSynchronize(char *pqueue);
    size_t cuStreamDestroy_v2(char *queue);
    size_t cuStreamSynchronize(char *queue);
    size_t cuStreamWaitEvent(char *queue, cocl::Event *event, unsigned int flags);
}
