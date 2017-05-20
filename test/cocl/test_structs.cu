/*
other things we should test:
- struct pointer, with offset
- multiple struct pointers, cut from same buffer
- getting values from various types of structs passed in
*/

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

struct MyStruct {
    float *p1;
    float *p2;
    float f1;
    float f2;
};

struct MyStruct2 {
    float *p1;
};

__global__ void struct_byvalue(struct MyStruct mystruct, float *out) {
    out[0] = mystruct.f1;
    out[1] = mystruct.f2;
    mystruct.p1[0] = 9.0f;
    mystruct.p2[0] = 10.0f;
}

void testbyvaluestruct() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *gpuFloats1;
    cudaMalloc((void**)(&gpuFloats1), N * sizeof(float));

    float *gpuFloats2;
    cudaMalloc((void**)(&gpuFloats2), N * sizeof(float));

    float *gpuFloats3;
    cudaMalloc((void**)(&gpuFloats3), N * sizeof(float));

    float *gpuOut;
    cudaMalloc((void**)(&gpuOut), N * sizeof(float));

    float *hostFloats1 = new float[N];
    float *hostFloats2 = new float[N];
    float *hostFloats3 = new float[N];
    float *hostOut = new float[N];

    struct MyStruct mystruct = {(float *)gpuFloats1, (float *)gpuFloats2, 3.0f, 8.0f};
    struct_byvalue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(mystruct, (float *)gpuOut);

    cudaMemcpy(hostFloats1, gpuFloats1, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cudaMemcpy(hostFloats2, gpuFloats2, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cudaMemcpy(hostOut, gpuOut, 4 * sizeof(float), cudaMemcpyDeviceToHost);

    cuStreamSynchronize(stream);

    cout << hostFloats1[0] << endl;
    cout << hostFloats2[0] << endl;
    cout << hostOut[0] << endl;
    cout << hostOut[1] << endl;

    assert(hostFloats1[0] == 9);
    assert(hostFloats2[0] == 10);
    assert(hostOut[0] == 3);
    assert(hostOut[1] == 8);

    cudaFree(gpuFloats1);
    cudaFree(gpuFloats2);
    cudaFree(gpuFloats3);
    cudaFree(gpuOut);

    delete[]hostFloats1;
    delete[]hostFloats2;
    delete[]hostFloats3;
    delete[]hostOut;

    cuStreamDestroy(stream);
}

struct GpusideStruct {
    float f1;
    float f2;
};

__global__ void struct_aspointer(struct GpusideStruct *mystruct, float *out) {
    out[0] = mystruct->f1;
    out[1] = mystruct->f2;
}

void testaspointerstruct() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostOut = new float[N];

    float *gpuOut;
    cudaMalloc((void**)(&gpuOut), N * sizeof(float));

    struct GpusideStruct mystruct = { 5, 7 };
    struct GpusideStruct *gpu_mystruct;
    cudaMalloc((void**)(&gpu_mystruct), sizeof(mystruct));
    cudaMemcpy(gpu_mystruct, &mystruct, sizeof(mystruct), cudaMemcpyHostToDevice);

    struct_aspointer<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(gpu_mystruct, gpuOut);

    cudaMemcpy(hostOut, gpuOut, 4 * sizeof(float), cudaMemcpyDeviceToHost);

    cuStreamSynchronize(stream);

    cout << hostOut[0] << endl;
    cout << hostOut[1] << endl;

    assert(hostOut[0] == 5);
    assert(hostOut[1] == 7);

    delete[]hostOut;

    cuStreamDestroy(stream);
}

// __global__ void kernel_twostructs(struct MyStruct *mystruct, struct MyStruct2 *mystruct2) {
//     mystruct->p1[0] = 9.0f;
//     mystruct->p2[0] = 10.0f;
//     mystruct2->p1[0] = 11.0f;
// }

// void testtwostructs() {
//     int N = 1024;

//     CUstream stream;
//     cuStreamCreate(&stream, 0);

//     float *gpuFloats1;
//     cudaMalloc((void**)(&gpuFloats1), N * sizeof(float));

//     float *gpuFloats2;
//     cudaMalloc((void**)(&gpuFloats2), N * sizeof(float));

//     float *gpuFloats3;
//     cudaMalloc((void**)(&gpuFloats3), N * sizeof(float));

//     float *hostFloats1 = new float[N];
//     float *hostFloats2 = new float[N];
//     float *hostFloats3 = new float[N];

//     struct MyStruct mystruct = {(float *)gpuFloats1, (float *)gpuFloats2};
//     struct MyStruct2 mystruct2 = {(float *)gpuFloats3};

//     kernel_twostructs<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(&mystruct, &mystruct2);

//     cudaMemcpy(hostFloats1, gpuFloats1, 4 * sizeof(float), cudaMemcpyDeviceToHost);
//     cudaMemcpy(hostFloats2, gpuFloats2, 4 * sizeof(float), cudaMemcpyDeviceToHost);
//     cudaMemcpy(hostFloats3, gpuFloats3, 4 * sizeof(float), cudaMemcpyDeviceToHost);

//     cuStreamSynchronize(stream);

//     cout << hostFloats1[0] << endl;
//     cout << hostFloats2[0] << endl;
//     cout << hostFloats3[0] << endl;

//     assert(hostFloats1[0] == 9);
//     assert(hostFloats2[0] == 10);
//     assert(hostFloats3[0] == 11);

//     cudaFree(gpuFloats1);
//     cudaFree(gpuFloats2);
//     cudaFree(gpuFloats3);

//     delete[]hostFloats1;
//     delete[]hostFloats2;
//     delete[]hostFloats3;

//     cuStreamDestroy(stream);
// }

// struct MyStructNoPtr {
//     float p1;
// };

// __global__ void kernel_structbyval_noptrs(struct MyStructNoPtr mystruct1, float *out) {
//     if(threadIdx.x == 0) {
//         out[0] = mystruct1.p1;
//         out[1] = 5;
//     }
// }

// void teststructbyvalNoPtr() {
//     int N = 1024;

//     CUstream stream;
//     cuStreamCreate(&stream, 0);

//     float *hostFloats1 = new float[N];

//     float *gpuFloats1;
//     cudaMalloc((void**)(&gpuFloats1), N * sizeof(float));

//     struct MyStructNoPtr mystruct1 = {8.0f};

//     kernel_structbyval_noptrs<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(mystruct1, (float *)gpuFloats1);

//     cudaMemcpy(hostFloats1, gpuFloats1, 4 * sizeof(float), cudaMemcpyDeviceToHost);
//     cuStreamSynchronize(stream);

//     cout << hostFloats1[0] << endl;
//     cout << hostFloats1[1] << endl;

//     assert(hostFloats1[0] == 8);

//     delete[] hostFloats1;
//     cudaFree(gpuFloats1);

//     cuStreamDestroy(stream);
// }

// struct MyStruct2NoPtr {
//     float p1;
//     float p2;
// };

// __global__ void kernel_struct2byval_noptrs(struct MyStruct2NoPtr mystruct1, float *out) {
//     if(threadIdx.x == 0) {
//     out[0] = mystruct1.p1;
//     out[1] = mystruct1.p2;
//     }
// }

// void teststruct2byvalNoPtr() {
//     int N = 1024;

//     CUstream stream;
//     cuStreamCreate(&stream, 0);

//     float *hostFloats1;
//     cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

//     CUdeviceptr gpuFloats1;
//     cuMemAlloc(&gpuFloats1, N * sizeof(float));
//     cuMemcpyHtoDAsync((CUdeviceptr)(((float *)gpuFloats1)), hostFloats1, N * sizeof(float), stream);

//     struct MyStruct2NoPtr mystruct1 = {8.0f, 9.0f};

//     kernel_struct2byval_noptrs<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(mystruct1, (float *)gpuFloats1);
//     cuMemcpyDtoHAsync(hostFloats1, gpuFloats1, N * sizeof(float), stream);
//     cuStreamSynchronize(stream);

//     cout << hostFloats1[0] << endl;
//     cout << hostFloats1[1] << endl;

//     assert(hostFloats1[0] == 8);
//     assert(hostFloats1[1] == 9);

//     cuMemFreeHost(hostFloats1);
//     cuMemFree(gpuFloats1);

//     cuStreamDestroy(stream);
// }

// __global__ void kernel_twostructs_noptrs(struct MyStruct2NoPtr *mystruct, struct MyStructNoPtr *mystruct2, struct MyStructNoPtr mystruct3, float *out) {
//     if(threadIdx.x == 0) {
//     out[0] = mystruct->p1;
//     out[1] = mystruct->p2;
//     out[2] = mystruct2->p1;
//     out[3] = mystruct3.p1;
//     }
// }

// void testtwostructsNoPtr() {
//     int N = 1024;

//     CUstream stream;
//     cuStreamCreate(&stream, 0);

//     float *hostFloats1 = new float[N];

//     float *gpuFloats1;
//     cudaMalloc((void**)(&gpuFloats1), N * sizeof(float));

//     struct MyStruct2NoPtr mystruct = {5.0f, 6.0f};
//     struct MyStructNoPtr mystruct2 = {7.0f};
//     struct MyStructNoPtr mystruct3 = {8.0f};

//     kernel_twostructs_noptrs<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(&mystruct, &mystruct2, mystruct3, (float *)gpuFloats1);
//     cudaMemcpy(hostFloats1, gpuFloats1, 4 * sizeof(float), cudaMemcpyDeviceToHost);
//     cuStreamSynchronize(stream);

//     cout << hostFloats1[0] << endl;
//     cout << hostFloats1[1] << endl;
//     cout << hostFloats1[2] << endl;
//     cout << hostFloats1[3] << endl;

//     assert(hostFloats1[0] == 5);
//     assert(hostFloats1[1] == 6);
//     assert(hostFloats1[2] == 7);

//     cudaFree(gpuFloats1);

//     delete[] hostFloats1;

//     cuStreamDestroy(stream);
// }

int main(int argc, char *argv[]) {
    cout << "\ntestvaluestruct" << endl;
    testbyvaluestruct();

    cout << "\ntestaspointersstruct" << endl;
    testaspointerstruct();

    // cout << "\ntesttwostructs" << endl;
    // testtwostructs();

    // cout << "\teststruct2byvalNoPtr" << endl;
    // teststruct2byvalNoPtr();

    // cout << "\teststructbyvalNoPtr" << endl;
    // teststructbyvalNoPtr();

    // cout << "\ntesttwostructsNoPtr" << endl;
    // testtwostructsNoPtr();

    return 0;
}
