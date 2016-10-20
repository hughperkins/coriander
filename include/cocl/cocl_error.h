#pragma once

#include <cstddef>

extern "C" {
    const char *cudaGetErrorString (size_t error);
    size_t cudaGetLastError();
}

#define cudaErrorNotReady 2222

#define CUDA_ERROR_NOT_READY cudaErrorNotReady
#define CUDA_SUCCESS 0
