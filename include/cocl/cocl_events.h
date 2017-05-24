#pragma once

// #include "CL/cl.h"
#include "EasyCL/EasyCL.h"

namespace cocl {
    class CoclEvent {
        // since cuda creates events then records them, but opencl doesnt create events until
        // the time of 'record', and the cuda client already has a pointer to the event, before record is called,
        // so we will create our own object to interface between these two behaviors
        // we'll send a CoclEvent to the client, and tell them its a CUevent object. approximately
    public:
        CoclEvent();
        ~CoclEvent();
        // bool has_event();
        cl_event event = 0;
    };
}

extern "C" {
    size_t cuEventCreate(cocl::CoclEvent **pevent, unsigned int flags);
    size_t cuEventSynchronize(cocl::CoclEvent *event);
    size_t cuEventRecord(cocl::CoclEvent *event, char *queue);
    size_t cuEventQuery(cocl::CoclEvent *event);
    size_t cuEventDestroy_v2(cocl::CoclEvent *event);
    size_t cuStreamWaitEvent(char *queue, cocl::CoclEvent *event, unsigned int flags);

    size_t cudaEventElapsedTime(float *p_elapsedTime, cocl::CoclEvent *start, cocl::CoclEvent *stop);
    size_t cudaEventCreate(cocl::CoclEvent **pevent);
    size_t cudaEventCreateWithFlags(cocl::CoclEvent **pevent, int flags);
    size_t cudaEventQuery(cocl::CoclEvent *event);
    size_t cudaEventRecord(cocl::CoclEvent *event, char *queue=0);
    size_t cudaEventSynchronize(cocl::CoclEvent *event);
    size_t cudaEventElapsedTime(float *p_elapsedTime, cocl::CoclEvent *start, cocl::CoclEvent *stop);
    size_t cudaStreamWaitEvent(char *queue, cocl::CoclEvent *event, unsigned int flags);
    size_t cudaEventDestroy(cocl::CoclEvent *event);

    size_t cudaProfilerStop();
}

enum EventEnum {
    CU_EVENT_DEFAULT = 70000,
    CU_EVENT_DISABLE_TIMING,

    cudaEventDisableTiming
};
#define CU_EVENT_DISABLE_TIMING 1

typedef cocl::CoclEvent *cudaEvent_t;
typedef cocl::CoclEvent *CUevent;
