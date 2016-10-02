# cuda-ir-to-opencl

This lets you compile CUDA code for use on non-CUDA OpenCL devices.

## Why?

Goal is to be able to build tensorflow for OpenCL.  It's not the only way forward.  There are also multiple streams in progress to build using SYCL, into SPIR-V.

### Compared to using SYCL
- no need to modify the original source-code files quite so much (hopefully)
- portable to other projects, that have not been modified for SYCL (hopefully)

### Compared to using SPIR-V
- OpenCL is a mature standard, supported by a wide variety of GPUs, from a large number of manufacturers (AMD, Intel, NVIDIA, Qualcomm, ...)

### Notes on CUDA dependency
- you do need CUDA toolkit installed, to get the initial IR code out.  Once you have the IR code, you can carry out the remaining steps, including execution of course, on any OpenCL platform,
providing clang 3.8.  After compilation, execution should just need an OpenCL platform, not even a clang dependency (I think? Might need some runtime libraries possibly?).

## How it works

We need to handle host-side code, which means, convert the cuda kernel launch code into opencl kernel launch code.  This is
under feasibility study.  And we need to convert the device-side code from cuda IR into OpenCL, to feed to any OpenCL
device driver.

The way these works is:

### For host-side code

- use clang to convert the incoming `.cu` file into IR (this bit needs cuda include files)
- use [ir-to-opencl/patch-hostside.cpp](ir-to-opencl/patch-hostside.cpp) to replace the cuda kernel launch commands with opencl kernel launch commands, in the IR
  (dependencies: clang, cuda-ir-to-opencl)
- use clang to compile the updated IR to object code (dependencies: clang)

### For device side:

- we use `clang` to compile the CUDA code into LLVM IR code (this bit needs cuda include files)
- we read in the IR code, and write it out as OpenCL (dependencies: clang, cuda-ir-to-opencl)

## Example

### Device-side

Lets say we have the following cuda file [examples/testcudakernel1.cu](examples/testcudakernel1.cu)

Compiled into LLVM IR, this looks like: [examples/testcudakernel1.ll](examples/testcudakernel1.ll)

Then, using `ir-to-opencl`, we can convert this into OpenCL, giving [examples/testcudakernel1.cl](examples/testcudakernel1.cl)

It's not very beautiful OpenCL, but it's OpenCL.  Standard, compilable, portable.

### Host-side

Using the same example file as above, ie [examples/testcudakernel1.cu](examples/testcudakernel1.cu)

The host-side LLVM IR, output from `clang`, is [examples/testcudakernel1-host.ll](examples/testcudakernel1-host.ll)

After running [ir-to-opencl/patch-hostside.cpp](ir-to-opencl/patch-hostside.cpp) against this IR, we get: [examples/testcudakernel1-host2.ll](examples/testcudakernel1-host2.ll)

This can then be compiled to object code, doesnt need cuda any more, just needs clang, and OpenCL.

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

You will need an OpenCL-enabled GPU in order to run this part.

Run:
```
./run-test-call-cl.sh
```
This will:
- compile [examples/testcudakernel1.cu](examples/testcudakernel1.cu) host-side code into IR
- replace the cuda launch IR commands, with OpenCL kernel launch commands
- compile the new IR to object code, link with [examples/test_call_cl.cpp](examples/test_call_cl.cpp) , and run this

## How to build

From this repo, run:
```
./build.sh
```
=> `ir-to-opencl` should be built into `build` subdirectory

To build `patch-hostside`, run the hostside kernel launch demo-in-progress:
```
./run-test-call-cl.sh
```
=> `patch-hostside` should appear in the `build` subdirectory

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

### Things that would be cool to get working

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

- 1 October 2016:
  - first working end-to-end kernel launch, using both host-side and device-side code :-)
- 30 September 2016:
  - added initial unit tests, that use pyopencl to compile the generated OpenCL code, and run tests against it
- 27 September 2016:
  - first create this repo
