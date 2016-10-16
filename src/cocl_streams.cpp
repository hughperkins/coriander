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

#include "cocl_events.h"

#include "hostside_opencl_funcs.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "CL/cl.h"

using namespace std;
using namespace cocl;
using namespace easycl;

// typedef CLQueue *PCLQueue;

extern "C" {
    size_t cuStreamCreate(CLQueue **pqueue, unsigned int flags);
    size_t cudaStreamSynchronize(CLQueue *pqueue);
    size_t cuStreamDestroy_v2(CLQueue *queue);
    size_t cuStreamSynchronize(CLQueue *queue);
    size_t cuStreamWaitEvent(CLQueue *queue, Event *event, unsigned int flags);
}

// CLDriver::WaitStreamOnEvent stream=0x2e18610 context=0x328a780 event=0x2e1c980  flags=0

size_t cuStreamWaitEvent(CLQueue *queue, Event *event, unsigned int flags) {
    cout << "cuStreamWaitEvent redirected queue=" << queue << " event=" << event << " flags=" << flags << endl;
    if(queue == 0) {
        cout << "cuStreamWaitEvent stream==0 not implemented" << std::endl;
        throw runtime_error("cuStreamWaitEvent stream==0 not implemented");
    }
    throw runtime_error("cuStreamWaitEvent not implemented");
    return 0;
}

size_t cudaStreamSynchronize(CLQueue *queue) {
    cout << "cudaStreamSynchronize queue=" << queue << endl;
    hostside_opencl_funcs_assure_initialized();

    // assert(stream == 0);

    if(queue == 0) {
        cl->finish();
    } else {
        clFinish(queue->queue);
    }

    return 0;
}

size_t cuStreamSynchronize(CLQueue *queue) {
    return cudaStreamSynchronize(queue);
}

size_t cuStreamCreate(CLQueue **pqueue, unsigned int flags) {
    hostside_opencl_funcs_assure_initialized();
    CLQueue *queue = cl->newQueue();
    cout << "cuStreamCreate redirected new queue " << queue << endl;
    *pqueue = queue;
    // cout << "done assign" << endl;
    return 0;
}

size_t cuStreamDestroy_v2(CLQueue *queue) {
    cout << "cuStreamDestroy_v2 redirected queue=" << queue << endl;
    delete queue;
    return 0;
}
