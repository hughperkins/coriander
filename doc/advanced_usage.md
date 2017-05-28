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

## Options

| Option | Description |
|--------|-------------|
| -I   | provide an include directory, eg `-I /usr/local/eigen` |
| -o   | output filepath, eg `-o foo.o` |
| -c   | compile to .o file; dont link |
| --devicell-opt [option] | pass [option] through to device ll optimization phase.  Affects success and quality of OpenCL generation. |
| -fPIC | passed to clang object-code compiler |

The options provided to `-devicell-opt` are passed through to `opt-3.8`, http://llvm.org/docs/Passes.html

`opt-3.8` fits in as follows:
- `clang-3.8 -x cuda --device-only` converts the incoming `.cu` file to LLVM IR
- `opt-3.8` optimizes the IR.  `-devicell-opt` control this
- `ir-to-opencl` writes the IR as OpenCL

Recommended generation options:
- `--devicell-opt inline --devicell-opt mem2reg --devicell-opt instcombine --devicell-opt O2`

## Runtime options

### `CL_GPUOFFSET`: choosing GPU

At runtime, you can use the environment variable `CL_GPUOFFSET` to choose gpu, eg:
- `CL_GPUOFFSET=1`: use the second gpu (index `1`)
- `CL_GPUOFFSET=2`: use the third gpu (index `2`)

### `COCL_OFFSETS_32BIT`: for beignet

On beignet, you should do `export OFFSETS_32BIT=1`, before running any Coriander-based program. Otherwise, you will get weird results and/or crashes.

Technical details: this changes how memory buffer offsets are sent to the kernels. By default, they are passed as 64-bit integers. With this environment
variable set, they will be transferred as 32-bit unsigned ints. Obviously this limits the size of memory buffers that can be used, but at least it will run :-)
