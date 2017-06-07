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

namespace {

string ll_path = "../test/gtest/test_block_dumper.ll";  // this is a bit hacky, but fine-ish for now

class GlobalWrapper {
public:
    GlobalWrapper() {
        context.reset(new LLVMContext());
        // M.reset(new Module("mymodule", *context));

        SMDiagnostic smDiagnostic;
        M = parseIRFile(StringRef(ll_path), smDiagnostic, *context);
        if(!M) {
            smDiagnostic.print("irtopencl", errs());
            // return "";
            throw runtime_error("failed to parse IR");
        }
        typeDumper.reset(new TypeDumper(&globalNames));
    }
    virtual ~GlobalWrapper() {
        typeDumper.release();
        M.release();
        context.release();
    }

    Module *getM() {
        return M.get();
    }

    Function *getFunction(string name) {
        // Module *M = getM();
        // getM();
        Function *F = M->getFunction(StringRef(name));
        if(F == 0) {
            throw runtime_error("Function " + name + " not found");
        }
        return F;
    }

    unique_ptr<LLVMContext> context;
    unique_ptr<Module> M;

    GlobalNames globalNames;
    unique_ptr<TypeDumper> typeDumper;
    FunctionNamesMap functionNamesMap;
    std::map<llvm::Value *, std::string> globalExpressionByValue;

    map<Function *, Type *>returnTypeByFunction;
};

class LocalWrapper {
public:
    LocalWrapper(GlobalWrapper &G, string functionName) :
            G(G) {
        F = G.getFunction(functionName);
        block = &*F->begin();
        blockDumper.reset(new BasicBlockDumper(
            G.M.get(),
            block, &G.globalNames, &localNames, G.typeDumper.get(), &G.functionNamesMap,
            &G.globalExpressionByValue, &localValueInfos
        ));
        for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
            Argument *arg = &*it;
            // sring name = localNames.getOrCreateName(arg, arg->getName().str());
            arg->dump();
            LocalValueInfo *localValueInfo = LocalValueInfo::getOrCreate(
                &localNames, &localValueInfos, arg, arg->getName().str());
            localValueInfo->setExpression(localValueInfo->name);
        }
    }
    bool runGeneration() {
        return blockDumper->runGeneration(G.returnTypeByFunction);
    }
    // bool runGeneration(map<Function *, Type *> &returnTypeByFunction) {
    //     return blockDumper->runGeneration(returnTypeByFunction);
    // }

    GlobalWrapper &G;

    Function *F = 0;
    BasicBlock *block = 0;
    LocalNames localNames;
    std::map<llvm::Value *, std::unique_ptr<cocl::LocalValueInfo> > localValueInfos;
    // std::map<std::string, std::string> emptyStringMap;

    unique_ptr<BasicBlockDumper> blockDumper;
};

TEST(test_block_dumper, basic) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "main");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    ostringstream oss;
    wrapper.runGeneration();

    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << cl << endl;
    string expectedBlockCl = R"(    v2 = (5 + 3) + 7;
    v3 = 8.0f + 3.0f;
    v4 = v3 + 9.0f;
    v5 = v4 / v3;
    v7 = v6[0];
    v8[0] = v5;
    v16 = v7;
    v17 = v7;
    v18 = (int)v4;
    v19 = (int)v4;
    v20 = (float)v2;
    v21 = (float)v2;
    v26 = v25[0];
    v26.f0 = 4;
    v26.f1 = 1.5f;
    v29 = v26;
    v33 = (v2 < 4) ? 21 : 44;
    v8[0] = v3;
    v8[0] = v4;
    v34[0] = v16;
    v34[0] = v17;
    v6[0] = v18;
    v6[0] = v19;
    v8[0] = v20;
    v8[0] = v21;
    structs[0] = v29;
    v6[0] = v33;
)";
    // ASSERT_EQ(expectedBlockCl, cl);

//     cout << "alloca declrations:" << endl;
//     cout << blockDumper->getAllocaDeclarations("    ") << endl;
//     string expectedAllocaDeclarations = R"(    int v6[1];
//     float v8[1];
//     struct mystruct v25[1];
//     long v34[1];
// )";
    // ASSERT_EQ(expectedAllocaDeclarations, blockDumper.getAllocaDeclarations("    "));

    cout << "variable declarations:" << endl;
    // ostringstream oss;
    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << oss.str() << endl;

    // ASSERT_EQ(14u, blockDumper.variablesToDeclare.size());
    // set<string> declaredVariableStrings;
    // for(auto it=blockDumper.variablesToDeclare.begin(); it != blockDumper.variablesToDeclare.end(); it++) {
    //     ostringstream os;
    //     Value *v = *it;
    //     blockDumper.writeDeclaration(os, v);
    //     declaredVariableStrings.insert(os.str());
    // }
    // ASSERT_TRUE(declaredVariableStrings.find("struct mystruct v26") != declaredVariableStrings.end());
    // // ASSERT_TRUE(declaredVariableStrings.find("struct mystruct v28") != declaredVariableStrings.end());
    // ASSERT_TRUE(declaredVariableStrings.find("struct mystruct v29") != declaredVariableStrings.end());
    // ASSERT_TRUE(declaredVariableStrings.find("float v3") != declaredVariableStrings.end());
    // ASSERT_TRUE(declaredVariableStrings.find("float v4") != declaredVariableStrings.end());
    // ASSERT_TRUE(declaredVariableStrings.find("int v7") != declaredVariableStrings.end());

    // cout << blockDumper->writeDeclarations("    ") << endl;
//     string expectedDeclarations = R"(    int v2;
//     float v3;
//     float v4;
//     int v7;
//     struct mystruct v26;
//     struct mystruct v28;
//     struct mystruct v29;
// )";
//     ASSERT_EQ(expectedDeclarations, blockDumper->writeDeclarations("    "));
}

TEST(test_block_dumper, basic2) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "someKernel");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    wrapper.runGeneration();
    ostringstream oss;

    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl:\n" << cl << endl;
    cout << "declarations:" << endl;
    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << oss.str() << endl;
    // cout << "allocas: \n" << blockDumper.getAllocaDeclarations("    ") << endl;

    for(auto it=blockDumper->neededFunctions.begin(); it != blockDumper->neededFunctions.end(); it++) {
        cout << "called function " << (*it)->getName().str() << endl;
    }
    ASSERT_EQ(1u, blockDumper->neededFunctions.size());
    Function *neededFunction = *blockDumper->neededFunctions.begin();
    neededFunction->dump();
    cout << endl;
    cout << neededFunction->getName().str() << endl;
    ASSERT_EQ("someFunc_gp", neededFunction->getName().str());
    // ASSERT_EQ(getFunction("someFunc"), *blockDumper.neededFunctions.begin());
}

TEST(test_block_dumper, usesShared) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "usesShared");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    wrapper.runGeneration();
    ostringstream oss;

    oss.str("");
    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl: [" << cl << "]" << endl;
    ASSERT_EQ(R"(    v5 = (&((&mysharedmem)[0][0]));
    v7 = (&((&mysharedmem)[0][2]));
    v5[0] = 4.0f;
    v7[0] = 3.0f;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    ASSERT_EQ(R"(    local float mysharedmem[8];
    local float* v5;
    local float* v7;
)", oss.str());
}

TEST(test_block_dumper, usesPointerFunction) {
    GlobalWrapper G;

    LocalWrapper wrapper(G, "usesPointerFunction");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    // map<Function *, Type *> returnTypeByFunction;
    bool dumpCompleted = wrapper.runGeneration();
    EXPECT_FALSE(dumpCompleted);

    ostringstream oss;

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"()", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"()", oss.str());

    cout << "=========" << endl;

    cout << "dumping function returnsPointer" << endl;

    LocalWrapper wrapper2(G, "returnsPointer");
    BasicBlockDumper *blockDumper2 = wrapper2.blockDumper.get();

    dumpCompleted = wrapper2.runGeneration();
    EXPECT_TRUE(dumpCompleted);

    oss.str("");
    blockDumper2->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"()", oss.str());

    oss.str("");
    blockDumper2->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"()", oss.str());

    cout << "=========" << endl;
    cout << "redumping function usesPointerFunction" << endl;

    G.returnTypeByFunction[wrapper2.F] = PointerType::get(Type::getFloatTy(*G.context), 0);
    dumpCompleted = wrapper.runGeneration();
    EXPECT_TRUE(dumpCompleted);

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v1 = returnsPointer(in, pGlobalVars);
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float* v1;
)", oss.str());

}

TEST(test_block_dumper, containsLlvmDebug) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "containsLlvmDebug");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    wrapper.runGeneration();
    ostringstream oss;

    cout << "instr0" << endl;
    oss.str("");
    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"()", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"()", oss.str());
}

TEST(test_block_dumper, usestructs) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "usestructs");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    ostringstream oss;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    cout << "instr0" << endl;
    oss.str("");
    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl: [" << cl << "]" << endl;
    ASSERT_EQ(R"()", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    ASSERT_EQ(R"(    struct mystruct v1[1];
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr1" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    ASSERT_EQ(R"(    v2 = v1[0];
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    ASSERT_EQ(R"(    struct mystruct v1[1];
    struct mystruct v2;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr2" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr3" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v5[1];
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr4" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
    v6 = v5[0];
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v5[1];
    float v6;
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr5" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
    v6 = v5[0];
    v3[0] = v6;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v5[1];
    float v6;
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
)", oss.str());


    cout << "\n=======================" << endl;
    cout << "instr6" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
    v6 = v5[0];
    v3[0] = v6;
    v8.f0 = 45;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v5[1];
    float v6;
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
    struct mystruct v8;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr7" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
    v6 = v5[0];
    v3[0] = v6;
    v8.f0 = 45;
    v8.f1 = 3.5f;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v5[1];
    float v6;
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
    struct mystruct v8;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr8" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
    v6 = v5[0];
    v3[0] = v6;
    v8.f0 = 45;
    v8.f1 = 3.5f;
    structs[0] = v8;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v5[1];
    float v6;
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
    struct mystruct v8;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr9" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
    v6 = v5[0];
    v3[0] = v6;
    v8.f0 = 45;
    v8.f1 = 3.5f;
    structs[0] = v8;
    v13 = v8.f1;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v13;
    float v5[1];
    float v6;
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
    struct mystruct v8;
)", oss.str());

    cout << "\n=======================" << endl;
    cout << "instr10" << endl;

    (*blockDumper->instruction_it).dump();
    blockDumper->maxInstructionsToGenerate = 1;
    wrapper.runGeneration();

    oss.str("");
    blockDumper->toCl(oss);
    cout << "cl: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = (&(v1[0].f1));
    v6 = v5[0];
    v3[0] = v6;
    v8.f0 = 45;
    v8.f1 = 3.5f;
    structs[0] = v8;
    v13 = v8.f1;
    v3[0] = v13;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v13;
    float v5[1];
    float v6;
    float* v3;
    struct mystruct v1[1];
    struct mystruct v2;
    struct mystruct v8;
)", oss.str());

}

TEST(test_block_dumper, storefloat) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "storefloat");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    wrapper.runGeneration();
    ostringstream oss;

    oss.str("");
    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl: [" << cl << "]" << endl;
    ASSERT_EQ(R"(    v1 = 5.0f + 3.0f;
    data[0] = v1;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    ASSERT_EQ(R"(    float v1;
)", oss.str());
}

TEST(test_block_dumper, test_bitcast) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "test_bitcast");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    wrapper.runGeneration();
    ostringstream oss;

    oss.str("");
    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(    v1 = 5.0f + 3.0f;
    v4 = *(int *)&(v1);
    data[0] = v4;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float v1;
    int v4;
)", oss.str());
}

TEST(test_block_dumper, test_ieee_doubles) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "test_ieee_doubles");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    wrapper.runGeneration();
    ostringstream oss;

    oss.str("");
    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(    data[0] = 1.84422e+19f;
    v3 = (&(data[0]));
    v3[0] = 9.21887e+18f;
    v7 = (&(data[1]));
    v7[0] = -INFINITY;
    v11 = (&(data[2]));
    v11[0] = INFINITY;
    v15 = (&(data[3]));
    v15[0] = -INFINITY;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    float* v11;
    float* v15;
    float* v3;
    float* v7;
)", oss.str());
}

TEST(test_block_dumper, test_randomintarray) {
    GlobalWrapper G;
    LocalWrapper wrapper(G, "test_randomintarray");
    BasicBlockDumper *blockDumper = wrapper.blockDumper.get();

    wrapper.runGeneration();
    ostringstream oss;

    oss.str("");
    blockDumper->toCl(oss);
    string cl = oss.str();
    cout << "cl: [" << cl << "]" << endl;
    EXPECT_EQ(R"(    v2 = v1[0];
    v3 = v2.f0;
    v8 = (v3[0] + v3[1]) + v3[2];
    data[0] = v8;
)", oss.str());

    oss.str("");
    blockDumper->writeDeclarations("    ", oss);
    // cout << oss.str() << endl;
    cout << "declarations: [" << oss.str() << "]" << endl;
    EXPECT_EQ(R"(    int v8;
    int* v3;
    struct class_tensorflow__random__Array v1[1];
    struct class_tensorflow__random__Array v2;
)", oss.str());
}

} // namespace
