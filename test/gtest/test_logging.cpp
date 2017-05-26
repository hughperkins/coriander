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

#include "cocl_logging.h"

#include <iostream>

#include "gtest/gtest.h"

using namespace std;

void hierarchicalCall(string someword) {
    cocl::Indentor indentor;
    indentor << "hierarchiacl call someword=[" << someword << "]" << endl;
    if(someword.size() > 0) {
        hierarchicalCall(someword.substr(0, someword.size() - 1));
    }
}

void hierarchicalCall2(string someword) {
    cocl::Indentor indentor;
    indentor << "hierarchiacl call someword=[" << someword << "]" << endl;
    if(someword.size() > 1) {
        int split = (someword.size() + 1) / 2;
        hierarchicalCall2(someword.substr(0, split));
        hierarchicalCall2(someword.substr(split));
    }
}

TEST(test_logging, basic) {
    cout << "start" << endl;
    cocl::Indentor indentor;
    indentor << "a" << endl;

    hierarchicalCall("paris");

    cout << "end" << endl;
}

TEST(test_logging, basic2) {
    cout << "start" << endl;
    cocl::Indentor indentor;
    indentor << "a" << endl;

    hierarchicalCall2("paris");
    hierarchicalCall2("the quick brown fox");

    cout << "end" << endl;
}
