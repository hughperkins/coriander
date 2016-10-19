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

#include "cocl_memory.h"

#include "hostside_opencl_funcs.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "CL/cl.h"

using namespace std;
using namespace cocl;
using namespace easycl;

namespace cocl {
    // we should index these, but a set is ok-ish for now. maybe
    set<Memory *>memories;

    Memory::Memory(cl_mem clmem, size_t bytes) :
            clmem(clmem), bytes(bytes) {
    }

    Memory *Memory::newDeviceAlloc(size_t bytes) {
        cl_int err;
        cl_mem clmem = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, bytes,
                                               NULL, &err);
        cl->checkError(err);
        Memory *memory = new Memory(clmem, bytes);
        COCL_PRINT(cout << "Memory::newDeviceAlloc bytes=" << bytes << " memory=" << (void *)memory << " clmem=" << (void*)memory->clmem << endl);
        memories.insert(memory);
        return memory;
    }

    Memory::~Memory() {
        COCL_PRINT(cout << "~Memory releasing mem object memory=" << (void *)this << endl);
        cl_int err = clReleaseMemObject(clmem);
        cl->checkError(err);
    }

    Memory *findMemory(Memory *passedInPointer) {
        char *passedInAsCharStar = (char *)passedInPointer;
        for(auto it=memories.begin(), e=memories.end(); it != e; it++) {
            Memory *memory = *it;
            if(passedInAsCharStar >= (char *)memory && passedInAsCharStar < (char *)memory + memory->bytes) {
                COCL_PRINT(cout << "found memory: " << (void *)memory);
                return memory;
            }
        }
        cout << "could not find memory for " << (void *)passedInPointer << endl;
        throw runtime_error("could not find memory");
    }
}

size_t cuMemHostAlloc(void **pHostPointer, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE) {
    COCL_PRINT(cout << "cuMemHostAlloc redirected bytes=" << bytes << endl);
    *pHostPointer = malloc(bytes);
    return 0;
}

size_t cuMemFreeHost(void *hostPointer) {
    COCL_PRINT(cout << "cuMemFreeHost redirected" << endl);
    free(hostPointer);
    return 0;
}

size_t cuMemGetInfo_v2(size_t *free, size_t *total) {
    COCL_PRINT(cout << "cuMemGetInfo_v2 redirected" << endl);
    *free = 1024 * 1024;
    *total = 1024 * 1024;
    return 0;
}

size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t cudaMemcpyKind, char *_queue) {
    CLQueue *queue = (CLQueue *)_queue;
    COCL_PRINT(cout << "cudaMemcpyAsync count=" << count << " cudaMemcpyKind=" << cudaMemcpyKind << " queue=" << queue << endl);

    if(queue == 0) {
        queue = cl->default_queue;
        COCL_PRINT(cout << "using default queue" << endl);
    }
    cl_int err;
    if(cudaMemcpyKind == cudaMemcpyDeviceToHost) {
        // device => host
        Memory *srcMemory = (Memory *)src;
        err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_FALSE, 0,
                                         count, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == cudaMemcpyHostToDevice) {
        // host => device
        Memory *dstMemory = (Memory*)dst;
        err = clEnqueueWriteBuffer(queue->queue, dstMemory->clmem, CL_FALSE, 0,
                                          count, src, 0, NULL, NULL);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }

    return 0;
}

size_t cudaMemsetAsync(void *devPtr, int value, size_t count, char *_queue) {
    CLQueue *queue = (CLQueue *)_queue;
    COCL_PRINT(cout << "cudaMemsetAsync stub value=" << value << " count=" << count << " queue=" << queue << endl);
    // assert(stream == 0);
    throw runtime_error("cudaMemsetAsync not implemented");

    return 0;
}

size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count) {
    COCL_PRINT(cout << "cuMemsetD8_v2 redirected value " << value << " count=" << count << endl);
    Memory *memory = (Memory *)location;
    // use default queue??
    cl_int err = clEnqueueFillBuffer(cl->default_queue->queue, memory->clmem, &value, sizeof(unsigned char), 0, count * sizeof(unsigned char), 0, 0, 0);
    cl->checkError(err);
    return 0;
}

size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count) {
    Memory *memory = (Memory *)location;
    COCL_PRINT(cout << "cuMemsetD32_v2 redirected value " << value << " count=" << count << " location=" << location << " memory=" << (void *)memory << endl);
    cl_int err = clEnqueueFillBuffer(cl->default_queue->queue, memory->clmem, &value, sizeof(int), 0, count * sizeof(int), 0, 0, 0);
    cl->checkError(err);
    return 0;
}

size_t cuDeviceTotalMem_v2(uint64_t *value, void *device) {
    COCL_PRINT(cout << "cuDeviceTotalMem_v2 redirected" << endl);
    *value = 1024 * 1024;
    return 0;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, size_t cudaMemcpyKind) {
    COCL_PRINT(cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << bytes << endl);
    cl_int err;
    if(cudaMemcpyKind == cudaMemcpyDeviceToHost) {
        // device => host
        Memory *srcMemory = (Memory *)src;
        // Memory *srcMemory = memoryByHostPointer[src];
        err = clEnqueueReadBuffer(cl->default_queue->queue, srcMemory->clmem, CL_TRUE, 0,
                                         bytes, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == cudaMemcpyHostToDevice) {
        // host => device
        // Memory *dstMemory = memoryByHostPointer[dst];
        Memory *dstMemory = (Memory *)dst;
        err = clEnqueueWriteBuffer(cl->default_queue->queue, dstMemory->clmem, CL_TRUE, 0,
                                          bytes, src, 0, NULL, NULL);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }
    return 0;
}

size_t cudaMalloc(void **_pMemory, size_t N) {
    Memory **pMemory = (Memory **)_pMemory;
    hostside_opencl_funcs_assure_initialized();
    Memory *memory = Memory::newDeviceAlloc(N);
    COCL_PRINT(cout << "cudaMalloc using cl, size " << N << " memory=" << (void *)memory << endl);
    *pMemory = memory;
    return 0;
}

size_t cuMemcpyHtoDAsync_v2(void *dst, void *src, size_t bytes, char *_queue) {
    CLQueue *queue = (CLQueue*)_queue;
    // host => device
    COCL_PRINT(cout << "cuMemcpyHtoDAsync_v2 dst=" << dst << " src=" << src << " bytes=" << bytes << endl);
    Memory *dstMemory = findMemory((Memory *)dst);
    size_t offset = (char *)dst - (char *)dstMemory;
    COCL_PRINT(cout << "memory " << (void *)dstMemory << " offset=" << offset << endl);
    // cout << "cuMemcpyHtoDAsync_v2 cl->default_queue=" << cl->default_queue << endl;
    // Memory *dstMemory = (Memory *)dst;
    // cout << "cuMemcpyHtoDAsync_v2 dstMemory->clmem " << dstMemory->clmem << endl;
    // cout << "cuMemcpyHtoDAsync_v2 cl->default_queue->queue=" << cl->default_queue->queue << endl;
    cl_int err = clEnqueueWriteBuffer(queue->queue, dstMemory->clmem, CL_FALSE, offset,
                                      bytes, src, 0, NULL, NULL);
    cl->checkError(err);
    return 0;
}

size_t  cuMemcpyDtoHAsync_v2(void *dst, void *src, size_t bytes, char *_queue) {
    CLQueue *queue = (CLQueue*)_queue;
    COCL_PRINT(cout << "cuMemcpyDtoHAsync_v2 dst=" << dst << " src=" << src << " bytes=" << bytes << endl);
    Memory *srcMemory = findMemory((Memory *)src);
    size_t offset = (char *)src - (char *)srcMemory;
    COCL_PRINT(cout << "memory " << (void *)srcMemory << " offset=" << offset << endl);
    // Memory *srcMemory = (Memory *)src;
    cl_int err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_FALSE, offset,
                                     bytes, dst, 0, NULL, NULL);
    cl->checkError(err);
    return 0;
}

// => synchronous <=
size_t cuMemcpyHtoD_v2(void *gpu_dst, void *host_src, size_t size) {
    cudaMemcpy(gpu_dst, host_src, size, cudaMemcpyHostToDevice);
    cl->finish();
    return 0;
}

// => synchronous <=
size_t cuMemcpyHtoD(void *gpu_dst, void *host_src, size_t size) {
    return cuMemcpyHtoD_v2(gpu_dst, host_src, size);
}

// => synchronous <=
size_t  cuMemcpyDtoH_v2(void *host_dst, void *gpu_src, size_t size) {
    cudaMemcpy(host_dst, gpu_src, size, cudaMemcpyDeviceToHost);
    cl->finish();
    return 0;
}

// => synchronous <=
size_t  cuMemcpyDtoH(void *host_dst, void *gpu_src, size_t size) {
    return cuMemcpyDtoH(host_dst, gpu_src, size);
}

size_t cudaFree(void *_memory) {
    Memory *memory = (Memory *)_memory;
    COCL_PRINT(cout << "cudafree using opencl memory=" << memory << endl);
    delete memory;
    return 0;
}

size_t cuMemAlloc_v2(void **_pMemory, size_t bytes) {
    // Memory **pMemory = (Memory **)_pMemory;
    return cudaMalloc(_pMemory, bytes);
}

size_t cuMemFree_v2(void *memory) {
    // Memory *pMemory = (Memory *)_memory;
    return cudaFree(memory);
}
