# Roadmap

## Device-side

- `llvm.memmove.p0i8.p0i8.i64`
- `llvm.lifetime`
- `@llvm.global_ctors`
- `_GLOBAL__sub_I_struct_initializer.cu()`
- sooner or later need to carefully re-evaluate some of the bitwise operators, such as shift and so on, which currently right-now just blindly do `<<` or `>>` without regard to sign extension etc

## Host-side

- handle linking OpenCL sourcecode across compilation units somehow

## Host/device interface

- add test of calling with struct containing pointers
- dont copy structs to nopointers structs, for non-kernel calls

## Testing

- add asserts to the .cu tests

## Tensorflow

What's done:
- [https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_gpu_add.cu.cc](https://github.com/tensorflow/tensorflow/blob/r0.10/tensorflow/core/kernels/cwise_op_gpu_add.cu.cc) can now be written out as compileable OpenCL [https://github.com/hughperkins/Coriander/blob/d491aca1b5123781ac59486d38b09fbecd049f45/tensorflow/generated/cwise_op_gpu_add-deviceside.cl](https://github.com/hughperkins/Coriander/blob/d491aca1b5123781ac59486d38b09fbecd049f45/tensorflow/generated/cwise_op_gpu_add-deviceside.cl)
- https://bitbucket.org/eigen/eigen/src/97c1ebe6ccc21dc858c1f0ae2ce2e9186f6bac83/unsupported/test/cxx11_tensor_cuda.cu?at=default&fileviewer=file-view-default#cxx11_tensor_cuda.cu-68:114 builds/runs in OpenCL now

What's next:
- get some other tests from https://bitbucket.org/eigen/eigen/src/97c1ebe6ccc21dc858c1f0ae2ce2e9186f6bac83/unsupported/test/cxx11_tensor_cuda.cu running on OpenCL

## Other points

- blas?
   - current vision is to use CLblast for blas, since it's clean, compact, supported, looks like it might give good performance
- convolutions?
  - use im2col for convolutions initially (not set in stone)
