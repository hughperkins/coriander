// Copyright Hugh Perkins 2016, 2017

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

#include "fill_buffer.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "EasyCL/EasyCL.h"

#include "pthread.h"

using namespace std;
using namespace cocl;
using namespace easycl;

#ifdef COCL_PRINT
#undef COCL_PRINT
#endif

#ifdef COCL_SPAM_MEMORY
#define COCL_PRINT(x) std::cout << "[MEM] " << x << std::endl;
#else
#define COCL_PRINT(x) 
#endif

namespace cocl {
    pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;
}

namespace cocl {
    // we should index these, but a set is ok-ish for now. maybe

    Memory::Memory(cl_mem clmem, size_t bytes) :
            clmem(clmem), bytes(bytes) {
        ThreadVars *v = getThreadVars();
        fakePos = v->getContext()->nextAllocPos;
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
        return memory;
    }

    Memory::~Memory() {
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
        size_t pos = (size_t)passedInAsCharStar;
        for(auto it=v->getContext()->memories.begin(), e=v->getContext()->memories.end(); it != e; it++) {
            Memory *memory = *it;
            if(pos >= memory->fakePos && pos < memory->fakePos + memory->bytes) {
                return memory;
            }
        }
        return 0;
    }

    Memory *findMemoryByClmem(cl_mem clmem) {
        ThreadVars *v = getThreadVars();
        Context *context = v->getContext();
        ContextMutex contextMutex(context);

        for(auto it=v->getContext()->memories.begin(), e=v->getContext()->memories.end(); it != e; it++) {
            Memory *memory = *it;
            if(clmem == memory->clmem) {
                return memory;
            }
        }
        return 0;
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
    cocl::CoclDevice *coclDevice = cocl::getCoclDeviceByGpuOrdinal(v->currentGpuOrdinal);
    cl_device_id clDeviceId = coclDevice->deviceId;
    *free = getDeviceInfoInt64(clDeviceId, CL_DEVICE_MAX_MEM_ALLOC_SIZE);
    *total = getDeviceInfoInt64(clDeviceId, CL_DEVICE_GLOBAL_MEM_SIZE);
    return 0;
}

size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t cudaMemcpyKind, char *_queue) {
    ThreadVars *v = getThreadVars();
    CoclStream *coclStream = (CoclStream *)_queue;
    COCL_PRINT("cudaMemcpyAsync count=" << count << " cudaMemcpyKind=" << cudaMemcpyKind << " context=" << (void *)v->currentContext);

    if(coclStream == 0) {
        coclStream = v->currentContext->default_stream.get();
    }
    CLQueue *queue = coclStream->clqueue;
    cl_int err;
    if(cudaMemcpyKind == cudaMemcpyDeviceToHost) {
        Memory *srcMemory = findMemory((const char *)src);
        if(srcMemory == 0) {
            cout << "coudlnt find memory for src " << (const void *)src << endl;
            throw runtime_error("couldnt find memory for src");
        }
        size_t src_offset = srcMemory->getOffset((const char *)src);
        err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_FALSE, src_offset,
                                         count, dst, 0, NULL, NULL);
        EasyCL::checkError(err);
    } else if(cudaMemcpyKind == cudaMemcpyHostToDevice) {
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
        throw runtime_error("unhandled cudaMemcpyKind");
    }

    return 0;
}

size_t cudaMemsetAsync(void *location, int value, size_t count, char *_queue) {
    COCL_PRINT("cudaMemsetAsync value=" << value << " count=" << count << " queue=" << (long)_queue);

    // this is not terribly async for now :-P

    Memory *memory = findMemory((char *)location);
    ThreadVars *v = getThreadVars();
    size_t offsetBytes = memory->getOffset((char *)location);
    // std::cout << "memory " << (long)memory << std::endl;
    // std::cout << " memory bytes " << memory->bytes << std::endl;
    // std::cout << " offsetBytes " << offsetBytes << std::endl;

    cl_int err;

    err = clFinish(v->currentContext->default_stream.get()->clqueue->queue);
    EasyCL::checkError(err);
    // std::cout << "clfinished the queue" << std::endl;

    if(count % 4 == 0) {
        unsigned int fourbytes = 0;
        for(int j=0; j < 4; j++) {
            fourbytes <<= 8;
            fourbytes |= (value & 255);
        }
        int intCount = count >> 2;
        myEnqueueFillBuffer(
            v->currentContext->default_stream.get()->clqueue->queue,
            memory->clmem,
            fourbytes,
            offsetBytes, intCount);
    } else {
        cout << "memset should be multiple of 4 count" << std::endl;
        throw std::runtime_error("cudaMemsetAsync should have count multiple of 4");
    }
    err = clFinish(v->currentContext->default_stream.get()->clqueue->queue);
    EasyCL::checkError(err);
    // COCL_PRINT("finished cudaMemsetAsync");
    return 0;
}

size_t cuMemsetD8(CUdeviceptr location, unsigned char value, uint32_t count) {
    COCL_PRINT("cuMemsetD8 redirected value " << value << " count=" << count);
    // use default queue??
    ThreadVars *v = getThreadVars();
    Memory *memory = findMemory((char *)location);
    size_t offset = memory->getOffset((char *)location);
    cl_int err = clEnqueueFillBuffer(v->currentContext->default_stream.get()->clqueue->queue, memory->clmem, &value, sizeof(unsigned char), offset, count * sizeof(unsigned char), 0, 0, 0);
    EasyCL::checkError(err);
    return 0;
}

size_t cuMemsetD32(CUdeviceptr location, unsigned int value, uint32_t count) {
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
    *value = getDeviceInfoInt64(clDeviceId, CL_DEVICE_GLOBAL_MEM_SIZE);
    return 0;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, cudaMemcpyKind kind) {
    COCL_PRINT("cudamempcy using opencl cudaMemcpyKind " << kind << " count=" << bytes);
    cl_int err;
    ThreadVars *v = getThreadVars();
    if(kind == cudaMemcpyDeviceToHost) {
        Memory *srcMemory = findMemory((const char *)src);
        size_t offset = srcMemory->getOffset((const char *)src);
        err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, srcMemory->clmem, CL_TRUE, offset,
                                         bytes, dst, 0, NULL, NULL);
        EasyCL::checkError(err);
    } else if(kind == cudaMemcpyHostToDevice) {
        Memory *dstMemory = findMemory((char *)dst);
        size_t offset = dstMemory->getOffset((char *)dst);
        err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, dstMemory->clmem, CL_TRUE, offset,
                                          bytes, src, 0, NULL, NULL);
        EasyCL::checkError(err);
    } else if(kind == cudaMemcpyDeviceToDevice) {
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
    COCL_PRINT("cuMemcpyHtoDAsync dst=" << dst << " src=" << src << " bytes=" << bytes);
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
    EasyCL::checkError(err);

    COCL_PRINT("   cuMemcpyDtoHAsync ...enqueued barrier with wait list")

    err = clFinish(queue->queue);
    EasyCL::checkError(err);

    err = clEnqueueReadBuffer(queue->queue, srcMemory->clmem, CL_TRUE, offset,
                                     bytes, dst, 0, NULL, NULL);
    EasyCL::checkError(err);

    COCL_PRINT("   cuMemcpyDtoHAsync ...enqueued read buffer")
    EasyCL::checkError(err);
    err = clFinish(queue->queue);
    EasyCL::checkError(err);
    COCL_PRINT("   cuMemcpyDtoHAsync ...finished clfinish")
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
