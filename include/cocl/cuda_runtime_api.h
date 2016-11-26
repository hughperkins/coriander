// #pragma once
// on thrust this gets included by guarded_cuda_runtime_api.h, after it undefined __host__ __device__
// and after this file has already been #include'd once, so we remove the #pragma once

#pragma message("cuda_runtime_api.h")
#if defined(__CUDACC__) || defined(__CUDA_ARCH__)
#pragma message("defining __device__ and __host__ as __attribute__(...)")
#define __device__ __attribute__((device))
#define __host__ __attribute__((host))
#else
#pragma message("defining __device__ and __host__ as nothingness")
#include <stdexcept>
#define __host__
#define __device__
#endif
