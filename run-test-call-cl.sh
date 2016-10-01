#!/bin/bash

set -e
# set -x

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"

mkdir -p build

# build EasyCL
git submodule update --init --recursive
cd build
cmake ../src/EasyCL -DCMAKE_INSTALL_PREFIX=${PWD} -DBUILD_TESTS=ON
make -j 4 install
cd ..

# build build/patch-hostside
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/patch-hostside ir-to-opencl/ir-to-opencl-common.cpp -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl/patch-hostside.cpp ${LINK_FLAGS}

# convert the cuda file to IR
clang++-3.8 -I${CUDA_HOME}/include examples/${TARGET}.cu --cuda-host-only -emit-llvm  -O3 -S -o build/${TARGET}-host.ll

# run build/patch-hostside, to patch the IR
build/patch-hostside build/${TARGET}-host.ll build/${TARGET}-host2.ll

# compile the patched IR
clang++-3.8 -c build/${TARGET}-host2.ll -O3 -o build/${TARGET}-host.o

# compile our main method
clang++-3.8 -std=c++11 -Isrc/EasyCL -c examples/test_call_cl.cpp --cuda-host-only -O3 -o build/test_call_cl.o

# link, and run
g++ -o build/test_call_cl build/test_call_cl.o build/${TARGET}-host.o -lOpenCL -Lbuild -lEasyCL
LD_LIBRARY_PATH=build:$LD_LIBRARY_PATH build/test_call_cl
