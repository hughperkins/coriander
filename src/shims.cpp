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

#include "shims.h"

using namespace cocl;
using namespace std;

namespace cocl {

Shims::Shims() {
    _shimClByName["__shfl_down_3"] = R"(
inline float __shfl_down_3(local int *scratch, float v0, int v1, int v2) {
    // local float mem[1024];
    local float *mem = (local float *)scratch;
    int tid = get_local_id(0);
    int warpid = tid % 32;
    int warpstart = tid - warpid;
    mem[tid] = v0;
    //barrier(CLK_LOCAL_MEM_FENCE);
    int warpsrc = warpid + v1;
    warpsrc = warpsrc >= 32 ? warpid : warpsrc;
    return mem[warpstart + warpsrc];
}
)";

    _shimClByName["__shfl_down_2"] = R"(
inline float __shfl_down_2(local int *scratch, float v0, int v1) {
    return __shfl_down_3(scratch, v0, v1, 32);
}
)";
    _dependenciesByName["__shfl_down_2"].insert("__shfl_down_3");

    // should we add __atomic_add?  If we are really calling this (not just pasting it into the code 'for fun'),
    // then this will fail anyway...
    // inline float __atomic_add(global volatile float *ptr, float val) { // we need to actually implement this
    //     return 555;
    // }
}

std::string Shims::getClByName(std::string name) {
    return _shimClByName[name];
}

std::set<std::string> Shims::getDependenciesByName(std::string name) {
    return _dependenciesByName[name];
}

} // namespace cocl
