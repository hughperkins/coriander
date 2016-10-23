
#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>
#include "cublas_v2.h"

void transpose(float *in, float *out, int rows, int cols) {
    int newrows = cols;
    int newcols = rows;
    for(int oldrow = 0; oldrow < rows; oldrow++) {
        for(int oldcol = 0; oldcol < cols; oldcol++) {
            int newcol = oldrow;
            int newrow = oldcol;
            out[newrow * newcols + newcol] = in[oldrow * cols + oldcol];
        }
    }
}

void dump(float *M, int rows, int cols) {
    for(int row=0; row < rows; row++) {
        for(int col = 0; col < cols; col++) {
            cout << " " << M[row * cols + col];
        }
        cout << endl;
    }
}

void dumbMultiply(float *A, float *B, float *C, int M, int N, int K) {
    // assume row major
    for(int m=0; m < M; m++) {
        for(int n = 0; n < N; n++) {
            float sum = 0;
            for(int k=0; k < K; k++) {
                sum += A[m * K + k] * B[k * N + n];
            }
            C[m * N + n] = sum;
        }
    }
}

int main(int argc, char *argv[]) {
    const int M = 3;
    const int K = 2;
    const int N = 4;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    // float *hostA;
    // float *hostB;
    // float *hostC;
    // cuMemHostAlloc((void **)&hostA, M * K * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    // cuMemHostAlloc((void **)&hostB, K * N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    // cuMemHostAlloc((void **)&hostC, M * N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    float hostA[] = { 3, 5,
                      5, 8,
                      2, -1};
    float hostB[] = { 3, 5, 4, 1,
                      5, 8, 5, 7};
    float hostATrans[M * K];
    float hostBTrans[K * N];
    float hostC[M * N];
    float hostCTrans[M * N];

    transpose(hostA, hostATrans, M, K);
    transpose(hostB, hostBTrans, K, N);

    cout << "A:" << endl;
    dump(hostA, M, K);
    cout << "B:" << endl;
    dump(hostB, K, N);

    cout << "ATrans:" << endl;
    dump(hostATrans, K, M);
    cout << "BTrans:" << endl;
    dump(hostBTrans, N, K);

    CUdeviceptr deviceA;
    CUdeviceptr deviceB;
    CUdeviceptr deviceC;
    cuMemAlloc(&deviceA, M * K * sizeof(float));
    cuMemAlloc(&deviceB, K * N * sizeof(float));
    cuMemAlloc(&deviceC, M * N * sizeof(float));

    // hostFloats1[0] = 123.456f;

    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceA)),
        hostATrans,
        M * K * sizeof(float),
        stream
    );
    cuMemcpyHtoDAsync(
        (CUdeviceptr)(((float *)deviceB)),
        hostBTrans,
        K * N * sizeof(float),
        stream
    );

    cublasHandle_t blas;
    cublasCreate(&blas);

    float alpha = 1;
    float beta = 0;
      cublasSgemm(blas, CUBLAS_OP_N, CUBLAS_OP_N, M, N, K,
      &alpha,
      deviceA, M, deviceB, K, &beta, deviceC, M);

    cublasDestroy(blas);

    // getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>((float *)deviceFloats1);

    cuMemcpyDtoHAsync(hostCTrans, deviceC, M * N * sizeof(float), stream);
    cuStreamSynchronize(stream);

    cout << "C trans:" << endl;
    dump(hostCTrans, N, M);
    transpose(hostCTrans, hostC, N, M);
    cout << "C:" << endl;
    dump(hostC, M, N);

    float hostCCheck[M * N];
    dumbMultiply(hostA, hostB, hostCCheck, M, N, K);
    cout << "C check:" << endl;
    dump(hostCCheck, M, N);

    // for(int m=0; m < M; m++) {
    //     for(int n = 0; n < N; n++) {
    //         cout << " " << hostC[m * N + n];
    //     }
    //     cout << endl;
    // }

    cuMemFree(deviceA);
    cuMemFree(deviceB);
    cuMemFree(deviceC);
    cuStreamDestroy(stream);

    return 0;
}
