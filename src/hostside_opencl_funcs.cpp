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
static vector<cl_mem> kernelArgsToBeReleased;
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

struct cudaDeviceProp {
    char name[256];
    size_t totalGlobalMem;
    size_t sharedMemPerBlock;
    int regsPerBlock;
    int warpSize;
    size_t memPitch;
    int maxThreadsPerBlock;
    int maxThreadsDim[3];
    int maxGridSize[3];
    size_t totalConstMem;
    int major;
    int minor;
    int clockRate;
    size_t textureAlignment;
    int deviceOverlap;
    int multiProcessorCount;
    int kernelExecTimeoutEnabled;
    int integrated;
    int canMapHostMemory;
    int computeMode;
    int concurrentKernels;
    int ECCEnabled;
    int pciBusID;
    int pciDeviceID;
    int tccDriver;
};

extern "C" {
    size_t cudaMalloc(void **p_mem, size_t N);
    size_t cudaFree(void *mem);
    size_t cudaMemcpy(void *dst, const void *, size_t, size_t cudaMemcpyKind);
    size_t cudaSetDevice (int device);
    size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, int device);
    size_t cudaMemsetAsync(void *devPtr, int value, size_t count, void *stream = 0);
    const char *cudaGetErrorString (size_t error);
    size_t cudaGetDevice (int *device);
    size_t cudaGetDeviceCount (int *count);
    size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t kind, void *stream = 0);
    size_t cudaStreamSynchronize(void *stream);
    size_t cudaGetLastError();
}

size_t cudaGetLastError() {
    cout << "cudaGetLastError" << endl;
    return 0;
}

size_t cudaStreamSynchronize(void *stream) {
    cout << "cudaStreamSynchronize stream=" << stream << endl;
    cl->finish();
    return 0;
}

size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t kind, void *stream) {
    cout << "cudaMemcpyAsync count=" << count << " kind=" << kind << " stream=" << stream << endl;
    return 0;
}

const char *cudaGetErrorString (size_t error) {
    cout << "cudaGetErrorString error=" << error << endl;
    return "all was ok?";
}

size_t cudaGetDevice (int *device) {
    cout << "cudaGetDevice" << endl;
    *device = 0;
    return 0;
}

size_t cudaGetDeviceCount (int *count) {
    cout << "cudaGetDeviceCount" << endl;
    *count = 1;
    return 0;
}

size_t cudaMemsetAsync(void *devPtr, int value, size_t count, void *stream) {
    cout << "cudaMemsetAsync stub value=" << value << " count=" << count << " stream=" << stream << endl;
    return 0;
}

size_t cudaSetDevice (int device) {
    cout << "cudaSetDevice stub device=" << device << endl;
    return 0;
}

    char name[256];
    size_t totalGlobalMem;
    size_t sharedMemPerBlock;
    int regsPerBlock;
    int warpSize;
    size_t memPitch;
    int maxThreadsPerBlock;
    int maxThreadsDim[3];
    int maxGridSize[3];
    size_t totalConstMem;
    int major;
    int minor;
    int clockRate;
    size_t textureAlignment;
    int deviceOverlap;
    int multiProcessorCount;
    int kernelExecTimeoutEnabled;
    int integrated;
    int canMapHostMemory;
    int computeMode;
    int concurrentKernels;
    int ECCEnabled;
    int pciBusID;
    int pciDeviceID;
    int tccDriver;

size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, int device) {
    cout << "cudaGetDeviceProperties stub device=" << device << endl;
    prop->totalGlobalMem = 1024 * 1024 * 1024;
    prop->sharedMemPerBlock = 65536;
    prop->regsPerBlock = 64;
    prop->warpSize = 32;
    prop->memPitch = 4; // whats this?
    prop->maxThreadsPerBlock = 128;
    prop->maxThreadsDim[0] = 1024;
    prop->maxThreadsDim[1] = 1024;
    prop->maxThreadsDim[2] = 1024;
    prop->totalConstMem = 16 * 1024;
    prop->major = 3;
    prop->minor = 0;
    prop->clockRate = 900 * 1000 * 1000;
    prop->textureAlignment = 128;  // whats this?
    prop->deviceOverlap = 0; // whats this?
    prop->multiProcessorCount = 3;
    prop->kernelExecTimeoutEnabled = true;
    prop->integrated = true;
    prop->canMapHostMemory = false;
    prop->computeMode = 0;  //whats this?
    prop->concurrentKernels = 1;
    prop->ECCEnabled = false;
    prop->pciBusID = 0;
    prop->pciDeviceID = 0;
    prop->tccDriver = 0; // no idea
    return 0;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, size_t cudaMemcpyKind) {
    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << bytes << endl;
    if(cudaMemcpyKind == 2) {
        // device => host
        int srcidx = idxByAddr[(void *)src];
        cl_mem srcclmem = clmems[srcidx];
        err = clEnqueueReadBuffer(*queue, srcclmem, CL_TRUE, 0,
                                         bytes, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == 1) {
        // host => device
        int dstidx = idxByAddr[(void *)dst];
        cl_mem dstclmem = clmems[dstidx];
        err = clEnqueueWriteBuffer(*queue, dstclmem, CL_TRUE, 0,
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
        unsigned long long grid_xy, unsigned int grid_z,
        unsigned long long block_xy, unsigned int block_z) {
    assure_initialized();
    cout << "configureKernel(" << kernelName << ")" << endl;
    cout << "grid_xy " << grid_xy << " grid_z " << grid_z << endl;
    cout << "block_xy " << block_xy << " grid_z " << block_z << endl;
    int grid_x = 0; // placeholders
    int grid_y = 0;
    int block_x = 0; // placeholders
    int block_y = 0;
    cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl;
    cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl;
    grid[0] = grid_x;
    grid[1] = grid_y;
    grid[2] = grid_z;
    block[0] = block_x;
    block[1] = block_y;
    block[2] = block_z;
    kernel.reset(cl->buildKernelFromString(clSourcecodeString, kernelName, "", "__internal__"));
}

void setKernelArgStruct(char *pCpuStruct, int structAllocateSize) {
    // we're going to:
    // allocate a cl_mem for the struct
    // copy the cpu struct to the cl_mem
    // pass the cl_mem into the kernel

    // we should also:
    // deallocate the cl_mem after calling the kernel
    // (we assume hte struct is passed by-value, so we dont have to actually copy it back afterwards)
    cout << "setKernelArgStruct structsize=" << structAllocateSize << endl;
    // int idx = 
    cl_mem gpu_struct = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, structAllocateSize,
                                           NULL, &err);
    cl->checkError(err);
    err = clEnqueueWriteBuffer(*queue, gpu_struct, CL_TRUE, 0,
                                      structAllocateSize, pCpuStruct, 0, NULL, NULL);
    cl->checkError(err);
    kernelArgsToBeReleased.push_back(gpu_struct);
    kernel->inout(&kernelArgsToBeReleased[kernelArgsToBeReleased.size() - 1]);
}

void setKernelArgFloatStar(float *clmem_as_floatstar) {
    cout << "setKernelArgFloatStar" << endl;
    cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    // cout << "setKernelArgFloatStar" << endl;
    kernel->inout(p_mem);
}

// void setKernelArgCharStar(char *clmem_as_charstar) {
//     cout << "setKernelArgCharStar" << endl;
//     cl_mem *p_mem = (cl_mem *)clmem_as_charstar;
//     // cout << "setKernelArgFloatStar" << endl;
//     kernel->inout(p_mem);
// }

void setKernelArgStruct() {
    cout << "setKernelArgStruct" << endl;
    // cl_mem *p_mem = (cl_mem *)clmem_as_charstar;
    // cout << "setKernelArgFloatStar" << endl;
    // kernel->inout(p_mem);
}

void setKernelArgInt64(int64_t value) {
    cout << "setKernelArgInt64 " << value << endl;
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    // cout << "setkernelargint " << value << endl;
    kernel->in(value);
}

void setKernelArgInt32(int value) {
    cout << "setKernelArgInt32 " << value << endl;
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    // cout << "setkernelargint " << value << endl;
    kernel->in(value);
}

void setKernelArgFloat(float value) {
    cout << "setKernelArgFloat " << value << endl;
    // cout << "setkernelargfloat " << value << endl;
    kernel->in(value);
}

void kernelGo() {
    cout << "kernelGo " << endl;
    size_t global[3];
    for(int i = 0; i < 3; i++) {
        global[i] = grid[i] * block[i];
    }
    // cout << "launching kernel, using OpenCL..." << endl;
    kernel->run(3, global, block);
    // cout << ".. kernel finished" << endl;
    for(auto it=kernelArgsToBeReleased.begin(); it != kernelArgsToBeReleased.end(); it++) {
        cl_mem memObject = *it;
        err = clReleaseMemObject(memObject);
        cl->checkError(err);
    }
    kernelArgsToBeReleased.clear();
}
