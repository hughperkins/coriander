#pragma once

#include <cstddef>
#include <cstdint>

// targeted at running: https://github.com/tbennun/cudnn-training/blob/master/lenet.cu

typedef int32_t CoclDnnGeometryType;
typedef size_t CoclDnnSizeType;

typedef int32_t cudnnStatus_t;

enum dnnStatusCodes {
    CUDNN_STATUS_SUCCESS = 0  // success is typically 0, I think?
};

enum CoclDnnLayout {
    CUDNN_POOLING_MAX=35333,
    CUDNN_PROPAGATE_NAN,
    CUDNN_ACTIVATION_RELU,
    CUDNN_ACTIVATION_SIGMOID,
    CUDNN_ACTIVATION_TANH,
    CUDNN_CROSS_CORRELATION,
    CUDNN_CONVOLUTION_FWD_PREFER_FASTEST,
    CUDNN_SOFTMAX_ACCURATE,
    CUDNN_SOFTMAX_MODE_CHANNEL,
    CUDNN_CONVOLUTION_BWD_FILTER_PREFER_FASTEST,
    CUDNN_CONVOLUTION_BWD_DATA_PREFER_FASTEST,
    CUDNN_STATUS_NOT_INITIALIZED,
    CUDNN_STATUS_ALLOC_FAILED,
    CUDNN_STATUS_INTERNAL_ERROR,
    CUDNN_STATUS_INVALID_VALUE,
    CUDNN_STATUS_ARCH_MISMATCH,
    CUDNN_STATUS_MAPPING_ERROR,
    CUDNN_STATUS_EXECUTION_FAILED,
    CUDNN_STATUS_BAD_PARAM,
    CUDNN_STATUS_LICENSE_ERROR,
    CUDNN_STATUS_NOT_SUPPORTED
};

#define CUDNN_VERSION 5000

enum cudnnDataType_t {
    CUDNN_DATA_DOUBLE=5344,
    CUDNN_DATA_FLOAT,
    CUDNN_DATA_HALF
};

enum cudnnConvolutionFwdPreference_t {
    CUDNN_CONVOLUTION_FWD_SPECIFY_WORKSPACE_LIMIT=124534,
    CUDNN_CONVOLUTION_FWD_NO_WORKSPACE
};

enum cudnnConvolutionBwdDataPreference_t {
    CUDNN_CONVOLUTION_BWD_DATA_SPECIFY_WORKSPACE_LIMIT=73543,
    CUDNN_CONVOLUTION_BWD_DATA_NO_WORKSPACE
};

enum cudnnTensorFormat_t {
    CUDNN_TENSOR_NCHW = 35333
};

enum cudnnConvolutionBwdFilterPreference_t {
    CUDNN_CONVOLUTION_BWD_FILTER_SPECIFY_WORKSPACE_LIMIT=32352,
    CUDNN_CONVOLUTION_BWD_FILTER_NO_WORKSPACE
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

} // namespace dnn
} // namespace Cocl

typedef cocl::dnn::Dnn *cudnnHandle_t;
typedef cocl::dnn::TensorDescriptor *cudnnTensorDescriptor_t;
typedef cocl::dnn::FilterDescriptor *cudnnFilterDescriptor_t;

extern "C" {
    size_t cudnnCreate(cudnnHandle_t *p_handle);
    size_t cudnnDestroy(cudnnHandle_t handle);

    const char *cudnnGetErrorString(size_t error);
    size_t cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t *p_tensor);
    size_t cudnnCreateFilterDescriptor(cudnnFilterDescriptor_t *p_desc);

    size_t cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t desc);
    size_t cudnnDestroyFilterDescriptor(cudnnFilterDescriptor_t desc);

    size_t cudnnSetTensor4dDescriptor(
        cudnnTensorDescriptor_t tensor,
        cudnnTensorFormat_t layout,
        cudnnDataType_t datatype,
        CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W);

    size_t cudnnSetFilter4dDescriptor(
        cudnnFilterDescriptor_t filter,
        cudnnDataType_t layout,
        cudnnTensorFormat_t dataType,
        CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W
    );
    size_t cudnnAddTensor(
        cudnnHandle_t handle,
        const float *p_alpha,
        cudnnTensorDescriptor_t tensorDesc1, const void *tensor,
        const float *p_beta,
        cudnnTensorDescriptor_t tensorDesc2, void *tensor2
    );
    size_t cudnnSoftmaxForward(
        cudnnHandle_t handle,
        CoclDnnLayout softmaxMode,
        CoclDnnLayout softmaxChannel,
        float *p_alpha,
        cudnnTensorDescriptor_t tensor1Desc, float *tensor1_data,
        float *p_beta,
        cudnnTensorDescriptor_t tensor2Desc, float *out_data
    );
}

// used by tensorflow dnn classes:

namespace cocl {
    namespace dnn {
        class ConvolutionDescriptor;
    }
}

size_t cudnnSetStream(cocl::dnn::Dnn *, char *);
size_t cudnnSetTensorNdDescriptor(cocl::dnn::TensorDescriptor *, cudnnDataType_t, int, int *, int *);
size_t cudnnSetFilterNdDescriptor(cocl::dnn::FilterDescriptor *, cudnnDataType_t, cudnnTensorFormat_t, unsigned long, int *);
size_t cudnnSetConvolutionNdDescriptor(cocl::dnn::ConvolutionDescriptor *, int, int *, int *, int *, CoclDnnLayout, cudnnDataType_t);
size_t cudnnTransformTensor(cocl::dnn::Dnn *, float *, cocl::dnn::TensorDescriptor *, void *, float *, cocl::dnn::TensorDescriptor *, void *);
