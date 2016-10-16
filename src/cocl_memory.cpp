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

// #include "EasyCL.h"

#include "CL/cl.h"

using namespace std;
using namespace cocl;
using namespace easycl;

extern "C" {
    size_t cudaMalloc(cocl::PMemory *pmem, size_t N);
    size_t cuMemAlloc_v2(cocl::PMemory *pmem, size_t bytes);
    size_t cuMemFree_v2(cocl::PMemory mem);
    size_t cudaFree(cocl::PMemory pmem);

    size_t cuMemHostAlloc(cocl::PMemory *pmem, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE);
    size_t cuMemFreeHost(cocl::PMemory mem);

    size_t cudaMemsetAsync(void *devPtr, int value, size_t count, void *stream = 0);
    size_t cudaMemcpy(void *dst, const void *, size_t, size_t cudaMemcpyKind);
    size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t kind, void *stream = 0);
    size_t cuMemGetInfo_v2(size_t *free, size_t *total);
    size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count);
    size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count);
    size_t cuMemcpyHtoD_v2(void *gpu_dst, void *host_src, size_t size);
    size_t cuMemcpyDtoH_v2(void *host_dst, void *gpu_src, size_t size);
    size_t cuMemcpyHtoD(void *gpu_dst, void *host_src, size_t size);
    size_t cuMemcpyDtoH(void *host_dst, void *gpu_src, size_t size);
    size_t cuMemcpyHtoDAsync_v2(void *gpu_dst, void *host_src, size_t size);
    size_t cuMemcpyDtoHAsync_v2(void *host_dst, void *gpu_src, size_t size);

    size_t cuDeviceTotalMem_v2(uint64_t *value, void *device);
}

namespace cocl {
    map<void *, Memory *> memoryByHostPointer;

    Memory::Memory(cl_mem clmem, size_t bytes, MemoryType type) :
            clmem(clmem), bytes(bytes), type(type) {
    }

    Memory *Memory::newPinned(size_t bytes) {
        cout << "Memory allocating new pinned memory object" << endl;
        cl_int err;
        cl_mem clmem = clCreateBuffer(*ctx, CL_MEM_ALLOC_HOST_PTR, bytes,
                                               NULL, &err);
        cl->checkError(err);
        Memory *memory = new Memory(clmem, bytes, MemoryType::Pinned);
        memory->hostPointer = memory->map();

        memoryByHostPointer[memory->hostPointer] = memory;
        return memory;
    }

    Memory *Memory::newDeviceAlloc(size_t bytes) {
        cout << "Memory allocating new device memory object" << endl;
        cl_int err;
        cl_mem clmem = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, bytes,
                                               NULL, &err);
        cl->checkError(err);
        Memory *memory = new Memory(clmem, bytes, MemoryType::Device);
        memory->hostPointer = memory;

        memoryByHostPointer[memory->hostPointer] = memory;

        return memory;
    }

    Memory::~Memory() {
        cout << "~Memory releasing mem object" << endl;
        cl_int err = clReleaseMemObject(clmem);
        cl->checkError(err);
    }

    void *Memory::map() {
        cout << "Memory calling map" << endl;
        cl_int err;
        hostPointer = clEnqueueMapBuffer(*queue,
            clmem,
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
        cout << "Memory after map hostpoiner=" << hostPointer << endl;
        return hostPointer;
    }

    void Memory::unmap() {
        cl_int err = clEnqueueUnmapMemObject (
            *queue,
            clmem,
            hostPointer,
            0,
            0,
            0
        );
        cl->checkError(err);
    }
}

size_t cuMemHostAlloc(PMemory *ppMemory, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE) {
    cout << "cuMemHostAlloc redirected bytes=" << bytes << endl;
    hostside_opencl_funcs_assure_initialized();
    cout << "cuMemHostAlloc using cl, size " << bytes << endl;
    Memory *memory = Memory::newPinned(bytes);

    *ppMemory = memory;

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

size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t cudaMemcpyKind, void *stream) {
    cout << "cudaMemcpyAsync count=" << count << " cudaMemcpyKind=" << cudaMemcpyKind << " stream=" << stream << endl;

    assert(stream == 0);

    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << count << endl;
    cl_int err;
    if(cudaMemcpyKind == 2) {
        // device => host
        // int srcidx = idxByAddr[(void *)src];
        Memory *srcMemory = (Memory *)src;
        // cl_mem srcclmem = clmemByIdx[srcidx];
        err = clEnqueueReadBuffer(*queue, srcMemory->clmem, CL_TRUE, 0,
                                         count, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == 1) {
        // host => device
        // int dstidx = idxByAddr[(void *)dst];
        Memory *dstMemory = (Memory *)dst;
        // cl_mem dstclmem = clmemByIdx[dstidx];
        // cl_mem dstclmem
        err = clEnqueueWriteBuffer(*queue, dstMemory->clmem, CL_TRUE, 0,
                                          count, src, 0, NULL, NULL);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }

    return 0;
}

size_t cudaMemsetAsync(void *devPtr, int value, size_t count, void *stream) {
    cout << "cudaMemsetAsync stub value=" << value << " count=" << count << " stream=" << stream << endl;
    assert(stream == 0);

    return 0;
}

size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count) {
    cout << "cuMemsetD8_v2 redirected value " << value << " count=" << count << endl;
    // cl_int err = clEnqueueFillBuffer(*queue, *voidStarToClmem(location), &value, sizeof(unsigned char), 0, count * sizeof(unsigned char), 0, 0, 0);
    // cl->checkError(err);
    return 0;
}

size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count) {
    cout << "cuMemsetD32_v2 redirected value " << value << " count=" << count << endl;
    // cl_int err = clEnqueueFillBuffer(*queue, *voidStarToClmem(location), &value, sizeof(int), 0, count * sizeof(int), 0, 0, 0);
    // cl->checkError(err);
    return 0;
}

size_t cuDeviceTotalMem_v2(uint64_t *value, void *device) {
    cout << "cuDeviceTotalMem_v2 redirected" << endl;
    *value = 1024 * 1024;
    return 0;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, size_t cudaMemcpyKind) {
    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << bytes << endl;
    // if(cudaMemcpyKind == 2) {
    //     // device => host
    //     int srcidx = idxByAddr[(void *)src];
    //     cl_mem srcclmem = clmemByIdx[srcidx];
    //     err = clEnqueueReadBuffer(*queue, srcclmem, CL_TRUE, 0,
    //                                      bytes, dst, 0, NULL, NULL);
    //     cl->checkError(err);
    //     // cl->finish();
    // } else if(cudaMemcpyKind == 1) {
    //     // host => device
    //     int dstidx = idxByAddr[(void *)dst];
    //     cl_mem dstclmem = clmemByIdx[dstidx];
    //     err = clEnqueueWriteBuffer(*queue, dstclmem, CL_TRUE, 0,
    //                                       bytes, src, 0, NULL, NULL);
    //     cl->checkError(err);
    // } else {
    //     cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
    //     throw runtime_error("unhandled cudaMemcpyKind");
    // }
    return 0;
}

size_t cudaMalloc(PMemory *ppMemory, size_t N) {
    hostside_opencl_funcs_assure_initialized();
    cout << "cudaMalloc using cl, size " << N << endl;
    Memory *memory = Memory::newDeviceAlloc(N);

    *ppMemory = memory;
    return 0;
}

size_t cuMemcpyHtoDAsync_v2(void *dst, void *src, size_t bytes) {
    // // host => device
    // int dstidx = idxByAddr[(void *)dst];
    // cl_mem dstclmem = clmemByIdx[dstidx];
    // err = clEnqueueWriteBuffer(*queue, dstclmem, CL_FALSE, 0,
    //                                   bytes, src, 0, NULL, NULL);
    // cl->checkError(err);
    return 0;
}

size_t  cuMemcpyDtoHAsync_v2(void *dst, void *src, size_t bytes) {
    // int srcidx = idxByAddr[(void *)src];
    // cl_mem srcclmem = clmemByIdx[srcidx];
    // err = clEnqueueReadBuffer(*queue, srcclmem, CL_FALSE, 0,
    //                                  bytes, dst, 0, NULL, NULL);
    // cl->checkError(err);
    return 0;
}

// => synchronous <=
size_t cuMemcpyHtoD_v2(void *gpu_dst, void *host_src, size_t size) {
    // cudaMemcpy(gpu_dst, host_src, size, 1);
    // cl->finish();
    return 0;
}

// => synchronous <=
size_t cuMemcpyHtoD(void *gpu_dst, void *host_src, size_t size) {
    return cuMemcpyHtoD_v2(gpu_dst, host_src, size);
}

// => synchronous <=
size_t  cuMemcpyDtoH_v2(void *host_dst, void *gpu_src, size_t size) {
    cudaMemcpy(host_dst, gpu_src, size, 2);
    cl->finish();
    return 0;
}

// => synchronous <=
size_t  cuMemcpyDtoH(void *host_dst, void *gpu_src, size_t size) {
    return cuMemcpyDtoH(host_dst, gpu_src, size);
}

size_t cudaFree(PMemory pMemory) {
    cout << "cudafree using opencl hostpointer=" << pMemory << endl;
    delete pMemory;
    return 0;
}

size_t cuMemAlloc_v2(cocl::PMemory *mem, size_t bytes) {
    return cudaMalloc(mem, bytes);
}

size_t cuMemFree_v2(cocl::PMemory mem) {
    return cudaFree(mem);
}

// size_t cuMemsetD32_v2(void *location, int value, uint32 count) {
//     err = clEnqueueFillBuffer(*queue, location, &value, sizeof(int), 0, count * sizeof(int), 0, 0, 0);
// }

