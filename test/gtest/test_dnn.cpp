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

} // namespace
