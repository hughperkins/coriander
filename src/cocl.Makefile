# In theory we should use eg cmake, but this gives us more control for now,
# and we only have like ~4 sourcecode files for now anyway

# INPUTBASEPATH should point to the input filename, without suffix, eg test/test_cuda_sample
# OUTPUTBASEPATH should point to the output filename, without suffix

CUDA_HOME=/usr/local/cuda-7.5
# EIGEN_HOME=/usr/local/eigen

CLANG=clang++-3.8
LLVM_CONFIG=llvm-config-3.8
LLVM_INCLUDE=/usr/include/llvm-3.8

# COMPILE_FLAGS=`$(LLVM_CONFIG) --cxxflags` -std=c++11
LINK_FLAGS=`$(LLVM_CONFIG) --ldflags --system-libs --libs all`
# the llvm-config compile flags suppresses asserts
COMPILE_FLAGS=-I/usr/lib/llvm-3.8/include -fPIC -fvisibility-inlines-hidden -ffunction-sections -fdata-sections -g -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -std=c++11

all: $(OUTPUTBASEPATH)$(OUTPUTPOSTFIX)

# $(OUTPUTBASEPATH)-device.ll: $(INPUTBASEPATH)$(INPUTPOSTFIX) $(COCL_HOME)/include/fake_funcs.h $(COCL_HOME)/build/ir-to-opencl
# 	echo building $@ from $<
# 	$(CLANG) $(PASSTHRU) -x cuda -std=c++11 -D__CUDA_ARCH__=300 -include $(COCL_HOME)/include/fake_funcs.h -I$(COCL_HOME)/include -I$(CUDA_HOME)/include $(INCLUDES) $< --cuda-device-only -emit-llvm -I/usr/include/x86_64-linux-gnu -O3 -S -o $@

# 	# $(CLANG) -x cuda -std=c++11 -DEIGEN_TEST_FUNC=cuda_elementwise_small -D__CUDA_ARCH__=300 -include include/fake_funcs.h -Iinclude -I$(EIGEN_HOME) -I$(EIGEN_HOME)/test -Itest/eigen
# 	#                                                                               -I$(CUDA_HOME)/include -I/usr/include/x86_64-linux-gnu $< --cuda-device-only -emit-llvm -O3 -S -o $@

$(OUTPUTBASEPATH)-device.ll: $(INPUTBASEPATH)$(INPUTPOSTFIX) $(COCL_HOME)/include/cocl/fake_funcs.h
	$(CLANG) $(PASSTHRU) -x cuda -std=c++11 -D__CUDA_ARCH__=300 -include $(COCL_HOME)/include/cocl/fake_funcs.h -I$(COCL_HOME)/include -I$(CUDA_HOME)/include $(INCLUDES) $< --cuda-device-only -emit-llvm -I/usr/include/x86_64-linux-gnu -O3 -S -o $@

	# $(CLANG) -x cuda -std=c++11 -DEIGEN_TEST_FUNC=cuda_elementwise_small -D__CUDA_ARCH__=300 -include include/fake_funcs.h -Iinclude -I$(EIGEN_HOME) -I$(EIGEN_HOME)/test -Itest/eigen
	#                                                                               -I$(CUDA_HOME)/include -I/usr/include/x86_64-linux-gnu $< --cuda-device-only -emit-llvm -O3 -S -o $@

$(OUTPUTBASEPATH)-device.cl: $(OUTPUTBASEPATH)-device.ll
	ir-to-opencl $(DEBUG) $< $@

$(OUTPUTBASEPATH)-hostraw.ll: $(INPUTBASEPATH)$(INPUTPOSTFIX) $(COCL_HOME)/include/cocl/fake_funcs.h
	$(CLANG) $(PASSTHRU) $(INCLUDES) -x cuda -std=c++11 -include $(COCL_HOME)/include/cocl/fake_funcs.h -I$(CUDA_HOME)/include $< --cuda-host-only -emit-llvm  -O3 -S -o $@

$(OUTPUTBASEPATH)-hostpatched.ll: $(OUTPUTBASEPATH)-hostraw.ll $(OUTPUTBASEPATH)-device.cl
	patch-hostside $< $(word 2,$^) $@

$(OUTPUTBASEPATH)$(OUTPUTPOSTFIX): $(OUTPUTBASEPATH)-hostpatched.ll
	$(CLANG) -c $< -O3 $(OPT_G) -o $@

.INTERMEDIATE: $(OUTPUTBASEPATH)-hostpatched.ll

# .SECONDARY: $(OUTPUTBASEPATH)-device.cl $(OUTPUTBASEPATH)-device.ll $(OUTPUTBASEPATH)-hostraw.ll
