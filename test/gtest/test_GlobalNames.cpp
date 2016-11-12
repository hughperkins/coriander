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

#include "GlobalNames.h"

using namespace std;
using namespace cocl;
using namespace llvm;

TEST(test_GlobalNames, test_types) {
    LLVMContext context;
    GlobalNames names;

    Type *v1 = IntegerType::get(context, 32);
    ASSERT_EQ("v1", names.getOrCreateName(v1));

    Type *v2 = IntegerType::get(context, 8);
    ASSERT_EQ("v2", names.getOrCreateName(v2));

    Type *v3 = IntegerType::get(context, 16);
    ASSERT_EQ("v3", names.getOrCreateName(v3));
    ASSERT_EQ("v2", names.getOrCreateName(v2));
    ASSERT_EQ("v1", names.getOrCreateName(v1));

    ASSERT_EQ("v3", names.getOrCreateName(IntegerType::get(context, 16)));
    ASSERT_EQ("v1", names.getOrCreateName(IntegerType::get(context, 32)));
    ASSERT_EQ("v2", names.getOrCreateName(IntegerType::get(context, 8)));


    ASSERT_EQ("myname", names.getOrCreateName(IntegerType::get(context, 4), "myname"));
    ASSERT_EQ("myname1", names.getOrCreateName(IntegerType::get(context, 5), "myname"));
    ASSERT_EQ("myname2", names.getOrCreateName(IntegerType::get(context, 6), "myname"));
}
