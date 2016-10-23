#pragma once

// #include "EasyCL.h"
#include "cocl_events.h"

extern "C" {
    size_t cuStreamCreate(char **pqueue, unsigned int flags);
    size_t cudaStreamSynchronize(char *pqueue);
    size_t cuStreamQuery(char *stream);

    size_t cuStreamDestroy_v2(char *queue);
    size_t cuStreamSynchronize(char *queue);
    size_t cuStreamWaitEvent(char *queue, cocl::Event *event, unsigned int flags);

    size_t cudaStreamQuery(char *stream);
}
