#pragma once

// #if defined(__CUDACC__) || defined(__CUDA_ARCH__)
#pragma message("defining device and host")
#define __device__ __attribute__((device))
#define __host__ __attribute__((host))
// #else
// #pragma message("stubbing device and host")
// #include <stdexcept>
// #define __host__
// #define __device__
// #endif

#include <stdexcept>
#include <cmath>
#include <random>

// #if defined(__CUDACC__) || defined(__CUDA_ARCH__)
// #define __device__ __attribute__((device))
// #define __host__ __attribute__((host))
// #else
// #include <stdexcept>
// #define __host__
// #define __device__
// #endif

// #define __host__ __attribute__((host))
#define __global__ __attribute__((global))
#define __constant__ __attribute__((constant))
#define __shared__ __attribute__((shared))
#define __align__(x) __attribute__((aligned(x)))

#define __launch_bounds__(x) __attribute__((launch_bounds(x)))

#include "cocl/cocl_memory.h"
#include "cocl/cocl_streams.h"
#include "cocl/cocl_context.h"
#include "cocl/cocl_device.h"
#include "cocl/cocl_error.h"
#include "cocl/cocl_properties.h"
#include "cocl/cocl_blas.h"
#include "cocl/cocl_kernellaunch.h"
// #include "cocl/EasyCL/EasyCL.h"
#include "cocl/vector_types.h"

inline double rsqrt(double x) {
    return sqrt(1.0 / x);
}
inline int __clz(int value);
#define rsqrtf(x) rsqrt(x)
#define sinpif sinpi
#define normcdff normcdf
#define erfcxf erfcx

typedef size_t cudaError_t;
typedef size_t CUresult;
#define cudaSuccess 0

// used by stream_executor/cl_driver.h; we just declare them for now...
typedef void *CUfunction;
typedef void *CUfunction_attribute;
typedef const std::discrete_distribution<int> CUfunc_cache;
// struct CUfunc_cache {
// };
typedef void *CUmodule;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_NONE;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_SHARED;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_L1;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_EQUAL;

class  dim3 {
public:
dim3(unsigned int x, unsigned y, unsigned int z ) :x(x), y(y), z(z) {}
dim3(unsigned int x, unsigned y ) :x(x), y(y), z(1) {}
dim3(unsigned int x ) :x(x), y(1), z(1) {}
dim3() :x(1), y(1), z(1) {}
unsigned int x;
unsigned int y;
unsigned int z;
};

__host__ __device__ inline long long __double_as_longlong(double val) {
    return (long long)val;
}

__host__ __device__ inline double __longlong_as_double(long long val) {
    return (double)val;
}

// __attribute__((device)) <template typename T> T atomicExch(volatile T *p, T val);
// __attribute__((host)) int atomic_xchg


// __attribute__((host)) <template typename T> T atomicExch(volatile T *p, T val) {
//     throw std::runtime_error("not implemented: atomicExch on host");
//     // std::atomic<T> global;
//     // return atomic::exchange(p, val)
// }

__host__ inline unsigned long long atomicExch(volatile unsigned long long *p, unsigned long long val) {
    throw std::runtime_error("not implemented: atomicExch on host");
    // std::atomic<T> global;
    // return atomic::exchange(p, val)
}

// #define atomicExch atomic_xchg

extern "C" {
    int cudaConfigureCall(const dim3 grid, const dim3 block, long long shared = 0,  char * stream = 0);
    ///int cudaConfigureCall(long long xy, int z, long long xy, int z, long long shared,  char * stream);
    // size_t cudaConfigureCall(
    //     unsigned long long grid_xy, unsigned int grid_z,
    //     unsigned long long block_xy, unsigned int block_z, size_t sharedMem=0, void *stream=0);

}

// int cudaConfigureCall(int gridx, int blockx, long long shared = 0,  char * stream = 0);

// stuff for device
// struct float4 {
// // public:
//     float4();
//     float4(const float4 &second);
//     float x;
//     float y;
//     float z;
//     float w;
// };

#define clock64() 0

void syncthreads();

__device__ __host__ int __shfl_xor(int a, int b); // just declare it for now, to get Eigen compiling. Figure out what to do with it
// later...

// ditto
__device__ __host__ int __umulhi(int magic, int n);

typedef unsigned int CUjit_option;

#define CU_JIT_ERROR_LOG_BUFFER_SIZE_BYTES 65536
#define CU_JIT_INFO_LOG_BUFFER_SIZE_BYTES 65536

enum cujitenum {
    CU_JIT_LOG_VERBOSE = 50000,
    CU_JIT_INFO_LOG_BUFFER,
    CU_JIT_ERROR_LOG_BUFFER
};

#define CUDART_CB

// we'll need to hack this call later on, when we write out the OpenCL.  At least, this placeholder lets us compile to IR
// for now
// __device___ bool __isGlobal(void *ptr);

bool __isGlobal(const void *ptr);

// bool __isGlobal(const void *ptr) {
//     return true;
// }
