
#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

__global__ void getValue(float *data) {
    data[0] = pow(data[1], data[2]);
    data[4] = min(data[1], data[2]);
    data[5] = max(data[1], data[2]);
    data[6] = ::max(data[1], data[2]);
    // data[7] = std::max(data[1], data[2]);
}

int main(int argc, char *argv[]) {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));

    hostFloats1[0] = 0;
    hostFloats1[1] = 3;
    hostFloats1[2] = 4.5f;

    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceFloats1)),
        hostFloats1,
        N * sizeof(float),
        stream
    );
    // cuStreamSynchronize(stream);

    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1));

    cuMemcpyDtoHAsync(hostFloats1, deviceFloats1, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    for(int i = 0; i < 7; i++) {
        cout << "hostFloats1[" << i << "]=" << hostFloats1[i] << endl;
    }
    // cout << hostFloats1[0] << endl;
    // cout << hostFloats1[1] << endl;
    // cout << hostFloats1[2] << endl;

    // cout << hostFloats1[4] << endl;
    // cout << hostFloats1[5] << endl;

    float diff = std::abs(hostFloats1[0] - 140.296);
    assert(diff < 0.01);

    assert(hostFloats1[4] == 3);
    assert(hostFloats1[5] == 4.5f);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);
    cuStreamDestroy(stream);

    return 0;
}
