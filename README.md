# cuda-on-cl

Build applications written in NVIDIA® CUDA™ code for OpenCL™ 1.2 devices.

## Concept

- *Compile* using `cocl`
- *link* using `-lcocl -lOpenCL`
- at runtime, loads *libOpenCL.so*

Here is a screenshot of running on a Mac:

<img src="doc/img/mac_run_cuda_sample.png?raw=true" />

## How to use, example

- write a CUDA sourcecode file, or find an existing one
- here's a simple example: [cuda_sample.cu](https://github.com/hughperkins/cuda-on-cl/blob/76a849d9510276bc67167c9a7676d64ff04c3e4a/test/cuda_sample.cu)
- Use `cocl` to compile `cuda_sample.cu`:
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

[Advanced usage](doc/advanced_usage.md)

## What it provides

- compiler for host-side code, including memory allocation, copy, streams, kernel launches
- compiler for device-side code, handling templated C++ code, converting it into bog-standard OpenCL 1.2 code
- cuBLAS API implementations for GEMM, GEMV, SCAL, SAXPY (using Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast))
- cudnn API implementations for:
  - convolution (using `im2col` algorithim, over Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast))
  - pooling
  - activations: ReLU, tanh, sigmoid
  - softmax forward

## How it works

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

## Test

There are the following tests:
- low-level tests, using gtest
- end-to-end tests
- Eigen tests, in Eigen repo, https://bitbucket.org/hughperkins/eigen/src/eigen-cl/unsupported/test/cuda-on-cl/?at=eigen-cl
- cudnn:
  - I'm using a branch of Tal Ben-Nun's [cudnn-training](https://github.com/tbennun/cudnn-training), at https://github.com/hughperkins/cudnn-training , to add/test cudnn implementation
  - there are tests within CUDA-on-CL, in the `gtest` tests, eg run `./cocl_unittests tests=*dnn*`

### gtest tests

```
cd build
make -j 4
./cocl_unittests
```

No dependencies on graphics card etc.  It simply takes some hand-crafted IR, and writes it to OpenCL.  It never actually tries to run the OpenCL, so it validates:
- can CUDA-on-CL handle the IR without choking/crashing?
- do the hand-crafted OpenCL expected results match up with the actual cocl outputs?

### End-to-end tests

Run:
```
cd build
ccmake ..
```
turn on `BUILD_TESTS`, and run the build.

Now you can do, from `build` directory:
```
make run-tests
```

You can run a test by name, eg:
```
make run-offsetkernelargs
```
Result:
```
################################
# running:
################################
LD_LIBRARY_PATH=build: build/test-cocl-offsetkernelargs
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
126.456
```
- end-to-end tests are at [test/cocl](test/cocl)

#### Tests options

From `ccmake ..`, there are various options you can choose, that affect hte OpenCL code produced.  These options will affect how well the OpenCL generation works, and how acceptable it is to your GPU driver.  If you're reading the OpenCL code ,they will affect readability too.

You can see the section `Options` above for more details.

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
- April 15:
  - added max pooling
  - added ReLU, sigmoid and tanh activations
  - added softmax forward
  - now possible by and large to compile Tal Ben-Nun's [cudnn-training](https://github.com/tbennun/cudnn-training).  It needs some additions to the CMakeLists.txt, see my fork at https://github.com/hughperkins/cudnn-training , [differences here](https://github.com/tbennun/cudnn-training/compare/master...hughperkins:opencl)
- April 14:
  - added backwards implementation for convolution, including data, filters, and bias
- April 13:
  - added CLBlast wrappers for: sgemv, sscal, saxpy
- April 4:
  - merged in current `dnn` branch, which provides forward convolutional implementation for cudnn API, using `im2col` over Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast)
  - CUDA-on-CL got accepted for a technical presentation at this year's [IWOCL](https://iwocl.org) conference :-)  Conference sessions here: [IWOCL 2017 Conference program](www.iwocl.org/iwocl-2017/conference-program/)
- Nov 25:
  - created release 4.0.4:
    - all current Eigen tests, https://bitbucket.org/hughperkins/eigen/src/eigen-cl/unsupported/test/cuda-on-cl/?at=eigen-cl , pass for me currently, using this release, on both beignet 1.2.1, on hd5500, and on NVIDIA 940M, using driver 367.57
    - fixes some issues with walk-dependency order during cl walk/generation
    - fixed an issue with un-initialized pointers, in structs passed as kernel parameters, into GPU kernels
- Nov 24:
  - merge from branch clwriter:
    - lots of refactorization under-the-hood
    - can handle determining the address-space of functions returning pointers
    - opencl generation is at runtime now => facilitates determining address-space; and counter-intuitively is actually faster, because less OpenCL to compile by the GPU driver
- Nov 18:
  - Mac build working :-)  https://travis-ci.org/hughperkins/cuda-on-cl/builds/176997220#L1356
- Nov 17:
  - merged `runtime-compile` branch into `master` branch.  This brings a few changes:
    - opencl generation is now at runtime, rather than at compile time
      - this lets us build only the one specific kernel we need
      - means more information is available at generation time, facilitating the generation process
    - build on Mac OS X is more or less working, eg https://travis-ci.org/hughperkins/cuda-on-cl/builds/176580716
    - code radically refactorized underneath
    - remove `--run_branch_transforms`, `--branches_as_switch`, for now
- Nov 8:
  - ~~exposed generation options as `cocl` options, eg `--run_branching_transforms`, `--branches_as_switch`, and the `--devicell-opt [opt]` options~~
- Nov 6:
  - created dockerfiles for Beignet and NVIDIA [docker](docker)
- Nov 5:
  - switched from `Makefile` to `CMakeLists.txt` => build/install instructions have changed, see above
  - added a `cmake` file, so you can easily add `cocl` to your cmakelists file, eg see https://bitbucket.org/hughperkins/eigen/src/d84b9f44f924e36a8527e66a46a189395f046d21/unsupported/test/cuda-on-cl/CMakeLists.txt?at=eigen-cl&fileviewer=file-view-default for an example
- [Older news](doc/news.md)
