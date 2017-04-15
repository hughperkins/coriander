#pragma once

#include "cocl/cocl_dnn.h"

#include <cstddef>
#include <cstdint>

namespace cocl {
namespace dnn {

class PoolingDescriptor {
public:
    CoclDnnLayout type;
    CoclDnnLayout propagate;
    CoclDnnGeometryType kH;
    CoclDnnGeometryType kW;
    CoclDnnGeometryType padH;
    CoclDnnGeometryType padW;
    CoclDnnGeometryType dH;
    CoclDnnGeometryType dW;
};

} // namespace dnn
} // namespace Cocl

typedef cocl::dnn::PoolingDescriptor *cudnnPoolingDescriptor_t;

extern "C" {
    size_t cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t *p_desc);
    size_t cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t desc);
    size_t cudnnSetPooling2dDescriptor(
        cudnnPoolingDescriptor_t pool,
        CoclDnnLayout type,
        CoclDnnLayout propagate,
        CoclDnnGeometryType kH, CoclDnnGeometryType kW,
        CoclDnnGeometryType padH, CoclDnnGeometryType padW,
        CoclDnnGeometryType dH, CoclDnnGeometryType dW
    );
    size_t cudnnPoolingForward(
        cudnnHandle_t handle,
        cudnnPoolingDescriptor_t poolDesc,
        float *p_alpha,
        cudnnTensorDescriptor_t inputDesc, float *inputData,
        float *p_beta,
        cudnnTensorDescriptor_t outputDesc, float *outputData
    );
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
    );
}
