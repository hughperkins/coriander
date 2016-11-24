// test __shfl_down...

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

__global__ void getValue(float *data) {
    int tid = threadIdx.x;
    int warpid = tid % 32;  // assume warpsize 32.  Anyway, CUDA code uses warpsize 32.
    float me = data[tid];
    me = __shfl_down(me, 1, 32);
    data[tid] = me;
}

int main(int argc, char *argv[]) {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));

    for(int i = 0; i < 64; i++) {
        hostFloats1[i] = 1000 + i;  // add 1000 so we know we're not just reading eg tid
    }

    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats1)), hostFloats1, N * sizeof(float), stream);

    getValue<<<dim3(4,1,1), dim3(128,1,1), 0, stream>>>(((float *)deviceFloats1));

    cuMemcpyDtoHAsync(hostFloats1, deviceFloats1, N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    // and check the values...
    cout << hostFloats1[0] << endl;
    cout << hostFloats1[1] << endl;
    cout << hostFloats1[2] << endl;

    cout << hostFloats1[4] << endl;
    cout << hostFloats1[5] << endl;

    assert(hostFloats1[0] == 1001);
    assert(hostFloats1[1] == 1002);
    assert(hostFloats1[3] == 1004);
    assert(hostFloats1[30] == 1031);
    assert(hostFloats1[31] == 1031);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);
    cuStreamDestroy(stream);

    return 0;
}
