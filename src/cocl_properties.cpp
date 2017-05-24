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

size_t cuDeviceGetAttribute(
       int *value, int attribute, CUdevice device) {
    // ThreadVars *v = getThreadVars();
    // ThreadVars *v = getThreadVars();
    // cocl::CoclDevice *coclDevice = static_cast<CoclDevice *>(device);
    // cl_device_id deviceid = getDeviceByIdx(v->currentDevice);
    // EasyCL *cl = v->getCl();
    cocl::CoclDevice *coclDevice = getCoclDeviceByGpuOrdinal(device);
    COCL_PRINT(cout << "cuDeviceGetAttribute device ordinal=" << coclDevice->gpuOrdinal << endl);
    cl_device_id clDeviceId = coclDevice->deviceId;
    // COCL_PRINT(cout << "cuDeviceGetAttribute current device=" << v->currentDevice << endl);
    // COCL_PRINT(cout << "cuDeviceGetAttribute device=" << device << endl);
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
        *value = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_LOCAL_MEM_SIZE);
    } else if(CU_DEVICE_ATTRIBUTE_MULTIPROCESSOR_COUNT == attribute) {
        *value = easycl::getDeviceInfoInt(clDeviceId, CL_DEVICE_MAX_COMPUTE_UNITS);
    } else if(CU_DEVICE_ATTRIBUTE_MAX_REGISTERS_PER_BLOCK == attribute) {
        *value = 64;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_THREADS_PER_MULTIPROCESSOR == attribute) {
        *value = 128;
    } else if(CU_DEVICE_ATTRIBUTE_MAX_SHARED_MEMORY_PER_BLOCK == attribute) {
        *value = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_LOCAL_MEM_SIZE);
    } else if(CU_DEVICE_ATTRIBUTE_WARP_SIZE == attribute) {
        *value = 32;  // should do like: if amd then 64, else 32
    } else {
        cout << "attribute " << attribute << endl;
        throw runtime_error("attribute not implemented");
    }
    // cout << "cuDeviceGetAttribute redirected att=" << attribute << " value=" << *value << endl;
    return 0;
}

// cudaSharedMemConfig cudaSharedMemBankSizeEightByte;

size_t cuDeviceGetName(char *buf, int bufsize, CUdevice device) {
    COCL_PRINT(cout << "cuDeviceGetName device=" << device << endl);
    // ThreadVars *v = getThreadVars();
    // ThreadVars *v = getThreadVars();
    // cl_device_id deviceid = getDeviceByIdx(v->currentDevice);
    // device -= 1000;
    // cl_device_id deviceid = getDeviceByIdx(device);
    // cocl::CoclDevice *coclDevice = static_cast<CoclDevice *>(device);
    cocl::CoclDevice *coclDevice = getCoclDeviceByGpuOrdinal(device);
    COCL_PRINT(cout << "cuDeviceGetName gpuOrdinal=" << coclDevice->gpuOrdinal << endl);
    cl_device_id clDeviceId = coclDevice->deviceId;
    // EasyCL *cl = v->getCl();
    string name = easycl::getDeviceInfoString(clDeviceId, CL_DEVICE_NAME);
    sprintf(buf, "%s", name.c_str());
    // sprintf(buf, "an opencl device");
    return 0;
}

size_t cuDeviceGetPCIBusId(char *buf, int bufsize, CUdevice device) {
    COCL_PRINT(cout << "cuDeviceGetPCIBusId" << endl);
    sprintf(buf, "0000.0000");
    return 0;
}

size_t cuDriverGetVersion(int *driver_version) {
    COCL_PRINT(cout << "cuDriverGetVersion" << endl);
    *driver_version = 1;
    return 0;
}

size_t cuDeviceComputeCapability(int *cc_major, int *cc_minor, CUdevice device) {
    COCL_PRINT(cout << "cuDeviceComputeCapability" << endl);
    *cc_major = 3;
    *cc_minor = 5;
    return 0;
}

size_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, CUdevice device) {
    // cocl::CoclDevice *coclDevice = static_cast<CoclDevice *>(device);
    cocl::CoclDevice *coclDevice = getCoclDeviceByGpuOrdinal(device);
    COCL_PRINT(cout << "cudaGetDeviceProperties gpuOrdinal=" << coclDevice->gpuOrdinal << endl);
    // prop->totalGlobalMem = deviceinfo_helper->easycl::getDeviceInfoInt64(cl->device, CL_DEVICE_MAX_MEM_ALLOC_SIZE);
    // ThreadVars *v = getThreadVars();
    // cout << "initing clew..." << endl;
    clewInit();
    // cl_device_id deviceid = getDeviceByIdx(device - 1000);
    cl_device_id clDeviceId = coclDevice->deviceId;
    // EasyCL *cl = v->getCl();
    prop->totalGlobalMem = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_GLOBAL_MEM_SIZE);
    prop->sharedMemPerBlock = easycl::getDeviceInfoInt64(clDeviceId, CL_DEVICE_LOCAL_MEM_SIZE);
    prop->regsPerBlock = 64;
    prop->warpSize = 32;
    // prop->memPitch = 4; // whats this?
    // prop->maxThreadsPerBlock = easycl::getDeviceInfoInt(deviceid, CL_DEVICE_MAX_WORK_GROUP_SIZE);
    prop->maxThreadsPerBlock = 256;
    prop->maxThreadsDim[0] = 1024;
    prop->maxThreadsDim[1] = 1024;
    prop->maxThreadsDim[2] = 1024;
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
    COCL_PRINT(cout << "cuDeviceGetProperties ordinal=" << device_ordinal << endl);
    return cudaGetDeviceProperties(device_properties, device_ordinal);
    // return -1;
}

size_t cudaDeviceSetSharedMemConfig(cudaSharedMemConfig config) {
    // stub
    return 0;
}
