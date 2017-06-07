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

#include "function_dumper.h"

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

LLVMContext context;
unique_ptr<Module>M;

string ll_path = "../test/gtest/test_function_dumper.ll";  // this is a bit hacky, but fine-ish for now

class GlobalWrapper {
public:
    GlobalWrapper() :
            typeDumper(&globalNames)
        {
        context.reset(new LLVMContext());
        SMDiagnostic smDiagnostic;
        M = parseIRFile(ll_path, smDiagnostic, *context);
        if(!M) {
            smDiagnostic.print("irtopencl", errs());
            // return "";
            throw runtime_error("failed to parse IR");
        }
    }
    virtual ~GlobalWrapper() {
        M.release();
        context.release();
    }
    Module *getM() {
        return M.get();
    }
    Function *getFunction(string name) {
        // Module *M = getM();
        getM();
        Function *F = M->getFunction(name);
        if(F == 0) {
            throw runtime_error("Function " + name + " not found");
        }
        return F;
    }

    unique_ptr<LLVMContext> context;
    unique_ptr<Module> M;

    GlobalNames globalNames;
    TypeDumper typeDumper;
    FunctionNamesMap functionNamesMap;

    map<Function *, Type *>returnTypeByFunction;
};

class LocalWrapper {
public:
    LocalWrapper(GlobalWrapper &G, string functionName, int numClmems, vector<int> &clmemIndexes) :
        G(G),
        F(G.getFunction(functionName)),
        functionDumper(
            G.M.get(), F, functionName, true, numClmems, clmemIndexes, &G.globalNames, &G.typeDumper, &G.functionNamesMap, true) {
            // &emptyStringMap) {
    }
    LocalWrapper(GlobalWrapper &G, Function *F, int numClmems, vector<int> &clmemIndexes) :
        G(G),
        F(F),
        functionDumper(
            G.M.get(), F, F->getName().str(), true, numClmems, clmemIndexes, &G.globalNames, &G.typeDumper, &G.functionNamesMap, true) {
            // &emptyStringMap) {
    }
    virtual ~LocalWrapper() {
    }
    bool runGeneration() {
        return functionDumper.runGeneration(G.returnTypeByFunction);
    }

    GlobalWrapper &G;

    Function *F;

    LocalNames localNames;
    FunctionDumper functionDumper;
    // std::map<std::string, std::string> emptyStringMap;
};

TEST(test_function_dumper, basic1) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    c.push_back(1);
    LocalWrapper wrapper(G, "someKernel", 2, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void someKernel(global char* clmem0, unsigned long clmem_vmem_offset0, global char* clmem1, unsigned long clmem_vmem_offset1, uint d1_offset, uint d2_offset, local int *scratch) {
    global float* d2 = (global float*)(clmem1 + d2_offset);
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v4;
    float* v2[1];
    float* v3;

v1:;
    v3 = v2[0];
    v4 = someFunc_gp(d1, v3, pGlobalVars);
    return;
}
)", os.str());

    for(auto it=functionDumper->neededFunctions.begin(); it != functionDumper->neededFunctions.end(); it++) {
        Function *childF = *it;
        cout << "needed function call: " << childF->getName().str() << endl;
    }
    ASSERT_EQ(1u, functionDumper->neededFunctions.size());
    ASSERT_EQ("someFunc_gp", (*functionDumper->neededFunctions.begin())->getName().str());
}
TEST(test_function_dumper, basic1Ints) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    c.push_back(1);
    LocalWrapper wrapper(G, "someKernelInts", 2, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void someKernelInts(global char* clmem0, unsigned long clmem_vmem_offset0, global char* clmem1, unsigned long clmem_vmem_offset1, uint d1_offset, uint d2_offset, local int *scratch) {
    global int* d2 = (global int*)(clmem1 + d2_offset);
    global int* d1 = (global int*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    int v4;
    int* v2[1];
    int* v3;

v1:;
    v3 = v2[0];
    v4 = someFuncInts_gp(d1, v3, pGlobalVars);
    return;
}
)", os.str());

    for(auto it=functionDumper->neededFunctions.begin(); it != functionDumper->neededFunctions.end(); it++) {
        Function *childF = *it;
        cout << "needed function call: " << childF->getName().str() << endl;
    }
    ASSERT_EQ(1u, functionDumper->neededFunctions.size());
    ASSERT_EQ("someFuncInts_gp", (*functionDumper->neededFunctions.begin())->getName().str());
}
TEST(test_function_dumper, redundantclmems) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    c.push_back(0);
    LocalWrapper wrapper(G, "someKernel", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void someKernel(global char* clmem0, unsigned long clmem_vmem_offset0, uint d1_offset, uint d2_offset, local int *scratch) {
    global float* d2 = (global float*)(clmem0 + d2_offset);
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v4;
    float* v2[1];
    float* v3;

v1:;
    v3 = v2[0];
    v4 = someFunc_gp(d1, v3, pGlobalVars);
    return;
}
)", os.str());

    for(auto it=functionDumper->neededFunctions.begin(); it != functionDumper->neededFunctions.end(); it++) {
        Function *childF = *it;
        cout << "needed function call: " << childF->getName().str() << endl;
    }
    ASSERT_EQ(1u, functionDumper->neededFunctions.size());
    ASSERT_EQ("someFunc_gp", (*functionDumper->neededFunctions.begin())->getName().str());
}
TEST(test_function_dumper, usesShared1) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "usesShared", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void usesShared(global char* clmem0, unsigned long clmem_vmem_offset0, uint d1_offset, local int *scratch) {
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v7[1];
    float v8;
    local float mysharedmem[8];
    local float* v2;

v1:;
    v2 = (&((&mysharedmem)[0][3]));
    v8 = v7[0];
    v2[0] = v8;
    return;
}
)", os.str());
}

TEST(test_function_dumper, usesShared2) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "usesShared2", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void usesShared2(global char* clmem0, unsigned long clmem_vmem_offset0, uint d1_offset, local int *scratch) {
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v11[1];
    float v13;
    int v12[1];
    int v14;
    local float mysharedmem[8];
    local float* v2;
    local int anothershared[12];
    local int* v7;

v1:;
    v2 = (&((&mysharedmem)[0][3]));
    v7 = (&((&anothershared)[0][7]));
    v13 = v11[0];
    v14 = v12[0];
    v2[0] = v13;
    v7[0] = v14;
    return;
}
)", os.str());
}

TEST(test_function_dumper, usesPointerFunction) {
    GlobalWrapper G;

    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "usesPointerFunction", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res;
    ostringstream os;

    res = wrapper.runGeneration();
    EXPECT_FALSE(res);
    EXPECT_FALSE(functionDumper->generationDone());

    for(auto it = functionDumper->neededFunctions.begin(); it != functionDumper->neededFunctions.end(); it++) {
        Function *F = *it;
        cout << "needed function: [" << F->getName().str() << "]" << endl;
    }
    EXPECT_EQ(1u, functionDumper->neededFunctions.size());
    Function *neededFunction = *functionDumper->neededFunctions.begin();
    EXPECT_EQ("returnsPointer_g", neededFunction->getName().str());
    neededFunction->dump();

    LocalWrapper wrapper2(G, neededFunction, 1, c);
    Function *F2 = neededFunction;
    FunctionDumper *functionDumper2 = &wrapper2.functionDumper;
    F2->dump();

    res = wrapper2.runGeneration();
    EXPECT_TRUE(res);
    EXPECT_TRUE(functionDumper2->generationDone());

    os.str("");
    functionDumper2->toCl(os);
    cout << "cl, F2: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel global float* returnsPointer_g(global char* clmem0, unsigned long clmem_vmem_offset0, uint in_offset, local int *scratch) {
    global float* in = (global float*)(clmem0 + in_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;


v1:;
    return in;
}
)", os.str());

    cout << "functionDumper2->returnType:" << endl;
    functionDumper2->returnType->dump();

    G.returnTypeByFunction[neededFunction] = functionDumper2->returnType;

    res = wrapper.runGeneration();
    EXPECT_TRUE(res);
    EXPECT_TRUE(functionDumper->generationDone());

    os.str("");
    functionDumper->toCl(os);
    cout << "cl, F: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void usesPointerFunction(global char* clmem0, unsigned long clmem_vmem_offset0, uint in_offset, local int *scratch) {
    global float* in = (global float*)(clmem0 + in_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    global float* v2;

v1:;
    v2 = returnsPointer_g(in, pGlobalVars);
    return;
}
)", os.str());
}

TEST(test_function_dumper, returnsFloatConstant) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "returnsFloatConstant", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel float returnsFloatConstant(global char* clmem0, unsigned long clmem_vmem_offset0, uint in_offset, local int *scratch) {
    global float* in = (global float*)(clmem0 + in_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;


v1:;
    return 4.5f;
}
)", os.str());
}

TEST(test_function_dumper, testBranches_nophi) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "testBranches_nophi", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void testBranches_nophi(global char* clmem0, unsigned long clmem_vmem_offset0, uint d1_offset, local int *scratch) {
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v3;
    float v6[1];

v1:;
    v3 = 3.0f + 4.0f;
    v6[0] = v3;
    goto v2;
v2:;
    if (5.0f + 7.0f > 6.0f) {
        goto v1;
    } else {
        goto v2;
    }
}
)", os.str());
}

TEST(test_function_dumper, testBranches_onephi) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "testBranches_onephi", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void testBranches_onephi(global char* clmem0, unsigned long clmem_vmem_offset0, uint d1_offset, local int *scratch) {
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v3;
    float v6;
    float v7;

v1:;
    v3 = 3.0f + 4.0f;
    v6 = v3;
    goto v2;
v2:;
    v7 = v6 + 7.0f;
    if (v7 > 6.0f) {
        goto v1;
    } else {
        v6 = v7;
        goto v2;
    }
}
)", os.str());
}

TEST(test_function_dumper, testBranches_phifromfuture) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "testBranches_phifromfuture", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void testBranches_phifromfuture(global char* clmem0, unsigned long clmem_vmem_offset0, uint d1_offset, local int *scratch) {
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

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
)", os.str());
}

TEST(test_function_dumper, testBranches_phifromfloat) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "testBranches_phifromfloat", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void testBranches_phifromfloat(global char* clmem0, unsigned long clmem_vmem_offset0, uint d1_offset, local int *scratch) {
    global float* d1 = (global float*)(clmem0 + d1_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v13;
    float v8;
    float v9;

v1:;
    v8 = 123.0f;
    goto v2;
v2:;
    v9 = v8 + 7.0f;
    if (v9 > 6.0f) {
        goto v1;
    } else {
        v8 = v9;
        goto v2;
    }
v3:;
    v13 = 8.0f + 2.0f;
    v8 = v13;
    goto v2;
}
)", os.str());
}

TEST(test_function_dumper, multigpu_Z8getValuePf) {
    GlobalWrapper G;
    vector<int> c;
    c.push_back(0);
    LocalWrapper wrapper(G, "multigpu_Z8getValuePf", 1, c);
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void multigpu_Z8getValuePf(global char* clmem0, unsigned long clmem_vmem_offset0, uint outdata_offset, local int *scratch) {
    global float* outdata = (global float*)(clmem0 + outdata_offset);

    const struct GlobalVars globalVars = { scratch, clmem0, clmem_vmem_offset0 };
    const struct GlobalVars* const pGlobalVars = &globalVars;

    float v10;
    float v15;
    float v21;
    float v22;
    float v27;
    float v7;
    int v23;
    int v5;

v1:;
    v5 = 1;
    v7 = 0.0f;
    goto v3;
v3:;
    v10 = (&(outdata[(long)v5]))[0];
    v15 = (&(outdata[(long)(v5 + 1)]))[0];
    v21 = (&(outdata[(long)(v5 + 2)]))[0];
    v22 = ((v7 + v10) + v15) + v21;
    v23 = v5 + 3;
    if ((v23) == (1024)) {
        v27 = v22;
        goto v2;
    } else {
        v5 = v23;
        v7 = v22;
        goto v3;
    }
v2:;
    outdata[0] = v27;
    return;
}
)", os.str());
}

} // namespace
