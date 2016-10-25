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

#include "cocl/cocl_memory.h"

#include "cocl/hostside_opencl_funcs.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "EasyCL.h"

#include "CL/cl.h"

#include "pthread.h"

using namespace std;
using namespace cocl;
using namespace easycl;

namespace cocl {
    pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;
}

#undef COCL_PRINT
#define COCL_PRINT(stuff) \
    pthread_mutex_lock(&cocl::print_mutex); \
    stuff ; \
    pthread_mutex_unlock(&cocl::print_mutex);

namespace cocl {
    pthread_mutex_t mem_mutex = PTHREAD_MUTEX_INITIALIZER;

    class MemoryMutex {
    public:
        MemoryMutex() {
            // COCL_PRINT(cout << "locking mem mutex" << endl);
            pthread_mutex_lock(&mem_mutex);
        }
        ~MemoryMutex() {
            // COCL_PRINT(cout << "releasing mem mutex" << endl);
            pthread_mutex_unlock(&mem_mutex);
        }
    };

    // we should index these, but a set is ok-ish for now. maybe
    set<Memory *>memories;
    long long nextAllocPos = 1;
    map< long long, Memory *>memoryByAllocPos;

    Memory::Memory(cl_mem clmem, size_t bytes) :
            clmem(clmem), bytes(bytes) {
        MemoryMutex memoryMutex;
        fakePos = nextAllocPos;
        // we should align it actually.  on 128-bytes?
        fakePos = ((fakePos + 127) / 128) * 128;
        nextAllocPos = fakePos + bytes;
        memoryByAllocPos[fakePos] = this;
        memories.insert(this);
    }

    Memory *Memory::newDeviceAlloc(size_t bytes) {
        cl_int err;
        cl_mem clmem = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, bytes,
                                               NULL, &err);
        cl->checkError(err);
        Memory *memory = new Memory(clmem, bytes);
        COCL_PRINT(cout << "Memory::newDeviceAlloc bytes=" << bytes << " memory=" << (void *)memory << " clmem=" << (void*)memory->clmem << endl);
        return memory;
    }

    Memory::~Memory() {
        COCL_PRINT(cout << "~Memory releasing mem object memory=" << (void *)this << endl);
        cl_int err = clReleaseMemObject(clmem);
        cl->checkError(err);
        // TODO: should remove from map and set too
    }

    Memory *findMemory(char *passedInAsCharStar) {
        MemoryMutex memoryMutex;
        // char *passedInAsCharStar = (char *)passedInPointer;
        long long pos = (long long )passedInAsCharStar;
        for(auto it=memories.begin(), e=memories.end(); it != e; it++) {
            Memory *memory = *it;
            if(pos >= memory->fakePos && pos < memory->fakePos + memory->bytes) {
                COCL_PRINT(cout << "found memory: " << (void *)memory << endl);
                return memory;
            }
        }
        cout << "could not find memory for " << (void *)passedInAsCharStar << endl;
        throw runtime_error("could not find memory");
    }
    size_t Memory::getOffset(char *passedInAsCharStar) {
        return (long long)passedInAsCharStar - fakePos;
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

size_t cuMemGetInfo(size_t *free, size_t *total) {
    COCL_PRINT(cout << "cuMemGetInfo redirected" << endl);
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
        // Memory *srcMemory = (Memory *)src;
        Memory *srcMemory = findMemory((char *)src);
        size_t src_offset = srcMemory->getOffset((char *)src);
        err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_FALSE, src_offset,
                                         count, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == cudaMemcpyHostToDevice) {
        // host => device
        // Memory *dstMemory = (Memory*)dst;
        Memory *dstMemory = findMemory((char *)dst);
        size_t dst_offset = dstMemory->getOffset((char *)dst);
        err = clEnqueueWriteBuffer(queue->queue, dstMemory->clmem, CL_FALSE, dst_offset,
                                          count, src, 0, NULL, NULL);
        cl->checkError(err);
    } else if(cudaMemcpyKind == cudaMemcpyDeviceToDevice) {
        Memory *dstMemory = findMemory((char *)dst);
        size_t dst_offset = dstMemory->getOffset((char *)dst);

        Memory *srcMemory = findMemory((char *)src);
        size_t src_offset = srcMemory->getOffset((char *)src);

        err = clEnqueueCopyBuffer(
            queue->queue,
            srcMemory->clmem,
            dstMemory->clmem,
            src_offset,
            dst_offset,
            count,
            0,
            0,
            0);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyAsync cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
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

size_t cuMemsetD8(CUdeviceptr location, unsigned char value, uint32_t count) {
    COCL_PRINT(cout << "cuMemsetD8 redirected value " << value << " count=" << count << endl);
    // Memory *memory = (Memory *)location;
    // use default queue??
    Memory *memory = findMemory((char *)location);
    size_t offset = memory->getOffset((char *)location);
    cl_int err = clEnqueueFillBuffer(cl->default_queue->queue, memory->clmem, &value, sizeof(unsigned char), offset, count * sizeof(unsigned char), 0, 0, 0);
    cl->checkError(err);
    return 0;
}

size_t cuMemsetD32(CUdeviceptr location, unsigned int value, uint32_t count) {
    // Memory *memory = (Memory *)location;
    Memory *memory = findMemory((char *)location);
    size_t offset = memory->getOffset((char *)location);
    COCL_PRINT(cout << "cuMemsetD32 redirected value " << value << " count=" << count << " location=" << location << " memory=" << (void *)memory << endl);
    cl_int err = clEnqueueFillBuffer(cl->default_queue->queue, memory->clmem, &value, sizeof(int), offset, count * sizeof(int), 0, 0, 0);
    cl->checkError(err);
    return 0;
}

size_t cuDeviceTotalMem(uint64_t *value, CUdeviceptr device) {
    COCL_PRINT(cout << "cuDeviceTotalMem redirected" << endl);
    *value = 1024 * 1024;
    return 0;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, size_t cudaMemcpyKind) {
    COCL_PRINT(cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << bytes << endl);
    cl_int err;
    if(cudaMemcpyKind == cudaMemcpyDeviceToHost) {
        // device => host
        // cout << "cudamemcpy device to host" << endl;
        Memory *srcMemory = findMemory((char *)src);
        size_t offset = srcMemory->getOffset((char *)src);
        err = clEnqueueReadBuffer(cl->default_queue->queue, srcMemory->clmem, CL_TRUE, offset,
                                         bytes, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == cudaMemcpyHostToDevice) {
        // host => device
        // cout << "cudamemcpy host to device" << endl;
        Memory *dstMemory = findMemory((char *)dst);
        size_t offset = dstMemory->getOffset((char *)dst);
        err = clEnqueueWriteBuffer(cl->default_queue->queue, dstMemory->clmem, CL_TRUE, offset,
                                          bytes, src, 0, NULL, NULL);
        cl->checkError(err);
    } else if(cudaMemcpyKind == cudaMemcpyDeviceToDevice) {
        // device => device
        Memory *srcMemory = findMemory((char *)src);
        size_t src_offset = srcMemory->getOffset((char *)src);
        Memory *dstMemory = findMemory((char *)dst);
        size_t dst_offset = dstMemory->getOffset((char *)dst);
        err = clEnqueueCopyBuffer(
            cl->default_queue->queue,
            srcMemory->clmem,
            dstMemory->clmem,
            src_offset,
            dst_offset,
            bytes,
            0,
            0,
            0);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpy cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }
    return 0;
}

size_t cuMemcpyHtoDAsync(CUdeviceptr dst, const void *src, size_t bytes, char *_queue) {
    CLQueue *queue = (CLQueue*)_queue;
    // host => device
    COCL_PRINT(cout << "cuMemcpyHtoDAsync dst=" << dst << " src=" << src << " bytes=" << bytes << endl);
    Memory *dstMemory = findMemory((char *)dst);
    size_t offset = dstMemory->getOffset((char *)dst);
    COCL_PRINT(cout << "memory " << (void *)dstMemory << " offset=" << offset << endl);
    cl_int err = clEnqueueWriteBuffer(queue->queue, dstMemory->clmem, CL_FALSE, offset,
                                      bytes, src, 0, NULL, NULL);
    cl->checkError(err);
    return 0;
}

size_t  cuMemcpyDtoHAsync(void *dst, CUdeviceptr src, size_t bytes, char *_queue) {
    CLQueue *queue = (CLQueue*)_queue;
    COCL_PRINT(cout << "cuMemcpyDtoHAsync dst=" << dst << " src=" << src << " bytes=" << bytes << endl);
    Memory *srcMemory = findMemory((char *)src);
    size_t offset = srcMemory->getOffset((char *)src);
    COCL_PRINT(cout << "memory " << (void *)srcMemory << " offset=" << offset << endl);
    cl_int err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_FALSE, offset,
                                     bytes, dst, 0, NULL, NULL);
    cl->checkError(err);
    return 0;
}

// => synchronous <=
size_t cuMemcpyHtoD(CUdeviceptr gpu_dst, const void *host_src, size_t size) {
    cudaMemcpy((void *)gpu_dst, host_src, size, cudaMemcpyHostToDevice);
    cl->finish();
    return 0;
}

// => synchronous <=
size_t  cuMemcpyDtoH(void *host_dst, CUdeviceptr gpu_src, size_t size) {
    COCL_PRINT(cout << "cumemcpyDtoH" << endl);
    cudaMemcpy(host_dst, (void *)gpu_src, size, cudaMemcpyDeviceToHost);
    cl->finish();
    return 0;
}

size_t cudaMalloc(void **_pMemory, size_t N) {
    hostside_opencl_funcs_assure_initialized();
    Memory *memory = Memory::newDeviceAlloc(N);
    COCL_PRINT(cout << "cudaMalloc using cl, size " << N << " memory=" << (void *)memory << " fakePos=" << memory->fakePos << endl);
    *_pMemory = (void *)memory->fakePos;
    return 0;
}

size_t cuMemAlloc(CUdeviceptr*_pMemory, size_t bytes) {
    return cudaMalloc((void **)_pMemory, bytes);
}

size_t cudaFree(void *_memory) {
    Memory *memory = findMemory((char *)_memory);
    COCL_PRINT(cout << "cudafree using opencl memory=" << memory << endl);
    delete memory;
    return 0;
}

size_t cuMemFree(CUdeviceptr memory) {
    return cudaFree((void *)memory);
}
