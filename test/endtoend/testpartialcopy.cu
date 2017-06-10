// What if we are given a device pointer that is offset from any of the device pointers we provided to the client?
//
// This file is a test-case for this.  Then we can look at handling that...

#include <iostream>
#include <memory>
#include <cassert>

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

    float *hostFloats;
    cuMemHostAlloc((void **)&hostFloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats;
    cuMemAlloc(&deviceFloats, N * sizeof(float));

    hostFloats[128] = 123.456f;
    hostFloats[129] = 444.0f;
    hostFloats[130] = 321.0f;
    hostFloats[131] = 111.0f;

    // now we will copy 16 bytes, starting at location 128...
    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceFloats) + 64),
        hostFloats + 128,
        4 * sizeof(float),
        stream
    );
    cuStreamSynchronize(stream);
    // now copy back entire buffer
    hostFloats[64] = 0.0f;
    hostFloats[65] = 0.0f;
    hostFloats[66] = 0.0f;
    hostFloats[67] = 0.0f;
    cuMemcpyDtoHAsync(hostFloats, deviceFloats, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    cout << hostFloats[64] << endl;
    cout << hostFloats[65] << endl;
    cout << hostFloats[66] << endl;
    cout << hostFloats[67] << endl;

    assert(hostFloats[64] == 123.456f);
    assert(hostFloats[65] == 444.0f);
    assert(hostFloats[66] == 321);
    assert(hostFloats[67] == 111);

    cuMemFreeHost(hostFloats);
    cuMemFree(deviceFloats);
    cuStreamDestroy(stream);

    return 0;
}
