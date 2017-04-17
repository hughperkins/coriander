#pragma once

#include "cocl/cocl_dnn.h"

namespace cocl {
namespace dnn {

class ActivationDescriptor {
public:
    CoclDnnLayout activationType;
    CoclDnnLayout propagate;
    float probability;
};

} // namespace dnn
} // namespace Cocl

typedef cocl::dnn::ActivationDescriptor *cudnnActivationDescriptor_t;

extern "C" {
    size_t cudnnCreateActivationDescriptor(cudnnActivationDescriptor_t *p_descr);
    size_t cudnnDestroyActivationDescriptor(cudnnActivationDescriptor_t desc);
    size_t cudnnSetActivationDescriptor(
        cudnnActivationDescriptor_t act, CoclDnnLayout activationType, CoclDnnLayout propagate,
            float probability);
    size_t cudnnActivationForward(
        cudnnHandle_t handle,
        cudnnActivationDescriptor_t activationDesc,
        float *p_alpha,
        cudnnTensorDescriptor_t inputDesc, float *inputData,
        float *p_beta,
        cudnnTensorDescriptor_t outputDesc, float *outputData
    );
    size_t cudnnActivationBackward(
        cudnnHandle_t handle,
        cudnnActivationDescriptor_t activationDesc,
        float *p_alpha,
        cudnnTensorDescriptor_t outputDesc, float *outputData,
        cudnnTensorDescriptor_t gradOutputDesc, float *gradOutputData,
        cudnnTensorDescriptor_t inputDesc, float *inputData,
        float *p_beta,
        cudnnTensorDescriptor_t gradInputDesc, float *gradInputData
    );
}
