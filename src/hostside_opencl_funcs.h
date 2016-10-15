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
    extern std::unique_ptr<CLKernel> kernel;

    extern std::unique_ptr<EasyCL> cl;
    extern cl_context *ctx;
    extern cl_command_queue *queue;
    extern cl_int err;

    // static vector<cl_mem> clmems;
    extern int nextIdx;
    extern std::map<int, cl_mem> clmemByIdx;  // seems like we could just merge these two maps :-P
    extern std::map<void *, int> idxByAddr;
    extern std::map<cl_mem, int> sizeByClmem;  // for mapped buffers mostly, ofr now

    extern std::set<cl_mem> clmemNeedsMap;

    extern std::vector<cl_mem> kernelArgsToBeReleased;
    extern std::vector<cl_mem> kernelArgsToBeRemapped;

    extern bool initialized;

    static inline cl_mem *voidStarToClmem(void *voidStar) {
        int idx = idxByAddr[voidStar];
        return &clmemByIdx[idx];
    }
}

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
}

