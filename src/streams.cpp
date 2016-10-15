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

// #include "EasyCL.h"

#include "CL/cl.h"

using namespace std;
using namespace cocl;
using namespace easycl;

typedef CLQueue *QueueForClient;

extern "C" {
    size_t cudaStreamSynchronize(QueueForClient stream);
    size_t cuStreamCreate(QueueForClient *stream, unsigned int flags);
    size_t cuStreamDestroy_v2(QueueForClient stream);
}

size_t cudaStreamSynchronize(QueueForClient stream) {
    cout << "cudaStreamSynchronize stream=" << stream << endl;
    hostside_opencl_funcs_assure_initialized();

    // assert(stream == 0);

    if(stream == 0) {
        cl->finish();
    } else {
        clFinish(stream->queue);
    }

    // cl->finish();
    return 0;
}

size_t cuStreamCreate(QueueForClient *pstream, unsigned int flags) {
    cout << "cuStreamCreate redirected" << endl;
    hostside_opencl_funcs_assure_initialized();
    cl_int err;
    // cl_command_queue queue = clCreateCommandQueue(*cl->context, cl->device, 0, &err);
    CLQueue *queue = cl->newQueue();
    cout << "created queue" << endl;
    *pstream = queue;
    cout << "done assign" << endl;

    // // lets just say we cant create streams for now?
    // return 1;
    return 0;
}

size_t cuStreamDestroy_v2(QueueForClient stream) {
    cout << "cuStreamDestroy_v2 redirected" << endl;
    delete stream;
    // return 1;
    return 0;
}
