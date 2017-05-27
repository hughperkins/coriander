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

#pragma once

#include <string>

namespace cocl {

class ExpressionsHelper {
public:
    // see test/gtest/test_expresions_helper.cpp for examples, but essentially removes as many outer parantheses as possible,
    // without changing the meaning of this expression. For example:
    // (v1 + v2)   =>   v1 + v2   // YES, OK
    // but:
    // (v1 + v2) + (v3 + v4)    // NO, CANNOT :-) =>   v1 + v2) + (v3 + v4
    static std::string stripOuterParams(std::string instructionCode);

    // eg "v1 + v2) + (v3 + v4" contains a balanced number of parentheses, but it's
    // not actually a legal expression
    static bool isValidExpression(std::string instructionCode);

    // eg v1 + v2 is two expressions, but
    // (v1 + v2) is one
    static bool isSingleExpression(std::string instructionCode);
};

} // namespace cocl
