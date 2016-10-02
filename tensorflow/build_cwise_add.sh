#!/bin/bash

# very draft attempt to build one single tensorflow cuda file into IR

set -e

export CUDA_HOME=/usr/local/cuda-7.5
export TENSORFLOW_TREE=~/git/tensorflow

cd ${TENSORFLOW_TREE}

export EIGEN_HOME=bazel-tensorflow/external/eigen_archive

TARGET=tensorflow/core/kernels/cwise_op_gpu_add.cu.cc
OUTPUT=tensorflow/core/kernels/cwise_op_gpu_add.ll

# convert incoming .cu file to device-side IR.  This bit needs CUDA include files
# clang++-3.8 -include include/fake_funcs.h -I${CUDA_HOME}/include ${TARGET} --cuda-device-only -emit-llvm -O3 -S -o ${OUTPUT}
clang++-3.8 -std=c++11 -x cuda -DGOOGLE_CUDA -DEIGEN_MPL2_ONLY -I/usr/include/x86_64-linux-gnu -I. -I${CUDA_HOME}/include -I${EIGEN_HOME} ${TARGET} --cuda-device-only -emit-llvm -O3 -S -o ${OUTPUT}
