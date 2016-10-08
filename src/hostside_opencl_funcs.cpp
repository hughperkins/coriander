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

#include "EasyCL.h"

#include "CL/cl.h"

using namespace std;

static size_t grid[3];
static size_t block[3];
static unique_ptr<CLKernel> kernel;

static EasyCL *cl; // not ours

void hostside_opencl_funcs_setCl(EasyCL *cl) {
    ::cl = cl;
}

extern "C" {
    size_t cudaMalloc(void **p_mem, size_t N);
    size_t cudaFree(void *mem);
}

size_t cudaMalloc(void **p_mem, size_t N) {
    cout << "cudamalloc" << endl;
    return 0;
}

size_t cudaFree(void *mem) {
    cout << "cudafree" << endl;
    return 0;
}

void configureKernel(
        const char *kernelName,
        int grid_x, int grid_y, int grid_z,
        int block_x, int block_y, int block_z) {
    // just a mock for now... can we call this from our modified ir?
    cout << "configureKernel(" << kernelName << ")" << endl;
    cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl;
    cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl;
    grid[0] = grid_x;
    grid[1] = grid_y;
    grid[2] = grid_z;
    block[0] = block_x;
    block[1] = block_y;
    block[2] = block_z;
    // lets just read the kernel from file for now, with hardcoded filename
    // kernel.reset(buildKernelFromString("", kernelName, "", "internal"));
    kernel.reset(cl->buildKernel("test/generated/testcudakernel1-device.cl", kernelName, ""));
}

void setKernelArgFloatStar(float *clmem_as_floatstar) {
    cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    cout << "setKernelArgFloatStar" << endl;
    kernel->inout(p_mem);
}

void setKernelArgInt(int value) {
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    cout << "setkernelargint " << value << endl;
    kernel->in(value);
}

void setKernelArgFloat(float value) {
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    cout << "setkernelargfloat " << value << endl;
    kernel->in(value);
}

void kernelGo() {
    size_t global[3];
    for(int i = 0; i < 3; i++) {
        global[i] = grid[i] * block[i];
    }
    cout << "launching kernel..." << endl;
    kernel->run(3, global, block);
    cout << ".. kernel finished" << endl;
}
