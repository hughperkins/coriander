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

Assumed to be a virtual memory pointer.

Passed in as separate kernel parameters, then spliced in.

Represented as `global float *` in kernel side.

### `float *[]`

Assumed to be array of virtual memory pointers.

// Passed in by-value, as 

## structs allocated device-side

Basically treated as though they were passed in via kernel parameter. ie:
- `float *` is always `global float *`, though we dont do any splicing on this, no assumption of virtual memory etc (I think?), its just the type we assume

## floats in kernel-parameters

Only 32-bit floats are allowed in kernel parameters for now.

## floats inside kernels

All floats are converted to 32-bit single floats, even if they are explicitly declared as 64-bit doubles in the underlying codebase.

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

# Notes on virtual memory

Virtual memory is implemented per-context.

Virtual addresses are unique, within the context, and map onto either exactly one `cl_mem` buffer, are `nullptr` (?), or are invalid.

When passed by-value into a kernel, eg as part of a struct that might look like:

```
struct SomeStruct {
    float *buffers[8];
};
```
... then the size of these pointers is 64-bit, matching the hostside (at least, I think; on Mac, this seems to be hte case; I might be assuming 64-bit OS I suppose...).

On the GPU, these arrive as 64-bit, but eg the Radeon on my Mac uses 32-bit addressing.

How to handle this point?

So, we represent these virtual addresses as `unsigned long`, or just `long`, on the device side:

```
struct SomeStruct {
    long buffers[8];
};
```

If this array has one additional level of indirection, it will be... it's out of scope for these assuptions for now. We ignore such a case for now.

At some point in the code, we will map these virtual memory pointers, on the device-side, into global pointers, somethign like:

```
global float *buffers0 = getGlobalPointer(buffers[0]);
```

We will only dereference once we reach the level of a value inside the `buffers` array, eg `buffers[0]` or `buffers[1]`. For example, this is invalid:

```
global float *buffers = getGlobalPointer(buffers);  // <= ERROR, buffers is not a `long`, not a virtual memory address. It's an array of memory addresses
global float **buffers = getGlobalPointer(buffers);  // <= ERROR, cannot do this
```

We can write down the mapping between the representations:

| value | as virtual memory | as deviceside memory |
|-----|----------|-----------|
| buffers[i] | unsigned long | global float * |
| buffers | unsigned long * | not possible to represent, in general |
| buffers[i][j] | not possible to represent | float |
```

We will dereference these types on the fly, in some combination of modifying getelementptr, and store, maybe also load.

# Technical debt stuff

- hostside (ie byvalue) gpu buffers should not have vmem offsets added to kernel declaration
- thread virtual mem address space throughout device code
- revamp how structs work, so we actually modify the type, rather than just modifying gep etc
  - probably implies creating our own struct representation, which is mutable
    - would need to link all usages of each instance in to it somehow
