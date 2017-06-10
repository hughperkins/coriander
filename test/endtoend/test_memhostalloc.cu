// tests cuMemHostAlloc

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

__global__ void incrValue(float *data, int idx, float value) {
    if(threadIdx.x == 0  && blockIdx.x == 0) {
        data[idx] += value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats;
    cuMemHostAlloc((void **)&hostFloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats;
    cuMemAlloc(&deviceFloats, N * sizeof(float));

    hostFloats[2] = 4.0f;
    cuMemcpyHtoDAsync(deviceFloats, hostFloats, N * sizeof(float), stream);
    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1), 0, stream>>>((float *)deviceFloats, 2, 3.0f);
    cuMemcpyDtoHAsync(hostFloats, deviceFloats, N * sizeof(float), stream);
    cuStreamSynchronize(stream);
    cout << "hostFloats[2] " << hostFloats[2] << endl;
    assert(hostFloats[2] == 7);

    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1), 0, stream>>>((float *)deviceFloats, 2, 5.0f);
    cuMemcpyDtoHAsync(hostFloats, deviceFloats, N * sizeof(float), stream);
    cuStreamSynchronize(stream);
    cout << "hostFloats[2] " << hostFloats[2] << endl;
    assert(hostFloats[2] == 12);

    cuMemFreeHost(hostFloats);
    cuMemFree(deviceFloats);
    cuStreamDestroy(stream);

    return 0;
}
