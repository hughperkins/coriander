# Coriander

Build applications written in NVIDIA® CUDA™ code for OpenCL™ 1.2 devices.

## Branch notes

This branch is for llvm-4.0.  The `make run-tests` end-to-end tests run/pass ok.  I can compile at least one Tensorflow file with it (`xent_op_gpu.cc`),
but note that I needed to use cutting-edge Eigen for this, ie the one in `default` branch, of the eigen mercurial, https://bitbucket.org/eigen/eigen/commits/branch/default . I tested when the 25th april commit 2b969e5 was tip

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

[Advanced usage](doc/advanced_usage.md)

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
  - NVIDIA K80 GPU
- Mac Sierra, with:
  - Intel HD Graphics 530
  - Radeon Pro 450

Other systems should work too, ideally.  You will need at a minimum at least one OpenCL-enabled GPU,
and appropriate OpenCL drivers installed, for the GPU. Both linux and Mac systems stand a reasonable chance of working ok.

For installation, please see [installation.md](doc/installation.md)

## Testing

See [testing.md](doc/testing.md)

## Simplifications made by Coriander

Coriander makes the following relaxations/simplifications:
- ints are generally assumed to be no longer than 32-bit, and truncated to 32-bit mostly
- floats are assumed to be singles. doubles in the original kernels are converted to floats in the OpenCL code
- buffer offsets are generally taken to be int32s for now.  This might change in the future

## Related projects

- Eigen-CL: Minimally-tweaked fork of Eigen, which can be compiled/run using Coriander, on an OpenCL device, https://bitbucket.org/hughperkins/eigen/commits/branch/eigen-cl
- Tensorflow-CL: Fork of Tensorflow, that can be built and run on an OpenCL-1.2 enabled GPU, using Coriander, https://github.com/hughperkins/tensorflow-cl
- CLBlast: Cedric Nugteren's excellent BLAS implementation for OpenCL  [CLBlast](https://github.com/cnugteren/CLBlast)

## How to Cite

Please cite: [CUDA-on-CL: a compiler and runtime for running NVIDIA® CUDA™ C++11 applications on OpenCL™ 1.2 Devices](http://dl.acm.org/citation.cfm?id=3078156)

## License

[Apache 2.0](LICENSE)

## News

- May 27:
  - updated to LLVM 4.0. Thank you to @iame6162013 for inspiring me to do this
  - Tensorflow `random_op_gpu.cc` compiles and runs ok now :-). There were a few hoops to jump through, https://github.com/hughperkins/coriander/issues/24
- May 20:
  - renamed to Coriander
- May 18:
  - Presented Coriander at this year's [IWOCL](http://iwocl.org) :-)  Full IWOCL program [here](http://www.iwocl.org/iwocl-2017/conference-program/), and there is a link to my own slides
- May 5:
  - Eigen unit tests at https://bitbucket.org/hughperkins/eigen/src/75842846799e15f1c26ef6885565d64c3d0a67b2/unsupported/test/Coriander/?at=eigen-cl pass on Mac Pro 4th Generation with both:
    - Intel HD Graphics 530, and
    - Radeon Pro 450 (using env var `CL_GPUOFFSET=1` to select)
  - I suspect this may have broken some other stuff, since one of the unit tests fails now, but I think it's a gentle step forward
- May 1:
  - dnn tests pass on Radeon Pro 450, on Mac Sierra now
  - fix crash bugs in pooling forward/backward, on Mac Sierra
  - thanks to my employer [ASAPP](http://www.asapp.com/) giving me use of a nice Mac Book Pro 4th Generation, with Radeon Pro 450, unit tests now pass on said hardware :-)
- April 29:
  - Updated to latest EasyCL. This lets you use environment variable `CL_GPUOFFSET` to choose different gpus, eg set to `1` to use second gpu, to `2` to use third gpu, etc
- [Older news](doc/news.md)
