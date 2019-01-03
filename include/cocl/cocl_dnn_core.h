#pragma once

#include <cstddef>
#include <cstdint>
#include "cocl.h"
// targeted at running: https://github.com/tbennun/cudnn-training/blob/master/lenet.cu

typedef int32_t CoclDnnGeometryType;
typedef size_t CoclDnnSizeType;
//typedef size_t cudnnStatus_t;

enum dnnStatusCodes {
    CUDNN_STATUS_SUCCESS = 0,  // success is typically 0, I think?
    CUDNN_STATUS_NOT_INITIALIZED,
    CUDNN_STATUS_ALLOC_FAILED,
    CUDNN_STATUS_BAD_PARAM,
    CUDNN_STATUS_INTERNAL_ERROR,
    CUDNN_STATUS_INVALID_VALUE,
    CUDNN_STATUS_ARCH_MISMATCH,
    CUDNN_STATUS_MAPPING_ERROR,
    CUDNN_STATUS_EXECUTION_FAILED,
    CUDNN_STATUS_NOT_SUPPORTED,
    CUDNN_STATUS_LICENSE_ERROR,
    CUDNN_STATUS_RUNTIME_PREREQUISITE_MISSING = 11,
    CUDNN_STATUS_RUNTIME_IN_PROGRESS          = 12,
    CUDNN_STATUS_RUNTIME_FP_OVERFLOW          = 13,
};

enum{
    CUDNN_CONVOLUTION_FWD_ALGO_GEMM = 126742,
    CUDNN_CONVOLUTION_FWD_ALGO_IMPLICIT_GEMM,
    CUDNN_CONVOLUTION_FWD_ALGO_IMPLICIT_PRECOMP_GEMM,
    CUDNN_CONVOLUTION_FWD_ALGO_DIRECT,
    CUDNN_CONVOLUTION_FWD_ALGO_FFT,
    CUDNN_CONVOLUTION_FWD_ALGO_FFT_TILING,
    CUDNN_CONVOLUTION_FWD_ALGO_WINOGRAD,
};


enum{
    CUDNN_CONVOLUTION_BWD_DATA_ALGO_0 = 315315,
    CUDNN_CONVOLUTION_BWD_DATA_ALGO_1,
    CUDNN_CONVOLUTION_BWD_DATA_ALGO_FFT,
    CUDNN_CONVOLUTION_BWD_DATA_ALGO_FFT_TILING,
    CUDNN_CONVOLUTION_BWD_DATA_ALGO_WINOGRAD,
    CUDNN_CONVOLUTION_BWD_FILTER_ALGO_0 = 563543,
    CUDNN_CONVOLUTION_BWD_FILTER_ALGO_1,
    CUDNN_CONVOLUTION_BWD_FILTER_ALGO_2,
    CUDNN_CONVOLUTION_BWD_FILTER_ALGO_FFT,
    CUDNN_CONVOLUTION_BWD_FILTER_ALGO_3,
};


enum CoclDnnLayout {
    CUDNN_CONVOLUTION_BWD_FILTER_NO_WORKSPACE,
    CUDNN_CONVOLUTION_BWD_FILTER_SPECIFY_WORKSPACE_LIMIT,
    CUDNN_CONVOLUTION_FWD_NO_WORKSPACE,
    CUDNN_CONVOLUTION_FWD_SPECIFY_WORKSPACE_LIMIT,
    CUDNN_CONVOLUTION_BWD_DATA_SPECIFY_WORKSPACE_LIMIT,
    CUDNN_CONVOLUTION_BWD_DATA_NO_WORKSPACE,
    CUDNN_CONVOLUTION_BWD_SPECIFY_WORKSPACE_LIMIT,
    CUDNN_TENSOR_NCHW = 35333,
    CUDNN_DATA_FLOAT,
    CUDNN_POOLING_MAX,
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
    CUDNN_DATA_DOUBLE = 1,
    CUDNN_DATA_HALF   = 2,
    CUDNN_DATA_INT8   = 3,
    CUDNN_DATA_INT32  = 4,
    CUDNN_DATA_INT8x4 = 5
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

//typedef CoclDnnLayout cudnnTensorFormat_t;
//typedef CoclDnnLayout cudnnDataType_t;
//typedef CoclDnnLayout cudnnActivationMode_t;
//typedef CoclDnnLayout cudnnNanPropagation_t;

extern "C" {
    size_t cudnnCreate(cudnnHandle_t *p_handle);
    size_t cudnnDestroy(cudnnHandle_t handle);
    size_t cudnnSetStream(cudnnHandle_t handle, cudaStream_t streamId);
    size_t cudnnGetStream(cudnnHandle_t handle, cudaStream_t *streamId);

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
        const float *p_alpha,
        cudnnTensorDescriptor_t tensorDesc1,
        const float *tensor,
        const float *p_beta,
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
