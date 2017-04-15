#include "cocl/cocl_dnn_pooling.h"

#include "cocl/cocl_dnn.h"
#include "cocl/cocl_memory.h"
#include "cocl/hostside_opencl_funcs.h"
#include "cocl/cocl.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include <clblast_c.h>

#include <iostream>
#include <string>
#include <stdexcept>
using namespace std;

static string col2ImKernelSource;

namespace cocl {
namespace dnn {

} // namespace dnn
} // namespace cocl

using namespace cocl;
using namespace cocl::dnn;

size_t cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t *p_desc) {
    *p_desc = new PoolingDescriptor();
    return 0;
}
size_t cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t desc) {
    delete desc;
    return 0;
}
size_t cudnnSetPooling2dDescriptor(
    cudnnPoolingDescriptor_t pool,
    CoclDnnLayout type,
    CoclDnnLayout propagate,
    CoclDnnGeometryType kH, CoclDnnGeometryType kW,
    CoclDnnGeometryType padH, CoclDnnGeometryType padW,
    CoclDnnGeometryType strideH, CoclDnnGeometryType strideW
) {
    pool->type = type;
    pool->propagate = propagate;
    pool->kH = kH;
    pool->kW = kW;
    pool->padH = padH;
    pool->padW = padW;
    pool->strideH = strideH;
    pool->strideW = strideW;
    return 0;
}
size_t cudnnPoolingForward(
    cudnnHandle_t handle,
    cudnnPoolingDescriptor_t poolDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, float *inputData,
    float *p_beta,
    cudnnTensorDescriptor_t outputDesc, float *outputData
) {
    throw runtime_error("not implemented");
}
size_t cudnnPoolingBackward(
    cudnnHandle_t handle,
    cudnnPoolingDescriptor_t poolDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1,
    cudnnTensorDescriptor_t tensor2Desc,
    float *tensor2,
    cudnnTensorDescriptor_t tensor3Desc,
    float *tensor3,
    float *p_beta,
    cudnnTensorDescriptor_t tensor4Desc,
    float *tensor4
) {
    throw runtime_error("not implemented");
}
