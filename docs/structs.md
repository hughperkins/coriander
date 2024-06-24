# Structs

These are my own personal notes really. Not necessarily for public consumption. Though you're free to attempt to read it, and
improve it, if you wish.

## In OpenCL

Structs can be passed into a kernel as a cl_mem, which arrives as a pointer

```
kernel void someKernel(struct mystruct *astruct) {
    ...
}
```

## In CUDA

We can pass structs by value:

```
__global__ void someKernel(struct mystruct astruct) {
    
}
```

So, when you use it, the struct is on the cpu-side, and will be copied to gpu-side automatically, by CUDA. Obviously, any changes to the struct wont be reflected in the host side code, since it's being passed by value

## Optimizations

Sometimes clang will optimize a struct that in the original code is:

```
struct Foo {
    float *somefloats;
}

struct Foo mystruct;
```

into a single float array... :
```
float *mystruct;
```

This shouldnt affect coriander. Except that, it is not necessarily consistent across host and driver side.

What the hostside llvm might look like:
```
define void @Z14someKernel9StructFoo(float*mystruct) #0 {
  ..
}
```
So, the mangled name reflects the original type, but the declared parameter type is now `float *` ...

And on the device side, it might still be a struct ...
```
define void @Z14someKernel9StructFoo(Struct Foo mystruct) #0 {
  ..
}
```

Meanwhile the argument will be passed, from the hostside code, something like:
```
  %3 = alloca %struct.Struct_fp, align 8
  %4 = getelementptr inbounds %struct.Struct_fp, %struct.Struct_fp* %3, i64 0, i32 0
  ...
  %9 = bitcast %struct.Struct_fp* %3 to i8*
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 24)
```

In other words, at calling time, it's still considered as a struct.

## Structs containing pointers

By-value structs can contain pointers. These pointers could represent gpu-side allocated buffers.

## Weird GetElementPtr Usage

In a very few cases, eg SoftMax kernel on Tensorflow, the launch instructions look something like:

```
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %0, i64 0, i32 0, i32 0, i32 0, i64 0
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 136, i64 0)
```

This seems totally bizarre to me. The `gep` no longer has type struct `TensorEvaluator.74`, but eg `int *`, or something similar. And yet, all indications everywhere else are that this pointer is being treated as a by-value struct.  Look at the second parameter of the `cudaSetupArgument`. 136. It's the size of the struct, in bytes.  And the declared type of the called method shows it as a struct:

```
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.74"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
```

Its the first parameter, the `TensorEvaluator.74` one. Struct. Not an `int *` ...

## `readnone`

If you create a kernel that uses a byvalue struct, or rather: the kernel doesnt in fact use it. No reading, and no writing, then clang will mark the kernel parameter 'readnone':

```
define void @_Z27struct_byvalue_withreadnone16Struct_fp_fp_f_fS_Pf(
    %struct.Struct_fp_fp_f_f* byval nocapture readonly align 8,
    %struct.Struct_fp_fp_f_f* byval nocapture readnone align 8,
    float* nocapture) local_unnamed_addr #1 {
```
^^^ The third parameter here is marked `readnone`.  Corresponding kernel to create this:
```
__global__ void struct_byvalue_withreadnone(struct Struct_fp_fp_f_f mystruct, struct Struct_fp_fp_f_f donothing, float *out) {
    out[0] = mystruct.f1;
    out[1] = mystruct.f2;
    mystruct.p1[0] = 9.0f;
    mystruct.p2[0] = 10.0f;
}
```
^^^ The kernel ignores the second parameter basically, so it becomes `readnone`.

The hostside declaration looks like:
```
define void @_Z27struct_byvalue_withreadnone16Struct_fp_fp_f_fS_Pf(
    %struct.Struct_fp_fp_f_f* byval align 8,
    %struct.Struct_fp_fp_f_f* byval align 8,
    float*) #0 {
```

In other words, the hostside declaration doesnt show the argument as being `readnone`. Only the deviceside declaration/definition shows this.

The hostside kernel-launch code looks like:

```
  %54 = call i32 @cudaSetupArgument(i8* nonnull %45, i64 24, i64 0)
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %64

; <label>:56:                                     ; preds = %42
  %57 = call i32 @cudaSetupArgument(i8* nonnull %46, i64 24, i64 24)
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %64

; <label>:59:                                     ; preds = %56
  %60 = call i32 @cudaSetupArgument(i8* nonnull %47, i64 8, i64 48)
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %59
  %63 = call i32 @cudaLaunch(i8* bitcast (void (%struct.Struct_fp_fp_f_f*, %struct.Struct_fp_fp_f_f*, float*)* @_Z27struct_byvalue_withreadnone16Struct_fp_fp_f_fS_Pf to i8*))
  br label %64
```

So actually, the hostside is actually sending the `readnone` parameter, in this case.

But ... weirdly... for tensorflow, on `random_op_gpu.cc`, the hostside does not include the `readnone` parameters:

- device-noopt.ll
```
define void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_(
    %"class.tensorflow::random::PhiloxRandom"* byval nocapture readonly align 4,
    float* nocapture,
    i64,
    %"class.tensorflow::random::NormalDistribution"* byval nocapture readnone align 1) local_unnamed_addr #1 comdat {
```
^^^ has the 4th, readnone parameter

- hostraw.ll, declaration:
```
```

- hostraw.ll, launch:
```
  %56 = call i32 @cudaSetupArgument(i8* nonnull %53, i64 24, i64 0)
  %59 = call i32 @cudaSetupArgument(i8* nonnull %54, i64 8, i64 24)
  %62 = call i32 @cudaSetupArgument(i8* nonnull %55, i64 8, i64 32)
  %65 = call i32 @cudaSetupArgument(i8* nonnull %7, i64 1, i64 40)
  %68 = call i32 @cudaLaunch(i8* bitcast (void (
    %"class.tensorflow::random::PhiloxRandom"*,
    float*,
    i64)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ to i8*))
```
^^^ weirdly, the setupargumetns call for the readnone, but the declaration of the function does not

## What Coriander does

- for gpu-side structs, they are simply passed in directly, as-is
  - means, for now, they should not contain any pointers, which are forbidden by OpenCL 1.2
- for by-value, hostside, structs, a gpu-side buffer is allocated automatically at launch, and freed after launch.  Copying from the hostside to gpuside buffer is handled automaticlaly by Coriander
- if a by-value struct contains pointers, these are passed into the kernel by Coriander, as additional kernel parameters
