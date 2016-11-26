#pragma once

// targeted at running: https://github.com/tbennun/cudnn-training/blob/master/lenet.cu

namespace cocl {
namespace dnn {

class Dnn {
public:
};

class TensorDescriptor {
public:
};

class FilterDescriptor {

};

class ConvolutionDescriptor {
public:
};

class PoolingDescriptor {
public:
};

class ActivationDescriptor {
public:
};

} // namespace dnn
} // namespace Cocl

typedef cocl::dnn::Dnn *cudnnHandle_t;
typedef cocl::dnn::TensorDescriptor *cudnnTensorDescriptor_t;
typedef cocl::dnn::FilterDescriptor *cudnnFilterDescriptor_t;
typedef cocl::dnn::ConvolutionDescriptor *cudnnConvolutionDescriptor_t;
typedef cocl::dnn::PoolingDescriptor *cudnnPoolingDescriptor_t;
typedef cocl::dnn::ActivationDescriptor *cudnnActivationDescriptor_t;

enum dnnStatusCodes {
    CUDNN_STATUS_SUCCESS = 0  // success is typically 0, I think?
};

enum cudnnConvolutionFwdAlgo_t {
   cudnnConvolutionFwdAlgo_t_foo = 126742
};

enum cudnnConvolutionBwdDataAlgo_t {
   efwef = 315315
};

enum cudnnConvolutionBwdFilterAlgo_t {
   cudnnConvolutionBwdAlgo_t_foo = 563543
};
// cudnnConvolutionBwdFilterAlgo_t

enum Layout {
    CUDNN_TENSOR_NCHW = 35333,
    CUDNN_DATA_FLOAT,
    CUDNN_POOLING_MAX,
    CUDNN_PROPAGATE_NAN,
    CUDNN_ACTIVATION_RELU,
    CUDNN_CROSS_CORRELATION,
    CUDNN_CONVOLUTION_FWD_PREFER_FASTEST,
    CUDNN_SOFTMAX_ACCURATE,
    CUDNN_SOFTMAX_MODE_CHANNEL,
    CUDNN_CONVOLUTION_BWD_FILTER_PREFER_FASTEST
};

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
        Layout layout,
        Layout datatype,
        int N, int C, int H, int W);
    size_t cudnnSetPooling2dDescriptor(
        cudnnPoolingDescriptor_t pool,
        Layout type,
        Layout propagate,
        int kH, int kW,
        int padH, int padW,
        int strideH, int strideW
    );

    size_t cudnnSetActivationDescriptor(
        cudnnActivationDescriptor_t act, Layout activationType, Layout propagate,
            float probability);
    size_t cudnnSetFilter4dDescriptor(
        cudnnFilterDescriptor_t filter,
        Layout layout,
        Layout dataType,
        int N, int C, int H, int W
    );
    size_t cudnnSetConvolution2dDescriptor(
        cudnnConvolutionDescriptor_t conv,
        int a, int b, int c, int d, int e, int f,
        Layout correlationType
    );

    size_t cudnnGetConvolutionForwardWorkspaceSize(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor,
        cudnnConvolutionFwdAlgo_t algo,
        size_t *p_size_bytes
    );
    size_t cudnnGetConvolution2dForwardOutputDim(
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        int *N, int *C, int *H, int *W);
    size_t cudnnGetConvolutionForwardAlgorithm(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor,
        Layout algoPreference,
        int a,
        cudnnConvolutionFwdAlgo_t *p_algo
    );

    size_t cudnnConvolutionForward(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnTensorDescriptor_t poolTensor,
        float * pool,
        cudnnFilterDescriptor_t filterDesc,
        float *conv,
        cudnnConvolutionDescriptor_t conv2Desc,
        cudnnConvolutionFwdAlgo_t conv2algo,
        void *workspace,
        size_t workspaceSize,
        float *p_beta,
        cudnnTensorDescriptor_t tensorDesc,
        float *conv
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
        cudnnTensorDescriptor_t poolDesc,
        float *pool
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
        Layout softmaxMode,
        Layout softmaxChannel,
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
        Layout filterMode,
        int a,
        cudnnConvolutionFwdAlgo_t fwdAlgo
    );
}
