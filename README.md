# cuda-ir-to-opencl

This lets you compile CUDA code for use on non-CUDA OpenCL devices.

## Why?

Goal is to be able to build tensorflow for OpenCL.

## How it works

Host-side, we need convert the cuda kernel launch code into opencl kernel launch code.
Device-side, we need to convert the CUDA kernels into OpenCL kernels.

<img src="doc/img/cudairtoopenclarchitecture2.png?raw=true" width="800" height="400" />

In more detail:

### For host-side code

- use clang to convert the incoming `.cu` file into IR (this bit needs cuda include files)
- use [src/patch-hostside.cpp](src/patch-hostside.cpp) to replace the cuda kernel launch commands with opencl kernel launch commands, in the IR
  (dependencies: clang, cuda-ir-to-opencl)
- use clang to compile the updated IR to object code (dependencies: clang)

### For device side:

- we use `clang` to compile the CUDA code into LLVM IR code (this bit needs cuda include files)
- use [src/ir-to-opencl.cpp](src/ir-to-opencl.cpp) we read in the IR code, and write it out as OpenCL (dependencies: clang, cuda-ir-to-opencl)

## Example

### Device-side

Lets say we have the following cuda file [examples/testcudakernel1.cu](examples/testcudakernel1.cu):
- using `clang`, we can can compile into LLVM IR: [examples/generated/testcudakernel1.ll](examples/generated/testcudakernel1.ll)
- using [src/ir-to-opencl.cpp](src/ir-to-opencl.cpp), we can write this out as OpenCL: [examples/generated/testcudakernel1.cl](examples/generated/testcudakernel1.cl)

### Host-side

Using the same example file as above, ie [examples/testcudakernel1.cu](examples/testcudakernel1.cu) :
- The host-side LLVM IR, output from `clang`, is [examples/generated/testcudakernel1-host.ll](examples/generated/testcudakernel1-host.ll)
- After running [src/patch-hostside.cpp](src/patch-hostside.cpp), we get: [examples/generated/testcudakernel1-host2.ll](examples/generated/testcudakernel1-host2.ll)

The patched IR code can then be compiled to object code, doesnt need cuda any more, just needs clang, and OpenCL.

## Pre-requisites for build and demos

You'll need:
- Ubuntu 16.04
- llvm 3.8
- clang 3.8
- include files from CUDA toolkit 7.5, in /usr/local/cuda-7.5/include
- Have done `sudo apt-get install libc6-dev-i386`
- OpenCL-enabled GPU, and appropriate OpenCL drivers installed for the GPU

Other operating systems, and clang/llvm versions, might be supported, but untested.  Your mileage may vary :-)

## How to build

```
git clone --recursive https://github.com/hughperkins/cuda-ir-to-opencl
cd cuda-ir-to-opencl
./build.sh
```
=> `ir-to-opencl`, and `patch-hostside` should be built into `build` subdirectory

## Demos

### Device-side OpenCL Generation

```
./run-ir-to-opencl-demo.sh
```
=> this will run a demonstration of converting the device side code in [examples/testcudakernel1.cu](examples/testcudakernel1.cu) into OpenCL

### Host-side demonstration

You will need an OpenCL-enabled GPU in order to run this part.

```
./run-end-to-end-demo.sh
```
This will:
- compile [examples/testcudakernel1.cu](examples/testcudakernel1.cu) host-side code into IR
- replace the cuda launch IR commands, with OpenCL kernel launch commands
- compile the new IR to object code, link with [examples/test_call_cl.cpp](examples/test_call_cl.cpp) , and run this

## Test

### Device-side

The tests will compile the OpenCL code, and run it on the GPU, testing the returned results

To run tests, you will need:
- python 3.5
- an OpenCL enabled GPU, with an OpenCL-enabled driver installed

Setup python:
```
pip -install -r test/requirements.txt
```

To run tests:
```
test/test.sh
```

More info: [test/README.md](test/README.md)

### Host-side

Run the kernel launch demo, see above.

## What's working?

Host-side kernel launch is working, in POC.  Device-side translation into OpenCL is well underway.

### Device-side

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

### Host-side

On the host-side, there is code to:
- get hold of the name of the kernel being called
- get hold of the llvm `Value *`s being passed to the kernel call
- get hold of the `grid` and `block` dimensions being passed to the kernel launch
- replace the cuda kernel launch calls with opencl kernel launch calls

## Roadmap

### Tensorflow

- Get [https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_add.cc](https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_add.cc) compiling/running on OpenCL

### Things that would be cool to get working

- be able to handle pointer arithmetic for host-side `float *`s representing opencl gpu memory :-P

### Things we *need* to be working for tensorflow

- tanh, exp, log (for sigmoid etc) (done)
- basic per-element add, subtract, sqrt, etc; so we can create cost functions (done)
- blas stuff (matrix mul, and convolutions):
   - lets use CLblast for blas stuff
   - use im2col for convolution for now
- structs

### Other things we should probalby get working

- local/shared memory
- vector types, ie float4 etc

## FAQ

- why not use SYCL to parse the sourcecode?

SYCL is an evolving and new standard.  tensorflow and Eigen are not yet parseable as SYCL

- why not write the device-side code as SPIR-V?

SPIR-V is an evolving and new standard, and not widely supported yet by OpenCL-enabled devices

- is this really a viable approach for Tensorflow?

I dont know :-P

## News

- 1 October 2016:
  - first working end-to-end kernel launch, using both host-side and device-side code :-)
- 30 September 2016:
  - added initial unit tests, that use pyopencl to compile the generated OpenCL code, and run tests against it
- 27 September 2016:
  - first create this repo
