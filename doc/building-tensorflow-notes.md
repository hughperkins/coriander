# building tensorflow notes

This is *very* draft, work in progress :-P

First step is to compile one single tensorflow cuda file, eg cwise_op_gpu_add.cu.cc, into llvm IR.  This doc is working on this bit for now.

What I have so far:

[tensorflow/build_cwise_add.sh](https://github.com/cuda-ir-to-opencl/tree/master/tensorflow/build_cwise_add.sh)

This gives:
```
In file included from bazel-tensorflow/external/eigen_archive/unsupported/Eigen/CXX11/../../../Eigen/Core:330:
bazel-tensorflow/external/eigen_archive/unsupported/Eigen/CXX11/../../../Eigen/src/Core/MathFunctions.h:423:7: error: 
      no member named 'arg' in the global namespace; did you mean 'std::arg'?
      EIGEN_USING_STD_MATH(arg);
...
bazel-tensorflow/external/eigen_archive/unsupported/Eigen/CXX11/src/Tensor/TensorContractionCuda.h:618:10: error: 
      use of undeclared identifier '__shfl_xor'
    x1 = __shfl_xor(x1, 4);
```
