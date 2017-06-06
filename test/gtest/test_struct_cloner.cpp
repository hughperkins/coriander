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
#include "llvm/IR/Instructions.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <memory>
#include <cassert>

#include "gtest/gtest.h"

#include "type_dumper.h"
#include "GlobalNames.h"
#include "struct_clone.h"

using namespace std;
using namespace cocl;
using namespace llvm;

namespace test_struct_cloner {

LLVMContext context;
unique_ptr<Module>M;

string ll_path = "../test/gtest/test_struct_cloner.ll";  // this is a bit hacky, but fine-ish for now

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
    Module *M = getM();
    // getM();
    Function *F = M->getFunction(StringRef(name));
    if(F == 0) {
        throw runtime_error("Function " + name + " not found");
    }
    return F;
}

TEST(test_struct_cloner, test_clone) {
    Module *M = getM();
    StructType *myStructType = M->getTypeByName(StringRef("struct mystruct"));
    GlobalNames globalNames;
    TypeDumper typeDumper(&globalNames);
    string structCl = typeDumper.dumpType(myStructType);

    string structDefinitions = typeDumper.dumpStructDefinitions();
    cout << "structDefinitions " << structDefinitions << endl;
    ASSERT_NE(structDefinitions.find("int f0;"), string::npos);
    ASSERT_NE(structDefinitions.find("float f1;"), string::npos);
    ASSERT_NE(structDefinitions.find("float* f2;"), string::npos);
    ASSERT_NE(structDefinitions.find("int f3;"), string::npos);
    ASSERT_NE(structDefinitions.find("float* f4;"), string::npos);

    string structDefinition = typeDumper.dumpStructDefinition(myStructType, "foo");
    cout << "structDefinition " << structDefinition << endl;
    ASSERT_NE(structDefinition.find("int f0;"), string::npos);
    ASSERT_NE(structDefinition.find("float f1;"), string::npos);
    ASSERT_NE(structDefinition.find("float* f2;"), string::npos);
    ASSERT_NE(structDefinition.find("int f3;"), string::npos);
    ASSERT_NE(structDefinition.find("float* f4;"), string::npos);

    StructCloner structCloner(&typeDumper, &globalNames);
    StructType *structNoPtrs = structCloner.cloneNoPointers(myStructType);
    string structNoPtrCl = typeDumper.dumpStructDefinition(structNoPtrs, "foo");
    cout << "structNoPtrCl " << structNoPtrCl << endl;
    ASSERT_NE(structNoPtrCl.find("int f0;"), string::npos);
    ASSERT_NE(structNoPtrCl.find("float f1;"), string::npos);
    ASSERT_NE(structNoPtrCl.find("int f2;"), string::npos);

    string clCopyCode = structCloner.writeClCopyToDevicesideStruct(
        myStructType, "src", "dest");
    cout << "clCopyCode " << clCopyCode << endl;
    ASSERT_NE(clCopyCode.find("dest.f0 = src.f0;"), string::npos);
    ASSERT_NE(clCopyCode.find("dest.f1 = src.f1;"), string::npos);
    ASSERT_NE(clCopyCode.find("dest.f3 = src.f2;"), string::npos);

    unique_ptr<Module> hostsideM(new Module(StringRef("hostsideM"), context));
    Function *testFunc = cast<Function>(hostsideM->getOrInsertFunction(
        StringRef("testfunc"),
        Type::getVoidTy(context),
        NULL));
    testFunc->setCallingConv(CallingConv::C);
    BasicBlock *testBlock = BasicBlock::Create(context, "entry", testFunc);
    // testBlock->insertInto(testFunc);

    IRBuilder<> builder(testBlock);

    Value *allocaPtrfull = builder.CreateAlloca(myStructType);
    Value *allocaNoptr = builder.CreateAlloca(structNoPtrs);

    structCloner.writeHostsideIrCopyToMarshallingStruct(
        cast<Instruction>(allocaNoptr), myStructType, allocaPtrfull, allocaNoptr);

    builder.CreateRetVoid();

    verifyFunction(*testFunc);
    verifyModule(*hostsideM);

    std::string testIR;
    raw_string_ostream testIRStream(testIR);
    testIRStream << *hostsideM;
    testIRStream.flush();

    cout << "testIR [" << testIR << "]" << endl;
string expectedIR = R"(; ModuleID = 'hostsideM'
source_filename = "hostsideM"

%"struct mystruct" = type { i32, float, float*, i32, float* }
%"struct mystruct_nopointers" = type { i32, float, i32 }

define void @testfunc() {
entry:
  %0 = alloca %"struct mystruct"
  %1 = alloca %"struct mystruct_nopointers"
  %2 = getelementptr inbounds %"struct mystruct", %"struct mystruct"* %0, i32 0, i32 0
  %3 = getelementptr inbounds %"struct mystruct_nopointers", %"struct mystruct_nopointers"* %1, i32 0, i32 0
  %loadint = load i32, i32* %2
  store i32 %loadint, i32* %3
  %4 = getelementptr inbounds %"struct mystruct", %"struct mystruct"* %0, i32 0, i32 1
  %5 = getelementptr inbounds %"struct mystruct_nopointers", %"struct mystruct_nopointers"* %1, i32 0, i32 1
  %loadint1 = load float, float* %4
  store float %loadint1, float* %5
  %6 = getelementptr inbounds %"struct mystruct", %"struct mystruct"* %0, i32 0, i32 3
  %7 = getelementptr inbounds %"struct mystruct_nopointers", %"struct mystruct_nopointers"* %1, i32 0, i32 2
  %loadint2 = load i32, i32* %6
  store i32 %loadint2, i32* %7
  ret void
}
)";
    cout << "expectedIR: [" << expectedIR << "]" << endl;
    ASSERT_EQ(expectedIR, testIR);
}

} // test_struct_cloner
