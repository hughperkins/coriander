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

// #include <iostream>
#include <memory>
// #include <vector>
// #include <map>
// #include <set>

#include "EasyCL.h"

// #include "CL/cl.h"

#include "cocl/cocl_defs.h"

namespace easycl {
    class CLKernel;
    class EasyCL;
}

namespace cocl {
    class CoclStream;

    int getNumCachedKernels(); // this should be per-context or something, though right now, it is not yet
    int getNumKernelCalls();
}

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
}

extern "C" {
    void configureKernel(
        const char *kernelName, const char *llsourcecode, const char *clSourcecodeString);

    size_t cuInit(unsigned int flags);
}
