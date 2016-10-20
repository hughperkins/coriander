#pragma once

#include <cstddef>

extern "C" {
    const char *cudaGetErrorString (size_t error);
    size_t cudaGetLastError();
}

#define cudaErrorNotReady 2222
