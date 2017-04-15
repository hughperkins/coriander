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

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

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
        int n = linearPos / C / inH / inW;
        int rem = linearPos - n * C * inH * inW;
        int c = rem / inH / inW;
        rem = rem - c * inH * inW;
        int inh = rem / inW;
        int inw = rem % inW;
        cout << "n=" << n << " c=" << c << " inh=" << inh << " inw=" << inw << " output[" << linearPos << "]=" << output[linearPos] << endl;
    }

    delete[] output;
    delete[] input;
}

} // namespace
