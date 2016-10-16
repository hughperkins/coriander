// tests cuMemHostAlloc

#include <iostream>
#include <memory>

using namespace std;

#include <cuda.h>

__global__ void incrValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] += value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    float *floats;
    cuMemHostAlloc((void **)&floats, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    floats[2] = 4.0f;
    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(floats, 2, 3.0f);
    cout << "floats[2] " << floats[2] << endl;

    incrValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(floats, 2, 5.0f);
    cout << "floats[2] " << floats[2] << endl;

    cuMemFreeHost(floats);

    return 0;
}
