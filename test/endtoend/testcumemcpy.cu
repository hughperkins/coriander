// a cuda app.  we will convert this to opencl, and run it :-)

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda_runtime.h>

__global__ void setValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] = value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    CUdeviceptr gpuFloats;
    cuMemAlloc(&gpuFloats, N * sizeof(float));

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>((float *)gpuFloats, 2, 123.0f);

    float hostFloats[4];
    cuMemcpyDtoH(hostFloats, gpuFloats, 4 * sizeof(float));
    cout << "hostFloats[2] " << hostFloats[2] << endl;
    assert(hostFloats[2] == 123);

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>((float *)gpuFloats, 2, 222.0f);
    cuMemcpyDtoH(hostFloats, gpuFloats, 4 * sizeof(float));
    cout << "hostFloats[2] " << hostFloats[2] << endl;
    assert(hostFloats[2] == 222);

    hostFloats[2] = 444.0f;
    cuMemcpyHtoD(gpuFloats, hostFloats, 4 * sizeof(float));
    hostFloats[2] = 555.0f;
    cuMemcpyDtoH(hostFloats, gpuFloats, 4 * sizeof(float));
    cout << "hostFloats[2] " << hostFloats[2] << endl;
    assert(hostFloats[2] == 444);

    cuMemFree(gpuFloats);

    return 0;
}
