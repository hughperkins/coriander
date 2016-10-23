#pragma once

#include "cocl/cocl_memory.h"

#include <cstdint>

typedef long long cublasHandle_t;

extern "C" {
    std::size_t cublasCreate(cublasHandle_t *phandle);
    std::size_t cublasDestroy(cublasHandle_t handle);
    std::size_t cublasSgemm(cublasHandle_t blas, int transA, int transB, int M, int N, int K,
         float *alpha, CUdeviceptr deviceA, int lda, CUdeviceptr deviceB, int ldb, float *beta, CUdeviceptr deviceC, int ldc);

}

enum BlasEnum {
    CUBLAS_OP_N = 500,
    CUBLAS_OP_Y,
    CUBLAS_OP_T
};
