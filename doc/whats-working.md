# Whats working

## Device-side

IR operations supported, at least partially:
- `call`, `ret`
- `extractvalue`, `insertvalue`, `getelementptr`
- `store`, `load`
- `fpext`, `zext`, `sext`, `fptrunc`, `trunc`
- `bitcast`
- `inttoptr`
- float maths operators: +, -, *, /
- int maths operators: +, -, *, /, <<, >>, %
- int comparisons: < > == != <= >=
- float comparisons: < > == != <= >=
- boolean maths operators: &&, ||
- bitwise operators: ^
- unary float maths: `sqrt`, `tanh`, `log`, `exp`
- branch, conditional branch, phi: `while`, `do....while`, `if`, if...else...`, `for` working
- ternary (ie `a = c ? d : e;` syntax)
- structs
- private arrays
- `llvm.memcpy`

OpenCL/CUDA concepts supported, at least partially:
- `global` assigned to incoming pointer arrays, and propagated to assigned variables appropriately
- `kernel`s detected automatically
- `get_global_id()` / `threadIx.`
- `get_group_id()` / `blockIdx.`
- `get_num_groups()`
- `get_local_size()`
- `synchthreads()` / `barrier()`
- `float4` (beta)
- `local`/`shared` memory
- global constants

C++ things:
- c++ templating (clang compiler handles this for us)

## Host-side

On the host-side, there is code to:
- get hold of the name of the kernel being called
- get hold of the llvm `Value *`s being passed to the kernel call
- get hold of the `grid` and `block` dimensions being passed to the kernel launch
- replace the cuda kernel launch calls with opencl kernel launch calls
- cudaMalloc
- cudaFree
- cudaMemcpy (in both directions device=>host and host=>device)
- inject the generated opencl sourcecode, so it's available at runtime (all in one executable)
- handle initializing opencl automatically

## Host/device interface

- single-source compilation works ok: clang handles this for us: splitting the sourcecode into two parts for us
- structs passed by-value in CUDA correctly passed by-value in the OpenCL (via an implicit allocate, behind the scenes, handled by cuda-on-cl automatically)
- gpu-allocated float arrays inside a struct are passed correctly from the host to the device, via an additional, hidden, kernel argument, added automatically by cuda-on-cl, behind the scenes
