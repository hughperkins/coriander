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

#include "cocl/cocl_dnn_act.h"

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

// int NCHW_to_index(
//         int N, int C, int H, int W,
//         int n, int c, int h, int w) {
//     int index = n;
//     index = index * C + c;
//     index = index * H + h;
//     index = index * W + w;
//     return index;
// }

void forward_softmax_cpu(
        float *input, int N, int C,
        float *output) {
    // assumes H==W==1
    for(int n = 0; n < N; n++) {
        float *inputCube = &input[n * C];
        float *outputCube = &output[n * C];

        // first get the max
        float maxValue = inputCube[0];
        for(int c = 1; c < C; c++) {
            maxValue = std::max(maxValue, inputCube[c]);
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

TEST(test_dnn_loss, forward_softmax_cpu) {
    int N = 4;
    int C = 3;
    int H = 1;
    int W = 1;

    int linearSize = N * C;

    float *input = new float[linearSize];
    float *output = new float[linearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * H * W, 0.0f, 5.0f);

    forward_softmax_cpu(input, N, C, output);

    cout << "output:" << endl;
    for(int n = 0; n < 4; n++) {
        cout << "n=" << n << ": ";
        for(int c = 0; c < C; c++) {
            cout << output[n * C + c] << " ";
        }
        cout << endl;
    }

    delete[] output;
    delete[] input;
}

TEST(test_dnn_loss, forward_softmax_gpu) {
    int N = 4;
    int C = 3;
    int H = 1;
    int W = 1;

    // N = 1;
    // C = 1;
    // inH = 3;
    // inW = 3;

    int linearSize = N * C;

    float *input = new float[linearSize];
    float *output = new float[linearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * H * W, 0.0f, 5.0f);

    forward_softmax_cpu(input, N, C, output);

    cout << "input:" << endl;
    for(int n=0; n < N; n++) {
        cout << "n=" << n << ": ";
        for(int c=0; c < C; c++) {
            cout << input[n * C + c] << " ";
        }
        cout << endl;
    }

    cout << "output:" << endl;
    for(int n=0; n < N; n++) {
        cout << "n=" << n << ": ";
        for(int c=0; c < C; c++) {
            cout << output[n * C + c] << " ";
        }
        cout << endl;
    }

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);

    cudnnSetTensor4dDescriptor(
        inputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, C, H, W);
    cudnnSetTensor4dDescriptor(
        outputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, C, H, W);

    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t outputOffsetBytes = inputOffsetBytes + linearSize * sizeof(float);
    size_t gpuMemoryAllocSize = outputOffsetBytes + linearSize * sizeof(float);

    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));

    cl_int err;

    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, inputOffsetBytes,
                                     (linearSize) * sizeof(float), input, 0, NULL, NULL);
    EasyCL::checkError(err);

    float alpha = 1.0f;
    float beta = 0.0f;

    cudnnSoftmaxForward(dnn_handle,
                        CUDNN_SOFTMAX_ACCURATE, CUDNN_SOFTMAX_MODE_CHANNEL,
                        &alpha,
                        inputDesc, gpuDeviceInput,  // input
                        &beta,
                        outputDesc, gpuDeviceOutput);  // output

    float *gpuOutHostside = new float[linearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, outputOffsetBytes,
                                     (linearSize) * sizeof(float), gpuOutHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    cl->finish();

    cout << "gpu output:" << endl;
    for(int n=0; n < N; n++) {
        cout << "n=" << n << ": ";
        for(int c=0; c < C; c++) {
            cout << gpuOutHostside[n * C + c] << " ";
        }
        cout << endl;
    }

    for(int n=0; n < N; n++) {
        for(int c=0; c < C; c++) {
            if(abs(gpuOutHostside[n * C + c] - output[n * C + c]) > 1e-4) {
                cout << "mismatch for n=" << n << " c=" << c << endl;
                throw runtime_error("mismatch");
            }
        }
    }

    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    delete[] gpuOutHostside;

    delete[] output;
    delete[] input;
}

} // namespace
