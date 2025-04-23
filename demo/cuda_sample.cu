// a cuda app.  we will convert this to opencl, and run it :-)

#include <iostream>

using namespace std;

#include <cuda_runtime.h>

__global__ void setValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] = value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;
    float *gpuFloats;
    float hostFloats[4];

    // allocate GPU memory
    cudaMalloc((void**)(&gpuFloats), N * sizeof(float));

    // launch kernel
    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats, 2, 123.0f);

    // copy from gpu to host
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);

    cout << "hostFloats[2] " << hostFloats[2] << endl;

    cudaFree(gpuFloats);

    return 0;
}
