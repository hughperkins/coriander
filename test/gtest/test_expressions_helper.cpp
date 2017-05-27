// Copyright Hugh Perkins 2017

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "ExpressionsHelper.h"

#include <iostream>

#include "gtest/gtest.h"

namespace {

TEST(test_expressions_helper, basic) {
    EXPECT_EQ("v1", cocl::ExpressionsHelper::stripOuterParams("(v1)"));
    EXPECT_EQ("v1", cocl::ExpressionsHelper::stripOuterParams("v1"));
    EXPECT_EQ("v1 + v2", cocl::ExpressionsHelper::stripOuterParams("v1 + v2"));
    EXPECT_EQ("v1 + v2", cocl::ExpressionsHelper::stripOuterParams("(v1 + v2)"));
    EXPECT_EQ("v1 + v2", cocl::ExpressionsHelper::stripOuterParams("((v1 + v2))"));
    EXPECT_EQ("v1 + v2", cocl::ExpressionsHelper::stripOuterParams("(((v1 + v2)))"));
    EXPECT_EQ("(v1 + v2) + (v3 + v4)", cocl::ExpressionsHelper::stripOuterParams("(v1 + v2) + (v3 + v4)"));
    EXPECT_EQ("(v1 + v2) + (v3 + v4)", cocl::ExpressionsHelper::stripOuterParams("((v1 + v2) + (v3 + v4))"));

    EXPECT_EQ("1", cocl::ExpressionsHelper::stripOuterParams("(1)"));
    EXPECT_EQ("1.0f", cocl::ExpressionsHelper::stripOuterParams("(1.0f)"));
    EXPECT_EQ("1.0f", cocl::ExpressionsHelper::stripOuterParams("((1.0f))"));

    EXPECT_EQ(true, cocl::ExpressionsHelper::isValidExpression("v1"));
    EXPECT_EQ(true, cocl::ExpressionsHelper::isValidExpression("(v1)"));
    EXPECT_EQ(false, cocl::ExpressionsHelper::isValidExpression("v1 + v2) + (v3 + v4"));

    EXPECT_EQ(true, cocl::ExpressionsHelper::isSingleExpression("v1"));
    EXPECT_EQ(false, cocl::ExpressionsHelper::isSingleExpression("v1 + v2"));
    EXPECT_EQ(true, cocl::ExpressionsHelper::isSingleExpression("(v1 + v2)"));
    EXPECT_EQ(true, cocl::ExpressionsHelper::isSingleExpression("((v1 + v2))"));
    EXPECT_EQ(false, cocl::ExpressionsHelper::isSingleExpression("(v1 + v2) + (v3 + v4)"));
}

} // namespade
