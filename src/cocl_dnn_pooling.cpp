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
    cl_int err;

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

    easycl::CLKernel *kernel = getKernelForNameCl("MaxPoolForward", get_MaxPoolForward_sourcecode());

    int inputLinearSize = N * C * inH * inW;

    kernel->in((int)inputLinearSize);

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
}
size_t cudnnPoolingBackward(
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
    bottom_data += (n * channels + c) * height * width;
    for (int h = hstart; h < hend; ++h) {
      for (int w = wstart; w < wend; ++w) {
        if (bottom_data[h * width + w] > maxval) {
          int maxidx = h * width + w;
          maxval = bottom_data[maxidx];
        }
      }
    }
    top_data[index] = maxval;
  }
}
)";
}
