# Assumptions

Coriander makes a bunch of simplifying relaxations/assumptions.  We'll gradually remove these over time.  Some of these are not clear-cut, and are made in some places, and not others.  This list might not be rigorously incomplete either.  If you find something that isn't explainable by any of these relaxations/assumptions, please log an issue at https://github.com/hughperkins/coriander.issues .  I'll either add your observation to this list, or else mark it as a bug, or both perhaps :)

## Conventions used in this page

I'm going to use the notation `uint64_t` to mean an `unsigned long`, and similar for other integer types.  It may not actually be the case that the compiler considers these to be the case, but it's easier to write `uint64_t` than `unsigned long`.  It's also way more correct, since `long` on a Mac, is only 32-bits :-P. Sometimes I might write `uint64` instead of `uint64_t`, but means the same thing, approximately.

## Address space offsets

Address space offsets are often assumed to be int32.  Having said that, they're also often expressed as `uint64_t`s or `int64_t`s, consistent with 64-bit, so it's a little ill-defined.

By default, offsets are passed into kernels as `int64_t`s.  Using the environment variable `COCL_OFFSETS_32BIT` will change them to be passed in as `uint32_t`.

I use signed, since I prefer to use signed everywhere, to reduce the number of types. In 32-bit, I use unsigned, since gives us twice as much addressable memory.

## By-value structs, as kernel parameters

By-value structs are allowed as kernel parameters. They will be copied into a gpu buffer, and the gpu buffer passed into the kernel.

### `float *`

Pointers to float are allowed in these structs. The pointer is assumed to be a virtual pointer, representing a gpu-side buffer. The virtual pointer is passed into the kernel, as a separate kernel parameter, and spliced into the struct, at the start of the kernel.  On the gpu-side, the pointer is declared as `global float *`, consistent with it being a gpu-side buffer.

### `float foo[10]`

I *think* these are copied in by-value, and are simply useable, normally, with no special patching etc.  I'll check this point the next time I encounter some issue or bug related to them.

### `float **`

Pointers to pointers to float are in flux...

## Structs, within a kernel

Structs within a kernel dont need any particular boilerplate etc. However, the address spaces do need to be statically declared, in the OpenCL.

### `float *`

I *think* that `float *`s inside structs are always assumed to be `global float *` for now, but I dont remember clearly. I might be not making this assumption :-P

## Allocation

When a kernel uses a `float **` in a by-value struct, passed in as a kernel parameter, all gpu buffers are assumed to have been carved from a single gpu buffer allocation.  ie something like:

```
float *arena;
cudaMalloc((void **)&arena, 128 * 1024 * 1024);
float *bufA = arena + 0;
float *bufB = arena + 1024;
...
```

This is the case by default in Tensorflow. Though it might not be the case with certain Session settings, such as `allow_growth=True`.

## Number of gpus

Currently, assumed/tested to be a single GPU.

## Synchronization, on streams etc

A bunch of the `async` commands are not in fact currently async, but include an implicit `clFinish()` after them.  It seems better to get stuff working for now, and then make it faster later. However if you have a use-case where this is causing an obvious, and significant, slow-down, then please log an issue, with as much information as possible on the use-case, why you feel this is causing a slow-down, etc.
