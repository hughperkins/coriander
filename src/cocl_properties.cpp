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

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

// #include "EasyCL.h"

#include "CL/cl.h"

using namespace std;
using namespace cocl;

size_t cuDeviceGetAttribute(
       int *value, int attribute, CUdevice device) {
    // COCL_PRINT(cout << "cuDeviceGetAttribute redirected" << endl);
    if(CU_DEVICE_ATTRIBUTE_ECC_ENABLED == attribute) {
        *value = 0;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_X == attribute) {
        *value = 1024;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Y == attribute) {
        *value = 1024;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_GRID_DIM_Z == attribute) {
        *value = 1024;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_MULTIPROCESSOR == attribute) {
        *value = 65536;
    } else if(CU_DEVICE_ATTRIBUTE_SHARED_MEMORY_PER_BLOCK == attribute) {
        *value = 65536;
    } else if(CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT == attribute) {
        *value = 16;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK == attribute) {
        *value = 64;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR == attribute) {
        *value = 128;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_BLOCK == attribute) {
        *value = 40000;
    } else if(CU_DEVICE_ATTRIBUTE_WARP_SIZE == attribute) {
        *value = 32;
    } else {
        cout << "attribute " << attribute << endl;
        throw runtime_error("attribute not implemented");
    }
    // cout << "cuDeviceGetAttribute redirected att=" << attribute << " value=" << *value << endl;
    return 0;
}

cudaSharedMemConfig cudaSharedMemBankSizeEightByte;

size_t cuDeviceGetName(char *buf, int bufsize, CUdevice device) {
    COCL_PRINT(cout << "cuDeviceGetName redirected" << endl);
    sprintf(buf, "an opencl device");
    return 0;
}

size_t cuDeviceGetPCIBusId(char *buf, int bufsize, CUdevice device) {
    COCL_PRINT(cout << "cuDeviceGetPCIBusId redirected" << endl);
    sprintf(buf, "0000.0000");
    return 0;
}

size_t cuDriverGetVersion(int *driver_version) {
    COCL_PRINT(cout << "cuDriverGetVersion redirected" << endl);
    *driver_version = 1;
    return 0;
}

size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, CUdevice device) {
    COCL_PRINT(cout << "cuDeviceComputeCapability redirected" << endl);
    *cc_major = 3;
    *cc_minor = 5;
    return 0;
}

size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, CUdevice device) {
    COCL_PRINT(cout << "cudaGetDeviceProperties stub device=" << device << endl);
    prop->totalGlobalMem = 1024 * 1024 * 1024;
    prop->sharedMemPerBlock = 65536;
    prop->regsPerBlock = 64;
    prop->warpSize = 32;
    // prop->memPitch = 4; // whats this?
    prop->maxThreadsPerBlock = 128;
    prop->maxThreadsDim[0] = 1024;
    prop->maxThreadsDim[1] = 1024;
    prop->maxThreadsDim[2] = 1024;
    prop->totalConstMem = 16 * 1024;
    prop->major = 3;
    prop->minor = 0;
    prop->clockRate = 900 * 1000 * 1000;
    // prop->textureAlignment = 128;  // whats this?
    // prop->deviceOverlap = 0; // whats this?
    prop->multiProcessorCount = 3;
    prop->kernelExecTimeoutEnabled = true;
    prop->integrated = true;
    prop->canMapHostMemory = false;
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
    return cudaGetDeviceProperties(device_properties, device_ordinal);
    // return -1;
}

size_t cudaDeviceSetSharedMemConfig(cudaSharedMemConfig config) {
    // stub
    return 0;
}
