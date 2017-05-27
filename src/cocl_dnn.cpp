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

// static string col2ImKernelSource;

namespace cocl {
namespace dnn {

} // namespace dnn
} // namespace cocl

using namespace cocl;
using namespace cocl::dnn;

static string get_SoftmaxForward_sourcecode();

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

const char *cudnnGetErrorString(std::size_t error) {
    throw runtime_error("not impelmented cudnnGetErrorString");
}

size_t cudnnCreate(cudnnHandle_t *p_handle) {
    *p_handle = new Dnn();
    return 0;
}
size_t cudnnDestroy(cudnnHandle_t handle) {
    delete handle;
    return 0;
}

size_t cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t *p_tensor) {
    *p_tensor = new TensorDescriptor();
    return 0;
}
size_t cudnnCreateFilterDescriptor(cudnnFilterDescriptor_t *p_desc) {
    *p_desc = new FilterDescriptor();
    return 0;
}

size_t cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t desc) {
    delete desc;
    return 0;
}
size_t cudnnDestroyFilterDescriptor(cudnnFilterDescriptor_t desc) {
    delete desc;
    return 0;
}

size_t cudnnSetTensor4dDescriptor(
    cudnnTensorDescriptor_t tensor,
    CoclDnnLayout layout,
    CoclDnnLayout datatype,
    CoclDnnGeometryType N, CoclDnnGeometryType C, CoclDnnGeometryType H, CoclDnnGeometryType W) {
    tensor->layout = layout;
    tensor->datatype = datatype;
    tensor->N = N;
    tensor->C = C;
    tensor->H = H;
    tensor->W = W;
    return 0;
}
size_t cudnnSetFilter4dDescriptor(
    cudnnFilterDescriptor_t filter,
    CoclDnnLayout layout,
    CoclDnnLayout dataType,
    CoclDnnGeometryType outC, CoclDnnGeometryType inC, CoclDnnGeometryType kH, CoclDnnGeometryType kW
) {
    filter->layout = layout;
    filter->dataType = dataType;
    filter->outC = outC;
    filter->inC = inC;
    filter->kH = kH;
    filter->kW = kW;
    return 0;
}

size_t cudnnAddTensor(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t xDesc, float *xData,
    float *p_beta,
    cudnnTensorDescriptor_t yDesc, float * yData
) {
    if(*p_beta != 1) {
        throw runtime_error("cudnnAddTensor only implemented for beta == 1");
    }

    // cl_int err;
    ThreadVars *v = getThreadVars();

    Memory *xMemory = findMemory((const char *)xData);
    Memory *yMemory = findMemory((const char *)yData);

    size_t xOffset = xMemory->getOffset((const char *)xData);
    size_t yOffset = yMemory->getOffset((const char *)yData);

    int N = xDesc->N;
    int C = xDesc->C;
    int H = xDesc->H;
    int W = xDesc->W;
    int n = N * C * H * W;
    StatusCode status = CLBlastSaxpy(n, *p_alpha,
                                     xMemory->clmem, xOffset, 1,
                                     yMemory->clmem, yOffset, 1,
                                     &v->currentContext->default_stream.get()->clqueue->queue, 0);
    if(status != 0) {
        cout << "saxpy status code " << status << endl;
        throw runtime_error("Failed call to blas saxpy");
    }
    return 0;
}
size_t cudnnSoftmaxForward(
    cudnnHandle_t handle,
    CoclDnnLayout softmaxMode,
    CoclDnnLayout softmaxChannel,
    float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, float *inputData,
    float *p_beta,
    cudnnTensorDescriptor_t outputDesc, float *outputData
) {
    if(softmaxMode != CUDNN_SOFTMAX_ACCURATE) {
        throw runtime_error("Only softmax mode accurate implemented");
    }
    if(softmaxChannel != CUDNN_SOFTMAX_MODE_CHANNEL) {
        throw runtime_error("Only softmax mode channel implemented");
    }
    if(inputDesc->H != 1) {
        throw runtime_error("input height for softmaxforward only implemented for 1");
    }
    if(inputDesc->W != 1) {
        throw runtime_error("input width for softmaxforward only implemented for 1");
    }

    ThreadVars *v = getThreadVars();
    // cl_int err;

    Memory *inputMemory = findMemory((const char *)inputData);
    Memory *outputMemory = findMemory((const char *)outputData);

    size_t inputOffset = inputMemory->getOffset((const char *)inputData);
    size_t outputOffset = outputMemory->getOffset((const char *)outputData);

    CoclDnnGeometryType N = inputDesc->N;
    CoclDnnGeometryType C = inputDesc->C;

    easycl::CLKernel *kernel = compileOpenCLKernel("SoftmaxForward", get_SoftmaxForward_sourcecode());

    // int linearSize = N * C;

    kernel->in((int)N);

    kernel->inout(&inputMemory->clmem);
    kernel->in((int32_t)(inputOffset / sizeof(float)));

    kernel->in((int)C);

    kernel->inout(&outputMemory->clmem);
    kernel->in((int32_t)(outputOffset / sizeof(float)));

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(N) * workgroupSize;
    kernel->run_1d(&v->currentContext->default_stream.get()->clqueue->queue, globalSize, workgroupSize);
    // int status = clFinish(v->currentContext->default_stream.get()->clqueue->queue);
    // if(status != 0) {
    //     cout << "status" << status << endl;
    //     throw runtime_error("Pooling returned non-zero status");
    // }
    return 0;
}

string get_SoftmaxForward_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

#define Dtype float

// each thread will be one example (provide result over all c values for that example)
kernel void SoftmaxForward(
    const int N,
    global const Dtype* input_data, int input_offset,
    const int C,
    global Dtype* output_data, int output_offset
  ) {

  global const Dtype *input = input_data + input_offset;
  global Dtype *output = output_data + output_offset;

  CL_KERNEL_LOOP(n, N) {
    if(n < N) {
        // float inval = input[index];
        // output[index] = inval > 0 ? inval : 0.0f;

        const global float *inputCube = &input[n * C];
        global float *outputCube = &output[n * C];

        // first get the max
        float maxValue = inputCube[0];
        for(int c = 1; c < C; c++) {
            maxValue = max(maxValue, inputCube[c]);
        }
        // calculate sum, under this max
        float denominator = 0;
        for(int c = 0; c < C; c++) {
            denominator += exp(inputCube[c] - maxValue);
        }
        // now calc the softmaxes:
        for(int c = 0; c < C; c++) {
            outputCube[c] = exp(inputCube[c] - maxValue) / denominator;
        }
    }
  }
}
)";
}
