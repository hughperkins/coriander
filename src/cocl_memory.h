#pragma once

#include "CL/cl.h"
#include "/home/ubuntu/git/cuda-ir-to-opencl/src/EasyCL/EasyCL.h"

namespace cocl {
    // enum MemoryType {
    //     Pinned,
    //     Device
    // };

    class Memory {
    protected:
        Memory(cl_mem clmem, size_t bytes);

     public:
        // static Memory *newPinned(size_t bytes);
        static Memory *newDeviceAlloc(size_t bytes);
        ~Memory();
        // void *map(easycl::CLQueue *queue);
        // void unmap(easycl::CLQueue *queue);
        // bool needsMap() {
        //     return type == Pinned;
        // }

        cl_mem clmem; // this is assumed to always be valid
        size_t bytes; // should always be valid (ideally > 0...)
        // void *hostPointer; // will point to memory area for pinned, otherwise to this object
        // MemoryType type;
    };

    typedef Memory *PMemory;

    // Memory *getMemoryForHostPointer(void *hostPointer);
}

extern "C" {
    size_t cudaMalloc(void **pMemory, size_t N);
    size_t cudaFree(void *memory);

    size_t cuMemAlloc_v2(void **pMemory, size_t bytes);
    size_t cuMemFree_v2(void *memory);

    size_t cuMemHostAlloc(void **pHostPointer, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE);
    size_t cuMemFreeHost(void *hostPointer);

    size_t cudaMemsetAsync(void *devPtr, int value, size_t count, char *queue);
    size_t cudaMemcpy(void *dst, const void *, size_t, size_t cudaMemcpyKind);
    size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t kind, char *queue);
    size_t cuMemGetInfo_v2(size_t *free, size_t *total);
    size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count);
    size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count);
    size_t cuMemcpyHtoD_v2(void *gpu_dst, void *host_src, size_t size);
    size_t cuMemcpyDtoH_v2(void *host_dst, void *gpu_src, size_t size);
    size_t cuMemcpyHtoD(void *gpu_dst, void *host_src, size_t size);
    size_t cuMemcpyDtoH(void *host_dst, void *gpu_src, size_t size);
    size_t cuMemcpyHtoDAsync_v2(void *gpu_dst, void *host_src, size_t size, char*queue);
    size_t cuMemcpyDtoHAsync_v2(void *host_dst, void *gpu_src, size_t size, char*queue);

    size_t cuDeviceTotalMem_v2(uint64_t *value, void *device);
}

#define cuMemcpyHtoDAsync cuMemcpyHtoDAsync_v2
#define cuMemcpyDtoHAsync cuMemcpyDtoHAsync_v2
#define cuMemAlloc cuMemAlloc_v2
#define cuMemFree cuMemFree_v2

#define cudaMemcpyDeviceToHost 111
#define cudaMemcpyHostToDevice 222
#define cudaMemcpyDeviceToDevice 333
