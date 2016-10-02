#!/bin/bash

export CUDA_HOME=/usr/local/cuda-7.5
COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"

mkdir -p build

# build EasyCL
git submodule update --init --recursive
cd build
cmake ../src/EasyCL -DCMAKE_INSTALL_PREFIX=${PWD} -DBUILD_TESTS=ON
make -j 4 install
cd ..

# build build/ir-to-opencl
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp ${LINK_FLAGS}

# build build/patch-hostside
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/patch-hostside src/ir-to-opencl-common.cpp -g -O3 -I/usr/include/llvm-3.8 src/patch-hostside.cpp ${LINK_FLAGS}
