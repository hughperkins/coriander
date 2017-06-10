# Coriander

Build applications written in NVIDIA® CUDA™ code for OpenCL™ 1.2 devices.

## Concept

- leave applications in NVIDIA® CUDA™
- compile into OpenCL 1.2
- run on any OpenCL 1.2 GPU

## How to use

- Write an NVIDIA® CUDA™ sourcecode file, or find an existing one
- Let's use [cuda_sample.cu](https://github.com/hughperkins/Coriander/blob/76a849d9510276bc67167c9a7676d64ff04c3e4a/test/cuda_sample.cu)
- Compile, using `cocl`:
```
$ cocl cuda_sample.cu
   ...
   ... (bunch of compily stuff) ...
   ...

    ./cuda_sample.cu compiled into ./cuda_sample

```
Run:
```
$ ./cuda_sample
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
hostFloats[2] 123
hostFloats[2] 222
hostFloats[2] 444
```

<img src="doc/img/mac_run_cuda_sample.png?raw=true" />

[Options](doc/options.md)

## What Coriander provides

- compiler for host-side code, including memory allocation, copy, streams, kernel launches
- compiler for device-side code, handling templated C++ code, converting it into bog-standard OpenCL 1.2 code
- cuBLAS API implementations for GEMM, GEMV, SCAL, SAXPY (using Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast))
- cuDNN API implementations for: convolutions (using `im2col` algorithm over Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast), pooling, ReLU, tanh, and sigmoid

## How Coriander works

Kernel compilation proceeds in two steps:

<img src="doc/img/kernelcompilation.png?raw=true" />

Slides on the [IWOCL](http://iwocl.org) website, [here](http://www.iwocl.org/wp-content/uploads/iwocl2017-hugh-perkins-cuda-cl.pdf)

## Installation

Coriander development is carried out using the following platforms:
- Ubuntu 16.04, with:
  - NVIDIA K80 GPU and/or NVIDIA K520 GPU (via aws)
- Mac Book Pro 4th generation (thank you [ASAPP](http://asapp.com) :-) ), with:
  - Intel HD Graphics 530
  - Radeon Pro 450
  - Sierra OS

Other systems should work too, ideally.  You will need at a minimum at least one OpenCL-enabled GPU,
and appropriate OpenCL drivers installed, for the GPU. Both linux and Mac systems stand a reasonable chance of working ok.

For installation, please see [installation](doc/installation.md)

## Add to your own `cmake` project

- use `cocl_add_executable` and `cocl_add_library`
- see [cmake usage](doc/cmake_usage.md)

## Testing

See [testing](doc/testing.md)

## Assumptions/relaxations made by Coriander

See [assumptions](doc/assumptions.md)

## Libraries

Coriander uses the following libraries:

- [clang/llvm](http://llvm.org/): c/c++ parser/compiler; many contributors
- [CLBlast](https://github.com/cnugteren/CLBlast): Cedric Nugteren's excellent BLAS for OpenCL
- [thrust](https://github.com/thrust/thrust): parallel GPU library, from NVIDIA®
- [yaml-cpp](https://github.com/jbeder/yaml-cpp): yaml for c++, by Jesse Beder
- [EasyCL](https://github.com/hughperkins/EasyCL): wrapper for OpenCL 1.2 boilerplate
- [argparsecpp](https://github.com/hughperkins/argparsecpp): command-line parser for c++
- [gtest](https://github.com/google/googletest): unit tests for c++, from Google

## Related projects

- [Eigen-CL](https://bitbucket.org/hughperkins/eigen/commits/branch/eigen-cl): Minimally-tweaked fork of Eigen, for OpenCL 1.2
- [tf-coriander](https://github.com/hughperkins/tf-coriander): Tensorflow for OpenCL-1.2

## How to Cite

Please cite: [CUDA-on-CL: a compiler and runtime for running NVIDIA® CUDA™ C++11 applications on OpenCL™ 1.2 Devices](http://dl.acm.org/citation.cfm?id=3078156)

## License

[Apache 2.0](LICENSE)

## News

- June 4:
  - added cmake macros `cocl_add_executable` and `cocl_add_library`
  - these replace the previous `add_cocl_executable`, and have the advantage that they are standard targets, that you can use with `target_link_libraries` and so on
  - see [cmake usage](doc/cmake_usage.md)
- May 31:
  - added a developer debugging option `COCL_DUMP_CONFIG`, to allow easy inspection of buffers returned by kernel calls, see [options](doc/options.md)
- [Older news](doc/news.md)
