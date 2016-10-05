# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

CUDA_HOME=/usr/local/cuda-7.5

CLANG=clang++-3.8
LLVM_CONFIG=llvm-config-3.8
LLVM_INCLUDE=/usr/include/llvm-3.8

COMPILE_FLAGS=`$(LLVM_CONFIG) --cxxflags` -std=c++11
LINK_FLAGS=`$(LLVM_CONFIG) --ldflags --system-libs --libs all`

all: build/ir-to-opencl build/patch-hostside

build/ir-to-opencl: src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I$(LLVM_INCLUDE) src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp $(LINK_FLAGS)

build/patch-hostside: src/patch-hostside.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/patch-hostside -g -O3 -I$(LLVM_INCLUDE) src/patch-hostside.cpp src/ir-to-opencl-common.cpp $(LINK_FLAGS)

easycl:
	git submodule update --init --recursive
	cd build && cmake ../src/EasyCL -DCMAKE_INSTALL_PREFIX=`pwd`/dist -DBUILD_TESTS=ON
	cd build && make -j 4

clean:
	rm -Rf build/*
