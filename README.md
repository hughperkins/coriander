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
- Oct 22:
  - arrays of structs can be passed to kernels again, as long as they contain no pointers
    - (structs containing pointers can be passed only by-value)
  - possible to call kernels with offsets added now, as in eg [test/cocl/offsetkernelargs.cu](test/cocl/offsetkernelargs.cu)
- Oct 20:
  - fix bug where `threadIdx.x` was being incorrectly written as `get_global_id` instead of `get_local_id` ...
     - magically, the `test_cuda_elementwise` kernel works much better now :-)
- Oct 18:
  - installs to `/usr/local` now
  - `libcocl.a` contains `libEasyCL.a` now, no need for `libEasyCL.so` at runtime
  - fixed bug with linking multiple compiled `.cu` files causing error about 'multiple definitions of __opencl_source'
- Oct 16:
  - added streams, including kernel launch on non-default stream
  - removed pinned memory: `cuMemHostAlloc` now just calls `malloc`, see [design.md](doc/design.md) for analysis and thoughts on this.  Let me know if you have any ideas (eg via an issue).
  - added ability to copy to/from device memory, with an offset added
- Oct 15:
  - fixed critical bug where `return;` wasnt being written out.  Which didnt matter when that was at the end of a kernel.  But mattered more when that was the only exit condition for a kernel :-P
  - added event handling
  - ~~added pinned memory handling~~
  - added a bunch of api call implementations for getting information about the driver (mostly stubbed out for now...)
- Oct 10:
  - [test/eigen/test_cuda_elementwise_small.cu](https://github.com/hughperkins/cuda-on-cl/blob/a8f6aa55eb678e534cc7d17a3db26c6b8762d683/test/eigen/test_cuda_elementwise_small.cu) builds and runs ok now
- [Older news](doc/news.md)
