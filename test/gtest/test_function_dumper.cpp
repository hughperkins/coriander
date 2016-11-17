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

namespace test_function_dumper {

LLVMContext context;
unique_ptr<Module>M;

string ll_path = "../test/gtest/test_function_dumper.ll";  // this is a bit hacky, but fine-ish for now

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

TEST(test_function_dumper, basic) {
    Function *F = getFunction("someKernel");
    F->dump();
    // BasicBlock *block = &*F->begin();
    GlobalNames globalNames;
    LocalNames localNames;
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);
    std::set< llvm::Function *> dumpedFunctions;
    functionDumper.runGeneration(dumpedFunctions);
    ostringstream os;
    functionDumper.toCl(os);
    string cl = os.str();
    cout << "cl:\n" << cl << endl;

    for(auto it=functionDumper.neededFunctions.begin(); it != functionDumper.neededFunctions.end(); it++) {
        Function *childF = *it;
        cout << "needed function call: " << childF->getName().str() << endl;
    }
    ASSERT_EQ(1u, functionDumper.neededFunctions.size());
    ASSERT_EQ("someFunc", (*functionDumper.neededFunctions.begin())->getName().str());
}

TEST(test_function_dumper, usesShared1) {
    Function *F = getFunction("usesShared");
    F->dump();
    // BasicBlock *block = &*F->begin();
    GlobalNames globalNames;
    LocalNames localNames;
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);
    std::set< llvm::Function *> dumpedFunctions;
    functionDumper.runGeneration(dumpedFunctions);
    ostringstream os;
    functionDumper.toCl(os);
    string cl = os.str();
    cout << "cl:\n" << cl << endl;

    ASSERT_EQ(1u, functionDumper.sharedVariablesToDeclare.size());
    string sharedDefinitions = functionDumper.dumpSharedDefinitions("    ");
    cout << "shareddefinitions: " << sharedDefinitions << endl;
    string expected_shared = "    local float mysharedmem[8];\n";
    ASSERT_EQ(expected_shared, sharedDefinitions);
}

TEST(test_function_dumper, usesShared2) {
    Function *F = getFunction("usesShared2");
    F->dump();
    // BasicBlock *block = &*F->begin();
    GlobalNames globalNames;
    LocalNames localNames;
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);
    std::set< llvm::Function *> dumpedFunctions;
    functionDumper.runGeneration(dumpedFunctions);
    ostringstream os;
    functionDumper.toCl(os);
    string cl = os.str();
    cout << "cl:\n" << cl << endl;

    ASSERT_EQ(2u, functionDumper.sharedVariablesToDeclare.size());
    string sharedDefinitions = functionDumper.dumpSharedDefinitions("    ");
    cout << "shareddefinitions: " << sharedDefinitions << endl;
    string expected_shared = R"(    local float mysharedmem[8];
    local int anothershared[12];
)";
    ASSERT_EQ(expected_shared, sharedDefinitions);
}

TEST(test_function_dumper, usesPointerFunction) {
    Function *F = getFunction("usesPointerFunction");
    F->dump();
    // BasicBlock *block = &*F->begin();
    GlobalNames globalNames;
    LocalNames localNames;
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;
    FunctionDumper functionDumper(F, true, &globalNames, &typeDumper, &functionNamesMap);
    std::set< llvm::Function *> dumpedFunctions;
    bool genresult = functionDumper.runGeneration(dumpedFunctions);
    ASSERT_FALSE(genresult);
    ostringstream os;
    functionDumper.toCl(os);
    string cl = os.str();
    cout << "cl:\n" << cl << endl;

    Function *F2 = getFunction("returnsPointer");
    F2->dump();
    FunctionDumper functionDumper2(F2, true, &globalNames, &typeDumper, &functionNamesMap);
    bool genresult2 = functionDumper2.runGeneration(dumpedFunctions);
    ASSERT_TRUE(genresult2);
    ostringstream os2;
    functionDumper2.toCl(os2);
    string cl2 = os2.str();
    cout << "cl2:\n" << cl2 << endl;
}

} // test_block_dumper
