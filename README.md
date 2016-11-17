# cuda-on-cl

Build applications written in NVIDIA® CUDA™ code for OpenCL™ 1.2 devices.

This fork moves opencl generation to runtime.  Means we have better information available, specifically we know
which kernel we want to run.  This is going to help with address space determination.

## Concept

- *Compile* using `cocl`
- *link* using `-lcocl -lOpenCL`
- at runtime, loads *libOpenCL.so*

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

### Two-step compilation

If you want, you can compile in two steps:

```
cocl -c teststream.cu
g++ -o teststream teststream.o -lcocl -lclblast -leasycl -lclew
```
Result is the same:
```
$ ./cuda_sample
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
hostFloats[2] 123
hostFloats[2] 222
hostFloats[2] 444
```

## Options

| Option | Description |
|--------|-------------|
| -I   | provide an include directory, eg `-I /usr/local/eigen` |
| -o   | output filepath, eg `-o foo.o` |
| -c   | compile to .o file; dont link |
| -devicell-opt [option] | pass [option] through to device ll optimization phase.  Affects success and quality of OpenCL generation. |
| -fPIC | passed to clang object-code compiler |

The options provided to `-devicell-opt` are passed through to `opt-3.8`, http://llvm.org/docs/Passes.html

`opt-3.8` fits in as follows:
- `clang-3.8 -x cuda --device-only` converts the incoming `.cu` file to LLVM IR
- `opt-3.8` optimizes the IR.  `-devicell-opt` control this
- `ir-to-opencl` writes the IR as OpenCL

Recommended generation options:
- `-devicell-opt inline -devicell-opt mem2reg -devicell-opt instcombine --devicell-opt O2`

You can open the `-device.cl` file to look at the OpenCL generated, and compare the effects of different options.

## How it works

Behind the scenes, there are a few parts:
- Device-side, `cocl` converts the CUDA kernels into OpenCL kernels
- Host-side, `cocl`:
  - converts the cuda kernel launch code into opencl kernel launch code, and
  - bakes in the OpenCL code

<img src="doc/img/cudairtoopenclarchitecture6.png?raw=true" width="900" height="400" />

[More detail](doc/how-it-works.md)

## What it provides

- compiler for host-side code, including memory allocation, copy, streams, kernel launches
- compiler for device-side code, handling templated C++ code, converting it into bog-standard OpenCL 1.2 code
- BLAS (using Cedric Nugteren's [CLBlast](https://github.com/cnugteren/CLBlast))

## How to build

### Pre-requisites

- Operating system:
  - Tested/developed on Ubuntu 16.04
  - Ubuntu 14.04 does seem to work ok too (not tested very much though...)
  - Mac OS X very close to working, eg see https://travis-ci.org/hughperkins/cuda-on-cl/builds/176629553
  - Other operating systems, and clang/llvm versions, might work too, but untested.  Your mileage may vary :-)
- OpenCL-enabled GPU, and appropriate OpenCL drivers installed for the GPU

### Install clang/llvm-3.8

Either:
- download from http://llvm.org/releases/download.html , and set `CLANG_HOME` to point to the root of this unzipped folder, or
- on ubuntu you can do `sudo apt-get install llvm-3.8 llvm-3.8-dev clang-3.8`
  - but you still need to set `CLANG_HOME` :-)  In this case, to: `/usr/lib/llvm-3.8`

### Other libraries

On Ubuntu 16.04:
```
sudo apt-get install git cmake cmake-curses-gui libc6-dev-i386 make gcc g++
```

On other systems:
- somehow install the same things as for Ubuntu 16.04 section

### Procedure

```
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl
mkdir build
cd build
cmake ..
make -j 4
sudo make install
```

Note that you'll need to continue to export `CLANG_HOME` environment variable when using `cocl`.

## Test

There are three sets of tests:
- low-level tests, using gtest
- mid-level tests, using `py.test`
- end-to-end tests

### gtest tests

```
cd build
make -j 4
./cocl_unittests
```

No dependencies on graphics card etc.  It simply takes some hand-crafted IR, and writes it to OpenCL.  It never actually tries to run the OpenCL, so it validates:
- can cocl handle the IR without choking/crashing?
- do the hand-crafted OpenCL expected results match up with the actual cocl outputs?

### Tests from python

#### Pre-requisites

```
pip install -r test/requirements.txt
```

#### Procedure

```
OFFSET_32BIT=1 COCL_OPTIONS='--devicell-opt inline --devicell-opt mem2reg --devicell-opt instcombine --devicell-opt O2' py.test -v
```

- python tests are at [test](test)

You can modify the options in `COCL_OPTIONS`.  There are passed to the `cocl` command, see section #Options above.

If you set `OFFSET_32BIT` to off in your cmake options, you should remove the `OFFSET_32BIT=1` optio nwhen running py.test

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

See [docker](docker).  Docker images run ok on beignet and NVIDIA :-)

<img src="https://github.com/hughperkins/cuda-on-cl/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />

## Related projects

- Eigen-CL: Minimally-tweaked fork of Eigen, which can be compiled/run using cuda-on-cl, on an OpenCL device, https://bitbucket.org/hughperkins/eigen/commits/branch/eigen-cl
- Tensorflow-CL: Fork of Tensorflow, that can be built and run on an OpenCL-1.2 enabled GPU, using cuda-on-cl, https://github.com/hughperkins/tensorflow-cl

## License

[Apache 2.0](LICENSE)

## News

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
