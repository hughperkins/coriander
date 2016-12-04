// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "cocl/cocl_dnn.h"
#include "cocl_dnn_gemm.h"

#include "cocl/cocl.h"
#include "EasyCL/EasyCL.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include <iostream>
#include <memory>
#include <sstream>

#include "gtest/gtest.h"

using namespace std;
using namespace cocl;
using namespace easycl;

namespace {

typedef std::mt19937 MT19937;

void im2col_cpu(float *imageStack, int C, int inH, int inW, int kH, int kW, int padH, int padW, int dH, int dW, float *col) {
    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;
    int colRows = C * kH * kW;
    int colCols = outH * outW;
    // zero first
    int colLinearSize = colRows * colCols;
    for(int i = 0; i < colLinearSize; i++) {
        col[i] = 0.0f;
    }
    for(int outh=0; outh < outH; outh++) {
        for(int outw=0; outw < outW; outw++) {
            for(int c=0; c < C; c++) {
                for(int kh=0; kh < kH; kh++) {
                    int inh = outh + kh - padH;
                    for(int kw=0; kw < kW; kw++) {
                        int inw = outw + kw - padW;
                        if(inh >= 0 && inh < inH && inw >= 0 && inw < inW) {
                            float val = imageStack[c*inH*inW + inh * inW + inw];
                            col[(c * kH * kW + kh * kW + kw) * colCols +
                                outh * outW + outw] = val;
                        }
                    }
                }
            }
        }
    }
}

void fillRandomUniform(MT19937 &random, float *target, int size, float minVal, float maxVal) {
    for(int i = 0; i < size; i++) {
        target[i] = random() / (float)random.max();
    }
}

void fillRandomInt(MT19937 &random, int *target, int size, int minValInclusive, int maxValExclusive) {
    for(int i = 0; i < size; i++) {
        target[i] = random() % (maxValExclusive - 1 - minValInclusive) + minValInclusive;
    }
}

TEST(test_dnn, simple_cpu_im2col) {
    int C = 3;
    int inH = 5;
    int inW = 5;
    int kH = 3;
    int kW = 3;
    int padH = 1;
    int padW = 1;
    int dH = 1;
    int dW = 1;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    float *inImageStack = new float[C * inH * inW];
    int colRows = C * kH * kW;
    int colCols = outH * outW;
    float *outCol = new float[colRows * colCols];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImageStack, C * inH * inW, 0.0f, 1.0f);
    im2col_cpu(inImageStack, C, inH, inW, kH, kW, padH, padW, dH, dW, outCol);

    cout << "input image stack:" << endl;
    for(int c=0; c < C; c++) {
        cout << "C=" << c << endl;
        for(int inh=0; inh < inH; inh++) {
            ostringstream oss;
            for(int inw=0; inw < inW; inw++) {
                oss << inImageStack[c * inH * inW + inh * inW + inw] << " ";
            }
            cout << oss.str() << endl;
        }
        cout << endl;
    }
    cout << endl;

    im2col_cpu(inImageStack, C, inH, inW, kH, kW, padH, padW, dH, dW, outCol);

    cout << "output cols" << endl;
    for(int colRow = 0; colRow < colRows; colRow++) {
        ostringstream oss;
        for(int colCol=0; colCol < colCols; colCol++) {
            oss << outCol[colRow * colCols + colCol] << " ";
        }
        cout << oss.str() << endl;
    }

    delete[] outCol;
    delete[] inImageStack;
}

TEST(test_dnn, simple_gpu_im2col) {
    int C = 3;
    int inH = 5;
    int inW = 5;
    int kH = 3;
    int kW = 3;
    int padH = 1;
    int padW = 1;
    int dH = 1;
    int dW = 1;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    float *inImageStack = new float[C * inH * inW];
    int colRows = C * kH * kW;
    int colCols = outH * outW;
    float *outCol = new float[colRows * colCols];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImageStack, C * inH * inW, 0.0f, 1.0f);
    im2col_cpu(inImageStack, C, inH, inW, kH, kW, padH, padW, dH, dW, outCol);

    cout << "input image stack:" << endl;
    for(int c=0; c < C; c++) {
        cout << "C=" << c << endl;
        for(int inh=0; inh < inH; inh++) {
            ostringstream oss;
            for(int inw=0; inw < inW; inw++) {
                oss << inImageStack[c * inH * inW + inh * inW + inw] << " ";
            }
            cout << oss.str() << endl;
        }
        cout << endl;
    }
    cout << endl;

    im2col_cpu(inImageStack, C, inH, inW, kH, kW, padH, padW, dH, dW, outCol);

    cout << "output cols" << endl;
    for(int colRow = 0; colRow < colRows; colRow++) {
        ostringstream oss;
        for(int colCol=0; colCol < colCols; colCol++) {
            oss << outCol[colRow * colCols + colCol] << " ";
        }
        cout << oss.str() << endl;
    }

    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();

    int imagesSizeFloats = C * inH * inW;
    int colSizeFloats = colCols * colRows;
    size_t imagesOffsetBytes = 0;
    size_t colOffsetBytes = imagesSizeFloats * sizeof(float);
    Memory *gpuMemory = Memory::newDeviceAlloc((imagesSizeFloats + colSizeFloats) * sizeof(float));

    cl_int err;

    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, imagesOffsetBytes,
                                     (imagesSizeFloats) * sizeof(float), inImageStack, 0, NULL, NULL);
    EasyCL::checkError(err);

    cocl::dnn::gemm_im2col::im2col(
        gpuMemory->clmem, imagesOffsetBytes,
        C, inH, inW, kH, kW, padH, padW, dH, dW,
        gpuMemory->clmem, colOffsetBytes
    );

    float *gpuColHostside = new float[colSizeFloats];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, colOffsetBytes,
                                     colSizeFloats * sizeof(float), gpuColHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    cl->finish();

    cout << "gpu output cols" << endl;
    for(int colRow = 0; colRow < colRows; colRow++) {
        ostringstream oss;
        for(int colCol=0; colCol < colCols; colCol++) {
            oss << gpuColHostside[colRow * colCols + colCol] << " ";
        }
        cout << oss.str() << endl;
    }

    for(int colRow = 0; colRow < colRows; colRow++) {
        ostringstream oss;
        for(int colCol=0; colCol < colCols; colCol++) {
            int linearPos = colRow * colCols + colCol;
            if(abs(outCol[linearPos] - gpuColHostside[linearPos]) > 1e-4) {
                throw runtime_error("disparity, im2col, row " + easycl::toString(colRow) + " col " + easycl::toString(colCol));
            }
        }
    }
    delete gpuMemory;
    delete [] gpuColHostside;

    // now run the other way, to test col2im...
    Memory *gpuMemory2 = Memory::newDeviceAlloc((imagesSizeFloats + colSizeFloats) * sizeof(float));
    colOffsetBytes = 0;
    imagesOffsetBytes = colSizeFloats * sizeof(float);

    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory2->clmem, CL_TRUE, colOffsetBytes,
                                     colSizeFloats * sizeof(float), outCol, 0, NULL, NULL);
    EasyCL::checkError(err);

    cocl::dnn::gemm_im2col::col2im(
        gpuMemory2->clmem, colOffsetBytes,
        C, inH, inW, kH, kW, padH, padW, dH, dW,
        gpuMemory2->clmem, imagesOffsetBytes
    );

    float *gpuImHostside = new float[imagesSizeFloats];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory2->clmem, CL_TRUE, imagesOffsetBytes,
                                     imagesSizeFloats * sizeof(float), gpuImHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    cl->finish();

    cout << "gpu image stack, after col2im:" << endl;
    for(int c=0; c < C; c++) {
        cout << "C=" << c << endl;
        for(int inh=0; inh < inH; inh++) {
            ostringstream oss;
            for(int inw=0; inw < inW; inw++) {
                int linearPos = c * inH * inW + inh * inW + inw;
                oss << gpuImHostside[linearPos] << " ";
            }
            cout << oss.str() << endl;
        }
        cout << endl;
    }
    cout << endl;

    cout << "check gpu image vs col2im:" << endl;
    for(int c=0; c < C; c++) {
        for(int inh=0; inh < inH; inh++) {
            for(int inw=0; inw < inW; inw++) {
                int linearPos = c * inH * inW + inh * inW + inw;
                if(abs(inImageStack[linearPos] - gpuImHostside[linearPos] > 1e-4)) {
                    cout << "image val " << inImageStack[linearPos] << " after col2im " << gpuImHostside[linearPos] << endl;
                    throw runtime_error("disparity after col2im, c=" + toString(c) + " inh=" + toString(inh) + " inw=" + toString(inw));
                }
            }
        }
    }

    delete gpuMemory2;
    delete [] gpuImHostside;

    delete[] outCol;
    delete[] inImageStack;
}

void conv_forward_cpu(
    float *input, float *filters, int N, int inC, int outC,
    int inH, int inW, int kH, int kW, int padH, int padW, int dH, int dW,
    float *output) {

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    // zero everything first, for simplicity (dont care about speed here, just correctness)
    int outputLinearSize = N * outC * outH * outW;
    for(int i = 0; i < outputLinearSize; i++) {
        output[i] = 0.0f;
    }
    for(int n = 0; n < N; n++) {
        for(int outc=0; outc < outC; outc++) {
            for(int outh = 0; outh < outH; outh++) {
                for(int outw = 0; outw < outW; outw++) {
                    float sum = 0;
                    for(int kh=0; kh < kH; kh++) {
                        for(int kw=0; kw < kW; kw++) {
                            for(int inc=0; inc < inC; inc++) {
                                int inh = outh * dH + kh - padH;
                                int inw = outw * dW + kw - padW;
                                if(inh >= 0 && inw >= 0 && inh < inH && inw < inW) {
                                    int inputLinearPos =
                                        n *inC * inH * inW +
                                        inc * inH * inW +
                                        inh * inW +
                                        inw;
                                    int filterLinearPos =
                                        outc * inC * kH * kW +
                                        inc * kH * kW +
                                        kh * kW +
                                        kw;
                                    float v = input[inputLinearPos] * filters[filterLinearPos];
                                    sum += v;
                                }
                            }
                        }
                    }
                    int outputLinearPos =
                        n * outC * outH * outW +
                        outc * outH * outW +
                        outh * outW +
                        outw;
                    output[outputLinearPos] = sum;
                }
            }
        }
    }
}

TEST(test_dnn, simple_cpu_conv) {
    int N = 4;
    int inC = 3;
    int outC = 5;
    int inH = 5;
    int inW = 6;
    int kH = 3;
    int kW = 3;
    int padH = 1;
    int padW = 1;
    int dH = 1;
    int dW = 1;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    int inLinearSize = N * inC * inH * inW;
    int outLinearSize = N * outC * outH * outW;
    float *inImages = new float[inLinearSize];
    float *filters = new float[inC * outC * kH * kW]; // lets say this is [outC][inC][kH][kW]
    float *outImages = new float[outLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImages, N * inC * inH * inW, 0.0f, 1.0f);
    fillRandomUniform(random, filters, inC * outC * kH * kW, 0.0f, 1.0f);

    conv_forward_cpu(inImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, outImages);
    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, outLinearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / inC / inH / inW;
        int rem = linearPos - n * inC * inH * inW;
        int c = rem / inH / inW;
        rem = rem - c * inH * inW;
        int inh = rem / inW;
        int inw = rem % inW;
        cout << "n=" << n << " c=" << c << " inh=" << inh << " inw=" << inw << " outImages[" << linearPos << "]=" << outImages[linearPos] << endl;
    }

    delete[] outImages;
    delete[] filters;
    delete[] inImages;
}

TEST(test_dnn, simple_gpu_conv) {
    int N = 4;
    int inC = 3;
    int outC = 5;
    int inH = 5;
    int inW = 6;
    int kH = 3;
    int kW = 3;
    int padH = 1;
    int padW = 1;
    int dH = 1;
    int dW = 1;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    int inLinearSize = N * inC * inH * inW;
    int filterLinearSize = inC * outC * kH * kW;
    int outLinearSize = N * outC * outH * outW;

    float *inImages = new float[inLinearSize];
    float *filters = new float[filterLinearSize]; // lets say this is [outC][inC][kH][kW]
    float *outImages = new float[outLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImages, N * inC * inH * inW, 0.0f, 1.0f);
    fillRandomUniform(random, filters, inC * outC * kH * kW, 0.0f, 1.0f);

    conv_forward_cpu(inImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, outImages);

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputTensorDesc;
    // cudnnTensorDescriptor_t filterTensorDesc;
    cudnnTensorDescriptor_t outputTensorDesc;
    cudnnFilterDescriptor_t filterDesc;
    cudnnConvolutionDescriptor_t convDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputTensorDesc);
    // cudnnCreateTensorDescriptor(&filterTensorDesc);
    cudnnCreateTensorDescriptor(&outputTensorDesc);
    cudnnCreateFilterDescriptor(&filterDesc);
    cudnnCreateConvolutionDescriptor(&convDesc);

    cudnnSetTensor4dDescriptor(
        inputTensorDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, inC, inH, inW);
    cudnnSetTensor4dDescriptor(
        outputTensorDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, outC, outH, outW);
    cudnnSetFilter4dDescriptor(
        filterDesc,
        CUDNN_DATA_FLOAT,
        CUDNN_TENSOR_NCHW,
        outC,
        inC,
        kH,
        kW);
    cudnnSetConvolution2dDescriptor(
        convDesc,
        padH, padW,
        dH, dW,
        1, 1,
        CUDNN_CROSS_CORRELATION);

    int workspaceSizeBytes = 0;
    cocl::dnn::gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize(
        dnn_handle,
        inputTensorDesc,
        filterDesc,
        convDesc,
        outputTensorDesc,
        &workspaceSizeBytes
    );
    cout << "workspaceSizeBytes=" << workspaceSizeBytes << endl;

    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t filterOffsetBytes = inputOffsetBytes + inLinearSize * sizeof(float);
    size_t outputOffsetBytes = filterOffsetBytes + filterLinearSize * sizeof(float);
    size_t workspaceOffsetBytes = outputOffsetBytes + workspaceSizeBytes;

    size_t gpuMemoryAllocSize = (inLinearSize + filterLinearSize + outLinearSize) * sizeof(float) + workspaceSizeBytes;
    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceFilter = (float *)(((char *)gpuMemory->fakePos + filterOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));
    float *gpuDeviceWorkspace = (float *)(((char *)gpuMemory->fakePos + workspaceSizeBytes));

    cl_int err;

    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, inputOffsetBytes,
                                     (inLinearSize) * sizeof(float), inImages, 0, NULL, NULL);
    EasyCL::checkError(err);
    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, filterOffsetBytes,
                                     (filterLinearSize) * sizeof(float), filters, 0, NULL, NULL);
    EasyCL::checkError(err);

    float alpha = 1.0f;
    float beta = 0.0f;
    cocl::dnn::gemm_im2col::cudnnConvolutionForward(
        dnn_handle,
        &alpha,
        inputTensorDesc, gpuDeviceInput,
        filterDesc, gpuDeviceFilter,
        convDesc,
        gpuDeviceWorkspace, workspaceSizeBytes,
        &beta,
        outputTensorDesc, gpuDeviceOutput
    );

    cudnnDestroyFilterDescriptor(filterDesc);
    cudnnDestroyConvolutionDescriptor(convDesc);
    cudnnDestroyTensorDescriptor(inputTensorDesc);
    // cudnnDestroyTensorDescriptor(filterTensorDesc);
    cudnnDestroyTensorDescriptor(outputTensorDesc);
    cudnnDestroy(dnn_handle);

    float *gpuOutHostside = new float[outLinearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, outputOffsetBytes,
                                     (outLinearSize) * sizeof(float), gpuOutHostside, 0, NULL, NULL);
    EasyCL::checkError(err);

// size_t cudnnConvolutionForward(
//     cudnnHandle_t handle,
//     float *p_alpha,
//     cudnnTensorDescriptor_t inputTensorDesc, float *inputData,
//     cudnnFilterDescriptor_t filterDesc, float *filterData,
//     cudnnConvolutionDescriptor_t convDesc,
//     cudnnConvolutionFwdAlgo_t algo,
//     void *workspaceData, CoclDnnSizeType workspaceSize,
//     float *p_beta,
//     cudnnTensorDescriptor_t outputTensorDesc, float *outputData
// ) {

    // const int numSamples = 20;
    // int *sampleIndices = new int[numSamples];
    // fillRandomInt(random, sampleIndices, numSamples, 0, outLinearSize);
    // for(int i = 0; i < numSamples; i++) {
    //     int linearPos = sampleIndices[i];
    //     int n = linearPos / inC / inH / inW;
    //     int rem = linearPos - n * inC * inH * inW;
    //     int c = rem / inH / inW;
    //     rem = rem - c * inH * inW;
    //     int inh = rem / inW;
    //     int inw = rem % inW;
    //     cout << "n=" << n << " c=" << c << " inh=" << inh << " inw=" << inw << " outImages[" << linearPos << "]=" << outImages[linearPos] << endl;
    // }

    delete gpuMemory;
    delete[] gpuOutHostside;

    delete[] outImages;
    delete[] filters;
    delete[] inImages;
}

} // namespace
