// What if we are given a device pointer that is offset from any of the device pointers we provided to the client?
//
// This file is a test-case for this.  Then we can look at handling that...

#include <iostream>
#include <memory>

using namespace std;

#include <cuda.h>

// __global__ void getValue(float *data, int idx, float value) {
//     if(threadIdx.x == 0) {
//         data[idx] += value;
//     }
// }

int main(int argc, char *argv[]) {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostfloats;
    cuMemHostAlloc((void **)&hostfloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr devicefloats;
    cuMemAlloc(&devicefloats, N * sizeof(float));

    hostfloats[128] = 123.456f;
    hostfloats[129] = 444.0f;
    hostfloats[130] = 321.0f;
    hostfloats[131] = 111.0f;

    // now we will copy 16 bytes, starting at location 128...
    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)devicefloats) + 64),
        hostfloats + 128,
        4 * sizeof(float),
        stream
    );
    cuStreamSynchronize(stream);
    // now copy back entire buffer
    hostfloats[64] = 0.0f;
    hostfloats[65] = 0.0f;
    hostfloats[66] = 0.0f;
    hostfloats[67] = 0.0f;
    cuMemcpyDtoHAsync(hostfloats, devicefloats, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    cout << hostfloats[64] << endl;
    cout << hostfloats[65] << endl;
    cout << hostfloats[66] << endl;
    cout << hostfloats[67] << endl;

    cuMemFreeHost(hostfloats);
    cuMemFree(devicefloats);
    cuStreamDestroy(stream);

    return 0;
}
