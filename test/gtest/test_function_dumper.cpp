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
    LocalWrapper(GlobalWrapper &G, string functionName) :
        G(G),
        F(G.getFunction(functionName)),
        functionDumper(F, true, &G.globalNames, &G.typeDumper, &G.functionNamesMap) {
    }
    LocalWrapper(GlobalWrapper &G, Function *F) :
        G(G),
        F(F),
        functionDumper(F, true, &G.globalNames, &G.typeDumper, &G.functionNamesMap) {
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
};

TEST(test_function_dumper, basic1) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "someKernel");
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void someKernel(global float* d1, long d1_offset, global float* d2, long d2_offset, local int *scratch) {
    d2 += d2_offset;
    d1 += d1_offset;

    float* v2[1];
    float* v3;
    float v4;

v1:;
    v3 = v2[0];
    v4 = someFunc_gp(d1, v3);
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
    LocalWrapper wrapper(G, "usesShared");
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void usesShared(global float* d1, long d1_offset, local int *scratch) {
    d1 += d1_offset;

    local mysharedmem float[8];
    local float* v2;
    float v7[1];
    float v8;

v1:;
    v2 = (&(&mysharedmem)[0][3]);
    v8 = v7[0];
    v2[0] = v8;
    return;
}
)", os.str());
}

TEST(test_function_dumper, usesShared2) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "usesShared2");
    Function *F = wrapper.F;
    FunctionDumper *functionDumper = &wrapper.functionDumper;
    F->dump();

    bool res = wrapper.runGeneration();
    EXPECT_TRUE(res);

    ostringstream os;

    os.str("");
    functionDumper->toCl(os);
    cout << "cl [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel void usesShared2(global float* d1, long d1_offset, local int *scratch) {
    d1 += d1_offset;

    local mysharedmem float[8];
    local anothershared int[12];
    local float* v2;
    local int* v7;
    float v11[1];
    int v12[1];
    float v13;
    int v14;

v1:;
    v2 = (&(&mysharedmem)[0][3]);
    v7 = (&(&anothershared)[0][7]);
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

    LocalWrapper wrapper(G, "usesPointerFunction");
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

    LocalWrapper wrapper2(G, neededFunction);
    Function *F2 = neededFunction;
    FunctionDumper *functionDumper2 = &wrapper2.functionDumper;
    F2->dump();

    res = wrapper2.runGeneration();
    EXPECT_TRUE(res);
    EXPECT_TRUE(functionDumper2->generationDone());

    os.str("");
    functionDumper2->toCl(os);
    cout << "cl, F2: [" << os.str() << "]" << endl;
    EXPECT_EQ(R"(kernel global float* returnsPointer_g(global float* in, long in_offset, local int *scratch) {
    in += in_offset;


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
    EXPECT_EQ(R"(kernel void usesPointerFunction(global float* in, long in_offset, local int *scratch) {
    in += in_offset;

    global float* v2;

v1:;
    v2 = returnsPointer_g(in);
    return;
}
)", os.str());
}

} // namespace
