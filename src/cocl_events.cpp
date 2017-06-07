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

#include "pthread.h"

#include <iostream>
#include <memory>

using namespace std;
using namespace cocl;
using namespace easycl;

#ifdef COCL_PRINT
#undef COCL_PRINT
#endif

#ifdef COCL_SPAM_EVENTS
#define COCL_PRINT(x) std::cout << "[EVT] " << x << std::endl;
#else
#define COCL_PRINT(x) 
#endif

// I guess that events should only be called from a single thread, so there might 
// be a bug elesewhere, but in the meantime, the events are being called in parallel, from
// mutliple threads, which crasehs stuff. lets try using a mutex to "fix" this for now
static pthread_mutex_t cocl_events_mutex = PTHREAD_MUTEX_INITIALIZER;

namespace cocl {
    CoclEvent::CoclEvent() {
        COCL_PRINT("CoclEvent() this=" << this);
        event = 0;
    }
    CoclEvent::~CoclEvent() {
        COCL_PRINT("~CoclEvent() this=" << this);
        if(event != 0) {
            COCL_PRINT("~CoclEvent() releasing underlying clevent " << event);
            cl_int err = clReleaseEvent(event);
            EasyCL::checkError(err);
        }
    }
    // bool CoclEvent::has_event() {
    //     bool res = event != 0;
    //     return res;
    // }
}

size_t cuStreamWaitEvent(char *_queue, CoclEvent *event, unsigned int flags) {
    pthread_mutex_lock(&cocl_events_mutex);
    CoclStream *stream = (CoclStream *)_queue;
    // StreamLock streamlock(stream);
    CLQueue *queue = stream->clqueue;
    // CLQueue *queue = (CLQueue*)_queue;
    // COCL_PRINT(cout << "cuStreamWaitEvent redirected queue=" << queue << " event=" << event << " flags=" << flags << endl);
    if(queue == 0) {
        cout << "cuStreamWaitEvent stream==0 not implemented" << std::endl;
        throw runtime_error("cuStreamWaitEvent stream==0 not implemented");
    }

    // I think what cuStreamWaitEvent does is:
    // - add something to the queue, some marker/barrier
    // - anything added to the queue after this will NOT start executing
    // - until the event given to cuStreamWaitEvent is marked as finished
    //
    // I think that with clWaitForEvents, we can give a list of cl events to wait on,
    // but its the *host* thread that waits, ie the call is blocking
    // I think that cuStreamWaitEvent is not actually a blocking call, for the host, its more like
    // some kind of barrier

    // I think waht we plausibly need is clEnqueueBarrierWithWaitList
    // so lets try that...

    if(event->event == 0) {
        cerr << "cuStreamWaitEvent redirected: Warning: you havent Recorded on the event you passed in" << endl;
    } else {
        // cl_event clevent;
        clEnqueueBarrierWithWaitList(queue->queue,
            1,
            &event->event,
            0);
    }
    pthread_mutex_unlock(&cocl_events_mutex);
    return 0;
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

size_t cudaStreamWaitEvent(char *_queue, CoclEvent *event, unsigned int flags) {
    return cuStreamWaitEvent(_queue, event, flags);
}

size_t cuEventCreate(CoclEvent **pevent, unsigned int flags) {
    pthread_mutex_lock(&cocl_events_mutex);
    CoclEvent *event = new CoclEvent();
    *pevent = event;
    COCL_PRINT("cuEventCreate flags=" << flags << " new CoclEvent=" << event);
    // throw runtime_error("fake stop");
    pthread_mutex_unlock(&cocl_events_mutex);
    return 0;
}

size_t cudaEventCreateWithFlags(CoclEvent **pevent, unsigned int flags) {
    return cuEventCreate(pevent, flags);
}

size_t cudaEventCreate(CoclEvent **pevent) {
    return cuEventCreate(pevent, 0);
}

size_t cuEventSynchronize(CoclEvent *event) {
    pthread_mutex_lock(&cocl_events_mutex);
    COCL_PRINT("cuEventSynchronize CoclEvent=" << event);
    cl_int err = clWaitForEvents(1, &event->event);  // 1 is number of events, 2nd parameter is list of events
    EasyCL::checkError(err);
    pthread_mutex_unlock(&cocl_events_mutex);
    return 0;
}

size_t cudaProfilerStop() {
    return 0;
}

size_t cudaEventElapsedTime(float *p_elapsedTime, cocl::CoclEvent *start, cocl::CoclEvent *stop) {
    *p_elapsedTime = 0.0f;
    return 0;
}

size_t cudaEventSynchronize(cocl::CoclEvent *event) {
    return cuEventSynchronize(event);
}

size_t cuEventRecord(CoclEvent *event, char *_queue) {
    pthread_mutex_lock(&cocl_events_mutex);
    CoclStream *coclStream = (CoclStream *)_queue;
    CLQueue *queue = coclStream->clqueue;
    // CLQueue *queue = (CLQueue *)_queue;
    COCL_PRINT("cuEventRecord CoclEvent=" << event << " queue=" << queue);
    if(queue == 0) {
        cout << "cuEventRecord not implemented for stream 0" << endl;
        throw runtime_error("cuEventRecord not implemented for stream 0");
    }
    cl_int err;
    err = clFlush(queue->queue);
    EasyCL::checkError(err);
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
    pthread_mutex_unlock(&cocl_events_mutex);
    return 0;
}

size_t cudaEventRecord(cocl::CoclEvent *event, char *queue) {
    return cuEventRecord(event, queue);
}

size_t cuEventQuery(CoclEvent *event) {
    pthread_mutex_lock(&cocl_events_mutex);
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
    pthread_mutex_unlock(&cocl_events_mutex);
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
    pthread_mutex_lock(&cocl_events_mutex);
    COCL_PRINT("cuEventDestroy CoclEvent=" << event);
    // if(event->event != 0) {
    //     COCL_PRINT("cuEventDestory_v2: releasing event " << event->event);
    //     cu_int err = clReleaseEvent(event->event);
    //     EasyCL::checkError(err);
    // }
    delete event;
    pthread_mutex_unlock(&cocl_events_mutex);
    return 0;
}

size_t cudaEventDestroy(CoclEvent *event) {
    return cuEventDestroy(event);
}
