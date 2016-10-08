// This will try launching an opencl kernel, via the host-side function, calling into the device-side kernel
// this needs opencl installed, including working opencl gpu and drivers

#include <iostream>
#include <memory>

#include "EasyCL.h"

#include "CL/cl.h"

using namespace std;

void launchSetValue(float *data, int idx, float value);
void hostside_opencl_funcs_setCl(EasyCL *cl, cl_context *ctx, cl_command_queue *queue);

static unique_ptr<EasyCL> cl;

// #include "cuda.h"
#include <cuda_runtime.h>

void readfoobuffer();

int main(int argc, char *argv[]) {
    cl.reset(EasyCL::createForFirstGpuOtherwiseCpu());
    cl_int err;
    cl_context *ctx = cl->context;
    cl_command_queue *queue = cl->queue;

    hostside_opencl_funcs_setCl(cl.get(), ctx, queue);

    int N = 1024;
    float *float_data = new float[N];
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_READ_ONLY, N * sizeof(float),
                                           NULL, &err);
    err = clEnqueueWriteBuffer(*queue, float_data_gpu, CL_TRUE, 0,
                                      N * sizeof(float), float_data, 0, NULL, NULL);

    launchSetValue((float *)&float_data_gpu, 2, 123.0f);
    err = clEnqueueReadBuffer(*queue, float_data_gpu, CL_TRUE, 0,
                                      N * sizeof(float), float_data, 0, NULL, NULL);
    cl->finish();

    cout << "value of float_data[2] after calling kernel: " << float_data[2] << endl;

    float *gpuFloats;
    cudaMalloc((void**)(&gpuFloats), N * sizeof(float));
    cout << "gpufloats " << gpuFloats << endl;


    float valuesback[1];
    // err = clEnqueueReadBuffer(*queue, float_data_gpu, CL_TRUE, 0,
    //                                   1 * sizeof(float), valuesback, 0, NULL, NULL);
    // cl->finish();
    // cout << "valuesback[0] " << valuesback[0] << endl;

    // float valuesback[1];
    err = clEnqueueReadBuffer(*queue, *(cl_mem *)gpuFloats, CL_TRUE, 0,
                                      1 * sizeof(float), valuesback, 0, NULL, NULL);
    cl->finish();
    cout << "valuesback[0] " << valuesback[0] << endl;

    readfoobuffer();

    launchSetValue(gpuFloats, 2, 123.0f);
    cudaFree(gpuFloats);

    return 0;
}
