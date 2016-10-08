#!/bin/bash

set -e

# BASE=${PWD}

# export CUDA_HOME=/usr/local/cuda-7.5
# export EIGEN_HOME=~/git/eigen

# CLANG=clang++-3.8

# TARGET=tensorflow/core/kernels/cwise_op_gpu_add.cu.cc
# # OUTPUT=tensorflow/core/kernels/cwise_op_gpu_add.ll
# OUTPUT=${BASE}/tensorflow/generated/cwise_op_gpu_add-deviceside.ll

# # convert incoming .cu file to device-side IR.  This bit needs CUDA include files
# # clang++-3.8 -include include/fake_funcs.h -I${CUDA_HOME}/include ${TARGET} --cuda-device-only -emit-llvm -O3 -S -o ${OUTPUT}
# ${CLANG} -std=c++11 -x cuda -DGOOGLE_CUDA -DEIGEN_MPL2_ONLY --cuda-gpu-arch=sm_30 -include ${BASE}/tensorflow/tensorflow_preincludes.h -I/usr/include/x86_64-linux-gnu -I. -I${CUDA_HOME}/include -I${EIGEN_HOME} ${TARGET} --cuda-device-only -emit-llvm -O3 -S -o ${OUTPUT}

# ${CUDA_HOME}/bin/nvcc -DGOOGLE_CUDA -DEIGEN_MPL2_ONLY -std=c++11 -c -I. -I${CUDA_HOME}/include -I${EIGEN_HOME} ${TARGET}

make test/eigen/generated/test_cuda_elementwise_small-device.ll
