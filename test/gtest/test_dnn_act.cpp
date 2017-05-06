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

class Act {
public:
    virtual ~Act(){}
    virtual float forward(float input) = 0;
    virtual float backward(float output, float gradOutput, float input) = 0;
};
class Relu : public Act {
public:
    float forward(float input) {
        return input > 0 ? input : 0.0f;
    }
    float backward(float output, float gradOutput, float input) {
        return input > 0 ? gradOutput : 0.0f;
    }
};
class Sigmoid : public Act {
public:
    float forward(float input) {
        return 1.0f / (1.0f + exp(-input));
    }
    float backward(float output, float gradOutput, float input) {
        return output * (1 - output);
    }
};
class Tanh : public Act {
public:
    float forward(float input) {
        return tanh(input);
    }
    float backward(float output, float gradOutput, float input) {
        return 1 - output * output;
    }
};

void forward_relu_cpu(
    float *input, int N, int C, int H, int W,
    float *output, Act *act) {

    int linearSize = N * C * H * W;
    for(int n = 0; n < linearSize; n++) {
        output[n] = act->forward(input[n]);
    }
}

void backward_relu_cpu(
    float *output, float *gradOutput, float *input, int N, int C, int H, int W,
    float *gradInput, Act *act) {

    int linearSize = N * C * H * W;
    for(int n = 0; n < linearSize; n++) {
        gradInput[n] = act->backward(output[n], gradOutput[n], input[n]);
    }
}

TEST(test_dnn_act, forward_cpu) {
    int N = 4;
    int C = 3;
    int H = 5;
    int W = 6;

    int linearSize = N * C * H * W;

    float *input = new float[linearSize];
    float *output = new float[linearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * H * W, -1.0f, 1.0f);

    Relu act;
    forward_relu_cpu(input, N, C, H, W, output, &act);

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, linearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / H / W;
        int rem = linearPos - n * C * H * W;
        int c = rem / H / W;
        rem = rem - c * H * W;
        int h = rem / W;
        int w = rem % W;
        cout << "n=" << n << " c=" << c << " h=" << h << " w=" << w << " output[" << linearPos << "]=" << output[linearPos] << endl;
    }

    delete[] output;
    delete[] input;
}

TEST(test_dnn_act, backward_cpu) {
    int N = 4;
    int C = 3;
    int H = 5;
    int W = 6;

    int linearSize = N * C * H * W;

    float *input = new float[linearSize];
    float *output = new float[linearSize];
    float *gradInput = new float[linearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * H * W, -1.0f, 1.0f);

    Relu act;
    forward_relu_cpu(input, N, C, H, W, output, &act);
    backward_relu_cpu(output, output, input, N, C, H, W, gradInput, &act);

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, linearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / H / W;
        int rem = linearPos - n * C * H * W;
        int c = rem / H / W;
        rem = rem - c * H * W;
        int h = rem / W;
        int w = rem % W;
        cout << "n=" << n << " c=" << c << " h=" << h << " w=" << w << " gradInput[" << linearPos << "]=" << gradInput[linearPos] << endl;
    }

    delete[] output;
    delete[] input;
    delete[] gradInput;
}

void run_forward_gpu(Act *act, CoclDnnLayout type) {
    int N = 4;
    int C = 3;
    int H = 5;
    int W = 6;

    // N = 1;
    // C = 1;
    // inH = 3;
    // inW = 3;

    int linearSize = N * C * H * W;

    float *input = new float[linearSize];
    float *output = new float[linearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * H * W, -1.0f, 1.0f);

    // Relu act;
    forward_relu_cpu(input, N, C, H, W, output, act);

    cout << "input[0][0]:" << endl;
    for(int h=0; h < H; h++) {
        for(int w=0; w < W; w++) {
            cout << input[h * W + w] << " ";
        }
        cout << endl;
    }

    cout << "output[0][0]:" << endl;
    for(int h=0; h < H; h++) {
        for(int w=0; w < W; w++) {
            cout << output[h * W + w] << " ";
        }
        cout << endl;
    }

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;
    cudnnActivationDescriptor_t actDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);
    cudnnCreateActivationDescriptor(&actDesc);

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
    cudnnSetActivationDescriptor(actDesc,
                                 type,
                                 CUDNN_PROPAGATE_NAN, 0.0);

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
    cudnnActivationForward(dnn_handle, actDesc, &alpha,
                           inputDesc, gpuDeviceInput,
                           &beta,
                           outputDesc, gpuDeviceOutput);

    float *gpuOutHostside = new float[linearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, outputOffsetBytes,
                                     (linearSize) * sizeof(float), gpuOutHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    cl->finish();

    cout << "gpuOutput[0][0]:" << endl;
    for(int h=0; h < H; h++) {
        for(int w=0; w < W; w++) {
            cout << gpuOutHostside[h * W + w] << " ";
        }
        cout << endl;
    }

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, linearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / H / W;
        int rem = linearPos - n * C * H * W;
        int c = rem / H / W;
        rem = rem - c * H * W;
        int outh = rem / W;
        int outw = rem % W;
        cout << "n=" << n << " c=" << c << " outh=" << outh << " outw=" << outw << " output[" << linearPos << "]="
            << output[linearPos] << " " << gpuOutHostside[linearPos] << endl;
        if(abs(output[linearPos] - gpuOutHostside[linearPos]) > 1e-4) {
            throw runtime_error(string("test_dnn, output of conv forward ,mismatch for ") +
                "n=" + toString(n) + " c=" + toString(c) + " outh=" + toString(outh) + " outw=" + toString(outw));
        }
    }

    cudnnDestroyActivationDescriptor(actDesc);
    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    delete[] gpuOutHostside;

    delete[] output;
    delete[] input;
}

void run_backward_gpu(Act *act, CoclDnnLayout type) {
    int N = 4;
    int C = 3;
    int H = 5;
    int W = 6;

    // N = 1;
    // C = 1;
    // inH = 3;
    // inW = 3;

    int linearSize = N * C * H * W;

    float *input = new float[linearSize];
    float *output = new float[linearSize];
    float *gradInput = new float[linearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, input, N * C * H * W, -1.0f, 1.0f);

    // Relu act;
    forward_relu_cpu(input, N, C, H, W, output, act);
    backward_relu_cpu(output, output, output, N, C, H, W, gradInput, act);

    cout << "input[0][0]:" << endl;
    for(int h=0; h < H; h++) {
        for(int w=0; w < W; w++) {
            cout << input[h * W + w] << " ";
        }
        cout << endl;
    }

    cout << "output[0][0]:" << endl;
    for(int h=0; h < H; h++) {
        for(int w=0; w < W; w++) {
            cout << output[h * W + w] << " ";
        }
        cout << endl;
    }

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;
    cudnnActivationDescriptor_t actDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);
    cudnnCreateActivationDescriptor(&actDesc);

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
    cudnnSetActivationDescriptor(actDesc,
                                 type,
                                 CUDNN_PROPAGATE_NAN, 0.0);

    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t outputOffsetBytes = inputOffsetBytes + linearSize * sizeof(float);
    size_t gradInputOffsetBytes = outputOffsetBytes + linearSize * sizeof(float);
    size_t gpuMemoryAllocSize = gradInputOffsetBytes + linearSize * sizeof(float);

    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));
    float *gpuDeviceGradInput = (float *)(((char *)gpuMemory->fakePos + gradInputOffsetBytes));

    cl_int err;

    err = clEnqueueWriteBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, inputOffsetBytes,
                                     (linearSize) * sizeof(float), input, 0, NULL, NULL);
    EasyCL::checkError(err);

    float alpha = 1.0f;
    float beta = 0.0f;
    cudnnActivationForward(dnn_handle, actDesc, &alpha,
                           inputDesc, gpuDeviceInput,
                           &beta,
                           outputDesc, gpuDeviceOutput);
    cudnnActivationBackward(dnn_handle, actDesc, &alpha,
                           outputDesc, gpuDeviceOutput,
                           outputDesc, gpuDeviceOutput,
                           inputDesc, gpuDeviceInput,
                           &beta,
                           inputDesc, gpuDeviceGradInput);

    float *gpuOutHostside = new float[linearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, outputOffsetBytes,
                                     (linearSize) * sizeof(float), gpuOutHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    cl->finish();

    cout << "gpuOutput[0][0]:" << endl;
    for(int h=0; h < H; h++) {
        for(int w=0; w < W; w++) {
            cout << gpuOutHostside[h * W + w] << " ";
        }
        cout << endl;
    }

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, linearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / C / H / W;
        int rem = linearPos - n * C * H * W;
        int c = rem / H / W;
        rem = rem - c * H * W;
        int outh = rem / W;
        int outw = rem % W;
        cout << "n=" << n << " c=" << c << " outh=" << outh << " outw=" << outw << " output[" << linearPos << "]="
            << output[linearPos] << " " << gpuOutHostside[linearPos] << endl;
        if(abs(output[linearPos] - gpuOutHostside[linearPos]) > 1e-4) {
            throw runtime_error(string("test_dnn, output of conv forward ,mismatch for ") +
                "n=" + toString(n) + " c=" + toString(c) + " outh=" + toString(outh) + " outw=" + toString(outw));
        }
    }

    cudnnDestroyActivationDescriptor(actDesc);
    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    delete[] gpuOutHostside;

    delete[] output;
    delete[] input;
}

TEST(test_dnn_act, gpu_forward_relu) {
    Relu relu;
    run_forward_gpu(&relu, CUDNN_ACTIVATION_RELU);
}
TEST(test_dnn_act, gpu_backward_relu) {
    Relu relu;
    run_backward_gpu(&relu, CUDNN_ACTIVATION_RELU);
}

TEST(test_dnn_act, gpu_forward_sigmoid) {
    Sigmoid act;
    run_forward_gpu(&act, CUDNN_ACTIVATION_SIGMOID);
}
TEST(test_dnn_act, gpu_backward_sigmoid) {
    Sigmoid act;
    run_backward_gpu(&act, CUDNN_ACTIVATION_SIGMOID);
}

TEST(test_dnn_act, gpu_forward_tanh) {
    Tanh act;
    run_forward_gpu(&act, CUDNN_ACTIVATION_TANH);
}
TEST(test_dnn_act, gpu_backward_tanh) {
    Tanh act;
    run_backward_gpu(&act, CUDNN_ACTIVATION_TANH);
}

} // namespace
