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

#include "EasyCL.h"

#include "CL/cl.h"

using namespace std;

static size_t grid[3];
static size_t block[3];
static unique_ptr<CLKernel> kernel;

unique_ptr<EasyCL> cl;
static cl_context *ctx;
static cl_command_queue *queue;
static cl_int err;

static vector<cl_mem> clmems;
static map<void *, int> idxByAddr;

static bool initialized = false;

void hostside_opencl_funcs_init() {
    cout << "initialize cl context" << endl;
    cl.reset(EasyCL::createForFirstGpuOtherwiseCpu());
    ctx = cl->context;
    queue = cl->queue;
}

void assure_initialized() {
    // yes this is not threadsafe.  or anything safe really...
    if(!initialized) {
        hostside_opencl_funcs_init();
        initialized = true;
    }
}

extern "C" {
    size_t cudaMalloc(void **p_mem, size_t N);
    size_t cudaFree(void *mem);
    size_t cudaMemcpy(void *dst, const void *, size_t, size_t cudaMemcpyKind);
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, size_t cudaMemcpyKind) {
    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << endl;
    if(cudaMemcpyKind == 2) {
        // device => host
        err = clEnqueueReadBuffer(*queue, *(cl_mem*)src, CL_TRUE, 0,
                                         bytes, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == 1) {
        // host => device
        err = clEnqueueWriteBuffer(*queue, *(cl_mem*)dst, CL_TRUE, 0,
                                          bytes, src, 0, NULL, NULL);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }
    return 0;
}

size_t cudaMalloc(void **p_mem, size_t N) {
    assure_initialized();
    cout << "cudaMalloc using cl, size " << N << endl;
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, N,
                                           NULL, &err);
    cl->checkError(err);
    clmems.push_back(float_data_gpu);
    int idx = clmems.size() - 1;
    *p_mem = (float *)&clmems[idx];
    idxByAddr[*p_mem] = idx;
    cout << "clmems.size() " << clmems.size() << " ptr " << *p_mem << endl;

    return 0;
}

size_t cudaFree(void *mem) {
    // for(int i = 0 ; i < clmems.size(); i++) {
    //     cout << "cuda free i " << i << " " << &clmems[i] << endl;
    //     // err = clReleaseMemObject(clmems[i]);
    //     // cl->checkError(err);
    // }
    // err = clReleaseMemObject(*(cl_mem *)(*p_mem));
    // cl->checkError(err);

    int idx = idxByAddr[mem];

    cout << "cudafree using opencl idx " << idx << endl;
    err = clReleaseMemObject(clmems[idx]);
    // err = clReleaseMemObject(*(cl_mem *)mem);
    cl->checkError(err);
    return 0;
}

void configureKernel(
        const char *kernelName, const char *clSourcecodeString,
        int grid_x, int grid_y, int grid_z,
        int block_x, int block_y, int block_z) {
    assure_initialized();
    // just a mock for now... can we call this from our modified ir?
    // cout << "configureKernel(" << kernelName << ")" << endl;
    // cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl;
    // cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl;
    grid[0] = grid_x;
    grid[1] = grid_y;
    grid[2] = grid_z;
    block[0] = block_x;
    block[1] = block_y;
    block[2] = block_z;
    kernel.reset(cl->buildKernelFromString(clSourcecodeString, kernelName, "", "__internal__"));
}

void setKernelArgFloatStar(float *clmem_as_floatstar) {
    cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    // cout << "setKernelArgFloatStar" << endl;
    kernel->inout(p_mem);
}

void setKernelArgInt(int value) {
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    // cout << "setkernelargint " << value << endl;
    kernel->in(value);
}

void setKernelArgFloat(float value) {
    // cout << "setkernelargfloat " << value << endl;
    kernel->in(value);
}

void kernelGo() {
    size_t global[3];
    for(int i = 0; i < 3; i++) {
        global[i] = grid[i] * block[i];
    }
    // cout << "launching kernel, using OpenCL..." << endl;
    kernel->run(3, global, block);
    // cout << ".. kernel finished" << endl;
}
