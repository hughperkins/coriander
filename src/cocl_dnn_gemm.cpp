// The GEMM/im2col implementation used here is:
// - adapted from clnn: https://github.com/hughperkins/clnn/blob/master/lib/THCLNN/im2col.cpp), which was
// - ported from cunn: https://github.com/torch/cunn/blob/master/lib/THCUNN/im2col.h), which was
// - adapted from Caffe: https://github.com/BVLC/caffe/blob/master/src/caffe/layers/conv_layer.cu)

// other convolutional implementatinos can be added in the future, but GEMM/im2col gives a solid works-everywhere base
// to start from

#include "cocl/cocl_dnn_gemm.h"

#include "cocl/cocl.h"
#include "cocl/cocl_dnn.h"
#include "cocl/cocl_memory.h"
#include "cocl/hostside_opencl_funcs.h"
// #include "cocl/cocl_blas.h"

#include "fill_buffer.h"

#include <clblast_c.h>

#include <iostream>
using namespace std;

#include "EasyCL/EasyCL.h"

namespace cocl {
namespace dnn {
namespace gemm_im2col {

static string get_im2col_sourcecode();
static string get_col2im_sourcecode();
static string get_convbackbias_sourcecode();

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

void im2col(cl_mem im_buf, size_t im_offset_bytes, const CoclDnnGeometryType channels,
        const CoclDnnGeometryType height,
        const CoclDnnGeometryType width,
        const CoclDnnGeometryType ksize_h,
        const CoclDnnGeometryType ksize_w,
        const CoclDnnGeometryType pad_h,
        const CoclDnnGeometryType pad_w,
        const CoclDnnGeometryType stride_h,
        const CoclDnnGeometryType stride_w,
        cl_mem col_buf, size_t col_offset_bytes,
        cl_command_queue *queue
        ) {
    // We are going to launch channels * height_col * width_col kernels, each
    // kernel responsible for copying a single-channel grid.
    int height_col = (height + 2 * pad_h - ksize_h) / stride_h + 1;
    int width_col = (width + 2 * pad_w - ksize_w) / stride_w + 1;
    int num_kernels = channels * height_col * width_col;

    easycl::CLKernel *kernel = compileOpenCLKernel("im2col_kernel", get_im2col_sourcecode());

    kernel->in((int32_t)num_kernels);
    kernel->inout(&im_buf);
    kernel->in((int32_t)(im_offset_bytes / sizeof(float)));
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
    kernel->in((int32_t)(col_offset_bytes / sizeof(float)));

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(num_kernels) * workgroupSize;
    kernel->run_1d(queue, globalSize, workgroupSize);
}

void col2im(cl_mem col_buf, size_t col_offset_bytes, const int channels,
        const int height, const int width, const int patch_h, const int patch_w, const int pad_h,
        const int pad_w, const int stride_h, const int stride_w,  cl_mem im_buf, size_t im_offset_bytes,
        cl_command_queue *queue) {
    int height_col = (height + 2 * pad_h - patch_h) / stride_h + 1;
    int width_col = (width + 2 * pad_w - patch_w) / stride_w + 1;
    int num_kernels = channels * height * width;
    // To avoid involving atomic operations, we will launch one kernel per
    // bottom dimension, and then in the kernel add up the top dimensions.

    easycl::CLKernel *kernel = compileOpenCLKernel("col2im_kernel", get_col2im_sourcecode());

    kernel->in((int32_t)num_kernels);
    kernel->inout(&col_buf);
    kernel->in((int32_t)(col_offset_bytes / sizeof(float)));
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
    kernel->in((int32_t)(im_offset_bytes / sizeof(float)));

    int workgroupSize = getNumThreads();
    int globalSize = GET_BLOCKS(num_kernels) * workgroupSize;
    kernel->run_1d(queue, globalSize, workgroupSize);
}

size_t cudnnGetConvolutionForwardWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t srcTensor,
    cudnnFilterDescriptor_t filter,
    cudnnConvolutionDescriptor_t conv,
    cudnnTensorDescriptor_t dstTensor,
    CoclDnnSizeType *p_size_bytes
) {
    *p_size_bytes = getColumnsNumElements(handle, srcTensor, filter, conv, dstTensor) * sizeof(float);
    return 0;
}
size_t cudnnConvolutionForward(
    cudnnHandle_t handle,
    const float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, const float *inputData,
    cudnnFilterDescriptor_t filterDesc, const float *filterData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnSizeType workspaceSize,
    const float *p_beta,
    cudnnTensorDescriptor_t outputDesc, float *outputData
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

    // cl_int err;

    // CoclDnnGeometryType columnsNumElements = getColumnsNumElements(
    //     handle, inputDesc, filterDesc, convDesc, outputDesc);
    size_t columnsOffset = workspaceOffset;

    size_t input3dSize = inputDesc->C * inputDesc->H * inputDesc->W;
    size_t output3dSize = outputDesc->C * outputDesc->H * outputDesc->W;
    CoclDnnGeometryType batchSize = inputDesc->N;
    for(CoclDnnGeometryType elt = 0; elt < batchSize; elt++) {
        size_t input3dOffsetBytes = inputOffset + elt * input3dSize * sizeof(float);
        size_t output3dOffsetBytes = outputOffset + elt * output3dSize * sizeof(float);

        CoclDnnGeometryType nInputPlane = inputDesc->C;
        CoclDnnGeometryType inputHeight = inputDesc->H;
        CoclDnnGeometryType inputWidth = inputDesc->W;
        CoclDnnGeometryType kH = filterDesc->kH;
        CoclDnnGeometryType kW = filterDesc->kW;
        CoclDnnGeometryType padH = convDesc->padH;
        CoclDnnGeometryType padW = convDesc->padW;
        CoclDnnGeometryType dH = convDesc->dH;
        CoclDnnGeometryType dW = convDesc->dW;

        // from torch SpatialConvolutionMM.cu:
        // // Extract columns:
        // im2col(
        //   THCState_getCurrentStream(state),
        //   THCudaTensor_data(state, input_n),
        //   nInputPlane, inputHeight, inputWidth, kH, kW, padH, padW, dH, dW,
        //   1, 1, THCudaTensor_data(state, columns)
        // );
        im2col(
            inputMemory->clmem, input3dOffsetBytes,
            nInputPlane, inputHeight, inputWidth, kH, kW, padH, padW, dH, dW,
            workspaceMemory->clmem, columnsOffset,
            &v->currentContext->default_stream.get()->clqueue->queue
        );

        CoclDnnGeometryType nOutputPlane = outputDesc->C;
        CoclDnnGeometryType outputHeight = outputDesc->H;
        CoclDnnGeometryType outputWidth = outputDesc->W;

        // from torch SpatialConvolutionMM.cu:
        // // M,N,K are dims of matrix A and B
        // // (see http://docs.nvidia.com/cuda/cublas/#cublas-lt-t-gt-gemm)
        // long m = nOutputPlane;
        // long n = columns->size[1];
        // long k = nInputPlane*kH*kW;

        // // Do GEMM (note: this is a bit confusing because gemm assumes column-major matrices)
        // THCudaBlas_Sgemm(
        //     state,
        //     'n', 'n',
        //     n, m, k,
        //     1,
        //     THCudaTensor_data(state, columns), n,
        //     THCudaTensor_data(state, weight), k,
        //     1,
        //     THCudaTensor_data(state, output_n), n
        // );

        CoclDnnGeometryType m = nOutputPlane; // weight->size[0]; //nOutputPlane
        CoclDnnGeometryType n = outputHeight * outputWidth; // columns->size[1];
        CoclDnnGeometryType k = nInputPlane * kH * kW; // weight->size[1];
// v->getContext()->getCl()->finish();
// v->currentContext->getCl()->finish();
        // Do GEMM (note: this is a bit confusing because gemm assumes column-major matrices)
        StatusCode status = CLBlastSgemm(kColMajor, kNo, kNo,
                                       n, m, k,
                                       1.0f,
                                       workspaceMemory->clmem, columnsOffset / sizeof(float), n,
                                       filterMemory->clmem, filterOffset / sizeof(float), k,
                                       0.0f,
                                       outputMemory->clmem, output3dOffsetBytes / sizeof(float), n,
                                       &v->currentContext->default_stream.get()->clqueue->queue, 0);
        if(status != 0) {
            cout << "sgemm status code " << status << endl;
            throw runtime_error("Failed call to blas sgem");
        }
    }

    return 0;
}
size_t cudnnGetConvolutionBackwardFilterWorkspaceSize(
    cudnnHandle_t handle,
    cudnnTensorDescriptor_t inputDesc,
    cudnnTensorDescriptor_t outputDesc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnFilterDescriptor_t filterDesc,
    CoclDnnSizeType *p_size_bytes
) {
    // from torch:
    // // Resize temporary columns
    // THClTensor_resize2d(state, columns, nOutputPlane*kW*kH, inputHeight*inputWidth);

    CoclDnnGeometryType outC = outputDesc->C;

    CoclDnnGeometryType kH = filterDesc->kH;
    CoclDnnGeometryType kW = filterDesc->kW;

    CoclDnnGeometryType inH = inputDesc->H;
    CoclDnnGeometryType inW = inputDesc->W;

    int rows = outC * kW * kH;
    int cols = inH * inW;
    *p_size_bytes = rows * cols * sizeof(float);
    return 0;
}
size_t cudnnGetConvolutionBackwardDataWorkspaceSize(
    cudnnHandle_t handle,
    cudnnFilterDescriptor_t filterDesc,
    cudnnTensorDescriptor_t gradOutputDesc,
    cudnnConvolutionDescriptor_t convDesc,
    cudnnTensorDescriptor_t gradInputDesc,
    CoclDnnSizeType *p_size_bytes
) {
    // from torch cunn SpatialConvolutionMM.cu:
    // THCudaTensor_resize2d(state, gradColumns, nInputPlane*kW*kH, outputHeight*outputWidth);

    CoclDnnGeometryType inC = gradInputDesc->C;

    CoclDnnGeometryType outH = gradOutputDesc->H;
    CoclDnnGeometryType outW = gradOutputDesc->W;

    CoclDnnGeometryType kH = filterDesc->kH;
    CoclDnnGeometryType kW = filterDesc->kW;

    CoclDnnGeometryType rows = inC * kW * kH;
    CoclDnnGeometryType cols = outH * outW;

    *p_size_bytes = rows * cols * sizeof(float);
    return 0;
}
size_t cudnnConvolutionBackwardData(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnFilterDescriptor_t filterDesc, const float *filterData,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutputData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnGeometryType workspaceSize,
    float *p_beta,
    cudnnTensorDescriptor_t gradInputDesc, float *gradInputData
)  {
    if(*p_alpha != 1) {
        throw runtime_error("cudnnConvolutionBackwardData only implemented for alpha == 1");
    }
    if(*p_beta != 0) {
        throw runtime_error("cudnnConvolutionBackwardData only implemented for beta == 0");
    }
    ThreadVars *v = getThreadVars();

    Memory *gradOutputMemory = findMemory((const char *)gradOutputData);
    Memory *filterMemory = findMemory((const char *)filterData);
    Memory *gradInputMemory = findMemory((const char *)gradInputData);
    Memory *workspaceMemory = findMemory((const char *)workspaceData);

    size_t gradOutputOffset = gradOutputMemory->getOffset((const char *)gradOutputData);
    size_t filterOffset = filterMemory->getOffset((const char *)filterData);
    size_t gradInputOffset = gradInputMemory->getOffset((const char *)gradInputData);
    size_t workspaceOffset = workspaceMemory->getOffset((const char *)workspaceData);

    // cl_int err;

    CoclDnnGeometryType inC = gradInputDesc->C;
    CoclDnnGeometryType inH = gradInputDesc->H;
    CoclDnnGeometryType inW = gradInputDesc->W;

    CoclDnnGeometryType outC = gradOutputDesc->C;
    CoclDnnGeometryType outH = gradOutputDesc->H;
    CoclDnnGeometryType outW = gradOutputDesc->W;

    CoclDnnGeometryType kH = filterDesc->kH;
    CoclDnnGeometryType kW = filterDesc->kW;

    CoclDnnGeometryType padH = convDesc->padH;
    CoclDnnGeometryType padW = convDesc->padW;

    CoclDnnGeometryType dH = convDesc->dH;
    CoclDnnGeometryType dW = convDesc->dW;

    // from torch cunn SpatialConvolutionMM.cu:
    // THCudaTensor_resize2d(state, gradColumns, nInputPlane*kW*kH, outputHeight*outputWidth);
    // CoclDnnGeometryType columnsRows = inC * kW * kH;
    // CoclDnnGeometryType columnsCols = outH * outW;
    // CoclDnnGeometryType columnsNumElements = columnsRows * columnsCols;
    size_t columnsOffset = workspaceOffset;

    size_t input3dSize = inC * inH * inW;
    size_t output3dSize = outC * outH * outW;
    CoclDnnGeometryType batchSize = gradOutputDesc->N;
    for(CoclDnnGeometryType elt = 0; elt < batchSize; elt++) {
        size_t gradInput3dOffsetBytes = gradInputOffset + elt * input3dSize * sizeof(float);
        size_t gradOutput3dOffsetBytes = gradOutputOffset + elt * output3dSize * sizeof(float);

        // from torch cunn SpatialConvolutionMM.cu:
        // // M,N,K are dims of matrix A and B
        // // (see http://docs.nvidia.com/cuda/cublas/#cublas-lt-t-gt-gemm)
        // long m = nInputPlane*kW*kH;
        // long n = gradColumns->size[1];
        // long k = nOutputPlane;

        // // Do GEMM (note: this is a bit confusing because gemm assumes column-major matrices)
        // THCudaBlas_Sgemm(
        //     state,
        //     'n', 't',
        //     n, m, k,
        //     1,
        //     THCudaTensor_data(state, gradOutput_n), n,
        //     THCudaTensor_data(state, weight), m,
        //     0,
        //     THCudaTensor_data(state, gradColumns), n
        // );

        CoclDnnGeometryType m = inC * kH * kW; // nInputPlane*kW*kH;
        CoclDnnGeometryType n = outH * outW; // columns->size[1] = outputHeight*outputWidth;
        CoclDnnGeometryType k = outC; // nOutputPlane;

        StatusCode status = CLBlastSgemm(kColMajor, kNo, kYes,
                                       n, m, k,
                                       1.0f,
                                       gradOutputMemory->clmem, gradOutput3dOffsetBytes / sizeof(float), n,
                                       filterMemory->clmem, filterOffset / sizeof(float), m,
                                       0.0f,
                                       workspaceMemory->clmem, columnsOffset / sizeof(float), n,
                                       &v->currentContext->default_stream.get()->clqueue->queue, 0);
        if(status != 0) {
            cout << "sgemm status code " << status << endl;
            throw runtime_error("Failed call to blas sgem");
        }

        // from torch cunn SpatialConvolutionMM.cu:
        // // Unpack columns back into input:
        // col2im(
        //   THCState_getCurrentStream(state),
        //   THCudaTensor_data(state, gradColumns),
        //   nInputPlane, inputHeight, inputWidth, kH, kW, padH, padW, dH, dW,
        //   1, 1, THCudaTensor_data(state, gradInput_n)
        // );
        col2im(
            workspaceMemory->clmem, columnsOffset,
            inC, inH, inW, kH, kW, padH, padW, dH, dW,
            gradInputMemory->clmem, gradInput3dOffsetBytes,
            &v->currentContext->default_stream.get()->clqueue->queue
        );
    }
    // v->getContext()->getCl()->finish();
    return 0;
}
size_t cudnnConvolutionBackwardFilter(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t inputDesc, const float *inputData,
    cudnnTensorDescriptor_t gradOutputDesc, float *gradOutputData,
    cudnnConvolutionDescriptor_t convDesc,
    void *workspaceData, CoclDnnGeometryType workspaceSize,
    float *p_beta,
    cudnnFilterDescriptor_t filterDesc, float *gradFilterData
)  {
    if(*p_alpha != 1) {
        throw runtime_error("cudnnConvolutionBackwardData only implemented for alpha == 1");
    }
    if(*p_beta != 0) {
        throw runtime_error("cudnnConvolutionBackwardData only implemented for beta == 0");
    }
    ThreadVars *v = getThreadVars();

    Memory *inputMemory = findMemory((const char *)inputData);
    Memory *gradOutputMemory = findMemory((const char *)gradOutputData);
    Memory *gradFilterMemory = findMemory((const char *)gradFilterData);
    Memory *workspaceMemory = findMemory((const char *)workspaceData);

    size_t inputOffset = inputMemory->getOffset((const char *)inputData);
    size_t gradOutputOffset = gradOutputMemory->getOffset((const char *)gradOutputData);
    size_t gradFilterOffset = gradFilterMemory->getOffset((const char *)gradFilterData);
    size_t workspaceOffset = workspaceMemory->getOffset((const char *)workspaceData);

    // cl_int err;

    CoclDnnGeometryType inC = inputDesc->C;
    CoclDnnGeometryType inH = inputDesc->H;
    CoclDnnGeometryType inW = inputDesc->W;

    CoclDnnGeometryType outC = gradOutputDesc->C;
    CoclDnnGeometryType outH = gradOutputDesc->H;
    CoclDnnGeometryType outW = gradOutputDesc->W;

    CoclDnnGeometryType kH = filterDesc->kH;
    CoclDnnGeometryType kW = filterDesc->kW;

    CoclDnnGeometryType padH = convDesc->padH;
    CoclDnnGeometryType padW = convDesc->padW;
    CoclDnnGeometryType dH = convDesc->dH;
    CoclDnnGeometryType dW = convDesc->dW;

    // CoclDnnGeometryType columnsNumElements = getColumnsNumElements(
    //     handle, inputDesc, filterDesc, convDesc, gradOutputDesc);
    size_t columnsOffset = workspaceOffset;

    // from torch cunn SpatialConvolutionMM.cu:
    // THCudaTensor_resize2d(state, columns, nInputPlane*kW*kH, outputHeight*outputWidth);

    size_t input3dSize = inC * inH * inW;
    size_t output3dSize = outC * outH * outW;
    CoclDnnGeometryType batchSize = gradOutputDesc->N;

    int filterSize = outC * inC * kH * kW;
    // cl_float value = 0.0f;
    // err = clEnqueueFillBuffer(
    //     v->currentContext->default_stream.get()->clqueue->queue,
    //     gradFilterMemory->clmem,
    //     &value, sizeof(float),
    //     gradFilterOffset, filterSize * sizeof(float),
    //     0, 0, 0);
    myEnqueueFillBuffer(v->currentContext->default_stream.get()->clqueue->queue, gradFilterMemory->clmem, 0.0f, gradFilterOffset / sizeof(float), filterSize);
    // easycl::EasyCL::checkError(err);
    // easycl::EasyCL::checkError(clFinish(v->currentContext->default_stream.get()->clqueue->queue));
    // v->getContext()->getCl()->finish();
    for(CoclDnnGeometryType elt = 0; elt < batchSize; elt++) {
        size_t input3dOffsetBytes = inputOffset + elt * input3dSize * sizeof(float);
        size_t gradOutput3dOffsetBytes = gradOutputOffset + elt * output3dSize * sizeof(float);

        // from torch cunn SpatialConvolutionMM.cu:
        // // Extract columns:
        // im2col(
        //   THCState_getCurrentStream(state),
        //   THCudaTensor_data(state, input_n),
        //   nInputPlane, inputHeight, inputWidth, kH, kW, padH, padW, dH, dW,
        //   1, 1, THCudaTensor_data(state, columns)
        // );
        im2col(
            inputMemory->clmem, input3dOffsetBytes,
            inC, inH, inW, kH, kW, padH, padW, dH, dW,
            workspaceMemory->clmem, columnsOffset,
            &v->currentContext->default_stream.get()->clqueue->queue
        );
        // v->getContext()->getCl()->finish();

        // from torch cunn SpatialConvolutionMM.cu:
        // // M,N,K are dims of matrix A and B
        // // (see http://docs.nvidia.com/cuda/cublas/#cublas-lt-t-gt-gemm)
        // long m = nOutputPlane;
        // long n = nInputPlane*kW*kH;
        // long k = columns->size[1];

        // // Do GEMM (note: this is a bit confusing because gemm assumes column-major matrices)
        // THCudaBlas_Sgemm(
        //     state,
        //     't', 'n',
        //     n, m, k,
        //     scale,
        //     THCudaTensor_data(state, columns), k,
        //     THCudaTensor_data(state, gradOutput_n), k,
        //     1,
        //     THCudaTensor_data(state, gradWeight), n
        // );

        CoclDnnGeometryType m = outC;   // nOutputPlane;
        CoclDnnGeometryType n = inC * kW * kH;   // nInputPlane*kW*kH;
        CoclDnnGeometryType k = outH * outW;   // columns->size[1] = outputHeight*outputWidth
        // v->getContext()->getCl()->finish();
        StatusCode status = CLBlastSgemm(kColMajor,
                                       kYes, kNo,
                                       n, m, k,
                                       1.0f,
                                       workspaceMemory->clmem, columnsOffset / sizeof(float), k,
                                       gradOutputMemory->clmem, gradOutput3dOffsetBytes / sizeof(float), k,
                                       1.0f,
                                       gradFilterMemory->clmem, gradFilterOffset / sizeof(float), n,
                                       &v->currentContext->default_stream.get()->clqueue->queue, 0);
        if(status != 0) {
            cout << "sgemm status code " << status << endl;
            throw runtime_error("Failed call to blas sgem");
        }
        // v->getContext()->getCl()->finish();
    }
    return 0;
}
size_t cudnnConvolutionBackwardBias(
    cudnnHandle_t handle,
    float *p_alpha,
    cudnnTensorDescriptor_t gradOutputDesc, const float *gradOutputData,
    float *p_beta,
    cudnnTensorDescriptor_t gradBiasDesc, float *gradBiasData
) {
    // this is actually challenging, since we seem to have no workspace???
    // some ideas:
    // - just do some stupid slow kernel for now
    // - use some third-party library (but it needs alloc presumably?)
    // - create our own workspace... (but... threading? etc ...)
    // - maybe there is some way of getting some workspace?
    // I might just go with some slow stupid kernel for now...

    ThreadVars *v = getThreadVars();

    Memory *gradOutputMemory = findMemory((const char *)gradOutputData);
    Memory *gradBiasMemory = findMemory((const char *)gradBiasData);

    size_t gradOutputOffset = gradOutputMemory->getOffset((const char *)gradOutputData);
    size_t gradBiasOffset = gradBiasMemory->getOffset((const char *)gradBiasData);

    CoclDnnGeometryType batchSize = gradOutputDesc->N;
    CoclDnnGeometryType outC = gradOutputDesc->C;
    CoclDnnGeometryType outH = gradOutputDesc->H;
    CoclDnnGeometryType outW = gradOutputDesc->W;

    size_t output3dSize = outC * outH * outW;

    // cl_int err;

    int biasSize = outC;
    // cl_float value = 0.0f;
    // err = clEnqueueFillBuffer(
    //     v->currentContext->default_stream.get()->clqueue->queue,
    //     gradBiasMemory->clmem,
    //     &value, sizeof(float),
    //     gradBiasOffset, biasSize * sizeof(float),
    //     0, 0, 0);
    myEnqueueFillBuffer(v->currentContext->default_stream.get()->clqueue->queue, gradBiasMemory->clmem, 0.0f, gradBiasOffset / sizeof(float), biasSize);

    // easycl::EasyCL::checkError(err);
    // easycl::EasyCL::checkError(clFinish(v->currentContext->default_stream.get()->clqueue->queue));

    easycl::CLKernel *kernel = compileOpenCLKernel("convbackbias", get_convbackbias_sourcecode());
    for(int elt=0; elt < batchSize; elt++) {
        int gradOutputCubeOffset = gradOutputOffset + elt * output3dSize * sizeof(float);

        kernel->inout(&gradOutputMemory->clmem);
        kernel->in((int32_t)(gradOutputCubeOffset / sizeof(float)));

        // kernel->in((int32_t)elt);
        kernel->in((int32_t)outC);
        kernel->in((int32_t)(outH * outW));
        kernel->inout(&gradBiasMemory->clmem);
        kernel->in((int32_t)(gradBiasOffset / sizeof(float)));

        int workgroupSize = getNumThreads();
        int globalSize = GET_BLOCKS(outC) * workgroupSize;
        kernel->run_1d(&v->currentContext->default_stream.get()->clqueue->queue, globalSize, workgroupSize);
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
  global const float *data_col = col_data + col_offset;
  global float *data_im = im_data + im_offset;

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

string get_convbackbias_sourcecode() {
    // assumes NCHW layout
    // and we'll do one image at a time, since that cant be any slower than the actual convolve bit
    // (can it?)
    // so, inputs:
    // - one single cube of gradOutput, ie for specific n
    // - outC
    // - outH * outW
    // bias zerod appropriately, and we just add to it

    return R"(
// CL: grid stride looping
#define CL_KERNEL_LOOP(i, n)                        \
  for (int i = get_group_id(0) * get_local_size(0) + get_local_id(0); \
      i < (n);                                       \
      i += get_local_size(0) * get_num_groups(0))

kernel void convbackbias(
        const global float *gradOutput_data, const int gradOutput_offset,
        const int outC, const int outHW,
        global float *gradBias_data, int gradBias_offset) {
    const global float *gradOutput = gradOutput_data + gradOutput_offset;
    global float *gradBias = gradBias_data + gradBias_offset;
  CL_KERNEL_LOOP(outc, outC) {
    if(outc < outC) {
        float oldBias = gradBias[outc];
        float bias = 0.0f;
        int imageOffset = outc * outHW;
        global const float *image = gradOutput + imageOffset;
        for(int outhw = 0; outhw < outHW; outhw++) {
            bias += image[outhw];
        }
        gradBias[outc] = oldBias + bias;
    }
  }
}
)";
}

} // namespace gemm_im2col
} // namespace dnn
} // namespace cocl
