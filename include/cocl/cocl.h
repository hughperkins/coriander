#pragma once

#ifndef _COCL_H  // since pragma once doesnt work if two files have same name and content, but different location...
#define _COCL_H

#define _Float16 float

#include "cocl/cocl_attributes.h"

// This file is kind of a catch-all, until we move it somewhere more principled/cleaner

#include <math.h>
#ifdef abs            // these come from math.h on macOS
# undef abs
#endif
#ifdef signbit
# undef signbit
#endif
#ifdef fpclassify
# undef fpclassify
#endif
#ifdef isfinite
# undef isfinite
#endif
#ifdef isinf
# undef isinf
#endif
#ifdef isnan
# undef isnan
#endif
#ifdef isnormal
# undef isnormal
#endif
#ifdef isgreater
# undef isgreater
#endif
#ifdef isgreaterequal
# undef isgreaterequal
#endif
#ifdef isless
# undef isless
#endif
#ifdef islessequal
# undef islessequal
#endif
#ifdef islessgreater
# undef islessgreater
#endif
#ifdef isunordered
# undef isunordered
#endif
#include <type_traits>
#if defined(__CUDACC__)
extern "C" {
    int signbit(double);
    int fpclassify(double);
    int isfinite(double);
    int isinf(double);
    int isnan(double);
    int isnormal(double);
    int isgreater(double, double);
    int isgreaterequal(double, double);
    int isless(double, double);
    int islessequal(double, double);
    int islessgreater(double, double);
    int isunordered(double, double);
}

// ─── supply a global abs(double) for host and device ─────────────────────────
__devicehost__ inline double abs(double x) {
    // __builtin_fabs works everywhere
    return __builtin_fabs(x);
}
#endif  // __CUDACC__

#include <cmath>

#include <stdexcept>
#include <random>

#include "cocl/cocl_memory.h"
#include "cocl/cocl_streams.h"
#include "cocl/cocl_context.h"
#include "cocl/cocl_device.h"
#include "cocl/cocl_error.h"
#include "cocl/cocl_properties.h"
// #include "cocl/cocl_blas.h"
#include "cocl/cocl_kernellaunch.h"
#include "cocl/cocl_funcs.h"
#include "cocl/hostside_opencl_funcs_ext.h"
#include "cocl/vector_types.h"

// #include <iostream>

__devicehost__ inline long long __double_as_longlong(double val) {
    return (long long)val;
}

__devicehost__ inline double __longlong_as_double(long long val) {
    return (double)val;
}

#ifdef __CUDA_ARCH__
__device__ unsigned long long atomicExch(volatile unsigned long long *p, unsigned long long val);
#else
__host__ inline unsigned long long atomicExch(volatile unsigned long long *p, unsigned long long val) {
    throw std::runtime_error("not implemented: atomicExch on host");
}
#endif

#define clock64() 0

typedef unsigned int CUjit_option;

#define CU_JIT_ERROR_LOG_BUFFER_SIZE_BYTES 65536
#define CU_JIT_INFO_LOG_BUFFER_SIZE_BYTES 65536

enum cujitenum {
    CU_JIT_LOG_VERBOSE = 50000,
    CU_JIT_INFO_LOG_BUFFER,
    CU_JIT_ERROR_LOG_BUFFER
};

#define CUDART_CB

#ifdef __CUDA_ARCH__  // deviceside?
namespace std {
__device__ void *malloc(size_t count);
__device__ void free(void *ptr);
} // namespace std

#endif // __CUDA_ARCH__ deviceside

typedef int64_t cudaTextureObject_t;
typedef int64_t TextureWord;
struct cudaChannelFormatDesc {
};
struct cudaTextureDesc {
};
struct cudaResourceDesc {
};
typedef int64_t cudaResourceTypeLinear;

template<typename T> cudaChannelFormatDesc cudaCreateChannelDesc();
template<typename T> TextureWord tex1Dfetch();

#endif // _COCL_H
