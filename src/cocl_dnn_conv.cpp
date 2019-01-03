#include "cocl/cocl_dnn_conv.h"

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

using namespace cocl;
using namespace cocl::dnn;

size_t cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t *p_desc) {
    *p_desc = new ConvolutionDescriptor();
    return 0;
}
// tensorflow uses like:
// status = dynload::cudnnSetConvolutionNdDescriptor(
//     parent_, handle_, convolution_descriptor.ndims(), padding.data(),
//     strides.data(), upscale.data() ...)
size_t cudnnSetConvolution2dDescriptor(
    cudnnConvolutionDescriptor_t conv,
    CoclDnnGeometryType padH, CoclDnnGeometryType padW, CoclDnnGeometryType dH, CoclDnnGeometryType dW, CoclDnnGeometryType scaleH, CoclDnnGeometryType scaleW,
    CoclDnnLayout correlationType
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
size_t cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t desc) {
    delete desc;
    return 0;
}
size_t cudnnGetConvolution2dForwardOutputDim(
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t inTensorDesc,
    cudnnFilterDescriptor_t filterDesc,
    CoclDnnGeometryType *poutN, CoclDnnGeometryType *poutC, CoclDnnGeometryType *poutH, CoclDnnGeometryType *poutW) {
    // conv->inputTensorDesc = srcTensor;
    // conv->filterDesc = filter;
    // conv->N = N;
    // conv->C = C;
    // conv->H = H;
    // conv->W = W;
    // *pC = srcTensor->C;
    // *pH = srcTensor->H; // obviously needs tweaking a bit...
    // *pW = srcTensor->W;

    CoclDnnGeometryType outC = filterDesc->outC;
    CoclDnnGeometryType outH = (inTensorDesc->H + 2 * convDesc->padH - filterDesc->kH) / convDesc->dH + 1;
    CoclDnnGeometryType outW = (inTensorDesc->W + 2 * convDesc->padW - filterDesc->kW) / convDesc->dW + 1;

    *poutN = inTensorDesc->N;
    *poutC = outC;
    *poutH = outH;
    *poutW = outW;

    return 0;
}
size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    cudnnConvolutionFwdAlgo_t algo,
    CoclDnnSizeType *p_size_bytes
) {
    switch(algo) {
        case cudnnConvolutionFwdAlgo_GEMM:
        case cudnnConvolutionFwdAlgo_IMPLICIT_GEMM:
        case cudnnConvolutionFwdAlgo_IMPLICIT_PRECOMP_GEMM:
            cocl::dnn::gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize(
                handle, srcTensor, filter, conv, dstTensor, p_size_bytes);
            break;
        default:
            throw runtime_error("No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
size_t cudnnConvolutionForward(
    cudnnHandle_t handle,
    const float *p_alpha,
    cudnnTensorDescriptor_t inputTensorDesc,const float *inputData,
    cudnnFilterDescriptor_t filterDesc, const float *filterData,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnConvolutionFwdAlgo_t algo,
    void *workspaceData, CoclDnnSizeType workspaceSize,
    const float *p_beta,
    cudnnTensorDescriptor_t outputTensorDesc, float *outputData
) {
    switch(algo) {
        case cudnnConvolutionFwdAlgo_GEMM:
            cocl::dnn::gemm_im2col::cudnnConvolutionForward(
                handle,
                p_alpha,
                inputTensorDesc, inputData,
                filterDesc, filterData,
                convDesc,
                workspaceData, workspaceSize,
                p_beta,
                outputTensorDesc, outputData);
            break;
        default:
            throw runtime_error("cudnnConvolutionForward. No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
size_t cudnnGetConvolutionBackwardFilterWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t inputDesc,
    cudnnTensorDescriptor_t outputDesc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filterDesc,
    cudnnConvolutionBwdFilterAlgo_t algo,
    CoclDnnSizeType *p_size
) {
    switch(algo) {
        case cudnnConvolutionBwdFilterAlgo_GEMM:
            cocl::dnn::gemm_im2col::cudnnGetConvolutionBackwardFilterWorkspaceSize(
                handle,
                inputDesc, outputDesc, convDesc, filterDesc, p_size
            );
            break;
        default:
            throw runtime_error("No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
size_t cudnnGetConvolutionBackwardDataWorkspaceSize(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filterDesc,
    cudnnTensorDescriptor_t gradOutputDesc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t gradInputDesc,
    cudnnConvolutionBwdDataAlgo_t algo,
    CoclDnnSizeType *p_size_bytes
) {
    switch(algo) {
        case cudnnConvolutionBwdDataAlgo_GEMM:
            cocl::dnn::gemm_im2col::cudnnGetConvolutionBackwardDataWorkspaceSize(
                handle,
                filterDesc, gradOutputDesc, convDesc, gradInputDesc, p_size_bytes);
            break;
        default:
            throw runtime_error("No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
size_t cudnnConvolutionBackwardFilter(
    cudnnHandle_t handle,
     float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, const float *input_data,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutput_data,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnConvolutionBwdFilterAlgo_t algo,
    void *workspace_data, CoclDnnGeometryType workspaceSize,
    float *p_beta,
    cudnnFilterDescriptor_t filterDesc, float *gradInput_data
)  {
    switch(algo) {
        case cudnnConvolutionBwdFilterAlgo_GEMM:
            cocl::dnn::gemm_im2col::cudnnConvolutionBackwardFilter(
                handle,
                p_alpha,
                inputDesc, input_data,
                gradOutputDesc, gradOutput_data,
                convDesc,
                workspace_data, workspaceSize,
                p_beta,
                filterDesc, gradInput_data
            );
            break;
        default:
            throw runtime_error("cudnnConvolutionBackwardFilter. No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
size_t cudnnConvolutionBackwardBias(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t gradOutputDesc, const float *gradOutputData,
    float *p_beta,
    cudnnTensorDescriptor_t gradBiasDesc, float *gradBiasData
)  {
    cocl::dnn::gemm_im2col::cudnnConvolutionBackwardBias(
        handle,
        p_alpha,
        gradOutputDesc, gradOutputData,
        p_beta,
        gradBiasDesc, gradBiasData
    );
    return 0;
}
size_t cudnnConvolutionBackwardData(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnFilterDescriptor_t filterDesc, const float *filter_data,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutput_data,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnConvolutionBwdDataAlgo_t algo,
    void *workspace,
    CoclDnnGeometryType workspaceSize,
    float *p_beta,
    cudnnTensorDescriptor_t gradInputDesc, float *gradInput_data
) {
    switch(algo) {
        case cudnnConvolutionBwdDataAlgo_GEMM:
            cocl::dnn::gemm_im2col::cudnnConvolutionBackwardData(
                handle,
                p_alpha,
                filterDesc, filter_data,
                gradOutputDesc, gradOutput_data,
                convDesc,
                workspace,
                workspaceSize,
                p_beta,
                gradInputDesc, gradInput_data
            );
            break;
        default:
            throw runtime_error("cudnnConvolutionBackwardData. No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
size_t cudnnGetConvolutionForwardAlgorithm(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    CoclDnnLayout algoPreference,
    CoclDnnGeometryType a,
    cudnnConvolutionFwdAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionFwdAlgo_GEMM;
    return 0;
}
size_t cudnnGetConvolutionBackwardDataAlgorithm(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filter,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t tensor2Desc,
    CoclDnnLayout convMode,
    CoclDnnGeometryType a,
    cudnnConvolutionBwdDataAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionBwdDataAlgo_GEMM;
    return 0;
}
size_t cudnnGetConvolutionBackwardFilterAlgorithm(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnTensorDescriptor_t tensor2Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filterDesc,
    CoclDnnLayout filterMode,
    CoclDnnGeometryType a,
    cudnnConvolutionBwdFilterAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionBwdFilterAlgo_GEMM;
    return 0;
}
