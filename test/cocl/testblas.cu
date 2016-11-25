
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

void fill(float *M, int rows, int cols, float val) {
    for(int row=0; row < rows; row++) {
        for(int col = 0; col < cols; col++) {
            M[row * cols + col] = val;
        }
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

void assertEqual(float *left, float *right, int rows, int cols) {
    for(int row=0; row < rows; row++) {
        for(int col=0; col < cols; col++) {
            if(left[row * cols + col] != right[row * cols + col]) {
                cout << "mismatch row=" << row << " col=" << col << " " << left[row * cols + col]
                    << " != " << right[row * cols + col] << endl;
                assert(left[row * cols + col] == right[row * cols + col]);
            }
        }
    }
}

int main(int argc, char *argv[]) {
    const int M = 3;
    const int K = 2;
    const int N = 4;

    CUstream stream;
    cuStreamCreate(&stream, 0);

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
    cuMemAlloc(&deviceA, M * K * sizeof(float) + 1024 * 4);
    cuMemAlloc(&deviceB, K * N * sizeof(float) + 1024 * 4);
    cuMemAlloc(&deviceC, M * N * sizeof(float) + 1024 * 4);

    int A_offset = 64;
    int B_offset = 128;
    int C_offset = 32;

    A_offset = 0;
    B_offset = 0;
    C_offset = 0;

    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceA) + A_offset), hostATrans, M * K * sizeof(float), stream);
    cuMemcpyHtoDAsync((CUdeviceptr)(((float *)deviceB) + B_offset), hostBTrans, K * N * sizeof(float), stream);

    cublasHandle_t blas;
    cublasCreate(&blas);
    // cout << "blas " << (void *)blas << endl;
    cublasSetStream(blas, stream);

    float alpha = 1;
    float beta = 0;
      cublasSgemm(blas, CUBLAS_OP_N, CUBLAS_OP_N, M, N, K,
      &alpha,
      (float *)deviceA + A_offset, M, (float *)deviceB + B_offset, K, &beta, (float *)deviceC + C_offset, M);

    cuMemcpyDtoHAsync(hostCTrans, (CUdeviceptr)((float *)deviceC + C_offset), M * N * sizeof(float), stream);
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

    assertEqual(hostCCheck, hostC, M, N);

    // cublasDestroy(blas);

    cuMemFree(deviceA);
    cuMemFree(deviceB);
    cuMemFree(deviceC);
    cuStreamDestroy(stream);
    cout << "finished testblas" << endl;

    return 0;
}
