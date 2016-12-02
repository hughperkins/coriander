#include "cocl/cocl_dnn.h"

#include "cocl/cocl_dnn_gemm.h"

#include <iostream>
#include <string>
#include <stdexcept>
using namespace std;

static string col2ImKernelSource;

namespace cocl {
namespace dnn {

} // namespace dnn
} // namespace cocl

using namespace cocl;
using namespace cocl::dnn;

const char *cudnnGetErrorString(std::size_t error) {
    throw runtime_error("not impelmented cudnnGetErrorString");
}

std::size_t cudnnCreate(cudnnHandle_t *p_handle) {
    *p_handle = new Dnn();
    return 0;
}
std::size_t cudnnDestroy(cudnnHandle_t handle) {
    delete handle;
    return 0;
}

std::size_t cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t *p_tensor) {
    *p_tensor = new TensorDescriptor();
    return 0;
}
std::size_t cudnnCreateActivationDescriptor(cudnnActivationDescriptor_t *p_desc) {
    *p_desc = new ActivationDescriptor();
    return 0;
}
std::size_t cudnnCreateFilterDescriptor(cudnnFilterDescriptor_t *p_desc) {
    *p_desc = new FilterDescriptor();
    return 0;
}
std::size_t cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t *p_desc) {
    *p_desc = new ConvolutionDescriptor();
    return 0;
}
std::size_t cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t *p_desc) {
    *p_desc = new PoolingDescriptor();
    return 0;
}

std::size_t cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyActivationDescriptor(cudnnActivationDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyFilterDescriptor(cudnnFilterDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t desc) {
    delete desc;
    return 0;
}
std::size_t cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t desc) {
    delete desc;
    return 0;
}

std::size_t cudnnSetTensor4dDescriptor(
    cudnnTensorDescriptor_t tensor,
    Layout layout,
    Layout datatype,
    size_t N, size_t C, size_t H, size_t W) {
    tensor->layout = layout;
    tensor->datatype = datatype;
    tensor->N = N;
    tensor->C = C;
    tensor->H = H;
    tensor->W = W;
    return 0;
}
std::size_t cudnnSetPooling2dDescriptor(
    cudnnPoolingDescriptor_t pool,
    Layout type,
    Layout propagate,
    size_t kH, size_t kW,
    size_t padH, size_t padW,
    size_t strideH, size_t strideW
) {
    pool->type = type;
    pool->propagate = propagate;
    pool->kH = kH;
    pool->kW = kW;
    pool->padH = padH;
    pool->padW = padW;
    pool->strideH = strideH;
    pool->strideW = strideW;
    return 0;
}
std::size_t cudnnSetActivationDescriptor(
    cudnnActivationDescriptor_t act, Layout activationType, Layout propagate,
        float probability) {
    act->activationType = activationType;
    act->propagate = propagate;
    act->probability = probability;
    return 0;
}
std::size_t cudnnSetFilter4dDescriptor(
    cudnnFilterDescriptor_t filter,
    Layout layout,
    Layout dataType,
    size_t outC, size_t inC, size_t kH, size_t kW
) {
    filter->layout = layout;
    filter->dataType = dataType;
    filter->outC = outC;
    filter->inC = inC;
    filter->kH = kH;
    filter->kW = kW;
    return 0;
}
// tensorflow uses like:
// status = dynload::cudnnSetConvolutionNdDescriptor(
//     parent_, handle_, convolution_descriptor.ndims(), padding.data(),
//     strides.data(), upscale.data() ...)
std::size_t cudnnSetConvolution2dDescriptor(
    cudnnConvolutionDescriptor_t conv,
    size_t padH, size_t padW, size_t dH, size_t dW, size_t scaleH, size_t scaleW,
    Layout correlationType
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

std::size_t cudnnGetConvolution2dForwardOutputDim(
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    size_t *pN, size_t *pC, size_t *pH, size_t *pW) {
    // conv->inputTensorDesc = srcTensor;
    // conv->filterDesc = filter;
    // conv->N = N;
    // conv->C = C;
    // conv->H = H;
    // conv->W = W;
    *pN = srcTensor->N;
    *pC = srcTensor->C;
    *pH = srcTensor->H; // obviously needs tweaking a bit...
    *pW = srcTensor->W;
    return 0;
}

std::size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    cudnnConvolutionFwdAlgo_t algo,
    std::size_t *p_size_bytes
) {
    cout << "cudnnGetConvolutionForwardWorkspaceSize()" << endl;
    switch() {
        case cudnnConvolutionFwdAlgo_GEMM:
            cocl::dnn::gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize(
                handle, srcTensor, filter, conv, dstTensor, p_size_bytes);
        default:
            throw runtime_error("No implementation algorithm found for algo " + easycl::toString(algo));
    }
    return 0;
}
std::size_t cudnnGetConvolutionBackwardFilterWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnTensorDescriptor_t tensor2Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionBwdFilterAlgo_t algo,
    std::size_t *p_size
) {
    cout << "cudnnGetConvolutionBackwardFilterWorkspaceSize()" << endl;
    *p_size = 0;
    return 0;
}
std::size_t cudnnGetConvolutionBackwardDataWorkspaceSize(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filter,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t tensor2Desc,
    cudnnConvolutionBwdDataAlgo_t algo,
    std::size_t *p_size
) {
    cout << "cudnnGetConvolutionBackwardDataWorkspaceSize()" << endl;
    *p_size = 0;
    return 0;
}

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
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnAddTensor(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t tensorDesc1,
    float *tensor,
    float *p_beta,
    cudnnTensorDescriptor_t tensorDesc2,
    float * tensor2
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnPoolingForward(
    cudnnHandle_t handle,
    cudnnPoolingDescriptor_t poolDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t convDesc,
    float *conv,
    float *p_beta,
    cudnnTensorDescriptor_t poolDesc2,
    float *pool
) {
    throw runtime_error("not implemented");
}
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
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnActivationForward(
    cudnnHandle_t handle,
    cudnnActivationDescriptor_t activationDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1,
    float *p_beta,
    cudnnTensorDescriptor_t tensor2Desc,
    float *tensor2
) {
    throw runtime_error("not implemented");
}
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
) {
    throw runtime_error("not implemented");
}
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
) {
    throw runtime_error("not implemented");
}
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
) {
    throw runtime_error("not implemented");
}
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
) {
    throw runtime_error("not implemented");
}
std::size_t cudnnConvolutionBackwardBias(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t tensor1Desc,
    float *tensor1,
    float *p_beta,
    cudnnTensorDescriptor_t tensor2Desc,
    float *tensor2
) {
    throw runtime_error("not implemented");
}

std::size_t cudnnGetConvolutionForwardAlgorithm(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    Layout algoPreference,
    size_t a,
    cudnnConvolutionFwdAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionFwdAlgo_t_foo;
    return 0;
}
std::size_t cudnnGetConvolutionBackwardDataAlgorithm(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filter,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t tensor2Desc,
    Layout convMode,
    size_t a,
    cudnnConvolutionBwdDataAlgo_t *p_algo
) {
    *p_algo = efwef;
    return 0;
}
std::size_t cudnnGetConvolutionBackwardFilterAlgorithm(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t tensor1Desc,
    cudnnTensorDescriptor_t tensor2Desc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filterDesc,
    Layout filterMode,
    size_t a,
    cudnnConvolutionBwdFilterAlgo_t *p_algo
) {
    *p_algo = cudnnConvolutionBwdAlgo_t_foo;
    return 0;
}

// Kernels for fast unfold+copy
static string im2ColKernelSource = R"(
#define CL_KERNEL_LOOP(i, n)                        \
  for (size_t i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

kernel void im2col_kernel(const size_t n, const global float* im_data, size_t im_offset,
    const size_t height, const size_t width, const size_t ksize_h, const size_t ksize_w, const size_t pad_h,
    const size_t pad_w, const size_t stride_h, const size_t stride_w, const size_t height_col, const size_t width_col,
    global float* col_data, size_t col_offset) {
  global const float *data_im = im_data + im_offset;
  global float *data_col = col_data + col_offset;

  CL_KERNEL_LOOP(index, n) {
    size_t w_out = index % width_col;
    index /= width_col;
    size_t h_out = index % height_col;
    size_t channel_in = index / height_col;
    size_t channel_out = channel_in * ksize_h * ksize_w;
    size_t h_in = h_out * stride_h - pad_h;
    size_t w_in = w_out * stride_w - pad_w;
    data_col += (channel_out * height_col + h_out) * width_col + w_out;
    data_im += (channel_in * height + h_in) * width + w_in;
    for (size_t i = 0; i < ksize_h; ++i) {
      for (size_t j = 0; j < ksize_w; ++j) {
        size_t h = h_in + i;
        size_t w = w_in + j;
        *data_col = (h >= 0 && w >= 0 && h < height && w < width) ?
          data_im[i * width + j] : 0;
        data_col += height_col * width_col;
      }
    }
  }
}
)";

static string col2ImKernelSource = R"(
#define CL_KERNEL_LOOP(i, n)                        \
  for (size_t i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

kernel void col2im_kernel(const size_t n, global const float* col_data, size_t col_offset,
    const size_t height, const size_t width, const size_t channels, const size_t patch_h, const size_t patch_w,
    const size_t pad_h, const size_t pad_w, const size_t stride_h, const size_t stride_w,
    const size_t height_col, const size_t width_col,
    global float* im_data, size_t im_offset) {
  global float *data_im = im_data + im_offset;
  global const float *data_col = col_data + col_offset;

  CL_KERNEL_LOOP(index, n) {
    float val = 0;
    size_t w = index % width + pad_w;
    size_t h = (index / width) % height + pad_h;
    size_t c = index / (width * height);
    // compute the start and end of the output
    size_t w_col_start = (w < patch_w) ? 0 : (w - patch_w) / stride_w + 1;
    size_t w_col_end = min(w / stride_w + 1, width_col);
    size_t h_col_start = (h < patch_h) ? 0 : (h - patch_h) / stride_h + 1;
    size_t h_col_end = min(h / stride_h + 1, height_col);
    /*
       for (size_t h_col = h_col_start; h_col < h_col_end; ++h_col) {
       for (size_t w_col = w_col_start; w_col < w_col_end; ++w_col) {
    // the col location: [c * width * height + h_out, w_out]
    size_t c_col = c * patch_h * patch_w + (h - h_col * stride_h) * ksize + (w - w_col * stride_w);
    val += data_col[(c_col * height_col + h_col) * width_col + w_col];
    }
    }
     */
    // equivalent implementation
    size_t offset = (c * patch_h * patch_w + h * patch_w + w) * height_col * width_col;
    size_t coeff_h_col = (1 - stride_h * patch_w * height_col) * width_col;
    size_t coeff_w_col = (1 - stride_w * height_col * width_col);
    for (size_t h_col = h_col_start; h_col < h_col_end; ++h_col) {
      for (size_t w_col = w_col_start; w_col < w_col_end; ++w_col) {
        val += data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
      }
    }
    data_im[index] = val;
  }
}
)";
