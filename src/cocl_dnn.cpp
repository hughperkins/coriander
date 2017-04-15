#include "cocl/cocl_dnn.h"

#include "cocl/cocl_dnn_gemm.h"
#include "cocl/cocl_memory.h"
#include "cocl/hostside_opencl_funcs.h"
#include "cocl/cocl.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include <clblast_c.h>

#include <iostream>
#include <string>
#include <stdexcept>
using namespace std;

// static string col2ImKernelSource;

namespace cocl {
namespace dnn {

} // namespace dnn
} // namespace cocl

using namespace cocl;
using namespace cocl::dnn;

const char *cudnnGetErrorString(std::size_t error) {
    throw runtime_error("not impelmented cudnnGetErrorString");
}

size_t cudnnCreate(cudnnHandle_t *p_handle) {
    *p_handle = new Dnn();
    return 0;
}
size_t cudnnDestroy(cudnnHandle_t handle) {
    delete handle;
    return 0;
}

size_t cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t *p_tensor) {
    *p_tensor = new TensorDescriptor();
    return 0;
}
size_t cudnnCreateFilterDescriptor(cudnnFilterDescriptor_t *p_desc) {
    *p_desc = new FilterDescriptor();
    return 0;
}

size_t cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t desc) {
    delete desc;
    return 0;
}
size_t cudnnDestroyFilterDescriptor(cudnnFilterDescriptor_t desc) {
    delete desc;
    return 0;
}

size_t cudnnSetTensor4dDescriptor(
    cudnnTensorDescriptor_t tensor,
    CoclDnnLayout layout,
    CoclDnnLayout datatype,
    CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W) {
    tensor->layout = layout;
    tensor->datatype = datatype;
    tensor->N = N;
    tensor->C = C;
    tensor->H = H;
    tensor->W = W;
    return 0;
}
size_t cudnnSetFilter4dDescriptor(
    cudnnFilterDescriptor_t filter,
    CoclDnnLayout layout,
    CoclDnnLayout dataType,
    CoclDnnGeometryType outC, CoclDnnGeometryType inC, CoclDnnGeometryType kH, CoclDnnGeometryType kW
) {
    filter->layout = layout;
    filter->dataType = dataType;
    filter->outC = outC;
    filter->inC = inC;
    filter->kH = kH;
    filter->kW = kW;
    return 0;
}

size_t cudnnAddTensor(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t xDesc, float *xData,
    float *p_beta,
    cudnnTensorDescriptor_t yDesc, float * yData
) {
    if(*p_beta != 1) {
        throw runtime_error("cudnnAddTensor only implemented for beta == 1");
    }

    cl_int err;
    ThreadVars *v = getThreadVars();

    Memory *xMemory = findMemory((const char *)xData);
    Memory *yMemory = findMemory((const char *)yData);

    size_t xOffset = xMemory->getOffset((const char *)xData);
    size_t yOffset = yMemory->getOffset((const char *)yData);

    int N = xDesc->N;
    int C = xDesc->C;
    int H = xDesc->H;
    int W = xDesc->W;
    int n = N * C * H * W;
    StatusCode status = CLBlastSaxpy(n, *p_alpha,
                                     xMemory->clmem, xOffset, 1,
                                     yMemory->clmem, yOffset, 1,
                                     &v->currentContext->default_stream.get()->clqueue->queue, 0);
    if(status != 0) {
        cout << "saxpy status code " << status << endl;
        throw runtime_error("Failed call to blas saxpy");
    }
}
size_t cudnnSoftmaxForward(
    cudnnHandle_t handle,
    CoclDnnLayout softmaxMode,
    CoclDnnLayout softmaxChannel,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1_data,
    float *p_beta,
    cudnnTensorDescriptor_t tensor2Desc,
    float *out_data
) {
    throw runtime_error("not implemented");
}
