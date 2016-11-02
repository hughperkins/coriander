# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

CLANG := clang++-3.8
LLVM_CONFIG := llvm-config-3.8
LLVM_INCLUDE := /usr/include/llvm-3.8

COCL_HOME := $(shell pwd)

PREFIX := /usr/local

# COMPILE_FLAGS=`$(LLVM_CONFIG) --cxxflags` -std=c++11
LINK_FLAGS := `$(LLVM_CONFIG) --ldflags --system-libs --libs all`
# the llvm-config compile flags suppresses asserts
COMPILE_FLAGS := -I/usr/lib/llvm-3.8/include -fPIC -fvisibility-inlines-hidden -ffunction-sections -fdata-sections -g -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -std=c++11

all: include/cocl/local_config.h build/ir-to-opencl build/patch-hostside build/libcocl.so build/clblast/libclblast.so build/libclew.so

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

build/argparsecpp.o: third_party/argparsecpp/argparsecpp.cpp third_party/argparsecpp/argparsecpp.h
	g++ -std=c++11 -c -fPIC -o $@ $< -I third_party/argparsecpp

build/ir-to-opencl: src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h build/mutations.o build/readIR.o build/struct_clone.o include/cocl/local_config.h build/argparsecpp.o
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/ir-to-opencl -g -I. -Ithird_party/argparsecpp -Iinclude -I$(LLVM_INCLUDE) src/ir-to-opencl.cpp build/struct_clone.o build/readIR.o src/ir-to-opencl-common.cpp build/mutations.o build/argparsecpp.o $(LINK_FLAGS)

build/patch-hostside: src/patch-hostside.cpp src/ir-to-opencl-common.cpp src/ir-to-opencl-common.h build/mutations.o build/struct_clone.o build/readIR.o build/struct_clone.o include/cocl/local_config.h
	mkdir -p build
	$(CLANG) $(COMPILE_FLAGS) -fcxx-exceptions -o build/patch-hostside -g -I$(LLVM_INCLUDE) src/patch-hostside.cpp build/readIR.o build/mutations.o build/struct_clone.o src/ir-to-opencl-common.cpp $(LINK_FLAGS)

build/easycl-%.o: src/EasyCL/%.cpp
	$(CLANG) -DUSE_CLEW -Isrc/EasyCL/thirdparty/clew/include -std=c++11 -fPIC -c -O2 -o $@ $< -Iinclude -Isrc/EasyCL

build/easycl-util-%.o: src/EasyCL/util/%.cpp
	$(CLANG) -DUSE_CLEW -std=c++11 -fPIC -c -O2 -Isrc/EasyCL -o $@ $<

build/clew-%.o: src/EasyCL/thirdparty/clew/src/%.c
	$(CLANG) -std=c++11 -fPIC -c -O2 -Isrc/EasyCL/thirdparty/clew/include -o $@ $<

build/hostside_opencl_funcs.o: src/hostside_opencl_funcs.cpp include/cocl/cocl*.h include/cocl/local_config.h
	$(CLANG) -DUSE_CLEW -c -o $@ -std=c++11 -fPIC -g -O2 -I$(COCL_HOME)/include -I$(COCL_HOME)/src/EasyCL $< \
		-I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include

build/cocl_%.o: src/cocl_%.cpp include/cocl/cocl*.h include/cocl/local_config.h
	$(CLANG) -DUSE_CLEW -I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include/proxy-opencl/ \
		 -I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include -c -o $@ -std=c++11 $(DCOCL_SPAM) \
		-fPIC -g -O2 -I$(COCL_HOME)/src/CLBlast/include -I$(COCL_HOME)/include -I$(COCL_HOME)/src/EasyCL $<

EASYCL_OBJS=build/easycl-EasyCL.o build/easycl-CLKernel.o build/easycl-CLWrapper.o build/easycl-platforminfo_helper.o \
	build/easycl-deviceinfo_helper.o build/easycl-util-easycl_stringhelper.o build/easycl-DevicesInfo.o build/easycl-DeviceInfo.o \

COCL_OBJS=build/hostside_opencl_funcs.o build/cocl_events.o build/cocl_blas.o build/cocl_device.o build/cocl_error.o build/cocl_memory.o \
	build/cocl_properties.o build/cocl_streams.o build/cocl_clsources.o build/cocl_context.o

build/libclew.so: build/clew-clew.o
	g++ -o build/libclew.so -shared $^ -ldl

build/libeasycl.so: $(EASYCL_OBJS) build/libclew.so
	g++ -o build/libeasycl.so -Wl,-rpath,\$${ORIGIN} -shared $(EASYCL_OBJS) -Lbuild -lclew

build/clblast/libclblast.so: build/libclew.so
	mkdir -p build/clblast
	cd build/clblast && cmake ../../src/CLBlast -DCMAKE_INSTALL_PREFIX=$(PREFIX) -DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-rpath,\$${ORIGIN} -Wl,-rpath,\$${ORIGIN}/.." -DBUILD_SHARED=ON \
		-DOPENCL_INCLUDE_DIRS=$(COCL_HOME)/src/EasyCL/thirdparty/clew/include/proxy-opencl/ \
		-DOPENCL_LIBRARIES=$(COCL_HOME)/build/libclew.so \
		-DCMAKE_CXX_FLAGS=-I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include
	cd build/clblast && make -j 4

build/libcocl.so: $(COCL_OBJS) build/libeasycl.so build/clblast/libclblast.so
	g++ -o build/libcocl.so -Wl,-rpath,\$${ORIGIN} -shared $(COCL_OBJS) -Lbuild -Lbuild/clblast -lclblast -leasycl -lclew

clean:
	rm -Rf build/* test/generated/* test/*.o

%-device.cl: %-device.ll build/ir-to-opencl
	build/ir-to-opencl $(DEBUG) $< $@

# cocl
build/test-multi1-%.o: test/cocl/multi1/%.cu
	$(COCL_HOME)/bin/cocl -c -o $@ $<

build/test-callinternal-%.o: test/cocl/callinternal/%.cu
	$(COCL_HOME)/bin/cocl -c -o $@ $<

build/test-%.o: test/cocl/%.cu
	$(COCL_HOME)/bin/cocl -I$(COCL_HOME)/src/EasyCL -g -c -o $@ $<

# executables
build/test-multi1: build/test-multi1-main.o build/test-multi1-k1.o build/test-multi1-k2.o build/libcocl.so
	g++ -o $@ build/test-multi1-main.o build/test-multi1-k1.o build/test-multi1-k2.o -g -lcocl -lclblast -lpthread

build/test-callinternal: build/test-callinternal-main.o build/test-callinternal-test_callinternal.o build/libcocl.so
	g++ -o $@ build/test-callinternal-main.o build/test-callinternal-test_callinternal.o -g -lcocl -lclblast -lpthread

build/test-%: build/test-%.o build/libcocl.so
	g++ -o $@ $< -g -lcocl -lclblast -lpthread -Lbuild -leasycl -lclew

# run
run-test-cuda_sample: build/test-cuda_sample
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-test_memhostalloc: build/test-test_memhostalloc
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testevents: build/test-testevents
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testevents2: build/test-testevents2
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testcumemcpy: build/test-testcumemcpy
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-teststream: build/test-teststream
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testmemcpydevicetodevice: build/test-testmemcpydevicetodevice
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testpartialcopy: build/test-testpartialcopy
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-offsetkernelargs: build/test-offsetkernelargs
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-test_bitcast: build/test-test_bitcast
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-byvaluestructwithpointer: build/test-byvaluestructwithpointer
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-test_types: build/test-test_types
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-callinternal: build/test-callinternal
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testfloat4: build/test-testfloat4
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-multithreading: build/test-multithreading
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-properties: build/test-properties
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-context: build/test-context
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-multigpu: build/test-multigpu
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testneg: build/test-testneg
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testshfl: build/test-testshfl
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-test_callbacks: build/test-test_callbacks
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testnullpointer: build/test-testnullpointer
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-test_kernelcachedok: build/test-test_kernelcachedok
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testblas: build/test-testblas
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-testmath: build/test-testmath
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

run-test-multi1: build/test-multi1
	################################
	# running:
	################################
	LD_LIBRARY_PATH=$(COCL_HOME)/build:$(COCL_HOME)/build/clblast $<

clean-tests:
	touch build/test~
	rm build/test*

run-tests: clean-tests all run-test-cuda_sample run-test-test_memhostalloc run-test-testevents run-test-testevents2 \
	run-test-testcumemcpy run-test-teststream run-test-testmemcpydevicetodevice run-test-testpartialcopy \
	run-test-offsetkernelargs run-test-test_bitcast run-test-byvaluestructwithpointer run-test-test_types \
	run-test-testnullpointer run-test-testshfl run-test-testneg \
	run-test-multi1 run-test-testblas run-test-testmath run-test-testfloat4 \
	run-test-test_callbacks run-test-test_kernelcachedok

.SECONDARY:

install: build/ir-to-opencl build/patch-hostside build/libcocl.so
	install -m 0755 build/ir-to-opencl $(PREFIX)/bin
	install -m 0755 build/patch-hostside $(PREFIX)/bin
	install -m 0644 build/libcocl.so $(PREFIX)/lib
	install -m 0644 build/libclew.so $(PREFIX)/lib
	install -m 0644 build/libeasycl.so $(PREFIX)/lib
	install -m 0644 build/clblast/libclblast.so $(PREFIX)/lib
	mkdir -p $(PREFIX)/share/cocl
	install -m 0644 share/cocl/cocl.Makefile $(PREFIX)/share/cocl/cocl.Makefile
	install -m 0755 bin/cocl $(PREFIX)/bin
	mkdir -p $(PREFIX)/include/cocl
	install -m 0644 include/cocl/*.h $(PREFIX)/include/cocl/
	install -m 0644 include/cocl/*.hpp $(PREFIX)/include/cocl/
	install -m 0644 src/EasyCL/thirdparty/clew/include/clew.h $(PREFIX)/include/

uninstall:
	rm -Rf $(PREFIX)/include/cocl
	rm -Rf $(PREFIX)/share/cocl
	rm -R $(PREFIX)/bin/cocl
	rm -R $(PREFIX)/bin/ir-to-opencl
	rm -R $(PREFIX)/bin/patch-hostside
	rm $(PREFIX)/lib/libcocl.so
	rm $(PREFIX)/lib/libclblast.so

install-dev:
	mkdir -p $(PREFIX)/share
	mkdir -p $(PREFIX)/include
	ln -sf `pwd`/bin/cocl $(PREFIX)/bin/cocl
	ln -Tnsf `pwd`/share/cocl $(PREFIX)/share/cocl
	ln -Tnsf `pwd`/include/cocl $(PREFIX)/include/cocl
	ln -sf `pwd`/build/libcocl.so $(PREFIX)/lib/libcocl.so
	ln -sf `pwd`/build/libclew.so $(PREFIX)/lib/libclew.so
	ln -sf `pwd`/build/libeasycl.so $(PREFIX)/lib/libeasycl.so
	ln -sf `pwd`/build/clblast/libclblast.so $(PREFIX)/lib/libclblast.so
	ln -sf `pwd`/build/ir-to-opencl $(PREFIX)/bin/ir-to-opencl
	ln -sf `pwd`/build/patch-hostside $(PREFIX)/bin/patch-hostside
	ln -sf `pwd`/src/EasyCL/thirdparty/clew/include/clew.h $(PREFIX)/include
	ln -sf `pwd`/src/EasyCL/ $(PREFIX)/include/

.PHONY: install uninstall install-dev clean-eigen clean-tests
