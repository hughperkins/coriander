// Copyright Hugh Perkins 2016, 2017

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "cocl/cocl_dnn_pooling.h"
#include "cocl/cocl_dnn.h"
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

typedef std::mt19937 MT19937;
void fillRandomUniform(MT19937 &random, float *target, int size, float minVal, float maxVal);
void fillRandomInt(MT19937 &random, int *target, int size, int minValInclusive, int maxValExclusive);

namespace {

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

int NCHW_to_index(
        int N, int C, int H, int W,
        int n, int c, int h, int w) {
    int index = n;
    index = index * C + c;
    index = index * H + h;
    index = index * W + w;
    return index;
}

void pool_forward_cpu(
    float *input, int N, int C,
    int inH, int inW, int kH, int kW, int padH, int padW, int dH, int dW,
    float *output) {

    // int outH = (inH + 2 * padH - kH) / dH + 1;
    // int outW = (inW + 2 * padW - kW) / dW + 1;

    int outH = 0;
    int outW = 0;
    // adapted from torch
    bool ceil_mode = false;
    if(ceil_mode) {
        outW = ceil(float(inW - kW + 2*padW) / float(dW)) + 1;
        outH = ceil(float(inH - kH + 2*padH) / float(dH)) + 1;
    } else {
        outW = floor(float(inW - kW + 2*padW) / float(dW)) + 1;
        outH = floor(float(inH - kH + 2*padH) / float(dH)) + 1;
    }

    if(padW || padH) {
        // ensure that the last pooling starts inside the image
        if((outW - 1)*dH >= inH + padH) {
            outH--;
        }
        if((outW  - 1)*dW >= inW  + padW) {
            outW--;
        }
    }

    // adapted from caffe, via torch
    for(int n=0; n < N; n++) {
        for(int c=0; c < C; c++) {
            for(int outh=0; outh < outH; outh++) {
                for(int outw=0; outw < outW; outw++) {
                    // int inh = outh * dH + kh - padH;
                    // int inw = outw * dW + kw - padW;
                    // if(inh >= 0 && inw >= 0 && inh < inH && inw < inW) {
                        int hstart = outh * dH - padH;
                        int wstart = outw * dW - padW;
                        int hend = min(hstart + kH, inH);
                        int wend = min(wstart + kW, inW);
                        hstart = max(hstart, 0);
                        wstart = max(wstart, 0);
                        float maxval = input[NCHW_to_index(N, C, inH, inW, n, c, hstart, wstart)];
                        for (int inh = hstart; inh < hend; ++inh) {
                            for (int inw = wstart; inw < wend; ++inw) {
                                int inIndex = NCHW_to_index(N, C, inH, inW, n, c, inh, inw);
                                if (input[inIndex] > maxval) {
                                    maxval = input[inIndex];
                                }
                            }
                        }
                        int outIndex = NCHW_to_index(N, C, outH, outW, n, c, outh, outw);
                        output[outIndex] = maxval;
                    // }
                }
            }
        }
    }
}

void pool_backward_cpu(
    float *output, float *gradOutput, float *input, int N, int C,
    int inH, int inW, int kH, int kW, int padH, int padW, int dH, int dW,
    float *gradInput) {

    // int outH = (inH + 2 * padH - kH) / dH + 1;
    // int outW = (inW + 2 * padW - kW) / dW + 1;

    int outH = 0;
    int outW = 0;
    // adapted from torch
    bool ceil_mode = false;
    if(ceil_mode) {
        outW = ceil(float(inW - kW + 2*padW) / float(dW)) + 1;
        outH = ceil(float(inH - kH + 2*padH) / float(dH)) + 1;
    } else {
        outW = floor(float(inW - kW + 2*padW) / float(dW)) + 1;
        outH = floor(float(inH - kH + 2*padH) / float(dH)) + 1;
    }

    if(padW || padH) {
        // ensure that the last pooling starts inside the image
        if((outW - 1)*dH >= inH + padH) {
            outH--;
        }
        if((outW  - 1)*dW >= inW  + padW) {
            outW--;
        }
    }
    cout << "inH=" << inH << " inW=" << inW << " outH=" << outH << " outW=" << outW << endl;

    // zero everything first...
    for(int n=0; n < N; n++) {
        for(int c=0; c < C; c++) {
            for(int inh=0; inh < inH; inh++) {
                for(int inw=0; inw < inW; inw++) {
                    int inIndex = NCHW_to_index(N, C, inH, inW, n, c, inh, inw);
                    gradInput[inIndex] = 0.0f;
                }
            }
        }
    }

    // adapted from caffe, via torch
    for(int n=0; n < N; n++) {
        for(int c=0; c < C; c++) {
            for(int outh=0; outh < outH; outh++) {
                for(int outw=0; outw < outW; outw++) {
                    // int inh = outh * dH + kh - padH;
                    // int inw = outw * dW + kw - padW;
                    // if(inh >= 0 && inw >= 0 && inh < inH && inw < inW) {
                        int hstart = outh * dH - padH;
                        int wstart = outw * dW - padW;
                        int hend = min(hstart + kH, inH);
                        int wend = min(wstart + kW, inW);
                        hstart = max(hstart, 0);
                        wstart = max(wstart, 0);
                        float maxval = -1e14;
                        // float maxval = input[NCHW_to_index(N, C, inH, inW, n, c, hstart, wstart)];
                        int maxidx = -1;
                        for (int inh = hstart; inh < hend; ++inh) {
                            for (int inw = wstart; inw < wend; ++inw) {
                                int inIndex = NCHW_to_index(N, C, inH, inW, n, c, inh, inw);
                                if (input[inIndex] > maxval) {
                                    maxval = input[inIndex];
                                    maxidx = inh * inW + inw;
                                }
                            }
                        }
                        int outIndex = NCHW_to_index(N, C, outH, outW, n, c, outh, outw);
                        int inIndex = NCHW_to_index(N, C, inH, inW, n, c, 0, 0) + maxidx;
                        gradInput[inIndex] = gradOutput[outIndex];
                        // output[outIndex] = maxval;
                    // }
                }
            }
        }
    }
}

TEST(test_dnn_pooling, forward_cpu) {
    int N = 4;
    int C = 3;
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

    int inLinearSize = N * C * inH * inW;
    int outLinearSize = N * C * outH * outW;
    float *input = new float[inLinearSize];
    float *output = new float[outLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * inH * inW, 0.0f, 1.0f);

    pool_forward_cpu(input, N, C, inH, inW, kH, kW, padH, padW, dH, dW, output);
    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, outLinearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / outH / outW;
        int rem = linearPos - n * C * outH * outW;
        int c = rem / outH / outW;
        rem = rem - c * outH * outW;
        int outh = rem / outW;
        int outw = rem % outW;
        cout << "n=" << n << " c=" << c << " inh=" << outh << " inw=" << outw << " output[" << linearPos << "]=" << output[linearPos] << endl;
    }

    delete[] output;
    delete[] input;
}

TEST(test_dnn_pooling, backward_cpu) {
    int N = 4;
    int C = 3;
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

    int inLinearSize = N * C * inH * inW;
    int outLinearSize = N * C * outH * outW;

    float *input = new float[inLinearSize];
    float *output = new float[outLinearSize];
    float *gradInput = new float[inLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * inH * inW, 0.0f, 1.0f);

    pool_forward_cpu(input, N, C, inH, inW, kH, kW, padH, padW, dH, dW, output);
    pool_backward_cpu(output, output, input, N, C, inH, inW, kH, kW, padH, padW, dH, dW, gradInput);

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, inLinearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / inH / inW;
        int rem = linearPos - n * C * inH * inW;
        int c = rem / inH / inW;
        rem = rem - c * inH * inW;
        int inh = rem / inW;
        int inw = rem % inW;
        cout << "n=" << n << " c=" << c << " inh=" << inh << " inw=" << inw << " gradInput[" << linearPos << "]=" << gradInput[linearPos] << endl;
    }

    delete[] gradInput;
    delete[] output;
    delete[] input;
}

TEST(test_dnn_pooling, gpu_forward) {
    int N = 4;
    int C = 3;
    int inH = 5;
    int inW = 6;
    int kH = 3;
    int kW = 3;
    int padH = 1;
    int padW = 1;
    int dH = 1;
    int dW = 1;

    // N = 1;
    // C = 1;
    // inH = 3;
    // inW = 3;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;
    cout << "outH=" << outH << " outW=" << outW << endl;

    int inLinearSize = N * C * inH * inW;
    int outLinearSize = N * C * outH * outW;

    float *input = new float[inLinearSize];
    float *output = new float[outLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * inH * inW, 0.0f, 1.0f);

    pool_forward_cpu(input, N, C, inH, inW, kH, kW, padH, padW, dH, dW, output);

    cout << "input[0][0]:" << endl;
    for(int h=0; h < inH; h++) {
        for(int w=0; w < inW; w++) {
            cout << input[h * inW + w] << " ";
        }
        cout << endl;
    }

    cout << "output[0][0]:" << endl;
    for(int h=0; h < outH; h++) {
        for(int w=0; w < outW; w++) {
            cout << output[h * outW + w] << " ";
        }
        cout << endl;
    }

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;
    cudnnPoolingDescriptor_t poolDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);
    cudnnCreatePoolingDescriptor(&poolDesc);

    cudnnSetTensor4dDescriptor(
        inputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, C, inH, inW);
    cudnnSetTensor4dDescriptor(
        outputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, C, outH, outW);
    cudnnSetPooling2dDescriptor(poolDesc,
                                CUDNN_POOLING_MAX,
                                CUDNN_PROPAGATE_NAN,
                                kH, kW,
                                padH, padW,
                                dH, dW);

    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t outputOffsetBytes = inputOffsetBytes + inLinearSize * sizeof(float);
    size_t gpuMemoryAllocSize = outputOffsetBytes + outLinearSize * sizeof(float);

    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));

    cl_int err;

    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, inputOffsetBytes,
                                     (inLinearSize) * sizeof(float), input, 0, NULL, NULL);
    EasyCL::checkError(err);

    float alpha = 1.0f;
    float beta = 0.0f;
    cudnnPoolingForward(dnn_handle,
                        poolDesc,
                        &alpha,
                        inputDesc, gpuDeviceInput,  // input to this layer
                        &beta,
                        outputDesc, gpuDeviceOutput);  // output

    float *gpuOutHostside = new float[outLinearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, outputOffsetBytes,
                                     (outLinearSize) * sizeof(float), gpuOutHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    cl->finish();

    cout << "gpuOutput[0][0]:" << endl;
    for(int h=0; h < outH; h++) {
        for(int w=0; w < outW; w++) {
            cout << gpuOutHostside[h * outW + w] << " ";
        }
        cout << endl;
    }

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, outLinearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / outH / outW;
        int rem = linearPos - n * C * outH * outW;
        int c = rem / outH / outW;
        rem = rem - c * outH * outW;
        int outh = rem / outW;
        int outw = rem % outW;
        cout << "n=" << n << " c=" << c << " outh=" << outh << " outw=" << outw << " output[" << linearPos << "]="
            << output[linearPos] << " " << gpuOutHostside[linearPos] << endl;
        if(abs(output[linearPos] - gpuOutHostside[linearPos]) > 1e-4) {
            throw runtime_error(string("test_dnn, output of conv forward ,mismatch for ") +
                "n=" + toString(n) + " c=" + toString(c) + " outh=" + toString(outh) + " outw=" + toString(outw));
        }
    }

    cudnnDestroyPoolingDescriptor(poolDesc);
    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    delete[] gpuOutHostside;

    delete[] output;
    delete[] input;
}

TEST(test_dnn_pooling, gpu_backward) {
    int N = 4;
    int C = 3;
    int inH = 5;
    int inW = 6;
    int kH = 3;
    int kW = 3;
    int padH = 1;
    int padW = 1;
    int dH = 1;
    int dW = 1;

    // N = 1;
    // C = 1;
    // inH = 3;
    // inW = 3;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;
    cout << "outH=" << outH << " outW=" << outW << endl;

    int inLinearSize = N * C * inH * inW;
    int outLinearSize = N * C * outH * outW;

    float *input = new float[inLinearSize];
    float *output = new float[outLinearSize];
    float *gradInput = new float[inLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * inH * inW, 0.0f, 1.0f);

    pool_forward_cpu(input, N, C, inH, inW, kH, kW, padH, padW, dH, dW, output);
    pool_backward_cpu(output, output, input, N, C, inH, inW, kH, kW, padH, padW, dH, dW, gradInput);

    cout << "input[0][0]:" << endl;
    for(int h=0; h < inH; h++) {
        for(int w=0; w < inW; w++) {
            cout << input[h * inW + w] << " ";
        }
        cout << endl;
    }

    cout << "output[0][0]:" << endl;
    for(int h=0; h < outH; h++) {
        for(int w=0; w < outW; w++) {
            cout << output[h * outW + w] << " ";
        }
        cout << endl;
    }

    cout << "gradInput[0][0]:" << endl;
    for(int h=0; h < inH; h++) {
        for(int w=0; w < inW; w++) {
            cout << gradInput[h * inW + w] << " ";
        }
        cout << endl;
    }

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;
    // cudnnTensorDescriptor_t gradInputDesc;
    cudnnPoolingDescriptor_t poolDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);
    // cudnnCreateTensorDescriptor(&gradInputDesc);
    cudnnCreatePoolingDescriptor(&poolDesc);

    cudnnSetTensor4dDescriptor(
        inputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, C, inH, inW);
    cudnnSetTensor4dDescriptor(
        outputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, C, outH, outW);
    cudnnSetPooling2dDescriptor(poolDesc,
                                CUDNN_POOLING_MAX,
                                CUDNN_PROPAGATE_NAN,
                                kH, kW,
                                padH, padW,
                                dH, dW);

    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t outputOffsetBytes = inputOffsetBytes + inLinearSize * sizeof(float);
    size_t gradInputOffsetBytes = outputOffsetBytes + outLinearSize * sizeof(float);
    size_t gpuMemoryAllocSize = gradInputOffsetBytes + inLinearSize * sizeof(float);

    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));
    float *gpuDeviceGradInput = (float *)(((char *)gpuMemory->fakePos + gradInputOffsetBytes));

    cl_int err;

    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, inputOffsetBytes,
                                     (inLinearSize) * sizeof(float), input, 0, NULL, NULL);
    EasyCL::checkError(err);

    float alpha = 1.0f;
    float beta = 0.0f;
    cudnnPoolingForward(dnn_handle,
                        poolDesc,
                        &alpha,
                        inputDesc, gpuDeviceInput,  // input to this layer
                        &beta,
                        outputDesc, gpuDeviceOutput);  // output
    cudnnPoolingBackward(dnn_handle,
                        poolDesc,
                        &alpha,
                        outputDesc, gpuDeviceOutput,
                        outputDesc, gpuDeviceOutput,
                        inputDesc, gpuDeviceInput,
                        &beta,
                        inputDesc, gpuDeviceGradInput);

    float *gpuGradInputHostside = new float[inLinearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, gradInputOffsetBytes,
                                     (outLinearSize) * sizeof(float), gpuGradInputHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    cl->finish();

    cout << "gpuGradInput[0][0]:" << endl;
    for(int h=0; h < inH; h++) {
        for(int w=0; w < inW; w++) {
            cout << gpuGradInputHostside[h * outW + w] << " ";
        }
        cout << endl;
    }

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, inLinearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / inH / inW;
        int rem = linearPos - n * C * inH * inW;
        int c = rem / inH / inW;
        rem = rem - c * inH * inW;
        int inh = rem / inW;
        int inw = rem % inW;
        cout << "n=" << n << " c=" << c << " inh=" << inh << " inw=" << inw << " gradInput[" << linearPos << "]="
            << gradInput[linearPos] << " " << gpuGradInputHostside[linearPos] << endl;
        if(abs(gradInput[linearPos] - gpuGradInputHostside[linearPos]) > 1e-4) {
            throw runtime_error(string("test_dnn, output of pool backward ,mismatch for ") +
                "n=" + toString(n) + " c=" + toString(c) + " outh=" + toString(inh) + " outw=" + toString(inw));
        }
    }

    cudnnDestroyPoolingDescriptor(poolDesc);
    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    delete[] gpuGradInputHostside;

    delete[] output;
    delete[] input;
    delete[] gradInput;
}

} // namespace
