# Installation

To use Coriander, please build from source:

## Install pre-requisites

You will need:
- python 2.7
- c++ compiler, and cmake

## Installation

### On Mac OS X

Note: tested on Mac M4 Air, on 2025 april: the branch hp/mac-os-x-2025-b kind of works. That is, you can build coriander. And many of the endtoend tests work ok like:
```
make run-singlebuffer
make run-cuda_sample
make run-testcumemcpy
make run-testfloat4
# ... etc 
# all the endtoend ones I tried worked ok
```
This is using llvm 4.0. (llvm 8.0 didnt work for me, various issues with dump macro and similar.). Had to hack around for a while to get maths things compiling ok, so
I'm not quite sure quite how much works 😅 But can at least run some stuff :)

```
(cloud) ~/git/coriander/build (hp/mac-os-x-2025-b|…1) $ make run-testfloat4
[  0%] Building C object CMakeFiles/clew.dir/src/EasyCL/thirdparty/clew/src/clew.c.o
[  2%] Linking C shared library libclew.dylib
[  2%] Built target clew
[  4%] Linking CXX shared library libeasycl.dylib
[ 14%] Built target easycl
[ 16%] Linking CXX shared library libcocl.dylib
[ 88%] Built target cocl
[ 90%] Linking CXX executable testfloat4
ld: warning: object file (/Users/hugh/git/coriander/build/test/endtoend/testfloat4.d/testfloat4.cu.o) was built for newer 'macOS' version (10.20) than being linked (10.15)
[ 90%] Built target testfloat4
[ 92%] Linking CXX executable patch_hostside
[100%] Built target patch_hostside

make run-testfloat4
loading OpenCL library...
loaded opencl
OpenCL platform: Apple
OpenCL device: Apple M4
123.456
19
9
12
[100%] Built target run-testfloat4
```

```
git clone --recursive https://github.com/hughperkins/coriander
cd coriander
python install_distro.py
```

### On Linux

```
git clone --recursive https://github.com/hughperkins/coriander
cd coriander
python install_distro.py
```

### On Windows

Windows build is in progress, and doesnt actually run yet. See [installation_windows_inprogress.md](installation_windows_inprogress.md).

## Usage

- Coriander is installed into `~/coriander` directory
- Before using Coriander, you will need to set some environment variables, which you can do by running
```
source ~/coriander/activate
```
- (you'll need to do this each time you open a fresh terminal windows, or ssh session)

## Smoke tests

To run some smoke-tests: from the cloned repository, do:
```
cd build
make -j 8 tests
make run-tests
```

You can select the GPU using the environment variable `CL_GPUOFFSET`. For example, on a Macbook Pro 4th generation, to run on the Radeon:
```
CL_GPUOFFSET=1 make run-tests
```
(This is important, since the HD530 isnt quite working, on SGEMM currently. But the Radeon runs just fine :-) )

## Docker

There are [Docker files](docker).

<img src="https://github.com/hughperkins/Coriander/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />

## Gotchas

### `Cannot find source file`

Did you clone with `--recursive`? You might be missing the sub-modules. You can get these by doing:
```
git submodule update --init --recursive
```
