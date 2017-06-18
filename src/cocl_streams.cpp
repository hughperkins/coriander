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
#include "cocl/cocl_context.h"

#include "EasyCL/EasyCL.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>


using namespace std;
using namespace cocl;
using namespace easycl;

#undef COCL_PRINT
#define COCL_PRINT(x) 
// #define COCL_PRINT(stuff) \
//     stuff ;

namespace cocl {
    void coclCallback(cl_event event, cl_int status, void *userdata) {
        // cout << "coclCallback running " << endl;
        EasyCL::checkError(status);
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
}

size_t cudaStreamSynchronize(char *_queue) {
    CoclStream *stream = (CoclStream *)_queue;
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    if(stream == 0) {
        stream = v->currentContext->default_stream.get();
    }
    CLQueue *queue = stream->clqueue;
    COCL_PRINT(cout << "cudaStreamSynchronize queue=" << queue << endl);
    if(queue == 0) {
        cl->finish();
    } else {
        clFinish(queue->queue);
    }

    return 0;
}

size_t cuStreamSynchronize(char *_queue) {
    return cudaStreamSynchronize(_queue);
}

size_t cuStreamCreate(char **_pstream, unsigned int flags) {
    CoclStream **pstream = (CoclStream**)_pstream;
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    CoclStream *coclStream = new CoclStream(cl);
    *pstream = coclStream;
    return 0;
}

size_t cudaStreamCreate(char **_pstream) {
    return cuStreamCreate(_pstream, 0);
}

size_t cuStreamDestroy_v2(char *_queue) {
    CoclStream *stream = (CoclStream *)_queue;
    delete stream;
    return 0;
}

size_t cudaStreamDestroy(char *_queue) {
    return cuStreamDestroy_v2(_queue);
}

size_t cudaStreamQuery(char *_queue) {
    return cuStreamSynchronize(_queue);
}

size_t cuStreamQuery(char *_queue) {
    return cuStreamSynchronize(_queue);
}

size_t cudaStreamAddCallback(char *_queue, cudacallbacktype callback, void *userdata, int flags) {
    CoclStream *stream = (CoclStream *)_queue;
    CLQueue *queue = stream->clqueue;
    // we need to queue an event, and attach the callback to that;
    cl_int err;
    cl_event event;
    err= clEnqueueBarrierWithWaitList(queue->queue,
        0,
        0,
        &event
        );
    EasyCL::checkError(err);
    CoclCallbackInfo *info = new CoclCallbackInfo();
    info->callback = callback;
    info->userdata = userdata;
    info->_queue = _queue;
    err = clSetEventCallback(event, CL_COMPLETE, cocl::coclCallback, info);
    EasyCL::checkError(err);
    return 0;
}
