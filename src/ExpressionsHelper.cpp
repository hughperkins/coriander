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

#include "ExpressionsHelper.h"

#include <iostream>

using namespace std;

namespace cocl {

std::string ExpressionsHelper::stripOuterParams(string instructionCode) {
    if(instructionCode[0] != '(' || instructionCode[instructionCode.size() - 1] != ')') {
        return instructionCode;
    }
    string innerString = instructionCode.substr(1, instructionCode.size() - 2);
    if(innerString[0] == '&') {
        return instructionCode;
    }
    // COCL_PRINT(cout << "innerString [" << innerString << "]" << endl);
    if(isValidExpression(innerString)) {
        // COCL_PRINT(cout << "stripping braces" << endl);
        return stripOuterParams(innerString);
        // instructionCode = innerString;
    }
    return instructionCode;
}

bool ExpressionsHelper::isSingleExpression(string instructionCode) {
    int depth = 0;
    int len = instructionCode.size();
    for(int pos = 0; pos < len; pos++) {
        char thischar = instructionCode[pos];
        if(thischar == '(') {
            depth++;
        } else if(thischar == ')') {
            depth--;
            if(depth == 0 && pos != len - 1) {
                return false;
            }
        } else if(depth == 0 &&
                thischar != '[' && thischar != ']' &&
                thischar != '_' &&
                thischar != '.' &&
                (thischar < 'a' || thischar > 'z') &&
                (thischar < 'A' || thischar > 'Z') &&
                (thischar < '0' || thischar > '9')) {
            return false;
        }
    }
    return true;
}

bool ExpressionsHelper::isValidExpression(string instructionCode) {
    int depth = 0;
    int len = instructionCode.size();
    for(int pos = 0; pos < len; pos++) {
        char thischar = instructionCode[pos];
        if(thischar == '(') {
            depth++;
        } else if(thischar == ')') {
            depth--;
            if(depth < 0) {
                return false;
            }
        }
    }
    return true;
}

} // namespace cocl
