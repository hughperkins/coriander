# cuda-ir-to-opencl

This lets you write out CUDA IR as classic OpenCL 1.2

## How to use

- first, compile CUDA into CUDA IR
- then use cuda-ir-to-opencl to write out the CUDA IR as OpenCL 1.2

## Example

Lets say we hae the following cuda file:
```
__device__ float bar(float a, float b) {
    return a + b;
}

__device__ void incrval(float *a) {
    *a += 3;
}

__global__ void somekernel1(float *a) {
    a[0] = a[1];
}

__global__ void foo(float *data) {
    data[0] = 123.0f;
}
```

We use `llvm` to write this out as CUDA IR.  We run:
```
TARGET=mycudafile
clang++-3.8 -I/usr/local/cuda-7.5/include ${TARGET}.cu --cuda-device-only -emit-llvm -O3 -S -o ${TARGET}.ll
```

The output looks like, ... well... it's a bit noisy :-P  cos it's IR, so I'll just link to it, which is: [testcudakernel1.ll](testcudakernel1.ll)

Then we run cuda-ir-to-opencl on this:
```
TARGET=mycudafile
build/ir-to-opencl ${TARGET}.ll
```

And the output is this gloriously "beautiful" OpenCL code:
```
float _Z3barff(float a, float b) {
float v0 = a + b;
return v0;
}

void _Z7incrvalPf(global float* a) {
float v0 = a[0];
float v1 = v0 + 3;
a[0] = v1;
}

kernel void _Z11somekernel1Pf(global float* a) {
global float* v0 = a[1];
global int*v1 = (global int*)v0;
int v2 = v1[0];
global int*v3 = (global int*)a;
v3[0] = v2;
}

kernel void _Z3fooPf(global float* data) {
data[0] = 123;
}
```

## How to build ir-to-opencl

You'll need:
- llvm 3.8
- clang 3.8

Then run:
```
COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"
# clang++-3.8 $(llvm-config-3.8 --cxxflags --ldflags --system-libs --libs core) -std=c++11 -o run -g -O3 -I/usr/include/llvm-3.8 run.cpp -lLLVMCore -lLLVMSupport || exit 1
mkdir -p build
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl.cpp ${LINK_FLAGS} || exit 1
```

=> `ir-to-opencl` will be built into `build/ir-to-opencl`

Tested on:
- Ubuntu 16.04 64-bit
