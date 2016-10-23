#include "cocl/cocl_blas.h"

#include "cocl/hostside_opencl_funcs.h"
#include "EasyCL.h"

#include <iostream>
#include <clblast_c.h>

using namespace std;
using namespace cocl;

size_t cublasCreate(cublasHandle_t *phandle) {
    cout << "cublasCreate redirect" << endl;
    *phandle = 0;
    return 0;
}

std::size_t cublasDestroy(cublasHandle_t handle) {
    cout << "cublasDestroy redirect" << endl;
    return 0;
}

static Transpose trans_cutocl(int trans) {
    if(trans == CUBLAS_OP_N) {
        cout << "trans no" << endl;
        return kNo;
    } else if(trans == CUBLAS_OP_Y) {
        return kYes;
    } else if(trans == CUBLAS_OP_T) {
        return kConjugate;
    } else {
        cout << "trans value: " << trans << endl;
        throw runtime_error("unexpected trans value");
    }
}

std::size_t cublasSetPointerMode(cublasHandle_t handle, cublasPointerMode_t mode) {
    cout << "cublasSetPointerMode redirect" << endl;
    return 0;
}

std::size_t cublasGetPointerMode(cublasHandle_t handle, cublasPointerMode_t *mode) {
    cout << "cublasGetPointerMode redirect" << endl;
    *mode = 0;
    return 0;
}

std::size_t cublasSetStream(cublasHandle_t handle, cudaStream_t streamId) {
    cout << "cublasSetStream redirect" << endl;
    return 0;
}

std::size_t cublasSgemm(cublasHandle_t blas, int transA, int transB, int M, int N, int K,
     float *palpha, const float * deviceA, int lda, const float * deviceB, int ldb, float *pbeta, float * deviceC, int ldc) {
    cout << "sgemm redirect" << endl;

    Memory *AMemory = findMemory((char *)deviceA);
    size_t A_offset = AMemory->getOffset((char *)deviceA);

    Memory *BMemory = findMemory((char *)deviceB);
    size_t B_offset = BMemory->getOffset((char *)deviceB);

    Memory *CMemory = findMemory((char *)deviceC);
    size_t C_offset = CMemory->getOffset((char *)deviceC);
    cout << "offsets " << A_offset << " " << B_offset << " " << C_offset << endl;
    cout << "sizes " << AMemory->bytes<< " " << BMemory->bytes << " " << CMemory->bytes << endl;

    Transpose transAcl = trans_cutocl(transA);
    Transpose transBcl = trans_cutocl(transB);

    // I guess we use default_queue?
    StatusCode status = CLBlastSgemm(kColMajor, transAcl, transBcl,
                                   M, N, K,
                                   *palpha,
                                   AMemory->clmem, A_offset, lda,
                                   BMemory->clmem, B_offset, ldb,
                                   *pbeta,
                                   CMemory->clmem, C_offset, ldc,
                                   &cl->default_queue->queue, 0);
    if(status != 0) {
        cout << "sgemm status code " << status << endl;
        throw runtime_error("Failed call to blas sgem");
    }

    return 0;
}
