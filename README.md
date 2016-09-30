# cuda-ir-to-opencl

This lets you write out CUDA IR as classic OpenCL 1.2

## Why?

Goal is to be able to build tensorflow for OpenCL.  It's not the only way forward.  There are also multiple streams in progress to build using SYCL, into SPIR-V.

### Compared to using SYCL
- no need to modify the original source-code files quite so much (hopefully)
- portable to other projects, that have not been modified for SYCL (hopefully)

### Compared to using SPIR-V
- OpenCL is a mature standard, supported by a wide variety of GPUs, from a large number of manufacturers (AMD, Intel, NVIDIA, Qualcomm, ...)

## How it works

- we use `clang` to build the CUDA code into LLVM IR code
- we use this project, `cuda-ir-to-opencl` to convert the CUDA IR into OpenCL 1.2

## Example

Lets say we have the following cuda file [examples/testcudakernel1.cu](examples/testcudakernel1.cu)

Compiled into LLVM IR, this looks like: [examples/testcudakernel1.ll](examples/testcudakernel1.ll)

Then, using `ir-to-opencl`, we can convert this into OpenCL, giving [examples/testcudakernel1.cl](examples/testcudakernel1.cl)

It's not very beautiful OpenCL, but it's OpenCL.  Standard, compilable, portable.

## Pre-requisites for build and demos

You'll need:
- Ubuntu 16.04
- llvm 3.8
- clang 3.8
- CUDA toolkit 7.5 installed into `/usr/local/cuda-7.5`
- Have done `sudo apt-get install libc6-dev-i386`

Clone this repo:
```
git clone https://github.com/hughperkins/cuda-ir-to-opencl
cd cuda-ir-to-opencl
```

## Demos

### Device-side OpenCL Generation

From this repo, run:
```
./build.sh
./run-ir-to-opencl-demo.sh
```
=> this will run a demonstration of converting the device side code in [examples/testcudakernel1.cu](examples/testcudakernel1.cu) into OpenCL

### Host-side demonstration

This demo shows we can build host-side code, from the same source-code file containing device-side code.
This doesnt use/need any `ir-to-opencl`, just uses clang functionality, already present in clang-3.8.  From this repo, run:
```
./demo-hostside.sh
```

## How to build

From this repo, run:
```
./build.sh
```
=> `ir-to-opencl` should be built into `build` subdirectory

## What's working?

IR operations supported, at least partially:
- `call`
- `getelementptr`
- `store`
- `load`
-  `add`
- `fadd`
- `ret`
- `fpext`, `zext`, `sext`
- `fptrunc`
- `bitcast`
- float maths operators: +, -, *, /
- int maths operators: +, -, *, /, <<, >>
- int comparisons: < > == != <= >=
- float comparisons: < > == != <= >=
- boolean maths operators: &&, ||
- bitwise operators: ^
- unary float maths: `sqrt`, `tanh`, `log`, `exp`
- branch, conditional branch, phi: `while`, `do....while`, `if`, if...else...`, `for` working
- ternary (ie `a = c ? d : e;` syntax)

OpenCL/CUDA concepts supported, at least partially:
- `global` assigned to incoming pointer arrays, and propagated to assigned variables appropriately
- `kernel`s detected automatically
- `get_global_id()` / `threadIx.`
- `get_group_id()` / `blockIdx.`
- `get_num_groups()`
- `get_local_size()`
- `synchthreads()` / `barrier()`

C++ things:
- templating working ok (llvm cuda compiler handles this for us :-) )

Other cool things:
- single-source compilation works ok :-)

## Test

This is new.  Tests currently failing :-P  Working on this.  To run tests, do:
```
test/test.sh
```
A stream of error messages will ensure :-P  I'm fixing these...

## Roadmap

### Right now

Getting the tests to pass...

### Things that would be cool to get working

- kernel launch
  - compile host-side kernel launch code, and launch a kernel :-)
- be able to handle pointer arithmetic for host-side `float *`s representing opencl gpu memory :-P

### Things we *need* to be working for tensorflow

- tanh, exp, log (for sigmoid etc) (done)
- basic per-element add, subtract, sqrt, etc; so we can create cost functions (done)
- blas stuff (matrix mul, and convolutions):
   - lets use CLblast for blas stuff
   - use im2col for convolution for now (maybe libdnn?)

### Other things we should probalby get working

- local/shared memory
- vector types, ie float4 etc

### open questions

- how to "package"/market this repo, in relation to tensorflow? ie should blas stuff be part of this, or should we have
  a separate tensorflow-cl project, that uses clblast, ir-to-opencl etc as tools/libraries to achieve its aims?
    - tentatively, I favor the latter approach, better reuse, better factorized
- should I use bazel or cmake (or something else?) to package this?
    - if this repo is going to be orthogonal to tensorflow-cl repo, then lets use CMake, which is fairly standard, on
      non-Google projects

## News

- 30 September 2016:
  - started to write some unit tests, that actually try to compile the opencl code
  - notice that tons of the code doesnt compile :-P
  - fixing it...
- 27 September 2016:
  - first create this repo
