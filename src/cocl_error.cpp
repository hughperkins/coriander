#include "cocl/cocl_error.h"

#include "cocl/cocl_defs.h"

#include <iostream>
using namespace std;

size_t cudaGetLastError() {
    COCL_PRINT(cout << "cudaGetLastError" << endl);
    return 0;
}

const char *cudaGetErrorString (size_t error) {
    COCL_PRINT(cout << "cudaGetErrorString error=" << error << endl);
    return "all was ok?";
}

