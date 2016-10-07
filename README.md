# cuda-ir-to-opencl

This lets you compile CUDA code for use on non-CUDA OpenCL devices.

## Why?

Goal is to be able to build tensorflow for OpenCL.

## How it works

Host-side, we need convert the cuda kernel launch code into opencl kernel launch code.
Device-side, we need to convert the CUDA kernels into OpenCL kernels.

<img src="doc/img/cudairtoopenclarchitecture5.png?raw=true" width="900" height="400" />

In more detail:

### For host-side code

- use `clang` to convert the incoming `.cu` file into IR
- use [src/patch-hostside.cpp](src/patch-hostside.cpp) to replace the cuda kernel launch commands with opencl kernel launch commands
- use `llvm` to compile the updated IR to object code

### For device side:

- we use `clang` to compile the CUDA code into LLVM IR code
- using [src/ir-to-opencl.cpp](src/ir-to-opencl.cpp) we read in the IR code, and write it out as OpenCL

## Example

### Device-side

Lets say we have the following cuda file [test/testcudakernel1.cu](test/testcudakernel1.cu):
- using `clang`, we can can compile into LLVM IR: [test/generated/testcudakernel1.ll](test/generated/testcudakernel1.ll)
- using [src/ir-to-opencl.cpp](src/ir-to-opencl.cpp), we can write this out as OpenCL: [test/generated/testcudakernel1.cl](test/generated/testcudakernel1.cl)

### Host-side

Using the same example file as above, ie [test/testcudakernel1.cu](test/testcudakernel1.cu) :
- The host-side LLVM IR, output from `clang`, is [test/generated/testcudakernel1-host.ll](test/generated/testcudakernel1-host.ll)
- After running [src/patch-hostside.cpp](src/patch-hostside.cpp), we get: [test/generated/testcudakernel1-host2.ll](test/generated/testcudakernel1-host2.ll)

The patched IR code can then be compiled to object code, doesnt need cuda any more, just needs clang, and OpenCL.

## Pre-requisites for build and demos

You'll need:
- Ubuntu 16.04
- llvm 3.8
- clang 3.8
- include files from CUDA toolkit 7.5, in /usr/local/cuda-7.5/include
- make
- Have done `sudo apt-get install libc6-dev-i386`
- OpenCL-enabled GPU, and appropriate OpenCL drivers installed for the GPU

Other operating systems, and clang/llvm versions, might be supported, but untested.  Your mileage may vary :-)

## How to build

```
git clone --recursive https://github.com/hughperkins/cuda-ir-to-opencl
cd cuda-ir-to-opencl
make
```
=> `ir-to-opencl`, and `patch-hostside` should be built into `build` subdirectory

## Demos

### Device-side OpenCL Generation

```
./run-ir-to-opencl-demo.sh
```
=> this will run a demonstration of converting the device side code in [test/testcudakernel1.cu](test/testcudakernel1.cu) into OpenCL

### Host-side demonstration

You will need an OpenCL-enabled GPU in order to run this part.

```
./run-end-to-end-demo.sh
```
This will:
- compile [test/testcudakernel1.cu](test/testcudakernel1.cu) host-side code into IR
- replace the cuda launch IR commands, with OpenCL kernel launch commands
- compile the new IR to object code, link with [test/test_call_cl.cpp](test/test_call_cl.cpp) , and run this

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

Tests are at [test/test_cloutput.py](test/test_cloutput.py).  They test the generated OpenCL kernels at [test/generated/testcudakernel1.cl](test/generated/testcudakernel1.cl), which were generated from [test/testcudakernel.cu](test/testcudakernel.cu)

More info: [test/README.md](test/README.md)

### Host-side

Run the kernel launch demo, see above.

## What's working?

### Device-side

IR operations supported, at least partially:
- `call`, `ret`
- `extractvalue`, `insertvalue`, `getelementptr`
- `store`, `load`
- `fpext`, `zext`, `sext`, `fptrunc`, `trunc`
- `bitcast`
- `inttoptr`
- float maths operators: +, -, *, /
- int maths operators: +, -, *, /, <<, >>, %
- int comparisons: < > == != <= >=
- float comparisons: < > == != <= >=
- boolean maths operators: &&, ||
- bitwise operators: ^
- unary float maths: `sqrt`, `tanh`, `log`, `exp`
- branch, conditional branch, phi: `while`, `do....while`, `if`, if...else...`, `for` working
- ternary (ie `a = c ? d : e;` syntax)
- structs
- private arrays
- `llvm.memcpy`

OpenCL/CUDA concepts supported, at least partially:
- `global` assigned to incoming pointer arrays, and propagated to assigned variables appropriately
- `kernel`s detected automatically
- `get_global_id()` / `threadIx.`
- `get_group_id()` / `blockIdx.`
- `get_num_groups()`
- `get_local_size()`
- `synchthreads()` / `barrier()`
- `float4` (beta)
- `local`/`shared` memory

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

### Basic c/c++/llvm/CUDA/OpenCL language/concepts

- `llvm.memmove.p0i8.p0i8.i64`
- `llvm.lifetime`
- `@llvm.global_ctors`
- global declarations
- `_GLOBAL__sub_I_struct_initializer.cu()`

### Tensorflow

- Get [https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_add.cc](https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_add.cc) compiling/running on OpenCL

#### Current Issues

- `  %18 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !173` => generates opencl `float v17 = [0];`

### Things we *need* to be working for tensorflow

- tanh, exp, log (for sigmoid etc) (done)
- basic per-element add, subtract, sqrt, etc; so we can create cost functions (done)
- blas stuff (matrix mul, and convolutions):
   - lets use CLblast for blas stuff
   - use im2col for convolution for now

## FAQ

- why not use SYCL to parse the sourcecode?

SYCL is an evolving and new standard.  tensorflow and Eigen are not yet parseable as SYCL

- why not write the device-side code as SPIR-V?

SPIR-V is an evolving and new standard, and not widely supported yet by OpenCL-enabled devices

- is this really a viable approach for Tensorflow?

I dont know :-P

## News

- Oct 5
  - fix float constants to correctly have `.0f` at the end
  - added `extractvalue`
  - conversion of [tensorflow/generated/cwise_op_gpu_add-deviceside.ll](tensorflow/generated/cwise_op_gpu_add-deviceside.ll) to [tensorflow/generated/cwise_op_gpu_add-deviceside.cl](tensorflow/generated/cwise_op_gpu_add-deviceside.cl) runs to completion now, though a "bit" buggy :-P
- Oct 4:
  - added `llvm.memcpy`
  - added `insertvalue`
  - added `dumpinttoptr`, `trunc`, `srem` (beta)
- Oct 3
  - added `float4` (beta)
  - added `local` memory (beta)
- Oct 2:
  - added structs
- Oct 1:
  - first working end-to-end kernel launch, using both host-side and device-side code :-)
- Sept 30:
  - added initial unit tests, that use pyopencl to compile the generated OpenCL code, and run tests against it
- Sept 27:
  - first created
