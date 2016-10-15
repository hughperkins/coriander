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

class CoclEventClass {
    // since cuda creates events then records them, but opencl doesnt create events until
    // the time of 'record', and the cuda client already has a pointer to the event, before record is called,
    // so we will create our own object to interface between these two behaviors
    // we'll send a CoclEvent to the client, and tell them its a CUevent object. approximately
public:
    CoclEventClass() {
        cout << "CoclEventClass()" << endl;
    }
    ~CoclEventClass() {
        cout << "~CoclEventClass()" << endl;
        if(event != 0) {
            clReleaseEvent(event);
        }
    }
    cl_event event = 0;
};

typedef CoclEventClass *CoclEvent;

extern "C" {
    size_t cuEventCreate(CoclEvent *pevent, unsigned int flags);
    size_t cuEventSynchronize(CoclEvent event);
    size_t cuEventRecord(CoclEvent event);
    size_t cuEventQuery(CoclEvent event);
    size_t cuEventDestroy_v2(CoclEvent event);
}

size_t cuEventCreate(CoclEvent *pevent, unsigned int flags) {
    cout << "cuEventCreate redirected flags=" << flags << endl;
    // cl_int err;
    // cl_event event = clCreateUserEvent(*ctx, &err);
    // cl->checkError(err);
    CoclEvent event = new CoclEventClass();
    *pevent = event;
    // *(void **)pevent = (void *)event;
    return 0;
}

size_t cuEventSynchronize(CoclEvent coclevent) {
    // cl_event event = (cl_event)event_as_voidstar;
    cout << "cuEventSynchronize redirected" << endl;
    cl_int err = clWaitForEvents(1, &coclevent->event);
    cl->checkError(err);
    return 0;
}

size_t cuEventRecord(CoclEvent coclevent) {
    cout << "cuEventRecord redirected" << endl;
    cl_event clevent;
    clEnqueueMarkerWithWaitList(*queue, 0, 0, &clevent);
    coclevent->event = clevent;
    return 0;
}

size_t cuEventQuery(CoclEvent coclevent) {
    cout << "cuEventQuery redirected" << endl;
    cl_int res;
    cl_int err = clGetEventInfo (
        coclevent->event,
        CL_EVENT_COMMAND_EXECUTION_STATUS,
        sizeof(cl_int),
        &res,
        0);
    cout << "clGetEventInfo: " << res << endl;
    cl->checkError(err);
    if(res == CL_COMPLETE) { // success
        return 0;
    } else if(res > 0) { // not finished yet
        return 34;
    } else { // error
        return 1;
    }
}

size_t cuEventDestroy_v2(CoclEvent event) {
    cout << "cuEventDestroy redirected" << endl;
    delete event;
    return 0;
}
