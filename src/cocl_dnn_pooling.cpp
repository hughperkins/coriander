#include "cocl/cocl_dnn_pooling.h"

#include "cocl/cocl_dnn.h"
#include "cocl/cocl_memory.h"
#include "cocl/hostside_opencl_funcs.h"
#include "cocl/cocl.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include <clblast_c.h>

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

static string get_MaxPoolForward_sourcecode();
static string get_MaxPoolBackward_sourcecode();

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

size_t cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t *p_desc) {
    *p_desc = new PoolingDescriptor();
    return 0;
}
size_t cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t desc) {
    delete desc;
    return 0;
}
size_t cudnnSetPooling2dDescriptor(
    cudnnPoolingDescriptor_t pool,
    CoclDnnLayout type,
    CoclDnnLayout propagate,
    CoclDnnGeometryType kH, CoclDnnGeometryType kW,
    CoclDnnGeometryType padH, CoclDnnGeometryType padW,
    CoclDnnGeometryType dH, CoclDnnGeometryType dW
) {
    if(type != CUDNN_POOLING_MAX) {
        throw runtime_error("Only pooling type CUDNN_POOLING_MAX implemented, for now");
    }
    if(propagate != CUDNN_PROPAGATE_NAN) {
        throw runtime_error("Only pooling propagate CUDNN_PROPAGATE_NAN implemented, for now");
    }

    pool->type = type;
    pool->propagate = propagate;
    pool->kH = kH;
    pool->kW = kW;
    pool->padH = padH;
    pool->padW = padW;
    pool->dH = dH;
    pool->dW = dW;
    return 0;
}
size_t cudnnPoolingForward(
    cudnnHandle_t handle,
    cudnnPoolingDescriptor_t poolDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, float *inputData,
    float *p_beta,
    cudnnTensorDescriptor_t outputDesc, float *outputData
) {
    ThreadVars *v = getThreadVars();

    Memory *inputMemory = findMemory((const char *)inputData);
    Memory *outputMemory = findMemory((const char *)outputData);

    size_t inputOffset = inputMemory->getOffset((const char *)inputData);
    size_t outputOffset = outputMemory->getOffset((const char *)outputData);

    CoclDnnGeometryType N = inputDesc->N;
    CoclDnnGeometryType C = inputDesc->C;

    CoclDnnGeometryType inH = inputDesc->H;
    CoclDnnGeometryType inW = inputDesc->W;

    CoclDnnGeometryType outH = outputDesc->H;
    CoclDnnGeometryType outW = outputDesc->W;

    CoclDnnGeometryType kH = poolDesc->kH;
    CoclDnnGeometryType kW = poolDesc->kW;
    CoclDnnGeometryType padH = poolDesc->padH;
    CoclDnnGeometryType padW = poolDesc->padW;
    CoclDnnGeometryType dH = poolDesc->dH;
    CoclDnnGeometryType dW = poolDesc->dW;

    easycl::CLKernel *kernel = compileOpenCLKernel("MaxPoolForward", get_MaxPoolForward_sourcecode());

    int inputLinearSize = N * C * inH * inW;
    int outputLinearSize = N * C * outH * outW;

    kernel->in((int)outputLinearSize);

    kernel->inout(&inputMemory->clmem);
    kernel->in((int32_t)(inputOffset / sizeof(float)));

    kernel->in((int)N);
    kernel->in((int)C);
    kernel->in((int)inH);
    kernel->in((int)inW);
    kernel->in((int)outH);
    kernel->in((int)outW);
    kernel->in((int)kH);
    kernel->in((int)kW);
    kernel->in((int)dH);
    kernel->in((int)dW);
    kernel->in((int)padH);
    kernel->in((int)padW);

    kernel->inout(&outputMemory->clmem);
    kernel->in((int32_t)(outputOffset / sizeof(float)));

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(inputLinearSize) * workgroupSize;
    kernel->run_1d(&v->currentContext->default_stream.get()->clqueue->queue, globalSize, workgroupSize);
    return 0;
}
size_t cudnnPoolingBackward(
    cudnnHandle_t handle,
    cudnnPoolingDescriptor_t poolDesc, float *p_alpha,
    cudnnTensorDescriptor_t outputDesc, float *outputData,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutputData,
    cudnnTensorDescriptor_t inputDesc, float *inputData,
    float *p_beta,
    cudnnTensorDescriptor_t gradInputDesc, float *gradInputData
) {
    ThreadVars *v = getThreadVars();
    cl_int err;

    // Memory *outputMemory = findMemory((const char *)outputData);
    Memory *gradOutputMemory = findMemory((const char *)gradOutputData);
    Memory *inputMemory = findMemory((const char *)inputData);

    Memory *gradInputMemory = findMemory((const char *)gradInputData);

    // size_t outputOffset = outputMemory->getOffset((const char *)outputData);
    size_t gradOutputOffset = gradOutputMemory->getOffset((const char *)gradOutputData);
    size_t inputOffset = inputMemory->getOffset((const char *)inputData);

    size_t gradInputOffset = gradInputMemory->getOffset((const char *)gradInputData);

    CoclDnnGeometryType N = inputDesc->N;
    CoclDnnGeometryType C = inputDesc->C;

    CoclDnnGeometryType inH = inputDesc->H;
    CoclDnnGeometryType inW = inputDesc->W;

    CoclDnnGeometryType outH = gradOutputDesc->H;
    CoclDnnGeometryType outW = gradOutputDesc->W;

    CoclDnnGeometryType kH = poolDesc->kH;
    CoclDnnGeometryType kW = poolDesc->kW;
    CoclDnnGeometryType padH = poolDesc->padH;
    CoclDnnGeometryType padW = poolDesc->padW;
    CoclDnnGeometryType dH = poolDesc->dH;
    CoclDnnGeometryType dW = poolDesc->dW;

    easycl::CLKernel *kernel = compileOpenCLKernel("MaxPoolBackward", get_MaxPoolBackward_sourcecode());

    int inputLinearSize = N * C * inH * inW;
    int outputLinearSize = N * C * outH * outW;

    // int filterSize = outC * inC * kH * kW;
    cl_float value = 0.0f;
    err = clEnqueueFillBuffer(
        v->currentContext->default_stream.get()->clqueue->queue,
        gradInputMemory->clmem,
        &value, sizeof(float),
        gradInputOffset, inputLinearSize * sizeof(float),
        0, 0, 0);
    easycl::EasyCL::checkError(err);

    kernel->in((int)outputLinearSize);

    // kernel->inout(&outputMemory->clmem);
    // kernel->in((int32_t)(outputOffset / sizeof(float)));

    kernel->inout(&gradOutputMemory->clmem);
    kernel->in((int32_t)(gradOutputOffset / sizeof(float)));

    kernel->inout(&inputMemory->clmem);
    kernel->in((int32_t)(inputOffset / sizeof(float)));

    kernel->in((int)N);
    kernel->in((int)C);
    kernel->in((int)inH);
    kernel->in((int)inW);
    kernel->in((int)outH);
    kernel->in((int)outW);
    kernel->in((int)kH);
    kernel->in((int)kW);
    kernel->in((int)dH);
    kernel->in((int)dW);
    kernel->in((int)padH);
    kernel->in((int)padW);

    kernel->inout(&gradInputMemory->clmem);
    kernel->in((int32_t)(gradInputOffset / sizeof(float)));

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(inputLinearSize) * workgroupSize;
    kernel->run_1d(&v->currentContext->default_stream.get()->clqueue->queue, globalSize, workgroupSize);
    return 0;
}

// adapted from caffe, via torch

// notes on correspondance between caffe and our notation:

// count => total num output elements, ie batchSize * outC * outH * outW
// num => batchSize
// channels => inC
// height => inH
// width => inW
// pooled_height => outH
// pooled_width => outW
// pw => outw
// ph => outh

// bottom_data => input
// top_data => output
// top_mask => indices

// threads are for each output pixel
string get_MaxPoolForward_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

#define Dtype float

kernel void MaxPoolForward(
    const int nthreads,
    global const Dtype* bottom_data_data, int bottom_data_offset,
    const int num, const int channels, const int height,
    const int width, const int pooled_height, const int pooled_width,
    const int kernel_h, const int kernel_w, const int stride_h,
    const int stride_w, const int pad_h, const int pad_w,
    global Dtype* top_data_data, int top_data_offset
  ) {

  global const Dtype *bottom_data = bottom_data_data + bottom_data_offset;
  global Dtype *top_data = top_data_data + top_data_offset;

  CL_KERNEL_LOOP(index, nthreads) {
    if(index < nthreads) {
    int pw = index % pooled_width;
    int ph = (index / pooled_width) % pooled_height;
    int c = (index / pooled_width / pooled_height) % channels;
    int n = index / pooled_width / pooled_height / channels;
    int hstart = ph * stride_h - pad_h;
    int wstart = pw * stride_w - pad_w;
    int hend = min(hstart + kernel_h, height);
    int wend = min(wstart + kernel_w, width);
    hstart = max(hstart, 0);
    wstart = max(wstart, 0);
    Dtype maxval = -FLT_MAX;
    global const float *bottom_data_img = bottom_data + (n * channels + c) * height * width;
    for (int h = hstart; h < hend; ++h) {
      for (int w = wstart; w < wend; ++w) {
        float val = bottom_data_img[h * width + w];
        if (val > maxval) {
          // int maxidx = h * width + w;
          maxval = val;
        }
      }
    }
    top_data[index] = maxval;
  }
  }
}
)";
}

string get_MaxPoolBackward_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

#define Dtype float

kernel void MaxPoolBackward(
    const int nthreads,
    // global const Dtype* output_data, int output_offset,
    global const Dtype* gradOutput_data, int gradOutput_offset,
    global const Dtype* input_data, int input_offset,

    const int num, const int channels, const int height,
    const int width, const int pooled_height, const int pooled_width,
    const int kernel_h, const int kernel_w, const int stride_h,
    const int stride_w, const int pad_h, const int pad_w,

    global Dtype* gradInput_data, int gradInput_offset
  ) {

  // global const Dtype *output = output_data + output_offset;
  global const Dtype *gradOutput = gradOutput_data + gradOutput_offset;
  global const Dtype *input = input_data + input_offset;

  global Dtype *gradInput = gradInput_data + gradInput_offset;

  CL_KERNEL_LOOP(index, nthreads) {
    if(index < nthreads) {
    float gradOutputVal = gradOutput[index];
    int pw = index % pooled_width;
    int ph = (index / pooled_width) % pooled_height;
    int c = (index / pooled_width / pooled_height) % channels;
    int n = index / pooled_width / pooled_height / channels;
    int hstart = ph * stride_h - pad_h;
    int wstart = pw * stride_w - pad_w;
    int hend = min(hstart + kernel_h, height);
    int wend = min(wstart + kernel_w, width);
    hstart = max(hstart, 0);
    wstart = max(wstart, 0);
    Dtype maxval = -FLT_MAX;
    int maxidx = -1;
    global float *input_img = input + (n * channels + c) * height * width;
    for (int h = hstart; h < hend; ++h) {
      for (int w = wstart; w < wend; ++w) {
        float val = input_img[h * width + w];
        if (val > maxval) {
          maxidx = h * width + w;
          maxval = val;
        }
      }
    }
    int inIndex = (n * channels + c) * height * width + maxidx;
    gradInput[inIndex] = gradOutputVal;
    // top_data[index] = maxval;
  }
  }
}
)";
}
