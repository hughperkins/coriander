# cuda-on-cl

Build applications written in NVIDIA® CUDA™ code for OpenCL™ 1.2 devices.

## Concept

- *Compile* using `cocl`
- *link* using `-lcocl -lOpenCL`
- at runtime, loads *libOpenCL.so*

## How to use, example

- write a CUDA sourcecode file, or find an existing one
- here's a simple example: [cuda_sample.cu](https://github.com/hughperkins/cuda-on-cl/blob/76a849d9510276bc67167c9a7676d64ff04c3e4a/test/cuda_sample.cu)
- Run `cocl` to compile it:
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
g++ -o teststream teststream.o -lcocl -lOpenCL
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

- Ubuntu 16.04
- clang/llvm 3.8 (installed in 'Procedure' below)
- OpenCL-enabled GPU, and appropriate OpenCL drivers installed for the GPU

Other operating systems, and clang/llvm versions, might work too, but untested.  Your mileage may vary :-)

### Procedure

```
sudo apt-get install git cmake llvm-3.8-dev clang-3.8-dev libc6-dev-i386 make gcc g++
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl
make -j 4
sudo make install
```

## Test

There are two sets of tests:
- low-level tests, using `py.test`
- end-to-end tests

### Tests from python

#### Pre-requisites

```
pip install -r test/requirements.txt
```

#### Procedure

```
py.test -svx
```

- python tests are at [test](test)

### End-to-end tests

Simply run:
```
make run-tests
```

You can run a test by name, eg:
```
make run-test-cocl-offsetkernelargs
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

## Related projects

- Eigen-CL: Minimally-tweaked fork of Eigen, which can be compiled/run using cuda-on-cl, on an OpenCL device, https://bitbucket.org/hughperkins/eigen/commits/branch/eigen-cl
- Tensorflow-CL: Fork of Tensorflow, that can be built and run on an OpenCL-1.2 enabled GPU, using cuda-on-cl, https://github.com/hughperkins/tensorflow-cl

## License

[Apache 2.0](LICENSE)

## News

- Oct 28:
  - denormalized generated OpenCL out of SSA form, to make it more human-readable
  - added support to pass null pointers into kernels
- Oct 26:
  - fixed a bug where BLAS results were empty on HD5500, using beignet 1.2
  - added `__shfl_down` shim
  - moved Eigen tests into a new Eigen fork, https://bitbucket.org/hughperkins/eigen/commits/branch/eigen-cl
- Oct 25:
  - BLAS wrapper handles memory offsets correctly now
- Oct 24:
  - fixed `pow`, `min`, `max` (beta)
- Oct 23:
  - fixed `float4`s.  This is a critical bug-fix, without which Eigen componentwise works less well in Tensorflow :-P
  - added BLAS, using Cedric Nugteren's [CLBlast](https://github.com/CNugteren/CLBlast))
- [Older news](doc/news.md)
