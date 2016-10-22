#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

struct MyStruct {
    float *floats;
    float afloat;
};

struct MyStruct2 {
    float *floats1;
    float *floats2;
    float afloat;
};

__global__ void getValue(struct MyStruct mystruct, float *data) {
    data[0] = mystruct.floats[0] + 3.0f;
}

__global__ void getValue2(struct MyStruct2 mystruct, float *data1, float *data2) {
    data1[0] = mystruct.floats1[0] + 3.0f;
    data2[0] = mystruct.floats2[0] + 5.0f;
}

void test1(CUstream &stream) {
    int N = 1024;

    // CUstream stream;
    // cuStreamCreate(&stream, 0);

    float *hostFloats1;
    float *hostFloats2;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    cuMemHostAlloc((void **)&hostFloats2, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    CUdeviceptr deviceFloats2;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));
    cuMemAlloc(&deviceFloats2, N * sizeof(float));

    MyStruct mystruct;
    mystruct.floats = (float *)deviceFloats1;
    hostFloats1[0] = 123;

    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceFloats1)),
        hostFloats1,
        N * sizeof(float),
        stream
    );

    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(mystruct, ((float *)deviceFloats2) + 0);

    // now copy back entire buffer
    // hostFloats[64] = 0.0f;
    cuMemcpyDtoHAsync(hostFloats2, deviceFloats2, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    cout << hostFloats2[0] << endl;

    assert(hostFloats2[0] == 126);

    cuMemFreeHost(hostFloats1);
    cuMemFreeHost(hostFloats2);
    cuMemFree(deviceFloats1);
    cuMemFree(deviceFloats2);
    // cuStreamDestroy(stream);
}

void test2(CUstream &stream) {
    int N = 1024;

    float *hostFloats1;
    float *hostFloats2;
    float *hostFloats3;
    float *hostFloats4;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    cuMemHostAlloc((void **)&hostFloats2, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    cuMemHostAlloc((void **)&hostFloats3, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    cuMemHostAlloc((void **)&hostFloats4, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    CUdeviceptr deviceFloats2;
    CUdeviceptr deviceFloats3;
    CUdeviceptr deviceFloats4;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));
    cuMemAlloc(&deviceFloats2, N * sizeof(float));
    cuMemAlloc(&deviceFloats3, N * sizeof(float));
    cuMemAlloc(&deviceFloats4, N * sizeof(float));

    MyStruct2 mystruct;
    mystruct.floats1 = (float *)deviceFloats1;
    mystruct.floats2 = (float *)deviceFloats2;
    hostFloats1[0] = 123;
    hostFloats2[0] = 333;

    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceFloats1)),
        hostFloats1,
        N * sizeof(float),
        stream
    );
    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceFloats2)),
        hostFloats2,
        N * sizeof(float),
        stream
    );

    getValue2<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(mystruct, (float *)deviceFloats3, (float *)deviceFloats4);

    cuMemcpyDtoHAsync(hostFloats3, deviceFloats3, N * sizeof(float), stream);
    cuMemcpyDtoHAsync(hostFloats4, deviceFloats4, N * sizeof(float), stream);

    cuStreamSynchronize(stream);

    // and check the values...
    cout << "hostFloats3[0] " << hostFloats3[0] << endl;
    cout << "hostFloats4[0] " << hostFloats4[0] << endl;

    assert(hostFloats3[0] == 126);
    assert(hostFloats4[0] == 338);

    cuMemFreeHost(hostFloats1);
    cuMemFreeHost(hostFloats2);
    cuMemFreeHost(hostFloats3);
    cuMemFreeHost(hostFloats4);
    cuMemFree(deviceFloats1);
    cuMemFree(deviceFloats2);
    cuMemFree(deviceFloats3);
    cuMemFree(deviceFloats4);
}

int main(int argc, char *argv[]) {
    CUstream stream;
    cuStreamCreate(&stream, 0);

    // test1(stream);
    test2(stream);

    cuStreamDestroy(stream);
    return 0;
}
