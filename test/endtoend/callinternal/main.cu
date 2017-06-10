#include "test_callinternal.h"

#include <iostream>
#include <cassert>

__global__ void mykernel(MyStruct mystruct, float *data) {
    somefunc(mystruct);
    // mystruct.somefloats[0] += 4;
    // addfive(mystruct.somefloats);
    data[0] = mystruct.somefloats[0] * 2.0f;
}

namespace cocl {
    int getNumClSources();
}

int main(int argc, char *argv[]) {

    int N = 32;

    std::cout << "clSources.size() " << cocl::getNumClSources() << std::endl;

    float *data_host = new float[N];
    float *struct_floats_host = new float[N];

    float *data_gpu;
    float *struct_floats_gpu;

    cudaMalloc((void**)&data_gpu, N * sizeof(float));
    cudaMalloc((void**)&struct_floats_gpu, N * sizeof(float));

    struct_floats_host[0] = 123;
    cudaMemcpy(struct_floats_gpu, struct_floats_host, N * sizeof(float), cudaMemcpyHostToDevice);

    struct MyStruct mystruct;
    mystruct.somefloats = struct_floats_gpu;
    // cudaMemcpy(gpu_floats, host_floats, N * sizeof(float), cudaMemcpyHostToDevice);

    mykernel<<<dim3(1,1,1), dim3(32,1,1)>>>(mystruct, data_gpu);

    cudaMemcpy(data_host, data_gpu, N * sizeof(float), cudaMemcpyDeviceToHost);
    cudaMemcpy(struct_floats_host, struct_floats_gpu, N * sizeof(float), cudaMemcpyDeviceToHost);

    std::cout << "data_host[0]=" << data_host[0] << std::endl;
    std::cout << "struct_floats_host[0]=" << struct_floats_host[0] << std::endl;
    assert(data_host[0] == (123+3) * 2);

    return 0;
}

class MyClass {
public:
    MyClass(const char *name);
};

MyClass main_(__FILE__);
