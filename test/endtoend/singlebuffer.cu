
#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

__global__ void getValue(float *outdata, float *indata) {
    outdata[0] = indata[0] + 3.0f;
}

void floats() {
    int memSizeBytes = 65536;
    int N = 128;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    char *hostMemGiant;
    cuMemHostAlloc((void **)&hostMemGiant, memSizeBytes, CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceMemGiant;
    cuMemAlloc(&deviceMemGiant, memSizeBytes);

    int floats1_offset_bytes = 128 * 4;
    int floats2_offset_bytes = 256 * 4;

    float *hostFloats1 = (float *)(hostMemGiant + floats1_offset_bytes);
    float *hostFloats2 = (float *)(hostMemGiant + floats2_offset_bytes);

    hostFloats1[0] = 123.456f;

    CUdeviceptr deviceFloats1 = deviceMemGiant + floats1_offset_bytes;
    CUdeviceptr deviceFloats2 = deviceMemGiant + floats2_offset_bytes;

    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceFloats1)),
        hostFloats1,
        N * sizeof(float),
        stream
    );

    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>((float *)deviceFloats2, (float *)deviceFloats1);

    // now copy back entire buffer
    cuMemcpyDtoHAsync(hostFloats2, deviceFloats2, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    cout << hostFloats2[0] << endl;

    assert(hostFloats2[0] == 126.456f);

    cuMemFreeHost(hostMemGiant);
    cuMemFree(deviceMemGiant);
    cuStreamDestroy(stream);
}

__global__ void getValueChar(char *outdata, char *indata) {
    outdata[0] = indata[0] + 3;
}

void chars() {
    int memSizeBytes = 65536;
    int N = 128;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    char *hostMemGiant;
    cuMemHostAlloc((void **)&hostMemGiant, memSizeBytes, CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceMemGiant;
    cuMemAlloc(&deviceMemGiant, memSizeBytes);

    int chars1_offset_bytes = 128 * 4;
    int chars2_offset_bytes = 256 * 4;

    char *hostChars1 = (char *)(hostMemGiant + chars1_offset_bytes);
    char *hostChars2 = (char *)(hostMemGiant + chars2_offset_bytes);

    hostChars1[0] = 67;

    CUdeviceptr deviceChars1 = deviceMemGiant + chars1_offset_bytes;
    CUdeviceptr deviceChars2 = deviceMemGiant + chars2_offset_bytes;

    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceChars1)),
        hostChars1,
        N * sizeof(char),
        stream
    );

    getValueChar<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>((char *)deviceChars2, (char *)deviceChars1);

    // now copy back entire buffer
    cuMemcpyDtoHAsync(hostChars2, deviceChars2, N * sizeof(char), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    cout << hostChars2[0] << endl;

    assert(hostChars2[0] == 70);

    cuMemFreeHost(hostMemGiant);
    cuMemFree(deviceMemGiant);
    cuStreamDestroy(stream);
}

int main(int argc, char *argv[]) {
    floats();
    chars();
    return 0;
}
