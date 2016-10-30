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
#include "EasyCL.h"

#include <iostream>
#include <clblast_c.h>

using namespace std;
using namespace cocl;
using namespace easycl;

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
    // cout << "cublasCreate redirect 3" << endl;
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    // cl_context *ctx = cl->context;
    CoclBlas *coclBlas = new CoclBlas(cl);
    *phandle = (cublasHandle_t)coclBlas;
    return 0;
}

std::size_t cublasDestroy(cublasHandle_t handle) {
    // cout << "cublasDestroy redirect" << endl;
    CoclBlas *coclBlas = (CoclBlas *)handle;
    delete coclBlas;
    return 0;
}

static Transpose trans_cutocl(int trans) {
    if(trans == CUBLAS_OP_N) {
        // cout << "trans no" << endl;
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
    // cout << "cublasSetPointerMode redirect" << endl;
    if(mode == CUBLAS_POINTER_MODE_HOST) {
        // cout << "set to host" << endl;
    } else if(mode == CUBLAS_POINTER_MODE_DEVICE) {
        // cout << "set to device`" << endl;
    } else {
        cout << "unknown pointermode " << mode << endl;
        // since we do nothing with this mode currently, not really an error as such...
    }
    return 0;
}

std::size_t cublasGetPointerMode(cublasHandle_t handle, cublasPointerMode_t *mode) {
    // cout << "cublasGetPointerMode redirect" << endl;
    *mode = ::pointermode;
    return 0;
}

std::size_t cublasSetStream(cublasHandle_t handle, cudaStream_t streamId) {
    // cout << "cublasSetStream redirect" << endl;
    ThreadVars *v = getThreadVars();
    CoclBlas *coclBlas = (CoclBlas *)handle;
    CoclStream *coclStream = (CoclStream *)streamId;
    if(coclStream == 0) {
        // cout << "using dfeault queue" << endl;
        coclStream = v->getContext()->default_stream.get();
    }
    CLQueue *queue = coclStream->clqueue;
    // CLQueue *queue = (CLQueue *)streamId;
    coclBlas->queue = queue;
    return 0;
}

std::size_t cublasSgemm(cublasHandle_t blas, int transA, int transB, int M, int N, int K,
     float *palpha, const float * deviceA, int lda, const float * deviceB, int ldb, float *pbeta, float * deviceC, int ldc) {
    // cout << "sgemm redirect" << endl;

    CoclBlas *coclBlas = (CoclBlas *)blas;

    Memory *AMemory = findMemory((char *)deviceA);
    // note that CLBlast offsets are in floats (cf bytes, for clmem offsets, in general)
    size_t A_offset = AMemory->getOffset((char *)deviceA) >> 2;

    Memory *BMemory = findMemory((char *)deviceB);
    size_t B_offset = BMemory->getOffset((char *)deviceB) >> 2;

    Memory *CMemory = findMemory((char *)deviceC);
    size_t C_offset = CMemory->getOffset((char *)deviceC) >> 2;
    // cout << "offsets " << A_offset << " " << B_offset << " " << C_offset << endl;
    // cout << "sizes " << AMemory->bytes<< " " << BMemory->bytes << " " << CMemory->bytes << endl;

    Transpose transAcl = trans_cutocl(transA);
    Transpose transBcl = trans_cutocl(transB);

    // cout << "run sgemm on queue " << (void *)coclBlas->queue->queue << " " << (void *)coclBlas->queue << endl;
    StatusCode status = CLBlastSgemm(kColMajor, transAcl, transBcl,
                                   M, N, K,
                                   *palpha,
                                   AMemory->clmem, A_offset, lda,
                                   BMemory->clmem, B_offset, ldb,
                                   *pbeta,
                                   CMemory->clmem, C_offset, ldc,
                                   &coclBlas->queue->queue, 0);
    if(status != 0) {
        cout << "sgemm status code " << status << endl;
        throw runtime_error("Failed call to blas sgem");
    }
    return 0;
}
