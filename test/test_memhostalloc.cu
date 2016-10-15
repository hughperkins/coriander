// tests cuMemHostAlloc

#include <iostream>
#include <memory>

using namespace std;

#include <cuda.h>

// __global__ void setValue(float *data, int idx, float value) {
//     if(threadIdx.x == 0) {
//         data[idx] = value;
//     }
// }

__global__ void incrValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] += value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    float *floats;
    cuMemHostAlloc((void **)&floats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    // cudaMalloc((void**)(&gpuFloats), N * sizeof(float));

    floats[2] = 4.0f;
    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(floats, 2, 3.0f);
    cout << "floats[2] " << floats[2] << endl;

    // float hostFloats[4];
    // cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);

    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(floats, 2, 5.0f);
    // cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "floats[2] " << floats[2] << endl;

    // hostFloats[2] = 444.0f;
    // cudaMemcpy(gpuFloats, hostFloats, 4 * sizeof(float), cudaMemcpyHostToDevice);
    // hostFloats[2] = 555.0f;
    // cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "floats[2] " << floats[2] << endl;

    // cudaFree(gpuFloats);
    cuMemFreeHost(floats);

    return 0;
}
