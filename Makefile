# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

CUDA_HOME=/usr/local/cuda-7.5
EIGEN_HOME=/usr/local/eigen

CLANG=clang++-3.8
LLVM_CONFIG=llvm-config-3.8
LLVM_INCLUDE=/usr/include/llvm-3.8

COCL_HOME=`pwd`

PREFIX=/usr/local

# COMPILE_FLAGS=`$(LLVM_CONFIG) --cxxflags` -std=c++11
LINK_FLAGS=`$(LLVM_CONFIG) --ldflags --system-libs --libs all`
# the llvm-config compile flags suppresses asserts
COMPILE_FLAGS=-I/usr/lib/llvm-3.8/include -fPIC -fvisibility-inlines-hidden -ffunction-sections -fdata-sections -g -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -std=c++11

all: build/ir-to-opencl build/patch-hostside build/libcocl.a easycl

build/ir-to-opencl: src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/ir-to-opencl -g -I$(LLVM_INCLUDE) src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp $(LINK_FLAGS)

build/patch-hostside: src/patch-hostside.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/patch-hostside -g -I$(LLVM_INCLUDE) src/patch-hostside.cpp src/ir-to-opencl-common.cpp $(LINK_FLAGS)

easycl:
	git submodule update --init --recursive
	cd build && cmake ../src/EasyCL -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_TESTS=OFF -DUSE_CLEW=OFF -DBUILD_SHARED=OFF
	cd build && make -j 4

build/hostside_opencl_funcs.o: src/hostside_opencl_funcs.cpp src/cocl*.h
	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/include -I$(COCL_HOME)/src/EasyCL $<

build/cocl_%.o: src/cocl_%.cpp src/cocl*.h
	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/src/EasyCL $<

# build/cocl_events.o: src/cocl_events.cpp src/cocl*.h
# 	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/src/EasyCL $<

# build/cocl_device.o: src/cocl_device.cpp src/cocl*.h
# 	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/src/EasyCL $<

# build/cocl_memory.o: src/cocl_memory.cpp src/cocl*.h
# 	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/src/EasyCL $<

# build/cocl_properties.o: src/cocl_properties.cpp src/cocl*.h
# 	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/src/EasyCL $<

# build/cocl_streams.o: src/cocl_streams.cpp src/cocl*.h
# 	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/src/EasyCL $<

# build/cocl_context.o: src/cocl_context.cpp src/cocl*.h
# 	$(CLANG) -c -o $@ -std=c++11 -g -O2 -I$(COCL_HOME)/src/EasyCL $<

build/libcocl.a: build/hostside_opencl_funcs.o build/cocl_events.o build/cocl_error.o build/cocl_memory.o build/cocl_device.o build/cocl_properties.o build/cocl_streams.o build/cocl_context.o easycl
	mkdir -p $(COCL_HOME)/build/easycl-extract
	touch $(COCL_HOME)/build/easycl-extract/foo
	rm $(COCL_HOME)/build/easycl-extract/*
	(cd $(COCL_HOME)/build/easycl-extract/; ar x ../libEasyCL.a)
	ar rcs $@ build/hostside_opencl_funcs.o build/cocl_events.o build/cocl_device.o build/cocl_error.o build/cocl_memory.o build/cocl_properties.o build/cocl_streams.o build/cocl_context.o $(COCL_HOME)/build/easycl-extract/*.o

clean:
	rm -Rf build/* test/generated/* test/eigen/generated/* test/eigen/*.o test/*.o

# IR

# deviceside goes directly from .cu => -device.ll

test/generated/%-device.ll: test/%.cu include/fake_funcs.h build/ir-to-opencl
	echo building $@ from $<
	mkdir -p test/generated
	$(CLANG) -include include/fake_funcs.h -I$(CUDA_HOME)/include $< --cuda-device-only -emit-llvm -std=c++11 -I/usr/include/x86_64-linux-gnu -O3 -S -o $@

test/eigen/generated/%-device.ll: test/eigen/%.cu include/fake_funcs.h build/ir-to-opencl
	echo building $@ from $<
	mkdir -p test/eigen/generated
	$(CLANG) -x cuda -std=c++11 -DEIGEN_TEST_FUNC=cuda_elementwise_small -D__CUDA_ARCH__=300 -include include/fake_funcs.h -Iinclude -I$(EIGEN_HOME) -I$(EIGEN_HOME)/test -Itest/eigen -I$(CUDA_HOME)/include -I/usr/include/x86_64-linux-gnu $< --cuda-device-only -emit-llvm -O3 -S -o $@

# opencl (from the -device.ll)

%-device.cl: %-device.ll build/ir-to-opencl
	echo building $@ from $<
	build/ir-to-opencl $(DEBUG) $< $@

test/generated/%-device.cl: test/%-device.ll build/ir-to-opencl
	echo building $@ from $<
	build/ir-to-opencl $(DEBUG) $< $@

# cocl
build/test-cocl-multi1-%.o: test/cocl/multi1/%.cu
	echo building $@ from $<
	cocl -c -o $@ $<

build/eigen-%.o: test/eigen/%.cu
	echo building $@ from $<
	cocl -I$(EIGEN_HOME) -I$(EIGEN_HOME)/test -I$(COCL_HOME)/test/eigen -c -o $@ $<

build/test-%.o: test/%.cu
	echo building $@ from $<
	cocl -I$(EIGEN_HOME) -g -I$(EIGEN_HOME)/test -I$(COCL_HOME)/test/eigen -c -o $@ $<

build/test-cocl-%.o: test/cocl/%.cu
	echo building $@ from $<
	cocl -I$(EIGEN_HOME) -g -I$(EIGEN_HOME)/test -I$(COCL_HOME)/test/eigen -c -o $@ $<

# executables
build/test-cocl-multi1: build/test-cocl-multi1-main.o build/test-cocl-multi1-k1.o build/test-cocl-multi1-k2.o build/libcocl.a
	g++ -o $@ build/test-cocl-multi1-main.o build/test-cocl-multi1-k1.o build/test-cocl-multi1-k2.o -g -lcocl -lOpenCL -Lbuild -lEasyCL

build/test-%: build/test-%.o build/libcocl.a
	g++ -o $@ $< -g -lcocl -lOpenCL -Lbuild -lEasyCL

build/test-cocl-%: build/test-cocl-%.o build/libcocl.a
	g++ -o $@ $< -g -lcocl -lOpenCL -Lbuild -lEasyCL

build/eigen-%: build/eigen-%.o build/libcocl.a
	g++ -o $@ $< -lcocl -lOpenCL -Lbuild -lEasyCL

# run
run-cuda_sample: build/test-cuda_sample
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-test_memhostalloc: build/test-cocl-test_memhostalloc
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testevents: build/test-cocl-testevents
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testevents2: build/test-cocl-testevents2
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testcumemcpy: build/test-cocl-testcumemcpy
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-teststream: build/test-cocl-teststream
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testmemcpydevicetodevice: build/test-cocl-testmemcpydevicetodevice
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testpartialcopy: build/test-cocl-testpartialcopy
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-multi1: build/test-cocl-multi1
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-eigen-test_cuda_elementwise_small: build/eigen-test_cuda_elementwise_small
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-eigen-test_cuda_nullary: build/eigen-test_cuda_nullary
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-eigen-test_cuda_elementwise: build/eigen-test_cuda_elementwise
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-eigen-cxx11_tensor_cuda: build/eigen-cxx11_tensor_cuda
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) build/eigen-cxx11_tensor_cuda

run-test-all: all run-cuda_sample run-test-cocl-test_memhostalloc run-test-cocl-testevents run-test-cocl-testevents2 run-test-cocl-testcumemcpy run-test-cocl-teststream run-eigen-test_cuda_elementwise_small run-eigen-test_cuda_nullary run-eigen-test_cuda_elementwise

.SECONDARY:

install: build/ir-to-opencl build/patch-hostside build/libcocl.a
	install -m 0755 build/ir-to-opencl $(PREFIX)/bin
	install -m 0755 build/patch-hostside $(PREFIX)/bin
	install -m 0644 build/libcocl.a $(PREFIX)/lib
	mkdir -p $(PREFIX)/share/cocl
	install -m 0644 src/cocl.Makefile $(PREFIX)/share/cocl/cocl.Makefile
	install -m 0755 bin/cocl $(PREFIX)/bin
	mkdir -p $(PREFIX)/include/cocl
	install -m 0644 include/__clang_cuda_runtime_wrapper.h $(PREFIX)/include/cocl/
	install -m 0644 include/fake_funcs.h $(PREFIX)/include/cocl/
	# install -m 0644 build/libEasyCL.a $(PREFIX)/lib
#	install -m 0644 build/libcocl.a $(PREFIX)/lib

.PHONY: install
