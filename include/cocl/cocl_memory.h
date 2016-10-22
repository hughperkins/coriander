#pragma once

#include "CL/cl.h"

namespace cocl {
    class Memory {
    protected:
        Memory(cl_mem clmem, size_t bytes);

     public:
        static Memory *newDeviceAlloc(size_t bytes);
        ~Memory();
        cl_mem clmem; // this is assumed to always be valid
        size_t bytes; // should always be valid (ideally > 0...)
    };

    typedef Memory *PMemory;
}

typedef long long CUdeviceptr;

extern "C" {
    size_t cudaMalloc(void **pMemory, size_t N);
    size_t cudaFree(void *memory);

    size_t cuMemAlloc(CUdeviceptr *pMemory, size_t bytes);
    size_t cuMemFree(CUdeviceptr memory);

    size_t cuMemHostAlloc(void **pHostPointer, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE);
    size_t cuMemFreeHost(void *hostPointer);

    size_t cudaMemsetAsync(void *devPtr, int value, size_t count, char *queue);
    size_t cudaMemcpy(void *dst, const void *, size_t, size_t cudaMemcpyKind);
    size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t kind, char *queue);

    size_t cuMemGetInfo(size_t *free, size_t *total);
    size_t cuMemsetD8(CUdeviceptr location, unsigned char value, uint32_t count);
    size_t cuMemsetD32(CUdeviceptr location, unsigned int value, uint32_t count);

    // size_t cuMemcpyHtoD_v2(CUdeviceptr gpu_dst, const void *host_src, size_t size);
    // size_t cuMemcpyDtoH_v2(void *host_dst, CUdeviceptr gpu_src, size_t size);
    size_t cuMemcpyHtoD(CUdeviceptr gpu_dst, const void *host_src, size_t size);
    size_t cuMemcpyDtoH(void *host_dst, CUdeviceptr gpu_src, size_t size);
    size_t cuMemcpyHtoDAsync(CUdeviceptr gpu_dst, const void *host_src, size_t size, char*queue);
    size_t cuMemcpyDtoHAsync(void *host_dst, CUdeviceptr gpu_src, size_t size, char*queue);

    size_t cuDeviceTotalMem(uint64_t *value, CUdeviceptr device);
}

// #define cuMemcpyHtoDAsync cuMemcpyHtoDAsync_v2
// #define cuMemcpyDtoHAsync cuMemcpyDtoHAsync_v2
// #define cuMemAlloc_v2 cuMemAlloc
// #define cuMemFree_v2 cuMemFree
// #define cuMemcpyHtoD_v2 cuMemcpyHtoD
// #define cuMemcpyDtoH_v2 cuMemcpyDtoH

#define cudaMemcpyDeviceToHost 111
#define cudaMemcpyHostToDevice 222
#define cudaMemcpyDeviceToDevice 333

enum MemoryTypeEnum {
    CU_MEMORYTYPE_DEVICE = 60000,
    CU_MEMORYTYPE_HOST
};
