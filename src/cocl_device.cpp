#include "cocl/cocl_device.h"

#include "cocl/local_config.h"

#include "EasyCL.h"

#include <iostream>
using namespace std;

namespace cocl {
    int currentDevice = 0;
}

using namespace cocl;

size_t cuDeviceGet (CUdevice *device, int ordinal) {
    COCL_PRINT(cout << "cuDeviceGet redirected" << endl);
    *(int *)device = cocl::currentDevice;
    return 0;
}

size_t cuDeviceGetCount (int *count) {
    return cudaGetDeviceCount(count);
}

size_t cudaGetDevice(CUdevice *device) {
    COCL_PRINT(cout << "cudaGetDevice" << endl);
    *device = cocl::currentDevice;
    return 0;
}

size_t cudaGetDeviceCount (int *count) {
    COCL_PRINT(cout << "cudaGetDeviceCount" << endl);
    // *count = easycl::DevicesInfo::getNumGpus();
    *count = 0;  // we need a bunch of work to iplement more thna 1 device...
    return 0;
}

size_t cudaSetDevice (CUdevice device) {
    COCL_PRINT(cout << "cudaSetDevice stub device=" << device << endl);
    if(device < 0) {
        throw runtime_error("Cannot set device less than 0");
    }
    // if(device >= easycl::DevicesInfo::getNumGpus()) {
    if(device > 0) {
        // throw runtime_error("Cannot set device to outside of range 0 to " + toString(easycl::DevicesInfo::getNumGpus() - 1));
        throw runtime_error("Not yet implemented: switching to non-zero device");
    }
    cocl::currentDevice = device;
    return 0;
}
