# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

# INPUTBASEPATH should point to the input filename, without suffix, eg test/test_cuda_sample
# OUTPUTBASEPATH should point to the output filename, without suffix

# note: on ubuntu 16.04, needed to do: sudo apt-get install libc6-dev-i386

# CLANG=clang++-3.8
# LLVM_CONFIG=llvm-config

# COMPILE_FLAGS=`$(LLVM_CONFIG) --cxxflags` -std=c++11
LLVM_LINK_FLAGS=`$(CLANG_HOME)/bin/llvm-config --ldflags --system-libs --libs all`
# the llvm-config compile flags suppresses asserts
# COMPILE_FLAGS=-I$(CLANG_HOME)/include -fPIC -fvisibility-inlines-hidden -ffunction-sections -fdata-sections -g -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -std=c++11
LLVM_COMPILE_FLAGS=`$(CLANG_HOME)/bin/llvm-config --cppflags --cxxflags | sed -e 's/ -fno-exceptions/ -fexceptions/g' -e 's/ -DNDEBUG//g' -e 's/ -std=c++0x/ -std=c++11/g'`

all: $(OUTPUTBASEPATH)$(OUTPUTPOSTFIX)

$(OUTPUTBASEPATH)-device-noopt.ll: $(INPUTBASEPATH)$(INPUTPOSTFIX) $(COCL_HOME)/include/cocl/fake_funcs.h
	echo $(LLVM_COMPILE_FLAGS)
	$(CLANG_HOME)/bin/clang++ $(PASSTHRU) -DUSE_CLEW -x cuda -std=c++11 --cuda-gpu-arch=sm_30 -D__CUDA_ARCH__=300 \
		-I$(COCL_HOME)/include/EasyCL \
		-I$(COCL_HOME)/include/cocl \
		-I$(COCL_HOME)/src \
		-I$(COCL_HOME)/src/EasyCL \
		-I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include \
		-include $(COCL_HOME)/include/cocl/cocl.h \
		-include $(COCL_HOME)/include/cocl/fake_funcs.h \
		-include $(COCL_HOME)/include/cocl/cocl_deviceside.h \
		-I$(COCL_HOME)/include \
		$(INCLUDES) \
		--cuda-device-only -emit-llvm -O0 -S \
		$< -o $@

		# -nostdinc -nostdinc++ \
		# -I/usr/include/x86_64-linux-gnu \
		# $(LLVM_COMPILE_FLAGS) \

$(OUTPUTBASEPATH)-device.ll: $(OUTPUTBASEPATH)-device-noopt.ll
	$(CLANG_HOME)/bin/opt $(DEVICELLOPT) -S -o $@ $<

# $(OUTPUTBASEPATH)-device.cl: $(OUTPUTBASEPATH)-device.ll ${COCL_BIN}/ir-to-opencl
# 	$(COCL_BIN)/ir-to-opencl $(IROOPENCLARGS) $(DEBUG) --inputfile $< --outputfile $@

$(OUTPUTBASEPATH)-hostraw.ll: $(INPUTBASEPATH)$(INPUTPOSTFIX) $(COCL_HOME)/include/cocl/fake_funcs.h
	$(CLANG_HOME)/bin/clang++ $(PASSTHRU) \
		$(INCLUDES) -x cuda -DUSE_CLEW -std=c++11 \
		$(LLVM_COMPILE_FLAGS) \
		-I$(COCL_HOME)/include \
		-I$(COCL_HOME)/include/EasyCL \
		-I$(COCL_HOME)/include/cocl \
		-I$(COCL_HOME)/src \
		-I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include \
		-I$(COCL_HOME)/src/EasyCL \
		-include $(COCL_HOME)/include/cocl/cocl.h \
		-include $(COCL_HOME)/include/cocl/fake_funcs.h \
		-include $(COCL_HOME)/include/cocl/cocl_hostside.h \
		--cuda-host-only -emit-llvm  -O3 -S \
		$< -o $@


$(OUTPUTBASEPATH)-hostpatched.ll: $(OUTPUTBASEPATH)-hostraw.ll $(OUTPUTBASEPATH)-device.ll ${COCL_BIN}/patch-hostside
	$(COCL_BIN)/patch-hostside \
		--hostrawfile $(OUTPUTBASEPATH)-hostraw.ll \
		--devicellfile $(OUTPUTBASEPATH)-device.ll \
		--hostpatchedfile $@

$(OUTPUTBASEPATH)$(OUTPUTPOSTFIX): $(OUTPUTBASEPATH)-hostpatched.ll
	$(CLANG_HOME)/bin/clang++ $(PASSTHRU) -DUSE_CLEW -c $< -O3 $(OPT_G) -o $@

$(OUTPUTBASEPATH)$(FINALPOSTFIX): $(OUTPUTBASEPATH)$(OUTPUTPOSTFIX) ${COCL_LIB}/libclew.so ${COCL_LIB}/libcocl.so ${COCL_LIB}/libclblast.so
	g++ -Wl,-rpath,$(COCL_LIB) -Wl,-rpath,$$ORIGIN -o $@ $< -L${COCL_LIB} -lcocl -lclblast -leasycl -lclew -lpthread ${LINK_FLAGS}

# .INTERMEDIATE: $(OUTPUTBASEPATH)-hostpatched.ll

.SECONDARY: $(OUTPUTBASEPATH)-device.cl $(OUTPUTBASEPATH)-device.ll $(OUTPUTBASEPATH)-hostraw.ll $(OUTPUTBASEPATH)-hostpatched.ll
