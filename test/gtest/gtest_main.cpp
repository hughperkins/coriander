// Copyright Hugh Perkins 2015, 2016 hughperkins at gmail

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <iostream>

#include "EasyCL/util/easycl_stringhelper.h"

#include "gtest/gtest.h"

#include "GtestGlobals.h"

using namespace std;
using namespace easycl;
using namespace cocl;

string cmdline;

GTEST_API_ int main(int argc, char **argv) {
    // add filter on slow by default
    bool deleteargv = false;
    // add filter= option, easier to type than --gtest_filter= ...
    for(int i = 1; i < argc; i++) {
//    if(argc >= 2 && (split(string(argv[1]), "=")[0] == "filter"
//        || split(string(argv[1]), "=")[0] == "gfilter") ) {
        if(split(string(argv[i]), "=")[0] == "tests") {
            // replace with "--gtest_filter=..."
            string newarg = string("--gtest_filter=") + split(string(argv[i]), "=")[1];
            char *newargchar = new char[ newarg.length() + 1 ];
            strcpy_safe(newargchar, newarg.c_str(), newarg.length());
            argv[i] = newargchar;
        }
    }
    // default to -SLOW*
    if(argc == 1) {
        char **newargv = new char *[argc + 1];
        int newargc = argc + 1;
        for(int i = 0; i < argc; i++) {
            char *newarg = new char[strlen(argv[i]) + 1 ];
            newargv[i] = newarg;
            strcpy_safe(newargv[i], argv[i], 255);
        }
        string slowfilter = "--gtest_filter=-SLOW*";
        newargv[argc] = new char[ slowfilter.length() + 1 ];
        strcpy_safe(newargv[argc], slowfilter.c_str(), 255);
        argv = newargv;
        argc = newargc;
        deleteargv = true;
    }
//    cout << "argc " << argc << endl;
    cout << "args:";
    for(int i = 0; i < argc; i++) {
        cout << " " << argv[i];
    }
    cout << endl;
    testing::InitGoogleTest(&argc, argv);
    GtestGlobals::instance()->argc = argc;
    GtestGlobals::instance()->argv = argv;
    int retValue = RUN_ALL_TESTS();
    if(deleteargv) {
        for(int i = 0; i < argc; i++) {
            delete[] argv[i];
        }
        delete[] argv;
    }
    return retValue;
}

