// The GEMM/im2col implementation used here is:
// - adapted from clnn: https://github.com/hughperkins/clnn/blob/master/lib/THCLNN/im2col.cpp), which was
// - ported from cunn: https://github.com/torch/cunn/blob/master/lib/THCUNN/im2col.h), which was
// - adapted from Caffe: https://github.com/BVLC/caffe/blob/master/src/caffe/layers/conv_layer.cu)

// other convolutional implementatinos can be added in the future, but GEMM/im2col gives a solid works-everywhere base
// to start from

#include "cocl_dnn_gemm.h"

#include "cocl/cocl.h"
#include "cocl/cocl_dnn.h"
#include "cocl/cocl_memory.h"
#include "cocl/hostside_opencl_funcs.h"
// #include "cocl/cocl_blas.h"
#include <clblast_c.h>

#include <iostream>
using namespace std;

namespace cocl {
namespace dnn {
namespace gemm_im2col {

static string get_im2col_sourcecode();
static string get_col2im_sourcecode();

CoclDnnGeometryType getColumnsNumElements(
        cudnnHandle_t handle,
        cudnnTensorDescriptor_t srcTensor,
        cudnnFilterDescriptor_t filter,
        cudnnConvolutionDescriptor_t conv,
        cudnnTensorDescriptor_t dstTensor) {

    CoclDnnGeometryType outN, outC, outH, outW;
    cudnnGetConvolution2dForwardOutputDim(
        conv,
        srcTensor,
        filter,
        &outN, &outC, &outH, &outW);

    CoclDnnGeometryType inC = srcTensor->C;
    CoclDnnGeometryType rows = inC * filter->kW * filter->kH;
    CoclDnnGeometryType cols = outH * outW;
    return rows * cols;
}

inline int getNumThreads() {
  // int blockSize = 1024;
  // int maxWorkgroupSize = ((easycl::DeviceInfo *)state->deviceInfoByDevice[state->currentDevice])->maxWorkGroupSize;
  // if( blockSize > maxWorkgroupSize ) {
  //   blockSize = maxWorkgroupSize;
  // }
  // return blockSize;
    return 256; // just hardcode to 256 for now, which covers amd, intel, nvidia, just not always most efficiently, but
                // kind of ok
}

// CL: number of blocks for threads.
inline int GET_BLOCKS(const int N) {
  return (N + getNumThreads() - 1) / getNumThreads();
}

void im2col(cl_mem im_buf, size_t im_offset, const CoclDnnGeometryType channels,
        const CoclDnnGeometryType height,
        const CoclDnnGeometryType width,
        const CoclDnnGeometryType ksize_h,
        const CoclDnnGeometryType ksize_w,
        const CoclDnnGeometryType pad_h,
        const CoclDnnGeometryType pad_w,
        const CoclDnnGeometryType stride_h,
        const CoclDnnGeometryType stride_w,
        cl_mem col_buf, size_t col_offset
        ) {
    // We are going to launch channels * height_col * width_col kernels, each
    // kernel responsible for copying a single-channel grid.
    int height_col = (height + 2 * pad_h - ksize_h) / stride_h + 1;
    int width_col = (width + 2 * pad_w - ksize_w) / stride_w + 1;
    int num_kernels = channels * height_col * width_col;

    easycl::CLKernel *kernel = getKernelForNameCl("im2col_kernel", get_im2col_sourcecode());

    kernel->in((int32_t)num_kernels);
    kernel->inout(&im_buf);
    kernel->in((int32_t)im_offset);
    kernel->in((int32_t)height);
    kernel->in((int32_t)width);
    kernel->in((int32_t)ksize_h);
    kernel->in((int32_t)ksize_w);
    kernel->in((int32_t)pad_h);
    kernel->in((int32_t)pad_w);
    kernel->in((int32_t)stride_h);
    kernel->in((int32_t)stride_w);
    kernel->in((int32_t)height_col);
    kernel->in((int32_t)width_col);
    kernel->inout(&col_buf);
    kernel->in((int32_t)col_offset);
    kernel->run_1d(GET_BLOCKS(num_kernels), getNumThreads());
}

void col2im(cl_mem col_buf, size_t col_offset, const int channels,
        const int height, const int width, const int patch_h, const int patch_w, const int pad_h,
        const int pad_w, const int stride_h, const int stride_w,  cl_mem im_buf, size_t im_offset) {
    int height_col = (height + 2 * pad_h - patch_h) / stride_h + 1;
    int width_col = (width + 2 * pad_w - patch_w) / stride_w + 1;
    int num_kernels = channels * height * width;
    // To avoid involving atomic operations, we will launch one kernel per
    // bottom dimension, and then in the kernel add up the top dimensions.

    easycl::CLKernel *kernel = getKernelForNameCl("col2im_kernel", get_col2im_sourcecode());

    kernel->in((int32_t)num_kernels);
    kernel->inout(&col_buf);
    kernel->in((int32_t)col_offset);
    kernel->in((int32_t)height);
    kernel->in((int32_t)width);
    kernel->in((int32_t)channels);

    kernel->in((int32_t)patch_h);
    kernel->in((int32_t)patch_w);
    kernel->in((int32_t)pad_h);
    kernel->in((int32_t)pad_w);
    kernel->in((int32_t)stride_h);
    kernel->in((int32_t)stride_w);

    kernel->in((int32_t)height_col);
    kernel->in((int32_t)width_col);
    kernel->inout(&im_buf);
    kernel->in((int32_t)im_offset);

    kernel->run_1d(GET_BLOCKS(num_kernels), getNumThreads());
}

size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    CoclDnnSizeType *p_size_bytes
) {
    cout << "gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize()" << endl;
    *p_size_bytes = getColumnsNumElements(handle, srcTensor, filter, conv, dstTensor);
    return 0;
}

size_t cudnnConvolutionForward(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t inputTensorDesc, float *inputData,
    cudnnFilterDescriptor_t filterDesc, float *filterData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnSizeType workspaceSize,
    float *p_beta,
    cudnnTensorDescriptor_t outputTensorDesc, float *outputData
) {
    if(*p_alpha != 1) {
        throw runtime_error("cudnnConvolutionForward only implemented for alpha == 1");
    }
    if(*p_beta != 0) {
        throw runtime_error("cudnnConvolutionForward only implemented for beta == 0");
    }
    ThreadVars *v = getThreadVars();

    Memory *inputMemory = findMemory((const char *)inputData);
    Memory *workspaceMemory = findMemory((const char *)workspaceData);
    Memory *filterMemory = findMemory((const char *)filterData);
    Memory *outputMemory = findMemory((const char *)outputData);

    size_t inputOffset = inputMemory->getOffset((const char *)inputData);
    size_t workspaceOffset = workspaceMemory->getOffset((const char *)workspaceData);
    size_t filterOffset = filterMemory->getOffset((const char *)filterData);
    size_t outputOffset = outputMemory->getOffset((const char *)outputData);

    cl_int err;

    CoclDnnGeometryType columnsNumElements = getColumnsNumElements(
        handle, inputTensorDesc, filterDesc, convDesc, outputTensorDesc);
    // CoclDnnGeometryType onesNumElements = getOnesNumElements(
    //     handle, inputTensorDesc, filterDesc, convDesc, outputTensorDesc);
    size_t columnsOffset = workspaceOffset;
    // size_t onesOffset = workspaceOffset + (columnsNumElements * sizeof(float));

    // float oneValue = 1.0f;
    // err = clEnqueueFillBuffer(
    //     queue, workspaceMemory->clmem, &oneValue, sizeof(float), onesOffset, , 0, NULL, NULL);
    // EasyCL::checkError(err);

    size_t input3dSize = inputTensorDesc->C * inputTensorDesc->H * inputTensorDesc->W;
    size_t output3dSize = outputTensorDesc->C * outputTensorDesc->H * outputTensorDesc->W;
    CoclDnnGeometryType batchSize = inputTensorDesc->N;
    cout << "batchSize " << batchSize << " input3dsize " << input3dSize << " output3dsize " << output3dSize << endl;
    for(CoclDnnGeometryType elt = 0; elt < batchSize; elt++) {
        size_t input3dOffset = inputOffset + elt * input3dSize;
        size_t output3dOffset = outputOffset + elt * output3dSize;

        CoclDnnGeometryType nInputPlane = inputTensorDesc->C;
        CoclDnnGeometryType inputHeight = inputTensorDesc->H;
        CoclDnnGeometryType inputWidth = inputTensorDesc->W;
        CoclDnnGeometryType kH = filterDesc->kH;
        CoclDnnGeometryType kW = filterDesc->kW;
        CoclDnnGeometryType padH = convDesc->padH;
        CoclDnnGeometryType padW = convDesc->padW;
        CoclDnnGeometryType dH = convDesc->dH;
        CoclDnnGeometryType dW = convDesc->dW;
        im2col(inputMemory->clmem, input3dOffset,
            nInputPlane, inputHeight, inputWidth, kH, kW, padH, padW, dH, dW,
            outputMemory->clmem, output3dOffset
        );

        CoclDnnGeometryType nOutputPlane = outputTensorDesc->C;
        CoclDnnGeometryType outputHeight = outputTensorDesc->H;
        CoclDnnGeometryType outputWidth = outputTensorDesc->W;

        // M,N,K are dims of matrix A and B
        // (see http://docs.nvidia.com/cuda/clblas/#clblas-lt-t-gt-gemm)
        long m = nOutputPlane; // weight->size[0]; //nOutputPlane
        long n = outputHeight * outputWidth; // columns->size[1];
        long k = nInputPlane * kH * kW; // weight->size[1];

        // Do GEMM (note: this is a bit confusing because gemm assumes column-major matrices)
        StatusCode status = CLBlastSgemm(kColMajor, kYes, kNo,
                                       n, m, k,
                                       1.0f,
                                       workspaceMemory->clmem, columnsOffset, n,
                                       filterMemory->clmem, filterOffset, k,
                                       0.0f,
                                       outputMemory->clmem, output3dOffset, n,
                                       &v->currentContext->default_stream.get()->clqueue->queue, 0);
        if(status != 0) {
            cout << "sgemm status code " << status << endl;
            throw runtime_error("Failed call to blas sgem");
        }
    }

    return 0;
}

// Kernel for fast unfold+copy
// (borrowed from Caffe: https://github.com/BVLC/caffe/blob/master/src/caffe/layers/conv_layer.cu)
string get_im2col_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

kernel void im2col_kernel(const int n, const global float* im_data, int im_offset,
    const int height, const int width, const int ksize_h, const int ksize_w, const int pad_h,
    const int pad_w, const int stride_h, const int stride_w, const int height_col, const int width_col,
    global float* col_data, int col_offset) {
  global const float *data_im = im_data + im_offset;
  global float *data_col = col_data + col_offset;

  CL_KERNEL_LOOP(index, n) {
    int w_out = index % width_col;
    index /= width_col;
    int h_out = index % height_col;
    int channel_in = index / height_col;
    int channel_out = channel_in * ksize_h * ksize_w;
    int h_in = h_out * stride_h - pad_h;
    int w_in = w_out * stride_w - pad_w;
    data_col += (channel_out * height_col + h_out) * width_col + w_out;
    data_im += (channel_in * height + h_in) * width + w_in;
    for (int i = 0; i < ksize_h; ++i) {
      for (int j = 0; j < ksize_w; ++j) {
        int h = h_in + i;
        int w = w_in + j;
        *data_col = (h >= 0 && w >= 0 && h < height && w < width) ?
          data_im[i * width + j] : 0;
        data_col += height_col * width_col;
      }
    }
  }
}
)";
}

string get_col2im_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

kernel void col2im_kernel(const int n, global const float* col_data, int col_offset,
    const int height, const int width, const int channels, const int patch_h, const int patch_w,
    const int pad_h, const int pad_w, const int stride_h, const int stride_w,
    const int height_col, const int width_col,
    global float* im_data, int im_offset) {
  global float *data_im = im_data + im_offset;
  global const float *data_col = col_data + col_offset;

  CL_KERNEL_LOOP(index, n) {
    float val = 0;
    int w = index % width + pad_w;
    int h = (index / width) % height + pad_h;
    int c = index / (width * height);
    // compute the start and end of the output
    int w_col_start = (w < patch_w) ? 0 : (w - patch_w) / stride_w + 1;
    int w_col_end = min(w / stride_w + 1, width_col);
    int h_col_start = (h < patch_h) ? 0 : (h - patch_h) / stride_h + 1;
    int h_col_end = min(h / stride_h + 1, height_col);
    /*
       for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
       for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
    // the col location: [c * width * height + h_out, w_out]
    int c_col = c * patch_h * patch_w + (h - h_col * stride_h) * ksize + (w - w_col * stride_w);
    val += data_col[(c_col * height_col + h_col) * width_col + w_col];
    }
    }
     */
    // equivalent implementation
    int offset = (c * patch_h * patch_w + h * patch_w + w) * height_col * width_col;
    int coeff_h_col = (1 - stride_h * patch_w * height_col) * width_col;
    int coeff_w_col = (1 - stride_w * height_col * width_col);
    for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
      for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
        val += data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
      }
    }
    data_im[index] = val;
  }
}
)";
}

} // namespace gemm_im2col
} // namespace dnn
} // namespace cocl
