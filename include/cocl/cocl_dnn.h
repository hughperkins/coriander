#pragma once

#include <cstddef>
#include <cstdint>

// targeted at running: https://github.com/tbennun/cudnn-training/blob/master/lenet.cu

typedef int32_t CoclDnnGeometryType;
typedef size_t CoclDnnSizeType;

enum cudnnConvolutionFwdAlgo_t {
   cudnnConvolutionFwdAlgo_GEMM = 126742
};

enum cudnnConvolutionBwdDataAlgo_t {
   cudnnConvolutionBwdDataAlgo_GEMM = 315315
};

enum cudnnConvolutionBwdFilterAlgo_t {
   cudnnConvolutionBwdFilterAlgo_GEMM = 563543
};
// cudnnConvolutionBwdFilterAlgo_t

enum dnnStatusCodes {
    CUDNN_STATUS_SUCCESS = 0  // success is typically 0, I think?
};

enum CoclDnnLayout {
    CUDNN_TENSOR_NCHW = 35333,
    CUDNN_DATA_FLOAT,
    CUDNN_POOLING_MAX,
    CUDNN_PROPAGATE_NAN,
    CUDNN_ACTIVATION_RELU,
    CUDNN_CROSS_CORRELATION,
    CUDNN_CONVOLUTION_FWD_PREFER_FASTEST,
    CUDNN_SOFTMAX_ACCURATE,
    CUDNN_SOFTMAX_MODE_CHANNEL,
    CUDNN_CONVOLUTION_BWD_FILTER_PREFER_FASTEST,
    CUDNN_CONVOLUTION_BWD_DATA_PREFER_FASTEST
};

namespace cocl {
namespace dnn {

class Dnn {
public:
};

class TensorDescriptor {
public:
    CoclDnnLayout layout;
    CoclDnnLayout datatype;
    CoclDnnGeometryType N;
    CoclDnnGeometryType C;
    CoclDnnGeometryType H;
    CoclDnnGeometryType W;
};

class FilterDescriptor {
public:
    CoclDnnLayout layout;
    CoclDnnLayout dataType;
    CoclDnnGeometryType outC;
    CoclDnnGeometryType inC;
    CoclDnnGeometryType kH;
    CoclDnnGeometryType kW;
};

class ConvolutionDescriptor {
public:
    // cudnnTensorDescriptor_t inputTensorDesc;
    // cudnnFilterDescriptor_t filterDesc;
    CoclDnnGeometryType padH;
    CoclDnnGeometryType padW;
    CoclDnnGeometryType dH;
    CoclDnnGeometryType dW;
    CoclDnnGeometryType scaleH;
    CoclDnnGeometryType scaleW;
    CoclDnnLayout correlationType;
};


class PoolingDescriptor {
public:
    CoclDnnLayout type;
    CoclDnnLayout propagate;
    CoclDnnGeometryType kH;
    CoclDnnGeometryType kW;
    CoclDnnGeometryType padH;
    CoclDnnGeometryType padW;
    CoclDnnGeometryType strideH;
    CoclDnnGeometryType strideW;
};

class ActivationDescriptor {
public:
    CoclDnnLayout activationType;
    CoclDnnLayout propagate;
    float probability;
};

} // namespace dnn
} // namespace Cocl

typedef cocl::dnn::Dnn *cudnnHandle_t;
typedef cocl::dnn::TensorDescriptor *cudnnTensorDescriptor_t;
typedef cocl::dnn::FilterDescriptor *cudnnFilterDescriptor_t;
typedef cocl::dnn::ConvolutionDescriptor *cudnnConvolutionDescriptor_t;
typedef cocl::dnn::PoolingDescriptor *cudnnPoolingDescriptor_t;
typedef cocl::dnn::ActivationDescriptor *cudnnActivationDescriptor_t;

extern "C" {
    size_t cudnnCreate(cudnnHandle_t *p_handle);
    size_t cudnnDestroy(cudnnHandle_t handle);

    const char *cudnnGetErrorString(size_t error);
    size_t cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t *p_tensor);
    size_t cudnnCreateActivationDescriptor(cudnnActivationDescriptor_t *p_descr);
    size_t cudnnCreateFilterDescriptor(cudnnFilterDescriptor_t *p_desc);
    size_t cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t *p_desc);
    size_t cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t *p_desc);

    size_t cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t desc);
    size_t cudnnDestroyActivationDescriptor(cudnnActivationDescriptor_t desc);
    size_t cudnnDestroyFilterDescriptor(cudnnFilterDescriptor_t desc);
    size_t cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t desc);
    size_t cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t desc);

    size_t cudnnSetTensor4dDescriptor(
        cudnnTensorDescriptor_t tensor,
        CoclDnnLayout layout,
        CoclDnnLayout datatype,
        CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W);
    size_t cudnnSetPooling2dDescriptor(
        cudnnPoolingDescriptor_t pool,
        CoclDnnLayout type,
        CoclDnnLayout propagate,
        CoclDnnGeometryType kH, CoclDnnGeometryType kW,
        CoclDnnGeometryType padH, CoclDnnGeometryType padW,
        CoclDnnGeometryType strideH, CoclDnnGeometryType strideW
    );

    size_t cudnnSetActivationDescriptor(
        cudnnActivationDescriptor_t act, CoclDnnLayout activationType, CoclDnnLayout propagate,
            float probability);
    size_t cudnnSetFilter4dDescriptor(
        cudnnFilterDescriptor_t filter,
        CoclDnnLayout layout,
        CoclDnnLayout dataType,
        CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W
    );
    size_t cudnnSetConvolution2dDescriptor(
        cudnnConvolutionDescriptor_t conv,
        CoclDnnGeometryType a, CoclDnnGeometryType b, CoclDnnGeometryType c, CoclDnnGeometryType d, CoclDnnGeometryType e, CoclDnnGeometryType f,
        CoclDnnLayout correlationType
    );

    size_t cudnnGetConvolutionForwardWorkspaceSize(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor,
        cudnnConvolutionFwdAlgo_t algo,
        CoclDnnSizeType *p_size_bytes
    );
    size_t cudnnGetConvolution2dForwardOutputDim(
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        CoclDnnGeometryType *N, CoclDnnGeometryType *C, CoclDnnGeometryType *H, CoclDnnGeometryType *W);
    size_t cudnnGetConvolutionForwardAlgorithm(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor,
        CoclDnnLayout algoPreference,
        CoclDnnGeometryType a,
        cudnnConvolutionFwdAlgo_t *p_algo
    );

    size_t cudnnConvolutionForward(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnTensorDescriptor_t inputTensorDesc, float *inputData,
        cudnnFilterDescriptor_t filterDesc, float *filterData,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnConvolutionFwdAlgo_t algo,
        void *workspaceData, CoclDnnSizeType workspaceSize,
        float *p_beta,
        cudnnTensorDescriptor_t outputTensorDesc, float *outputData
    );
    size_t cudnnAddTensor(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnTensorDescriptor_t tensorDesc1,
        float *tensor,
        float *p_beta,
        cudnnTensorDescriptor_t tensorDesc2,
        float * tensor2
    );
    size_t cudnnPoolingForward(
        cudnnHandle_t handle,
        cudnnPoolingDescriptor_t poolDesc,
        float *p_alpha,
        cudnnTensorDescriptor_t convDesc,
        float *conv,
        float *p_beta,
        cudnnTensorDescriptor_t poolDesc2,
        float *pool
    );
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
    );
    size_t cudnnActivationForward(
        cudnnHandle_t handle,
        cudnnActivationDescriptor_t activationDesc,
        float *p_alpha,
        cudnnTensorDescriptor_t tensor1Desc,
        float *tensor1,
        float *p_beta,
        cudnnTensorDescriptor_t tensor2Desc,
        float *tensor2
    );
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
    );
    size_t cudnnGetConvolutionBackwardFilterAlgorithm(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnTensorDescriptor_t tensor2Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnFilterDescriptor_t filterDesc,
        CoclDnnLayout filterMode,
        CoclDnnGeometryType a,
        cudnnConvolutionBwdFilterAlgo_t *p_algo
    );
    size_t cudnnConvolutionBackwardFilter(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnTensorDescriptor_t tensor1Desc,
        float *tensor1_data,
        cudnnTensorDescriptor_t tensor2Desc,
        float *tensor2_data,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnConvolutionBwdFilterAlgo_t algo,
        void *workspace,
        CoclDnnGeometryType workspaceSize,
        float *p_beta,
        cudnnFilterDescriptor_t filterDesc,
        float *out
    );
    size_t cudnnConvolutionBackwardData(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnFilterDescriptor_t filtersDesc, float *filters_data,
        cudnnTensorDescriptor_t gradOutputDesc, float *gradOutput_data,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnConvolutionBwdDataAlgo_t algo,
        void *workspace,
        CoclDnnGeometryType workspaceSize,
        float *p_beta,
        cudnnTensorDescriptor_t gradInputDesc, float *gradInput
    );
    size_t cudnnGetConvolutionBackwardFilterWorkspaceSize(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnTensorDescriptor_t tensor2Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionBwdFilterAlgo_t algo,
        CoclDnnSizeType *p_size
    );
    size_t cudnnGetConvolutionBackwardDataAlgorithm(
        cudnnHandle_t handle,
        cudnnFilterDescriptor_t filter,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnTensorDescriptor_t tensor2Desc,
        CoclDnnLayout convMode,
        CoclDnnGeometryType a,
        cudnnConvolutionBwdDataAlgo_t *p_algo
    );
    size_t cudnnGetConvolutionBackwardDataWorkspaceSize(
        cudnnHandle_t handle,
        cudnnFilterDescriptor_t filter,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnTensorDescriptor_t tensor2Desc,
        cudnnConvolutionBwdDataAlgo_t algo,
        CoclDnnSizeType *p_size
    );
    size_t cudnnActivationBackward(
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
    );
    size_t cudnnConvolutionBackwardBias(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnTensorDescriptor_t tensor1Desc,
        float *tensor1,
        float *p_beta,
        cudnnTensorDescriptor_t tensor2Desc,
        float *tensor2
    );
}
