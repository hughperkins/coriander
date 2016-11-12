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
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <memory>
#include <cassert>

#include "gtest/gtest.h"

#include "LocalNames.h"

using namespace std;
using namespace cocl;
using namespace llvm;

TEST(test_LocalNames, test_names) {
    LLVMContext context;

    LocalNames names;

    Value *v1 = new AllocaInst(IntegerType::get(context, 32));
    ASSERT_EQ("v1", names.getOrCreateName(v1));

    Value *v2 = new AllocaInst(IntegerType::get(context, 32));
    ASSERT_EQ("v2", names.getOrCreateName(v2));

    Value *v3 = new AllocaInst(IntegerType::get(context, 32));
    ASSERT_EQ("v3", names.getOrCreateName(v3));

    ASSERT_EQ("v2", names.getOrCreateName(v2));
    ASSERT_EQ("v1", names.getOrCreateName(v1));

    Value *v4 = new AllocaInst(IntegerType::get(context, 32));
    ASSERT_EQ("myname", names.getOrCreateName(v4, "myname"));

    Value *v5 = new AllocaInst(IntegerType::get(context, 32));
    ASSERT_EQ("myname1", names.getOrCreateName(v5, "myname"));

    Value *v6 = new AllocaInst(IntegerType::get(context, 32));
    ASSERT_EQ("myname2", names.getOrCreateName(v6, "myname"));
}
