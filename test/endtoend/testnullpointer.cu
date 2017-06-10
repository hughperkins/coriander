
#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

__global__ void getValue(float *outdata, float *indata) {
    outdata[0] = indata == 0 ? 3.0f : 2.0f;
}

void testfloatstar() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));

    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats1)), hostFloats1, N * sizeof(float), stream);
    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1), 0);
    cuMemcpyDtoHAsync(hostFloats1, deviceFloats1, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    cout << hostFloats1[0] << endl;

    assert(hostFloats1[0] == 3);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);
    cuStreamDestroy(stream);
}

struct MyStruct {
    float *p1;
    float *p2;
};

__global__ void checkNullStructs(struct MyStruct mystruct) {
    mystruct.p1[0] = mystruct.p2 == 0 ? 9 : 8;
}

void teststruct() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));

    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats1)), hostFloats1, N * sizeof(float), stream);
    struct MyStruct mystruct = {(float *)deviceFloats1, 0};
    checkNullStructs<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(mystruct);
    cuMemcpyDtoHAsync(hostFloats1, deviceFloats1, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    cout << hostFloats1[0] << endl;

    assert(hostFloats1[0] == 9);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);
    cuStreamDestroy(stream);
}

int main(int argc, char *argv[]) {
    testfloatstar();
    teststruct();
    return 0;
}
