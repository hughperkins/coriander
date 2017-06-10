#include "multi1.h"

#include <iostream>
using namespace std;

__global__ void main_set(float *data, float val) {
    data[threadIdx.x] = val;
}

int main(int argc, char *argv[]) {
    cout << "main" << endl;

    int N = 1024;

    CUstream newstream;
    cuStreamCreate(&newstream, 0);
    cout << "got stream" << endl;

    float *hostfloats;
    cuMemHostAlloc((void **)&hostfloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr devicefloats;
    cuMemAlloc(&devicefloats, N * sizeof(float));

    main_set<<<dim3(1, 1, 1), dim3(32, 1, 1), 0, newstream>>>((float *)devicefloats, 5.0f);
    cout << "queued kernel 1" << endl;

    k1_incr<<<dim3(1, 1, 1), dim3(32, 1, 1), 0, newstream>>>((float *)devicefloats, 5.0f);
    cout << "queued kernel 1" << endl;

    k2_mul<<<dim3(11, 1, 1), dim3(32, 1, 1), 0, newstream>>>((float *)devicefloats, 3.0f);
    cout << "queued kernel 2" << endl;


    cuMemcpyDtoHAsync(hostfloats, devicefloats, N * sizeof(float), newstream);
    cuStreamSynchronize(newstream);

    cout << "hostFloats[2] " << hostfloats[2] << endl;

    cout << "finished" << endl;

    cuMemFreeHost(hostfloats);
    cuMemFree(devicefloats);
    cuStreamDestroy_v2(newstream);

    cout << "done" << endl;

    return 0;
}
