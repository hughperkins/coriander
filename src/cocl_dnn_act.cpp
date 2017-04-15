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
    throw runtime_error("not implemented");
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
