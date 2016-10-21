#pragma once

struct MyStruct {
    int anint;
    float *somefloats;
};

__device__ void somefunc(struct MyStruct mystruct);
