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

#include "cocl/cocl_dnn.h"
#include "cocl/cocl_dnn_gemm.h"

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

void fillRandomUniform(MT19937 &random, float *target, int size, float minVal, float maxVal) {
    for(int i = 0; i < size; i++) {
        target[i] = random() / (float)random.max() * (maxVal - minVal) + minVal;
    }
}

void fillRandomInt(MT19937 &random, int *target, int size, int minValInclusive, int maxValExclusive) {
    for(int i = 0; i < size; i++) {
        target[i] = random() % (maxValExclusive - 1 - minValInclusive) + minValInclusive;
    }
}

namespace {
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

TEST(test_dnn_conv, simple_cpu_im2col) {
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

TEST(test_dnn_conv, DISABLED_simple_gpu_im2col) {
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
        gpuMemory->clmem, colOffsetBytes,
        &v->currentContext->default_stream.get()->clqueue->queue
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
        gpuMemory2->clmem, imagesOffsetBytes,
        &v->currentContext->default_stream.get()->clqueue->queue
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
                if(abs(inImageStack[linearPos] - gpuImHostside[linearPos]) > 1e-4) {
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

void conv_backward_data_cpu(
        float *gradOutput, float *filters,
        int N, int inC, int outC,
        int inH, int inW, int kH, int kW, int padH, int padW, int dH, int dW,
        float *gradInput) {

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;
    cout << "outH=" << outH << " outW=" << outW << endl;

    for(int n = 0; n < N; n++) {
        for(int inc = 0; inc < inC; inc++) {
            for(int inh = 0; inh < inH; inh++) {
                for(int inw = 0; inw < inW; inw++) {
                    float sumWeightTimesGradOutput = 0;
                    // aggregate over [outc][outh][outw]
                    for(int outc = 0; outc < outC; outc++) {
                        for(int kh = 0; kh < kH; kh++) {
                            for(int kw = 0; kw < kW; kw++) {
                                int outh = (inh -kh + padH) / dH;
                                int outw = (inw -kw + padW) / dW;
                                if(outh >= 0 && outh < outH && outw >= 0 && outw < outW) {
                                    int resultIndex = ((n
                                        * outC + outc)
                                        * outH + outh)
                                        * outW + outw;
                                    float thisGradOutput = gradOutput[resultIndex];
                                    int thisWeightIndex = ((outc
                                        * inC + inc)
                                        * kH + kh)
                                        * kW + kw;
                                    float thisWeight = filters[thisWeightIndex];
                                    sumWeightTimesGradOutput += thisWeight * thisGradOutput;
                                }
                            }
                        }
                    }
                    int inputIndex = ((n
                        * inC + inc)
                        * inH + inh)
                        * inW + inw;
                    gradInput[inputIndex] = sumWeightTimesGradOutput;
                }
            }
        }
    }
}

void conv_backward_filters_cpu(
        float *input, float *gradOutput,
        int N, int inC, int outC,
        int inH, int inW, int kH, int kW, int padH, int padW, int dH, int dW,
        float *gradFilters) {

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    for(int outc = 0; outc < outC; outc++) {
        for(int inc = 0; inc < inC; inc++) {
            for(int kh = 0; kh < kH; kh++) {
                for(int kw = 0; kw < kW; kw++) {
                    int weightIndex = ((outc
                        * inC + inc)
                        * kH + kh)
                        * kW + kw;
                    float thiswchange = 0;
                    // float thisBiasChange = 0;
                    // gradWeights:     [outc][inc][kh][kw]
                    //       aggregate over:  [outh][outw][n]
                    for(int outh = 0; outh < outH; outh++) {
                        int inh = outh * dH + kh - padH;
                        if(inh < 0 || inh >= inH) {
                            continue;
                        }
                        for(int outw = 0; outw < outW; outw++) {
                            int inw = outw * dW + kw - padW;
                            if(inw < 0 || inw >= inW) {
                                continue;
                            }
                            for(int n = 0; n < N; n++) {
                                int outputIndex = ((n
                                    * outC + outc)
                                    * outH + outh)
                                    * outW + outw;
                                float gradOutputValue = gradOutput[outputIndex];
                                int inputIndex = ((n
                                    * inC + inc)
                                    * inH + inh)
                                    * inW + inw;
                                float inputValue = input[inputIndex];
                                thiswchange += gradOutputValue * inputValue;
                            }
                        }
                    }
                    gradFilters[weightIndex] = thiswchange;
                }
            }
        }
    }
}

void conv_backward_bias_cpu(
        float *gradOutput,
        int N, int inC, int outC,
        int inH, int inW, int kH, int kW, int padH, int padW, int dH, int dW,
        float *gradBias) {

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    for(int outc = 0; outc < outC; outc++) {
        float thisBiasChange = 0;
        for(int n = 0; n < N; n++) {
            for(int outh = 0; outh < outH; outh++) {
                for(int outw = 0; outw < outW; outw++) {
                    int outputIndex = ((n
                        * outC + outc)
                        * outH + outh)
                        * outW + outw;
                    float gradOutputValue = gradOutput[outputIndex];
                    thisBiasChange += gradOutputValue;
                }
            }
        }
        gradBias[outc] = thisBiasChange;
    }
}

TEST(test_dnn_conv, simple_cpu_conv) {
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

TEST(test_dnn_conv, simple_cpu_back_data) {
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

    // N = 1;
    // inC = 1;
    // outC = 1;
    // inH = 3;
    // inW = 3;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;

    int inLinearSize = N * inC * inH * inW;
    int outLinearSize = N * outC * outH * outW;
    float *inImages = new float[inLinearSize];
    float *filters = new float[inC * outC * kH * kW]; // lets say this is [outC][inC][kH][kW]
    float *outImages = new float[outLinearSize];
    float *gradInImages = new float[inLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImages, N * inC * inH * inW, 0.0f, 1.0f);
    fillRandomUniform(random, filters, inC * outC * kH * kW, 0.0f, 1.0f);

    conv_forward_cpu(inImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, outImages);
    conv_backward_data_cpu(outImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, gradInImages);

    cout << "'gradOutput[0][0]':" << endl;
    for(int outh=0; outh < outH; outh++) {
        for(int outw=0; outw < outW; outw++) {
            cout << outImages[outh * outW + outw] << " ";
        }
        cout << endl;
    }

    cout << "'filters[0][0]':" << endl;
    for(int kh=0; kh < kH; kh++) {
        for(int kw=0; kw < kW; kw++) {
            cout << filters[kh * kW + kw] << " ";
        }
        cout << endl;
    }

    cout << "'gradInput[0][0]':" << endl;
    for(int inh=0; inh < inH; inh++) {
        for(int inw=0; inw < inW; inw++) {
            cout << gradInImages[inh * inW + inw] << " ";
        }
        cout << endl;
    }

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, inLinearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / inC / inH / inW;
        int rem = linearPos - n * inC * inH * inW;
        int c = rem / inH / inW;
        rem = rem - c * inH * inW;
        int inh = rem / inW;
        int inw = rem % inW;
        cout << "n=" << n << " c=" << c << " inh=" << inh << " inw=" << inw << " gradInImages[" << linearPos << "]=" << gradInImages[linearPos] << endl;
    }

    delete[] gradInImages;
    delete[] outImages;
    delete[] filters;
    delete[] inImages;
}

TEST(test_dnn_conv, simple_cpu_back_filters) {
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
    int filtersSize = inC * outC * kH * kW;
    int biasSize = outC;

    float *inImages = new float[inLinearSize];
    float *filters = new float[filtersSize]; // lets say this is [outC][inC][kH][kW]
    float *outImages = new float[outLinearSize];
    float *gradFilters = new float[filtersSize];
    float *gradBias = new float[biasSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImages, N * inC * inH * inW, 0.0f, 1.0f);
    fillRandomUniform(random, filters, inC * outC * kH * kW, 0.0f, 1.0f);

    conv_forward_cpu(inImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, outImages);
    conv_backward_filters_cpu(inImages, outImages, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, gradFilters);
    conv_backward_bias_cpu(outImages, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, gradBias);

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, filtersSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int inc = linearPos / outC / kH / kW;
        int rem = linearPos - inc * outC * kH * kW;
        int outc = rem / kH / kW;
        rem = rem - outc * kH * kW;
        int dh = rem / kW;
        int dw = rem % kW;
        cout << "inn=" << inc << " outc=" << outc << " dh=" << dh << " dw=" << dw << " gradFilters[" << linearPos << "]=" << gradFilters[linearPos] << endl;
    }
    for(int outc = 0; outc < outC; outc++) {
        cout << "gradBias[" << outc << "]=" << gradBias[outc] << endl;
    }

    delete[] gradFilters;
    delete[] outImages;
    delete[] filters;
    delete[] inImages;
}

TEST(test_dnn_conv, simple_gpu_conv) {
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

    // N = 1;
    // inC = 1;
    // outC = 1;
    // inH = 3;
    // inW = 3;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;
    cout << "outH=" << outH << " outW=" << outW << endl;

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
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;
    cudnnFilterDescriptor_t filterDesc;
    cudnnConvolutionDescriptor_t convDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);
    cudnnCreateFilterDescriptor(&filterDesc);
    cudnnCreateConvolutionDescriptor(&convDesc);

    cudnnSetTensor4dDescriptor(
        inputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, inC, inH, inW);
    cudnnSetTensor4dDescriptor(
        outputDesc,
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

    size_t workspaceSizeBytes = 0;
    cocl::dnn::gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize(
        dnn_handle,
        inputDesc,
        filterDesc,
        convDesc,
        outputDesc,
        &workspaceSizeBytes
    );
    cout << "workspaceSizeBytes=" << workspaceSizeBytes << endl;

    ThreadVars *v = getThreadVars();
    // EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t filterOffsetBytes = inputOffsetBytes + inLinearSize * sizeof(float);
    size_t outputOffsetBytes = filterOffsetBytes + filterLinearSize * sizeof(float);
    size_t workspaceOffsetBytes = outputOffsetBytes + outLinearSize * sizeof(float);

    size_t gpuMemoryAllocSize = (inLinearSize + filterLinearSize + outLinearSize) * sizeof(float) + workspaceSizeBytes;
    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceFilter = (float *)(((char *)gpuMemory->fakePos + filterOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));
    float *gpuDeviceWorkspace = (float *)(((char *)gpuMemory->fakePos + workspaceOffsetBytes));

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
        inputDesc, gpuDeviceInput,
        filterDesc, gpuDeviceFilter,
        convDesc,
        gpuDeviceWorkspace, workspaceSizeBytes,
        &beta,
        outputDesc, gpuDeviceOutput
    );

    float *gpuOutHostside = new float[outLinearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, outputOffsetBytes,
                                     (outLinearSize) * sizeof(float), gpuOutHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    EasyCL::checkError(clFinish(v->currentContext->default_stream.get()->clqueue->queue));

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, outLinearSize);
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / outC / outH / outW;
        int rem = linearPos - n * outC * outH * outW;
        int c = rem / outH / outW;
        rem = rem - c * outH * outW;
        int outh = rem / outW;
        int outw = rem % outW;
        cout << "n=" << n << " c=" << c << " outh=" << outh << " outw=" << outw << " outImages[" << linearPos << "]="
            << outImages[linearPos] << " " << gpuOutHostside[linearPos] << endl;
        if(abs(outImages[linearPos] - gpuOutHostside[linearPos]) > 1e-4) {
            throw runtime_error(string("test_dnn, output of conv forward ,mismatch for ") +
                "n=" + toString(n) + " c=" + toString(c) + " outh=" + toString(outh) + " outw=" + toString(outw));
        }
    }

    cudnnDestroyFilterDescriptor(filterDesc);
    cudnnDestroyConvolutionDescriptor(convDesc);
    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    delete[] gpuOutHostside;

    delete[] outImages;
    delete[] filters;
    delete[] inImages;
}

TEST(test_dnn_conv, simple_gpu_conv_backward_data) {
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

    // N = 1;
    // inC = 1;
    // outC = 1;
    // inH = 3;
    // inW = 3;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;
    cout << "outH=" << outH << " outW=" << outW << endl;

    int inLinearSize = N * inC * inH * inW;
    int filterLinearSize = inC * outC * kH * kW;
    int outLinearSize = N * outC * outH * outW;

    float *inImages = new float[inLinearSize];
    float *filters = new float[filterLinearSize]; // lets say this is [outC][inC][kH][kW]
    float *outImages = new float[outLinearSize];
    float *gradInImages = new float[inLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImages, N * inC * inH * inW, 0.0f, 1.0f);
    fillRandomUniform(random, filters, inC * outC * kH * kW, 0.0f, 1.0f);

    conv_forward_cpu(inImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, outImages);
    conv_backward_data_cpu(outImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, gradInImages);

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;
    cudnnFilterDescriptor_t filterDesc;
    cudnnConvolutionDescriptor_t convDesc;
    cudnnTensorDescriptor_t gradInputDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);
    cudnnCreateFilterDescriptor(&filterDesc);
    cudnnCreateConvolutionDescriptor(&convDesc);
    cudnnCreateTensorDescriptor(&gradInputDesc);

    cudnnSetTensor4dDescriptor(
        inputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, inC, inH, inW);
    cudnnSetTensor4dDescriptor(
        outputDesc,
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
    cudnnSetTensor4dDescriptor(
        gradInputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, inC, inH, inW);

    size_t forwardWorkspaceSizeBytes = 0;
    size_t backwardDataWorkspaceSizeBytes = 0;
    size_t workspaceSizeBytes = 0;
    cocl::dnn::gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize(
        dnn_handle,
        inputDesc,
        filterDesc,
        convDesc,
        outputDesc,
        &forwardWorkspaceSizeBytes
    );
    cout << "forward workspaceSizeBytes=" << forwardWorkspaceSizeBytes << endl;
    cocl::dnn::gemm_im2col::cudnnGetConvolutionBackwardDataWorkspaceSize(
        dnn_handle,
        filterDesc,
        outputDesc,
        convDesc,
        gradInputDesc,
        &backwardDataWorkspaceSizeBytes
    );
    cout << "backward data workspaceSizeBytes=" << backwardDataWorkspaceSizeBytes << endl;
    workspaceSizeBytes = std::max(forwardWorkspaceSizeBytes, backwardDataWorkspaceSizeBytes);
    cout << "workspaceSizeBytes=" << workspaceSizeBytes << endl;

    ThreadVars *v = getThreadVars();
    // EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t filterOffsetBytes = inputOffsetBytes + inLinearSize * sizeof(float);
    size_t outputOffsetBytes = filterOffsetBytes + filterLinearSize * sizeof(float);
    size_t gradInputOffsetBytes = outputOffsetBytes + outLinearSize * sizeof(float);
    size_t workspaceOffsetBytes = gradInputOffsetBytes + inLinearSize * sizeof(float);

    // size_t gpuMemoryAllocSize = (inLinearSize + filterLinearSize + outLinearSize) * sizeof(float) + workspaceSizeBytes;
    size_t gpuMemoryAllocSize = workspaceOffsetBytes + workspaceSizeBytes;
    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceFilter = (float *)(((char *)gpuMemory->fakePos + filterOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));
    float *gpuDeviceGradInput = (float *)(((char *)gpuMemory->fakePos + gradInputOffsetBytes));
    float *gpuDeviceWorkspace = (float *)(((char *)gpuMemory->fakePos + workspaceOffsetBytes));

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
        inputDesc, gpuDeviceInput,
        filterDesc, gpuDeviceFilter,
        convDesc,
        gpuDeviceWorkspace, workspaceSizeBytes,
        &beta,
        outputDesc, gpuDeviceOutput
    );

    cocl::dnn::gemm_im2col::cudnnConvolutionBackwardData(
        dnn_handle,
        &alpha,
        filterDesc, gpuDeviceFilter,
        outputDesc, gpuDeviceOutput,
        convDesc,
        gpuDeviceWorkspace, workspaceSizeBytes,
        &beta,
        gradInputDesc, gpuDeviceGradInput
    );

    float *gpuGradInputHostside = new float[inLinearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, gradInputOffsetBytes,
                                     (inLinearSize) * sizeof(float), gpuGradInputHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    EasyCL::checkError(clFinish(v->currentContext->default_stream.get()->clqueue->queue));

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, inLinearSize);
    bool allOk = true;
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int n = linearPos / outC / outH / outW;
        int rem = linearPos - n * outC * outH * outW;
        int c = rem / outH / outW;
        rem = rem - c * outH * outW;
        int outh = rem / outW;
        int outw = rem % outW;
        cout << "n=" << n << " c=" << c << " outh=" << outh << " outw=" << outw << " gradInImages[" << linearPos << "]="
            << gradInImages[linearPos] << " " << gpuGradInputHostside[linearPos] << endl;
        if(abs(gradInImages[linearPos] - gpuGradInputHostside[linearPos]) > 1e-4) {
            allOk = false;
            cout << string("test_dnn, output of conv backward data, mismatch for ") +
                "n=" + toString(n) + " c=" + toString(c) + " outh=" + toString(outh) + " outw=" + toString(outw) << endl;
        }
    }
    if(!allOk) {
        throw runtime_error("FAILED");
    }

    cudnnDestroyFilterDescriptor(filterDesc);
    cudnnDestroyConvolutionDescriptor(convDesc);
    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroyTensorDescriptor(gradInputDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    // delete[] gpuOutHostside;
    delete[] gpuGradInputHostside;

    delete[] outImages;
    delete[] filters;
    delete[] inImages;
    delete[] gradInImages;
}

TEST(test_dnn_conv, DISABLED_simple_gpu_conv_backward_filters) {
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

    // N = 1;
    // inC = 1;
    // outC = 1;
    // inH = 3;
    // inW = 3;

    int outH = (inH + 2 * padH - kH) / dH + 1;
    int outW = (inW + 2 * padW - kW) / dW + 1;
    cout << "outH=" << outH << " outW=" << outW << endl;

    int inLinearSize = N * inC * inH * inW;
    int filterLinearSize = inC * outC * kH * kW;
    int outLinearSize = N * outC * outH * outW;
    int biasLinearSize = outC;

    float *inImages = new float[inLinearSize];
    float *filters = new float[filterLinearSize]; // lets say this is [outC][inC][kH][kW]
    float *outImages = new float[outLinearSize];
    float *gradFilters = new float[filterLinearSize];
    float *gradBias = new float[biasLinearSize];

    MT19937 random;
    random.seed(123ul);

    fillRandomUniform(random, inImages, N * inC * inH * inW, 0.0f, 1.0f);
    fillRandomUniform(random, filters, inC * outC * kH * kW, 0.0f, 1.0f);

    conv_forward_cpu(inImages, filters, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, outImages);
    conv_backward_filters_cpu(inImages, outImages, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, gradFilters);
    conv_backward_bias_cpu(outImages, N, inC, outC, inH, inW, kH, kW, padH, padW, dH, dW, gradBias);

    cudnnHandle_t dnn_handle;
    cudnnTensorDescriptor_t inputDesc;
    cudnnTensorDescriptor_t outputDesc;
    cudnnFilterDescriptor_t filterDesc;
    cudnnConvolutionDescriptor_t convDesc;
    cudnnFilterDescriptor_t gradFilterDesc;
    cudnnTensorDescriptor_t gradBiasDesc;

    cudnnCreate(&dnn_handle);
    cudnnCreateTensorDescriptor(&inputDesc);
    cudnnCreateTensorDescriptor(&outputDesc);
    cudnnCreateFilterDescriptor(&filterDesc);
    cudnnCreateConvolutionDescriptor(&convDesc);
    cudnnCreateFilterDescriptor(&gradFilterDesc);
    cudnnCreateTensorDescriptor(&gradBiasDesc);

    cudnnSetTensor4dDescriptor(
        inputDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        N, inC, inH, inW);
    cudnnSetTensor4dDescriptor(
        outputDesc,
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
    cudnnSetFilter4dDescriptor(
        gradFilterDesc,
        CUDNN_DATA_FLOAT,
        CUDNN_TENSOR_NCHW,
        outC,
        inC,
        kH,
        kW);
    cudnnSetTensor4dDescriptor(
        gradBiasDesc,
        CUDNN_TENSOR_NCHW,
        CUDNN_DATA_FLOAT,
        1, outC,
        1, 1);

    size_t forwardWorkspaceSizeBytes = 0;
    size_t backwardFilterWorkspaceSizeBytes = 0;
    size_t workspaceSizeBytes = 0;
    cocl::dnn::gemm_im2col::cudnnGetConvolutionForwardWorkspaceSize(
        dnn_handle,
        inputDesc,
        filterDesc,
        convDesc,
        outputDesc,
        &forwardWorkspaceSizeBytes
    );
    cout << "forward workspaceSizeBytes=" << forwardWorkspaceSizeBytes << endl;
    cocl::dnn::gemm_im2col::cudnnGetConvolutionBackwardFilterWorkspaceSize(
        dnn_handle,
        inputDesc,
        outputDesc,
        convDesc,
        gradFilterDesc,
        &backwardFilterWorkspaceSizeBytes
    );
    cout << "backward filter workspaceSizeBytes=" << backwardFilterWorkspaceSizeBytes << endl;
    workspaceSizeBytes = std::max(forwardWorkspaceSizeBytes, backwardFilterWorkspaceSizeBytes);
    cout << "workspaceSizeBytes=" << workspaceSizeBytes << endl;

    ThreadVars *v = getThreadVars();
    // EasyCL *cl = v->getContext()->getCl();

    size_t inputOffsetBytes = 0;
    size_t filterOffsetBytes = inputOffsetBytes + inLinearSize * sizeof(float);
    size_t outputOffsetBytes = filterOffsetBytes + filterLinearSize * sizeof(float);
    size_t gradFilterOffsetBytes = outputOffsetBytes + outLinearSize * sizeof(float);
    size_t gradBiasOffsetBytes = gradFilterOffsetBytes + filterLinearSize * sizeof(float);
    size_t workspaceOffsetBytes = gradBiasOffsetBytes + biasLinearSize * sizeof(float);

    // size_t gpuMemoryAllocSize = (inLinearSize + filterLinearSize + outLinearSize) * sizeof(float) + workspaceSizeBytes;
    size_t gpuMemoryAllocSize = workspaceOffsetBytes + workspaceSizeBytes;
    cout << "gpuMemoryAllocSize=" << gpuMemoryAllocSize << endl;
    Memory *gpuMemory = Memory::newDeviceAlloc(gpuMemoryAllocSize);

    float *gpuDeviceInput = (float *)(((char *)gpuMemory->fakePos + inputOffsetBytes));
    float *gpuDeviceFilter = (float *)(((char *)gpuMemory->fakePos + filterOffsetBytes));
    float *gpuDeviceOutput = (float *)(((char *)gpuMemory->fakePos + outputOffsetBytes));
    float *gpuDeviceGradFilter = (float *)(((char *)gpuMemory->fakePos + gradFilterOffsetBytes));
    float *gpuDeviceGradBias = (float *)(((char *)gpuMemory->fakePos + gradBiasOffsetBytes));
    float *gpuDeviceWorkspace = (float *)(((char *)gpuMemory->fakePos + workspaceOffsetBytes));

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
        inputDesc, gpuDeviceInput,
        filterDesc, gpuDeviceFilter,
        convDesc,
        gpuDeviceWorkspace, workspaceSizeBytes,
        &beta,
        outputDesc, gpuDeviceOutput
    );

    cocl::dnn::gemm_im2col::cudnnConvolutionBackwardFilter(
        dnn_handle,
        &alpha,
        inputDesc, gpuDeviceInput,
        outputDesc, gpuDeviceOutput,
        convDesc,
        gpuDeviceWorkspace, workspaceSizeBytes,
        &beta,
        gradFilterDesc, gpuDeviceGradFilter
    );

    cocl::dnn::gemm_im2col::cudnnConvolutionBackwardBias(
        dnn_handle,
        &alpha,
        outputDesc, gpuDeviceOutput,
        &beta,
        gradBiasDesc, gpuDeviceGradBias
    );

    float *gpuGradFilterHostside = new float[filterLinearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, gradFilterOffsetBytes,
                                     (filterLinearSize) * sizeof(float), gpuGradFilterHostside, 0, NULL, NULL);
    EasyCL::checkError(err);

    float *gpuGradBiasHostside = new float[biasLinearSize];
    err = clEnqueueReadBuffer(v->currentContext->default_stream.get()->clqueue->queue, gpuMemory->clmem, CL_TRUE, gradBiasOffsetBytes,
                                     (biasLinearSize) * sizeof(float), gpuGradBiasHostside, 0, NULL, NULL);
    EasyCL::checkError(err);
    EasyCL::checkError(clFinish(v->currentContext->default_stream.get()->clqueue->queue));

    const int numSamples = 20;
    int *sampleIndices = new int[numSamples];
    fillRandomInt(random, sampleIndices, numSamples, 0, filterLinearSize);
    bool allOk = true;
    for(int i = 0; i < numSamples; i++) {
        int linearPos = sampleIndices[i];
        int inc = linearPos / outC / kH / kW;
        int rem = linearPos - inc * outC * kH * kW;
        int outc = rem / kH / kW;
        rem = rem - outc * kH * kW;
        int dh = rem / kW;
        int dw = rem % kW;
        cout << "inc=" << inc << " outc=" << outc << " dh=" << dh << " dw=" << dw << " gradFilters[" << linearPos << "]="
            << gradFilters[linearPos] << " " << gpuGradFilterHostside[linearPos] << endl;
        if(abs(gradFilters[linearPos] - gpuGradFilterHostside[linearPos]) > 1e-4 * N) {
            allOk = false;
            cout << string("test_dnn, output of conv backward filter, mismatch for ") +
                "inc=" + toString(inc) + " outc=" + toString(outc) + " dh=" + toString(dh) + " dw=" + toString(dw) << endl;
        }
    }
    for(int outc = 0; outc < outC; outc++) {
        cout << "gradBias[" << outc << "] cpu=" << gradBias[outc] << " gpus=" << gpuGradBiasHostside[outc] <<  endl;
        if(abs(gradBias[outc] - gpuGradBiasHostside[outc]) > 1e-4 * outH * outW * inC) {
            allOk = false;
            cout << "    MISMATCH" << endl;
        }
    }
    if(!allOk) {
        throw runtime_error(string("FAILED"));
    }

    cudnnDestroyFilterDescriptor(filterDesc);
    cudnnDestroyConvolutionDescriptor(convDesc);
    cudnnDestroyTensorDescriptor(inputDesc);
    cudnnDestroyTensorDescriptor(outputDesc);
    cudnnDestroyFilterDescriptor(gradFilterDesc);
    cudnnDestroyTensorDescriptor(gradBiasDesc);
    cudnnDestroy(dnn_handle);

    delete gpuMemory;
    delete[] gpuGradFilterHostside;
    delete[] gpuGradBiasHostside;

    delete[] outImages;
    delete[] filters;
    delete[] inImages;
    delete[] gradFilters;
    delete[] gradBias;
}

} // namespace
