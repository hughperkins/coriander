#pragma once

// The GEMM/im2col implementation used here is:
// - adapted from clnn: https://github.com/hughperkins/clnn/blob/master/lib/THCLNN/im2col.cpp), which was
// - ported from cunn: https://github.com/torch/cunn/blob/master/lib/THCUNN/im2col.h), which was
// - adapted from Caffe: https://github.com/BVLC/caffe/blob/master/src/caffe/layers/conv_layer.cu)

// other convolutional implementatinos can be added in the future, but GEMM/im2col gives a solid works-everywhere base
// to start from

#include "cocl/cocl_dnn.h"

#include "EasyCL/EasyCL.h"

namespace cocl {
namespace dnn {
namespace gemm_im2col {

// class GemmIm2col {
// public:
//     size_t columnsNumElements; // eg, number of floats in columns
//     size_t onesNumElements;  // eg number of floats in ones
// };

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
    cl_mem col_buf, size_t col_offset
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
    cl_mem im_buf, size_t im_offset_bytes
);

CoclDnnGeometryType getColumnsNumElements(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor);

// CoclDnnGeometryType getOnesNumElements(
//         cudnnHandle_t handle,
//         cudnnTensorDescriptor_t srcTensor,
//         cudnnFilterDescriptor_t filter,
//         cudnnConvolutionDescriptor_t conv,
//         cudnnTensorDescriptor_t dstTensor);

std::size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    CoclDnnSizeType *p_size_bytes
);

size_t cudnnConvolutionForward(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t inputTensorDesc, float *inputData,
    cudnnFilterDescriptor_t filterDesc, float *filterData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnSizeType workspaceSize,
    float *p_beta,
    cudnnTensorDescriptor_t outputTensorDesc, float *outputData
);

} // namespace gemm_im2col
} // namespace dnn
} // namespace cocl
