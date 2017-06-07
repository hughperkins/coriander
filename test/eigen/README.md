These tests are for compiling Eigen for OpenCL 1.2, using [coriander](https://github.com/hughperkins/coriander), an opensource
utility for building NVIDIA® CUDA™ source-code for OpenCL 1.2 GPUs.

## Pre-requisites

- [clang-4.0.0](http://releases.llvm.org/download.html#4.0.0)
- have installed [coriander](https://github.com/hughperkins/coriander)
- NVIDIA® CUDA™ Toolkit should not be in the include search path, ie not in /usr/local etc

## How to run

From this directory:
```
mkdir build
cd build
ccmake ..
# press 'c', then modify CLANG_HOME to point to the the clang/llvm 4.0.0 downloaded folder
# then 'c' again, then 'g'
make run-tests
```
Or to run just one test, eg:
```
make run-test_cuda_elementwise
```

## News

- 2017 June 4 2017:
  - updated code and doc, in line with Coriander using llvm 4.0.0 now
  - renamed directory to coriander
- 2017 May 5:
  - tests pass on Mac Sierra, with following devices:
    - Intel HD Graphics 530
    - Radeon Pro 450 (using environment variable `CL_GPUOFFSET=1`)
