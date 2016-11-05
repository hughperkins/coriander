#include "cocl/cocl_device.h"

#include "cocl/cocl_context.h"
#include "cocl/local_config.h"

#include "EasyCL/EasyCL.h"

#include <iostream>
using namespace std;

namespace cocl {
    // int currentDevice = 0;
}

using namespace cocl;

namespace cocl {
    template<typename T>
    static std::string toString(T val) {
       std::ostringstream myostringstream;
       myostringstream << val;
       return myostringstream.str();
    }

    cl_device_id getDeviceByIdx(int gpu) {
        cl_int error;
        int currentGpuIndex = 0;
        cl_platform_id platform_ids[10];
        cl_uint num_platforms;
        // error = clGetPlatformIDs(0, 0, &num_platforms);
        // cout << "Num OpenCL platforms: " << num_platforms << endl;
        error = clGetPlatformIDs(10, platform_ids, &num_platforms);
        if (error != CL_SUCCESS) {
           throw std::runtime_error("Error getting OpenCL platforms ids, OpenCL errorcode: opencl error " + toString(error));
        }
        if(num_platforms == 0) {
           throw std::runtime_error("Error: no OpenCL platforms available");
        }
        for(int platform =  0; platform < (int)num_platforms; platform++) {
            cl_platform_id platform_id = platform_ids[platform];
    //        cout << "checking platform id " << platform_id << endl;
            cl_device_id device_ids[100];
            cl_uint num_devices;
            error = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_GPU | CL_DEVICE_TYPE_ACCELERATOR , 100, device_ids, &num_devices);
            if (error != CL_SUCCESS) {
                continue;
    //           throw std::runtime_error("Error getting device ids for platform " + toString(platform) + ": " + errorMessage(error));
            }
    //        cout << "gpu=" << gpu << " currentGpuIndex=" << currentGpuIndex << " num_devices=" << num_devices << endl;
            if(( gpu - currentGpuIndex) < (int)num_devices) {
                return device_ids[(gpu - currentGpuIndex)];
                // return new EasyCL(platform_id, device_ids[(gpu - currentGpuIndex)], verbose);
            } else {
                currentGpuIndex += num_devices;
            }
        }
        if(gpu == 0) {
            throw std::runtime_error("No OpenCL-enabled GPUs found");
        } else {
            throw std::runtime_error("Not enough OpenCL-enabled GPUs found to satisfy gpu index: " + toString(gpu) );
        }
    }
}

size_t cuDeviceGet (CUdevice *device, int ordinal) {
    COCL_PRINT(cout << "cuDeviceGet redirected" << endl);
    ThreadVars *v = getThreadVars();
    *(int *)device = v->currentDevice;
    return 0;
}

size_t cuDeviceGetCount (int *count) {
    return cudaGetDeviceCount(count);
}

size_t cudaGetDevice(CUdevice *device) {
    COCL_PRINT(cout << "cudaGetDevice" << endl);
    ThreadVars *v = getThreadVars();
    *device = v->currentDevice;
    return 0;
}

size_t cudaGetDeviceCount (int *count) {
    COCL_PRINT(cout << "cudaGetDeviceCount" << endl);
    *count = easycl::DevicesInfo::getNumGpus();
    // *count = 1;  // we need a bunch of work to iplement more thna 1 device...
    return 0;
}

size_t cudaSetDevice (CUdevice device) {
    COCL_PRINT(cout << "cudaSetDevice stub device=" << device << endl);
    ThreadVars *v = getThreadVars();
    if(device < 0) {
        throw runtime_error("Cannot set device less than 0");
    }
    if(device >= easycl::DevicesInfo::getNumGpus()) {
    //if(device > 0) {
        throw runtime_error("Cannot set device to outside of range 0 to " + toString(easycl::DevicesInfo::getNumGpus() - 1));
        //throw runtime_error("Not yet implemented: switching to non-zero device");
    }
    v->currentDevice = device;
    return 0;
}
