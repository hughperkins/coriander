#pragma once

#include "cocl/cocl_memory.h"
#include "cocl/cocl_streams.h"

#include <cstdint>
#include <cstddef>

typedef std::size_t cublasStatus_t;
// typedef long long cublasHandle_t;
struct cublasContext {

};
typedef struct cublasContext* cublasHandle_t;
typedef int cublasPointerMode_t;

extern "C" {
    std::size_t cublasCreate(cublasHandle_t *phandle);
    std::size_t cublasDestroy(cublasHandle_t handle);
    std::size_t cublasSaxpy(cublasHandle_t blas, int n, const float *p_alpha, const float *x, int incx, float *y, int incy);
    std::size_t cublasSscal(cublasHandle_t blas, int n, const float *alpha, float *x, int incx);
    std::size_t cublasSgemv(
        cublasHandle_t blas, int trans, int m, int n, const float *p_alpha, const float *A, int lda,
        const float *x, int incx, const float *beta, float *p_y, int incy);
    std::size_t cublasSgemm(cublasHandle_t blas, int transA, int transB, int M, int N, int K,
         float *alpha, const float * deviceA, int lda, const float * deviceB, int ldb, float *beta, float * deviceC, int ldc);
    std::size_t cublasSetPointerMode(cublasHandle_t handle, cublasPointerMode_t mode);
    std::size_t cublasGetPointerMode(cublasHandle_t handle, cublasPointerMode_t *mode);
    std::size_t cublasSetStream(cublasHandle_t handle, cudaStream_t streamId);
}

enum BlasEnum {
    CUBLAS_OP_N = 500,
    CUBLAS_OP_Y,
    CUBLAS_OP_T,
    CUBLAS_OP_C,

    CUBLAS_POINTER_MODE_HOST,
    CUBLAS_POINTER_MODE_DEVICE,

    CUBLAS_FILL_MODE_UPPER,
    CUBLAS_FILL_MODE_LOWER,

    CUBLAS_DIAG_UNIT,
    CUBLAS_DIAG_NON_UNIT,

    CUBLAS_SIDE_LEFT,
    CUBLAS_SIDE_RIGHT
};

#define CUBLAS_STATUS_SUCCESS 0
enum BlasErrors {
    CUBLAS_STATUS_NOT_INITIALIZED = 70000,
    CUBLAS_STATUS_ALLOC_FAILED,
    CUBLAS_STATUS_INVALID_VALUE,
    CUBLAS_STATUS_ARCH_MISMATCH,
    CUBLAS_STATUS_MAPPING_ERROR,
    CUBLAS_STATUS_EXECUTION_FAILED,
    CUBLAS_STATUS_INTERNAL_ERROR
};

#define cublasCreate_v2 cublasCreate
#define cublasDestroy_v2 cublasDestroy
#define cublasGetPointerMode_v2 cublasGetPointerMode
#define cublasSetPointerMode_v2 cublasSetPointerMode
#define cublasSetStream_v2 cublasSetStream

typedef int cublasOperation_t;
typedef int cublasFillMode_t;
typedef int cublasDiagType_t;
typedef int cublasSideMode_t;
// typedef int cublasSscal;
