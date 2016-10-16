#pragma once

#include "EasyCL.h"
#include "cocl_events.h"

extern "C" {
    size_t cuStreamCreate(easycl::CLQueue **pqueue, unsigned int flags);
    size_t cudaStreamSynchronize(easycl::CLQueue *pqueue);
    size_t cuStreamDestroy_v2(easycl::CLQueue *queue);
    size_t cuStreamSynchronize(easycl::CLQueue *queue);
    size_t cuStreamWaitEvent(easycl::CLQueue *queue, cocl::Event *event, unsigned int flags);
}
