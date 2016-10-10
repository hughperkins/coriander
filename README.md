# cuda-on-cl

Build CUDA code for OpenCL devices.

## How it works

Host-side, we need convert the cuda kernel launch code into opencl kernel launch code.
Device-side, we need to convert the CUDA kernels into OpenCL kernels.

<img src="doc/img/cudairtoopenclarchitecture6.png?raw=true" width="900" height="400" />

In more detail:

### For device side:

- we use `clang` to compile the CUDA code into LLVM IR code
- using [src/ir-to-opencl.cpp](src/ir-to-opencl.cpp) we read in the IR code, and write it out as OpenCL

### For host-side code

- use `clang` to convert the incoming `.cu` file into IR
- use [src/patch-hostside.cpp](src/patch-hostside.cpp) to replace the cuda kernel launch commands with opencl kernel launch commands, and inject the generated device-side OpenCL source-code
- use `llvm` to compile the updated IR to object code, which we can then run

## Example

### Device-side

Lets say we have the following cuda file [test/cuda_sample.cu](test/cuda_sample.cu):
- using `clang`, we can can compile into LLVM IR: [test/generated/cuda_sample-device.ll](test/generated/cuda_sample-device.ll)
- using [src/ir-to-opencl.cpp](src/ir-to-opencl.cpp), we can write this out as OpenCL: [test/generated/cuda_sample-device.cl](test/generated/cuda_sample-device.cl)

### Host-side

Using the same example file as above, ie [test/cuda_sample.cu](test/cuda_sample.cu) :
- The host-side LLVM IR, output from `clang`, is [test/generated/cuda_sample-hostraw.ll](test/generated/cuda_sample-hostraw.ll)
- After running [src/patch-hostside.cpp](src/patch-hostside.cpp), we get: [test/generated/cuda_sample-hostpatched.ll](test/generated/cuda_sample-hostpatched.ll)

The patched IR code can then be compiled to object code, doesnt need cuda any more, just needs clang, and OpenCL.

### Put these together

*Note that this is being launched on an Intel GPU!*
```bash
$ make run-cuda_sample

mkdir -p build
clang++-3.8 `llvm-config-3.8 --cxxflags` -std=c++11 -fcxx-exceptions -o build/patch-hostside -g -O3 -I/usr/include/llvm-3.8 src/patch-hostside.cpp src/ir-to-opencl-common.cpp `llvm-config-3.8 --ldflags --system-libs --libs all`
warning: unknown warning option '-Wno-maybe-uninitialized'; did you mean
      '-Wno-uninitialized'? [-Wunknown-warning-option]
1 warning generated.
warning: unknown warning option '-Wno-maybe-uninitialized'; did you mean
      '-Wno-uninitialized'? [-Wunknown-warning-option]
1 warning generated.
echo building test/generated/cuda_sample-hostpatched.ll from test/generated/cuda_sample-hostraw.ll
building test/generated/cuda_sample-hostpatched.ll from test/generated/cuda_sample-hostraw.ll
build/patch-hostside test/generated/cuda_sample-hostraw.ll test/generated/cuda_sample-hostpatched.ll
patching launch in _Z8setValuePfif
LaunchCallInfo _Z8setValuePfif<<<dim3(0, 0, 0), dim3(0, 0, 0)>>>(float*, i32, float);
value types: float*, int, float
patching launch in main
LaunchCallInfo _Z8setValuePfif<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(float*, i32, float);
value types: float*, int, float
patching launch in main
LaunchCallInfo _Z8setValuePfif<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(float*, i32, float);
value types: float*, int, float
echo building build/cuda_sample-hostpatched.o from test/generated/cuda_sample-hostpatched.ll
building build/cuda_sample-hostpatched.o from test/generated/cuda_sample-hostpatched.ll
clang++-3.8 -c test/generated/cuda_sample-hostpatched.ll -O3 -o build/cuda_sample-hostpatched.o
g++ -o build/cuda_sample build/hostside_opencl_funcs.o build/cuda_sample-hostpatched.o -lOpenCL -Lbuild -lEasyCL
################################
# running:
################################
LD_LIBRARY_PATH=build: build/cuda_sample
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
hostFloats[2] 123
hostFloats[2] 222
hostFloats[2] 444
```

## How to build

### Pre-requisites

You'll need:
- Ubuntu 16.04
- llvm 3.8
- clang 3.8
- include files from CUDA toolkit 7.5, in /usr/local/cuda-7.5/include
- make
- Have done `sudo apt-get install libc6-dev-i386`
- OpenCL-enabled GPU, and appropriate OpenCL drivers installed for the GPU

Other operating systems, and clang/llvm versions, might be supported, but untested.  Your mileage may vary :-)

### Procedure

```
git clone --recursive https://github.com/hughperkins/cuda-ir-to-opencl
cd cuda-ir-to-opencl
make
```
=> `ir-to-opencl`, and `patch-hostside` should be built into `build` subdirectory

## Test

### Device-side

The tests will compile the OpenCL code, and run it on the GPU, testing the returned results

To run tests, you will need:
- python 3.5
- CUDA toolkit 7.5, at /usr/local/cuda-7.5
- clang 3.8, llvm 3.8
- an OpenCL enabled GPU, with an OpenCL-enabled driver installed

Setup python:
```
pip -install -r test/requirements.txt
```

To run tests:
```
py.test -sv
```

To run the xfailing tests too:
```
py.test -sv --runxfail
```

Tests are at [test](test)

### Host-side

No unit tests for host side at this time, though the end-to-end example above serves for now, ie:
```
make run-cuda_sample
```

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
- global constants

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
- cudaMalloc
- cudaFree
- cudaMemcpy (in both directions device=>host and host=>device)
- inject the generated opencl sourcecode, so it's available at runtime (all in one executable)
- handle initializing opencl automatically

## Roadmap

### Device-side

- `llvm.memmove.p0i8.p0i8.i64`
- `llvm.lifetime`
- `@llvm.global_ctors`
- `_GLOBAL__sub_I_struct_initializer.cu()`
- sooner or later need to carefully re-evaluate some of the bitwise operators, such as shift and so on, which currently right-now just blindly do `<<` or `>>` without regard to sign extension etc

### Host-side

- handle structs containing pointers somehow

### Tensorflow

What's done:
- [https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_gpu_add.cu.cc](https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_gpu_add.cu.cc) can now be written out as compileable OpenCL [https://github.com/hughperkins/cuda-ir-to-opencl/blob/d491aca1b5123781ac59486d38b09fbecd049f45/tensorflow/generated/cwise_op_gpu_add-deviceside.cl](https://github.com/hughperkins/cuda-ir-to-opencl/blob/d491aca1b5123781ac59486d38b09fbecd049f45/tensorflow/generated/cwise_op_gpu_add-deviceside.cl)

What's next:
- get https://bitbucket.org/eigen/eigen/src/97c1ebe6ccc21dc858c1f0ae2ce2e9186f6bac83/unsupported/test/cxx11_tensor_cuda.cu?at=default&fileviewer=file-view-default#cxx11_tensor_cuda.cu-68:114 building/running in OpenCL

### Other points

- blas?
   - current vision is to use CLblast for blas, since it's clean, compact, supported, looks like it might give good performance
- convolutions?
  - use im2col for convolutions initially (not set in stone)

## FAQ

- why not use SYCL to parse the sourcecode?

SYCL is an evolving and new standard.  tensorflow and Eigen are not yet parseable as SYCL

- why not write the device-side code as SPIR-V?

SPIR-V is an evolving and new standard, and not widely supported yet by OpenCL-enabled devices

- is this really a viable approach for Tensorflow?

I dont know :-P

## News

- Oct 8:
  - [https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_gpu_add.cu.cc](https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_gpu_add.cu.cc) compiles completely into compileable OpenCL now [https://github.com/hughperkins/cuda-ir-to-opencl/blob/d491aca1b5123781ac59486d38b09fbecd049f45/tensorflow/generated/cwise_op_gpu_add-deviceside.cl](https://github.com/hughperkins/cuda-ir-to-opencl/blob/d491aca1b5123781ac59486d38b09fbecd049f45/tensorflow/generated/cwise_op_gpu_add-deviceside.cl)
  - implemented `cudaMalloc`, `cudaMemcpy`, `cudaFree` (using opencl)
  - hostside object now contains generated OpenCL sourcecode
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
