# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

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

all: include/cocl/local_config.h build/ir-to-opencl build/patch-hostside build/libcocl.a

include/cocl/local_config.h: include/cocl/local_config.h.templ
	cp include/cocl/local_config.h.templ include/cocl/local_config.h

build/mutations.o: src/mutations.cpp src/mutations.h include/cocl/local_config.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -c -o $@ -g -I$(LLVM_INCLUDE) $<

build/readIR.o: src/readIR.cpp src/readIR.h include/cocl/local_config.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -c -o $@ -g -I$(LLVM_INCLUDE) $<

build/struct_clone.o: src/struct_clone.cpp src/struct_clone.h include/cocl/local_config.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -c -o $@ -g -I$(LLVM_INCLUDE) $<

build/ir-to-opencl: src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h build/mutations.o build/readIR.o build/struct_clone.o include/cocl/local_config.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/ir-to-opencl -g -I. -Iinclude -I$(LLVM_INCLUDE) src/ir-to-opencl.cpp build/struct_clone.o build/readIR.o src/ir-to-opencl-common.cpp build/mutations.o $(LINK_FLAGS)

build/patch-hostside: src/patch-hostside.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h build/mutations.o build/struct_clone.o build/readIR.o build/struct_clone.o include/cocl/local_config.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/patch-hostside -g -I$(LLVM_INCLUDE) src/patch-hostside.cpp build/readIR.o build/mutations.o build/struct_clone.o src/ir-to-opencl-common.cpp $(LINK_FLAGS)

build/easycl-%.o: src/EasyCL/%.cpp
	$(CLANG) -std=c++11 -fPIC -c -O2 -o $@ $< -Iinclude -Isrc/EasyCL

build/easycl-util-%.o: src/EasyCL/util/%.cpp
	$(CLANG) -std=c++11 -fPIC -c -O2 -Isrc/EasyCL -o $@ $<

clblast:
	git submodule update --init --recursive src/CLBlast
	mkdir -p build/clblast
	cd build/clblast && cmake ../../src/CLBlast -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_CXX_FLAGS=-fPIC -DBUILD_SHARED=OFF
	cd build/clblast && make -j 4

build/hostside_opencl_funcs.o: src/hostside_opencl_funcs.cpp include/cocl/cocl*.h include/cocl/local_config.h
	$(CLANG) -c -o $@ -std=c++11 -fPIC -g -O2 -I$(COCL_HOME)/include -I$(COCL_HOME)/src/EasyCL $<

build/cocl_%.o: src/cocl_%.cpp include/cocl/cocl*.h include/cocl/local_config.h
	$(CLANG) -c -o $@ -std=c++11 $(DCOCL_SPAM) -fPIC -g -O2 -I$(COCL_HOME)/src/CLBlast/include -I$(COCL_HOME)/include -I$(COCL_HOME)/src/EasyCL $<

EASYCL_OBJS=build/easycl-EasyCL.o build/easycl-CLKernel.o build/easycl-CLWrapper.o build/easycl-platforminfo_helper.o build/easycl-deviceinfo_helper.o build/easycl-util-easycl_stringhelper.o
COCL_OBJS=build/hostside_opencl_funcs.o build/cocl_events.o build/cocl_blas.o build/cocl_device.o build/cocl_error.o build/cocl_memory.o build/cocl_properties.o build/cocl_streams.o build/cocl_clsources.o build/cocl_context.o

build/libcocl.a: $(COCL_OBJS) clblast $(EASYCL_OBJS)
	mkdir -p $(COCL_HOME)/build/clblast-extract
	touch $(COCL_HOME)/build/clblast-extract/foo
	rm $(COCL_HOME)/build/clblast-extract/*
	(cd $(COCL_HOME)/build/clblast-extract/; ar x ../clblast/libclblast.a)
	ar rcs $@ $(EASYCL_OBJS) $(COCL_OBJS) $(COCL_HOME)/build/clblast-extract/*.o

clean:
	rm -Rf build/* test/generated/* test/*.o

%-device.cl: %-device.ll build/ir-to-opencl
	echo building $@ from $<
	build/ir-to-opencl $(DEBUG) $< $@

# cocl
build/test-cocl-multi1-%.o: test/cocl/multi1/%.cu
	echo building $@ from $<
	cocl -c -o $@ $<

build/test-cocl-callinternal-%.o: test/cocl/callinternal/%.cu
	echo building $@ from $<
	cocl -c -o $@ $<

build/test-cocl-%.o: test/cocl/%.cu
	echo building $@ from $<
	cocl -g -c -o $@ $<

# executables
build/test-cocl-multi1: build/test-cocl-multi1-main.o build/test-cocl-multi1-k1.o build/test-cocl-multi1-k2.o build/libcocl.a
	g++ -o $@ build/test-cocl-multi1-main.o build/test-cocl-multi1-k1.o build/test-cocl-multi1-k2.o -g -lcocl -lOpenCL

build/test-cocl-callinternal: build/test-cocl-callinternal-main.o build/test-cocl-callinternal-test_callinternal.o build/libcocl.a
	g++ -o $@ build/test-cocl-callinternal-main.o build/test-cocl-callinternal-test_callinternal.o -g -lcocl -lOpenCL

build/test-%: build/test-%.o build/libcocl.a
	g++ -o $@ $< -g -lcocl -lOpenCL

build/test-cocl-%: build/test-cocl-%.o build/libcocl.a
	g++ -o $@ $< -g -lcocl -lOpenCL

build/eigen-%: build/eigen-%.o build/libcocl.a
	g++ -o $@ $< -lcocl -lOpenCL

# run
run-test-cocl-cuda_sample: build/test-cocl-cuda_sample
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

run-test-cocl-offsetkernelargs: build/test-cocl-offsetkernelargs
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-test_bitcast: build/test-cocl-test_bitcast
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-byvaluestructwithpointer: build/test-cocl-byvaluestructwithpointer
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-test_types: build/test-cocl-test_types
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-callinternal: build/test-cocl-callinternal
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testfloat4: build/test-cocl-testfloat4
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testneg: build/test-cocl-testneg
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testshfl: build/test-cocl-testshfl
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testblas: build/test-cocl-testblas
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-testmath: build/test-cocl-testmath
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

run-test-cocl-multi1: build/test-cocl-multi1
	################################
	# running:
	################################
	LD_LIBRARY_PATH=build:$(LD_LIBRARY_PATH) $<

clean-tests:
	touch build/test~
	rm build/test*

run-tests: clean-tests all run-test-cocl-cuda_sample run-test-cocl-test_memhostalloc run-test-cocl-testevents run-test-cocl-testevents2 run-test-cocl-testcumemcpy run-test-cocl-teststream run-test-cocl-testmemcpydevicetodevice run-test-cocl-testpartialcopy run-test-cocl-offsetkernelargs run-test-cocl-test_bitcast run-test-cocl-byvaluestructwithpointer run-test-cocl-test_types run-test-cocl-multi1 run-test-cocl-testblas

.SECONDARY:

install: build/ir-to-opencl build/patch-hostside build/libcocl.a
	install -m 0755 build/ir-to-opencl $(PREFIX)/bin
	install -m 0755 build/patch-hostside $(PREFIX)/bin
	install -m 0644 build/libcocl.a $(PREFIX)/lib
	mkdir -p $(PREFIX)/share/cocl
	install -m 0644 share/cocl/cocl.Makefile $(PREFIX)/share/cocl/cocl.Makefile
	install -m 0755 bin/cocl $(PREFIX)/bin
	mkdir -p $(PREFIX)/include/cocl
	install -m 0644 include/cocl/*.h $(PREFIX)/include/cocl/
	install -m 0644 include/cocl/*.hpp $(PREFIX)/include/cocl/
	# install -m 0644 include/cocl/cuda.h $(PREFIX)/include/cocl/
	# install -m 0644 include/cocl/cuda_runtime.h $(PREFIX)/include/cocl/
	# install -m 0644 include/cocl/vector_types.h $(PREFIX)/include/cocl/
	# install -m 0644 include/cocl/math_constants.h $(PREFIX)/include/cocl/
	# install -m 0644 include/cocl/cocl_*.h $(PREFIX)/include/cocl/
	# install -m 0644 include/cocl/__clang_cuda_runtime_wrapper.h $(PREFIX)/include/cocl/
	# install -m 0644 include/cocl/fake_funcs.h $(PREFIX)/include/cocl/

uninstall:
	rm -Rf $(PREFIX)/include/cocl
	rm -Rf $(PREFIX)/share/cocl
	rm -R $(PREFIX)/bin/cocl
	rm -R $(PREFIX)/bin/ir-to-opencl
	rm -R $(PREFIX)/bin/patch-hostside
	rm $(PREFIX)/lib/libcocl.a

install-dev:
	mkdir -p $(PREFIX)/share
	mkdir -p $(PREFIX)/include
	ln -sf `pwd`/bin/cocl $(PREFIX)/bin/cocl
	ln -nsf `pwd`/share/cocl $(PREFIX)/share/cocl
	ln -nsf `pwd`/include/cocl $(PREFIX)/include/cocl
	ln -sf `pwd`/build/libcocl.a $(PREFIX)/lib/libcocl.a
	ln -sf `pwd`/build/ir-to-opencl $(PREFIX)/bin/ir-to-opencl
	ln -sf `pwd`/build/patch-hostside $(PREFIX)/bin/patch-hostside

.PHONY: install uninstall install-dev clean-eigen clean-tests
