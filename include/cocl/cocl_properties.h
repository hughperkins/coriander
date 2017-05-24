#pragma once

#include "cocl/cocl_device.h"

#include <cstddef>
#include <cstdint>
#include <string>

// order of members is arbitrary, just need our sourcecode to use the same declaration
struct cudaDeviceProp {
    // size_t memPitch;
    size_t totalConstMem;
    size_t totalGlobalMem;
    size_t sharedMemPerBlock;
    // size_t textureAlignment;
    int regsPerBlock;
    int warpSize;
    // int pciDeviceID;
    int maxThreadsPerBlock;  // <=
    int maxThreadsDim[3];
    int maxGridSize[3];
    int maxThreadsPerMultiProcessor;  // <=
    int clockRate;
    // int deviceOverlap;
    int multiProcessorCount;  // <=
    int kernelExecTimeoutEnabled;
    int integrated;
    int canMapHostMemory;
    int major;
    int minor;
    // int computeMode;
    // int concurrentKernels;
    // int ECCEnabled;
    // int pciBusID;
    // int tccDriver;
    char name[256];
};
typedef cudaDeviceProp CUdevprop;

// struct cudaSharedMemConfig {
//   // nothing here :-P
// };
typedef int cudaSharedMemConfig;  // thrust black_radix_rank.cuh means cannot be a string
typedef cudaSharedMemConfig CUsharedconfig;

// extern struct cudaSharedMemConfig cudaSharedMemBankSizeEightByte;
const cudaSharedMemConfig cudaSharedMemBankSizeFourByte = 123;
const cudaSharedMemConfig cudaSharedMemBankSizeEightByte = 423;
const cudaSharedMemConfig cudaSharedMemBankSizeDefault = 314;

// struct cudaSharedMemBankSizeEightByte {
// };

extern "C" {
    size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, CUdevice device);
    size_t cuDriverGetVersion(int *driver_version);
    size_t cuDeviceGetPCIBusId(char *buf, int bufsize, CUdevice device);
    size_t cuDeviceGetName(char *buf, int bufsize, CUdevice device);
    size_t cuDeviceGetAttribute(
       int *value, int attribute, CUdevice device);
    size_t cuDeviceGetProperties(struct cudaDeviceProp *device_properties, int device_ordinal);

    size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, CUdevice device);
    size_t cudaDeviceSetSharedMemConfig(cudaSharedMemConfig config);
    size_t cudaDeviceGetAttribute(
       int *value, int attribute, CUdevice device);
    size_t cudaDeviceGetSharedMemConfig(cudaSharedMemConfig *p_config);
}

// constants are arbitrary, just as long as we use this header file for compiling the client sourcecode
// (starting from 20000, errors start from 10000, easy to make not overlap, and might have some advatnages???)
enum deviceattributes {
    CU_DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK = 20000,
    CU_DEVICE_ATTRIBUTE_ECC_ENABLED,
    CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_X,
    CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y,
    CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z,
    CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_BLOCK = 20005,
    CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR,
    CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_BLOCK,
    CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT,
    CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR,
    CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK = 20010,
    CU_DEVICE_ATTRIBUTE_WARP_SIZE,
    cudaDevAttrComputeCapabilityMajor = 20100,
    cudaDevAttrMaxGridDimX,
    cudaDevAttrMaxGridDimY,
    cudaDevAttrMaxGridDimZ,
    cudaDevAttrMaxThreadsPerBlock,
    cudaDevAttrMaxThreadsPerMultiProcessor = 20105,
    cudaDevAttrComputeCapabilityMinor,
    cudaDevAttrMultiProcessorCount,
    cudaDevAttrMaxRegistersPerBlock,
    cudaDevAttrMaxSharedMemoryPerBlock,
    cudaDevAttrWarpSize = 20110
};
