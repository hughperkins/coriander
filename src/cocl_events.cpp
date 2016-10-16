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

using namespace std;
using namespace cocl;
using namespace easycl;

namespace cocl {
    Event::Event() {
        cout << "Event()" << endl;
    }
    Event::~Event() {
        cout << "~Event()" << endl;
        if(event != 0) {
            clReleaseEvent(event);
        }
    }
}

extern "C" {
    size_t cuEventCreate(Event **pevent, unsigned int flags);
    size_t cuEventSynchronize(Event *event);
    size_t cuEventRecord(Event *event);
    size_t cuEventQuery(Event *event);
    size_t cuEventDestroy_v2(Event *event);
}

size_t cuEventCreate(Event **pevent, unsigned int flags) {
    Event *event = new Event();
    *pevent = event;
    cout << "cuEventCreate redirected flags=" << flags << " new event=" << event << endl;
    return 0;
}

size_t cuEventSynchronize(Event *event) {
    cout << "cuEventSynchronize redirected event=" << event << endl;
    cl_int err = clWaitForEvents(1, &event->event);
    cl->checkError(err);
    return 0;
}

size_t cuEventRecord(Event *event) {
    cout << "cuEventRecord redirected event=" << event << endl;
    cl_event clevent;
    clEnqueueMarkerWithWaitList(*queue, 0, 0, &clevent);
    event->event = clevent;
    return 0;
}

size_t cuEventQuery(Event *event) {
    cout << "cuEventQuery redirected event=" << event << endl;
    cl_int res;
    cl_int err = clGetEventInfo (
        event->event,
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

size_t cuEventDestroy_v2(Event *event) {
    cout << "cuEventDestroy redirected event=" << event << endl;
    delete event;
    return 0;
}
