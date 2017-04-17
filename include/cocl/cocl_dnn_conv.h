#pragma once

#include "cocl/cocl_dnn.h"

#include <cstddef>
#include <cstdint>

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

namespace cocl {
namespace dnn {

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

} // namespace dnn
} // namespace Cocl

typedef cocl::dnn::ConvolutionDescriptor *cudnnConvolutionDescriptor_t;

extern "C" {
    size_t cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t *p_desc);
    size_t cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t desc);

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
        cudnnTensorDescriptor_t inputDesc, float *input_data,
        cudnnTensorDescriptor_t gradOutputDesc, float *gradOutput_data,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnConvolutionBwdFilterAlgo_t algo,
        void *workspace_data, CoclDnnGeometryType workspaceSize,
        float *p_beta,
        cudnnFilterDescriptor_t filterDesc, float *gradInput_data
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
        cudnnTensorDescriptor_t inputDesc,
        cudnnTensorDescriptor_t outputDesc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnFilterDescriptor_t filterDesc,
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
        cudnnFilterDescriptor_t filterDesc,
        cudnnTensorDescriptor_t gradOutputDesc,
        cudnnConvolutionDescriptor_t convDesc,
        cudnnTensorDescriptor_t gradInputDesc,
        cudnnConvolutionBwdDataAlgo_t algo,
        CoclDnnSizeType *p_size
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
