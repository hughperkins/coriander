#include "cocl/cocl_dnn_act.h"

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

using namespace cocl;
using namespace cocl::dnn;

static string get_ReluForward_sourcecode();

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

size_t cudnnCreateActivationDescriptor(cudnnActivationDescriptor_t *p_desc) {
    *p_desc = new ActivationDescriptor();
    return 0;
}
size_t cudnnDestroyActivationDescriptor(cudnnActivationDescriptor_t desc) {
    delete desc;
    return 0;
}
size_t cudnnSetActivationDescriptor(
    cudnnActivationDescriptor_t act, CoclDnnLayout activationType, CoclDnnLayout propagate,
        float probability) {
    act->activationType = activationType;
    act->propagate = propagate;
    act->probability = probability;
    return 0;
}
size_t cudnnActivationForward(
    cudnnHandle_t handle,
    cudnnActivationDescriptor_t activationDesc,
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
    CoclDnnGeometryType H = inputDesc->H;
    CoclDnnGeometryType W = inputDesc->W;

    easycl::CLKernel *kernel = getKernelForNameCl("ReluForward", get_ReluForward_sourcecode());

    int linearSize = N * C * H * W;

    kernel->in((int)linearSize);

    kernel->inout(&inputMemory->clmem);
    kernel->in((int32_t)(inputOffset / sizeof(float)));

    kernel->inout(&outputMemory->clmem);
    kernel->in((int32_t)(outputOffset / sizeof(float)));

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(linearSize) * workgroupSize;
    kernel->run_1d(&v->currentContext->default_stream.get()->clqueue->queue, globalSize, workgroupSize);
    // int status = clFinish(v->currentContext->default_stream.get()->clqueue->queue);
    // if(status != 0) {
    //     cout << "status" << status << endl;
    //     throw runtime_error("Pooling returned non-zero status");
    // }
}
size_t cudnnActivationBackward(
    cudnnHandle_t handle,
    cudnnActivationDescriptor_t activationDesc,
    float *p_alpha,
    cudnnTensorDescriptor_t outputDesc, float *outputData,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutputData,
    cudnnTensorDescriptor_t inputDesc, float *inputData,
    float *p_beta,
    cudnnTensorDescriptor_t gradInputDesc, float *gradInputData
) {
    throw runtime_error("not implemented");
}

string get_ReluForward_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

#define Dtype float

kernel void ReluForward(
    const int nthreads,
    global const Dtype* input_data, int input_offset,
    global Dtype* output_data, int output_offset
  ) {

  global const Dtype *input = input_data + input_offset;
  global Dtype *output = output_data + output_offset;

  CL_KERNEL_LOOP(index, nthreads) {
    if(index < nthreads) {
        float inval = input[index];
        output[index] = inval > 0 ? inval : 0.0f;
    }
  }
}
)";
}
