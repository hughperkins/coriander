# Advanced usage

## Two-step compilation

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

## Compile options

| Option | Description |
|--------|-------------|
| -I   | provide an include directory, eg `-I /usr/local/eigen` |
| -o   | output filepath, eg `-o foo.o` |
| -c   | compile to .o file; dont link |
| --devicell-opt [option] | pass [option] through to device ll optimization phase.  Affects success and quality of OpenCL generation. |
| -fPIC | passed to clang object-code compiler |

### `-devicell-opt` options

These are passed through to `opt-4.0`, http://llvm.org/docs/Passes.html.  Generally speaking, you dont need to modify these, nor should you. Just use the 
default options, no need to think about it.  The standard options used are:

- `--devicell-opt inline --devicell-opt mem2reg --devicell-opt instcombine --devicell-opt O2`

`opt-4.0` fits in as follows:
- `clang-4.0 -x cuda --device-only` converts the incoming `.cu` file to device-side LLVM IR
- `opt-4.0` optimizes the IR.  `-devicell-opt` options are passed to `opt-4.0` at this point
- the resulting device-side IR is stored into the executable, for use at runtime

You dont really want to mess with these options much/at all because:
- the main impact is how well the OpenCL generation works: too much optimization, or too little, and the OpenCL generation step will have issues
- really, the optimization should be applied after OpenCL generation, by the driver, at runtime
- I spent ages trying different options, and came up with these, that work ok-ish :-)

## Runtime options

You can control the behavior of the Coriander runtime using environment variables.

### `CL_GPUOFFSET`: choosing GPU

At runtime, you can use the environment variable `CL_GPUOFFSET` to choose gpu, eg:
- `CL_GPUOFFSET=1`: use the second gpu (index `1`)
- `CL_GPUOFFSET=2`: use the third gpu (index `2`)

### `COCL_OFFSETS_32BIT`: for beignet

On beignet, you should do `export OFFSETS_32BIT=1`, before running any Coriander-based program. Otherwise, you will get weird results and/or crashes.

Technical details: this changes how memory buffer offsets are sent to the kernels. By default, they are passed as 64-bit integers. With this environment
variable set, they will be transferred as 32-bit unsigned ints. Obviously this limits the size of memory buffers that can be used, but at least it will run :-)

### `COCL_DUMP_BYTECODE=1`

This will dump the device-side bytecode into `/tmp`, as `/tmp/0-device.ll`, `/tmp/1-device.ll`, ... One file for each unique kernel.  Note that this bytecode is actually available at compile time, but it's slightly more convenient to retrieve via this option sometimes.

For hostside bytecode, you'll need to recompile the underlying `.cu` file, and you should find the `xxx-hostraw.ll` and `xxx-hostpatched.ll` files next to the original `xxx.cu` file.

### `COCL_DUMP_CL=1`

This will dump the generated OpenCL files into your `/tmp` directory, with names being contiguous integers, starting from 0, like `/tmp/0.cl`, `/tmp/1.cl`, ... one per generated OpenCL kernel.  The name of the original kernel is given in the first few lines of the OpenCL code, as comments.
