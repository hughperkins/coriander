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

#include "fill_buffer.h"

#include "cocl/hostside_opencl_funcs.h"

#include "EasyCL/EasyCL.h"

#include <iostream>
#include <string>

namespace cocl {

static std::string get_enqueueFillBuffer_sourcecode();

inline int getNumThreads() {
  // int blockSize = 1024;
  // int maxWorkgroupSize = ((easycl::DeviceInfo *)state->deviceInfoByDevice[state->currentDevice])->maxWorkGroupSize;
  // if( blockSize > maxWorkgroupSize ) {
  //   blockSize = maxWorkgroupSize;
  // }
  // return blockSize;
    return 256; // just hardcode to 256 for now, which covers amd, intel, nvidia, just not always most efficiently, but
                // kind of ok
}

// CL: number of blocks for threads.
inline int GET_BLOCKS(const int N) {
  return (N + getNumThreads() - 1) / getNumThreads();
}

int myEnqueueFillBuffer(
    cl_command_queue queue,
    cl_mem clmem,
    unsigned int value,
    int offsetBytes, int countInts) {

    easycl::CLKernel *kernel = compileOpenCLKernel("enqueueFillBuffer", get_enqueueFillBuffer_sourcecode());

    kernel->inout(&clmem);
    kernel->in((int32_t)(offsetBytes >> 2));

    kernel->in((int32_t)countInts);
    kernel->in(value);

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(countInts) * workgroupSize;
    kernel->run_1d(&queue, globalSize, workgroupSize);
    return 0;
}

// this shouldnt be necessary, since clEnqueueFillBuffer should do this, but
// clEnqueueFillBuffer fails for me on Radeon Pro 450, eg see
// http://stackoverflow.com/questions/38556710/clenqueuefillbuffer-fills-a-buffer-correctly-only-at-random/43727913#43727913
std::string get_enqueueFillBuffer_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

kernel void enqueueFillBuffer(
        global unsigned int *target_data, const int target_offset,
        const int N,
        unsigned int value) {
    global unsigned int *target = target_data + target_offset;
  CL_KERNEL_LOOP(n, N) {
    if(n < N) {
        target[n] = value;
    }
  }
}
)";
}

} // namespace cocl
