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

typedef int *PretendContext;

extern "C" {
    size_t cuCtxSynchronize(void);
    size_t cuCtxCreate_v2(PretendContext *context, unsigned int flags, void *device);
    size_t cuCtxGetCurrent(PretendContext *context);
    size_t cuCtxSetCurrent(PretendContext context);
}

size_t cuCtxSynchronize(void) {
    cout << "cuCtxSynchronize redirected" << endl;
    cl->finish();
    return 0;
}

vector<int> pretendcontexts;

PretendContext currentpretendcontext = 0;

size_t cuCtxGetCurrent(PretendContext *context) {
    cout << "cuCtxGetCurrent redirected" << endl;
    *context = currentpretendcontext;
    return 0;
}

size_t cuCtxSetCurrent(PretendContext context) {
    cout << "cuCtxSetCurrent redirected" << endl;
    currentpretendcontext = context;
    return 0;
}

size_t cuCtxCreate_v2 (PretendContext *context, unsigned int flags, void *device) {
    cout << "cuCtxCreate_v2 redirected" << endl;
    // *(int *)new_context = 0;
    pretendcontexts.push_back(1);
    PretendContext newcontext = &pretendcontexts[pretendcontexts.size() - 1];
    currentpretendcontext = newcontext;
    *context = newcontext;
    return 0;
}
