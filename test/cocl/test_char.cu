// a cuda app.  we will convert this to opencl, and run it :-)

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda_runtime.h>

__global__ void setValue(char *data, int idx, char value) {
    if(threadIdx.x == 0) {
        data[idx] = value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    char *gpuChars;
    cudaMalloc((void**)(&gpuChars), N * sizeof(char));

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuChars, 2, 89);

    char hostChars[4];
    cudaMemcpy(hostChars, gpuChars, 4 * sizeof(char), cudaMemcpyDeviceToHost);
    cout << "hostChars[2] " << hostChars[2] << endl;
    assert(hostChars[2] == 89);

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuChars, 2, 23);
    cudaMemcpy(hostChars, gpuChars, 4 * sizeof(char), cudaMemcpyDeviceToHost);
    cout << "hostChars[2] " << hostChars[2] << endl;
    assert(hostChars[2] == 23);

    hostChars[2] = 44;
    cudaMemcpy(gpuChars, hostChars, 4 * sizeof(char), cudaMemcpyHostToDevice);
    hostChars[2] = 55;
    cudaMemcpy(hostChars, gpuChars, 4 * sizeof(char), cudaMemcpyDeviceToHost);
    cout << "hostChars[2] " << hostChars[2] << endl;
    assert(hostChars[2] == 44);

    cudaFree(gpuChars);

    return 0;
}
