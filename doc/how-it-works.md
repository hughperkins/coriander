# How it works

Behind the scenes, there are a few parts:
- Device-side, we need to convert the CUDA kernels into OpenCL kernels.
- Host-side, we need convert the cuda kernel launch code into opencl kernel launch code, and bake in the device-side OpenCL code

Here's a picture of the steps involved

<img src="img/cudairtoopenclarchitecture6.png?raw=true" width="900" height="400" />

## For device side:

- we use `clang` to compile the CUDA code into LLVM IR code
- using [src/ir-to-opencl.cpp](https://github.com/hughperkins/cuda-on-cl/tree/master/src/ir-to-opencl.cpp) we read in the IR code, and write it out as OpenCL

## For host-side code

- use `clang` to convert the incoming `.cu` file into IR
- use [src/patch-hostside.cpp](https://github.com/hughperkins/cuda-on-cl/tree/master/src/patch-hostside.cpp) to replace the cuda kernel launch commands with opencl kernel launch commands, and inject the generated device-side OpenCL source-code
- use `llvm` to compile the updated IR to object code, which we can then run
