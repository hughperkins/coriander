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

void test1() {
    int N = 102400;

    CUstream stream;
    cuStreamCreate(&stream, 0);
    cout << "got stream" << endl;

    float *hostFloats;
    cuMemHostAlloc((void **)&hostFloats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats;
    cuMemAlloc(&deviceFloats, N * sizeof(float));

    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1), 0, stream>>>((float *)deviceFloats, N, 3.0f);
    cout << "queued kernel 1" << endl;

    CUevent event;
    cuEventCreate(&event, CU_EVENT_DISABLE_TIMING);
    cuEventRecord(event, stream);
    cuStreamWaitEvent(stream, event, 0);

    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1), 0, stream>>>((float *)deviceFloats, N, 3.0f);
    cout << "queued kernel 2" << endl;

    // cuCtxSynchronize();
    cuStreamSynchronize(stream);
    cout << "finished" << endl;

    cuEventDestroy(event);
    cuMemFreeHost(hostFloats);
    cuMemFree(deviceFloats);
    cuStreamDestroy(stream    );
}

void dump(float *M, int N) {
    for(int row=0; row < N; row++) {
        cout << " " << M[row];
    }
    cout << endl;
}

void fill(float *M, int N, float val) {
    for(int row=0; row < N; row++) {
        M[row] = val;
    }
}

void test2() {
    // use a long running kernel, queue an async copy back from device
    // => returned values should, in theory, be correct...
    int N = 102400;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float hostFloats[N];

    CUdeviceptr deviceFloats;
    cout << "call cumemalloc" << endl;
    cuMemAlloc(&deviceFloats, N * sizeof(float));
    cout << "cumemalloc done" << endl;
    fill(hostFloats, 10, 123);
    dump(hostFloats, 10);

    cout << "calling  cuMemcpyHtoDAsync" << endl;
    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceFloats)), hostFloats, N * sizeof(float), stream);
    cout << "cuMemcpyHtoDAsync done" << endl;
    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1), 0, stream>>>((float *)deviceFloats, N, 3.0f);
    cout << "queued kernel" << endl;
    cuMemcpyDtoHAsync(hostFloats, (CUdeviceptr)((float *)deviceFloats), N * sizeof(float), stream);
    cout << "queued async copy" << endl;
    cuStreamSynchronize(stream);

    dump(hostFloats, 10);

    cuMemFree(deviceFloats);
    cuStreamDestroy(stream);
}

int main(int argc, char *argv[]) {
    cout << "test1" << endl;
    test1();
    cout << "test2" << endl;
    test2();

    return 0;
}
