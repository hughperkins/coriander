
#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

struct MyStruct {
    float *p1;
    float *p2;
};

__global__ void struct_byvalue(struct MyStruct mystruct) {
    mystruct.p1[0] = 9.0f;
    mystruct.p2[0] = 10.0f;
}

__global__ void struct_aspointer(struct MyStruct *mystruct) {
    mystruct->p1[0] = 9.0f;
    mystruct->p2[0] = 10.0f;
}

void testbyvaluestruct() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    float *hostFloats2;
    cuMemHostAlloc((void **)&hostFloats2, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));
    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats1)), hostFloats1, N * sizeof(float), stream);

    CUdeviceptr deviceFloats2;
    cuMemAlloc(&deviceFloats2, N * sizeof(float));
    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats2)), hostFloats2, N * sizeof(float), stream);

    struct MyStruct mystruct = {(float *)deviceFloats1, (float *)deviceFloats2};
    struct_byvalue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(mystruct);

    cuMemcpyDtoHAsync(hostFloats1, deviceFloats1, N * sizeof(float), stream);
    cuMemcpyDtoHAsync(hostFloats2, deviceFloats2, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    cout << hostFloats1[0] << endl;
    cout << hostFloats2[0] << endl;

    assert(hostFloats1[0] == 9);
    assert(hostFloats2[0] == 10);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);
    cuMemFreeHost(hostFloats2);
    cuMemFree(deviceFloats2);
    cuStreamDestroy(stream);
}

void testaspointerstruct() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    float *hostFloats2;
    cuMemHostAlloc((void **)&hostFloats2, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));
    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats1)), hostFloats1, N * sizeof(float), stream);

    CUdeviceptr deviceFloats2;
    cuMemAlloc(&deviceFloats2, N * sizeof(float));
    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats2)), hostFloats2, N * sizeof(float), stream);

    struct MyStruct mystruct = {(float *)deviceFloats1, (float *)deviceFloats2};
    struct_aspointer<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(&mystruct);

    cuMemcpyDtoHAsync(hostFloats1, deviceFloats1, N * sizeof(float), stream);
    cuMemcpyDtoHAsync(hostFloats2, deviceFloats2, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    cout << hostFloats1[0] << endl;
    cout << hostFloats2[0] << endl;

    assert(hostFloats1[0] == 9);
    assert(hostFloats2[0] == 10);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);
    cuMemFreeHost(hostFloats2);
    cuMemFree(deviceFloats2);
    cuStreamDestroy(stream);
}

int main(int argc, char *argv[]) {
    testbyvaluestruct();
    testaspointerstruct();
    return 0;
}
