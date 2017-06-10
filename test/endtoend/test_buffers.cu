#include <iostream>
#include <cuda_runtime.h>

__global__ void mykernel(float *d1, float *d2, float *d3, float *d4, float *d5) {
    if(threadIdx.x == 0) {
        d1[0] = 123.0f;
        d2[0] = 123.0f;
        d3[0] = 123.0f;
        d4[0] = 123.0f;
        d5[0] = 123.0f;
    }
}

int main(int argc, char *argv[]) {
    const int bufferSizeMegs = 512;
    const int bufferSize = bufferSizeMegs * 1024 * 1024;

    float *gpuFloats;
    cudaMalloc((void**)(&gpuFloats), bufferSize);

    for(int i = 0; i < 1000; i++) {
        if(i % 100 == 0 || i == 999) {
            std::cout << "i=" << i << std::endl;
        }
        mykernel<<<dim3(1024, 1, 1), dim3(256, 1, 1)>>>(gpuFloats, gpuFloats, gpuFloats, gpuFloats, gpuFloats);
    }

    cudaFree(gpuFloats);

    return 0;
}
