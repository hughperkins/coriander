// a cuda app.  we will convert this to opencl, and run it :-)

#include <iostream>
#include <memory>

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
    cudaMalloc((void**)(&gpuFloats), N * sizeof(float));

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats, 2, 123.0f);

    float hostFloats[4];
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats, 2, 222.0f);
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    hostFloats[2] = 444.0f;
    cudaMemcpy(gpuFloats, hostFloats, 4 * sizeof(float), cudaMemcpyHostToDevice);
    hostFloats[2] = 555.0f;
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    cudaFree(gpuFloats);

    return 0;
}
