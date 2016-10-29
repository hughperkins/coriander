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

#include "cocl/cocl_streams.h"

#include "cocl/cocl_events.h"
#include "cocl/hostside_opencl_funcs.h"
#include "cocl/local_config.h"
#include "cocl/cocl_context.h"

#include "EasyCL.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "pthread.h"

#include "CL/cl.h"

using namespace std;
using namespace cocl;
using namespace easycl;

// #undef COCL_PRINT
// #define COCL_PRINT(stuff) \
//     stuff ;

namespace cocl {
    void coclCallback(cl_event event, cl_int status, void *userdata) {
        ThreadVars *v = getThreadVars();
        EasyCL *cl = v->getCl();
        cout << "coclCallback running " << endl;
        cl->checkError(status);
        CoclCallbackInfo *info = (CoclCallbackInfo *)userdata;
        clReleaseEvent(event);
        info->callback(info->_queue, 0, info->userdata);
        delete info;
    }

    CoclStream::CoclStream(EasyCL *cl) {
        this->clqueue = cl->newQueue();
    }
    CoclStream::~CoclStream() {
        delete clqueue;
    }
    // StreamLock::StreamLock(CoclStream *stream) {
    //     this->stream = stream;
    //     pthread_mutex_lock(&stream->mutex);
    // }
    // StreamLock::~StreamLock() {
    //     pthread_mutex_unlock(&stream->mutex);
    // }
}

size_t cuStreamWaitEvent(char *_queue, Event *event, unsigned int flags) {
    CoclStream *stream = (CoclStream *)_queue;
    // StreamLock streamlock(stream);
    CLQueue *queue = stream->clqueue;
    // CLQueue *queue = (CLQueue*)_queue;
    COCL_PRINT(cout << "cuStreamWaitEvent redirected queue=" << queue << " event=" << event << " flags=" << flags << endl);
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

    if(!event->has_event()) {
        cerr << "cuStreamWaitEvent redirected: Warning: you havent Recorded on the event you passed in" << endl;
    }
    // cl_event clevent;
    clEnqueueBarrierWithWaitList(queue->queue,
        1,
        &event->event,
        0);
    return 0;
}

size_t cudaStreamSynchronize(char *_queue) {
    CoclStream *stream = (CoclStream *)_queue;
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getCl();
    // StreamLock streamlock(stream);
    CLQueue *queue = stream->clqueue;
    // CLQueue *queue = (CLQueue*)_queue;
    COCL_PRINT(cout << "cudaStreamSynchronize queue=" << queue << endl);
    hostside_opencl_funcs_assure_initialized();

    // assert(stream == 0);

    if(queue == 0) {
        cl->finish();
    } else {
        clFinish(queue->queue);
    }

    return 0;
}

size_t cuStreamSynchronize(char *_queue) {
    // CLQueue *queue = (CLQueue*)_queue;
    return cudaStreamSynchronize(_queue);
}

size_t cuStreamCreate(char **_pstream, unsigned int flags) {
    CoclStream **pstream = (CoclStream**)_pstream;
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getCl();
    // hostside_opencl_funcs_assure_initialized();
    // CLQueue *clqueue = cl->newQueue();
    CoclStream *coclStream = new CoclStream(cl);
    COCL_PRINT(cout << "cuStreamCreate redirected new stream " << (void *)coclStream << endl);
    // coclStream->clqueue = clqueue;
    *pstream = coclStream;
    // cout << "done assign" << endl;
    return 0;
}

size_t cuStreamDestroy_v2(char *_queue) {
    CoclStream *stream = (CoclStream *)_queue;
    // StreamLock streamlock(stream);
    COCL_PRINT(cout << "cuStreamDestroy_v2 redirected stream=" << (void *)stream << endl);
    delete stream;
    return 0;
}

size_t cudaStreamQuery(char *_queue) {
    return cuStreamSynchronize(_queue);
}

size_t cuStreamQuery(char *_queue) {
    return cuStreamSynchronize(_queue);
}

size_t cudaStreamAddCallback(char *_queue, cudacallbacktype callback, void *userdata, int flags) {
    CoclStream *stream = (CoclStream *)_queue;
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getCl();
    // StreamLock streamlock(stream);
    CLQueue *queue = stream->clqueue;
    // CLQueue *queue = (CLQueue*)_queue;
    // we need to queue an event, and attach the callback to that;
    cl_int err;
    cl_event event;
    err= clEnqueueBarrierWithWaitList(queue->queue,
        0,
        0,
        &event
        );
    cl->checkError(err);
    CoclCallbackInfo *info = new CoclCallbackInfo();
    // cout << "created info" << endl;
    info->callback = callback;
    info->userdata = userdata;
    info->_queue = _queue;
    // cout << "calling seteventcallback" << endl;
    err = clSetEventCallback(event, CL_COMPLETE, cocl::coclCallback, info);
    // cout << "called clseteventcallback" << endl;
    cl->checkError(err);
    return 0;
}
