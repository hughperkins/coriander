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

using namespace std;

static size_t grid[3];
static size_t block[3];
static unique_ptr<CLKernel> kernel;

unique_ptr<EasyCL> cl;
static cl_context *ctx;
static cl_command_queue *queue;
static cl_int err;

// static vector<cl_mem> clmems;
static int nextIdx = 0;
static map<int, cl_mem> clmemByIdx;  // seems like we could just merge these two maps :-P
static map<void *, int> idxByAddr;
static map<cl_mem, int> sizeByClmem;  // for mapped buffers mostly, ofr now

static set<cl_mem> clmemNeedsMap;

static vector<cl_mem> kernelArgsToBeReleased;
static vector<cl_mem> kernelArgsToBeRemapped;

static bool initialized = false;

extern "C" {
    void hostside_opencl_funcs_assure_initialized(void);
}

EasyCL *hostside_opencl_funcs_getCl() {
    return cl.get();
}

cl_context *hostside_opencl_funcs_getContext() {
    return ctx;
}


cl_command_queue *hostside_opencl_funcs_getQueue() {
    return queue;
}

map<int, cl_mem> &hostside_opencl_funcs_getclmemByIdx() {
    return clmemByIdx;
}

map<void *, int> &hostside_opencl_funcs_getIdxByAddr() {
    return idxByAddr;
}

int hostside_opencl_funcs_getNextIdx() {
    return nextIdx;
}

void hostside_opencl_funcs_setNextIdx(int _nextIdx) {
    nextIdx = _nextIdx;
}

set<cl_mem> &hostside_opencl_funcs_getclmemNeedsMap() {
    return clmemNeedsMap;
}

vector<cl_mem> &hostside_opencl_funcs_kernelArgsToBeReleased() {
    return kernelArgsToBeReleased;
}
vector<cl_mem> &hostside_opencl_funcs_kernelArgsToBeRemapped() {
    return kernelArgsToBeRemapped;
}


void hostside_opencl_funcs_init() {
    cout << "initialize cl context" << endl;
    cl.reset(EasyCL::createForFirstGpuOtherwiseCpu());
    ctx = cl->context;
    queue = cl->queue;
}

void hostside_opencl_funcs_assure_initialized(void) {
    // yes this is not threadsafe.  or anything safe really...
    if(!initialized) {
        hostside_opencl_funcs_init();
        initialized = true;
    }
}

static inline cl_mem *voidStarToClmem(void *voidStar) {
    int idx = idxByAddr[voidStar];
    return &clmemByIdx[idx];
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

typedef int *PretendContext;

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
    size_t cudaConfigureCall(
        unsigned long long grid_xy, unsigned int grid_z,
        unsigned long long block_xy, unsigned int block_z, size_t sharedMem=0, void *stream=0);
    void configureKernel(
        const char *kernelName, const char *clSourcecodeString);

    /*
    cuDeviceCanAccessPeer
    cuOccupancyMaxActiveBlocksP
    */


    size_t cuInit(unsigned int flags);
    size_t cuCtxSynchronize(void);
    size_t cuDeviceGetCount(int *count);
    size_t cuDeviceGet (void *device, int ordinal);
    size_t cuCtxCreate_v2(PretendContext *context, unsigned int flags, void *device);
    size_t cuCtxGetCurrent(PretendContext *context);
    size_t cuCtxSetCurrent(PretendContext context);
    size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, void *device);
    size_t cuDriverGetVersion(int *driver_version);
    size_t cuDeviceGetPCIBusId(char *buf, int bufsize, void *device);
    size_t cuDeviceGetName(char *buf, int bufsize, void *device);
    size_t cuDeviceTotalMem_v2(uint64_t *value, void *device);
    size_t cuDeviceGetAttribute(
       int64_t *value, int attribute, void *device);
    size_t cuDeviceGetProperties(struct cudaDeviceProp *device_properties, int device_ordinal);
    size_t cuMemGetInfo_v2(size_t *free, size_t *total);
    size_t cuMemAlloc_v2(void **mem, size_t bytes);
    size_t cuMemFree_v2(void *mem);
    size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count);
    size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count);
    size_t cuMemHostAlloc(void **mem, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE);
    size_t cuMemFreeHost(void *mem);
}

// enum constants from http://docs.nvidia.com/cuda/cuda-driver-api/group__CUDA__TYPES.html#axzz4N4NYrYWt
const int CU_DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK = 8;
const int CU_DEVICE_ATTRIBUTE_ECC_ENABLED = 32;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_X = 5;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y = 6;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z = 7;
const int CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR = 81;
const int CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT = 16;
const int CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR = 39;
const int CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK = 12;
const int CU_DEVICE_ATTRIBUTE_WARP_SIZE = 10;

size_t cuMemHostAlloc(void **p_mem, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE) {
    cout << "cuMemHostAlloc redirected bytes=" << bytes << endl;
    hostside_opencl_funcs_assure_initialized();
    cout << "cuMemHostAlloc using cl, size " << bytes << endl;
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_ALLOC_HOST_PTR, bytes,
                                           NULL, &err);
    cl->checkError(err);
    int idx = nextIdx;
    nextIdx++;
    clmemByIdx[idx] = float_data_gpu;
    // clmems.push_back(float_data_gpu);
    // int idx = clmems.size() - 1;
    // *p_mem = (float *)&clmems[idx];

    *p_mem = clEnqueueMapBuffer (*queue,
        float_data_gpu,
        CL_FALSE,
        CL_MAP_READ | CL_MAP_WRITE,
        0,
        bytes,
        0,
        0,
        0,
        &err
    );
    cl->checkError(err);
    cout << "cuMemHostAlloc after map: " << *p_mem << endl;

    idxByAddr[*p_mem] = idx;
    cout << "ptr " << *p_mem << " idx=" << idx << endl;
    clmemNeedsMap.insert(float_data_gpu);
    sizeByClmem[float_data_gpu] = bytes;

    // CL_MEM_ALLOC_HOST_PTR ?
    return 0;
}

size_t cuCtxSynchronize(void) {
    cout << "cuCtxSynchronize redirected" << endl;
    cl->finish();
    return 0;
}

size_t cuMemFreeHost(void *mem) {
    cout << "cuMemFreeHost redirected" << endl;
    return 0;
}

size_t cuMemGetInfo_v2(size_t *free, size_t *total) {
    cout << "cuMemGetInfo_v2 redirected" << endl;
    *free = 1024 * 1024;
    *total = 1024 * 1024;
    return 0;
}

size_t cuDeviceGetAttribute(
       int64_t *value, int attribute, void *device) {
    cout << "cuDeviceGetAttribute redirected" << endl;
    if(CU_DEVICE_ATTRIBUTE_ECC_ENABLED == attribute) {
        *value = 0;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_X == attribute) {
        *value = 1024;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y == attribute) {
        *value = 1024;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z == attribute) {
        *value = 1024;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR == attribute) {
        *value = 65536;
    } else if(CU_DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK == attribute) {
        *value = 65536;
    } else if(CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT == attribute) {
        *value = 16;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK == attribute) {
        *value = 64;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR == attribute) {
        *value = 128;
    } else if(CU_DEVICE_ATTRIBUTE_WARP_SIZE == attribute) {
        *value = 32;
    } else {
        cout << "attribute " << attribute << endl;
        throw runtime_error("attribute not implemented");
    }
    return 0;
}

size_t cuDeviceTotalMem_v2(uint64_t *value, void *device) {
    cout << "cuDeviceTotalMem_v2 redirected" << endl;
    *value = 1024 * 1024;
    return 0;
}

size_t cuDeviceGetName(char *buf, int bufsize, void *device) {
    cout << "cuDeviceGetName redirected" << endl;
    sprintf(buf, "an opencl device");
    return 0;
}

size_t cuDeviceGetPCIBusId(char *buf, int bufsize, void *device) {
    cout << "cuDeviceGetPCIBusId redirected" << endl;
    sprintf(buf, "0000.0000");
    return 0;
}

size_t cuDriverGetVersion(int *driver_version) {
    cout << "cuDriverGetVersion redirected" << endl;
    *driver_version = 1;
    return 0;
}

size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, void *device) {
    cout << "cuDeviceComputeCapability redirected" << endl;
    *cc_major = 3;
    *cc_minor = 5;
    return 0;
}

vector<int> pretendcontexts;

PretendContext currentpretendcontext = 0;

size_t cuCtxGetCurrent(PretendContext *context) {
    cout << "cuCtxGetCurrent redirected" << endl;
    *context = currentpretendcontext;
    return 0;
}

size_t cuCtxSetCurrent(PretendContext context) {
    cout << "cuCtxSetCurrent redirected" << endl;
    currentpretendcontext = context;
    return 0;
}

size_t cuCtxCreate_v2 (PretendContext *context, unsigned int flags, void *device) {
    cout << "cuCtxCreate_v2 redirected" << endl;
    // *(int *)new_context = 0;
    pretendcontexts.push_back(1);
    PretendContext newcontext = &pretendcontexts[pretendcontexts.size() - 1];
    currentpretendcontext = newcontext;
    *context = newcontext;
    return 0;
}

size_t cuDeviceGet (void *device, int ordinal) {
    cout << "cuDeviceGet redirected" << endl;
    *(int *)device = 0;
    return 0;
}

size_t cuDeviceGetCount (int *count) {
    return cudaGetDeviceCount(count);
}

size_t cuInit(unsigned int flags) {
    cout << "redirected cuInit()" << endl;
    hostside_opencl_funcs_assure_initialized();
    return 0;
}

size_t cudaGetLastError() {
    cout << "cudaGetLastError" << endl;
    return 0;
}

size_t cudaStreamSynchronize(void *stream) {
    cout << "cudaStreamSynchronize stream=" << stream << endl;

    assert(stream == 0);

    cl->finish();
    return 0;
}

size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t cudaMemcpyKind, void *stream) {
    cout << "cudaMemcpyAsync count=" << count << " cudaMemcpyKind=" << cudaMemcpyKind << " stream=" << stream << endl;

    assert(stream == 0);

    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << count << endl;
    if(cudaMemcpyKind == 2) {
        // device => host
        int srcidx = idxByAddr[(void *)src];
        cl_mem srcclmem = clmemByIdx[srcidx];
        err = clEnqueueReadBuffer(*queue, srcclmem, CL_TRUE, 0,
                                         count, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == 1) {
        // host => device
        int dstidx = idxByAddr[(void *)dst];
        cl_mem dstclmem = clmemByIdx[dstidx];
        err = clEnqueueWriteBuffer(*queue, dstclmem, CL_TRUE, 0,
                                          count, src, 0, NULL, NULL);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }

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
    assert(stream == 0);

    return 0;
}

size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count) {
    cout << "cuMemsetD8_v2 redirected value " << value << " count=" << count << endl;
    cl_int err = clEnqueueFillBuffer(*queue, *voidStarToClmem(location), &value, sizeof(unsigned char), 0, count * sizeof(unsigned char), 0, 0, 0);
    cl->checkError(err);
    return 0;
}

size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count) {
    cout << "cuMemsetD32_v2 redirected value " << value << " count=" << count << endl;
    cl_int err = clEnqueueFillBuffer(*queue, *voidStarToClmem(location), &value, sizeof(int), 0, count * sizeof(int), 0, 0, 0);
    cl->checkError(err);
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

size_t cuDeviceGetProperties(struct cudaDeviceProp *device_properties, int device_ordinal) {
    //return cudaGetDeviceProperties(device_properties, device_ordinal);
    return -1;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, size_t cudaMemcpyKind) {
    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << bytes << endl;
    if(cudaMemcpyKind == 2) {
        // device => host
        int srcidx = idxByAddr[(void *)src];
        cl_mem srcclmem = clmemByIdx[srcidx];
        err = clEnqueueReadBuffer(*queue, srcclmem, CL_TRUE, 0,
                                         bytes, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == 1) {
        // host => device
        int dstidx = idxByAddr[(void *)dst];
        cl_mem dstclmem = clmemByIdx[dstidx];
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
    hostside_opencl_funcs_assure_initialized();
    cout << "cudaMalloc using cl, size " << N << endl;
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, N,
                                           NULL, &err);
    cl->checkError(err);
    int idx = nextIdx;
    nextIdx++;
    clmemByIdx[idx] = float_data_gpu;
    // int idx = clmems.size() - 1;
    *p_mem = (float *)&clmemByIdx[idx];
    idxByAddr[*p_mem] = idx;
    cout << "ptr " << *p_mem << endl;

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
    err = clReleaseMemObject(clmemByIdx[idx]);
    // err = clReleaseMemObject(*(cl_mem *)mem);
    cl->checkError(err);
    return 0;
}

size_t cuMemAlloc_v2(void **mem, size_t bytes) {
    return cudaMalloc(mem, bytes);
}

size_t cuMemFree_v2(void *mem) {
    return cudaFree(mem);
}

// size_t cuMemsetD32_v2(void *location, int value, uint32 count) {
//     err = clEnqueueFillBuffer(*queue, location, &value, sizeof(int), 0, count * sizeof(int), 0, 0, 0);
// }

size_t cudaConfigureCall(
        unsigned long long grid_xy, unsigned int grid_z,
        unsigned long long block_xy, unsigned int block_z, size_t sharedMem, void *stream) {
    cout << "cudaConfigureCall" << endl;
    cout << "grid_xy " << grid_xy << " grid_z " << grid_z << endl;
    cout << "block_xy " << block_xy << " grid_z " << block_z << endl;
    int grid_x = grid_xy & ((1ul << 31) - 1);
    int grid_y = grid_xy >> 32;
    int block_x = block_xy & ((1ul << 31) - 1);
    int block_y = block_xy >> 32;
    cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl;
    cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl;
    grid[0] = grid_x;
    grid[1] = grid_y;
    grid[2] = grid_z;
    block[0] = block_x;
    block[1] = block_y;
    block[2] = block_z;
    return 0;
}

    // uint32_t block_x = block_xy & ((1ul << 31) - 1);
    // uint32_t block_y = block_xy >> 32;

void configureKernel(
        const char *kernelName, const char *clSourcecodeString) {
    // cout << "configureKernel (name=" << kernelName << ", source=" << clSourcecodeString << ")" << endl;
    hostside_opencl_funcs_assure_initialized();
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
    cout << "setKernelArgFloatStar " << clmem_as_floatstar << endl;
    int idx = idxByAddr[(void *)clmem_as_floatstar];
    cout << "idx " << idx << endl;
    cl_mem clmem = clmemByIdx[idx];

    if(clmemNeedsMap.find(clmem) != clmemNeedsMap.end()) {
        cout << "setKernelArgFloatStar running unmap" << endl;
        cl_int err = clEnqueueUnmapMemObject (
            *queue,
            clmem,
            clmem_as_floatstar,
            0,
            0,
            0
        );
        cl->checkError(err);
        kernelArgsToBeRemapped.push_back(clmem);
    }

    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    // cout << "setKernelArgFloatStar" << endl;
    kernel->inout(&clmem);
}

void setKernelArgCharStar(char *clmem_as_charstar) {
    cout << "setKernelArgCharStar" << endl;
    int idx = idxByAddr[(void *)clmem_as_charstar];
    cl_mem clmem = clmemByIdx[idx];
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    // cout << "setKernelArgFloatStar" << endl;
    kernel->inout(&clmem);
}

// void setKernelArgCharStar(char *clmem_as_charstar) {
//     cout << "setKernelArgCharStar" << endl;
//     cl_mem *p_mem = (cl_mem *)clmem_as_charstar;
//     // cout << "setKernelArgFloatStar" << endl;
//     kernel->inout(p_mem);
// }

// void setKernelArgStruct() {
//     cout << "setKernelArgStruct" << endl;
//     // cl_mem *p_mem = (cl_mem *)clmem_as_charstar;
//     // cout << "setKernelArgFloatStar" << endl;
//     // kernel->inout(p_mem);
// }

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
        cout << "global[" << i << "]=" << global[i] << endl;
    }
    for(int i = 0; i < 3; i++) {
        cout << "block[" << i << "]=" << block[i] << endl;
    }
    // cout << "launching kernel, using OpenCL..." << endl;
    kernel->run(3, global, block);
    cout << ".. kernel queued" << endl;
    // cl->finish();
    // cout << ".. kernel finished" << endl;
    for(auto it=kernelArgsToBeReleased.begin(); it != kernelArgsToBeReleased.end(); it++) {
        cout << "release arg" << endl;
        cl_mem memObject = *it;
        err = clReleaseMemObject(memObject);
        cl->checkError(err);
    }
    kernelArgsToBeReleased.clear();

    for(auto it=kernelArgsToBeRemapped.begin(); it != kernelArgsToBeRemapped.end(); it++) {
        cl_mem clmem = *it;
        int size = sizeByClmem[clmem];
        cout << "remapping buffer, size=" << size << endl;
        // cl_event event;
        void *p_mem = clEnqueueMapBuffer (
            *queue,
            clmem,
            CL_FALSE,
            CL_MAP_READ | CL_MAP_WRITE,
            0,
            size,
            0,
            0,
            0,
            &err
        );
        cout << "checking error" << endl;
        cl->checkError(err);
        cout << "new pointer: " << p_mem << endl;
        // err=  clReleaseEvent(event);
        // cl->checkError(err);
    }
    kernelArgsToBeRemapped.clear();
}
