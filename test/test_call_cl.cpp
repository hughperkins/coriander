// This will try launching an opencl kernel, via the host-side function, calling into the device-side kernel
// this needs opencl installed, including working opencl gpu and drivers

#include <iostream>
#include <memory>

using namespace std;

void launchSetValue(float *data, int idx, float value);

// #include "cuda.h"
#include <cuda_runtime.h>

void hostside_opencl_funcs_init();

int main(int argc, char *argv[]) {
    hostside_opencl_funcs_init();

    int N = 1024;

    float *gpuFloats;
    cudaMalloc((void**)(&gpuFloats), N * sizeof(float));
    launchSetValue(gpuFloats, 2, 123.0f);

    float hostFloats[4];
    cudaMemcpy(hostFloats, gpuFloats, 16, cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    launchSetValue(gpuFloats, 2, 222.0f);
    cudaMemcpy(hostFloats, gpuFloats, 16, cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    cudaFree(gpuFloats);

    return 0;
}
