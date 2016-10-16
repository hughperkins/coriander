// tests cuEventCreate

#include <iostream>
#include <memory>

using namespace std;

#include <cuda.h>

__global__ void longKernel(float *data, int N, float value) {
    for(int i = 0; i < N; i++) {
        data[i] += value;
    }
}

int main(int argc, char *argv[]) {
    int N = 102400;

    CUstream newstream;
    cuStreamCreate(&newstream, 0);
    cout << "got stream" << endl;

    float *hostfloats;
    cuMemHostAlloc((void **)&hostfloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr devicefloats;
    cuMemAlloc(&devicefloats, N * sizeof(float));

    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1), 0, newstream>>>((float *)devicefloats, N, 3.0f);
    cout << "queued kernel 1" << endl;

    CUevent event;
    cuEventCreate(&event, CU_EVENT_DISABLE_TIMING);
    cuEventRecord(event, newstream);
    cuStreamWaitEvent(newstream, event, 0);

    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1), 0, newstream>>>((float *)devicefloats, N, 3.0f);
    cout << "queued kernel 2" << endl;

    cuCtxSynchronize();
    cout << "finished" << endl;

    cuEventDestroy(event);
    cuMemFreeHost(hostfloats);
    cuMemFree(devicefloats);
    cuStreamDestroy_v2(newstream);

    return 0;
}
