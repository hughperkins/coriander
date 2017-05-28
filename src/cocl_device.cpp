#include "cocl/cocl_device.h"

#include "cocl/cocl_context.h"

#include "EasyCL/EasyCL.h"

#include <iostream>
#include <vector>
#include <memory>
using namespace std;

#include "pthread.h"

namespace cocl {
    // int currentDevice = 0;
}

using namespace cocl;

#ifdef COCL_PRINT
#undef COCL_PRINT
#define COCL_PRINT(x) 
#endif

namespace cocl {
    static pthread_mutex_t cldevices_mutex = PTHREAD_MUTEX_INITIALIZER;

    template<typename T>
    static std::string toString(T val) {
       std::ostringstream myostringstream;
       myostringstream << val;
       return myostringstream.str();
    }

    // cl_device_id getClDeviceIdByOrdinal(int gpu) {
    //     COCL_PRINT(cout << "cocl::getClDeviceIdByDeviceIdx gpu=" << gpu << endl);
    //     cl_int error;
    //     int currentGpuIndex = 0;
    //     cl_platform_id platform_ids[10];
    //     cl_uint num_platforms;
    //     // error = clGetPlatformIDs(0, 0, &num_platforms);
    //     // cout << "Num OpenCL platforms: " << num_platforms << endl;
    //     error = clGetPlatformIDs(10, platform_ids, &num_platforms);
    //     if (error != CL_SUCCESS) {
    //        throw std::runtime_error("Error getting OpenCL platforms ids, OpenCL errorcode: opencl error " + toString(error));
    //     }
    //     if(num_platforms == 0) {
    //        throw std::runtime_error("Error: no OpenCL platforms available");
    //     }
    //     for(int platform =  0; platform < (int)num_platforms; platform++) {
    //         cl_platform_id platform_id = platform_ids[platform];
    // //        cout << "checking platform id " << platform_id << endl;
    //         cl_device_id device_ids[100];
    //         cl_uint num_devices;
    //         error = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_GPU | CL_DEVICE_TYPE_ACCELERATOR , 100, device_ids, &num_devices);
    //         if (error != CL_SUCCESS) {
    //             continue;
    // //           throw std::runtime_error("Error getting device ids for platform " + toString(platform) + ": " + errorMessage(error));
    //         }
    // //        cout << "gpu=" << gpu << " currentGpuIndex=" << currentGpuIndex << " num_devices=" << num_devices << endl;
    //         if(( gpu - currentGpuIndex) < (int)num_devices) {
    //             return device_ids[(gpu - currentGpuIndex)];
    //             // return new EasyCL(platform_id, device_ids[(gpu - currentGpuIndex)], verbose);
    //         } else {
    //             currentGpuIndex += num_devices;
    //         }
    //     }
    //     if(gpu == 0) {
    //         throw std::runtime_error("No OpenCL-enabled GPUs found");
    //     } else {
    //         throw std::runtime_error("Not enough OpenCL-enabled GPUs found to satisfy gpu index: " + toString(gpu) );
    //     }
    // }
    CoclDevice::CoclDevice(int gpuOrdinal, cl_platform_id platform_id, cl_device_id device_id) :
                gpuOrdinal(gpuOrdinal),
                platformId(platform_id), deviceId(device_id)
            {
        COCL_PRINT(cout << "CoclDevice::CoclDevice gpuOrdinal=" << gpuOrdinal << endl);
        // this->platform_id = _platform_id;
        // this->device_id = _device_id;
    }

    int numGpus = 0;
    std::vector<std::unique_ptr<cocl::CoclDevice> > deviceByOrdinal;
    bool devicesInitialized = false;
    void initDevices() {
        if(devicesInitialized) {
            return;
        }
        pthread_mutex_lock(&cldevices_mutex);
        if(devicesInitialized) {
            return;
        }
        numGpus = easycl::DevicesInfo::getNumGpus();
        for(int gpu=0; gpu < numGpus; gpu++) {
            cl_platform_id platformId;
            cl_device_id deviceId;
            easycl::DevicesInfo::getIdForIndexedGpu(gpu, &platformId, &deviceId);
            deviceByOrdinal.push_back(unique_ptr<CoclDevice>(new CoclDevice(gpu, platformId, deviceId)));
            // cout << " found gpu platform=" << platformId << " device=" << deviceId << endl;
        }

        // this should only be set once everything really has been initialized:
        devicesInitialized = true;
        pthread_mutex_unlock(&cldevices_mutex);        
    }
    CoclDevice *getCoclDeviceByGpuOrdinal(int gpuOrdinal) {
        // ThreadVars *v = getThreadVars();
        initDevices();
        if(gpuOrdinal < 0) {
            cout << "Cannot choose gpu device less than 0" << endl;
            throw runtime_error("Cannot choose gpu device less than 0");
        }
        if(gpuOrdinal >= (int)cocl::deviceByOrdinal.size()) {
            cout << "Cannot choose gpu device more than " << cocl::deviceByOrdinal.size() << endl;
            throw runtime_error("gpu device ordinal beyond range of number of gpus");
        }
        return deviceByOrdinal[gpuOrdinal].get();        
    }
    // CoclDevice getCoclDeviceForCUDevice(CU)
} // namespace cocl

size_t cuDeviceGet (CUdevice *p_device, int gpuOrdinal) {
    COCL_PRINT(cout << "cuDeviceGet gpuOrdinal=" << gpuOrdinal << endl);
    // ThreadVars *v = getThreadVars();
    // if(ordinal < 0) {
    //     cout << "Cannot choose gpu device less than 0" << endl;
    //     throw runtime_error("Cannot choose gpu device less than 0");
    // }
    // if(ordinal >= cocl::deviceByOrdinal.size()) {
    //     cout << "Cannot choose gpu device more than " << cocl::deviceByOrdinal.size() << endl;
    //     throw runtime_error("gpu device ordinal beyond range of number of gpus");
    // }
    // cocl::initDevices();
    getCoclDeviceByGpuOrdinal(gpuOrdinal); // just want this for validation really
    *p_device = gpuOrdinal;
    // *p_device = cocl::getCoclDeviceByGpuOrdinal(gpuOrdinal);
    // *p_device = deviceByOrdinal[ordinal];
    // *device = v->deviceByOrdinal[ordinal];
    // *(int *)device = v->currentDevice;
    // *(int *)device = 1000 + ordinal; // v->currentDevice;
    return 0;
}

size_t cuDeviceGetCount (int *p_count) {
    return cudaGetDeviceCount(p_count);
}

size_t cudaGetDevice(int *p_ordinal) {
    ThreadVars *v = getThreadVars();
    *p_ordinal = v->currentGpuOrdinal;
    COCL_PRINT(cout << "cudaGetDevice returning ordinal=" << *p_ordinal << endl);
    return 0;
}

size_t cudaGetDeviceCount (int *p_count) {
    // *count = getNumGpus();
    initDevices();
    *p_count = deviceByOrdinal.size();
    COCL_PRINT(cout << "cudaGetDeviceCount count=" << *p_count << endl);
    // *count = 1;  // we need a bunch of work to iplement more thna 1 device...
    return 0;
}

size_t cudaSetDevice (int gpuOrdinal) {
    COCL_PRINT(cout << "cudaSetDevice gpuOrdinal=" << gpuOrdinal << endl);
    ThreadVars *v = getThreadVars();
    initDevices();
    if(gpuOrdinal < 0 || gpuOrdinal >= (int)deviceByOrdinal.size()) {
        cout << "No gpu available at index " << gpuOrdinal << endl;
        throw runtime_error("No gpu found at specific index");
    }
    // device -= 1000;
    // CoclDevice *coclDevice = static_cast<CoclDevice *>(device);
    // int ordinal = coclDevice->ordinal;
    // if(ordinal < 0) {
    //     throw runtime_error("Cannot set device less than 0");
    // }
    // if(device >= getNumGpus()) {
    // //if(device > 0) {
    //     throw runtime_error("Cannot set device to outside of range 0 to " + toString(getNumGpus() - 1));
    //     //throw runtime_error("Not yet implemented: switching to non-zero device");
    // }
    v->currentGpuOrdinal = gpuOrdinal;
    return 0;
}

size_t cudaDeviceReset() {
    cout << "ignoring cudaDeviceReset for now" << endl;
    return 0;
    //throw runtime_error("Not yet implemented, please raise an issue at https://github.com/hughperkins/Coriander/issues");
}

size_t cudaDeviceSynchronize() {
    cout << "ignoring cudaDeviceSynchronize for now" << endl;
    return 0;
}
