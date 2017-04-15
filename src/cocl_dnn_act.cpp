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
static string get_ReluBackward_sourcecode();

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
    if(propagate != CUDNN_PROPAGATE_NAN) {
        throw runtime_error("Activations only implemented with propagate nan enabled");
    }
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

    string sourceCode = get_ReluForward_sourcecode();
    string actName = "";
    switch(activationDesc->activationType) {
        case CUDNN_ACTIVATION_RELU:
            actName = "RELU";
            break;
        case CUDNN_ACTIVATION_SIGMOID:
            actName = "SIGMOID";
            break;
        case CUDNN_ACTIVATION_TANH:
            actName = "TANH";
            break;
        default:
            throw runtime_error("Activations type not implemented");
    }
    sourceCode = easycl::replaceGlobal(sourceCode, "{ACTIVATION_TYPE}", actName);
    easycl::CLKernel *kernel = getKernelForNameCl(actName + "Forward", sourceCode);

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
    ThreadVars *v = getThreadVars();
    cl_int err;

    Memory *outputMemory = findMemory((const char *)outputData);
    Memory *gradOutputMemory = findMemory((const char *)gradOutputData);
    Memory *inputMemory = findMemory((const char *)inputData);
    Memory *gradInputMemory = findMemory((const char *)gradInputData);

    size_t outputOffset = outputMemory->getOffset((const char *)outputData);
    size_t gradOutputOffset = gradOutputMemory->getOffset((const char *)gradOutputData);
    size_t inputOffset = inputMemory->getOffset((const char *)inputData);
    size_t gradInputOffset = gradInputMemory->getOffset((const char *)gradInputData);

    CoclDnnGeometryType N = inputDesc->N;
    CoclDnnGeometryType C = inputDesc->C;
    CoclDnnGeometryType H = inputDesc->H;
    CoclDnnGeometryType W = inputDesc->W;

    string sourceCode = get_ReluBackward_sourcecode();
    string actName = "";
    switch(activationDesc->activationType) {
        case CUDNN_ACTIVATION_RELU:
            actName = "RELU";
            break;
        case CUDNN_ACTIVATION_SIGMOID:
            actName = "SIGMOID";
            break;
        case CUDNN_ACTIVATION_TANH:
            actName = "TANH";
            break;
        default:
            throw runtime_error("Activations type not implemented");
    }
    sourceCode = easycl::replaceGlobal(sourceCode, "{ACTIVATION_TYPE}", actName);
    easycl::CLKernel *kernel = getKernelForNameCl(actName + "Backward", sourceCode);

    int linearSize = N * C * H * W;

    kernel->in((int)linearSize);

    kernel->inout(&outputMemory->clmem);
    kernel->in((int32_t)(outputOffset / sizeof(float)));

    kernel->inout(&gradOutputMemory->clmem);
    kernel->in((int32_t)(gradOutputOffset / sizeof(float)));

    kernel->inout(&inputMemory->clmem);
    kernel->in((int32_t)(inputOffset / sizeof(float)));

    kernel->inout(&gradInputMemory->clmem);
    kernel->in((int32_t)(gradInputOffset / sizeof(float)));

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(linearSize) * workgroupSize;
    kernel->run_1d(&v->currentContext->default_stream.get()->clqueue->queue, globalSize, workgroupSize);
    // int status = clFinish(v->currentContext->default_stream.get()->clqueue->queue);
    // if(status != 0) {
    //     cout << "status" << status << endl;
    //     throw runtime_error("Pooling returned non-zero status");
    // }
}

string get_ReluForward_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

#define Dtype float
#define {ACTIVATION_TYPE}

kernel void {ACTIVATION_TYPE}Forward(
    const int nthreads,
    global const Dtype* input_data, int input_offset,
    global Dtype* output_data, int output_offset
  ) {

  global const Dtype *input = input_data + input_offset;
  global Dtype *output = output_data + output_offset;

  CL_KERNEL_LOOP(index, nthreads) {
    if(index < nthreads) {
        float inval = input[index];

        #ifdef RELU
        output[index] = inval > 0 ? inval : 0.0f;
        #endif

        #ifdef SIGMOID
        output[index] = 1.0f / (1.0f + exp(- inval) );
        #endif

        #ifdef TANH
        output[index] = tanh(inval);
        #endif
    }
  }
}
)";
}

string get_ReluBackward_sourcecode() {
    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

#define Dtype float
#define {ACTIVATION_TYPE}

kernel void {ACTIVATION_TYPE}Backward(
    const int nthreads,
    global const Dtype* output_data, int output_offset,
    global const Dtype* gradOutput_data, int gradOutput_offset,
    global const Dtype* input_data, int input_offset,
    global Dtype* gradInput_data, int gradInput_offset
  ) {

  global const Dtype *output = output_data + output_offset;
  global const Dtype *gradOutput = gradOutput_data + gradOutput_offset;
  global const Dtype *input = input_data + input_offset;
  global Dtype *gradInput = gradInput_data + gradInput_offset;

  CL_KERNEL_LOOP(index, nthreads) {
    if(index < nthreads) {
        float inval = input[index];

        #ifdef RELU
        gradInput[index] = inval > 0 ? gradOutput[index] : 0.0f;
        #endif

        #ifdef SIGMOID
        float outputval = output[index];
        gradInput[index] = outputval * (1 - outputval);
        #endif

        #ifdef TANH
        float outputval = output[index];
        gradInput[index] = 1 - outputval * outputval;
        #endif
    }
  }
}
)";
}
