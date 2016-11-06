# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

# INPUTBASEPATH should point to the input filename, without suffix, eg test/test_cuda_sample
# OUTPUTBASEPATH should point to the output filename, without suffix

CLANG=clang++-3.8
LLVM_CONFIG=llvm-config-3.8
LLVM_INCLUDE=/usr/include/llvm-3.8

# COMPILE_FLAGS=`$(LLVM_CONFIG) --cxxflags` -std=c++11
LINK_FLAGS=`$(LLVM_CONFIG) --ldflags --system-libs --libs all`
# the llvm-config compile flags suppresses asserts
COMPILE_FLAGS=-I/usr/lib/llvm-3.8/include -fPIC -fvisibility-inlines-hidden -ffunction-sections -fdata-sections -g -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -std=c++11

all: $(OUTPUTBASEPATH)$(OUTPUTPOSTFIX)

$(OUTPUTBASEPATH)-device-noopt.ll: $(INPUTBASEPATH)$(INPUTPOSTFIX) $(COCL_HOME)/include/cocl/fake_funcs.h
	$(CLANG) $(PASSTHRU) -DUSE_CLEW -x cuda -std=c++11 --cuda-gpu-arch=sm_30 -D__CUDA_ARCH__=300 -I$(COCL_HOME)/include/EasyCL -I$(COCL_HOME)/include/cocl -I$(COCL_HOME)/src/EasyCL -I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include -include $(COCL_HOME)/include/cocl/cocl.h -include $(COCL_HOME)/include/cocl/fake_funcs.h -include $(COCL_HOME)/include/cocl/cocl_deviceside.h -I$(COCL_HOME)/include $(INCLUDES) $< --cuda-device-only -emit-llvm -I/usr/include/x86_64-linux-gnu -O0 -S -o $@

$(OUTPUTBASEPATH)-device.ll: $(OUTPUTBASEPATH)-device-noopt.ll
	opt-3.8 -inline -mem2reg -instcombine -S -o $@ $<

$(OUTPUTBASEPATH)-device.cl: $(OUTPUTBASEPATH)-device.ll ${COCL_BIN}/ir-to-opencl
	$(COCL_BIN)/ir-to-opencl $(IROOPENCLARGS) $(DEBUG) --inputfile $< --outputfile $@

$(OUTPUTBASEPATH)-hostraw.ll: $(INPUTBASEPATH)$(INPUTPOSTFIX) $(COCL_HOME)/include/cocl/fake_funcs.h
	$(CLANG) $(PASSTHRU) $(INCLUDES) -x cuda -DUSE_CLEW -std=c++11 -I$(COCL_HOME)/include -I$(COCL_HOME)/include/EasyCL -I$(COCL_HOME)/include/cocl -I$(COCL_HOME)/src/EasyCL/thirdparty/clew/include -I$(COCL_HOME)/src/EasyCL -include $(COCL_HOME)/include/cocl/cocl.h -include $(COCL_HOME)/include/cocl/fake_funcs.h -include $(COCL_HOME)/include/cocl/cocl_hostside.h $< --cuda-host-only -emit-llvm  -O3 -S -o $@

$(OUTPUTBASEPATH)-hostpatched.ll: $(OUTPUTBASEPATH)-hostraw.ll $(OUTPUTBASEPATH)-device.ll $(OUTPUTBASEPATH)-device.cl ${COCL_BIN}/patch-hostside
	$(COCL_BIN)/patch-hostside \
		--hostrawfile $(OUTPUTBASEPATH)-hostraw.ll \
		--deviceclfile $(OUTPUTBASEPATH)-device.cl \
		--devicellfile $(OUTPUTBASEPATH)-device.ll \
		--hostpatchedfile $@

$(OUTPUTBASEPATH)$(OUTPUTPOSTFIX): $(OUTPUTBASEPATH)-hostpatched.ll
	$(CLANG) $(PASSTHRU) -DUSE_CLEW -c $< -O3 $(OPT_G) -o $@

$(OUTPUTBASEPATH)$(FINALPOSTFIX): $(OUTPUTBASEPATH)$(OUTPUTPOSTFIX) ${COCL_LIB}/libclew.so ${COCL_LIB}/libcocl.so ${COCL_LIB}/libclblast.so
	g++ -Wl,-rpath,$(COCL_LIB) -Wl,-rpath,$$ORIGIN -o $@ $< -L${COCL_LIB} -lcocl -lclblast -leasycl -lclew -lpthread

# .INTERMEDIATE: $(OUTPUTBASEPATH)-hostpatched.ll

.SECONDARY: $(OUTPUTBASEPATH)-device.cl $(OUTPUTBASEPATH)-device.ll $(OUTPUTBASEPATH)-hostraw.ll $(OUTPUTBASEPATH)-hostpatched.ll
