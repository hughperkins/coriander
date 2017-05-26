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

## What Coriander does

- for gpu-side structs, they are simply passed in directly, as-is
  - means, for now, they should not contain any pointers, which are forbidden by OpenCL 1.2
- for by-value, hostside, structs, a gpu-side buffer is allocated automatically at launch, and freed after launch.  Copying from the hostside to gpuside buffer is handled automaticlaly by Coriander
- if a by-value struct contains pointers, these are passed into the kernel by Coriander, as additional kernel parameters
