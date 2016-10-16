// tests cuMemHostAlloc

#include <iostream>
#include <memory>

using namespace std;

#include <cuda.h>

__global__ void incrValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] += value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostfloats;
    cuMemHostAlloc((void **)&hostfloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr devicefloats;
    cuMemAlloc(&devicefloats, N * sizeof(float));

    hostfloats[2] = 4.0f;
    cuMemcpyHtoDAsync(devicefloats, hostfloats, N * sizeof(float), stream);
    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1), 0, stream>>>((float *)devicefloats, 2, 3.0f);
    cuMemcpyDtoHAsync(hostfloats, devicefloats, N * sizeof(float), stream);
    cuStreamSynchronize(stream);
    cout << "hostfloats[2] " << hostfloats[2] << endl;

    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1), 0, stream>>>((float *)devicefloats, 2, 5.0f);
    cuMemcpyDtoHAsync(hostfloats, devicefloats, N * sizeof(float), stream);
    cuStreamSynchronize(stream);
    cout << "hostfloats[2] " << hostfloats[2] << endl;

    cuMemFreeHost(hostfloats);
    cuMemFree(devicefloats);
    cuStreamDestroy(stream);

    return 0;
}
