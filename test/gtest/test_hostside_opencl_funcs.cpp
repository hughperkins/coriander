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

#include "cocl/hostside_opencl_funcs.h"

#include "cocl/cocl.h"
#include "EasyCL/EasyCL.h"

#include <iostream>
#include <memory>

#include "gtest/gtest.h"

using namespace std;
using namespace cocl;
using namespace easycl;

namespace {

TEST(test_hostside_opencl_funcs, test_create_cl_kernel) {
    string kernelSource = R"(
kernel void myKernel(global float *data) {
    data[0] = 123.0f;
}
)";
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    CLKernel *kernel1 = getKernelForNameCl("myKernel", kernelSource);
    CLKernel *kernel2 = getKernelForNameCl("myKernel", kernelSource);
    CLKernel *kernel3 = getKernelForNameCl("myKernel", kernelSource);
    EXPECT_EQ(kernel1, kernel2);
    EXPECT_EQ(kernel1, kernel3);

    const int N = 1024;
    Memory *memory = Memory::newDeviceAlloc(N * sizeof(float));
    kernel1->inout(&memory->clmem);
    kernel1->run_1d(32, 32);
    float *hostdata = new float[N];
    cl_int err;
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, memory->clmem, CL_TRUE, 0,
                                     N * sizeof(float), hostdata, 0, NULL, NULL);
    EasyCL::checkError(err);
    cout << "hostdata[0] " << hostdata[0] << endl;
    EXPECT_EQ(123.0f, hostdata[0]);
    delete [] hostdata;
}

} // namespace
