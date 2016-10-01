// This will try launching an opencl kernel, via the host-side function, calling into the device-side kernel
// this needs opencl installed, including working opencl gpu and drivers

#include <iostream>
#include <memory>

#include "EasyCL.h"

#include "CL/cl.h"

using namespace std;

void launchSetValue(float *data, int idx, float value);

void pretendLaunch(const char *kernelName) {
    // just a mock for now... can we call this from our modified ir?
    cout << "pretendLaunch(" << kernelName << ")" << endl;
}

int main(int argc, char *argv[]) {
    // cl_int err;
    // cl_platform_id platform = 0;
    // cl_device_id device = 0;
    // cl_context_properties props[3] = { CL_CONTEXT_PLATFORM, 0, 0 };
    // cl_context ctx = 0;
    // cl_command_queue queue = 0;
    // // cl_mem bufA, bufB, bufC;
    // // cl_event event = NULL;

    // err = clGetPlatformIDs(1, &platform, NULL);
    // if (err != CL_SUCCESS) {
    //     cout << "clGetPlatformIDs() failed with " << err << endl;
    //     return 1;
    // }
    // cout << "got platforms" << endl;

    // err = clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
    // if (err != CL_SUCCESS) {
    //     cout << "clGetPlatformIDs() failed with " << err << endl;
    //     return 1;
    // }
    // cout << "got device" << endl;

    // props[1] = (cl_context_properties)platform;
    // ctx = clCreateContext(props, 1, &device, NULL, NULL, &err);
    // if (err != CL_SUCCESS) {
    //     cout << "clCreateContext() failed with " << err << endl;
    //     return 1;
    // }
    // cout << "got context" << endl;

    // queue = clCreateCommandQueue(ctx, device, 0, &err);
    // if (err != CL_SUCCESS) {
    //     cout << "clCreateCommandQueue() failed with " << err << endl;
    //     clReleaseContext(ctx);
    //     return 1;
    // }
    // cout << "created queue" << endl;

    unique_ptr<EasyCL> cl(EasyCL::createForFirstGpuOtherwiseCpu());
    cl_int err;
    cl_context *ctx = cl->context;
    cl_command_queue *queue = cl->queue;

    int N = 1024;
    float *float_data = new float[N];
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_READ_ONLY, N * sizeof(float),
                                           NULL, &err);
    err = clEnqueueWriteBuffer(*queue, float_data_gpu, CL_TRUE, 0,
                                      N * sizeof(float), float_data, 0, NULL, NULL);

    launchSetValue((float *)float_data_gpu, 2, 123.0f);

    return 0;
}
