// Copyright Hugh Perkins 2017

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
#include <sstream>

#include "gtest/gtest.h"

namespace {

TEST(test_shims, empty) {
    cocl::Shims shims;
    std::ostringstream oss;
    shims.writeCl(oss);
    std::cout << "actual: [" << oss.str() << "]" << std::endl;
    EXPECT_EQ("", oss.str());
}

TEST(test_shims, notexist) {
    cocl::Shims shims;
    bool threw = false;
    try {
        shims.use("asdfasdf");
    } catch(std::runtime_error &e) {
        threw = true;
    }
    EXPECT_TRUE(threw);
}

TEST(test_shims, shfl3) {
    cocl::Shims shims;
    shims.use("__shfl_down_3");
    std::ostringstream oss;
    shims.writeCl(oss);
    std::cout << "actual: [" << oss.str() << "]" << std::endl;
    EXPECT_EQ(R"(
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
)",
        oss.str());
}

TEST(test_shims, shfl2_deps) {
    cocl::Shims shims;
    shims.use("__shfl_down_2");
    std::ostringstream oss;
    shims.writeCl(oss);
    std::cout << "actual: [" << oss.str() << "]" << std::endl;
    EXPECT_EQ(R"(
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

inline float __shfl_down_2(local int *scratch, float v0, int v1) {
    return __shfl_down_3(scratch, v0, v1, 32);
}
)", oss.str());
}

TEST(test_shims, atomicadd_float) {
    cocl::Shims shims;
    shims.use("__atomic_add_float");
    std::ostringstream oss;
    shims.writeCl(oss);
    std::cout << "actual: [" << oss.str() << "]" << std::endl;
    EXPECT_EQ(R"(
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
)", oss.str());
}

TEST(test_shims, copyfrom) {
    cocl::Shims child;
    child.use("__shfl_down_2");

    cocl::Shims shims;
    shims.copyFrom(child);

    EXPECT_TRUE(shims.isUsed("__shfl_down_2"));
    EXPECT_TRUE(shims.isUsed("__shfl_down_3"));
    EXPECT_FALSE(shims.isUsed("asdsdf"));
}

} // anon namespace
