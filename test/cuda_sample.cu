// a cuda app.  we will convert this to opencl, and run it :-)

#include <iostream>
#include <memory>

using namespace std;

#include <cuda_runtime.h>

__global__ void setValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] = value;
    }
}

// extern "C" {
//     void configureKernel(const char *, const char *);
//     void _Z17setKernelArgInt64l(long long);
//     // size_t clConfigureCall(unsigned long, unsigned int, unsigned long, unsigned int, size_t shared=0, void *stream=0);
// // size_t cudaConfigureCall(
// //         dim3 a,
// //         dim3 b, size_t sharedmem=0, void *stream=0);
// }

int main(int argc, char *argv[]) {
    int N = 1024;

    float *gpuFloats;
    cudaMalloc((void**)(&gpuFloats), N * sizeof(float));

    // cout << "1" << endl;
    // configureKernel("foo", "kernel void foo(long arg){}");
    // _Z17setKernelArgInt64l(123);
    // clConfigureCall(1, 3, 5, 6, 0, 0);
    // cudaConfigureCall(dim3(0, 1, 2), dim3(5, 2, 3), 0, 0);
    // cout << "2" << endl;
    // configureKernel("foo", "kernel void foo(long arg){}");

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats, 2, 123.0f);

    float hostFloats[4];
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats, 2, 222.0f);
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    hostFloats[2] = 444.0f;
    cudaMemcpy(gpuFloats, hostFloats, 4 * sizeof(float), cudaMemcpyHostToDevice);
    hostFloats[2] = 555.0f;
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    cudaFree(gpuFloats);

    return 0;
}
