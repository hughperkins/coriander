#pragma once

#include <cstddef>
#include <cstdint>

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

struct cudaSharedMemConfig {
  // nothing here :-P
};

extern struct cudaSharedMemConfig cudaSharedMemBankSizeEightByte;

// struct cudaSharedMemBankSizeEightByte {
// };

extern "C" {
    size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, int device);
    size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, void *device);
    size_t cuDriverGetVersion(int *driver_version);
    size_t cuDeviceGetPCIBusId(char *buf, int bufsize, void *device);
    size_t cuDeviceGetName(char *buf, int bufsize, void *device);
    size_t cuDeviceGetAttribute(
       int64_t *value, int attribute, void *device);
    size_t cuDeviceGetProperties(struct cudaDeviceProp *device_properties, int device_ordinal);
    size_t cudaDeviceSetSharedMemConfig(cudaSharedMemConfig config);
}

// constants are arbitrary, just as long as we use this header file for compiling the client sourcecode
const int CU_DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK = 1;
const int CU_DEVICE_ATTRIBUTE_ECC_ENABLED = 2;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_X = 3;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y = 4;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z = 5;
const int CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR = 6;
const int CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT = 7;
const int CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR = 8;
const int CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK = 9;
const int CU_DEVICE_ATTRIBUTE_WARP_SIZE = 10;
