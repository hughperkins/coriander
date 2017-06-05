#pragma once

#include "clew.h"

namespace cocl {
    class Memory {
    protected:
        Memory(cl_mem clmem, size_t bytes);

     public:
        static Memory *newDeviceAlloc(size_t bytes);
        ~Memory();
        size_t getOffset(const char *passedInAsCharStar);
        cl_mem clmem; // this is assumed to always be valid
        size_t bytes; // should always be valid (ideally > 0...)
        size_t fakePos; // the range (fakePos) to (fakePos + bytes) should not overlap with any other memory
        // otherwise, problems :-P
    };

    Memory *findMemory(const char *passedInPointer);
    Memory *findMemoryByClmem(cl_mem clmem);
}

#define CU_MEMHOSTALLOC_PORTABLE 123

enum MemoryTypeEnum {
    CU_MEMORYTYPE_DEVICE = 60000,
    CU_MEMORYTYPE_HOST
};

enum cudaMemcpyKind {  // name used by thrust, in trivial_copy.inl, line 55 ish
    cudaMemcpyDeviceToHost=111,
    cudaMemcpyHostToDevice=222,
    cudaMemcpyDeviceToDevice=333,
    cudaMemcpyDefault=444  // from thrust, trivial_copy.inl
};

typedef long long CUdeviceptr;

extern "C" {
    size_t cudaMalloc(void **pMemory, size_t N);
    size_t cudaFree(void *memory);

    size_t cuMemAlloc(CUdeviceptr *pMemory, size_t bytes);
    size_t cuMemFree(CUdeviceptr memory);

    size_t cuMemHostAlloc(void **pHostPointer, unsigned int bytes, int type=CU_MEMHOSTALLOC_PORTABLE);
    size_t cuMemFreeHost(void *hostPointer);

    size_t cudaMemsetAsync(void *devPtr, int value, size_t count, char *queue);
    size_t cudaMemcpy(void *dst, const void *, size_t, cudaMemcpyKind kind);
    size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t kind, char *queue=0);

    size_t cuMemGetInfo(size_t *free, size_t *total);
    size_t cuMemsetD8(CUdeviceptr location, unsigned char value, uint32_t count);
    size_t cuMemsetD32(CUdeviceptr location, unsigned int value, uint32_t count);

    size_t cuMemcpyHtoD(CUdeviceptr gpu_dst, const void *host_src, size_t size);
    size_t cuMemcpyDtoH(void *host_dst, CUdeviceptr gpu_src, size_t size);
    size_t cuMemcpyHtoDAsync(CUdeviceptr gpu_dst, const void *host_src, size_t size, char*queue);
    size_t cuMemcpyDtoHAsync(void *host_dst, CUdeviceptr gpu_src, size_t size, char*queue);

    size_t cuDeviceTotalMem(size_t *value, CUdeviceptr device);
}

size_t cudaMalloc(float **pMemory, size_t N);

#define cuMemcpyHtoDAsync_v2 cuMemcpyHtoDAsync
#define cuMemcpyDtoHAsync_v2 cuMemcpyDtoHAsync
#define cuMemAlloc_v2 cuMemAlloc
#define cuMemFree_v2 cuMemFree
#define cuMemcpyHtoD_v2 cuMemcpyHtoD
#define cuMemcpyDtoH_v2 cuMemcpyDtoH
#define cuMemsetD8_v2 cuMemsetD8
#define cuMemsetD32_v2 cuMemsetD32

#define cuDeviceTotalMem_v2 cuDeviceTotalMem
#define cuMemGetInfo_v2 cuMemGetInfo
