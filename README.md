# cuda-on-cl

Build applications written in NVIDIA® CUDA™ code for OpenCL™ 1.2 devices.

## Concept

- leave applications in NVIDIA® CUDA™
- compile into OpenCL 1.2

## How to use

- Write an NVIDIA® CUDA™ sourcecode file, or find an existing one
- Let's use [cuda_sample.cu](https://github.com/hughperkins/cuda-on-cl/blob/76a849d9510276bc67167c9a7676d64ff04c3e4a/test/cuda_sample.cu)
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

## What CUDA-on-CL provides

- compiler for host-side code, including memory allocation, copy, streams, kernel launches
- compiler for device-side code, handling templated C++ code, converting it into bog-standard OpenCL 1.2 code
- cuBLAS API implementations for GEMM, GEMV, SCAL, SAXPY (using Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast))
- cudnn API implementations for:
  - convolution (using `im2col` algorithim, over Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast))
  - pooling
  - activations: ReLU, tanh, sigmoid
  - softmax forward

## How CUDA-on-CL works

<img src="doc/img/howitworks_kernelcompilation.png?raw=true" />

<img src="doc/img/howitworks_compiletime.png?raw=true" />

<img src="doc/img/howitworks_runtime.png?raw=true" />

Slides on the IWOCL website, [here](http://www.iwocl.org/wp-content/uploads/iwocl2017-hugh-perkins-cuda-cl.pdf)

## How to build

### Systems tested

- Ubuntu 16.04, with:
  - NVIDIA GPU
- Mac Sierra, with:
  - Intel HD Graphics 530
  - Radeon Pro 450

### Pre-requisites

- OpenCL-enabled GPU, and appropriate OpenCL drivers installed for the GPU

#### Mac OS X

```
cd ~
wget http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz
tar -xf clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz
mv clang+llvm-3.8.0-x86_64-apple-darwin /usr/local/opt
ln -s /usr/local/opt/clang+llvm-3.8.0-x86_64-apple-darwin /usr/local/opt/llvm-3.8
```

set `CLANG_HOME` as `export CLANG_HOME=/usr/local/opt/llvm-3.8`

#### Ubuntu 16.04
```
sudo apt-get install llvm-3.8 llvm-3.8-dev clang-3.8
sudo apt-get install git cmake cmake-curses-gui libc6-dev-i386 make gcc g++ zlib1g-dev
```

set `CLANG_HOME` to `/usr/lib/llvm-3.8`

### Build/installation

```
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl
mkdir build
cd build
cmake ..
# Note: I usually set build/release type to `Debug`, so this is what is tested
make -j 4
# on Ubuntu:
sudo make install
# or on Mac, if you have homebrew, you dont need sudo:
make install
```

Note that you'll need to continue to export `CLANG_HOME` environment variable when using `cocl`.

## Testing

See [testing.md](doc/testing.md)

## Docker

See [docker](docker).  Docker images run ok on beignet and NVIDIA :-)  (or used to. not tested very recently...)

<img src="https://github.com/hughperkins/cuda-on-cl/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />

## Simplifications made by cuda-on-cl

cuda-on-cl makes the following relaxations/simplifications:
- ints are generally assumed to be no longer than 32-bit, and truncated to 32-bit mostly
- floats are assumed to be singles. doubles in the original kernels are converted to floats in the OpenCL code
- buffer offsets are generally taken to be int32s for now.  This might change in the future

## Related projects

- Eigen-CL: Minimally-tweaked fork of Eigen, which can be compiled/run using cuda-on-cl, on an OpenCL device, https://bitbucket.org/hughperkins/eigen/commits/branch/eigen-cl
- Tensorflow-CL: Fork of Tensorflow, that can be built and run on an OpenCL-1.2 enabled GPU, using cuda-on-cl, https://github.com/hughperkins/tensorflow-cl
- CLBlast: Cedric Nugteren's excellent BLAS implementation for OpenCL  [CLBlast](https://github.com/cnugteren/CLBlast)

## License

[Apache 2.0](LICENSE)

## News

- May 18:
  - Presented CUDA-on-CL at this year's [IWOCL](http://iwocl.org) :-)  Full IWOCL program [here](http://www.iwocl.org/iwocl-2017/conference-program/), and there is a link to my own slides
- May 5:
  - Eigen unit tests at https://bitbucket.org/hughperkins/eigen/src/75842846799e15f1c26ef6885565d64c3d0a67b2/unsupported/test/cuda-on-cl/?at=eigen-cl pass on Mac Pro 4th Generation with both:
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
