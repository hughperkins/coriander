// tests cuEventCreate

#include <iostream>
#include <memory>
#include <unistd.h>

using namespace std;

#include <cuda.h>

__global__ void longKernel(float *data, int N, float value) {
    for(int i = 0; i < N; i++) {
        data[i] += value;
    }
}

void myCallback(CUstream stream, size_t status, void *data) {
    char *message = (char *)data;
    cout << "message " << message << endl;
}

int main(int argc, char *argv[]) {
    int N = 52400; // * 1024;

    float *hostfloats = new float[N];
    float *gpufloats;
    cudaMalloc((void **)&gpufloats, N * sizeof(float));

    CUstream stream;
    cuStreamCreate(&stream, 0);

    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1), 0, stream>>>(gpufloats, N, 3.0f);
    cout << "queued kernel x" << endl;

    const char *message = "hello";
    cudaStreamAddCallback(stream, myCallback, (void *)message, 0);
    cout << "added callback" << endl;
    sleep(1);

    cout << "synchronizing..." << endl;
    cuStreamSynchronize(stream);
    cout << "... synchronized" << endl;

    cuStreamDestroy(stream);
    cudaFree(gpufloats);

    cout << "finished" << endl;

    return 0;
}
