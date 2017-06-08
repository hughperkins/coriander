// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "cocl/cocl_properties.h"

#include "cocl/hostside_opencl_funcs.h"
#include "cocl/cocl_context.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

#include "EasyCL/EasyCL.h"

// #include "CL/cl.h"

using namespace std;
using namespace cocl;
// using namespace easycl;

#ifdef COCL_PRINT
#undef COCL_PRINT
#endif

#ifdef COCL_SPAM_PROPERTIES
#define COCL_PRINT(x) std::cout << "[PROPERTIES] " << x << std::endl;
#else
#define COCL_PRINT(x)
#endif

size_t cuDeviceGetAttribute(
       int *value, int attribute, CUdevice device) {

    // cudaDevAttrComputeCapabilityMajor,
    // cudaDevAttrComputeCapabilityMinor,

    cocl::CoclDevice *coclDevice = getCoclDeviceByGpuOrdinal(device);
    // COCL_PRINT("cuDeviceGetAttribute device ordinal=" << coclDevice->gpuOrdinal);
    cl_device_id clDeviceId = coclDevice->deviceId;
    switch(attribute) {
        case cudaDevAttrComputeCapabilityMajor:
            *value = 3;
            COCL_PRINT("requesting cudaDevAttrComputeCapabilityMajor: " << *value);
            break;

        case cudaDevAttrComputeCapabilityMinor:
            *value = 0;
            COCL_PRINT("requesting cudaDevAttrComputeCapabilityMinor " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_ECC_ENABLED:
            *value = 0;
            COCL_PRINT("requesting ecc enabled: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_X:
        case cudaDevAttrMaxGridDimX:
            *value = 256;
            COCL_PRINT("requesting gridx " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y:
        case cudaDevAttrMaxGridDimY:
            *value = 256;
            COCL_PRINT("requesting gridy: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z:
        case cudaDevAttrMaxGridDimZ:
            *value = 256;
            COCL_PRINT("requesting gridx: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR:
            *value = 65536;
            COCL_PRINT("requesting MAX_SHARED_MEMORY_PER_MULTIPROCESSOR: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK:
        case cudaDevAttrMaxSharedMemoryPerBlock:
            *value = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_LOCAL_MEM_SIZE);
            COCL_PRINT("requesting SHARED_MEMORY_PER_BLOCK: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT:
        case cudaDevAttrMultiProcessorCount:
            *value = easycl::getDeviceInfoInt(clDeviceId, CL_DEVICE_MAX_COMPUTE_UNITS);
            COCL_PRINT("requesting MULTIPROCESSOR_COUNT: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK:
        case cudaDevAttrMaxRegistersPerBlock:
            *value = 64;
            COCL_PRINT("requesting MAX_REGISTERS_PER_BLOCK: " << * value);
            break;

        case CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR:
        case cudaDevAttrMaxThreadsPerBlock:  // ok, this is probably wrong...
        case cudaDevAttrMaxThreadsPerMultiProcessor:
            *value = 128;
            COCL_PRINT("requesting MAX_THREADS_PER_MULTIPROCESSOR: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_BLOCK:
            *value = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_LOCAL_MEM_SIZE);
            COCL_PRINT("requesting MAX_SHARED_MEMORY_PER_BLOCK: " << *value);
            break;

        case CU_DEVICE_ATTRIBUTE_WARP_SIZE:
        case cudaDevAttrWarpSize:
            *value = 32;  // should do like: if amd then 64, else 32
            COCL_PRINT("requesting warp size: " << *value);
            break;

        default:
            cout << __FILE__ << ":" << __LINE__ << " ERROR: attribute " << attribute << " not implemented" << endl;
            throw runtime_error("attribute not implemented");
    }

    // cout << "cuDeviceGetAttribute redirected att=" << attribute << " value=" << *value << endl;
    return 0;
}

size_t cudaDeviceGetAttribute(
       int *value, int attribute, CUdevice device) {
    return cuDeviceGetAttribute(value, attribute, device);
}

// cudaSharedMemConfig cudaSharedMemBankSizeEightByte;

size_t cuDeviceGetName(char *buf, int bufsize, CUdevice device) {
    cocl::CoclDevice *coclDevice = getCoclDeviceByGpuOrdinal(device);
    cl_device_id clDeviceId = coclDevice->deviceId;
    string name = easycl::getDeviceInfoString(clDeviceId, CL_DEVICE_NAME);
    sprintf(buf, "%s", name.c_str());
    COCL_PRINT("cuDeviceGetName gpuOrdinal=" << coclDevice->gpuOrdinal << ": " << name);
    return 0;
}

size_t cuDeviceGetPCIBusId(char *buf, int bufsize, CUdevice device) {
    sprintf(buf, "0000.0000");
    COCL_PRINT("cuDeviceGetPCIBusId: " << buf);
    return 0;
}

size_t cuDriverGetVersion(int *driver_version) {
    *driver_version = 1;
    COCL_PRINT("cuDriverGetVersion: " << *driver_version);
    return 0;
}

size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, CUdevice device) {
    COCL_PRINT("cuDeviceComputeCapability");
    *cc_major = 3;
    *cc_minor = 5;
    return 0;
}

size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, CUdevice device) {
    cocl::CoclDevice *coclDevice = getCoclDeviceByGpuOrdinal(device);
    COCL_PRINT("cudaGetDeviceProperties gpuOrdinal=" << coclDevice->gpuOrdinal);
    clewInit();
    cl_device_id clDeviceId = coclDevice->deviceId;

    prop->totalGlobalMem = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_GLOBAL_MEM_SIZE);
    prop->sharedMemPerBlock = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_LOCAL_MEM_SIZE);
    prop->regsPerBlock = 64;
    prop->warpSize = 32;
    // prop->memPitch = 4; // whats this?
    // prop->maxThreadsPerBlock = easycl::getDeviceInfoInt(deviceid, CL_DEVICE_MAX_WORK_GROUP_SIZE);
    prop->maxThreadsPerBlock = 256;
    prop->maxThreadsDim[0] = 256;
    prop->maxThreadsDim[1] = 256;
    prop->maxThreadsDim[2] = 256;
    prop->totalConstMem = 16 * 1024;
    prop->major = 3;
    prop->minor = 0;
    prop->clockRate = easycl::getDeviceInfoInt(clDeviceId, CL_DEVICE_MAX_CLOCK_FREQUENCY) * 1000 * 1000;
    // prop->textureAlignment = 128;  // whats this?
    // prop->deviceOverlap = 0; // whats this?
    prop->multiProcessorCount = easycl::getDeviceInfoInt(clDeviceId, CL_DEVICE_MAX_COMPUTE_UNITS);
    prop->kernelExecTimeoutEnabled = true;
    prop->integrated = false;
    prop->canMapHostMemory = false;  // I dont want this changing across devices for now, neough bugs for now...
    // prop->integrated = !easycl::getDeviceInfoBool(deviceid, CL_DEVICE_HOST_UNIFIED_MEMORY);
    // prop->canMapHostMemory = easycl::getDeviceInfoBool(deviceid, CL_DEVICE_HOST_UNIFIED_MEMORY);
    // prop->computeMode = 0;  //whats this?
    // prop->concurrentKernels = 1;
    // prop->ECCEnabled = false;
    // prop->pciBusID = 0;
    // prop->pciDeviceID = 0;
    // prop->tccDriver = 0; // no idea
    prop->maxThreadsPerMultiProcessor = 128;
    return 0;
}

size_t cuDeviceGetProperties(struct cudaDeviceProp *device_properties, CUdevice device_ordinal) {
    // COCL_PRINT("cuDeviceGetProperties ordinal=" << device_ordinal);
    return cudaGetDeviceProperties(device_properties, device_ordinal);
    // return -1;
}

size_t cudaDeviceSetSharedMemConfig(cudaSharedMemConfig config) {
    // stub
    COCL_PRINT("*STUB* cudaDeviceSetSharedMemConfig");
    return 0;
}
