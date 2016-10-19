#pragma once

#include <cstddef>

#include "cocl_defs.h"

extern "C" {
    size_t cudaSetDevice (int device);
    size_t cudaGetDevice (int *device);
    size_t cudaGetDeviceCount (int *count);

    size_t cuInit(unsigned int flags);
    size_t cuDeviceGetCount(int *count);
    size_t cuDeviceGet (void *device, int ordinal);
}
