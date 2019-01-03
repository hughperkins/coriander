#pragma once

// The GEMM/im2col implementation used here is:
// - adapted from clnn: https://github.com/hughperkins/clnn/blob/master/lib/THCLNN/im2col.cpp), which was
// - ported from cunn: https://github.com/torch/cunn/blob/master/lib/THCUNN/im2col.h), which was
// - adapted from Caffe: https://github.com/BVLC/caffe/blob/master/src/caffe/layers/conv_layer.cu)

// other convolutional implementatinos can be added in the future, but GEMM/im2col gives a solid works-everywhere base
// to start from

#include "cocl/cocl_dnn.h"
#include "cocl/cocl_dnn_conv.h"
#include "EasyCL/EasyCL.h"

namespace cocl {
namespace dnn {
namespace gemm_im2col {

void im2col(
    cl_mem im_buf, size_t im_offset,
    const CoclDnnGeometryType channels,
    const CoclDnnGeometryType height,
    const CoclDnnGeometryType width,
    const CoclDnnGeometryType ksize_h,
    const CoclDnnGeometryType ksize_w,
    const CoclDnnGeometryType pad_h,
    const CoclDnnGeometryType pad_w,
    const CoclDnnGeometryType stride_h,
    const CoclDnnGeometryType stride_w,
    cl_mem col_buf, size_t col_offset,
    cl_command_queue *queue
);

void col2im(
    cl_mem col_buf, size_t col_offset_bytes,
    const CoclDnnGeometryType channels,
    const CoclDnnGeometryType height,
    const CoclDnnGeometryType width,
    const CoclDnnGeometryType ksize_h,
    const CoclDnnGeometryType ksize_w,
    const CoclDnnGeometryType pad_h,
    const CoclDnnGeometryType pad_w,
    const CoclDnnGeometryType stride_h,
    const CoclDnnGeometryType stride_w,
    cl_mem im_buf, size_t im_offset_bytes,
    cl_command_queue *queue
);

CoclDnnGeometryType getColumnsNumElements(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor);

std::size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    CoclDnnSizeType *p_size_bytes
);
size_t cudnnGetConvolutionBackwardDataWorkspaceSize(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filterDesc,
    cudnnTensorDescriptor_t gradOutputDesc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t gradInputDesc,
    CoclDnnSizeType *p_size_bytes
);
size_t cudnnGetConvolutionBackwardFilterWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t inputDesc,
    cudnnTensorDescriptor_t outputDesc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filterDesc,
    CoclDnnSizeType *p_size
);

size_t cudnnConvolutionForward(
    cudnnHandle_t handle,
    const float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, const float *inputData,
    cudnnFilterDescriptor_t filterDesc, const float *filterData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnSizeType workspaceSize,
    const float *p_beta,
    cudnnTensorDescriptor_t outputDesc, float *outputData
);
size_t cudnnConvolutionBackwardData(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnFilterDescriptor_t filterDesc, const float *filterData,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutputData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnGeometryType workspaceSize,
    float *p_beta,
    cudnnTensorDescriptor_t gradInputDesc, float *gradInputData
) ;
size_t cudnnConvolutionBackwardFilter(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, const float *inputData,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutputData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnGeometryType workspaceSize,
    float *p_beta,
    cudnnFilterDescriptor_t filterDesc, float *gradFilterData
) ;
size_t cudnnConvolutionBackwardBias(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t gradOutputDesc, const float *gradOutputData,
    float *p_beta,
    cudnnTensorDescriptor_t gradBiasDesc, float *gradBiasData
);

} // namespace gemm_im2col
} // namespace dnn
} // namespace cocl
