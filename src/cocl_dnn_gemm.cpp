// The GEMM/im2col implementation used here is:
// - adapted from clnn: https://github.com/hughperkins/clnn/blob/master/lib/THCLNN/im2col.cpp), which was
// - ported from cunn: https://github.com/torch/cunn/blob/master/lib/THCUNN/im2col.h), which was
// - adapted from Caffe: https://github.com/BVLC/caffe/blob/master/src/caffe/layers/conv_layer.cu)

// other convolutional implementatinos can be added in the future, but GEMM/im2col gives a solid works-everywhere base
// to start from

#include "cocl_dnn_gemm.h"

#include "cocl/cocl_dnn.h"

#include <iostream>
using namespace std;

namespace cocl {
namespace dnn {
namespace gemm_im2col {

size_t getColumnsNumElements(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor) {

    size_t outN, outC, outH, outW;
    cudnnGetConvolution2dForwardOutputDim(
        conv,
        srcTensor,
        filter,
        &outN, &outC, &outH, &outW);

    size_t inC = srcTensor->C;
    size_t rows = inC * filter->kW * filter->kH;
    size_t cols = outH * outW;
    return rows * cols;
}

size_t getOnesNumElements(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor) {

    size_t outN, outC, outH, outW;
    cudnnGetConvolution2dForwardOutputDim(
        conv,
        srcTensor,
        filter,
        &outN, &outC, &outH, &outW);

    size_t rows = outH;
    size_t cols = outW;
    return rows * cols;
}

std::size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    std::size_t *p_size_bytes
) {
    cout << "gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize()" << endl;

    // we need size of columns, and size of ones
    *p_size_bytes = getColumnsNumElements(handle, srcTensor, filter, conv, dstTensor) *
        getOnesNumElements(handle, srcTensor, filter, conv, dstTensor);
    return 0;
}

} // namespace gemm_im2col
} // namespace dnn
} // namespace cocl
