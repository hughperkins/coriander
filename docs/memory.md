# Design

## Challenge: pinned memory

On cuda, it looks like we have pinned memory.  I think it works like this:
- you allocate pinned host memory, using cuMemHostAlloc
- you allocate device memory, using cudaMalloc
- at a time of ones choosing, one can use eg cuMemcpyHtoDAsync to copy from one to the other.  It's super fast, if only some of the data has changed, since the NVIDIA drivers can keep track of which pages need to be copied, and only copy those

Example call sequence:
```
cudaMalloc size=1048576 hostpointer=0x1ecc8a0 memory=0x1ecc8a0
cuMemset_D32_v23 location=0x1ecc8a0 count=257, value=0
cuMemHostAlloc size=1048576 (pinned), hostpointer=0x201300000
cuMemcpyHtoDAsync_v2 dst=0x1ecc8a0 src=0x201300000 bytes=4
```

For OpenCL, we do have pinned memory, but we allocate it as a pair, essentially, by doing `clCreateBuffer`, and asking for `alloc_host`, then calling `enqueueMapBuffer`, to get the host-side pinned pointer
- Tensorflow however makes two calls, first one to cudaMalloc, second one to cuMemHostAlloc
- if they arrived at the same time, or if we knew there'd be a subsequent cuMemHostAlloc, we could use clCreateBuffer with alloc_host, and all would be good
    - we could assume systematically that all allocations will be in a pair like this

Otherwise, we could:
- allocate normal host memory, using eg standard library malloc, when tensorflow makes cuMemHostAlloc call,
- .. .and do a normal copy later, from host to device


Thoughts on performance:
- for AMD discrete GPUs, the second case probably is effectively identical to the first case
- for Intel integrated GPUs, the second case will be less efficient, since Intel GPUs can just share the main memory anyway

=> We could just do the second case for now, and look at optimizing it later.  In fact, that's what I shall do. <=
