#pragma once

#define __device__ __attribute__((device))
#define __host__ __attribute__((host))
#define __global__ __attribute__((global))
#define __shared__ __attribute__((shared))
#define __align__(x) __attribute__((aligned(x)))

#include "/home/ubuntu/git/cuda-ir-to-opencl/src/cocl_memory.h"
#include "/home/ubuntu/git/cuda-ir-to-opencl/src/cocl_streams.h"
#include "/home/ubuntu/git/cuda-ir-to-opencl/src/cocl_context.h"
#include "/home/ubuntu/git/cuda-ir-to-opencl/src/cocl_device.h"
#include "/home/ubuntu/git/cuda-ir-to-opencl/src/cocl_error.h"
#include "/home/ubuntu/git/cuda-ir-to-opencl/src/cocl_properties.h"
#include "/home/ubuntu/git/cuda-ir-to-opencl/src/EasyCL/EasyCL.h"

inline double rsqrt(double x) {
    return sqrt(1.0 / x);
}
#define rsqrtf(x) rsqrt(x)
#define sinpif sinpi
#define normcdff normcdf
#define erfcxf erfcx

typedef char *CUstream;
typedef cocl::Event *CUevent;
typedef void *CUdeviceptr;
typedef char *cudaStream_t;
typedef size_t cudaError_t;

#define CU_EVENT_DISABLE_TIMING 1
#define CU_MEMHOSTALLOC_PORTABLE 123
#define cudaSuccess 0
#define cudaStreamDefault 0

#define cuStreamDestroy cuStreamDestroy_v2
#define cuEventDestroy cuEventDestroy_v2

class  dim3 {
public:
dim3(unsigned int x, unsigned y, unsigned int z ) :x(x), y(y), z(z) {}
unsigned int x;
unsigned int y;
unsigned int z;
};
int cudaConfigureCall(dim3 grid, dim3 block, long long shared = 0,  char * stream = 0);
///int cudaConfigureCall(long long xy, int z, long long xy, int z, long long shared,  char * stream);
