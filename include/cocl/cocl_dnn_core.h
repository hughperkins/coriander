#pragma once

#include <cstddef>
#include <cstdint>

// targeted at running: https://github.com/tbennun/cudnn-training/blob/master/lenet.cu

typedef int32_t CoclDnnGeometryType;
typedef size_t CoclDnnSizeType;

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
        CoclDnnLayout layout,
        CoclDnnLayout datatype,
        CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W);

    size_t cudnnSetFilter4dDescriptor(
        cudnnFilterDescriptor_t filter,
        CoclDnnLayout layout,
        CoclDnnLayout dataType,
        CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W
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
}
