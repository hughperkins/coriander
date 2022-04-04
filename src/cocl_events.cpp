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

namespace cocl {
    Event::Event() {
        COCL_PRINT(cout << "Event()" << endl);
    }
    Event::~Event() {
        COCL_PRINT(cout << "~Event()" << endl);
        if(event != 0) {
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
// cuEventCreate(CUEvent *, flags)
// cuEventRecord(CUEvent, CUstream);  => puts into the stream
// cuEventQuery(CUevent)
// cuEventSynchronize(CUevent)
// cuEventDestroy

size_t cuEventCreate(Event **pevent, unsigned int flags) {
    Event *event = new Event();
    *pevent = event;
    COCL_PRINT(cout << "cuEventCreate redirected flags=" << flags << " new event=" << event << endl);
    return 0;
}

size_t cudaEventCreate(Event **pevent) {
    return cuEventCreate(pevent, 0);
}

size_t cuEventSynchronize(Event *event) {
    COCL_PRINT(cout << "cuEventSynchronize redirected event=" << event << endl);
    cl_int err = clWaitForEvents(1, &event->event);
    EasyCL::checkError(err);
    return 0;
}


size_t cudaProfilerStop() {
    return 0;
}

size_t cudaEventElapsedTime(float *p_elapsedTime, cocl::Event *start, cocl::Event *stop) {
    *p_elapsedTime = 0.0f;
    return 0;
}

size_t cudaEventSynchronize(cocl::Event *event) {
    return cuEventSynchronize(event);
}

size_t cuEventRecord(Event *event, char *_queue) {
    CoclStream *coclStream = (CoclStream *)_queue;
    CLQueue *queue = coclStream->clqueue;
    // CLQueue *queue = (CLQueue *)_queue;
    COCL_PRINT(cout << "cuEventRecord redirected event=" << event << " queue=" << queue << endl);
    if(queue == 0) {
        cout << "cuEventRecord redirected not implemented for stream 0" << endl;
        throw runtime_error("cuEventRecord redirected not implemented for stream 0");
    }
    cl_event clevent;
    clEnqueueMarkerWithWaitList(queue->queue, 0, 0, &clevent);
    event->event = clevent;
    return 0;
}

size_t cudaEventRecord(cocl::Event *event, char *queue) {
    return cuEventRecord(event, queue);
}

size_t cuEventQuery(Event *event) {
    COCL_PRINT(cout << "cuEventQuery redirected event=" << event << endl);
    cl_int res;
    cl_int err = clGetEventInfo (
        event->event,
        CL_EVENT_COMMAND_EXECUTION_STATUS,
        sizeof(cl_int),
        &res,
        0);
    COCL_PRINT(cout << "clGetEventInfo: " << res << endl);
    EasyCL::checkError(err);
    if(res == CL_COMPLETE) { // success
        return 0;
    } else if(res > 0) { // not finished yet
        return cudaErrorNotReady;
    } else { // error
        return 1;
    }
}

size_t cuEventDestroy_v2(Event *event) {
    COCL_PRINT(cout << "cuEventDestroy redirected event=" << event << endl);
    delete event;
    return 0;
}
