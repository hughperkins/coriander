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

#include "kernel_dumper.h"

#include "type_dumper.h"
#include "GlobalNames.h"
#include "LocalNames.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>

#include "gtest/gtest.h"

using namespace std;
using namespace cocl;
using namespace llvm;

namespace {

string ll_path = "../test/gtest/test_kernel_dumper.ll";  // this is a bit hacky, but fine-ish for now

std::string runKernelDumper(KernelDumper *kernelDumper, int numClmemArgs) {
    // assumes all args unique
    vector<int> clmemIndexByClmemArgIndex;
    for(int i = 0; i < numClmemArgs; i++) {
        clmemIndexByClmemArgIndex.push_back(i);
    }
    std::string cl = kernelDumper->toCl(numClmemArgs, clmemIndexByClmemArgIndex);
    return cl;
}

class GlobalWrapper {
public:
    GlobalWrapper(string kernelName) {
        context.reset(new LLVMContext());
        SMDiagnostic smDiagnostic;
        M = parseIRFile(ll_path, smDiagnostic, *context);
        if(!M) {
            smDiagnostic.print("irtopencl", errs());
            throw runtime_error("failed to parse IR");
        }
        kernelDumper.reset(new KernelDumper(M.get(), kernelName));
    }
    virtual ~GlobalWrapper() {
        kernelDumper.release();
        M.release();
        context.release();
    }
    Module *getM() {
        return M.get();
    }
    unique_ptr<LLVMContext> context;
    unique_ptr<Module>M;
    unique_ptr<KernelDumper> kernelDumper;
};

TEST(test_kernel_dumper, basic) {
    GlobalWrapper G("someKernel");
    KernelDumper *kernelDumper = G.kernelDumper.get();

    // string cl = kernelDumper->toCl();
    string cl = runKernelDumper(kernelDumper, 2);
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(
float someFunc_gg(global float* d1, global float* v11, local int *scratch);
float someFunc_gp(global float* d1, float* v11, local int *scratch);
float someFunc_pg(float* d1, global float* v11, local int *scratch);
kernel void someKernel(global float* d1, uint d1_offset, global float* d2, uint d2_offset, local int *scratch);

kernel void someKernel(global float* d1, uint d1_offset, global float* d2, uint d2_offset, local int *scratch) {
    d2 += d2_offset;
    d1 += d1_offset;

    float v4;
    float v5;
    float v6;
    float* v2[1];
    float* v3;

v1:;
    v3 = v2[0];
    v4 = someFunc_gp(d1, v3, scratch);
    v5 = someFunc_pg(v3, d1, scratch);
    v6 = someFunc_gg(d1, d1, scratch);
    return;
}
float someFunc_gg(global float* d1, global float* v11, local int *scratch) {
    float v5;
    global float* v6;

v1:;
    v5 = d1[0];
    v6 = (&(d1[3]));
    v6[0] = v5;
    return 4.5f;
}
float someFunc_gp(global float* d1, float* v11, local int *scratch) {
    float v5;
    global float* v6;

v1:;
    v5 = d1[0];
    v6 = (&(d1[3]));
    v6[0] = v5;
    return 4.5f;
}
float someFunc_pg(float* d1, global float* v11, local int *scratch) {
    float v5;
    float* v6;

v1:;
    v5 = d1[0];
    v6 = (&(d1[3]));
    v6[0] = v5;
    return 4.5f;
}
)", cl);
}

TEST(test_kernel_dumper, redundant_clmems1) {
    GlobalWrapper G("someKernel");
    KernelDumper *kernelDumper = G.kernelDumper.get();

    // string cl = runKernelDumper(kernelDumper, 2);
    vector<int> argIndexes;
    argIndexes.push_back(0);
    argIndexes.push_back(0);
    string cl = kernelDumper->toCl(1, argIndexes);
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(
float someFunc_gg(global float* d1, global float* v11, local int *scratch);
float someFunc_gp(global float* d1, float* v11, local int *scratch);
float someFunc_pg(float* d1, global float* v11, local int *scratch);
kernel void someKernel(global float* d1, uint d1_offset, global float* d2, uint d2_offset, local int *scratch);

kernel void someKernel(global float* d1, uint d1_offset, uint d2_offset, local int *scratch) {
    d2 += d2_offset;
    d1 += d1_offset;

    float v4;
    float v5;
    float v6;
    float* v2[1];
    float* v3;

v1:;
    v3 = v2[0];
    v4 = someFunc_gp(d1, v3, scratch);
    v5 = someFunc_pg(v3, d1, scratch);
    v6 = someFunc_gg(d1, d1, scratch);
    return;
}
float someFunc_gg(global float* d1, global float* v11, local int *scratch) {
    float v5;
    global float* v6;

v1:;
    v5 = d1[0];
    v6 = (&(d1[3]));
    v6[0] = v5;
    return 4.5f;
}
float someFunc_gp(global float* d1, float* v11, local int *scratch) {
    float v5;
    global float* v6;

v1:;
    v5 = d1[0];
    v6 = (&(d1[3]));
    v6[0] = v5;
    return 4.5f;
}
float someFunc_pg(float* d1, global float* v11, local int *scratch) {
    float v5;
    float* v6;

v1:;
    v5 = d1[0];
    v6 = (&(d1[3]));
    v6[0] = v5;
    return 4.5f;
}
)", cl);
}

TEST(test_kernel_dumper, testBranches_phifromfuture) {
    GlobalWrapper G("testBranches_phifromfuture");
    KernelDumper *kernelDumper = G.kernelDumper.get();
    // Module *M = getM();

    // string cl = kernelDumper->toCl();
    string cl = runKernelDumper(kernelDumper, 1);
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(
kernel void testBranches_phifromfuture(global float* d1, uint d1_offset, local int *scratch);

kernel void testBranches_phifromfuture(global float* d1, uint d1_offset, local int *scratch) {
    d1 += d1_offset;

    float v12;
    float v4;
    float v7;
    float v8;

v1:;
    v4 = 3.0f + 4.0f;
    v7 = v4;
    goto v2;
v2:;
    v8 = v7 + 7.0f;
    if (v8 > 6.0f) {
        goto v1;
    } else {
        v7 = v8;
        goto v2;
    }
v3:;
    v12 = 8.0f + 2.0f;
    v7 = v12;
    goto v2;
}
)", cl);

}

TEST(test_kernel_dumper, usesPointerFunction) {
    GlobalWrapper G("usesPointerFunction");
    KernelDumper *kernelDumper = G.kernelDumper.get();
    // Module *M = getM();

    // string cl = kernelDumper->toCl();
    string cl = runKernelDumper(kernelDumper, 1);
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(
float* returnsPointer(float* in, local int *scratch);
global float* returnsPointer_g(global float* in, local int *scratch);
kernel void usesPointerFunction(global float* in, uint in_offset, local int *scratch);

global float* returnsPointer_g(global float* in, local int *scratch) {

v1:;
    return in;
}
float* returnsPointer(float* in, local int *scratch) {

v1:;
    return in;
}
kernel void usesPointerFunction(global float* in, uint in_offset, local int *scratch) {
    in += in_offset;

    float v3[1];
    float* v4;
    global float* v2;

v1:;
    v2 = returnsPointer_g(in, scratch);
    v4 = returnsPointer(v3, scratch);
    return;
}
)", cl);

    EXPECT_TRUE(cl.find("\nfloat* returnsPointer(") != string::npos);
    EXPECT_TRUE(cl.find("\nglobal float* returnsPointer_g(") != string::npos);
}

TEST(test_kernel_dumper, usesFunctionReturningVoid) {
    GlobalWrapper G("usesFunctionReturningVoid");
    KernelDumper *kernelDumper = G.kernelDumper.get();
    // Module *M = getM();

    // string cl = kernelDumper->toCl();
    string cl = runKernelDumper(kernelDumper, 1);
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(
kernel void usesFunctionReturningVoid(global float* in, uint in_offset, local int *scratch);
void returnsVoid_g(global float* in, local int *scratch);

kernel void usesFunctionReturningVoid(global float* in, uint in_offset, local int *scratch) {
    in += in_offset;


v1:;
    returnsVoid_g(in, scratch);
    return;
}
void returnsVoid_g(global float* in, local int *scratch) {

v1:;
    in[0] = 3.0f;
    return;
}
)", cl);

    EXPECT_FALSE(cl.find(" = returnsVoid") != string::npos);
}

TEST(test_kernel_dumper, test_long_conflicting_names) {
    GlobalWrapper G("mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamec");
    KernelDumper *kernelDumper = G.kernelDumper.get();
    // Module *M = getM();

    string cl = runKernelDumper(kernelDumper, 1);
    // string cl = kernelDumper->toCl();
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_TRUE(cl.find(" void mysuperlongfunctionnamemysuperl(") != string::npos);  // kernel name should be exactly 32 characters, simply truncated
    vector<string>splitLine = easycl::split(cl, "\n");
    for(auto it = splitLine.begin(); it != splitLine.end(); it++) {
        string line = *it;
        // cout << "line [" << *it << "]" << endl;
        EXPECT_LE(line.size(), 128u);
    }
    EXPECT_EQ(R"(
kernel void mysuperlongfunctionnamemysuperl(global float* d, uint d_offset, local int *scratch);
void mysuperlongfunctionnamemysup0_g(global float* d, local int *scratch);
void mysuperlongfunctionnamemysup1_g(global float* d, local int *scratch);

kernel void mysuperlongfunctionnamemysuperl(global float* d, uint d_offset, local int *scratch) {
    d += d_offset;


v1:;
    mysuperlongfunctionnamemysup0_g(d, scratch);
    mysuperlongfunctionnamemysup1_g(d, scratch);
    return;
}
void mysuperlongfunctionnamemysup0_g(global float* d, local int *scratch) {

v1:;
    return;
}
void mysuperlongfunctionnamemysup1_g(global float* d, local int *scratch) {

v1:;
    return;
}
)", cl);
}

} // namespace
