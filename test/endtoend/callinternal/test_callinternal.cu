// I have/had a bug where internal function calls were processed to have struct arguments with pointers split out,
// just as for kernel calls
// This is a testcase to reproduce/fix/test that bug

#include "test_callinternal.h"

#include "cuda.h"

#include <iostream>
using namespace std;

__device__ void somefunc(struct MyStruct mystruct) {
    mystruct.somefloats[0] += 3.0f;
}

__device__ void hasstructpointer(struct MyStruct *mystruct) {
    mystruct[0].somefloats[0] += 3.0f;
}

__device__ void addfive(float *data) {
    data[0] += 5.0f;
}

class MyClass {
public:
    MyClass(const char *name);
};

MyClass callinternal(__FILE__);
