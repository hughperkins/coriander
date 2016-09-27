#!/bin/bash

# clang++-3.8 -std=c++11 -o run -g -O3 -I/usr/include/llvm-3.8 run.cpp || exit 1
COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs core)"
# clang++-3.8 $(llvm-config-3.8 --cxxflags --ldflags --system-libs --libs core) -std=c++11 -o run -g -O3 -I/usr/include/llvm-3.8 run.cpp -lLLVMCore -lLLVMSupport || exit 1
clang++-3.8 ${COMPILE_FLAGS} -o build/run -g -O3 -I/usr/include/llvm-3.8 run.cpp ${LINK_FLAGS} || exit 1

build/run
