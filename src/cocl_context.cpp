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

namespace cocl {
    class Context {
    public:
        Context() {
            cout << "Context " << this << endl;
        }
        ~Context() {
            cout << "~Context() " << this << endl;
        }
    };
    typedef Context *PContext;

    Context *currentContext = 0;
}

extern "C" {
    size_t cuCtxSynchronize(void);
    size_t cuCtxCreate_v2(PContext *context, unsigned int flags, void *device);
    size_t cuCtxGetCurrent(PContext *context);
    size_t cuCtxSetCurrent(PContext context);
}

size_t cuCtxSynchronize(void) {
    cout << "cuCtxSynchronize redirected" << endl;
    cl->finish();
    return 0;
}

size_t cuCtxGetCurrent(PContext *ppContext) {
    // cout << "cuCtxGetCurrent redirected" << endl;
    *ppContext = currentContext;
    return 0;
}

size_t cuCtxSetCurrent(PContext pContext) {
    cout << "cuCtxSetCurrent redirected" << endl;
    currentContext = pContext;
    return 0;
}

size_t cuCtxCreate_v2 (PContext *ppContext, unsigned int flags, void *device) {
    cout << "cuCtxCreate_v2 redirected" << endl;
    Context *newContext = new Context();
    currentContext = newContext;
    *ppContext = newContext;
    return 0;
}
