// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "cocl/cocl_events.h"

#include "cocl/cocl_error.h"
#include "cocl/cocl_defs.h"
#include "cocl/hostside_opencl_funcs.h"
#include "cocl/cocl_streams.h"
#include "cocl/cocl_context.h"

#include "EasyCL/EasyCL.h"

#include <iostream>
#include <memory>

using namespace std;
using namespace cocl;
using namespace easycl;

#ifdef COCL_SPAM
#undef COCL_PRINT
#define COCL_PRINT(x) std::cout << "[COCL] " << x << std::endl;
#endif

namespace cocl {
    CoclEvent::CoclEvent() {
        COCL_PRINT("CoclEvent() this=" << this);
        event = 0;
    }
    CoclEvent::~CoclEvent() {
        COCL_PRINT("~CoclEvent() this=" << this);
        if(event != 0) {
            COCL_PRINT("~CoclEvent() releasing underlying clevent " << event);
            clReleaseEvent(event);
        }
    }
}

// opencl:
// clCreateUserEvent()   CL_EVENT_COMMAND_ EXECUTION_STATUS
// clWaitForEvents(num_events, event_list);
// clEnqueueMarkerWithWaitList
// clGetEventInfo() 
// clReleaseEvent

// cuda:
// cuEventCreate(CUCoclEvent *, flags)
// cuEventRecord(CUEvent, CUstream);  => puts into the stream
// cuEventQuery(CUevent)
// cuEventSynchronize(CUevent)
// cuEventDestroy

size_t cuEventCreate(CoclEvent **pevent, unsigned int flags) {
    CoclEvent *event = new CoclEvent();
    *pevent = event;
    COCL_PRINT("cuEventCreate flags=" << flags << " new CoclEvent=" << event);
    // throw runtime_error("fake stop");
    return 0;
}

size_t cuEventSynchronize(CoclEvent *event) {
    COCL_PRINT("cuEventSynchronize CoclEvent=" << event);
    cl_int err = clWaitForEvents(1, &event->event);
    EasyCL::checkError(err);
    return 0;
}

size_t cuEventRecord(CoclEvent *event, char *_queue) {
    CoclStream *coclStream = (CoclStream *)_queue;
    CLQueue *queue = coclStream->clqueue;
    // CLQueue *queue = (CLQueue *)_queue;
    COCL_PRINT("cuEventRecord CoclEvent=" << event << " queue=" << queue);
    if(queue == 0) {
        cout << "cuEventRecord not implemented for stream 0" << endl;
        throw runtime_error("cuEventRecord not implemented for stream 0");
    }
    cl_int err;
    if(event->event != 0) {
        COCL_PRINT("  cuEventRecord releasing existing clevent " << event->event);
        err = clReleaseEvent(event->event);
        EasyCL::checkError(err);
        event->event = 0;
        // cout << "cuEventRecrd event is already assigned => error" << endl;
        // throw runtime_error("cuEventRecord: event is already assigned => error");
    }
    cl_event clevent;
    err = clEnqueueMarkerWithWaitList(queue->queue, 0, 0, &clevent);
    COCL_PRINT("cuEventRecord CoclEvent=" << event << " created clevent=" << clevent);
    EasyCL::checkError(err);
    err = clFlush(queue->queue);
    EasyCL::checkError(err);
    event->event = clevent;
    return 0;
}

size_t cuEventQuery(CoclEvent *event) {
    COCL_PRINT("cuEventQuery CoclEvent=" << event << " clevent=" << event->event);
    cl_int res;
    cl_int err = clGetEventInfo (
        event->event,
        CL_EVENT_COMMAND_EXECUTION_STATUS,
        sizeof(cl_int),
        &res,
        0);
    COCL_PRINT("clGetEventInfo: " << res);
    EasyCL::checkError(err);
    if(res == CL_COMPLETE) { // success
        COCL_PRINT("cuEventQuery, event completed");
        return 0;
    } else if(res > 0) { // not finished yet
        COCL_PRINT("cuEventQuery, event not finished yet");
        return cudaErrorNotReady;
    } else { // error
        COCL_PRINT("cuEventQuery, event error");
        return 1;
    }
}

size_t cuEventDestroy_v2(CoclEvent *event) {
    COCL_PRINT("cuEventDestroy CoclEvent=" << event);
    delete event;
    return 0;
}
