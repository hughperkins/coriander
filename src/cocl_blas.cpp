// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "cocl/cocl_blas.h"

#include "cocl/cocl_context.h"
#include "cocl/hostside_opencl_funcs.h"
#include "EasyCL/EasyCL.h"

#include <iostream>
#include <clblast_c.h>

using namespace std;
using namespace cocl;
using namespace easycl;

namespace clblast {
    StatusCode CacheClearAll();
}

namespace cocl {
    class CoclBlas {
    public:
        CoclBlas(EasyCL *cl) {
            this->cl = cl;
            queue = cl->default_queue;
        }
        EasyCL *cl;
        CLQueue *queue;
    };
    static cublasPointerMode_t pointermode = CUBLAS_POINTER_MODE_HOST;
}

size_t cublasCreate(cublasHandle_t *phandle) {
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    CoclBlas *coclBlas = new CoclBlas(cl);
    *phandle = (cublasHandle_t)coclBlas;
    return 0;
}

std::size_t cublasDestroy(cublasHandle_t handle) {
    cout << "clearing clblast cache..." << endl;
    clblast::CacheClearAll();
    cout << "... cache cleared" << endl;
    CoclBlas *coclBlas = (CoclBlas *)handle;
    delete coclBlas;
    return 0;
}

static Transpose trans_cutocl(int trans) {
    if(trans == CUBLAS_OP_N) {
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
    if(mode == CUBLAS_POINTER_MODE_HOST) {
    } else if(mode == CUBLAS_POINTER_MODE_DEVICE) {
    } else {
        cout << "unknown pointermode " << mode << endl;
        // since we do nothing with this mode currently, not really an error as such...
    }
    return 0;
}

std::size_t cublasGetPointerMode(cublasHandle_t handle, cublasPointerMode_t *mode) {
    *mode = ::pointermode;
    return 0;
}

std::size_t cublasSetStream(cublasHandle_t handle, cudaStream_t streamId) {
    ThreadVars *v = getThreadVars();
    CoclBlas *coclBlas = (CoclBlas *)handle;
    CoclStream *coclStream = (CoclStream *)streamId;
    if(coclStream == 0) {
        coclStream = v->getContext()->default_stream.get();
    }
    CLQueue *queue = coclStream->clqueue;
    coclBlas->queue = queue;
    return 0;
}

// IMPORTANT: note that CLBlast offsets are in floats (cf bytes, for clmem offsets, in general)

std::size_t cublasSgemm(cublasHandle_t blas, int transA, int transB, int M, int N, int K,
     float *p_alpha, const float * ADevice, int lda, const float * BDevice, int ldb, float *p_beta, float * CDevice, int ldc) {

    CoclBlas *coclBlas = (CoclBlas *)blas;

    Memory *AMemory = findMemory((const char *)ADevice);
    size_t A_offset = AMemory->getOffset((const char *)ADevice) >> 2;

    Memory *BMemory = findMemory((const char *)BDevice);
    size_t B_offset = BMemory->getOffset((const char *)BDevice) >> 2;

    Memory *CMemory = findMemory((const char *)CDevice);
    size_t C_offset = CMemory->getOffset((const char *)CDevice) >> 2;

    Transpose transAcl = trans_cutocl(transA);
    Transpose transBcl = trans_cutocl(transB);

    StatusCode status = CLBlastSgemm(kColMajor, transAcl, transBcl,
                                   M, N, K,
                                   *p_alpha,
                                   AMemory->clmem, A_offset, lda,
                                   BMemory->clmem, B_offset, ldb,
                                   *p_beta,
                                   CMemory->clmem, C_offset, ldc,
                                   &coclBlas->queue->queue, 0);
    if(status != 0) {
        cout << "sgemm status code " << status << endl;
        throw runtime_error("Failed call to blas sgemm");
    }
    return 0;
}

std::size_t cublasSgemv(
    cublasHandle_t blas, int transA, int M, int N, const float *p_alpha, const float *ADevice, int lda,
    const float *xDevice, int incx, const float *p_beta, float *yDevice, int incy) {

    CoclBlas *coclBlas = (CoclBlas *)blas;

    Memory *AMemory = findMemory((const char *)ADevice);
    size_t AOffset = AMemory->getOffset((const char *)ADevice) >> 2;

    Memory *xMemory = findMemory((const char *)xDevice);
    size_t xOffset = xMemory->getOffset((const char *)xDevice) >> 2;

    Memory *yMemory = findMemory((const char *)yDevice);
    size_t yOffset = yMemory->getOffset((const char *)yDevice) >> 2;

    Transpose transAcl = trans_cutocl(transA);

    StatusCode status = CLBlastSgemv(kColMajor, transAcl,
                                     M, N,
                                     *p_alpha,
                                     AMemory->clmem, AOffset, lda,
                                     xMemory->clmem, xOffset, incx,
                                     *p_beta,
                                     yMemory->clmem, yOffset, incy,
                                     &coclBlas->queue->queue, 0);
    if(status != 0) {
        cout << "sgemv status code " << status << endl;
        throw runtime_error("Failed call to blas sgemv");
    }
    return 0;
}

std::size_t cublasSaxpy(
        cublasHandle_t blas, int n, const float *p_alpha, const float *xDevice, int incx, float *yDevice, int incy) {
    CoclBlas *coclBlas = (CoclBlas *)blas;

    Memory *xMemory = findMemory((const char *)xDevice);
    size_t xOffset = xMemory->getOffset((const char *)xDevice) >> 2;

    Memory *yMemory = findMemory((const char *)yDevice);
    size_t yOffset = yMemory->getOffset((const char *)yDevice) >> 2;

    StatusCode status = CLBlastSaxpy(n, *p_alpha,
                                      xMemory->clmem, xOffset, incx,
                                      yMemory->clmem, yOffset, incy,
                                      &coclBlas->queue->queue, 0);
    if(status != 0) {
        cout << "saxpy status code " << status << endl;
        throw runtime_error("Failed call to blas saxpy");
    }
    return 0;
}

std::size_t cublasSscal(cublasHandle_t blas, int n, const float *p_alpha, float *xDevice, int incx) {
    CoclBlas *coclBlas = (CoclBlas *)blas;

    Memory *xMemory = findMemory((const char *)xDevice);
    size_t xOffset = xMemory->getOffset((const char *)xDevice) >> 2;

    StatusCode status = CLBlastSscal(n, *p_alpha, xMemory->clmem, xOffset, incx,
                                     &coclBlas->queue->queue, 0);
    if(status != 0) {
        cout << "sscal status code " << status << endl;
        throw runtime_error("Failed call to blas sscal");
    }
    return 0;
}
