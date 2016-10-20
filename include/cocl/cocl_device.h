#pragma once

#include <cstddef>

#include "cocl_defs.h"

#define CoclDeviceType int

extern "C" {
    size_t cudaSetDevice (CoclDeviceType device);
    size_t cudaGetDevice (CoclDeviceType *device);
    size_t cudaGetDeviceCount (int *count);

    size_t cuInit(unsigned int flags);
    size_t cuDeviceGetCount(int *count);
    size_t cuDeviceGet (CoclDeviceType device, int ordinal);
}
