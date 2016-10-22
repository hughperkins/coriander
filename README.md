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

### Pre-requisites

Simply run:
```
make run-tests
```
... to run all non-eigen tests.  If you want to run eigen tests too, you need to:
- clone Eigen repository into `/usr/local/eigen`
- run:
```
make run-tests-all
```

You can run a test by name, eg:
```
make run-eigen-test_cuda_elementwise
```
Result:
```
################################
# running:
################################
LD_LIBRARY_PATH=build: build/eigen-test_cuda_elementwise
Initializing random number generator with seed 1476930631
Repeating each test 10 times
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
```

- the tests prefixed `cocl` are at [test/cocl](test/cocl)
- the tests prefixed `eigen` are at [test/eigen](test/eigen)

## License

[Apache 2.0](LICENSE)

## News

- Oct 22:
  - arrays of structs can be passed to kernels again, as long as they contain no pointers
    - (structs containing pointers can be passed only by-value)
- Oct 20:
  - no longer need CUDA toolkit installed!
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
