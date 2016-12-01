#include <cstddef>

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
    CUDNN_CONVOLUTION_BWD_FILTER_PREFER_FASTEST,
    CUDNN_CONVOLUTION_BWD_DATA_PREFER_FASTEST
};

extern "C" {
    std::size_t cudnnCreate(cudnnHandle_t *p_handle);
    std::size_t cudnnDestroy(cudnnHandle_t handle);

    const char *cudnnGetErrorString(std::size_t error);
    std::size_t cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t *p_tensor);
    std::size_t cudnnCreateActivationDescriptor(cudnnActivationDescriptor_t *p_descr);
    std::size_t cudnnCreateFilterDescriptor(cudnnFilterDescriptor_t *p_desc);
    std::size_t cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t *p_desc);
    std::size_t cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t *p_desc);

    std::size_t cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t desc);
    std::size_t cudnnDestroyActivationDescriptor(cudnnActivationDescriptor_t desc);
    std::size_t cudnnDestroyFilterDescriptor(cudnnFilterDescriptor_t desc);
    std::size_t cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t desc);
    std::size_t cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t desc);

    std::size_t cudnnSetTensor4dDescriptor(
        cudnnTensorDescriptor_t tensor,
        Layout layout,
        Layout datatype,
        int N, int C, int H, int W);
    std::size_t cudnnSetPooling2dDescriptor(
        cudnnPoolingDescriptor_t pool,
        Layout type,
        Layout propagate,
        int kH, int kW,
        int padH, int padW,
        int strideH, int strideW
    );

    std::size_t cudnnSetActivationDescriptor(
        cudnnActivationDescriptor_t act, Layout activationType, Layout propagate,
            float probability);
    std::size_t cudnnSetFilter4dDescriptor(
        cudnnFilterDescriptor_t filter,
        Layout layout,
        Layout dataType,
        int N, int C, int H, int W
    );
    std::size_t cudnnSetConvolution2dDescriptor(
        cudnnConvolutionDescriptor_t conv,
        int a, int b, int c, int d, int e, int f,
        Layout correlationType
    );

    std::size_t cudnnGetConvolutionForwardWorkspaceSize(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor,
        cudnnConvolutionFwdAlgo_t algo,
        std::size_t *p_size_bytes
    );
    std::size_t cudnnGetConvolution2dForwardOutputDim(
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        int *N, int *C, int *H, int *W);
    std::size_t cudnnGetConvolutionForwardAlgorithm(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor,
        Layout algoPreference,
        int a,
        cudnnConvolutionFwdAlgo_t *p_algo
    );

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
    );
    std::size_t cudnnAddTensor(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnTensorDescriptor_t tensorDesc1,
        float *tensor,
        float *p_beta,
        cudnnTensorDescriptor_t tensorDesc2,
        float * tensor2
    );
    std::size_t cudnnPoolingForward(
        cudnnHandle_t handle,
        cudnnPoolingDescriptor_t poolDesc,
        float *p_alpha,
        cudnnTensorDescriptor_t convDesc,
        float *conv,
        float *p_beta,
        cudnnTensorDescriptor_t poolDesc2,
        float *pool
    );
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
    );
    std::size_t cudnnActivationForward(
        cudnnHandle_t handle,
        cudnnActivationDescriptor_t activationDesc,
        float *p_alpha,
        cudnnTensorDescriptor_t tensor1Desc,
        float *tensor1,
        float *p_beta,
        cudnnTensorDescriptor_t tensor2Desc,
        float *tensor2
    );
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
    );
    std::size_t cudnnGetConvolutionBackwardFilterAlgorithm(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnTensorDescriptor_t tensor2Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnFilterDescriptor_t filterDesc,
        Layout filterMode,
        int a,
        cudnnConvolutionBwdFilterAlgo_t *p_algo
    );
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
    );
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
    );
    std::size_t cudnnGetConvolutionBackwardFilterWorkspaceSize(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnTensorDescriptor_t tensor2Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionBwdFilterAlgo_t algo,
        std::size_t *p_size
    );
    std::size_t cudnnGetConvolutionBackwardDataAlgorithm(
        cudnnHandle_t handle,
        cudnnFilterDescriptor_t filter,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnTensorDescriptor_t tensor2Desc,
        Layout convMode,
        int a,
        cudnnConvolutionBwdDataAlgo_t *p_algo
    );
    std::size_t cudnnGetConvolutionBackwardDataWorkspaceSize(
        cudnnHandle_t handle,
        cudnnFilterDescriptor_t filter,
        cudnnTensorDescriptor_t tensor1Desc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnTensorDescriptor_t tensor2Desc,
        cudnnConvolutionBwdDataAlgo_t algo,
        std::size_t *p_size
    );
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
    );
    std::size_t cudnnConvolutionBackwardBias(
        cudnnHandle_t handle,
        float *p_alpha,
        cudnnTensorDescriptor_t tensor1Desc,
        float *tensor1,
        float *p_beta,
        cudnnTensorDescriptor_t tensor2Desc,
        float *tensor2
    );
}
