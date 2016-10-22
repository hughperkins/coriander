// seems my bitcasting is/was broken ('is', at time of writing this test, 'was' since I probably fixed it by now :-) )
// this code tests this, sortof
// (hmmm, edit, seems to be ok, in fact...)

#include "cuda.h"

#include <iostream>
#include <cassert>

using namespace std;

__global__ void mykernel(int *int1, float *f1, int *int2) {
    f1[0] = *(float *)&int1[0];
    int2[0] = *(int *)&f1[0];
}

__global__ void floattoint(int *out, float *in) {
    out[0] = *(int *)&in[0];
}

__global__ void inttofloat(float *out, int *in) {
    out[0] = *(float *)&in[0];
}

int main(int argc, char *argv[]) {

    int N = 32;
    int *int1_host = new int[N];
    float *f1_host = new float[N];
    int *int2_host = new int[N];
    // float *f2_host = new float[N];

    int *int1_gpu;
    float *f1_gpu;
    int *int2_gpu;
    // float *f2_gpu;
    cudaMalloc((void**)&int1_gpu, N * sizeof(float));
    cudaMalloc((void**)&f1_gpu, N * sizeof(float));
    cudaMalloc((void**)&int2_gpu, N * sizeof(float));
    // cudaMalloc(&(void**)f2_gpu, N * sizeof(float));

    int1_host[0] = 123;
    cudaMemcpy(int1_gpu, int1_host, N * sizeof(float), cudaMemcpyHostToDevice);

    mykernel<<<dim3(1,1,1), dim3(32,1,1)>>>(int1_gpu, f1_gpu, int2_gpu);

    cudaMemcpy(f1_host, f1_gpu, N * sizeof(float), cudaMemcpyDeviceToHost);
    cudaMemcpy(int2_host, int2_gpu, N * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "this should NOT be 123, should be some weird float value, not even slightly close to 123 :" << endl;
    cout << "f1[0] " << f1_host[0] << endl;
    assert(f1_host[0] != 123.0f);
    cout << "this SHOULD be 123 :" << endl;
    cout << "int2[0] " << int2_host[0] << endl;
    assert(int2_host[0] == 123);

    int1_host[0] = 777;
    cudaMemcpy(int1_gpu, int1_host, N * sizeof(float), cudaMemcpyHostToDevice);
    cout << "after copy to device" << endl;
    inttofloat<<<dim3(1,1,1), dim3(32,1,1)>>>(f1_gpu, int1_gpu);
    cout << "after kernel call 2" << endl;
    cudaMemcpy(f1_host, f1_gpu, N * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "f1[0]" << f1_host[0] << endl;
    assert(f1_host[0] != 777.0f);

    floattoint<<<dim3(1,1,1), dim3(32,1,1)>>>(int2_gpu, f1_gpu);
    cout << "after kernel call 3" << endl;
    cudaMemcpy(int2_host, int2_gpu, N * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "int2[0]" << int2_host[0] << endl;
    assert(int2_host[0] == 777);

    return 0;
}
