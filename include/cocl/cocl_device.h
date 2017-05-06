#pragma once

#include <cstddef>
// #include "OpenCL/cl.h"

#include "EasyCL/EasyCL.h"

// #include "CL/cl.h"
#include "cocl_defs.h"

// #define CoclDeviceType int

typedef int CUdevice;
// typedef cocl::CoclDevice *CUdevice;

extern "C" {
    size_t cudaSetDevice (int ordinal);
    size_t cudaGetDevice (int *p_ordinal);
    size_t cudaGetDeviceCount (int *count);
    size_t cudaDeviceReset();
    size_t cudaDeviceSynchronize();

    size_t cuInit(unsigned int flags);
    size_t cuDeviceGetCount(int *count);
    size_t cuDeviceGet(CUdevice *pdevice, int ordinal);
}

typedef int CUdevice_attribute;

namespace cocl {
    cl_device_id getClDeviceByOrdinal(int gpu);

    class CoclDevice {
    public:
        int gpuOrdinal;
        cl_platform_id platformId;
        cl_device_id deviceId;
        CoclDevice(int _gpuOrdinal, cl_platform_id _platform_id, cl_device_id _device_id);
    };
    CoclDevice *getCoclDeviceByGpuOrdinal(int gpuOrdinal);
} //namespace cocl
