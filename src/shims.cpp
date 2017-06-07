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

#include <iostream>

// using namespace cocl;
// using namespace std;

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

    // note to self: just realized, umulhi is actually available in opencl 1.2 :-)
    // so, we should migrate this to use that, probably
    _shimClByName["__umulhi"] = R"(
inline unsigned int __umulhi(unsigned int v0, unsigned int v1) {
    unsigned long res = (unsigned long)v0 * v1;
    unsigned int res2 = res >> 32;
    return res2;
}
)";

// this code is from http://suhorukov.blogspot.co.uk/2011/12/opencl-11-atomic-operations-on-floating.html
    _shimClByName["__atomic_add_float"] = R"(
inline float __atomic_add_float(volatile __global float *source, const float operand) {
    union {
        unsigned int intVal;
        float floatVal;
    } newVal;
    union {
        unsigned int intVal;
        float floatVal;
    } prevVal;
    do {
        prevVal.floatVal = *source;
        newVal.floatVal = prevVal.floatVal + operand;
    } while (atomic_cmpxchg((volatile __global unsigned int *)source, prevVal.intVal, newVal.intVal) != prevVal.intVal);
    return prevVal.floatVal;
}
)";

    _shimClByName["__atomic_inc_uint"] = R"(
inline unsigned int __atomic_inc_uint(volatile __global int *data, const unsigned int old) {
    unsigned int prevVal;
    unsigned int newVal;
    while(true) {
        prevVal = *data;
        newVal = prevVal >= old ? 0 : prevVal + 1;
        unsigned int res = atomic_cmpxchg((volatile __global unsigned int *)data, prevVal, newVal);
        if(res == prevVal) {
            break;
        }
    }
    return prevVal;
}
)";
}

void Shims::use(std::string name) {
    if(_shimClByName.find(name) == _shimClByName.end()) {
        std::cout << "shim " << name << " does not exist.  This is a bug in Coriander" << std::endl;
        throw std::runtime_error("shim " + name + " does not exist. This is a bug in Coriander");
    }
    shimsToBeUsed.insert(name);
    if(_dependenciesByName.find(name) != _dependenciesByName.end()) {
        const std::set<std::string> &deps = _dependenciesByName[name];
        for(auto it=deps.begin(); it != deps.end(); it++) {
            shimsToBeUsed.insert(*it);
        }
    }
}

void Shims::writeCl(std::ostream &os) {
    std::set<std::string> written;
    int attempts = 0;
    while(written.size() < shimsToBeUsed.size() && attempts < 10) {
        for(auto it=shimsToBeUsed.begin(); it != shimsToBeUsed.end(); it++) {
            std::string shimName = *it;
            if(written.find(shimName) != written.end()) {
                continue;
            }
            bool writtenDependencies = true;
            // check written dependencies
            const std::set<std::string> &deps = _dependenciesByName[shimName];
            for(auto childit=deps.begin(); childit != deps.end(); childit++) {
                std::string childName = *childit;
                if(written.find(childName) == written.end()) {
                    writtenDependencies = false;
                    break;
                }
            }
            if(writtenDependencies) {
                os << _shimClByName[shimName];
                written.insert(shimName);
            }
        }
        attempts++;
    }
    if(written.size() < shimsToBeUsed.size()) {
        for(auto it=written.begin(); it != written.end(); it++) {
            std::cout << "wrote " << *it << " ok" << std::endl;
        }
        std::cout << std::endl;
        std::cout << "ERROR: Failed to write shims. This is a Coriander bug. Please log at https://github.com/hughperkins/coriander/issues" << std::endl;
        std::cout << std::endl;
        throw std::runtime_error("Failed to write shims");
    }
}

void Shims::copyFrom(const Shims &source) {
    for(auto it=source.shimsToBeUsed.begin(); it != source.shimsToBeUsed.end(); it++) {
        // shimsToBeUsed.insert(*it);
    }
    shimsToBeUsed.insert(source.shimsToBeUsed.begin(), source.shimsToBeUsed.end());
}

bool Shims::isUsed(std::string name) {
    return shimsToBeUsed.find(name) != shimsToBeUsed.end();
}


// std::string Shims::getClByName(std::string name) {
//     return _shimClByName[name];
// }

// std::set<std::string> Shims::getDependenciesByName(std::string name) {
//     return _dependenciesByName[name];
// }

} // namespace cocl
