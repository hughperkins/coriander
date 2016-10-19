#pragma once

#include <cstddef>

extern "C" {
    const char *cudaGetErrorString (size_t error);
    size_t cudaGetLastError();
}
