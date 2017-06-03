// double indirection, ie float **, in kernel parameter

// this test cuts all gpu buffers from one single gpu buffer

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

struct BoundedArray {
    float *bounded_array[8];
};

__global__ void run_bounded_array(struct BoundedArray boundedArray, int numBuffers, int N) {
    for(int i = 0; i < numBuffers; i++) {
        for(int j = 0; j < N; j++) {
            boundedArray.bounded_array[i][j] = 123.0f + i + 1 + j;
        }
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    const int numBuffers = 3;

    float *gpuArena;
    cudaMalloc((void **)&gpuArena, numBuffers * N * 4 + 1024);

    struct BoundedArray boundedArray;
    float *hostFloats[numBuffers];

    for(int i = 0; i < numBuffers; i++) {
        boundedArray.bounded_array[i] = gpuArena + 256 + i * N;
        hostFloats[i] = new float[N];
    }

    run_bounded_array<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(boundedArray, numBuffers, N);

    for(int i = 0; i < numBuffers; i++) {
        cudaMemcpy(hostFloats[i], boundedArray.bounded_array[i], N * sizeof(float), cudaMemcpyDeviceToHost);
    }
    cuStreamSynchronize(stream);

    for(int i = 0; i < numBuffers; i++) {
        for(int j=0; j < 8; j++) {
            cout << hostFloats[i][j] << " ";
            assert(hostFloats[i][j] == 123.0f + 1 + i + j);
        }
        cout << endl;
    }

    for(int i=0; i < numBuffers; i++) {
        delete[] hostFloats[i];
    }
    cudaFree(gpuArena);

    cuStreamDestroy(stream);

    return 0;
}
