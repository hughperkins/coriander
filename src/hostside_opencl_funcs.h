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

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "EasyCL.h"

#include "CL/cl.h"

namespace cocl {
    extern size_t grid[3];
    extern size_t block[3];
    extern std::unique_ptr<easycl::CLKernel> kernel;

    extern std::unique_ptr<easycl::EasyCL> cl;
    extern cl_context *ctx;
    // extern cl_command_queue *queue;

    // extern std::vector<cl_mem> kernelArgsToBeReleased;
    // extern std::vector<cl_mem> kernelArgsToBeRemapped;
}

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
}

