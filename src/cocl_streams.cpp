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

typedef CLQueue *PCLQueue;

extern "C" {
    size_t cudaStreamSynchronize(PCLQueue stream);
    size_t cuStreamCreate(PCLQueue *stream, unsigned int flags);
    size_t cuStreamDestroy_v2(PCLQueue stream);
    size_t cuStreamSynchronize(PCLQueue stream);
    // size_t cuStreamWaitEvent(stream, event, 0 /* = flags */)
}

size_t cudaStreamSynchronize(PCLQueue pqueue) {
    cout << "cudaStreamSynchronize stream=" << pqueue << endl;
    hostside_opencl_funcs_assure_initialized();

    // assert(stream == 0);

    if(pqueue == 0) {
        cl->finish();
    } else {
        clFinish(pqueue->queue);
    }

    return 0;
}

size_t cuStreamSynchronize(PCLQueue pqueue) {
    return cudaStreamSynchronize(pqueue);
}

size_t cuStreamCreate(PCLQueue *ppqueue, unsigned int flags) {
    cout << "cuStreamCreate redirected" << endl;
    hostside_opencl_funcs_assure_initialized();
    CLQueue *queue = cl->newQueue();
    cout << "created queue" << endl;
    *ppqueue = queue;
    cout << "done assign" << endl;
    return 0;
}

size_t cuStreamDestroy_v2(PCLQueue pqueue) {
    cout << "cuStreamDestroy_v2 redirected" << endl;
    delete pqueue;
    return 0;
}
