#pragma once

#include <cstddef>

#include "EasyCL.h"

// #include "CL/cl.h"
#include "cocl_defs.h"

// #define CoclDeviceType int

typedef int CUdevice;

extern "C" {
    size_t cudaSetDevice (CUdevice device);
    size_t cudaGetDevice (CUdevice *device);
    size_t cudaGetDeviceCount (int *count);

    size_t cuInit(unsigned int flags);
    size_t cuDeviceGetCount(int *count);
    size_t cuDeviceGet(CUdevice *pdevice, int ordinal);
}

typedef int CUdevice_attribute;

namespace cocl {
    cl_device_id getDeviceByIdx(int gpu);
}
