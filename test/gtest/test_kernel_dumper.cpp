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

    // KernelDumper kernelDumper(M, "someKernel");

    string cl = kernelDumper->toCl();
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(
float someFunc_gg(global float* d1, global float* v11, local int *scratch);
float someFunc_gp(global float* d1, float* v11, local int *scratch);
float someFunc_pg(float* d1, global float* v11, local int *scratch);
kernel void someKernel(global float* d1, long d1_offset, global float* d2, long d2_offset, local int *scratch);

kernel void someKernel(global float* d1, long d1_offset, global float* d2, long d2_offset, local int *scratch) {
    d2 += d2_offset;
    d1 += d1_offset;

    float v4;
    float v5;
    float v6;
    float* v2[1];
    float* v3;

v1:;
    v3 = v2[0];
    v4 = someFunc_gp(d1, v3);
    v5 = someFunc_pg(v3, d1);
    v6 = someFunc_gg(d1, d1);
    return;
}
float someFunc_pg(float* d1, global float* v11, local int *scratch) {
    float v5;
    float* v6;

v1:;
    v5 = d1[0];
    v6 = (&d1[3]);
    v6[0] = v5;
    return 4.5f;
}
float someFunc_gg(global float* d1, global float* v11, local int *scratch) {
    float v5;
    global float* v6;

v1:;
    v5 = d1[0];
    v6 = (&d1[3]);
    v6[0] = v5;
    return 4.5f;
}
float someFunc_gp(global float* d1, float* v11, local int *scratch) {
    float v5;
    global float* v6;

v1:;
    v5 = d1[0];
    v6 = (&d1[3]);
    v6[0] = v5;
    return 4.5f;
}
)", cl);
}

TEST(test_kernel_dumper, kernelBranches) {
    GlobalWrapper G("kernelBranches");
    KernelDumper *kernelDumper = G.kernelDumper.get();
    // Module *M = getM();

    // GlobalNames globalNames;
    // LocalNames localNames;
    // TypeDumper typeDumper(&globalNames);
    // FunctionNamesMap functionNamesMap;
    // FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);

    // KernelDumper kernelDumper(M, "kernelBranches");
    string cl = kernelDumper->toCl();
    cout << "kernel cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(
kernel void kernelBranches(global float* d1, long d1_offset, local int *scratch);

kernel void kernelBranches(global float* d1, long d1_offset, local int *scratch) {
    d1 += d1_offset;


v1:;
v2:;
    if (5.0f + 7.0f > 6.0f) {
        goto v1;
    } else {
        goto v2;
    }
}
)", cl);
}

/*

TEST(test_kernel_dumper, usesPointerFunction) {
    Module *M = getM();

    // GlobalNames globalNames;
    // LocalNames localNames;
    // TypeDumper typeDumper(&globalNames);
    // FunctionNamesMap functionNamesMap;
    // FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);

    KernelDumper kernelDumper(M, "usesPointerFunction");
    string cl = kernelDumper.toCl();
    cout << "kernel cl:\n" << cl << endl;
    ASSERT_TRUE(cl.find("returnsPointer") != string::npos);
}
*/

} // namespace
