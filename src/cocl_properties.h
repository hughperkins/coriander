#pragma once

#include <cstddef>
#include <cstdint>

struct cudaDeviceProp {
    char name[256];
    size_t totalGlobalMem;
    size_t sharedMemPerBlock;
    int regsPerBlock;
    int warpSize;
    size_t memPitch;
    int maxThreadsPerBlock;
    int maxThreadsDim[3];
    int maxGridSize[3];
    size_t totalConstMem;
    int major;
    int minor;
    int clockRate;
    size_t textureAlignment;
    int deviceOverlap;
    int multiProcessorCount;
    int kernelExecTimeoutEnabled;
    int integrated;
    int canMapHostMemory;
    int computeMode;
    int concurrentKernels;
    int ECCEnabled;
    int pciBusID;
    int pciDeviceID;
    int tccDriver;
};

extern "C" {
    size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, int device);
    size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, void *device);
    size_t cuDriverGetVersion(int *driver_version);
    size_t cuDeviceGetPCIBusId(char *buf, int bufsize, void *device);
    size_t cuDeviceGetName(char *buf, int bufsize, void *device);
    size_t cuDeviceGetAttribute(
       int64_t *value, int attribute, void *device);
    size_t cuDeviceGetProperties(struct cudaDeviceProp *device_properties, int device_ordinal);
}

// enum constants from http://docs.nvidia.com/cuda/cuda-driver-api/group__CUDA__TYPES.html#axzz4N4NYrYWt
const int CU_DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK = 8;
const int CU_DEVICE_ATTRIBUTE_ECC_ENABLED = 32;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_X = 5;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y = 6;
const int CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z = 7;
const int CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR = 81;
const int CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT = 16;
const int CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR = 39;
const int CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK = 12;
const int CU_DEVICE_ATTRIBUTE_WARP_SIZE = 10;
