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

    float *floats;
    cuMemHostAlloc((void **)&floats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1), 0, newstream>>>(floats, N, 3.0f);
    cout << "queued kernel x" << endl;

    CUevent event;
    cuEventCreate(&event, CU_EVENT_DISABLE_TIMING);

    // cuStreamWaitEvent(newstream, event, 0);

    cuCtxSynchronize();
    cout << "finished" << endl;

    cuMemFreeHost(floats);

    cuStreamDestroy_v2(newstream);

    return 0;
}
