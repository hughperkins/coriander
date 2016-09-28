# cuda-ir-to-opencl

This lets you write out CUDA IR as classic OpenCL 1.2

## How to use

- first, compile CUDA into CUDA IR
- then use cuda-ir-to-opencl to write out the CUDA IR as OpenCL 1.2

## Example

Lets say we have the following cuda file:
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

The output looks like, ... well... it's a bit noisy :-P  cos it's IR, so I'll just link to it, which is: [data/testcudakernel1.ll](data/testcudakernel1.ll)

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

Notice that:
- the `kernel` methods are correctly identified as being kernel methods (this comes from the metadata)
- the float pointer parameters for the kernel methods are correctly marked as `global float *`
- the `global`ness correctly propagates through to other variables

## How to build ir-to-opencl

You'll need:
- Ubuntu 16.04
- llvm 3.8
- clang 3.8
- CUDA toolkit (tested with CUDA 7.5)
- Have done `sudo apt-get install libc6-dev-i386`

Then run:
```
COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"
mkdir -p build
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl/ir-to-opencl.cpp ${LINK_FLAGS} || exit 1
```

=> `ir-to-opencl` will be built into `build/ir-to-opencl`

Tested on:
- Ubuntu 16.04 64-bit

## Details

IR operations supported, at least partially:
- `call`
- `getelementptr`
- `store`
- `load`
-  `add`
- `fadd`
- `ret`
- `fpext`
- `fptrunc`
- `bitcast`
- float maths operators: +, -, *, /
- int maths operators: +, -, *, /
- unary float maths: `sqrt`, `tanh`, `log`, `exp`

OpenCL/CUDA concepts supported, at least partially:
- `global` assigned to incoming pointer arrays, and propagated to assigned variables appropriately
- `kernel`s detected automatically
- `get_global_id()` / `threadIx.`

C++ things:
- templating working ok (llvm cuda compiler handles this for us :-) )

## Things that would be cool to get working

- single source:
  - show we can compile host code as well :-)
- kernel launch
  - compile host-side kernel launch code, and launch a kernel :-)
- be able to handle pointer arithmetic for host-side `float *`s representing opencl gpu memory :-P

## Things we *need* to be working for tensorflow

- tanh, exp, log (for sigmoid etc) (done)
- basic per-element add, subtract, sqrt, etc; so we can create cost functions (done)
- blas stuff (matrix mul, and convolutions):
   - lets use CLblast for blas stuff
   - use im2col for convolution for now (maybe libdnn?)

## open questions

- how to "package"/market this repo, in relation to tensorflow? ie should blas stuff be part of this, or should we have
  a separate tensorflow-cl project, that uses clblast, ir-to-opencl etc as tools/libraries to achieve its aims?
    - tentatively, I favor the latter approach, better reuse, better factorized
- should I use bazel or cmake (or something else?) to package this?
    - if this repo is going to be orthogonal to tensorflow-cl repo, then lets use CMake, which is fairly standard, on
      non-Google projects
