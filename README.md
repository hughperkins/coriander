# cuda-ir-to-opencl

This lets you write out CUDA IR as classic OpenCL 1.2

## How to use

- first, compile CUDA into CUDA IR
- then use cuda-ir-to-opencl to write out the CUDA IR as OpenCL 1.2

## Example

Lets say we have the following cuda file [examples/testcudakernel1.cu](examples/testcudakernel1.cu)

We use `llvm` to write this out as CUDA IR.  We run:
```
clang++-3.8 -I/usr/local/cuda-7.5/include examples/testcudakernel1.cu --cuda-device-only -emit-llvm -O3 -S -o examples/testcudakernel1.ll
```

The output of this step is llvm IR: [examples/testcudakernel1.ll](examples/testcudakernel1.ll)

Then we run cuda-ir-to-opencl on this:
```
build/ir-to-opencl examples/testcudakernel1.ll
```

And the output is OpenCL :-)  Not very beautiful OpenCL, but OpenCL: [examples/testcudakernel1.cl](examples/testcudakernel1.cl)

## How to build ir-to-opencl

You'll need:
- Ubuntu 16.04
- llvm 3.8
- clang 3.8
- CUDA toolkit (tested with CUDA 7.5)
- Have done `sudo apt-get install libc6-dev-i386`

Then do:
```
./build.sh
```
=> `ir-to-opencl` should be built into `build` subdirectory

## Run demos

### Device-side generation to OpenCL

Simply clone this repo, then run:
```
./run-ir-to-opencl-demo.sh
```
=> this willrun a demonstration of converting the device side code in examples/testcudakernel1.cu into OpenCL

### Demonstration that we can also build host-side code

Host-side code doesnt use `ir-to-opencl`, just uses standard llvm functionality.  Run:
```
./demo-hostside.sh
```

## Details

IR operations supported, at least partially:
- `call`
- `getelementptr`
- `store`
- `load`
-  `add`
- `fadd`
- `ret`
- `fpext`, `zext`, `sext`
- `fptrunc`
- `bitcast`
- float maths operators: +, -, *, /
- int maths operators: +, -, *, /, <<, >>
- int comparisons: < > == != <= >=
- float comparisons: < > == != <= >=
- boolean maths operators: &&, ||
- bitwise operators: ^
- unary float maths: `sqrt`, `tanh`, `log`, `exp`
- branch, conditional branch, phi: `while`, `do....while`, `if`, if...else...`, `for` working
- ternary (ie `a = c ? d : e;` syntax)

OpenCL/CUDA concepts supported, at least partially:
- `global` assigned to incoming pointer arrays, and propagated to assigned variables appropriately
- `kernel`s detected automatically
- `get_global_id()` / `threadIx.`
- `get_group_id()` / `blockIdx.`
- `get_num_groups()`
- `get_local_size()`
- `synchthreads()` / `barrier()`

C++ things:
- templating working ok (llvm cuda compiler handles this for us :-) )

Other cool things:
- single-source compilation works ok :-)

## Things that would be cool to get working

- kernel launch
  - compile host-side kernel launch code, and launch a kernel :-)
- be able to handle pointer arithmetic for host-side `float *`s representing opencl gpu memory :-P

## Things we *need* to be working for tensorflow

- tanh, exp, log (for sigmoid etc) (done)
- basic per-element add, subtract, sqrt, etc; so we can create cost functions (done)
- blas stuff (matrix mul, and convolutions):
   - lets use CLblast for blas stuff
   - use im2col for convolution for now (maybe libdnn?)

## Other things we should probalby get working

- local/shared memory
- vector types, ie float4 etc

## open questions

- how to "package"/market this repo, in relation to tensorflow? ie should blas stuff be part of this, or should we have
  a separate tensorflow-cl project, that uses clblast, ir-to-opencl etc as tools/libraries to achieve its aims?
    - tentatively, I favor the latter approach, better reuse, better factorized
- should I use bazel or cmake (or something else?) to package this?
    - if this repo is going to be orthogonal to tensorflow-cl repo, then lets use CMake, which is fairly standard, on
      non-Google projects
