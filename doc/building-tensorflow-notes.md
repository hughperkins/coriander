# building tensorflow notes

This is *very* draft, work in progress :-P

First step is to compile one single tensorflow cuda file, eg cwise_op_gpu_add.cu.cc, into llvm IR.  This doc is working on this bit for now.

What I have so far:
```
#!/bin/bash

set -e

export CUDA_HOME=/usr/local/cuda-7.5
export EIGEN_HOME=bazel-tensorflow/external/eigen_archive

TARGET=tensorflow/core/kernels/cwise_op_gpu_add.cu.cc
OUTPUT=tensorflow/core/kernels/cwise_op_gpu_add.ll

# convert incoming .cu file to device-side IR.  This bit needs CUDA include files
# clang++-3.8 -include include/fake_funcs.h -I${CUDA_HOME}/include ${TARGET} --cuda-device-only -emit-llvm -O3 -S -o ${OUTPUT}
clang++-3.8 -std=c++11 -x cuda -DGOOGLE_CUDA -I/usr/include/x86_64-linux-gnu -I. -I${CUDA_HOME}/include -I${EIGEN_HOME} ${TARGET} --cuda-device-only -emit-llvm -O3 -S -o ${OUTPUT}
```

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
