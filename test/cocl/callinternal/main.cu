#include "test_callinternal.h"

#include <iostream>

__global__ void mykernel(MyStruct mystruct, float *data) {
    somefunc(mystruct);
    data[0] = mystruct.somefloats[0] * 2.0f;
}

int main(int argc, char *argv[]) {

    int N = 32;
    float *f1_host = new float[N];
    // MyStruct *struct_host = new MyStruct();
    float *host_floats = new float[N];

    float *f1_gpu;
    // MyStruct *struct_gpu;
    float *gpu_floats;

    cudaMalloc((void**)&f1_gpu, N * sizeof(float));
    // cudaMalloc((void**)&struct_gpu, sizeof(struct MyStruct));
    cudaMalloc((void**)&gpu_floats, N * sizeof(float));

    f1_host[0] = 123;
    cudaMemcpy(f1_gpu, f1_host, N * sizeof(float), cudaMemcpyHostToDevice);

    host_floats[0] = 444;

    struct MyStruct mystruct;
    mystruct.somefloats = gpu_floats;
    cudaMemcpy(gpu_floats, host_floats, N * sizeof(float), cudaMemcpyHostToDevice);

    mykernel<<<dim3(1,1,1), dim3(32,1,1)>>>(mystruct, gpu_floats);

    cudaMemcpy(host_floats, gpu_floats, N * sizeof(float), cudaMemcpyDeviceToHost);

    std::cout << "host_floats[0]=" << host_floats[0] << std::endl;

    return 0;
}
