# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

CUDA_HOME=/usr/local/cuda-8.0
EIGEN_HOME=/usr/local/eigen

CLANG=clang++-3.8
LLVM_CONFIG=llvm-config-3.8
LLVM_INCLUDE=/usr/include/llvm-3.8

COMPILE_FLAGS=`$(LLVM_CONFIG) --cxxflags` -std=c++11
LINK_FLAGS=`$(LLVM_CONFIG) --ldflags --system-libs --libs all`

all: build/ir-to-opencl build/patch-hostside

build/ir-to-opencl: src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I$(LLVM_INCLUDE) src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp $(LINK_FLAGS)

build/patch-hostside: src/patch-hostside.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/patch-hostside -g -O3 -I$(LLVM_INCLUDE) src/patch-hostside.cpp src/ir-to-opencl-common.cpp $(LINK_FLAGS)

easycl:
	git submodule update --init --recursive
	cd build && cmake ../src/EasyCL -DCMAKE_INSTALL_PREFIX=`pwd`/dist -DBUILD_TESTS=ON
	cd build && make -j 4

clean:
	rm -Rf build/* test/generated/*

# IR

# deviceside goes directly from .cu => -device.ll

test/generated/%-device.ll: test/%.cu include/fake_funcs.h build/ir-to-opencl
	echo building $@ from $<
	mkdir -p test/generated
	$(CLANG) -include include/fake_funcs.h -I$(CUDA_HOME)/include $< --cuda-device-only -emit-llvm -O3 -S -o $@

test/eigen/generated/%-device.ll: test/eigen/%.cu include/fake_funcs.h build/ir-to-opencl
	echo building $@ from $<
	mkdir -p test/eigen/generated
	$(CLANG) -x cuda -std=c++11 -DEIGEN_TEST_FUNC=cuda_elementwise_small -D__CUDA_ARCH__=300 -include include/fake_funcs.h -Iinclude -I$(EIGEN_HOME) -I$(CUDA_HOME)/include -I/usr/include/x86_64-linux-gnu $< --cuda-device-only -emit-llvm -O3 -S -o $@

# hostside goes from .cu -> -hostraw.ll => -hostpatched.ll

test/generated/%-hostraw.ll: test/%.cu
	echo building $@ from $<
	mkdir -p test/generated
	$(CLANG) -I$(CUDA_HOME)/include $< --cuda-host-only -emit-llvm  -O3 -S -o $@

test/generated/%-hostpatched.ll: test/generated/%-hostraw.ll build/patch-hostside
	echo building $@ from $<
	build/patch-hostside $< $@

test/eigen/generated/%-hostraw.ll: test/eigen/%.cu
	echo building $@ from $<
	mkdir -p test/eigen/generated
	$(CLANG) -std=c++11 -DEIGEN_TEST_FUNC=cuda_elementwise_small -include include/fake_funcs.h -I$(EIGEN_HOME) -I$(CUDA_HOME)/include $< --cuda-host-only -emit-llvm  -O3 -S -o $@

# opencl (from the -device.ll)

%-device.cl: %-device.ll build/ir-to-opencl
	echo building $@ from $<
	build/ir-to-opencl $(DEBUG) $< $@

tensorflow/generated/%.cl: tensorflow/generated/%.ll build/ir-to-opencl
	echo building $@ from $<
	build/ir-to-opencl $(DEBUG) $< $@

test/generated/%-device.cl: test/%-device.ll build/ir-to-opencl
	echo building $@ from $<
	build/ir-to-opencl $(DEBUG) $< $@

# objects

## objects from hostside patched ll

build/%-hostpatched.o: test/generated/%-hostpatched.ll
	echo building $@ from $<
	$(CLANG) -c $< -O3 -o $@

## generic cpp objects, from cpp code
build/%.o: test/%.cpp easycl
	echo building $@ from $<
	$(CLANG) -std=c++11 -Isrc/EasyCL -c $< --cuda-host-only -O3 -o $@

# executables
build/test_call_cl: build/test_call_cl.o build/testcudakernel1-hostpatched.o test/generated/testcudakernel1-device.cl
	g++ -o build/test_call_cl build/test_call_cl.o build/testcudakernel1-hostpatched.o -lOpenCL -Lbuild -lEasyCL

.SECONDARY:
