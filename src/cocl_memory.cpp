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
#include "cocl/cocl_streams.h"
#include "cocl/cocl_context.h"
#include "cocl/cocl_device.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "EasyCL/EasyCL.h"

// #include "CL/cl.h"

#include "pthread.h"

using namespace std;
using namespace cocl;
using namespace easycl;

#ifdef COCL_SPAM
#undef COCL_PRINT
#define COCL_PRINT(x) std::cout << "[COCL] " << x << std::endl;
#endif

namespace cocl {
    pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;
}

// #undef COCL_PRINT
// #define COCL_PRINT(stuff) \
//     stuff ;

    // pthread_mutex_lock(&cocl::print_mutex); \
    // pthread_mutex_unlock(&cocl::print_mutex);

namespace cocl {
    // pthread_mutex_t mem_mutex = PTHREAD_MUTEX_INITIALIZER;

    // class MemoryMutex {
    // public:
    //     MemoryMutex() {
    //         // COCL_PRINT("locking mem mutex");
    //         pthread_mutex_lock(&mem_mutex);
    //     }
    //     ~MemoryMutex() {
    //         // COCL_PRINT("releasing mem mutex");
    //         pthread_mutex_unlock(&mem_mutex);
    //     }
    // };

    // we should index these, but a set is ok-ish for now. maybe

    Memory::Memory(cl_mem clmem, size_t bytes) :
            clmem(clmem), bytes(bytes) {
        // MemoryMutex memoryMutex;
        ThreadVars *v = getThreadVars();
        fakePos = v->getContext()->nextAllocPos;
        // COCL_PRINT("Memory::Memory bytes=" << bytes << endl;)
        // we should align it actually.  on 128-bytes?
        fakePos = ((fakePos + 127) / 128) * 128;
        v->getContext()->nextAllocPos = fakePos + bytes;
        v->getContext()->memoryByAllocPos[fakePos] = this;
        v->getContext()->memories.insert(this);
    }

    Memory *Memory::newDeviceAlloc(size_t bytes) {
        ThreadVars *v = getThreadVars();
        Context *context = v->getContext();
        ContextMutex contextMutex(context);
        EasyCL *cl = v->getContext()->getCl();
        cl_int err;
        cl_mem clmem = clCreateBuffer(*cl->context, CL_MEM_READ_WRITE, bytes,
                                               NULL, &err);
        EasyCL::checkError(err);
        Memory *memory = new Memory(clmem, bytes);
        // COCL_PRINT("Memory::newDeviceAlloc context=" << (void *)v->currentContext << " bytes=" << bytes << " memory=" << (void *)memory << " clmem=" << (void*)memory->clmem);
        return memory;
    }

    Memory::~Memory() {
        // COCL_PRINT("~Memory releasing mem object memory=" << (void *)this);
        ThreadVars *v = getThreadVars();
        v->getContext()->memoryByAllocPos.erase(fakePos);
        v->getContext()->memories.erase(this);
        cl_int err = clReleaseMemObject(clmem);
        v->getContext()->getCl()->checkError(err);
        // TODO: should remove from map and set too
    }

    Memory *findMemory(const char *passedInAsCharStar) {
        ThreadVars *v = getThreadVars();
        Context *context = v->getContext();
        ContextMutex contextMutex(context);
        // MemoryMutex memoryMutex;
        // char *passedInAsCharStar = (char *)passedInPointer;
        size_t pos = (size_t)passedInAsCharStar;
        // COCL_PRINT("findMemory pos=" << pos << endl;)
        for(auto it=v->getContext()->memories.begin(), e=v->getContext()->memories.end(); it != e; it++) {
            Memory *memory = *it;
            // COCL_PRINT("memory fakepos=" << memory->fakePos << " bytes " << memory->bytes << endl;)
            if(pos >= memory->fakePos && pos < memory->fakePos + memory->bytes) {
                // COCL_PRINT("found memory: " << (void *)memory << " fakepos=" << memory->fakePos << " bytes=" << memory->bytes);
                return memory;
            }
        }
        // cout << "could not find memory for " << (void *)passedInAsCharStar << endl;
        return 0;
        // throw runtime_error("could not find memory");
    }
    size_t Memory::getOffset(const char *passedInAsCharStar) {
        return (size_t)passedInAsCharStar - fakePos;
    }
}

size_t cuMemHostAlloc(void **pHostPointer, unsigned int bytes, int type) {
    COCL_PRINT("cuMemHostAlloc redirected bytes=" << bytes);
    *pHostPointer = malloc(bytes);
    return 0;
}

size_t cuMemFreeHost(void *hostPointer) {
    COCL_PRINT("cuMemFreeHost redirected");
    free(hostPointer);
    return 0;
}

size_t cuMemGetInfo(size_t *free, size_t *total) {
    COCL_PRINT("cuMemGetInfo redirected");
    ThreadVars *v = getThreadVars();
    // cl_device_id deviceid = getDeviceByIdx(v->currentDevice);
    cocl::CoclDevice *coclDevice = cocl::getCoclDeviceByGpuOrdinal(v->currentGpuOrdinal);
    cl_device_id clDeviceId = coclDevice->deviceId;
    *free = getDeviceInfoInt64(clDeviceId, CL_DEVICE_MAX_MEM_ALLOC_SIZE);
    *total = getDeviceInfoInt64(clDeviceId, CL_DEVICE_GLOBAL_MEM_SIZE);
    return 0;
}

size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t cudaMemcpyKind, char *_queue) {
    // CLQueue *queue = (CLQueue *)_queue;
    ThreadVars *v = getThreadVars();
    CoclStream *coclStream = (CoclStream *)_queue;
    COCL_PRINT("cudaMemcpyAsync count=" << count << " cudaMemcpyKind=" << cudaMemcpyKind << " context=" << (void *)v->currentContext);

    if(coclStream == 0) {
        // COCL_PRINT("using default queue");
        coclStream = v->currentContext->default_stream.get();
    }
    CLQueue *queue = coclStream->clqueue;
    cl_int err;
    if(cudaMemcpyKind == cudaMemcpyDeviceToHost) {
        // device => host
        // Memory *srcMemory = (Memory *)src;
        Memory *srcMemory = findMemory((const char *)src);
        if(srcMemory == 0) {
            cout << "coudlnt find memory for src " << (const void *)src << endl;
            throw runtime_error("couldnt find memory for src");
        }
        size_t src_offset = srcMemory->getOffset((const char *)src);
        err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_FALSE, src_offset,
                                         count, dst, 0, NULL, NULL);
        EasyCL::checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == cudaMemcpyHostToDevice) {
        // host => device
        // Memory *dstMemory = (Memory*)dst;
        Memory *dstMemory = findMemory((char *)dst);
        if(dstMemory == 0) {
            cout << "coudlnt find memory for dst " << (void *)dst << endl;
            throw runtime_error("couldnt find memory for dst");
        }
        size_t dst_offset = dstMemory->getOffset((char *)dst);
        err = clEnqueueWriteBuffer(queue->queue, dstMemory->clmem, CL_FALSE, dst_offset,
                                          count, src, 0, NULL, NULL);
        EasyCL::checkError(err);
    } else if(cudaMemcpyKind == cudaMemcpyDeviceToDevice) {
        Memory *dstMemory = findMemory((char *)dst);
        size_t dst_offset = dstMemory->getOffset((char *)dst);

        Memory *srcMemory = findMemory((const char *)src);
        size_t src_offset = srcMemory->getOffset((const char *)src);
        if(dstMemory == 0) {
            cout << "coudlnt find memory for dst " << (void *)dst << endl;
            throw runtime_error("couldnt find memory for dst");
        }
        if(srcMemory == 0) {
            cout << "coudlnt find memory for src " << (const void *)src << endl;
            throw runtime_error("couldnt find memory for src");
        }

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
        EasyCL::checkError(err);
    } else {
        // cout << "cudaMemcpyAsync cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }

    return 0;
}

size_t cudaMemsetAsync(void *devPtr, int value, size_t count, char *_queue) {
    // CoclStream *coclStream = (CoclStream *)_queue;
    // CLQueue *queue = (CLQueue *)_queue;
    COCL_PRINT("cudaMemsetAsync stub value=" << value << " count=" << count << " queue=" << _queue);
    // assert(stream == 0);
    throw runtime_error("cudaMemsetAsync not implemented");

    return 0;
}

size_t cuMemsetD8(CUdeviceptr location, unsigned char value, uint32_t count) {
    COCL_PRINT("cuMemsetD8 redirected value " << value << " count=" << count);
    // Memory *memory = (Memory *)location;
    // use default queue??
    ThreadVars *v = getThreadVars();
    Memory *memory = findMemory((char *)location);
    size_t offset = memory->getOffset((char *)location);
    cl_int err = clEnqueueFillBuffer(v->currentContext->default_stream.get()->clqueue->queue, memory->clmem, &value, sizeof(unsigned char), offset, count * sizeof(unsigned char), 0, 0, 0);
    EasyCL::checkError(err);
    return 0;
}

size_t cuMemsetD32(CUdeviceptr location, unsigned int value, uint32_t count) {
    // Memory *memory = (Memory *)location;
    Memory *memory = findMemory((char *)location);
    ThreadVars *v = getThreadVars();
    size_t offset = memory->getOffset((char *)location);
    COCL_PRINT("cuMemsetD32 redirected value " << value << " count=" << count << " location=" << location << " memory=" << (void *)memory);
    cl_int err = clEnqueueFillBuffer(v->currentContext->default_stream.get()->clqueue->queue, memory->clmem, &value, sizeof(int), offset, count * sizeof(int), 0, 0, 0);
    EasyCL::checkError(err);
    return 0;
}

size_t cuDeviceTotalMem(size_t *value, CUdeviceptr device) {
    COCL_PRINT("cuDeviceTotalMem redirected");
    ThreadVars *v = getThreadVars();
    cocl::CoclDevice *coclDevice = cocl::getCoclDeviceByGpuOrdinal(v->currentGpuOrdinal);
    cl_device_id clDeviceId = coclDevice->deviceId;
    // cl_device_id deviceid = getDeviceByIdx(v->currentDevice);
    *value = getDeviceInfoInt64(clDeviceId, CL_DEVICE_GLOBAL_MEM_SIZE);
    return 0;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, cudaMemcpyKind kind) {
    COCL_PRINT("cudamempcy using opencl cudaMemcpyKind " << kind << " count=" << bytes);
    cl_int err;
    ThreadVars *v = getThreadVars();
    if(kind == cudaMemcpyDeviceToHost) {
        // device => host
        // COCL_PRINT("cudamemcpy device to host");
        Memory *srcMemory = findMemory((const char *)src);
        size_t offset = srcMemory->getOffset((const char *)src);
        err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, srcMemory->clmem, CL_TRUE, offset,
                                         bytes, dst, 0, NULL, NULL);
        EasyCL::checkError(err);
        // cl->finish();
    } else if(kind == cudaMemcpyHostToDevice) {
        // host => device
        // cout << "cudamemcpy host to device" << endl;
        Memory *dstMemory = findMemory((char *)dst);
        size_t offset = dstMemory->getOffset((char *)dst);
        err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, dstMemory->clmem, CL_TRUE, offset,
                                          bytes, src, 0, NULL, NULL);
        EasyCL::checkError(err);
    } else if(kind == cudaMemcpyDeviceToDevice) {
        // device => device
        Memory *srcMemory = findMemory((const char *)src);
        size_t src_offset = srcMemory->getOffset((const char *)src);
        Memory *dstMemory = findMemory((char *)dst);
        size_t dst_offset = dstMemory->getOffset((char *)dst);
        err = clEnqueueCopyBuffer(
            v->currentContext->default_stream.get()->clqueue->queue,
            srcMemory->clmem,
            dstMemory->clmem,
            src_offset,
            dst_offset,
            bytes,
            0,
            0,
            0);
        EasyCL::checkError(err);
    } else {
        cout << "cudaMemcpy cudaMemcpyKind using opencl " << kind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }
    return 0;
}

size_t cuMemcpyHtoDAsync(CUdeviceptr dst, const void *src, size_t bytes, char *_queue) {
    CoclStream *coclStream = (CoclStream *)_queue;
    CLQueue *queue = coclStream->clqueue;
    // host => device
    COCL_PRINT("cuMemcpyHtoDAsync dst=" << dst << " src=" << src << " bytes=" << bytes);
    // throw runtime_error("deliberate crash");
    // cout << "src[0] " << ((float *)src)[0] << endl;
    Memory *dstMemory = findMemory((char *)dst);
    size_t offset = dstMemory->getOffset((char *)dst);
    cl_int err;

    err = clEnqueueWriteBuffer(queue->queue, dstMemory->clmem, CL_TRUE, offset,
                                      bytes, src, 0, NULL, NULL);
    EasyCL::checkError(err);

    err = clFinish(queue->queue);
    EasyCL::checkError(err);
    COCL_PRINT(" ... done cuMemcpyHtoDAsync dst=" << dst << " src=" << src << " bytes=" << bytes);
    return 0;
}

size_t  cuMemcpyDtoHAsync(void *dst, CUdeviceptr src, size_t bytes, char *_queue) {
    CoclStream *coclStream = (CoclStream *)_queue;
    CLQueue *queue = coclStream->clqueue;
    COCL_PRINT("cuMemcpyDtoHAsync queue=" << (void *)queue << " dst=" << dst << " src=" << src << " bytes=" << bytes);
    Memory *srcMemory = findMemory((char *)src);
    size_t offset = srcMemory->getOffset((char *)src);
    // adding this because otherwise seems I need to call synchronize, on intel hd beignet, before
    // copying data back (even though the copy should wait, by virtue of being on the same queue, I think)
    // this error shows up only in testblas, for now
    cl_int err = clEnqueueBarrierWithWaitList(
        queue->queue, 0, 0, 0
    );
    COCL_PRINT("   cuMemcpyDtoHAsync ...enqueued barrier with wait list")
    EasyCL::checkError(err);
    err = clFinish(queue->queue);
    EasyCL::checkError(err);
    err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_TRUE, offset,
                                     bytes, dst, 0, NULL, NULL);
    COCL_PRINT("   cuMemcpyDtoHAsync ...enqueued read buffer")
    // cout << "queued buffer read device => host" << endl;
    // COCL_PRINT("cuMemcpyDtoHAsync dst[0] " << ((float *)dst)[0]);
    EasyCL::checkError(err);
    err = clFinish(queue->queue);
    COCL_PRINT("   cuMemcpyDtoHAsync ...finished clfinish")
    EasyCL::checkError(err);
    return 0;
}

// => synchronous <=
size_t cuMemcpyHtoD(CUdeviceptr gpu_dst, const void *host_src, size_t size) {
    cudaMemcpy((void *)gpu_dst, host_src, size, cudaMemcpyHostToDevice);
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    cl->finish();
    return 0;
}

// => synchronous <=
size_t  cuMemcpyDtoH(void *host_dst, CUdeviceptr gpu_src, size_t size) {
    COCL_PRINT("cumemcpyDtoH");
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    cudaMemcpy(host_dst, (void *)gpu_src, size, cudaMemcpyDeviceToHost);
    cl->finish();
    return 0;
}

size_t cudaMalloc(void **_pMemory, size_t N) {
    // hostside_opencl_funcs_assure_initialized();
    Memory *memory = Memory::newDeviceAlloc(N);
    COCL_PRINT("cudaMalloc using cl, size " << N << " memory=" << (void *)memory << " fakePos=" << memory->fakePos);
    *_pMemory = (void *)memory->fakePos;
    return 0;
}

size_t cuMemAlloc(CUdeviceptr*_pMemory, size_t bytes) {
    return cudaMalloc((void **)_pMemory, bytes);
}

size_t cudaMalloc(float **pMemory, size_t N) {
    return ::cudaMalloc((void **)pMemory, N);
}

size_t cudaFree(void *_memory) {
    Memory *memory = findMemory((char *)_memory);
    COCL_PRINT("cudafree using opencl memory=" << memory);
    delete memory;
    return 0;
}

size_t cuMemFree(CUdeviceptr memory) {
    return cudaFree((void *)memory);
}
