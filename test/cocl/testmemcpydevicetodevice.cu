// a cuda app.  we will convert this to opencl, and run it :-)

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda_runtime.h>

__global__ void setValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] = value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    float *gpuFloats1;
    cudaMalloc((void**)(&gpuFloats1), N * sizeof(float));

    float *gpuFloats2;
    cudaMalloc((void**)(&gpuFloats2), N * sizeof(float));

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats1, 2, 123.0f);
    cudaMemcpy(gpuFloats2, gpuFloats1, 4 * sizeof(float), cudaMemcpyDeviceToDevice);

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats1, 2, 444.0f);

    float hostFloats[4];
    cudaMemcpy(hostFloats, gpuFloats2, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "This should be 123:" << endl;
    cout << "hostFloats[2] " << hostFloats[2] << endl;
    assert(hostFloats[2] == 123);

    cudaFree(gpuFloats1);

    return 0;
}
