// This will try launching an opencl kernel, via the host-side function, calling into the device-side kernel
// this needs opencl installed, including working opencl gpu and drivers

#include <iostream>
#include <memory>

#include "EasyCL.h"

#include "CL/cl.h"

using namespace std;

void launchSetValue(float *data, int idx, float value);

void pretendLaunch(
        const char *kernelName,
        int grid_x, int grid_y, int grid_z,
        int block_x, int block_y, int block_z) {
    // just a mock for now... can we call this from our modified ir?
    cout << "pretendLaunch(" << kernelName << ")" << endl;
    cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl;
    cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl;
}

int main(int argc, char *argv[]) {
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
