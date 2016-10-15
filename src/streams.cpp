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

extern "C" {
    size_t cudaStreamSynchronize(void *stream);
    size_t cuStreamCreate(void *stream, unsigned int flags);
    size_t cuStreamDestroy_v2(void *stream);
}

size_t cudaStreamSynchronize(void *stream) {
    cout << "cudaStreamSynchronize stream=" << stream << endl;

    assert(stream == 0);

    cl->finish();
    return 0;
}

size_t cuStreamCreate(void *stream, unsigned int flags) {
    cout << "cuStreamCreate redirected" << endl;
    // lets just say we cant create streams for now?
    return 1;
}

size_t cuStreamDestroy_v2(void *stream) {
    cout << "cuStreamDestroy_v2 redirected" << endl;
    return 1;
}
