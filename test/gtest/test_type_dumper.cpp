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

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <memory>
#include <cassert>

#include "gtest/gtest.h"

#include "type_dumper.h"

using namespace std;
using namespace cocl;
using namespace llvm;

LLVMContext context;
unique_ptr<Module>M;

string ll_path = "../test/gtest/test_type_dumper.ll";  // this is a bit hacky, but fine-ish for now

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

TEST(test_type_dumper, type_return) {
    // Function *F = getM()->getFunction("type_return");
    Function *F = getFunction("type_return");
    F->dump();
    BasicBlock *block = &*F->begin();
    Instruction *retInst = &*block->begin();
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "void");
}

TEST(test_type_dumper, add) {
    // Function *F = getM()->getFunction("add");
    Function *F = getFunction("add");
    BasicBlock *block = &*F->begin();
    auto it = block->begin(); // it++; it++;
    Instruction *retInst = &*it;
    retInst->dump();
    cout << endl;
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "int");
}


TEST(test_type_dumper, float32) {
    // Function *F = getM()->getFunction("float32");
    Function *F = getFunction("float32");
    BasicBlock *block = &*F->begin();
    auto it = block->begin(); // it++; it++;
    Instruction *retInst = &*it;
    retInst->dump();
    cout << endl;
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "float");
}


TEST(test_type_dumper, float64) {
    // Function *F = getM()->getFunction("float32");
    Function *F = getFunction("float64");
    BasicBlock *block = &*F->begin();
    auto it = block->begin(); // it++; it++;
    Instruction *retInst = &*it;
    retInst->dump();
    cout << endl;
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "double");
}

TEST(test_type_dumper, pointer_float32) {
    // Function *F = getM()->getFunction("float32");
    Function *F = getFunction("pointer_float32");
    BasicBlock *block = &*F->begin();
    auto it = block->begin(); // it++; it++;
    Instruction *retInst = &*it;
    retInst->dump();
    cout << endl;
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "float*");
}


TEST(test_type_dumper, pointer_globalpfloat) {
    // Function *F = getM()->getFunction("float32");
    Function *F = getFunction("pointer_globalpfloat");
    BasicBlock *block = &*F->begin();
    auto it = block->begin(); it++; // it++; it++;
    Instruction *retInst = &*it;
    retInst->dump();
    cout << endl;
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "global float*");
}


TEST(test_type_dumper, array_int) {
    // Function *F = getM()->getFunction("float32");
    Function *F = getFunction("array_int");
    BasicBlock *block = &*F->begin();
    auto it = block->begin(); it++; // it++; it++;
    Instruction *retInst = &*it;
    retInst->dump();
    cout << endl;
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "int[4]");
}


TEST(test_type_dumper, mystruct) {
    // Function *F = getM()->getFunction("float32");
    Function *F = getFunction("mystruct");
    BasicBlock *block = &*F->begin();
    auto it = block->begin(); it++; // it++; it++;
    Instruction *retInst = &*it;
    retInst->dump();
    cout << endl;
    TypeDumper typeDumper;
    string retType = typeDumper.dumpType(retInst->getType());
    cout << "retType: [" << retType << "]" << endl;

    ASSERT_EQ(retType, "struct mystruct");
    ASSERT_EQ(typeDumper.structsToDefine.size(), 1);
    ASSERT_EQ(typeDumper.structsToDefine.begin()->second, "struct mystruct");
    ASSERT_TRUE(isa<StructType>(typeDumper.structsToDefine.begin()->first));

    string structDefinitions = typeDumper.dumpStructDefinitions();
    cout << "structDefinitions: " << structDefinitions << endl;
    ASSERT_NE(structDefinitions.find("struct mystruct"), string::npos);
    ASSERT_NE(structDefinitions.find("int f0;"), string::npos);
    ASSERT_NE(structDefinitions.find("float f1;"), string::npos);
}
