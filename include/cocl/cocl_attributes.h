#pragma once

#ifdef __CUDA_ARCH__
// #pragma message("cuda arch")
#endif

#ifdef __CUDACC__
// #pragma message("cudacc")
#endif

// #if defined(__CUDACC__) || defined(__CUDA_ARCH__)
// #pragma message("defining device and host")
// #ifdef __CUDACC__ // cu file?
#define __device__ __attribute__((device))
#define __host__ __attribute__((host))
// #else
// #define __device__
// #define __host__
// #endif

// #ifdef __CUDACC__ // cu file?
#ifdef __CUDA_ARCH__ // means device-side
// #pragma message("deviceside")
#define __devicehost__ __attribute__((device))
#define __DEVICESIDE__
#else
// #pragma message("hostside")
// #define __devicehost__ __attribute__((host))
#define __HOSTSIDE__
#define __devicehost__ __attribute__((device)) __attribute__((host))
#endif

#ifndef __CUDACC__  // normal cpp file
// remove these defs: these functions will be hostside by default, in a normal cpp file
#undef __devicehost__
#define __devicehost__ 
#undef __host__
#define __host__ 
#endif

// #else // cpp file, not cu file
// #define __HOSTSIDE__
// #define __devicehost__
// #endif

// #else
// #pragma message("stubbing device and host")
// #include <stdexcept>
// #define __host__
// #define __device__
// #endif

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
