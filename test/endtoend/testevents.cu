// tests cuEventCreate

#include <iostream>
#include <memory>

using namespace std;

#include <cuda.h>

__global__ void longKernel(float *data, int N, float value) {
    for(int i = 0; i < N; i++) {
        data[i] += value;
    }
}

int main(int argc, char *argv[]) {
    int N = 102400; // * 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostfloats;
    cuMemHostAlloc((void **)&hostfloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr devicefloats;
    cuMemAlloc(&devicefloats, N * sizeof(float));

    // floats[2] = 4.0f;
    cuMemcpyHtoDAsync(devicefloats, hostfloats, N * sizeof(float), stream);
    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1)>>>((float *)devicefloats, N, 3.0f);
    cout << "queued kernel x" << endl;

    cuCtxSynchronize();
    cout << "finished" << endl;

    cuMemFreeHost(hostfloats);
    cuMemFree(devicefloats);
    cuStreamDestroy(stream);

    return 0;
}
