
#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

__global__ void getValue(float4 *outdata, float *indata) {
    // outdata[0] = indata[0];
    float4 my4 = make_float4(indata[0], indata[3], indata[1], indata[2]);
    outdata[0] = my4;
}

int main(int argc, char *argv[]) {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    float *hostFloats2;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    cuMemHostAlloc((void **)&hostFloats2, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    CUdeviceptr deviceFloats2;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));
    cuMemAlloc(&deviceFloats2, N * sizeof(float));

    hostFloats1[0] = 123.456f;
    hostFloats1[1] = 9;
    hostFloats1[2] = 12;
    hostFloats1[3] = 19;

    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceFloats1)),
        hostFloats1,
        N * sizeof(float),
        stream
    );
    // cuStreamSynchronize(stream);

    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float4 *)deviceFloats2), ((float *)deviceFloats1));

    // now copy back entire buffer
    // hostFloats[64] = 0.0f;
    cuMemcpyDtoHAsync(hostFloats2, deviceFloats2, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    cout << hostFloats2[0] << endl;
    cout << hostFloats2[1] << endl;
    cout << hostFloats2[2] << endl;
    cout << hostFloats2[3] << endl;

    // assert(hostFloats2[64] == 126.456f);

    cuMemFreeHost(hostFloats1);
    cuMemFreeHost(hostFloats2);
    cuMemFree(deviceFloats1);
    cuMemFree(deviceFloats2);
    cuStreamDestroy(stream);

    return 0;
}
