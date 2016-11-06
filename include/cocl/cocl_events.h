#pragma once

// #include "CL/cl.h"
#include "EasyCL/EasyCL.h"

namespace cocl {
    class Event {
        // since cuda creates events then records them, but opencl doesnt create events until
        // the time of 'record', and the cuda client already has a pointer to the event, before record is called,
        // so we will create our own object to interface between these two behaviors
        // we'll send a CoclEvent to the client, and tell them its a CUevent object. approximately
    public:
        Event();
        ~Event();
        bool has_event() {
            return event != 0;
        }
        cl_event event = 0;
    };
}

extern "C" {
    size_t cuEventCreate(cocl::Event **pevent, unsigned int flags);
    size_t cuEventSynchronize(cocl::Event *event);
    size_t cuEventRecord(cocl::Event *event, char *queue);
    size_t cuEventQuery(cocl::Event *event);
    size_t cuEventDestroy_v2(cocl::Event *event);
}

enum EventEnum {
    CU_EVENT_DEFAULT = 70000,
    CU_EVENT_DISABLE_TIMING
};
