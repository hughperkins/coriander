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

#include "cocl/cocl_error.h"

#include "cocl/cocl_defs.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include <iostream>
using namespace std;

#undef COCL_PRINT
#define COCL_PRINT(x)

size_t cudaGetLastError() {
    COCL_PRINT(cout << "cudaGetLastError" << endl);
    return 0;
}

const char *cudaGetErrorString (size_t error) {
    COCL_PRINT(cout << "cudaGetErrorString error=" << error << endl);
    return "all was ok?";
}

void checkCudaErrors(size_t errorcode) {
    if(errorcode != 0) {
        cout << "checkCudaErrors.  Nonzero errorcode " << errorcode << endl;
        throw runtime_error("Non zero errorcode " + easycl::toString(errorcode));
    }
}
