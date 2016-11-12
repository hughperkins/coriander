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

#include "basicblockdumper.h"

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

namespace test_block_dumper {

LLVMContext context;
unique_ptr<Module>M;

string ll_path = "../test/gtest/test_block_dumper.ll";  // this is a bit hacky, but fine-ish for now

Module *getM() {
    if(M == nullptr) {
        SMDiagnostic smDiagnostic;
        M = parseIRFile(StringRef(ll_path), smDiagnostic, context);
        if(!M) {
            smDiagnostic.print("irtopencl", errs());
            // return "";
            throw runtime_error("failed to parse IR");
            }
    }
    return M.get();
}

Function *getFunction(string name) {
    // Module *M = getM();
    getM();
    Function *F = M->getFunction(StringRef(name));
    if(F == 0) {
        throw runtime_error("Function " + name + " not found");
    }
    return F;
}

TEST(test_block_dumper, basic) {
    Function *F = getFunction("main");
    F->dump();
    BasicBlock *block = &*F->begin();
    GlobalNames globalNames;
    LocalNames localNames;
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    BasicBlockDumper blockDumper(block, &globalNames, &localNames, &typeDumper, &functionNamesMap);
    string cl = blockDumper.toCl();
    cout << cl << endl;
    string expectedBlockCl = R"(    v2 = (5 + 3) + 7;
    v3 = 8.0f + 3.0f;
    v4 = v3 + 9.0f;
    v7 = v6[0];
    v8[0] = v4 / v3;
    v10 = v3 < 4.0f;
    v11 = v2 < 4;
    v12 = (char)v7;
    v15 = (float)(8.0 + 3.0);
    v16 = v7;
    v17 = v7;
    v18 = *(int *)&v4;
    v19 = *(int *)&v4;
    v20 = *(float *)&v2;
    v21 = *(float *)&v2;
    v22 = (int*)v8;
    v23 = (global float*)v8;
    v24 = *(int *)&(v3);
    v26 = v25[0];
    v27 = v26.f0;
    v26.f0 = 4;
    v28 = v26;
    v28.f1 = 1.5f;
    v29 = v28;
    v30 = (&v25[0].f0);
    v31 = (&v25[0].f1);
    v33 = (v2 < 4) ? 21 : 44;
)";
    ASSERT_EQ(expectedBlockCl, cl);

    cout << "alloca declrations:" << endl;
    cout << blockDumper.getAllocaDeclarations("    ") << endl;
    string expectedAllocaDeclarations = R"(    float v8[1];
    int v6[1];
    struct mystruct v25[1];
)";
    ASSERT_EQ(expectedAllocaDeclarations, blockDumper.getAllocaDeclarations("    "));

    cout << "variable declarations:" << endl;
    cout << blockDumper.writeDeclarations("    ") << endl;
    string expectedDeclarations = R"(    int v2;
    float v3;
    float v4;
    int v7;
    int v18;
    bool v10;
    bool v11;
    char v12;
    double v15;
    long v16;
    long v17;
    int v19;
    float v20;
    float v21;
    int* v22;
    global float* v23;
    int v24;
    struct mystruct v26;
    int v27;
    struct mystruct v28;
    struct mystruct v29;
    int* v30;
    float* v31;
    int v33;
)";
    ASSERT_EQ(expectedDeclarations, blockDumper.writeDeclarations("    "));
}

TEST(test_block_dumper, basic2) {
    Function *F = getFunction("someKernel");
    F->dump();
    BasicBlock *block = &*F->begin();
    GlobalNames globalNames;
    LocalNames localNames;
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        string name = arg->getName().str();
        Value *value = arg;
        localNames.getOrCreateName(value, name);
    }
    cout << localNames.dumpNames();
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    BasicBlockDumper blockDumper(block, &globalNames, &localNames, &typeDumper, &functionNamesMap);
    string cl = blockDumper.toCl();
    cout << "cl:\n" << cl << endl;
    cout << "allocas: \n" << blockDumper.getAllocaDeclarations("    ") << endl;

    for(auto it=blockDumper.neededFunctionCalls.begin(); it != blockDumper.neededFunctionCalls.end(); it++) {
        cout << "called function " << (*it)->getName().str() << endl;
    }
    ASSERT_EQ(1, blockDumper.neededFunctionCalls.size());
    ASSERT_EQ(getFunction("someFunc"), *blockDumper.neededFunctionCalls.begin());
}

} // test_block_dumper
