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

### `COCL_DUMP_BUILD_LOGS=1`

Dump any opencl kernel build logs, suppressed by default.

### `COCL_DUMP_BYTECODE=1`

This will dump the device-side bytecode into `/tmp`, as `/tmp/0-device.ll`, `/tmp/1-device.ll`, ... One file for each unique kernel.  Note that this bytecode is actually available at compile time, but it's slightly more convenient to retrieve via this option sometimes.

For hostside bytecode, you'll need to recompile the underlying `.cu` file, and you should find the `xxx-hostraw.ll` and `xxx-hostpatched.ll` files next to the original `xxx.cu` file.

### `COCL_DUMP_CL=1`

This will dump the generated OpenCL files into your `/tmp` directory, with names being contiguous integers, starting from 0, like `/tmp/0.cl`, `/tmp/1.cl`, ... one per generated OpenCL kernel.  The name of the original kernel is given in the first few lines of the OpenCL code, as comments.

### `COCL_LOAD_CL=1`

This will the OpenCL from files in your `/tmp` directory, with names being contiguous integers, starting from 0, like `/tmp/0.cl`, `/tmp/1.cl`, ... one per generated OpenCL kernel.  You can use this to introspect dumped opencl, ie:

- use `COCL_DUMP_CL=1` to dump the opencl
- modify the dumped opencl in some way, eg copy some value you want to know about into an output buffer
- run with `COCL_LOAD_CL=1` to use this modified opencl, and view the value you are interested in

### `COCL_DUMP_CONFIG`: dump kernel buffers

This is new, and highly beta, and just for kernel debugging basically

It allows you to view the contents of `cl_mem` buffers after a kernel call.

Concept:
- create a yaml file, describing which buffers you want to dump, and how
- use `COCL_DUMP_CONFIG=`, to provide the path to this yaml config file, at runtime

Example:

Let's say we want to dump some of the buffers from a call to:
```
kernel void _ZN5Eigen8internal15(
        global char* clmem0, global char* clmem1, global char* clmem2,
        long v22_nopointers_offset, long v22_ptr0_offset, long v22_ptr1_offset, long v22_ptr2_offset, int v23, local int *scratch) {
    global float* v22_ptr2 = (global float*)(clmem2 + v22_ptr2_offset);
    global float* v22_ptr1 = (global float*)(clmem1 + v22_ptr1_offset);
    global float* v22_ptr0 = (global float*)(clmem1 + v22_ptr0_offset);
    global struct Eigen__TensorEvaluator_127_nopointers* v22_nopointers = (global struct Eigen__TensorEvaluator_127_nopointers*)(clmem0 + v22_nopointers_offset);
```
(This is one of the kernels from running Tensorflow's `random_op_gpu.cc` operation. There are four kernels executed during `random_op_gpu.cc`, for the `tf.random_normal` operation; and this is the fourth one)

Let's say we want to dump those threee `ptr` buffers, ie `v22_ptr0`, `v22_ptr1`, and `v22_ptr2`. We can create a dump configuration file like:

```
_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi0ELi1EiEELi16ENS_11MakePointerEEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_5arrayIiLm1EEEKNS_18TensorCwiseUnaryOpINS0_10bind2nd_opINS0_17scalar_product_opIKfSI_EEEEKNS4_INS5_ISI_Li1ELi1EiEELi16ES7_EEEES7_EEEENS_9GpuDeviceEEEiEEvT_T0__0_1_1_2:
  - type: float
    clmem: 1
    offsetarg: 1
    count: 12
  - type: float
    clmem: 1
    offsetarg: 2
    count: 12
  - type: float
    clmem: 2
    offsetarg: 3
    count: 12
```

What this says is:
- if you've just executed a kernel, with a `uniqueName` of .. .well... that really long name you see :-P, then dump three buffers.  For the first buffer:
  - it's a float array buffer (`type: float`)
  - it is clmem index 1 (`clmem: 1`, we get this by looking at the boilerplate, in the opencl, see above)
  - dump 12 of these floats (just because...)
  - and the offset into the clmem buffer is given by the kernel arg index 1 (this is 0-indexed, from the first non-clmem arg, in this case it means, use the offset from `v22_ptr0_offset`)

Example output:
```
Dumping for _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi0ELi1EiEELi16ENS_11MakePointerEEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_5arrayIiLm1EEEKNS_18TensorCwiseUnaryOpINS0_10bind2nd_opINS0_17scalar_product_opIKfSI_EEEEKNS4_INS5_ISI_Li1ELi1EiEELi16ES7_EEEES7_EEEENS_9GpuDeviceEEEiEEvT_T0__0_1_1_2 in dump config
  Dumping buffer 0
1.29928 0 0 0 0 0 0 0 0 0 0 0 
  Dumping buffer 1
    5.61267 0.684699 0.0182959 0.304895 0.267527 0.0837005 1.16425 0.912569 
1.11638 2.52551 1.34282 1.55801 
  Dumping buffer 2
    [Null]
W [[ 2.36910748 -0.82746542  0.13526216 -0.55217266]
 [ 0.51722991  0.2893104  -1.07900333 -0.95528477]
 [-1.05658782  1.58918667 -1.15880132 -1.2482028 ]]
mu -0.164785 var 1.29928
```

You're best turning on the option `COCL_SPAM`, in `ccmake ..`, and also `COCL_SPAM_KERNELLAUNCH`. THis will then tell you about the kernel launch, and the args, during the launch:
```
[LAUNCH] setKernelArgHostsideBuffer size=36
[LAUNCH] setKernelArgGpuBuffer nullptr
[LAUNCH] setKernelArgInt32 1
[LAUNCH] kernelGo() kernel: _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi0ELi1EiEELi16ENS_11MakePointerEEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_5arrayIiLm1EEEKNS_18TensorCwiseUnaryOpINS0_10bind2nd_opINS0_17scalar_product_opIKfSI_EEEEKNS4_INS5_ISI_Li1ELi1EiEELi16ES7_EEEES7_EEEENS_9GpuDeviceEEEiEEvT_T0_
[LAUNCH] clmem0
[LAUNCH] clmem1
[LAUNCH] clmem2
[LAUNCH] i=0 Int64Arg=0
[LAUNCH] i=1 Int64Arg=2816
[LAUNCH] i=2 Int64Arg=1792
[LAUNCH] i=3 Int64Arg=0
[LAUNCH] i=4 Int32Arg=1
[LAUNCH] .. kernel queued
```
~~In addition, to get the unique kernel name, we can use the environment variable `COCL_DUMP_CL=1`, to dump the opencl. We can get the unique kernel name from the first few lines of the dumped opencl. In this case `/tmp/4.cl` looked like~~:
We get the unique kernel name from the output to stdout, usign `COCL_SPAM_KERNELLAUNCH` cmake options.  We can then grep for this kernel name in `/tmp/*.cl`, to find the correspdonding `.cl` file.

To find out more about how this works, you can look at `src/hostside_opencl_funcs.cpp`, function `dump()`. (you really should do this, since this doc is almost certainly already out of date :-P )
