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
Run.  You'll need to add libclew.so, libclblast.co, libeasycl.so to the LD_LIBRARY_PATH:
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
| -branches_as_switch | Write branch instructions as a `switch`, in the OpenCL.  Fairly correct.  Some GPU drivers might like it. Slow |
| -run_branching_transforms | Try to write branches as `for`/`if`/while`.  Makes code more readable.  Some GPU drivers might like it.  Buggy |
| -fPIC | passed to clang object-code compiler |

The options provided to `-devicell-opt` are passed through to `opt-3.8`, http://llvm.org/docs/Passes.html

It fits in as follows:
- `clang-3.8 -x cuda --device-only` is run, against hte `.cu` file, to convert it to LLVM IR
- `opt-3.8` is run to optimize slightly this IR.  This is the command whose optimizations are guided by the `-devicell-opt` options
- then, `ir-to-opencl` converts the output of `opt-3.8` into OpenCL

Recommended options:
- You probably want to try the following options initially:
  - `-devicell-opt inline -devicell-opt mem2reg -devicell-opt instcombine`
- `-devicell-opt O1` or `-devicell-opt O2` might be helpful

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
sudo apt-get install git cmake cmake-curses-gui llvm-3.8-dev clang-3.8 libc6-dev-i386 make gcc g++
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl
mkdir build
cd build
cmake ..
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

## Roadmap

- I'm working on adding branching transforms, to get rid of `goto` and `label` statements, and replace with `if`, `for`, `while`
  - this seems plausibly necessary for usage on Intel HD5500
  - in any case it makes the output way more humanly readable
- It's mostly working.  There are some pathological cases I'm not sure can be handled
  - so I need to re-enable opencl generation from these remaining `goto`/`label` nodes
- then I'm going to test against the tensorflow sqrt unary operator kernel, on HD5500, and try to figure out why that is not working, and/or how to get it to work ok

## Related projects

- Eigen-CL: Minimally-tweaked fork of Eigen, which can be compiled/run using cuda-on-cl, on an OpenCL device, https://bitbucket.org/hughperkins/eigen/commits/branch/eigen-cl
- Tensorflow-CL: Fork of Tensorflow, that can be built and run on an OpenCL-1.2 enabled GPU, using cuda-on-cl, https://github.com/hughperkins/tensorflow-cl

## License

[Apache 2.0](LICENSE)

## News

- Nov 6:
  - created dockerfiles for Beignet and NVIDIA [docker](docker)
- Nov 5:
  - switched from `Makefile` to `CMakeLists.txt` => build/install instructions have changed, see above
  - added a `cmake` file, so you can easily add `cocl` to your cmakelists file, eg see https://bitbucket.org/hughperkins/eigen/src/d84b9f44f924e36a8527e66a46a189395f046d21/unsupported/test/cuda-on-cl/CMakeLists.txt?at=eigen-cl&fileviewer=file-view-default for an example
- Nov 4:
  - merged in changes that remove `label`s and gotos, and replace them with `if`s, `while`s, `for`s.  This is a bit flaky/beta/duct-tape, but the unit tests do all pass...
- Nov 1:
  - turned on rpath, switched from static to shared compilation
- Oct 29:
  - negative infinity float constants handled correctly now (pre-requisite for `reduce_min` working in tensorflow)
  - properties now return correct device name, total memory, and a few other device parameters
  - added callbacks
  - remember to cache the kernels between calls :-P  (this should make things run quite a lot faster now...)
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
