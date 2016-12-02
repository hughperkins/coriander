#include "cocl/cocl_dnn.h"

#include "cocl_dnn_gemm.h"
#include "EasyCL/util/easycl_stringhelper.h"

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

const char *cudnnGetErrorString(std::size_t error) {
    throw runtime_error("not impelmented cudnnGetErrorString");
}

std::size_t cudnnCreate(cudnnHandle_t *p_handle) {
    *p_handle = new Dnn();
    return 0;
}
std::size_t cudnnDestroy(cudnnHandle_t handle) {
    delete handle;
    return 0;
}

std::size_t cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t *p_tensor) {
    *p_tensor = new TensorDescriptor();
    return 0;
}
std::size_t cudnnCreateActivationDescriptor(cudnnActivationDescriptor_t *p_desc) {
    *p_desc = new ActivationDescriptor();
    return 0;
}
std::size_t cudnnCreateFilterDescriptor(cudnnFilterDescriptor_t *p_desc) {
    *p_desc = new FilterDescriptor();
    return 0;
}
std::size_t cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t *p_desc) {
    *p_desc = new ConvolutionDescriptor();
    return 0;
}
std::size_t cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t *p_desc) {
    *p_desc = new PoolingDescriptor();
    return 0;
}

std::size_t cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyActivationDescriptor(cudnnActivationDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyFilterDescriptor(cudnnFilterDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t desc) {
    delete desc;
    return 0;
}

std::size_t cudnnSetTensor4dDescriptor(
    cudnnTensorDescriptor_t tensor,
    Layout layout,
    Layout datatype,
    size_t N, size_t C, size_t H, size_t W) {
    tensor->layout = layout;
    tensor->datatype = datatype;
    tensor->N = N;
    tensor->C = C;
    tensor->H = H;
    tensor->W = W;
    return 0;
}
std::size_t cudnnSetPooling2dDescriptor(
    cudnnPoolingDescriptor_t pool,
    Layout type,
    Layout propagate,
    size_t kH, size_t kW,
    size_t padH, size_t padW,
    size_t strideH, size_t strideW
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
std::size_t cudnnSetActivationDescriptor(
    cudnnActivationDescriptor_t act, Layout activationType, Layout propagate,
        float probability) {
    act->activationType = activationType;
    act->propagate = propagate;
    act->probability = probability;
    return 0;
}
std::size_t cudnnSetFilter4dDescriptor(
    cudnnFilterDescriptor_t filter,
    Layout layout,
    Layout dataType,
    size_t outC, size_t inC, size_t kH, size_t kW
) {
    filter->layout = layout;
    filter->dataType = dataType;
    filter->outC = outC;
    filter->inC = inC;
    filter->kH = kH;
    filter->kW = kW;
    return 0;
}
// tensorflow uses like:
// status = dynload::cudnnSetConvolutionNdDescriptor(
//     parent_, handle_, convolution_descriptor.ndims(), padding.data(),
//     strides.data(), upscale.data() ...)
std::size_t cudnnSetConvolution2dDescriptor(
    cudnnConvolutionDescriptor_t conv,
    size_t padH, size_t padW, size_t dH, size_t dW, size_t scaleH, size_t scaleW,
    Layout correlationType
) {
    conv->padH = padH;  // eg 0
    conv->padW = padW;
    conv->dH = dW; // eg 1
    conv->dW = dW;
    conv->scaleH = scaleH;  // eg 1
    conv->scaleW = scaleW;
    conv->correlationType = correlationType;
    if(scaleH != 1 || scaleW != 1) {
        throw runtime_error("Not implemented: scale not 1");
    }
    if(dW != 1 || dW != 1) {
        throw runtime_error("Not implemented: stride not 1");
    }
    return 0;
}

std::size_t cudnnGetConvolution2dForwardOutputDim(
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    size_t *pN, size_t *pC, size_t *pH, size_t *pW) {
    // conv->inputTensorDesc = srcTensor;
    // conv->filterDesc = filter;
    // conv->N = N;
    // conv->C = C;
    // conv->H = H;
    // conv->W = W;
    *pN = srcTensor->N;
    *pC = srcTensor->C;
    *pH = srcTensor->H; // obviously needs tweaking a bit...
    *pW = srcTensor->W;
    return 0;
}

std::size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    cudnnConvolutionFwdAlgo_t algo,
    std::size_t *p_size_bytes
) {
    cout << "cudnnGetConvolutionForwardWorkspaceSize()" << endl;
    switch(algo) {
        case cudnnConvolutionFwdAlgo_GEMM:
            cocl::dnn::gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize(
                handle, srcTensor, filter, conv, dstTensor, p_size_bytes);
        default:
            throw runtime_error("No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
std::size_t cudnnGetConvolutionBackwardFilterWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnTensorDescriptor_t tensor2Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionBwdFilterAlgo_t algo,
    std::size_t *p_size
) {
    cout << "cudnnGetConvolutionBackwardFilterWorkspaceSize()" << endl;
    *p_size = 0;
    return 0;
}
std::size_t cudnnGetConvolutionBackwardDataWorkspaceSize(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filter,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t tensor2Desc,
    cudnnConvolutionBwdDataAlgo_t algo,
    std::size_t *p_size
) {
    cout << "cudnnGetConvolutionBackwardDataWorkspaceSize()" << endl;
    *p_size = 0;
    return 0;
}

std::size_t cudnnConvolutionForward(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t poolTensor,
    float * pool,
    cudnnFilterDescriptor_t filterDesc,
    float *conv,
    cudnnConvolutionDescriptor_t conv2Desc,
    cudnnConvolutionFwdAlgo_t conv2algo,
    void *workspace,
    std::size_t workspaceSize,
    float *p_beta,
    cudnnTensorDescriptor_t tensorDesc,
    float *conv2
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnAddTensor(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t tensorDesc1,
    float *tensor,
    float *p_beta,
    cudnnTensorDescriptor_t tensorDesc2,
    float * tensor2
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnPoolingForward(
    cudnnHandle_t handle,
    cudnnPoolingDescriptor_t poolDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t convDesc,
    float *conv,
    float *p_beta,
    cudnnTensorDescriptor_t poolDesc2,
    float *pool
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnPoolingBackward(
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
std::size_t cudnnActivationForward(
    cudnnHandle_t handle,
    cudnnActivationDescriptor_t activationDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1,
    float *p_beta,
    cudnnTensorDescriptor_t tensor2Desc,
    float *tensor2
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnSoftmaxForward(
    cudnnHandle_t handle,
    Layout softmaxMode,
    Layout softmaxChannel,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1_data,
    float *p_beta,
    cudnnTensorDescriptor_t tensor2Desc,
    float *out_data
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnConvolutionBackwardFilter(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1_data,
    cudnnTensorDescriptor_t tensor2Desc,
    float *tensor2_data,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnConvolutionBwdFilterAlgo_t algo,
    void *workspace,
    std::size_t workspaceSize,
    float *p_beta,
    cudnnFilterDescriptor_t filterDesc,
    float *out
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnConvolutionBackwardData(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnFilterDescriptor_t tensor1Desc,
    float *tensor1_data,
    cudnnTensorDescriptor_t tensor2Desc,
    float *tensor2_data,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnConvolutionBwdDataAlgo_t algo,
    void *workspace,
    std::size_t workspaceSize,
    float *p_beta,
    cudnnTensorDescriptor_t filterDesc,
    float *out
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnActivationBackward(
    cudnnHandle_t handle,
    cudnnActivationDescriptor_t activationDesc,
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
std::size_t cudnnConvolutionBackwardBias(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1,
    float *p_beta,
    cudnnTensorDescriptor_t tensor2Desc,
    float *tensor2
) {
    throw runtime_error("not implemented");
}

std::size_t cudnnGetConvolutionForwardAlgorithm(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    Layout algoPreference,
    size_t a,
    cudnnConvolutionFwdAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionFwdAlgo_GEMM;
    return 0;
}
std::size_t cudnnGetConvolutionBackwardDataAlgorithm(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filter,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t tensor2Desc,
    Layout convMode,
    size_t a,
    cudnnConvolutionBwdDataAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionBwdDataAlgo_GEMM;
    return 0;
}
std::size_t cudnnGetConvolutionBackwardFilterAlgorithm(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnTensorDescriptor_t tensor2Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filterDesc,
    Layout filterMode,
    size_t a,
    cudnnConvolutionBwdFilterAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionBwdFilterAlgo_GEMM;
    return 0;
}
