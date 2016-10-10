; ModuleID = 'test/eigen/test_cuda_nullary.cu'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char> > >::_Vector_impl" }
%"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char> > >::_Vector_impl" = type { %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"* }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct.CUstream_st = type opaque
%"struct.std::atomic" = type { %"struct.std::__atomic_base" }
%"struct.std::__atomic_base" = type { i8 }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32 }
%"class.std::__cxx11::basic_stringstream" = type { %"class.std::basic_iostream.base", %"class.std::__cxx11::basic_stringbuf", %"class.std::basic_ios" }
%"class.std::basic_iostream.base" = type { %"class.std::basic_istream.base", %"class.std::basic_ostream.base" }
%"class.std::basic_istream.base" = type { i32 (...)**, i64 }
%"class.std::basic_ostream.base" = type { i32 (...)** }
%"class.std::__cxx11::basic_stringbuf" = type { %"class.std::basic_streambuf", i32, %"class.std::__cxx11::basic_string" }
%"class.Eigen::TensorAssignOp.23" = type { %"class.Eigen::TensorMap"*, %"class.Eigen::TensorCwiseNullaryOp.7"* }
%"class.Eigen::TensorMap" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [1 x i32] }
%"class.Eigen::TensorCwiseNullaryOp.7" = type { %"class.Eigen::TensorMap"*, %"class.Eigen::internal::UniformRandomGenerator" }
%"class.Eigen::internal::UniformRandomGenerator" = type { i64 }
%struct.timespec = type { i64, i64 }
%"class.Eigen::TensorAssignOp.15" = type { %"class.Eigen::TensorMap"*, %"class.Eigen::TensorCwiseNullaryOp"* }
%"class.Eigen::TensorCwiseNullaryOp" = type <{ %"class.Eigen::TensorMap"*, %"struct.Eigen::internal::scalar_constant_op", [4 x i8] }>
%"struct.Eigen::internal::scalar_constant_op" = type { float }
%"class.Eigen::TensorAssignOp" = type { %"class.Eigen::Tensor"*, %"class.Eigen::TensorCwiseNullaryOp.9"* }
%"class.Eigen::Tensor" = type { %"class.Eigen::TensorStorage" }
%"class.Eigen::TensorStorage" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%"class.Eigen::TensorCwiseNullaryOp.9" = type { %"class.Eigen::Tensor"*, %"class.Eigen::internal::UniformRandomGenerator" }
%"struct.Eigen::DefaultDevice" = type { i8 }
%"class.Eigen::CudaStreamDevice" = type { %"class.Eigen::StreamInterface", %struct.CUstream_st**, i32, i8*, i32* }
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"struct.Eigen::TensorEvaluator.17" = type { %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.19" }
%"struct.Eigen::TensorEvaluator.18" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.19" = type <{ %"struct.Eigen::internal::scalar_constant_op", [4 x i8], %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::internal::nullary_wrapper.21", [7 x i8] }>
%"struct.Eigen::TensorEvaluator.20" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::internal::nullary_wrapper.21" = type { i8 }
%"struct.Eigen::TensorEvaluator.25" = type { %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.26" }
%"struct.Eigen::TensorEvaluator.26" = type <{ %"class.Eigen::internal::UniformRandomGenerator", %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::internal::nullary_wrapper", [7 x i8] }>
%"struct.Eigen::internal::nullary_wrapper" = type { i8 }

$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev = comdat any

$_Z22set_repeat_from_stringPKc = comdat any

$_Z20set_seed_from_stringPKc = comdat any

$_ZN5Eigen16CudaStreamDeviceC2Ev = comdat any

$_Z11verify_implbPKcS0_iS0_ = comdat any

$_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_ = comdat any

$_ZN5Eigen13test_is_equalIffEEbRKT_RKT0_b = comdat any

$_ZN5Eigen16CudaStreamDeviceD2Ev = comdat any

$_ZN5Eigen16CudaStreamDeviceD0Ev = comdat any

$_ZNK5Eigen16CudaStreamDevice6streamEv = comdat any

$_ZNK5Eigen16CudaStreamDevice16devicePropertiesEv = comdat any

$_ZNK5Eigen16CudaStreamDevice8allocateEm = comdat any

$_ZNK5Eigen16CudaStreamDevice10deallocateEPv = comdat any

$_ZNK5Eigen16CudaStreamDevice10scratchpadEv = comdat any

$_ZNK5Eigen16CudaStreamDevice9semaphoreEv = comdat any

$__clang_call_terminate = comdat any

$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_ = comdat any

$_ZN5Eigen8internal19throw_std_bad_allocEv = comdat any

$_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0EiEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_ = comdat any

$_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZTVN5Eigen16CudaStreamDeviceE = comdat any

$_ZTSN5Eigen16CudaStreamDeviceE = comdat any

$_ZTSN5Eigen15StreamInterfaceE = comdat any

$_ZTIN5Eigen15StreamInterfaceE = comdat any

$_ZTIN5Eigen16CudaStreamDeviceE = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZN5EigenL12g_test_stackB5cxx11E = internal global %"class.std::vector" zeroinitializer, align 8
@.str = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"double\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"long double\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"complex<float>\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"complex<double>\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"complex<long double>\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"complex<int>\00", align 1
@_ZN5EigenL16g_has_set_repeatE = internal unnamed_addr global i1 false
@_ZN5EigenL14g_has_set_seedE = internal unnamed_addr global i1 false
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.9 = private unnamed_addr constant [10 x i8] c"Argument \00", align 1
@.str.10 = private unnamed_addr constant [36 x i8] c" conflicting with a former argument\00", align 1
@.str.11 = private unnamed_addr constant [62 x i8] c"This test application takes the following optional arguments:\00", align 1
@.str.12 = private unnamed_addr constant [45 x i8] c"  rN     Repeat each test N times (default: \00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.14 = private unnamed_addr constant [75 x i8] c"  sN     Use N as seed for random numbers (default: based on current time)\00", align 1
@.str.15 = private unnamed_addr constant [66 x i8] c"If defined, the environment variables EIGEN_REPEAT and EIGEN_SEED\00", align 1
@.str.16 = private unnamed_addr constant [53 x i8] c"will be used as default values for these parameters.\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"EIGEN_REPEAT\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"EIGEN_SEED\00", align 1
@_ZN5EigenL6g_seedE = internal unnamed_addr global i32 0, align 4
@_ZN5EigenL8g_repeatE = internal unnamed_addr global i32 0, align 4
@.str.19 = private unnamed_addr constant [48 x i8] c"Initializing random number generator with seed \00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"Seed: \00", align 1
@.str.21 = private unnamed_addr constant [21 x i8] c"Repeating each test \00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c" times\00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"cuda_nullary\00", align 1
@.str.24 = private unnamed_addr constant [110 x i8] c"cudaMemcpyAsync(new1.data(), d_in1, tensor_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess\00", align 1
@.str.25 = private unnamed_addr constant [32 x i8] c"test/eigen/test_cuda_nullary.cu\00", align 1
@__PRETTY_FUNCTION__._Z17test_cuda_nullaryv = private unnamed_addr constant [25 x i8] c"void test_cuda_nullary()\00", align 1
@.str.26 = private unnamed_addr constant [110 x i8] c"cudaMemcpyAsync(new2.data(), d_in2, tensor_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess\00", align 1
@.str.27 = private unnamed_addr constant [58 x i8] c"cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess\00", align 1
@.str.28 = private unnamed_addr constant [31 x i8] c"verifyIsApprox(new1(i), 3.14f)\00", align 1
@.str.29 = private unnamed_addr constant [38 x i8] c"test_is_equal(new2(i), in2(i), false)\00", align 1
@.str.30 = private unnamed_addr constant [22 x i8] c"Invalid repeat value \00", align 1
@.str.31 = private unnamed_addr constant [20 x i8] c"Invalid seed value \00", align 1
@_ZTVN5Eigen16CudaStreamDeviceE = linkonce_odr unnamed_addr constant [10 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN5Eigen16CudaStreamDeviceE to i8*), i8* bitcast (void (%"class.Eigen::CudaStreamDevice"*)* @_ZN5Eigen16CudaStreamDeviceD2Ev to i8*), i8* bitcast (void (%"class.Eigen::CudaStreamDevice"*)* @_ZN5Eigen16CudaStreamDeviceD0Ev to i8*), i8* bitcast (%struct.CUstream_st** (%"class.Eigen::CudaStreamDevice"*)* @_ZNK5Eigen16CudaStreamDevice6streamEv to i8*), i8* bitcast (%struct.cudaDeviceProp* (%"class.Eigen::CudaStreamDevice"*)* @_ZNK5Eigen16CudaStreamDevice16devicePropertiesEv to i8*), i8* bitcast (i8* (%"class.Eigen::CudaStreamDevice"*, i64)* @_ZNK5Eigen16CudaStreamDevice8allocateEm to i8*), i8* bitcast (void (%"class.Eigen::CudaStreamDevice"*, i8*)* @_ZNK5Eigen16CudaStreamDevice10deallocateEPv to i8*), i8* bitcast (i8* (%"class.Eigen::CudaStreamDevice"*)* @_ZNK5Eigen16CudaStreamDevice10scratchpadEv to i8*), i8* bitcast (i32* (%"class.Eigen::CudaStreamDevice"*)* @_ZNK5Eigen16CudaStreamDevice9semaphoreEv to i8*)], comdat, align 8
@_ZN5EigenL14default_streamE = internal constant %struct.CUstream_st* null, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSN5Eigen16CudaStreamDeviceE = linkonce_odr constant [27 x i8] c"N5Eigen16CudaStreamDeviceE\00", comdat
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN5Eigen15StreamInterfaceE = linkonce_odr constant [26 x i8] c"N5Eigen15StreamInterfaceE\00", comdat
@_ZTIN5Eigen15StreamInterfaceE = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSN5Eigen15StreamInterfaceE, i32 0, i32 0) }, comdat
@_ZTIN5Eigen16CudaStreamDeviceE = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @_ZTSN5Eigen16CudaStreamDeviceE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN5Eigen15StreamInterfaceE to i8*) }, comdat
@_ZN5EigenL23m_devicePropInitializedE = internal unnamed_addr global i1 false
@_ZZN5EigenL20initializeDevicePropEvE5first = internal global %"struct.std::atomic" { %"struct.std::__atomic_base" { i8 1 } }, align 1
@_ZSt4cerr = external global %"class.std::basic_ostream", align 8
@.str.32 = private unnamed_addr constant [43 x i8] c"Failed to get the number of CUDA devices: \00", align 1
@.str.33 = private unnamed_addr constant [22 x i8] c"status == cudaSuccess\00", align 1
@.str.34 = private unnamed_addr constant [71 x i8] c"/usr/local/eigen/unsupported/Eigen/CXX11/src/Tensor/TensorDeviceCuda.h\00", align 1
@__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv = private unnamed_addr constant [35 x i8] c"void Eigen::initializeDeviceProp()\00", align 1
@_ZN5EigenL18m_devicePropertiesE = internal unnamed_addr global %struct.cudaDeviceProp* null, align 8
@.str.35 = private unnamed_addr constant [35 x i8] c"Failed to initialize CUDA device #\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.37 = private unnamed_addr constant [19 x i8] c"err == cudaSuccess\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm = private unnamed_addr constant [62 x i8] c"virtual void *Eigen::CudaStreamDevice::allocate(size_t) const\00", align 1
@.str.38 = private unnamed_addr constant [15 x i8] c"result != NULL\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv = private unnamed_addr constant [63 x i8] c"virtual void Eigen::CudaStreamDevice::deallocate(void *) const\00", align 1
@.str.39 = private unnamed_addr constant [15 x i8] c"buffer != NULL\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice9semaphoreEv = private unnamed_addr constant [65 x i8] c"virtual unsigned int *Eigen::CudaStreamDevice::semaphore() const\00", align 1
@.str.41 = private unnamed_addr constant [6 x i8] c"Test \00", align 1
@.str.42 = private unnamed_addr constant [12 x i8] c" failed in \00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.44 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.45 = private unnamed_addr constant [8 x i8] c"Stack:\0A\00", align 1
@.str.46 = private unnamed_addr constant [5 x i8] c"  - \00", align 1
@.str.47 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [10 x i8*]
@_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [16 x i8*]
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external unnamed_addr constant [16 x i8*]
@_ZTISt9bad_alloc = external constant i8*
@_ZTVSt9bad_alloc = external unnamed_addr constant [5 x i8*], align 8
@.str.50 = private unnamed_addr constant [34 x i8] c"cudaGetLastError() == cudaSuccess\00", align 1
@.str.51 = private unnamed_addr constant [69 x i8] c"/usr/local/eigen/unsupported/Eigen/CXX11/src/Tensor/TensorExecutor.h\00", align 1
@__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_ = private unnamed_addr constant [633 x i8] c"static void Eigen::internal::TensorExecutor<const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16>, const Eigen::TensorCwiseNullaryOp<Eigen::internal::scalar_constant_op<float>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16> > >, Eigen::GpuDevice, true>::run(const Expression &, const Eigen::GpuDevice &) [Expression = const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16>, const Eigen::TensorCwiseNullaryOp<Eigen::internal::scalar_constant_op<float>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16> > >, Device = Eigen::GpuDevice, Vectorizable = true]\00", align 1
@__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_ = private unnamed_addr constant [641 x i8] c"static void Eigen::internal::TensorExecutor<const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16>, const Eigen::TensorCwiseNullaryOp<Eigen::internal::UniformRandomGenerator<float>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16> > >, Eigen::GpuDevice, true>::run(const Expression &, const Eigen::GpuDevice &) [Expression = const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16>, const Eigen::TensorCwiseNullaryOp<Eigen::internal::UniformRandomGenerator<float>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, 16> > >, Device = Eigen::GpuDevice, Vectorizable = true]\00", align 1
@.str.52 = private unnamed_addr constant [36 x i8] c"Difference too large wrt tolerance \00", align 1
@.str.53 = private unnamed_addr constant [22 x i8] c", relative error is: \00", align 1
@.str.54 = private unnamed_addr constant [17 x i8] c"\0A    actual   = \00", align 1
@.str.55 = private unnamed_addr constant [15 x i8] c"\0A    expected \00", align 1
@.str.56 = private unnamed_addr constant [3 x i8] c"= \00", align 1
@.str.57 = private unnamed_addr constant [3 x i8] c"!=\00", align 1
@.str.58 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_test_cuda_nullary.cu, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_dtor to void ()*), i8* null }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev(%"class.std::vector"* nocapture readonly %this) unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 0
  %2 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %1, align 8, !tbaa !1
  %3 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 1
  %4 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %3, align 8, !tbaa !7
  %5 = icmp eq %"class.std::__cxx11::basic_string"* %2, %4
  br i1 %5, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit, label %.lr.ph.i.i.i.preheader

.lr.ph.i.i.i.preheader:                           ; preds = %0
  br label %.lr.ph.i.i.i

.lr.ph.i.i.i:                                     ; preds = %.lr.ph.i.i.i.preheader, %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i
  %.01.i.i.i = phi %"class.std::__cxx11::basic_string"* [ %12, %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i ], [ %2, %.lr.ph.i.i.i.preheader ]
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i, i64 0, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8, !tbaa !8
  %8 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i, i64 0, i32 2
  %9 = bitcast %union.anon* %8 to i8*
  %10 = icmp eq i8* %7, %9
  br i1 %10, label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i, label %11

; <label>:11                                      ; preds = %.lr.ph.i.i.i
  tail call void @_ZdlPv(i8* %7) #2
  br label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i

_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i: ; preds = %11, %.lr.ph.i.i.i
  %12 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i, i64 1
  %13 = icmp eq %"class.std::__cxx11::basic_string"* %12, %4
  br i1 %13, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit, label %.lr.ph.i.i.i

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit: ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i
  %.pre = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %1, align 8, !tbaa !1
  br label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit: ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit, %0
  %14 = phi %"class.std::__cxx11::basic_string"* [ %.pre, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit ], [ %2, %0 ]
  %15 = icmp eq %"class.std::__cxx11::basic_string"* %14, null
  br i1 %15, label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev.exit, label %16

; <label>:16                                      ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit
  %17 = bitcast %"class.std::__cxx11::basic_string"* %14 to i8*
  tail call void @_ZdlPv(i8* %17) #2
  br label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev.exit

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev.exit: ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit, %16
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameIfENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 5, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 5, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i8, i8* %2, i64 5
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: uwtable
define void @_Z9type_nameIdENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64 6, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 6, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i8, i8* %2, i64 6
  store i8 0, i8* %4, align 2, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameIeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i64 11, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 11, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 3
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameIiENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i64 3, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 3, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i8, i8* %2, i64 3
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIfEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i64 14, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 14, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 6
  store i8 0, i8* %4, align 2, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIdEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 15, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 7
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIeEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
.noexc1.i:
  %__dnew.i.i.i.i = alloca i64, align 8
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #2
  store i64 20, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %3 = call i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %agg.result, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  store i8* %3, i8** %4, align 8, !tbaa !8
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 0
  store i64 %5, i64* %6, align 8, !tbaa !15
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), i64 20, i32 1, i1 false) #2
  %7 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 %5, i64* %7, align 8, !tbaa !13
  %8 = load i8*, i8** %4, align 8, !tbaa !8
  %9 = getelementptr inbounds i8, i8* %8, i64 %5
  store i8 0, i8* %9, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %2) #2
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIiEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i64 0, i64 0), i64 12, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 12, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 4
  store i8 0, i8* %4, align 4, !tbaa !14
  ret void
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %ss = alloca %"class.std::__cxx11::basic_stringstream", align 8
  %1 = alloca %"class.std::__cxx11::basic_string", align 8
  %2 = alloca %"class.std::__cxx11::basic_string", align 8
  store i1 false, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  store i1 false, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  %3 = icmp sgt i32 %argc, 1
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge.thread

.lr.ph.preheader:                                 ; preds = %0
  %4 = sext i32 %argc to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %100
  %indvars.iv = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next, %100 ]
  %need_help.078 = phi i8 [ 0, %.lr.ph.preheader ], [ %need_help.1, %100 ]
  %5 = getelementptr inbounds i8*, i8** %argv, i64 %indvars.iv
  %6 = load i8*, i8** %5, align 8, !tbaa !16
  %7 = load i8, i8* %6, align 1, !tbaa !14
  switch i8 %7, label %100 [
    i8 114, label %8
    i8 115, label %54
  ]

; <label>:8                                       ; preds = %.lr.ph
  %.b1120 = load i1, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  br i1 %.b1120, label %9, label %52

; <label>:9                                       ; preds = %8
  %.lcssa96 = phi i8** [ %5, %8 ]
  %10 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i64 9)
  %11 = load i8*, i8** %.lcssa96, align 8, !tbaa !16
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %24

; <label>:13                                      ; preds = %9
  %14 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %15 = getelementptr i8, i8* %14, i64 -24
  %16 = bitcast i8* %15 to i64*
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %17
  %19 = bitcast i8* %18 to %"class.std::basic_ios"*
  %20 = getelementptr inbounds i8, i8* %18, i64 32
  %21 = bitcast i8* %20 to i32*
  %22 = load i32, i32* %21, align 8, !tbaa !19
  %23 = or i32 %22, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %19, i32 %23)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

; <label>:24                                      ; preds = %9
  %25 = tail call i64 @strlen(i8* nonnull %11) #2
  %26 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %11, i64 %25)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %13, %24
  %27 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.10, i64 0, i64 0), i64 35)
  %28 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %29 = getelementptr i8, i8* %28, i64 -24
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %31
  %33 = getelementptr inbounds i8, i8* %32, i64 240
  %34 = bitcast i8* %33 to %"class.std::ctype"**
  %35 = load %"class.std::ctype"*, %"class.std::ctype"** %34, align 8, !tbaa !26
  %36 = icmp eq %"class.std::ctype"* %35, null
  br i1 %36, label %37, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:37                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %38 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %35, i64 0, i32 8
  %39 = load i8, i8* %38, align 8, !tbaa !29
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %44, label %41

; <label>:41                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %42 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %35, i64 0, i32 9, i64 10
  %43 = load i8, i8* %42, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:44                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %35)
  %45 = bitcast %"class.std::ctype"* %35 to i8 (%"class.std::ctype"*, i8)***
  %46 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %45, align 8, !tbaa !17
  %47 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %46, i64 6
  %48 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %47, align 8
  %49 = tail call signext i8 %48(%"class.std::ctype"* nonnull %35, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %41, %44
  %.0.i = phi i8 [ %43, %41 ], [ %49, %44 ]
  %50 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i)
  %51 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %50)
  br label %.thread

; <label>:52                                      ; preds = %8
  %53 = getelementptr inbounds i8, i8* %6, i64 1
  tail call void @_Z22set_repeat_from_stringPKc(i8* %53)
  br label %100

; <label>:54                                      ; preds = %.lr.ph
  %.b1419 = load i1, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  br i1 %.b1419, label %55, label %98

; <label>:55                                      ; preds = %54
  %.lcssa = phi i8** [ %5, %54 ]
  %56 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i64 9)
  %57 = load i8*, i8** %.lcssa, align 8, !tbaa !16
  %58 = icmp eq i8* %57, null
  br i1 %58, label %59, label %70

; <label>:59                                      ; preds = %55
  %60 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %61 = getelementptr i8, i8* %60, i64 -24
  %62 = bitcast i8* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %63
  %65 = bitcast i8* %64 to %"class.std::basic_ios"*
  %66 = getelementptr inbounds i8, i8* %64, i64 32
  %67 = bitcast i8* %66 to i32*
  %68 = load i32, i32* %67, align 8, !tbaa !19
  %69 = or i32 %68, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %65, i32 %69)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21

; <label>:70                                      ; preds = %55
  %71 = tail call i64 @strlen(i8* nonnull %57) #2
  %72 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %57, i64 %71)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21: ; preds = %59, %70
  %73 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.10, i64 0, i64 0), i64 35)
  %74 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %75 = getelementptr i8, i8* %74, i64 -24
  %76 = bitcast i8* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %77
  %79 = getelementptr inbounds i8, i8* %78, i64 240
  %80 = bitcast i8* %79 to %"class.std::ctype"**
  %81 = load %"class.std::ctype"*, %"class.std::ctype"** %80, align 8, !tbaa !26
  %82 = icmp eq %"class.std::ctype"* %81, null
  br i1 %82, label %83, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64

; <label>:83                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64:  ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21
  %84 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %81, i64 0, i32 8
  %85 = load i8, i8* %84, align 8, !tbaa !29
  %86 = icmp eq i8 %85, 0
  br i1 %86, label %90, label %87

; <label>:87                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64
  %88 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %81, i64 0, i32 9, i64 10
  %89 = load i8, i8* %88, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit43

; <label>:90                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %81)
  %91 = bitcast %"class.std::ctype"* %81 to i8 (%"class.std::ctype"*, i8)***
  %92 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %91, align 8, !tbaa !17
  %93 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %92, i64 6
  %94 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %93, align 8
  %95 = tail call signext i8 %94(%"class.std::ctype"* nonnull %81, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit43

_ZNKSt5ctypeIcE5widenEc.exit43:                   ; preds = %87, %90
  %.0.i42 = phi i8 [ %89, %87 ], [ %95, %90 ]
  %96 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i42)
  %97 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %96)
  br label %.thread

; <label>:98                                      ; preds = %54
  %99 = getelementptr inbounds i8, i8* %6, i64 1
  tail call void @_Z20set_seed_from_stringPKc(i8* %99)
  br label %100

; <label>:100                                     ; preds = %.lr.ph, %52, %98
  %need_help.1 = phi i8 [ %need_help.078, %52 ], [ %need_help.078, %98 ], [ 1, %.lr.ph ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %101 = icmp slt i64 %indvars.iv.next, %4
  br i1 %101, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %100
  %need_help.1.lcssa = phi i8 [ %need_help.1, %100 ]
  %102 = and i8 %need_help.1.lcssa, 1
  %103 = icmp eq i8 %102, 0
  br i1 %103, label %._crit_edge.thread, label %104

; <label>:104                                     ; preds = %._crit_edge
  %105 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @.str.11, i64 0, i64 0), i64 61)
  %106 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %107 = getelementptr i8, i8* %106, i64 -24
  %108 = bitcast i8* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %109
  %111 = getelementptr inbounds i8, i8* %110, i64 240
  %112 = bitcast i8* %111 to %"class.std::ctype"**
  %113 = load %"class.std::ctype"*, %"class.std::ctype"** %112, align 8, !tbaa !26
  %114 = icmp eq %"class.std::ctype"* %113, null
  br i1 %114, label %115, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65

; <label>:115                                     ; preds = %104
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65:  ; preds = %104
  %116 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %113, i64 0, i32 8
  %117 = load i8, i8* %116, align 8, !tbaa !29
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %122, label %119

; <label>:119                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65
  %120 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %113, i64 0, i32 9, i64 10
  %121 = load i8, i8* %120, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit45

; <label>:122                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %113)
  %123 = bitcast %"class.std::ctype"* %113 to i8 (%"class.std::ctype"*, i8)***
  %124 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %123, align 8, !tbaa !17
  %125 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %124, i64 6
  %126 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %125, align 8
  %127 = tail call signext i8 %126(%"class.std::ctype"* nonnull %113, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit45

_ZNKSt5ctypeIcE5widenEc.exit45:                   ; preds = %119, %122
  %.0.i44 = phi i8 [ %121, %119 ], [ %127, %122 ]
  %128 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i44)
  %129 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %128)
  %130 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([45 x i8], [45 x i8]* @.str.12, i64 0, i64 0), i64 44)
  %131 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i32 10)
  %132 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %131, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0), i64 1)
  %133 = bitcast %"class.std::basic_ostream"* %131 to i8**
  %134 = load i8*, i8** %133, align 8, !tbaa !17
  %135 = getelementptr i8, i8* %134, i64 -24
  %136 = bitcast i8* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = bitcast %"class.std::basic_ostream"* %131 to i8*
  %139 = getelementptr inbounds i8, i8* %138, i64 %137
  %140 = getelementptr inbounds i8, i8* %139, i64 240
  %141 = bitcast i8* %140 to %"class.std::ctype"**
  %142 = load %"class.std::ctype"*, %"class.std::ctype"** %141, align 8, !tbaa !26
  %143 = icmp eq %"class.std::ctype"* %142, null
  br i1 %143, label %144, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66

; <label>:144                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit45
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit45
  %145 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %142, i64 0, i32 8
  %146 = load i8, i8* %145, align 8, !tbaa !29
  %147 = icmp eq i8 %146, 0
  br i1 %147, label %151, label %148

; <label>:148                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66
  %149 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %142, i64 0, i32 9, i64 10
  %150 = load i8, i8* %149, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit47

; <label>:151                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %142)
  %152 = bitcast %"class.std::ctype"* %142 to i8 (%"class.std::ctype"*, i8)***
  %153 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %152, align 8, !tbaa !17
  %154 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %153, i64 6
  %155 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %154, align 8
  %156 = tail call signext i8 %155(%"class.std::ctype"* nonnull %142, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit47

_ZNKSt5ctypeIcE5widenEc.exit47:                   ; preds = %148, %151
  %.0.i46 = phi i8 [ %150, %148 ], [ %156, %151 ]
  %157 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %131, i8 signext %.0.i46)
  %158 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %157)
  %159 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([75 x i8], [75 x i8]* @.str.14, i64 0, i64 0), i64 74)
  %160 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %161 = getelementptr i8, i8* %160, i64 -24
  %162 = bitcast i8* %161 to i64*
  %163 = load i64, i64* %162, align 8
  %164 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %163
  %165 = getelementptr inbounds i8, i8* %164, i64 240
  %166 = bitcast i8* %165 to %"class.std::ctype"**
  %167 = load %"class.std::ctype"*, %"class.std::ctype"** %166, align 8, !tbaa !26
  %168 = icmp eq %"class.std::ctype"* %167, null
  br i1 %168, label %169, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67

; <label>:169                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit47
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit47
  %170 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %167, i64 0, i32 8
  %171 = load i8, i8* %170, align 8, !tbaa !29
  %172 = icmp eq i8 %171, 0
  br i1 %172, label %176, label %173

; <label>:173                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67
  %174 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %167, i64 0, i32 9, i64 10
  %175 = load i8, i8* %174, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit49

; <label>:176                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %167)
  %177 = bitcast %"class.std::ctype"* %167 to i8 (%"class.std::ctype"*, i8)***
  %178 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %177, align 8, !tbaa !17
  %179 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %178, i64 6
  %180 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %179, align 8
  %181 = tail call signext i8 %180(%"class.std::ctype"* nonnull %167, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit49

_ZNKSt5ctypeIcE5widenEc.exit49:                   ; preds = %173, %176
  %.0.i48 = phi i8 [ %175, %173 ], [ %181, %176 ]
  %182 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i48)
  %183 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %182)
  %184 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %185 = getelementptr i8, i8* %184, i64 -24
  %186 = bitcast i8* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %187
  %189 = getelementptr inbounds i8, i8* %188, i64 240
  %190 = bitcast i8* %189 to %"class.std::ctype"**
  %191 = load %"class.std::ctype"*, %"class.std::ctype"** %190, align 8, !tbaa !26
  %192 = icmp eq %"class.std::ctype"* %191, null
  br i1 %192, label %193, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68

; <label>:193                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit49
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit49
  %194 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %191, i64 0, i32 8
  %195 = load i8, i8* %194, align 8, !tbaa !29
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %200, label %197

; <label>:197                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68
  %198 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %191, i64 0, i32 9, i64 10
  %199 = load i8, i8* %198, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit51

; <label>:200                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %191)
  %201 = bitcast %"class.std::ctype"* %191 to i8 (%"class.std::ctype"*, i8)***
  %202 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %201, align 8, !tbaa !17
  %203 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %202, i64 6
  %204 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %203, align 8
  %205 = tail call signext i8 %204(%"class.std::ctype"* nonnull %191, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit51

_ZNKSt5ctypeIcE5widenEc.exit51:                   ; preds = %197, %200
  %.0.i50 = phi i8 [ %199, %197 ], [ %205, %200 ]
  %206 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i50)
  %207 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %206)
  %208 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([66 x i8], [66 x i8]* @.str.15, i64 0, i64 0), i64 65)
  %209 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %210 = getelementptr i8, i8* %209, i64 -24
  %211 = bitcast i8* %210 to i64*
  %212 = load i64, i64* %211, align 8
  %213 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %212
  %214 = getelementptr inbounds i8, i8* %213, i64 240
  %215 = bitcast i8* %214 to %"class.std::ctype"**
  %216 = load %"class.std::ctype"*, %"class.std::ctype"** %215, align 8, !tbaa !26
  %217 = icmp eq %"class.std::ctype"* %216, null
  br i1 %217, label %218, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69

; <label>:218                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit51
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit51
  %219 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %216, i64 0, i32 8
  %220 = load i8, i8* %219, align 8, !tbaa !29
  %221 = icmp eq i8 %220, 0
  br i1 %221, label %225, label %222

; <label>:222                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69
  %223 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %216, i64 0, i32 9, i64 10
  %224 = load i8, i8* %223, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit53

; <label>:225                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %216)
  %226 = bitcast %"class.std::ctype"* %216 to i8 (%"class.std::ctype"*, i8)***
  %227 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %226, align 8, !tbaa !17
  %228 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %227, i64 6
  %229 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %228, align 8
  %230 = tail call signext i8 %229(%"class.std::ctype"* nonnull %216, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit53

_ZNKSt5ctypeIcE5widenEc.exit53:                   ; preds = %222, %225
  %.0.i52 = phi i8 [ %224, %222 ], [ %230, %225 ]
  %231 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i52)
  %232 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %231)
  %233 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.16, i64 0, i64 0), i64 52)
  %234 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %235 = getelementptr i8, i8* %234, i64 -24
  %236 = bitcast i8* %235 to i64*
  %237 = load i64, i64* %236, align 8
  %238 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %237
  %239 = getelementptr inbounds i8, i8* %238, i64 240
  %240 = bitcast i8* %239 to %"class.std::ctype"**
  %241 = load %"class.std::ctype"*, %"class.std::ctype"** %240, align 8, !tbaa !26
  %242 = icmp eq %"class.std::ctype"* %241, null
  br i1 %242, label %243, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70

; <label>:243                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit53
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit53
  %244 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %241, i64 0, i32 8
  %245 = load i8, i8* %244, align 8, !tbaa !29
  %246 = icmp eq i8 %245, 0
  br i1 %246, label %250, label %247

; <label>:247                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70
  %248 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %241, i64 0, i32 9, i64 10
  %249 = load i8, i8* %248, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit55

; <label>:250                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %241)
  %251 = bitcast %"class.std::ctype"* %241 to i8 (%"class.std::ctype"*, i8)***
  %252 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %251, align 8, !tbaa !17
  %253 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %252, i64 6
  %254 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %253, align 8
  %255 = tail call signext i8 %254(%"class.std::ctype"* nonnull %241, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit55

_ZNKSt5ctypeIcE5widenEc.exit55:                   ; preds = %247, %250
  %.0.i54 = phi i8 [ %249, %247 ], [ %255, %250 ]
  %256 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i54)
  %257 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %256)
  br label %.thread

._crit_edge.thread:                               ; preds = %0, %._crit_edge
  %258 = tail call i8* @getenv(i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.17, i64 0, i64 0)) #2
  %.b1015 = load i1, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  %.not = xor i1 %.b1015, true
  %259 = icmp ne i8* %258, null
  %or.cond = and i1 %259, %.not
  br i1 %or.cond, label %260, label %261

; <label>:260                                     ; preds = %._crit_edge.thread
  tail call void @_Z22set_repeat_from_stringPKc(i8* %258)
  br label %261

; <label>:261                                     ; preds = %._crit_edge.thread, %260
  %262 = tail call i8* @getenv(i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.18, i64 0, i64 0)) #2
  %.b1316 = load i1, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  %.not2 = xor i1 %.b1316, true
  %263 = icmp ne i8* %262, null
  %or.cond4 = and i1 %263, %.not2
  br i1 %or.cond4, label %264, label %265

; <label>:264                                     ; preds = %261
  tail call void @_Z20set_seed_from_stringPKc(i8* %262)
  %.b1217.pr = load i1, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  br i1 %.b1217.pr, label %269, label %266

; <label>:265                                     ; preds = %261
  br i1 %.b1316, label %269, label %266

; <label>:266                                     ; preds = %264, %265
  %267 = tail call i64 @time(i64* null) #2
  %268 = trunc i64 %267 to i32
  store i32 %268, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  br label %269

; <label>:269                                     ; preds = %264, %266, %265
  %.b18 = load i1, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  br i1 %.b18, label %271, label %270

; <label>:270                                     ; preds = %269
  store i32 10, i32* @_ZN5EigenL8g_repeatE, align 4, !tbaa !31
  br label %271

; <label>:271                                     ; preds = %270, %269
  %272 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([48 x i8], [48 x i8]* @.str.19, i64 0, i64 0), i64 47)
  %273 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  %274 = zext i32 %273 to i64
  %275 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i64 %274)
  %276 = bitcast %"class.std::basic_ostream"* %275 to i8**
  %277 = load i8*, i8** %276, align 8, !tbaa !17
  %278 = getelementptr i8, i8* %277, i64 -24
  %279 = bitcast i8* %278 to i64*
  %280 = load i64, i64* %279, align 8
  %281 = bitcast %"class.std::basic_ostream"* %275 to i8*
  %282 = getelementptr inbounds i8, i8* %281, i64 %280
  %283 = getelementptr inbounds i8, i8* %282, i64 240
  %284 = bitcast i8* %283 to %"class.std::ctype"**
  %285 = load %"class.std::ctype"*, %"class.std::ctype"** %284, align 8, !tbaa !26
  %286 = icmp eq %"class.std::ctype"* %285, null
  br i1 %286, label %287, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71

; <label>:287                                     ; preds = %271
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71:  ; preds = %271
  %288 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %285, i64 0, i32 8
  %289 = load i8, i8* %288, align 8, !tbaa !29
  %290 = icmp eq i8 %289, 0
  br i1 %290, label %294, label %291

; <label>:291                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71
  %292 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %285, i64 0, i32 9, i64 10
  %293 = load i8, i8* %292, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit57

; <label>:294                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %285)
  %295 = bitcast %"class.std::ctype"* %285 to i8 (%"class.std::ctype"*, i8)***
  %296 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %295, align 8, !tbaa !17
  %297 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %296, i64 6
  %298 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %297, align 8
  %299 = tail call signext i8 %298(%"class.std::ctype"* nonnull %285, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit57

_ZNKSt5ctypeIcE5widenEc.exit57:                   ; preds = %291, %294
  %.0.i56 = phi i8 [ %293, %291 ], [ %299, %294 ]
  %300 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %275, i8 signext %.0.i56)
  %301 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %300)
  %302 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i8*
  call void @llvm.lifetime.start(i64 392, i8* %302) #2
  call void @_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::__cxx11::basic_stringstream"* nonnull %ss, i32 24)
  %303 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 1
  %304 = bitcast %"class.std::basic_ostream.base"* %303 to %"class.std::basic_ostream"*
  %305 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %304, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i64 0, i64 0), i64 6)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22 unwind label %423

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22: ; preds = %_ZNKSt5ctypeIcE5widenEc.exit57
  %306 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  %307 = zext i32 %306 to i64
  %308 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* %304, i64 %307)
          to label %_ZNSolsEj.exit unwind label %423

_ZNSolsEj.exit:                                   ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22
  %309 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1
  invoke void @_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::__cxx11::basic_string"* nonnull sret %1, %"class.std::__cxx11::basic_stringbuf"* %309)
          to label %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit unwind label %423

_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit: ; preds = %_ZNSolsEj.exit
  %310 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  %311 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !32
  %312 = icmp eq %"class.std::__cxx11::basic_string"* %310, %311
  br i1 %312, label %334, label %313

; <label>:313                                     ; preds = %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit
  %314 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 2
  %315 = bitcast %"class.std::__cxx11::basic_string"* %310 to %union.anon**
  store %union.anon* %314, %union.anon** %315, align 8, !tbaa !12
  %316 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %317 = load i8*, i8** %316, align 8, !tbaa !8
  %318 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %319 = bitcast %union.anon* %318 to i8*
  %320 = icmp eq i8* %317, %319
  br i1 %320, label %321, label %323

; <label>:321                                     ; preds = %313
  %322 = bitcast %union.anon* %314 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %322, i8* %317, i64 16, i32 1, i1 false) #2
  %.pre = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread

; <label>:323                                     ; preds = %313
  %324 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 0, i32 0
  store i8* %317, i8** %324, align 8, !tbaa !8
  %325 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2, i32 0
  %326 = load i64, i64* %325, align 8, !tbaa !15
  %327 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 2, i32 0
  store i64 %326, i64* %327, align 8, !tbaa !15
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread: ; preds = %321, %323
  %328 = phi %"class.std::__cxx11::basic_string"* [ %310, %323 ], [ %.pre, %321 ]
  %329 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 1
  %330 = load i64, i64* %329, align 8, !tbaa !13
  %331 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 1
  store i64 %330, i64* %331, align 8, !tbaa !13
  %332 = bitcast %"class.std::__cxx11::basic_string"* %1 to %union.anon**
  store %union.anon* %318, %union.anon** %332, align 8, !tbaa !8
  store i64 0, i64* %329, align 8, !tbaa !13
  store i8 0, i8* %319, align 8, !tbaa !14
  %333 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %328, i64 1
  store %"class.std::__cxx11::basic_string"* %333, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

; <label>:334                                     ; preds = %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit
  invoke void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_(%"class.std::vector"* nonnull @_ZN5EigenL12g_test_stackB5cxx11E, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %1)
          to label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit unwind label %427

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit: ; preds = %334
  %.phi.trans.insert = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %.pre81 = load i8*, i8** %.phi.trans.insert, align 8, !tbaa !8
  %.pre85 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %.pre87 = bitcast %union.anon* %.pre85 to i8*
  %335 = icmp eq i8* %.pre81, %.pre87
  br i1 %335, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %336

; <label>:336                                     ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit
  call void @_ZdlPv(i8* %.pre81) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit, %336
  %337 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  call void @srand(i32 %337) #2
  %338 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.21, i64 0, i64 0), i64 20)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24 unwind label %423

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  %339 = load i32, i32* @_ZN5EigenL8g_repeatE, align 4, !tbaa !31
  %340 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i32 %339)
          to label %341 unwind label %423

; <label>:341                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24
  %342 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %340, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0), i64 6)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26 unwind label %423

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26: ; preds = %341
  %343 = bitcast %"class.std::basic_ostream"* %340 to i8**
  %344 = load i8*, i8** %343, align 8, !tbaa !17
  %345 = getelementptr i8, i8* %344, i64 -24
  %346 = bitcast i8* %345 to i64*
  %347 = load i64, i64* %346, align 8
  %348 = bitcast %"class.std::basic_ostream"* %340 to i8*
  %349 = getelementptr inbounds i8, i8* %348, i64 %347
  %350 = getelementptr inbounds i8, i8* %349, i64 240
  %351 = bitcast i8* %350 to %"class.std::ctype"**
  %352 = load %"class.std::ctype"*, %"class.std::ctype"** %351, align 8, !tbaa !26
  %353 = icmp eq %"class.std::ctype"* %352, null
  br i1 %353, label %354, label %.noexc58

; <label>:354                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26
  invoke void @_ZSt16__throw_bad_castv() #20
          to label %.noexc72 unwind label %423

.noexc72:                                         ; preds = %354
  unreachable

.noexc58:                                         ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26
  %355 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %352, i64 0, i32 8
  %356 = load i8, i8* %355, align 8, !tbaa !29
  %357 = icmp eq i8 %356, 0
  br i1 %357, label %361, label %358

; <label>:358                                     ; preds = %.noexc58
  %359 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %352, i64 0, i32 9, i64 10
  %360 = load i8, i8* %359, align 1, !tbaa !14
  br label %.noexc28

; <label>:361                                     ; preds = %.noexc58
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %352)
          to label %.noexc61 unwind label %423

.noexc61:                                         ; preds = %361
  %362 = bitcast %"class.std::ctype"* %352 to i8 (%"class.std::ctype"*, i8)***
  %363 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %362, align 8, !tbaa !17
  %364 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %363, i64 6
  %365 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %364, align 8
  %366 = invoke signext i8 %365(%"class.std::ctype"* nonnull %352, i8 signext 10)
          to label %.noexc28 unwind label %423

.noexc28:                                         ; preds = %.noexc61, %358
  %.0.i60 = phi i8 [ %360, %358 ], [ %366, %.noexc61 ]
  %367 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %340, i8 signext %.0.i60)
          to label %.noexc29 unwind label %423

.noexc29:                                         ; preds = %.noexc28
  %368 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %367)
          to label %_ZNSolsEPFRSoS_E.exit unwind label %423

_ZNSolsEPFRSoS_E.exit:                            ; preds = %.noexc29
  %369 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 2
  %370 = bitcast %"class.std::__cxx11::basic_string"* %2 to %union.anon**
  store %union.anon* %369, %union.anon** %370, align 8, !tbaa !12
  %371 = bitcast %union.anon* %369 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %371, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.23, i64 0, i64 0), i64 12, i32 1, i1 false) #2
  %372 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 1
  store i64 12, i64* %372, align 8, !tbaa !13
  %373 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 2, i32 1, i64 4
  store i8 0, i8* %373, align 4, !tbaa !14
  %374 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  %375 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !32
  %376 = icmp eq %"class.std::__cxx11::basic_string"* %374, %375
  br i1 %376, label %392, label %377

; <label>:377                                     ; preds = %_ZNSolsEPFRSoS_E.exit
  %378 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %374, i64 0, i32 2
  %379 = bitcast %"class.std::__cxx11::basic_string"* %374 to %union.anon**
  store %union.anon* %378, %union.anon** %379, align 8, !tbaa !12
  %380 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 0, i32 0
  %381 = load i8*, i8** %380, align 8, !tbaa !8
  %382 = icmp eq i8* %381, %371
  br i1 %382, label %383, label %385

; <label>:383                                     ; preds = %377
  %384 = bitcast %union.anon* %378 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %384, i8* nonnull %371, i64 16, i32 1, i1 false) #2
  %.pre82 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread

; <label>:385                                     ; preds = %377
  %386 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %374, i64 0, i32 0, i32 0
  store i8* %381, i8** %386, align 8, !tbaa !8
  %387 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %374, i64 0, i32 2, i32 0
  store i64 7815274084306285923, i64* %387, align 8, !tbaa !15
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread: ; preds = %383, %385
  %388 = phi %"class.std::__cxx11::basic_string"* [ %374, %385 ], [ %.pre82, %383 ]
  %389 = load i64, i64* %372, align 8, !tbaa !13
  %390 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %374, i64 0, i32 1
  store i64 %389, i64* %390, align 8, !tbaa !13
  store %union.anon* %369, %union.anon** %370, align 8, !tbaa !8
  store i64 0, i64* %372, align 8, !tbaa !13
  store i8 0, i8* %371, align 8, !tbaa !14
  %391 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %388, i64 1
  store %"class.std::__cxx11::basic_string"* %391, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36

; <label>:392                                     ; preds = %_ZNSolsEPFRSoS_E.exit
  invoke void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_(%"class.std::vector"* nonnull @_ZN5EigenL12g_test_stackB5cxx11E, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %2)
          to label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35 unwind label %437

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35: ; preds = %392
  %.phi.trans.insert83 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 0, i32 0
  %.pre84 = load i8*, i8** %.phi.trans.insert83, align 8, !tbaa !8
  %393 = icmp eq i8* %.pre84, %371
  br i1 %393, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36, label %394

; <label>:394                                     ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35
  call void @_ZdlPv(i8* %.pre84) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36: ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35, %394
  invoke void @_Z17test_cuda_nullaryv()
          to label %395 unwind label %423

; <label>:395                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36
  %396 = load i64, i64* bitcast ([10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE to i64*), align 8
  %397 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i64*
  store i64 %396, i64* %397, align 8, !tbaa !17
  %398 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 8) to i64*), align 8
  %.cast.i.i = inttoptr i64 %396 to i8*
  %399 = getelementptr i8, i8* %.cast.i.i, i64 -24
  %400 = bitcast i8* %399 to i64*
  %401 = load i64, i64* %400, align 8
  %402 = getelementptr inbounds i8, i8* %302, i64 %401
  %403 = bitcast i8* %402 to i64*
  store i64 %398, i64* %403, align 8, !tbaa !17
  %404 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 9) to i64*), align 8
  %405 = bitcast %"class.std::basic_ostream.base"* %303 to i64*
  store i64 %404, i64* %405, align 8, !tbaa !17
  %406 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %406, align 8, !tbaa !17
  %407 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 0, i32 0
  %408 = load i8*, i8** %407, align 8, !tbaa !8
  %409 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 2
  %410 = bitcast %union.anon* %409 to i8*
  %411 = icmp eq i8* %408, %410
  br i1 %411, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, label %412

; <label>:412                                     ; preds = %395
  call void @_ZdlPv(i8* %408) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit: ; preds = %395, %412
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %406, align 8, !tbaa !17
  %413 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* %413) #2
  %414 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i64*), align 8
  store i64 %414, i64* %397, align 8, !tbaa !17
  %415 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 3) to i64*), align 8
  %.cast.i.i.i.i = inttoptr i64 %414 to i8*
  %416 = getelementptr i8, i8* %.cast.i.i.i.i, i64 -24
  %417 = bitcast i8* %416 to i64*
  %418 = load i64, i64* %417, align 8
  %419 = getelementptr inbounds i8, i8* %302, i64 %418
  %420 = bitcast i8* %419 to i64*
  store i64 %415, i64* %420, align 8, !tbaa !17
  %421 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 0, i32 1
  store i64 0, i64* %421, align 8, !tbaa !33
  %422 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* %422) #2
  call void @llvm.lifetime.end(i64 392, i8* nonnull %302) #2
  br label %.thread

; <label>:423                                     ; preds = %354, %.noexc61, %361, %.noexc29, %.noexc28, %341, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %_ZNSolsEj.exit, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22, %_ZNKSt5ctypeIcE5widenEc.exit57, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24
  %424 = landingpad { i8*, i32 }
          cleanup
  %425 = extractvalue { i8*, i32 } %424, 0
  %426 = extractvalue { i8*, i32 } %424, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:427                                     ; preds = %334
  %428 = landingpad { i8*, i32 }
          cleanup
  %429 = extractvalue { i8*, i32 } %428, 0
  %430 = extractvalue { i8*, i32 } %428, 1
  %431 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %432 = load i8*, i8** %431, align 8, !tbaa !8
  %433 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %434 = bitcast %union.anon* %433 to i8*
  %435 = icmp eq i8* %432, %434
  br i1 %435, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, label %436

; <label>:436                                     ; preds = %427
  call void @_ZdlPv(i8* %432) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:437                                     ; preds = %392
  %438 = landingpad { i8*, i32 }
          cleanup
  %439 = extractvalue { i8*, i32 } %438, 0
  %440 = extractvalue { i8*, i32 } %438, 1
  %441 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 0, i32 0
  %442 = load i8*, i8** %441, align 8, !tbaa !8
  %443 = icmp eq i8* %442, %371
  br i1 %443, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, label %444

; <label>:444                                     ; preds = %437
  call void @_ZdlPv(i8* %442) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37: ; preds = %437, %444, %436, %427, %423
  %.16 = phi i8* [ %425, %423 ], [ %429, %427 ], [ %429, %436 ], [ %439, %437 ], [ %439, %444 ]
  %.1 = phi i32 [ %426, %423 ], [ %430, %427 ], [ %430, %436 ], [ %440, %437 ], [ %440, %444 ]
  %445 = load i64, i64* bitcast ([10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE to i64*), align 8
  %446 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i64*
  store i64 %445, i64* %446, align 8, !tbaa !17
  %447 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 8) to i64*), align 8
  %.cast.i.i39 = inttoptr i64 %445 to i8*
  %448 = getelementptr i8, i8* %.cast.i.i39, i64 -24
  %449 = bitcast i8* %448 to i64*
  %450 = load i64, i64* %449, align 8
  %451 = getelementptr inbounds i8, i8* %302, i64 %450
  %452 = bitcast i8* %451 to i64*
  store i64 %447, i64* %452, align 8, !tbaa !17
  %453 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 9) to i64*), align 8
  %454 = bitcast %"class.std::basic_ostream.base"* %303 to i64*
  store i64 %453, i64* %454, align 8, !tbaa !17
  %455 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %455, align 8, !tbaa !17
  %456 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 0, i32 0
  %457 = load i8*, i8** %456, align 8, !tbaa !8
  %458 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 2
  %459 = bitcast %union.anon* %458 to i8*
  %460 = icmp eq i8* %457, %459
  br i1 %460, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41, label %461

; <label>:461                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37
  call void @_ZdlPv(i8* %457) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, %461
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %455, align 8, !tbaa !17
  %462 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* %462) #2
  %463 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i64*), align 8
  store i64 %463, i64* %446, align 8, !tbaa !17
  %464 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 3) to i64*), align 8
  %.cast.i.i.i.i40 = inttoptr i64 %463 to i8*
  %465 = getelementptr i8, i8* %.cast.i.i.i.i40, i64 -24
  %466 = bitcast i8* %465 to i64*
  %467 = load i64, i64* %466, align 8
  %468 = getelementptr inbounds i8, i8* %302, i64 %467
  %469 = bitcast i8* %468 to i64*
  store i64 %464, i64* %469, align 8, !tbaa !17
  %470 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 0, i32 1
  store i64 0, i64* %470, align 8, !tbaa !33
  %471 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* %471) #2
  %472 = insertvalue { i8*, i32 } undef, i8* %.16, 0
  %473 = insertvalue { i8*, i32 } %472, i32 %.1, 1
  resume { i8*, i32 } %473

.thread:                                          ; preds = %_ZNKSt5ctypeIcE5widenEc.exit43, %_ZNKSt5ctypeIcE5widenEc.exit, %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, %_ZNKSt5ctypeIcE5widenEc.exit55
  %.18 = phi i32 [ 1, %_ZNKSt5ctypeIcE5widenEc.exit55 ], [ 0, %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit ], [ 1, %_ZNKSt5ctypeIcE5widenEc.exit ], [ 1, %_ZNKSt5ctypeIcE5widenEc.exit43 ]
  ret i32 %.18
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_Z22set_repeat_from_stringPKc(i8* %str) #7 comdat {
  %1 = tail call i32* @__errno_location() #13
  store i32 0, i32* %1, align 4, !tbaa !31
  %2 = tail call i64 @strtoul(i8* nocapture %str, i8** null, i32 10) #2
  %3 = trunc i64 %2 to i32
  store i32 %3, i32* @_ZN5EigenL8g_repeatE, align 4, !tbaa !31
  %4 = load i32, i32* %1, align 4, !tbaa !31
  %5 = icmp ne i32 %4, 0
  %6 = icmp slt i32 %3, 1
  %or.cond = or i1 %6, %5
  br i1 %or.cond, label %7, label %48

; <label>:7                                       ; preds = %0
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.30, i64 0, i64 0), i64 21)
  %9 = icmp eq i8* %str, null
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %7
  %11 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %12 = getelementptr i8, i8* %11, i64 -24
  %13 = bitcast i8* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %14
  %16 = bitcast i8* %15 to %"class.std::basic_ios"*
  %17 = getelementptr inbounds i8, i8* %15, i64 32
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 8, !tbaa !19
  %20 = or i32 %19, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %16, i32 %20)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

; <label>:21                                      ; preds = %7
  %22 = tail call i64 @strlen(i8* nonnull %str) #2
  %23 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %str, i64 %22)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %10, %21
  %24 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %25 = getelementptr i8, i8* %24, i64 -24
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %27
  %29 = getelementptr inbounds i8, i8* %28, i64 240
  %30 = bitcast i8* %29 to %"class.std::ctype"**
  %31 = load %"class.std::ctype"*, %"class.std::ctype"** %30, align 8, !tbaa !26
  %32 = icmp eq %"class.std::ctype"* %31, null
  br i1 %32, label %33, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:33                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %34 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 8
  %35 = load i8, i8* %34, align 8, !tbaa !29
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %40, label %37

; <label>:37                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %38 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 9, i64 10
  %39 = load i8, i8* %38, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:40                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %31)
  %41 = bitcast %"class.std::ctype"* %31 to i8 (%"class.std::ctype"*, i8)***
  %42 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %41, align 8, !tbaa !17
  %43 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %42, i64 6
  %44 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %43, align 8
  %45 = tail call signext i8 %44(%"class.std::ctype"* nonnull %31, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %37, %40
  %.0.i = phi i8 [ %39, %37 ], [ %45, %40 ]
  %46 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i)
  %47 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %46)
  tail call void @exit(i32 1) #21
  unreachable

; <label>:48                                      ; preds = %0
  store i1 true, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_Z20set_seed_from_stringPKc(i8* %str) #7 comdat {
  %1 = tail call i32* @__errno_location() #13
  store i32 0, i32* %1, align 4, !tbaa !31
  %2 = tail call i64 @strtoul(i8* nocapture %str, i8** null, i32 10) #2
  %3 = trunc i64 %2 to i32
  store i32 %3, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  %4 = load i32, i32* %1, align 4, !tbaa !31
  %5 = icmp ne i32 %4, 0
  %6 = icmp eq i32 %3, 0
  %or.cond = or i1 %6, %5
  br i1 %or.cond, label %7, label %48

; <label>:7                                       ; preds = %0
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.31, i64 0, i64 0), i64 19)
  %9 = icmp eq i8* %str, null
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %7
  %11 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %12 = getelementptr i8, i8* %11, i64 -24
  %13 = bitcast i8* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %14
  %16 = bitcast i8* %15 to %"class.std::basic_ios"*
  %17 = getelementptr inbounds i8, i8* %15, i64 32
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 8, !tbaa !19
  %20 = or i32 %19, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %16, i32 %20)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

; <label>:21                                      ; preds = %7
  %22 = tail call i64 @strlen(i8* nonnull %str) #2
  %23 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %str, i64 %22)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %10, %21
  %24 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %25 = getelementptr i8, i8* %24, i64 -24
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %27
  %29 = getelementptr inbounds i8, i8* %28, i64 240
  %30 = bitcast i8* %29 to %"class.std::ctype"**
  %31 = load %"class.std::ctype"*, %"class.std::ctype"** %30, align 8, !tbaa !26
  %32 = icmp eq %"class.std::ctype"* %31, null
  br i1 %32, label %33, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:33                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %34 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 8
  %35 = load i8, i8* %34, align 8, !tbaa !29
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %40, label %37

; <label>:37                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %38 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 9, i64 10
  %39 = load i8, i8* %38, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:40                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %31)
  %41 = bitcast %"class.std::ctype"* %31 to i8 (%"class.std::ctype"*, i8)***
  %42 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %41, align 8, !tbaa !17
  %43 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %42, i64 6
  %44 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %43, align 8
  %45 = tail call signext i8 %44(%"class.std::ctype"* nonnull %31, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %37, %40
  %.0.i = phi i8 [ %39, %37 ], [ %45, %40 ]
  %46 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i)
  %47 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %46)
  tail call void @exit(i32 1) #21
  unreachable

; <label>:48                                      ; preds = %0
  store i1 true, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #0

; Function Attrs: nounwind readonly
declare i8* @getenv(i8* nocapture) #8

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: uwtable
declare void @_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::__cxx11::basic_stringstream"*, i32) unnamed_addr #4 align 2

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: uwtable
define void @_Z17test_cuda_nullaryv() #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %assign.i12 = alloca %"class.Eigen::TensorAssignOp.23", align 8
  %ts.i.i.i.i = alloca %struct.timespec, align 8
  %assign.i = alloca %"class.Eigen::TensorAssignOp.15", align 8
  %ts.i.i.i.i.i7 = alloca %struct.timespec, align 8
  %assign.i.i8 = alloca %"class.Eigen::TensorAssignOp", align 8
  %1 = alloca %"struct.Eigen::DefaultDevice", align 1
  %2 = alloca %"class.Eigen::TensorCwiseNullaryOp.9", align 8
  %ts.i.i.i.i.i = alloca %struct.timespec, align 8
  %assign.i.i = alloca %"class.Eigen::TensorAssignOp", align 8
  %3 = alloca %"struct.Eigen::DefaultDevice", align 1
  %4 = alloca %"class.Eigen::TensorCwiseNullaryOp.9", align 8
  %in1 = alloca %"class.Eigen::Tensor", align 8
  %in2 = alloca %"class.Eigen::Tensor", align 8
  %d_in1 = alloca float*, align 8
  %d_in2 = alloca float*, align 8
  %stream = alloca %"class.Eigen::CudaStreamDevice", align 8
  %gpu_device = alloca %"struct.Eigen::GpuDevice", align 8
  %gpu_in1 = alloca %"class.Eigen::TensorMap", align 8
  %gpu_in2 = alloca %"class.Eigen::TensorMap", align 8
  %5 = alloca %"class.Eigen::TensorCwiseNullaryOp", align 8
  %6 = alloca %"class.Eigen::TensorCwiseNullaryOp.7", align 8
  %7 = alloca float, align 4
  %8 = bitcast %"class.Eigen::Tensor"* %in1 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %8) #2
  %9 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 2, i32* %9, align 8, !tbaa !31
  %10 = tail call noalias i8* @malloc(i64 8) #2
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %_ZN5Eigen6TensorIfLi1ELi0EiEC2IJEEEiDpT_.exit

; <label>:12                                      ; preds = %0
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen6TensorIfLi1ELi0EiEC2IJEEEiDpT_.exit:    ; preds = %0
  %13 = bitcast %"class.Eigen::Tensor"* %in1 to i8**
  store i8* %10, i8** %13, align 8, !tbaa !35
  %14 = bitcast %"class.Eigen::Tensor"* %in2 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %14) #2
  %15 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 2, i32* %15, align 8, !tbaa !31
  %16 = tail call noalias i8* @malloc(i64 8) #2
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %_ZN5Eigen6TensorIfLi1ELi0EiEC2IJEEEiDpT_.exit
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc unwind label %146

.noexc:                                           ; preds = %18
  unreachable

; <label>:19                                      ; preds = %_ZN5Eigen6TensorIfLi1ELi0EiEC2IJEEEiDpT_.exit
  %20 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 0
  %21 = bitcast %"class.Eigen::Tensor"* %in2 to i8**
  store i8* %16, i8** %21, align 8, !tbaa !35
  %22 = bitcast %"class.Eigen::TensorCwiseNullaryOp.9"* %4 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %22)
  %23 = bitcast %struct.timespec* %ts.i.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %23) #2, !noalias !38
  %24 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i.i) #2, !noalias !38
  %25 = call i64 @random() #2, !noalias !38
  %26 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i.i, i64 0, i32 1
  %27 = load i64, i64* %26, align 8, !tbaa !41, !noalias !38
  %28 = xor i64 %27, %25
  call void @llvm.lifetime.end(i64 16, i8* %23) #2, !noalias !38
  %29 = mul i64 %28, 6364136223846793005
  %30 = add i64 %29, -2720673578348880933
  %31 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.9", %"class.Eigen::TensorCwiseNullaryOp.9"* %4, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in1, %"class.Eigen::Tensor"** %31, align 8, !tbaa !14, !alias.scope !43
  %32 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.9", %"class.Eigen::TensorCwiseNullaryOp.9"* %4, i64 0, i32 1, i32 0
  store i64 %30, i64* %32, align 8, !tbaa !46, !alias.scope !43
  %33 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %3, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %33)
  %34 = bitcast %"class.Eigen::TensorAssignOp"* %assign.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %34) #2
  %35 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in1, %"class.Eigen::Tensor"** %35, align 8, !tbaa !14
  %36 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp.9"* %4, %"class.Eigen::TensorCwiseNullaryOp.9"** %36, align 8, !tbaa !14
  %37 = load i32, i32* %9, align 8
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %43, label %39

; <label>:39                                      ; preds = %19
  %40 = sdiv i32 2147483647, %37
  %41 = icmp slt i32 %40, 1
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %39
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc6 unwind label %150

.noexc6:                                          ; preds = %42
  unreachable

; <label>:43                                      ; preds = %39, %19
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0EiEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %assign.i.i, %"struct.Eigen::DefaultDevice"* nonnull dereferenceable(1) %3)
  call void @llvm.lifetime.end(i64 16, i8* %34) #2
  call void @llvm.lifetime.end(i64 1, i8* %33)
  call void @llvm.lifetime.end(i64 16, i8* %22)
  %44 = bitcast %"class.Eigen::TensorCwiseNullaryOp.9"* %2 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %44)
  %45 = bitcast %struct.timespec* %ts.i.i.i.i.i7 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %45) #2, !noalias !48
  %46 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i.i7) #2, !noalias !48
  %47 = call i64 @random() #2, !noalias !48
  %48 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i.i7, i64 0, i32 1
  %49 = load i64, i64* %48, align 8, !tbaa !41, !noalias !48
  %50 = xor i64 %49, %47
  call void @llvm.lifetime.end(i64 16, i8* %45) #2, !noalias !48
  %51 = mul i64 %50, 6364136223846793005
  %52 = add i64 %51, -2720673578348880933
  %53 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.9", %"class.Eigen::TensorCwiseNullaryOp.9"* %2, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in2, %"class.Eigen::Tensor"** %53, align 8, !tbaa !14, !alias.scope !51
  %54 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.9", %"class.Eigen::TensorCwiseNullaryOp.9"* %2, i64 0, i32 1, i32 0
  store i64 %52, i64* %54, align 8, !tbaa !46, !alias.scope !51
  %55 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %1, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %55)
  %56 = bitcast %"class.Eigen::TensorAssignOp"* %assign.i.i8 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %56) #2
  %57 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i8, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in2, %"class.Eigen::Tensor"** %57, align 8, !tbaa !14
  %58 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i8, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp.9"* %2, %"class.Eigen::TensorCwiseNullaryOp.9"** %58, align 8, !tbaa !14
  %59 = load i32, i32* %15, align 8
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %65, label %61

; <label>:61                                      ; preds = %43
  %62 = sdiv i32 2147483647, %59
  %63 = icmp slt i32 %62, 1
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc9 unwind label %150

.noexc9:                                          ; preds = %64
  unreachable

; <label>:65                                      ; preds = %43, %61
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0EiEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %assign.i.i8, %"struct.Eigen::DefaultDevice"* nonnull dereferenceable(1) %1)
  call void @llvm.lifetime.end(i64 16, i8* %56) #2
  call void @llvm.lifetime.end(i64 1, i8* %55)
  call void @llvm.lifetime.end(i64 16, i8* %44)
  %66 = load i32, i32* %9, align 8, !tbaa !31
  %67 = sext i32 %66 to i64
  %68 = shl nsw i64 %67, 2
  %69 = bitcast float** %d_in1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %69) #2
  %70 = bitcast float** %d_in2 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %70) #2
  %71 = bitcast float** %d_in1 to i8**
  %72 = invoke i32 @cudaMalloc(i8** %71, i64 %68)
          to label %73 unwind label %150

; <label>:73                                      ; preds = %65
  %74 = bitcast float** %d_in2 to i8**
  %75 = invoke i32 @cudaMalloc(i8** %74, i64 %68)
          to label %76 unwind label %150

; <label>:76                                      ; preds = %73
  %77 = load i8*, i8** %71, align 8, !tbaa !16
  %78 = load i8*, i8** %13, align 8, !tbaa !35
  %79 = invoke i32 @cudaMemcpy(i8* %77, i8* %78, i64 %68, i32 1)
          to label %80 unwind label %150

; <label>:80                                      ; preds = %76
  %81 = load i8*, i8** %74, align 8, !tbaa !16
  %82 = load i8*, i8** %21, align 8, !tbaa !35
  %83 = invoke i32 @cudaMemcpy(i8* %81, i8* %82, i64 %68, i32 1)
          to label %84 unwind label %150

; <label>:84                                      ; preds = %80
  %85 = bitcast %"class.Eigen::CudaStreamDevice"* %stream to i8*
  call void @llvm.lifetime.start(i64 40, i8* %85) #2
  invoke void @_ZN5Eigen16CudaStreamDeviceC2Ev(%"class.Eigen::CudaStreamDevice"* nonnull %stream)
          to label %86 unwind label %150

; <label>:86                                      ; preds = %84
  %87 = bitcast %"struct.Eigen::GpuDevice"* %gpu_device to i8*
  call void @llvm.lifetime.start(i64 16, i8* %87) #2
  %88 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0
  %89 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %gpu_device, i64 0, i32 0
  store %"class.Eigen::StreamInterface"* %88, %"class.Eigen::StreamInterface"** %89, align 8, !tbaa !54
  %90 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %gpu_device, i64 0, i32 1
  store i32 2147483647, i32* %90, align 8, !tbaa !56
  %91 = bitcast %"class.Eigen::TensorMap"* %gpu_in1 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %91) #2
  %92 = bitcast float** %d_in1 to i64*
  %93 = load i64, i64* %92, align 8, !tbaa !16
  %94 = bitcast %"class.Eigen::TensorMap"* %gpu_in1 to i64*
  store i64 %93, i64* %94, align 8, !tbaa !57
  %95 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in1, i64 0, i32 1, i32 0, i32 0, i64 0
  store i32 2, i32* %95, align 8, !tbaa !31
  %96 = bitcast %"class.Eigen::TensorMap"* %gpu_in2 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %96) #2
  %97 = bitcast float** %d_in2 to i64*
  %98 = load i64, i64* %97, align 8, !tbaa !16
  %99 = bitcast %"class.Eigen::TensorMap"* %gpu_in2 to i64*
  store i64 %98, i64* %99, align 8, !tbaa !57
  %100 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in2, i64 0, i32 1, i32 0, i32 0, i64 0
  store i32 2, i32* %100, align 8, !tbaa !31
  %101 = ptrtoint %"class.Eigen::TensorMap"* %gpu_in1 to i64
  %102 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %5, i64 0, i32 0
  store %"class.Eigen::TensorMap"* %gpu_in1, %"class.Eigen::TensorMap"** %102, align 8, !tbaa !14, !alias.scope !59
  %103 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %5, i64 0, i32 1
  %104 = bitcast %"struct.Eigen::internal::scalar_constant_op"* %103 to i32*
  store i32 1078523331, i32* %104, align 8, !tbaa !64, !alias.scope !59
  %105 = bitcast %"class.Eigen::TensorAssignOp.15"* %assign.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %105) #2
  %106 = bitcast %"class.Eigen::TensorAssignOp.15"* %assign.i to i64*
  store i64 %101, i64* %106, align 8, !tbaa !14
  %107 = getelementptr inbounds %"class.Eigen::TensorAssignOp.15", %"class.Eigen::TensorAssignOp.15"* %assign.i, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp"* %5, %"class.Eigen::TensorCwiseNullaryOp"** %107, align 8, !tbaa !14
  invoke void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_(%"class.Eigen::TensorAssignOp.15"* nonnull dereferenceable(16) %assign.i, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %gpu_device)
          to label %108 unwind label %154

; <label>:108                                     ; preds = %86
  call void @llvm.lifetime.end(i64 16, i8* %105) #2
  %109 = ptrtoint %"class.Eigen::TensorMap"* %gpu_in2 to i64
  %110 = bitcast %struct.timespec* %ts.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %110) #2, !noalias !67
  %111 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i) #2, !noalias !67
  %112 = call i64 @random() #2, !noalias !67
  %113 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i, i64 0, i32 1
  %114 = load i64, i64* %113, align 8, !tbaa !41, !noalias !67
  %115 = xor i64 %114, %112
  call void @llvm.lifetime.end(i64 16, i8* %110) #2, !noalias !67
  %116 = mul i64 %115, 6364136223846793005
  %117 = add i64 %116, -2720673578348880933
  %118 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.7", %"class.Eigen::TensorCwiseNullaryOp.7"* %6, i64 0, i32 0
  store %"class.Eigen::TensorMap"* %gpu_in2, %"class.Eigen::TensorMap"** %118, align 8, !tbaa !14, !alias.scope !70
  %119 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.7", %"class.Eigen::TensorCwiseNullaryOp.7"* %6, i64 0, i32 1, i32 0
  store i64 %117, i64* %119, align 8, !tbaa !46, !alias.scope !70
  %120 = bitcast %"class.Eigen::TensorAssignOp.23"* %assign.i12 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %120) #2
  %121 = bitcast %"class.Eigen::TensorAssignOp.23"* %assign.i12 to i64*
  store i64 %109, i64* %121, align 8, !tbaa !14
  %122 = getelementptr inbounds %"class.Eigen::TensorAssignOp.23", %"class.Eigen::TensorAssignOp.23"* %assign.i12, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp.7"* %6, %"class.Eigen::TensorCwiseNullaryOp.7"** %122, align 8, !tbaa !14
  invoke void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_(%"class.Eigen::TensorAssignOp.23"* nonnull dereferenceable(16) %assign.i12, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %gpu_device)
          to label %123 unwind label %154

; <label>:123                                     ; preds = %108
  call void @llvm.lifetime.end(i64 16, i8* %120) #2
  %124 = call noalias i8* @malloc(i64 8) #2
  %125 = icmp eq i8* %124, null
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %123
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc14 unwind label %154

.noexc14:                                         ; preds = %126
  unreachable

; <label>:127                                     ; preds = %123
  %128 = bitcast i8* %124 to float*
  %129 = call noalias i8* @malloc(i64 8) #2
  %130 = icmp eq i8* %129, null
  br i1 %130, label %131, label %132

; <label>:131                                     ; preds = %127
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc16 unwind label %158

.noexc16:                                         ; preds = %131
  unreachable

; <label>:132                                     ; preds = %127
  %133 = bitcast i8* %129 to float*
  %134 = load i8*, i8** %71, align 8, !tbaa !16
  %135 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %89, align 8, !tbaa !54
  %136 = bitcast %"class.Eigen::StreamInterface"* %135 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %137 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %136, align 8, !tbaa !17
  %138 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %137, i64 2
  %139 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %138, align 8
  %140 = invoke dereferenceable(8) %struct.CUstream_st** %139(%"class.Eigen::StreamInterface"* %135)
          to label %_ZNK5Eigen9GpuDevice6streamEv.exit unwind label %.loopexit.split-lp

_ZNK5Eigen9GpuDevice6streamEv.exit:               ; preds = %132
  %141 = load %struct.CUstream_st*, %struct.CUstream_st** %140, align 8, !tbaa !16
  %142 = invoke i32 @cudaMemcpyAsync(i8* nonnull %124, i8* %134, i64 %68, i32 2, %struct.CUstream_st* %141)
          to label %143 unwind label %.loopexit.split-lp

; <label>:143                                     ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit
  %144 = icmp eq i32 %142, 0
  br i1 %144, label %165, label %145

; <label>:145                                     ; preds = %143
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([110 x i8], [110 x i8]* @.str.24, i64 0, i64 0), i8* nonnull getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i32 47, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @__PRETTY_FUNCTION__._Z17test_cuda_nullaryv, i64 0, i64 0)) #21
  unreachable

; <label>:146                                     ; preds = %18
  %147 = landingpad { i8*, i32 }
          cleanup
  %148 = extractvalue { i8*, i32 } %147, 0
  %149 = extractvalue { i8*, i32 } %147, 1
  br label %248

; <label>:150                                     ; preds = %64, %42, %84, %80, %76, %73, %65
  %151 = landingpad { i8*, i32 }
          cleanup
  %152 = extractvalue { i8*, i32 } %151, 0
  %153 = extractvalue { i8*, i32 } %151, 1
  br label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit

; <label>:154                                     ; preds = %126, %108, %86
  %155 = landingpad { i8*, i32 }
          cleanup
  %156 = extractvalue { i8*, i32 } %155, 0
  %157 = extractvalue { i8*, i32 } %155, 1
  br label %229

; <label>:158                                     ; preds = %131
  %159 = landingpad { i8*, i32 }
          cleanup
  %160 = extractvalue { i8*, i32 } %159, 0
  %161 = extractvalue { i8*, i32 } %159, 1
  br label %228

.loopexit:                                        ; preds = %262, %256, %252, %.preheader.130, %.preheader.preheader, %191, %195, %198
  %lpad.loopexit = landingpad { i8*, i32 }
          cleanup
  br label %162

.loopexit.split-lp:                               ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit, %_ZNK5Eigen9GpuDevice6streamEv.exit20, %_ZNK5Eigen9GpuDevice6streamEv.exit22, %266, %205, %132, %165, %178
  %lpad.loopexit.split-lp = landingpad { i8*, i32 }
          cleanup
  br label %162

; <label>:162                                     ; preds = %.loopexit.split-lp, %.loopexit
  %lpad.phi = phi { i8*, i32 } [ %lpad.loopexit, %.loopexit ], [ %lpad.loopexit.split-lp, %.loopexit.split-lp ]
  %163 = extractvalue { i8*, i32 } %lpad.phi, 0
  %164 = extractvalue { i8*, i32 } %lpad.phi, 1
  call void @free(i8* %129) #2
  br label %228

; <label>:165                                     ; preds = %143
  %166 = load i8*, i8** %74, align 8, !tbaa !16
  %167 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %89, align 8, !tbaa !54
  %168 = bitcast %"class.Eigen::StreamInterface"* %167 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %169 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %168, align 8, !tbaa !17
  %170 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %169, i64 2
  %171 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %170, align 8
  %172 = invoke dereferenceable(8) %struct.CUstream_st** %171(%"class.Eigen::StreamInterface"* %167)
          to label %_ZNK5Eigen9GpuDevice6streamEv.exit20 unwind label %.loopexit.split-lp

_ZNK5Eigen9GpuDevice6streamEv.exit20:             ; preds = %165
  %173 = load %struct.CUstream_st*, %struct.CUstream_st** %172, align 8, !tbaa !16
  %174 = invoke i32 @cudaMemcpyAsync(i8* nonnull %129, i8* %166, i64 %68, i32 2, %struct.CUstream_st* %173)
          to label %175 unwind label %.loopexit.split-lp

; <label>:175                                     ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit20
  %176 = icmp eq i32 %174, 0
  br i1 %176, label %178, label %177

; <label>:177                                     ; preds = %175
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([110 x i8], [110 x i8]* @.str.26, i64 0, i64 0), i8* nonnull getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i32 49, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @__PRETTY_FUNCTION__._Z17test_cuda_nullaryv, i64 0, i64 0)) #21
  unreachable

; <label>:178                                     ; preds = %175
  %179 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %89, align 8, !tbaa !54
  %180 = bitcast %"class.Eigen::StreamInterface"* %179 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %181 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %180, align 8, !tbaa !17
  %182 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %181, i64 2
  %183 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %182, align 8
  %184 = invoke dereferenceable(8) %struct.CUstream_st** %183(%"class.Eigen::StreamInterface"* %179)
          to label %_ZNK5Eigen9GpuDevice6streamEv.exit22 unwind label %.loopexit.split-lp

_ZNK5Eigen9GpuDevice6streamEv.exit22:             ; preds = %178
  %185 = load %struct.CUstream_st*, %struct.CUstream_st** %184, align 8, !tbaa !16
  %186 = invoke i32 @cudaStreamSynchronize(%struct.CUstream_st* %185)
          to label %187 unwind label %.loopexit.split-lp

; <label>:187                                     ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit22
  %188 = icmp eq i32 %186, 0
  br i1 %188, label %.preheader.preheader, label %190

.preheader.preheader:                             ; preds = %187
  store float 0x40091EB860000000, float* %7, align 4, !tbaa !73
  %189 = invoke zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nonnull dereferenceable(4) %128, float* nonnull dereferenceable(4) %7)
          to label %191 unwind label %.loopexit

; <label>:190                                     ; preds = %187
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([58 x i8], [58 x i8]* @.str.27, i64 0, i64 0), i8* nonnull getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i32 51, i8* nonnull getelementptr inbounds ([25 x i8], [25 x i8]* @__PRETTY_FUNCTION__._Z17test_cuda_nullaryv, i64 0, i64 0)) #21
  unreachable

; <label>:191                                     ; preds = %.preheader.preheader
  %192 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !16
  %193 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %192, i64 -1, i32 0, i32 0
  %194 = load i8*, i8** %193, align 8, !tbaa !8
  invoke void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %189, i8* %194, i8* nonnull getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i32 54, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.28, i64 0, i64 0))
          to label %195 unwind label %.loopexit

; <label>:195                                     ; preds = %191
  %196 = load float*, float** %20, align 8, !tbaa !35
  %197 = invoke zeroext i1 @_ZN5Eigen13test_is_equalIffEEbRKT_RKT0_b(float* nonnull dereferenceable(4) %133, float* nonnull dereferenceable(4) %196, i1 zeroext false)
          to label %198 unwind label %.loopexit

; <label>:198                                     ; preds = %195
  %199 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !16
  %200 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %199, i64 -1, i32 0, i32 0
  %201 = load i8*, i8** %200, align 8, !tbaa !8
  invoke void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %197, i8* %201, i8* nonnull getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i32 55, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i64 0, i64 0))
          to label %.preheader.130 unwind label %.loopexit

.preheader.130:                                   ; preds = %198
  %202 = getelementptr inbounds i8, i8* %124, i64 4
  %203 = bitcast i8* %202 to float*
  store float 0x40091EB860000000, float* %7, align 4, !tbaa !73
  %204 = invoke zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nonnull dereferenceable(4) %203, float* nonnull dereferenceable(4) %7)
          to label %252 unwind label %.loopexit

; <label>:205                                     ; preds = %266
  %206 = load i8*, i8** %74, align 8, !tbaa !16
  %207 = invoke i32 @cudaFree(i8* %206)
          to label %208 unwind label %.loopexit.split-lp

; <label>:208                                     ; preds = %205
  call void @free(i8* %129) #2
  call void @free(i8* nonnull %124) #2
  call void @llvm.lifetime.end(i64 16, i8* %96) #2
  call void @llvm.lifetime.end(i64 16, i8* %91) #2
  call void @llvm.lifetime.end(i64 16, i8* nonnull %87) #2
  %209 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %209, align 8, !tbaa !17
  %210 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 3
  %211 = load i8*, i8** %210, align 8, !tbaa !74
  %212 = icmp eq i8* %211, null
  br i1 %212, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit25, label %213

; <label>:213                                     ; preds = %208
  %214 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 2
  %215 = load i32, i32* %214, align 8, !tbaa !76
  %216 = invoke i32 @cudaSetDevice(i32 %215)
          to label %.noexc.i23 unwind label %223

.noexc.i23:                                       ; preds = %213
  %217 = icmp eq i32 %216, 0
  br i1 %217, label %219, label %218

; <label>:218                                     ; preds = %.noexc.i23
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:219                                     ; preds = %.noexc.i23
  %220 = invoke i32 @cudaFree(i8* nonnull %211)
          to label %.noexc1.i24 unwind label %223

.noexc1.i24:                                      ; preds = %219
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit25, label %222

; <label>:222                                     ; preds = %.noexc1.i24
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:223                                     ; preds = %219, %213
  %224 = landingpad { i8*, i32 }
          catch i8* null
  %225 = extractvalue { i8*, i32 } %224, 0
  call void @__clang_call_terminate(i8* %225) #21
  unreachable

_ZN5Eigen16CudaStreamDeviceD2Ev.exit25:           ; preds = %208, %.noexc1.i24
  call void @llvm.lifetime.end(i64 40, i8* nonnull %85) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %70) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %69) #2
  %226 = load i8*, i8** %21, align 8, !tbaa !35
  call void @free(i8* %226) #2
  call void @llvm.lifetime.end(i64 16, i8* nonnull %14) #2
  %227 = load i8*, i8** %13, align 8, !tbaa !35
  call void @free(i8* %227) #2
  call void @llvm.lifetime.end(i64 16, i8* nonnull %8) #2
  ret void

; <label>:228                                     ; preds = %162, %158
  %.01 = phi i32 [ %164, %162 ], [ %161, %158 ]
  %.0 = phi i8* [ %163, %162 ], [ %160, %158 ]
  call void @free(i8* nonnull %124) #2
  br label %229

; <label>:229                                     ; preds = %228, %154
  %.12 = phi i32 [ %.01, %228 ], [ %157, %154 ]
  %.1 = phi i8* [ %.0, %228 ], [ %156, %154 ]
  %230 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %230, align 8, !tbaa !17
  %231 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 3
  %232 = load i8*, i8** %231, align 8, !tbaa !74
  %233 = icmp eq i8* %232, null
  br i1 %233, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %234

; <label>:234                                     ; preds = %229
  %235 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 2
  %236 = load i32, i32* %235, align 8, !tbaa !76
  %237 = invoke i32 @cudaSetDevice(i32 %236)
          to label %.noexc.i unwind label %244

.noexc.i:                                         ; preds = %234
  %238 = icmp eq i32 %237, 0
  br i1 %238, label %240, label %239

; <label>:239                                     ; preds = %.noexc.i
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:240                                     ; preds = %.noexc.i
  %241 = invoke i32 @cudaFree(i8* nonnull %232)
          to label %.noexc1.i unwind label %244

.noexc1.i:                                        ; preds = %240
  %242 = icmp eq i32 %241, 0
  br i1 %242, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %243

; <label>:243                                     ; preds = %.noexc1.i
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:244                                     ; preds = %240, %234
  %245 = landingpad { i8*, i32 }
          catch i8* null
  %246 = extractvalue { i8*, i32 } %245, 0
  call void @__clang_call_terminate(i8* %246) #21
  unreachable

_ZN5Eigen16CudaStreamDeviceD2Ev.exit:             ; preds = %.noexc1.i, %229, %150
  %.23 = phi i32 [ %153, %150 ], [ %.12, %229 ], [ %.12, %.noexc1.i ]
  %.2 = phi i8* [ %152, %150 ], [ %.1, %229 ], [ %.1, %.noexc1.i ]
  %247 = load i8*, i8** %21, align 8, !tbaa !35
  call void @free(i8* %247) #2
  br label %248

; <label>:248                                     ; preds = %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, %146
  %.34 = phi i32 [ %.23, %_ZN5Eigen16CudaStreamDeviceD2Ev.exit ], [ %149, %146 ]
  %.3 = phi i8* [ %.2, %_ZN5Eigen16CudaStreamDeviceD2Ev.exit ], [ %148, %146 ]
  %249 = load i8*, i8** %13, align 8, !tbaa !35
  call void @free(i8* %249) #2
  %250 = insertvalue { i8*, i32 } undef, i8* %.3, 0
  %251 = insertvalue { i8*, i32 } %250, i32 %.34, 1
  resume { i8*, i32 } %251

; <label>:252                                     ; preds = %.preheader.130
  %253 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !16
  %254 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %253, i64 -1, i32 0, i32 0
  %255 = load i8*, i8** %254, align 8, !tbaa !8
  invoke void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %204, i8* %255, i8* nonnull getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i32 54, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str.28, i64 0, i64 0))
          to label %256 unwind label %.loopexit

; <label>:256                                     ; preds = %252
  %257 = getelementptr inbounds i8, i8* %129, i64 4
  %258 = bitcast i8* %257 to float*
  %259 = load float*, float** %20, align 8, !tbaa !35
  %260 = getelementptr inbounds float, float* %259, i64 1
  %261 = invoke zeroext i1 @_ZN5Eigen13test_is_equalIffEEbRKT_RKT0_b(float* nonnull dereferenceable(4) %258, float* nonnull dereferenceable(4) %260, i1 zeroext false)
          to label %262 unwind label %.loopexit

; <label>:262                                     ; preds = %256
  %263 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !16
  %264 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %263, i64 -1, i32 0, i32 0
  %265 = load i8*, i8** %264, align 8, !tbaa !8
  invoke void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %261, i8* %265, i8* nonnull getelementptr inbounds ([32 x i8], [32 x i8]* @.str.25, i64 0, i64 0), i32 55, i8* nonnull getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i64 0, i64 0))
          to label %266 unwind label %.loopexit

; <label>:266                                     ; preds = %262
  %267 = load i8*, i8** %71, align 8, !tbaa !16
  %268 = invoke i32 @cudaFree(i8* %267)
          to label %205 unwind label %.loopexit.split-lp
}

declare i32 @cudaMalloc(i8**, i64) #0

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen16CudaStreamDeviceC2Ev(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %num_devices.i = alloca i32, align 4
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !17
  %2 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  store %struct.CUstream_st** @_ZN5EigenL14default_streamE, %struct.CUstream_st*** %2, align 8, !tbaa !77
  %3 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 3
  %4 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %5 = bitcast i8** %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 16, i32 8, i1 false)
  %6 = tail call i32 @cudaGetDevice(i32* %4)
  %.b12.i = load i1, i1* @_ZN5EigenL23m_devicePropInitializedE, align 1
  br i1 %.b12.i, label %_ZN5EigenL20initializeDevicePropEv.exit, label %7

; <label>:7                                       ; preds = %0
  %8 = atomicrmw xchg i8* getelementptr inbounds (%"struct.std::atomic", %"struct.std::atomic"* @_ZZN5EigenL20initializeDevicePropEvE5first, i64 0, i32 0, i32 0), i8 0 seq_cst
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %.preheader.i, label %.noexc

.preheader.i:                                     ; preds = %7
  %.b39.i = load i1, i1* @_ZN5EigenL23m_devicePropInitializedE, align 1
  br i1 %.b39.i, label %_ZN5EigenL20initializeDevicePropEv.exit, label %.lr.ph.i.preheader

.lr.ph.i.preheader:                               ; preds = %.preheader.i
  br label %.lr.ph.i

.noexc:                                           ; preds = %7
  %11 = bitcast i32* %num_devices.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %11) #2
  %12 = call i32 @cudaGetDeviceCount(i32* nonnull %num_devices.i)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %.noexc10, label %.noexc1

.noexc1:                                          ; preds = %.noexc
  %14 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.32, i64 0, i64 0), i64 42)
  %15 = call i8* @cudaGetErrorString(i32 %12)
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %28

; <label>:17                                      ; preds = %.noexc1
  %18 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8**), align 8, !tbaa !17
  %19 = getelementptr i8, i8* %18, i64 -24
  %20 = bitcast i8* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8*), i64 %21
  %23 = bitcast i8* %22 to %"class.std::basic_ios"*
  %24 = getelementptr inbounds i8, i8* %22, i64 32
  %25 = bitcast i8* %24 to i32*
  %26 = load i32, i32* %25, align 8, !tbaa !19
  %27 = or i32 %26, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %23, i32 %27)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i

; <label>:28                                      ; preds = %.noexc1
  %29 = call i64 @strlen(i8* nonnull %15) #2
  %30 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull %15, i64 %29)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i: ; preds = %17, %28
  %31 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8**), align 8, !tbaa !17
  %32 = getelementptr i8, i8* %31, i64 -24
  %33 = bitcast i8* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8*), i64 %34
  %36 = getelementptr inbounds i8, i8* %35, i64 240
  %37 = bitcast i8* %36 to %"class.std::ctype"**
  %38 = load %"class.std::ctype"*, %"class.std::ctype"** %37, align 8, !tbaa !26
  %39 = icmp eq %"class.std::ctype"* %38, null
  br i1 %39, label %.noexc5, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit7.i

.noexc5:                                          ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i
  call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit7.i: ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i
  %40 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %38, i64 0, i32 8
  %41 = load i8, i8* %40, align 8, !tbaa !29
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %.noexc6, label %43

; <label>:43                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit7.i
  %44 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %38, i64 0, i32 9, i64 10
  %45 = load i8, i8* %44, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit6.i

.noexc6:                                          ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit7.i
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %38)
  %46 = bitcast %"class.std::ctype"* %38 to i8 (%"class.std::ctype"*, i8)***
  %47 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %46, align 8, !tbaa !17
  %48 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %47, i64 6
  %49 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %48, align 8
  %50 = call signext i8 %49(%"class.std::ctype"* nonnull %38, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit6.i

_ZNKSt5ctypeIcE5widenEc.exit6.i:                  ; preds = %.noexc6, %43
  %.0.i5.i = phi i8 [ %45, %43 ], [ %50, %.noexc6 ]
  %51 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, i8 signext %.0.i5.i)
  %52 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %51)
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.33, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 66, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv, i64 0, i64 0)) #21
  unreachable

.noexc10:                                         ; preds = %.noexc
  %53 = load i32, i32* %num_devices.i, align 4, !tbaa !31
  %54 = sext i32 %53 to i64
  %55 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %54, i64 632)
  %56 = extractvalue { i64, i1 } %55, 1
  %57 = extractvalue { i64, i1 } %55, 0
  %58 = select i1 %56, i64 -1, i64 %57
  %59 = call noalias i8* @_Znam(i64 %58) #22
  store i8* %59, i8** bitcast (%struct.cudaDeviceProp** @_ZN5EigenL18m_devicePropertiesE to i8**), align 8, !tbaa !16
  %60 = icmp sgt i32 %53, 0
  br i1 %60, label %.lr.ph11.preheader.i, label %._crit_edge.i

.lr.ph11.preheader.i:                             ; preds = %.noexc10
  %61 = bitcast i8* %59 to %struct.cudaDeviceProp*
  %62 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %61, i32 0)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %.lr.ph.preheader, label %.noexc12

.lr.ph.preheader:                                 ; preds = %.lr.ph11.preheader.i
  br label %.lr.ph

._crit_edge.i.loopexit:                           ; preds = %.lr.ph
  br label %._crit_edge.i

._crit_edge.i:                                    ; preds = %._crit_edge.i.loopexit, %.noexc10
  fence release
  store i1 true, i1* @_ZN5EigenL23m_devicePropInitializedE, align 1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11) #2
  br label %_ZN5EigenL20initializeDevicePropEv.exit

.noexc12.loopexit:                                ; preds = %..lr.ph11_crit_edge.i
  %.lcssa38 = phi i32 [ %111, %..lr.ph11_crit_edge.i ]
  %.lcssa37 = phi i32 [ %110, %..lr.ph11_crit_edge.i ]
  br label %.noexc12

.noexc12:                                         ; preds = %.noexc12.loopexit, %.lr.ph11.preheader.i
  %.lcssa25 = phi i32 [ %62, %.lr.ph11.preheader.i ], [ %.lcssa38, %.noexc12.loopexit ]
  %.lcssa = phi i32 [ 0, %.lr.ph11.preheader.i ], [ %.lcssa37, %.noexc12.loopexit ]
  %64 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @.str.35, i64 0, i64 0), i64 34)
  %65 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, i32 %.lcssa)
  %66 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %65, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i64 0, i64 0), i64 2)
  %67 = call i8* @cudaGetErrorString(i32 %.lcssa25)
  %68 = icmp eq i8* %67, null
  br i1 %68, label %69, label %.noexc17

; <label>:69                                      ; preds = %.noexc12
  %70 = bitcast %"class.std::basic_ostream"* %65 to i8**
  %71 = load i8*, i8** %70, align 8, !tbaa !17
  %72 = getelementptr i8, i8* %71, i64 -24
  %73 = bitcast i8* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = bitcast %"class.std::basic_ostream"* %65 to i8*
  %76 = getelementptr inbounds i8, i8* %75, i64 %74
  %77 = bitcast i8* %76 to %"class.std::basic_ios"*
  %78 = getelementptr inbounds i8, i8* %76, i64 32
  %79 = bitcast i8* %78 to i32*
  %80 = load i32, i32* %79, align 8, !tbaa !19
  %81 = or i32 %80, 1
  call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %77, i32 %81)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit4.i

.noexc17:                                         ; preds = %.noexc12
  %82 = call i64 @strlen(i8* nonnull %67) #2
  %83 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %65, i8* nonnull %67, i64 %82)
  %.pre14.i = bitcast %"class.std::basic_ostream"* %65 to i8**
  %.pre15.i = bitcast %"class.std::basic_ostream"* %65 to i8*
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit4.i

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit4.i: ; preds = %69, %.noexc17
  %.pre-phi16.i = phi i8* [ %.pre15.i, %.noexc17 ], [ %75, %69 ]
  %.pre-phi.i = phi i8** [ %.pre14.i, %.noexc17 ], [ %70, %69 ]
  %84 = load i8*, i8** %.pre-phi.i, align 8, !tbaa !17
  %85 = getelementptr i8, i8* %84, i64 -24
  %86 = bitcast i8* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds i8, i8* %.pre-phi16.i, i64 %87
  %89 = getelementptr inbounds i8, i8* %88, i64 240
  %90 = bitcast i8* %89 to %"class.std::ctype"**
  %91 = load %"class.std::ctype"*, %"class.std::ctype"** %90, align 8, !tbaa !26
  %92 = icmp eq %"class.std::ctype"* %91, null
  br i1 %92, label %.noexc18, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i

.noexc18:                                         ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit4.i
  call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i:  ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit4.i
  %93 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %91, i64 0, i32 8
  %94 = load i8, i8* %93, align 8, !tbaa !29
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %.noexc19, label %96

; <label>:96                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i
  %97 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %91, i64 0, i32 9, i64 10
  %98 = load i8, i8* %97, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit.i

.noexc19:                                         ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %91)
  %99 = bitcast %"class.std::ctype"* %91 to i8 (%"class.std::ctype"*, i8)***
  %100 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %99, align 8, !tbaa !17
  %101 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %100, i64 6
  %102 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %101, align 8
  %103 = call signext i8 %102(%"class.std::ctype"* nonnull %91, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit.i

_ZNKSt5ctypeIcE5widenEc.exit.i:                   ; preds = %.noexc19, %96
  %.0.i.i = phi i8 [ %98, %96 ], [ %103, %.noexc19 ]
  %104 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %65, i8 signext %.0.i.i)
  %105 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %104)
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.33, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 77, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv, i64 0, i64 0)) #21
  unreachable

.lr.ph:                                           ; preds = %.lr.ph.preheader, %..lr.ph11_crit_edge.i
  %indvars.iv.i27 = phi i64 [ %indvars.iv.next.i, %..lr.ph11_crit_edge.i ], [ 0, %.lr.ph.preheader ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i27, 1
  %106 = load i32, i32* %num_devices.i, align 4, !tbaa !31
  %107 = sext i32 %106 to i64
  %108 = icmp slt i64 %indvars.iv.next.i, %107
  br i1 %108, label %..lr.ph11_crit_edge.i, label %._crit_edge.i.loopexit

..lr.ph11_crit_edge.i:                            ; preds = %.lr.ph
  %.pre.i = load %struct.cudaDeviceProp*, %struct.cudaDeviceProp** @_ZN5EigenL18m_devicePropertiesE, align 8, !tbaa !16
  %109 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %.pre.i, i64 %indvars.iv.next.i
  %110 = trunc i64 %indvars.iv.next.i to i32
  %111 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %109, i32 %110)
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %.lr.ph, label %.noexc12.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  fence acquire
  %113 = tail call i32 @sleep(i32 1)
  %.b3.i = load i1, i1* @_ZN5EigenL23m_devicePropInitializedE, align 1
  br i1 %.b3.i, label %_ZN5EigenL20initializeDevicePropEv.exit.loopexit, label %.lr.ph.i

_ZN5EigenL20initializeDevicePropEv.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5EigenL20initializeDevicePropEv.exit

_ZN5EigenL20initializeDevicePropEv.exit:          ; preds = %_ZN5EigenL20initializeDevicePropEv.exit.loopexit, %._crit_edge.i, %.preheader.i, %0
  ret void
}

declare i32 @cudaMemcpyAsync(i8*, i8*, i64, i32, %struct.CUstream_st*) #0

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #9

declare i32 @cudaStreamSynchronize(%struct.CUstream_st*) #0

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %condition, i8* %testname, i8* %file, i32 %line, i8* %condition_as_string) #7 comdat personality i32 (...)* @__gxx_personality_v0 {
  br i1 %condition, label %123, label %1

; <label>:1                                       ; preds = %0
  %2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.41, i64 0, i64 0), i64 5)
  %3 = icmp eq i8* %testname, null
  br i1 %3, label %4, label %15

; <label>:4                                       ; preds = %1
  %5 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8**), align 8, !tbaa !17
  %6 = getelementptr i8, i8* %5, i64 -24
  %7 = bitcast i8* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8*), i64 %8
  %10 = bitcast i8* %9 to %"class.std::basic_ios"*
  %11 = getelementptr inbounds i8, i8* %9, i64 32
  %12 = bitcast i8* %11 to i32*
  %13 = load i32, i32* %12, align 8, !tbaa !19
  %14 = or i32 %13, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %10, i32 %14)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

; <label>:15                                      ; preds = %1
  %16 = tail call i64 @strlen(i8* nonnull %testname) #2
  %17 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull %testname, i64 %16)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %4, %15
  %18 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.42, i64 0, i64 0), i64 11)
  %19 = icmp eq i8* %file, null
  br i1 %19, label %20, label %31

; <label>:20                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %21 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8**), align 8, !tbaa !17
  %22 = getelementptr i8, i8* %21, i64 -24
  %23 = bitcast i8* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cerr to i8*), i64 %24
  %26 = bitcast i8* %25 to %"class.std::basic_ios"*
  %27 = getelementptr inbounds i8, i8* %25, i64 32
  %28 = bitcast i8* %27 to i32*
  %29 = load i32, i32* %28, align 8, !tbaa !19
  %30 = or i32 %29, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %26, i32 %30)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit1

; <label>:31                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %32 = tail call i64 @strlen(i8* nonnull %file) #2
  %33 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull %file, i64 %32)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit1

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit1: ; preds = %20, %31
  %34 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i64 0, i64 0), i64 2)
  %35 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, i32 %line)
  %36 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %35, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0), i64 1)
  %37 = bitcast %"class.std::basic_ostream"* %35 to i8**
  %38 = load i8*, i8** %37, align 8, !tbaa !17
  %39 = getelementptr i8, i8* %38, i64 -24
  %40 = bitcast i8* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = bitcast %"class.std::basic_ostream"* %35 to i8*
  %43 = getelementptr inbounds i8, i8* %42, i64 %41
  %44 = getelementptr inbounds i8, i8* %43, i64 240
  %45 = bitcast i8* %44 to %"class.std::ctype"**
  %46 = load %"class.std::ctype"*, %"class.std::ctype"** %45, align 8, !tbaa !26
  %47 = icmp eq %"class.std::ctype"* %46, null
  br i1 %47, label %48, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:48                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit1
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit1
  %49 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %46, i64 0, i32 8
  %50 = load i8, i8* %49, align 8, !tbaa !29
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %55, label %52

; <label>:52                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %53 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %46, i64 0, i32 9, i64 10
  %54 = load i8, i8* %53, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:55                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %46)
  %56 = bitcast %"class.std::ctype"* %46 to i8 (%"class.std::ctype"*, i8)***
  %57 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %56, align 8, !tbaa !17
  %58 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %57, i64 6
  %59 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %58, align 8
  %60 = tail call signext i8 %59(%"class.std::ctype"* nonnull %46, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %52, %55
  %.0.i = phi i8 [ %54, %52 ], [ %60, %55 ]
  %61 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %35, i8 signext %.0.i)
  %62 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %61)
  %63 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %62, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.44, i64 0, i64 0), i64 4)
  %64 = icmp eq i8* %condition_as_string, null
  br i1 %64, label %65, label %78

; <label>:65                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit
  %66 = bitcast %"class.std::basic_ostream"* %62 to i8**
  %67 = load i8*, i8** %66, align 8, !tbaa !17
  %68 = getelementptr i8, i8* %67, i64 -24
  %69 = bitcast i8* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = bitcast %"class.std::basic_ostream"* %62 to i8*
  %72 = getelementptr inbounds i8, i8* %71, i64 %70
  %73 = bitcast i8* %72 to %"class.std::basic_ios"*
  %74 = getelementptr inbounds i8, i8* %72, i64 32
  %75 = bitcast i8* %74 to i32*
  %76 = load i32, i32* %75, align 8, !tbaa !19
  %77 = or i32 %76, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %73, i32 %77)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit2

; <label>:78                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit
  %79 = tail call i64 @strlen(i8* nonnull %condition_as_string) #2
  %80 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %62, i8* nonnull %condition_as_string, i64 %79)
  %.pre = bitcast %"class.std::basic_ostream"* %62 to i8**
  %.pre8 = bitcast %"class.std::basic_ostream"* %62 to i8*
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit2

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit2: ; preds = %65, %78
  %.pre-phi9 = phi i8* [ %71, %65 ], [ %.pre8, %78 ]
  %.pre-phi = phi i8** [ %66, %65 ], [ %.pre, %78 ]
  %81 = load i8*, i8** %.pre-phi, align 8, !tbaa !17
  %82 = getelementptr i8, i8* %81, i64 -24
  %83 = bitcast i8* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds i8, i8* %.pre-phi9, i64 %84
  %86 = getelementptr inbounds i8, i8* %85, i64 240
  %87 = bitcast i8* %86 to %"class.std::ctype"**
  %88 = load %"class.std::ctype"*, %"class.std::ctype"** %87, align 8, !tbaa !26
  %89 = icmp eq %"class.std::ctype"* %88, null
  br i1 %89, label %90, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit5

; <label>:90                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit2
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit5:   ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit2
  %91 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %88, i64 0, i32 8
  %92 = load i8, i8* %91, align 8, !tbaa !29
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

; <label>:94                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit5
  %95 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %88, i64 0, i32 9, i64 10
  %96 = load i8, i8* %95, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit4

; <label>:97                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit5
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %88)
  %98 = bitcast %"class.std::ctype"* %88 to i8 (%"class.std::ctype"*, i8)***
  %99 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %98, align 8, !tbaa !17
  %100 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %99, i64 6
  %101 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %100, align 8
  %102 = tail call signext i8 %101(%"class.std::ctype"* nonnull %88, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit4

_ZNKSt5ctypeIcE5widenEc.exit4:                    ; preds = %94, %97
  %.0.i3 = phi i8 [ %96, %94 ], [ %102, %97 ]
  %103 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %62, i8 signext %.0.i3)
  %104 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %103)
  %105 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.45, i64 0, i64 0), i64 7)
  %106 = load i64, i64* bitcast (%"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1) to i64*), align 8, !tbaa !7
  %107 = load i64, i64* bitcast (%"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E to i64*), align 8, !tbaa !1
  %108 = sub i64 %106, %107
  %109 = lshr i64 %108, 5
  %110 = trunc i64 %109 to i32
  %111 = icmp sgt i32 %110, 0
  br i1 %111, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %_ZNKSt5ctypeIcE5widenEc.exit4
  %sext = shl i64 %109, 32
  %112 = ashr exact i64 %sext, 32
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %_ZNKSt5ctypeIcE5widenEc.exit4
  %113 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.47, i64 0, i64 0), i64 1)
  tail call void @abort() #21
  unreachable

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %112, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %114 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.46, i64 0, i64 0), i64 4)
  %115 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !1
  %116 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %115, i64 %indvars.iv.next, i32 0, i32 0
  %117 = load i8*, i8** %116, align 8, !tbaa !8
  %118 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %115, i64 %indvars.iv.next, i32 1
  %119 = load i64, i64* %118, align 8, !tbaa !13
  %120 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* %117, i64 %119)
  %121 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %120, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.47, i64 0, i64 0), i64 1)
  %122 = icmp sgt i64 %indvars.iv, 1
  br i1 %122, label %.lr.ph, label %._crit_edge.loopexit

; <label>:123                                     ; preds = %0
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nocapture readonly dereferenceable(4) %a, float* nocapture readonly dereferenceable(4) %b) #7 comdat {
  %1 = load float, float* %a, align 4, !tbaa !73
  %2 = load float, float* %b, align 4, !tbaa !73
  %3 = fsub float %1, %2
  %4 = tail call float @fabsf(float %3) #13
  %5 = tail call float @fabsf(float %1) #13
  %6 = tail call float @fabsf(float %2) #13
  %7 = fcmp olt float %6, %5
  %8 = select i1 %7, float %6, float %5
  %9 = fmul float %8, 0x3F50624DE0000000
  %10 = fcmp ole float %4, %9
  br i1 %10, label %53, label %11

; <label>:11                                      ; preds = %0
  %12 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i64 0, i64 0), i64 35)
  %13 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, double 0x3F50624DE0000000)
  %14 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %13, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.53, i64 0, i64 0), i64 21)
  %15 = load float, float* %a, align 4, !tbaa !73
  %16 = load float, float* %b, align 4, !tbaa !73
  %17 = fsub float %15, %16
  %18 = fmul float %17, %17
  %19 = fmul float %15, %15
  %20 = fmul float %16, %16
  %21 = fcmp olt float %20, %19
  %22 = select i1 %21, float %20, float %19
  %23 = fdiv float %18, %22
  %24 = tail call float @sqrtf(float %23) #13
  %25 = fpext float %24 to double
  %26 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull %13, double %25)
  %27 = bitcast %"class.std::basic_ostream"* %26 to i8**
  %28 = load i8*, i8** %27, align 8, !tbaa !17
  %29 = getelementptr i8, i8* %28, i64 -24
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = bitcast %"class.std::basic_ostream"* %26 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 %31
  %34 = getelementptr inbounds i8, i8* %33, i64 240
  %35 = bitcast i8* %34 to %"class.std::ctype"**
  %36 = load %"class.std::ctype"*, %"class.std::ctype"** %35, align 8, !tbaa !26
  %37 = icmp eq %"class.std::ctype"* %36, null
  br i1 %37, label %38, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:38                                      ; preds = %11
  tail call void @_ZSt16__throw_bad_castv() #20
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %11
  %39 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %36, i64 0, i32 8
  %40 = load i8, i8* %39, align 8, !tbaa !29
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %45, label %42

; <label>:42                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %43 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %36, i64 0, i32 9, i64 10
  %44 = load i8, i8* %43, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:45                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %36)
  %46 = bitcast %"class.std::ctype"* %36 to i8 (%"class.std::ctype"*, i8)***
  %47 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %46, align 8, !tbaa !17
  %48 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %47, i64 6
  %49 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %48, align 8
  %50 = tail call signext i8 %49(%"class.std::ctype"* nonnull %36, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %42, %45
  %.0.i = phi i8 [ %44, %42 ], [ %50, %45 ]
  %51 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %26, i8 signext %.0.i)
  %52 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %51)
  br label %53

; <label>:53                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit, %0
  ret i1 %10
}

; Function Attrs: uwtable
define linkonce_odr zeroext i1 @_ZN5Eigen13test_is_equalIffEEbRKT_RKT0_b(float* nocapture readonly dereferenceable(4) %actual, float* nocapture readonly dereferenceable(4) %expected, i1 zeroext %expect_equal) #4 comdat {
  %1 = load float, float* %actual, align 4, !tbaa !73
  %2 = load float, float* %expected, align 4, !tbaa !73
  %3 = fcmp oeq float %1, %2
  %tmp = xor i1 %3, %expect_equal
  br i1 %tmp, label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit, label %15

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %0
  %4 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.54, i64 0, i64 0), i64 16)
  %5 = load float, float* %actual, align 4, !tbaa !73
  %6 = fpext float %5 to double
  %7 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, double %6)
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %7, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.55, i64 0, i64 0), i64 14)
  %.str.56..str.57 = select i1 %expect_equal, [3 x i8]* @.str.56, [3 x i8]* @.str.57
  %9 = getelementptr inbounds [3 x i8], [3 x i8]* %.str.56..str.57, i64 0, i64 0
  %10 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %7, i8* nonnull %9, i64 2)
  %11 = load float, float* %expected, align 4, !tbaa !73
  %12 = fpext float %11 to double
  %13 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull %7, double %12)
  %14 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %13, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58, i64 0, i64 0), i64 2)
  br label %15

; <label>:15                                      ; preds = %0, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %.0 = phi i1 [ false, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit ], [ true, %0 ]
  ret i1 %.0
}

declare i32 @cudaFree(i8*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN5Eigen16CudaStreamDeviceD2Ev(%"class.Eigen::CudaStreamDevice"* nocapture %this) unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !17
  %2 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 3
  %3 = load i8*, i8** %2, align 8, !tbaa !74
  %4 = icmp eq i8* %3, null
  br i1 %4, label %_ZNK5Eigen16CudaStreamDevice10deallocateEPv.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %7 = load i32, i32* %6, align 8, !tbaa !76
  %8 = invoke i32 @cudaSetDevice(i32 %7)
          to label %.noexc unwind label %15

.noexc:                                           ; preds = %5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %.noexc
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %.noexc
  %12 = invoke i32 @cudaFree(i8* nonnull %3)
          to label %.noexc1 unwind label %15

.noexc1:                                          ; preds = %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %_ZNK5Eigen16CudaStreamDevice10deallocateEPv.exit, label %14

; <label>:14                                      ; preds = %.noexc1
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:15                                      ; preds = %11, %5
  %16 = landingpad { i8*, i32 }
          catch i8* null
  %17 = extractvalue { i8*, i32 } %16, 0
  tail call void @__clang_call_terminate(i8* %17) #21
  unreachable

_ZNK5Eigen16CudaStreamDevice10deallocateEPv.exit: ; preds = %.noexc1, %0
  ret void
}

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #10

; Function Attrs: nounwind
declare i64 @strtoul(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #9

declare i32 @cudaGetDevice(i32*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN5Eigen16CudaStreamDeviceD0Ev(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #3 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !17
  %2 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 3
  %3 = load i8*, i8** %2, align 8, !tbaa !74
  %4 = icmp eq i8* %3, null
  br i1 %4, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %7 = load i32, i32* %6, align 8, !tbaa !76
  %8 = invoke i32 @cudaSetDevice(i32 %7)
          to label %.noexc.i unwind label %15

.noexc.i:                                         ; preds = %5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %.noexc.i
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %.noexc.i
  %12 = invoke i32 @cudaFree(i8* nonnull %3)
          to label %.noexc1.i unwind label %15

.noexc1.i:                                        ; preds = %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %14

; <label>:14                                      ; preds = %.noexc1.i
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:15                                      ; preds = %11, %5
  %16 = landingpad { i8*, i32 }
          catch i8* null
  %17 = extractvalue { i8*, i32 } %16, 0
  tail call void @__clang_call_terminate(i8* %17) #21
  unreachable

_ZN5Eigen16CudaStreamDeviceD2Ev.exit:             ; preds = %0, %.noexc1.i
  %18 = bitcast %"class.Eigen::CudaStreamDevice"* %this to i8*
  tail call void @_ZdlPv(i8* %18) #23
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define linkonce_odr dereferenceable(8) %struct.CUstream_st** @_ZNK5Eigen16CudaStreamDevice6streamEv(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this) unnamed_addr #11 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  %2 = load %struct.CUstream_st**, %struct.CUstream_st*** %1, align 8, !tbaa !77
  ret %struct.CUstream_st** %2
}

; Function Attrs: norecurse nounwind readonly uwtable
define linkonce_odr dereferenceable(632) %struct.cudaDeviceProp* @_ZNK5Eigen16CudaStreamDevice16devicePropertiesEv(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this) unnamed_addr #11 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %2 = load i32, i32* %1, align 8, !tbaa !76
  %3 = sext i32 %2 to i64
  %4 = load %struct.cudaDeviceProp*, %struct.cudaDeviceProp** @_ZN5EigenL18m_devicePropertiesE, align 8, !tbaa !16
  %5 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %4, i64 %3
  ret %struct.cudaDeviceProp* %5
}

; Function Attrs: uwtable
define linkonce_odr i8* @_ZNK5Eigen16CudaStreamDevice8allocateEm(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this, i64 %num_bytes) unnamed_addr #4 comdat align 2 {
  %result = alloca i8*, align 8
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %2 = load i32, i32* %1, align 8, !tbaa !76
  %3 = tail call i32 @cudaSetDevice(i32 %2)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 142, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:6                                       ; preds = %0
  %7 = bitcast i8** %result to i8*
  call void @llvm.lifetime.start(i64 8, i8* %7) #2
  %8 = call i32 @cudaMalloc(i8** nonnull %result, i64 %num_bytes)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %6
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 145, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %6
  %12 = load i8*, i8** %result, align 8, !tbaa !16
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 146, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:15                                      ; preds = %11
  call void @llvm.lifetime.end(i64 8, i8* nonnull %7) #2
  ret i8* %12
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK5Eigen16CudaStreamDevice10deallocateEPv(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this, i8* %buffer) unnamed_addr #4 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %2 = load i32, i32* %1, align 8, !tbaa !76
  %3 = tail call i32 @cudaSetDevice(i32 %2)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:6                                       ; preds = %0
  %7 = icmp eq i8* %buffer, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %6
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.39, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 153, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:9                                       ; preds = %6
  %10 = tail call i32 @cudaFree(i8* nonnull %buffer)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %9
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:13                                      ; preds = %9
  ret void
}

; Function Attrs: uwtable
define linkonce_odr i8* @_ZNK5Eigen16CudaStreamDevice10scratchpadEv(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #4 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 3
  %2 = load i8*, i8** %1, align 8, !tbaa !74
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %10

; <label>:4                                       ; preds = %0
  %5 = bitcast %"class.Eigen::CudaStreamDevice"* %this to i8* (%"class.Eigen::CudaStreamDevice"*, i64)***
  %6 = load i8* (%"class.Eigen::CudaStreamDevice"*, i64)**, i8* (%"class.Eigen::CudaStreamDevice"*, i64)*** %5, align 8, !tbaa !17
  %7 = getelementptr inbounds i8* (%"class.Eigen::CudaStreamDevice"*, i64)*, i8* (%"class.Eigen::CudaStreamDevice"*, i64)** %6, i64 4
  %8 = load i8* (%"class.Eigen::CudaStreamDevice"*, i64)*, i8* (%"class.Eigen::CudaStreamDevice"*, i64)** %7, align 8
  %9 = tail call i8* %8(%"class.Eigen::CudaStreamDevice"* nonnull %this, i64 1028)
  store i8* %9, i8** %1, align 8, !tbaa !74
  br label %10

; <label>:10                                      ; preds = %4, %0
  %11 = phi i8* [ %9, %4 ], [ %2, %0 ]
  ret i8* %11
}

; Function Attrs: uwtable
define linkonce_odr i32* @_ZNK5Eigen16CudaStreamDevice9semaphoreEv(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #4 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 4
  %2 = load i32*, i32** %1, align 8, !tbaa !78
  %3 = icmp eq i32* %2, null
  br i1 %3, label %4, label %18

; <label>:4                                       ; preds = %0
  %5 = bitcast %"class.Eigen::CudaStreamDevice"* %this to i8* (%"class.Eigen::CudaStreamDevice"*)***
  %6 = load i8* (%"class.Eigen::CudaStreamDevice"*)**, i8* (%"class.Eigen::CudaStreamDevice"*)*** %5, align 8, !tbaa !17
  %7 = getelementptr inbounds i8* (%"class.Eigen::CudaStreamDevice"*)*, i8* (%"class.Eigen::CudaStreamDevice"*)** %6, i64 6
  %8 = load i8* (%"class.Eigen::CudaStreamDevice"*)*, i8* (%"class.Eigen::CudaStreamDevice"*)** %7, align 8
  %9 = tail call i8* %8(%"class.Eigen::CudaStreamDevice"* nonnull %this)
  %10 = getelementptr inbounds i8, i8* %9, i64 1024
  %11 = bitcast i32** %1 to i8**
  store i8* %10, i8** %11, align 8, !tbaa !78
  %12 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  %13 = load %struct.CUstream_st**, %struct.CUstream_st*** %12, align 8, !tbaa !77
  %14 = load %struct.CUstream_st*, %struct.CUstream_st** %13, align 8, !tbaa !16
  %15 = tail call i32 @cudaMemsetAsync(i8* %10, i32 0, i64 4, %struct.CUstream_st* %14)
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %17

._crit_edge:                                      ; preds = %4
  %.pre = load i32*, i32** %1, align 8, !tbaa !78
  br label %18

; <label>:17                                      ; preds = %4
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.34, i64 0, i64 0), i32 171, i8* nonnull getelementptr inbounds ([65 x i8], [65 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice9semaphoreEv, i64 0, i64 0)) #21
  unreachable

; <label>:18                                      ; preds = %._crit_edge, %0
  %19 = phi i32* [ %.pre, %._crit_edge ], [ %2, %0 ]
  ret i32* %19
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #12

declare i32 @cudaGetDeviceCount(i32*) #0

declare i8* @cudaGetErrorString(i32) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #13

; Function Attrs: nobuiltin
declare noalias nonnull i8* @_Znam(i64) #14

declare i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #0

declare i32 @sleep(i32) #0

declare i32 @cudaSetDevice(i32) #0

declare i32 @cudaMemsetAsync(i8*, i32, i64, %struct.CUstream_st*) #0

; Function Attrs: noreturn nounwind
declare void @abort() #9

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) #0

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #15 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #2
  tail call void @_ZSt9terminatev() #21
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

declare i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"*, i64* dereferenceable(8), i64) #0

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #8

declare void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"*, i32) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() #16

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"*, i64) #0

; Function Attrs: nounwind
declare void @_ZNSt6localeD1Ev(%"class.std::locale"*) #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"*) #1

; Function Attrs: uwtable
declare void @_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::__cxx11::basic_string"* noalias sret, %"class.std::__cxx11::basic_stringbuf"*) #4 align 2

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_(%"class.std::vector"* nocapture %this, %"class.std::__cxx11::basic_string"* dereferenceable(32) %__args) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit:
  %0 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 1
  %1 = bitcast %"class.std::__cxx11::basic_string"** %0 to i64*
  %2 = load i64, i64* %1, align 8, !tbaa !7
  %3 = bitcast %"class.std::vector"* %this to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !1
  %5 = sub i64 %2, %4
  %6 = ashr exact i64 %5, 5
  %7 = icmp eq i64 %6, 0
  %8 = select i1 %7, i64 1, i64 %6
  %9 = add nsw i64 %8, %6
  %10 = icmp ult i64 %9, %6
  %11 = icmp ugt i64 %9, 576460752303423487
  %or.cond.i = or i1 %10, %11
  %12 = select i1 %or.cond.i, i64 576460752303423487, i64 %9
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit, label %14

; <label>:14                                      ; preds = %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit
  %15 = icmp ugt i64 %12, 576460752303423487
  br i1 %15, label %16, label %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i

; <label>:16                                      ; preds = %14
  tail call void @_ZSt17__throw_bad_allocv() #20
  unreachable

_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i: ; preds = %14
  %17 = shl i64 %12, 5
  %18 = tail call noalias i8* @_Znwm(i64 %17)
  %19 = bitcast i8* %18 to %"class.std::__cxx11::basic_string"*
  %.pre = load i64, i64* %1, align 8, !tbaa !7
  %.pre6 = load i64, i64* %3, align 8, !tbaa !1
  br label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit: ; preds = %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit, %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i
  %20 = phi i64 [ %.pre6, %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i ], [ %4, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit ]
  %21 = phi i64 [ %.pre, %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i ], [ %2, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit ]
  %22 = phi %"class.std::__cxx11::basic_string"* [ %19, %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i ], [ null, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit ]
  %23 = sub i64 %21, %20
  %24 = ashr exact i64 %23, 5
  %25 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24
  %26 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24, i32 2
  %27 = bitcast %"class.std::__cxx11::basic_string"* %25 to %union.anon**
  store %union.anon* %26, %union.anon** %27, align 8, !tbaa !12
  %28 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8, !tbaa !8
  %30 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 2
  %31 = bitcast %union.anon* %30 to i8*
  %32 = icmp eq i8* %29, %31
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit
  %34 = bitcast %union.anon* %26 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* %29, i64 16, i32 1, i1 false) #2
  br label %40

; <label>:35                                      ; preds = %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit
  %36 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %25, i64 0, i32 0, i32 0
  store i8* %29, i8** %36, align 8, !tbaa !8
  %37 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 2, i32 0
  %38 = load i64, i64* %37, align 8, !tbaa !15
  %39 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24, i32 2, i32 0
  store i64 %38, i64* %39, align 8, !tbaa !15
  br label %40

; <label>:40                                      ; preds = %35, %33
  %41 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 1
  %42 = load i64, i64* %41, align 8, !tbaa !13
  %43 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24, i32 1
  store i64 %42, i64* %43, align 8, !tbaa !13
  %44 = bitcast %"class.std::__cxx11::basic_string"* %__args to %union.anon**
  store %union.anon* %30, %union.anon** %44, align 8, !tbaa !8
  store i64 0, i64* %41, align 8, !tbaa !13
  store i8 0, i8* %31, align 1, !tbaa !14
  %45 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 0
  %46 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  %47 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %0, align 8, !tbaa !7
  %48 = icmp eq %"class.std::__cxx11::basic_string"* %46, %47
  br i1 %48, label %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread, label %.lr.ph.preheader.i.i.i.i

_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread: ; preds = %40
  %49 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 1
  br label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5

.lr.ph.preheader.i.i.i.i:                         ; preds = %40
  %scevgep.i.i.i.i = getelementptr %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %47, i64 -1, i32 0, i32 0
  br label %.lr.ph.i.i.i.i

.lr.ph.i.i.i.i:                                   ; preds = %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i, %.lr.ph.preheader.i.i.i.i
  %__cur.02.i.i.i.i = phi %"class.std::__cxx11::basic_string"* [ %69, %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i ], [ %22, %.lr.ph.preheader.i.i.i.i ]
  %__first.sroa.0.01.i.i.i.i = phi %"class.std::__cxx11::basic_string"* [ %68, %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i ], [ %46, %.lr.ph.preheader.i.i.i.i ]
  %50 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 2
  %51 = bitcast %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i to %union.anon**
  store %union.anon* %50, %union.anon** %51, align 8, !tbaa !12
  %52 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 0, i32 0
  %53 = load i8*, i8** %52, align 8, !tbaa !8
  %54 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 2
  %55 = bitcast %union.anon* %54 to i8*
  %56 = icmp eq i8* %53, %55
  br i1 %56, label %57, label %59

; <label>:57                                      ; preds = %.lr.ph.i.i.i.i
  %58 = bitcast %union.anon* %50 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %58, i8* %53, i64 16, i32 1, i1 false) #2
  br label %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i

; <label>:59                                      ; preds = %.lr.ph.i.i.i.i
  %60 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 0, i32 0
  store i8* %53, i8** %60, align 8, !tbaa !8
  %61 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 2, i32 0
  %62 = load i64, i64* %61, align 8, !tbaa !15
  %63 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 2, i32 0
  store i64 %62, i64* %63, align 8, !tbaa !15
  br label %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i

_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i: ; preds = %59, %57
  %64 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 1
  %65 = load i64, i64* %64, align 8, !tbaa !13
  %66 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 1
  store i64 %65, i64* %66, align 8, !tbaa !13
  %67 = bitcast %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i to %union.anon**
  store %union.anon* %54, %union.anon** %67, align 8, !tbaa !8
  store i64 0, i64* %64, align 8, !tbaa !13
  store i8 0, i8* %55, align 1, !tbaa !14
  %68 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 1
  %69 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 1
  %70 = icmp eq %"class.std::__cxx11::basic_string"* %68, %47
  br i1 %70, label %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit, label %.lr.ph.i.i.i.i

_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit: ; preds = %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i
  %71 = ptrtoint i8** %scevgep.i.i.i.i to i64
  %__first.coerce4.i.i.i.i = ptrtoint %"class.std::__cxx11::basic_string"* %46 to i64
  %72 = sub i64 %71, %__first.coerce4.i.i.i.i
  %73 = lshr i64 %72, 5
  %74 = add nuw nsw i64 %73, 1
  %scevgep6.i.i.i.i = getelementptr %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %74
  %.pre7 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  %.pre8 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %0, align 8, !tbaa !7
  %75 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %scevgep6.i.i.i.i, i64 1
  %76 = icmp eq %"class.std::__cxx11::basic_string"* %.pre7, %.pre8
  br i1 %76, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5, label %.lr.ph.i.i.i3.preheader

.lr.ph.i.i.i3.preheader:                          ; preds = %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit
  br label %.lr.ph.i.i.i3

.lr.ph.i.i.i3:                                    ; preds = %.lr.ph.i.i.i3.preheader, %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4
  %.01.i.i.i2 = phi %"class.std::__cxx11::basic_string"* [ %83, %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4 ], [ %.pre7, %.lr.ph.i.i.i3.preheader ]
  %77 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i2, i64 0, i32 0, i32 0
  %78 = load i8*, i8** %77, align 8, !tbaa !8
  %79 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i2, i64 0, i32 2
  %80 = bitcast %union.anon* %79 to i8*
  %81 = icmp eq i8* %78, %80
  br i1 %81, label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4, label %82

; <label>:82                                      ; preds = %.lr.ph.i.i.i3
  tail call void @_ZdlPv(i8* %78) #2
  br label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4

_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4: ; preds = %82, %.lr.ph.i.i.i3
  %83 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i2, i64 1
  %84 = icmp eq %"class.std::__cxx11::basic_string"* %83, %.pre8
  br i1 %84, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split, label %.lr.ph.i.i.i3

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split: ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4
  %.pr = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  br label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5: ; preds = %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit
  %85 = phi %"class.std::__cxx11::basic_string"* [ %75, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split ], [ %75, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit ], [ %49, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread ]
  %86 = phi %"class.std::__cxx11::basic_string"* [ %.pr, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split ], [ %.pre8, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit ], [ %46, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread ]
  %87 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 2
  %88 = icmp eq %"class.std::__cxx11::basic_string"* %86, null
  br i1 %88, label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1, label %89

; <label>:89                                      ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5
  %90 = bitcast %"class.std::__cxx11::basic_string"* %86 to i8*
  tail call void @_ZdlPv(i8* %90) #2
  br label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1: ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5, %89
  store %"class.std::__cxx11::basic_string"* %22, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  store %"class.std::__cxx11::basic_string"* %85, %"class.std::__cxx11::basic_string"** %0, align 8, !tbaa !7
  %91 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %12
  store %"class.std::__cxx11::basic_string"* %91, %"class.std::__cxx11::basic_string"** %87, align 8, !tbaa !32
  ret void
}

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() #16

; Function Attrs: nobuiltin
declare noalias nonnull i8* @_Znwm(i64) #14

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr void @_ZN5Eigen8internal19throw_std_bad_allocEv() #17 comdat {
  %1 = tail call i8* @__cxa_allocate_exception(i64 8) #2
  %2 = bitcast i8* %1 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*], [5 x i8*]* @_ZTVSt9bad_alloc, i64 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !17
  tail call void @__cxa_throw(i8* %1, i8* bitcast (i8** @_ZTISt9bad_alloc to i8*), i8* bitcast (void (%"class.std::bad_alloc"*)* @_ZNSt9bad_allocD1Ev to i8*)) #20
  unreachable
}

declare i8* @__cxa_allocate_exception(i64)

; Function Attrs: nounwind
declare void @_ZNSt9bad_allocD1Ev(%"class.std::bad_alloc"*) #1

declare void @__cxa_throw(i8*, i8*, i8*)

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: inlinehint norecurse nounwind uwtable
define linkonce_odr void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0EiEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nocapture readonly dereferenceable(16) %expr, %"struct.Eigen::DefaultDevice"* dereferenceable(1) %device) #18 comdat align 2 {
  %1 = bitcast %"class.Eigen::TensorAssignOp"* %expr to i64**
  %2 = load i64*, i64** %1, align 8, !tbaa !14
  %3 = load i64, i64* %2, align 8, !tbaa !35
  %4 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %expr, i64 0, i32 1
  %5 = load %"class.Eigen::TensorCwiseNullaryOp.9"*, %"class.Eigen::TensorCwiseNullaryOp.9"** %4, align 8, !tbaa !14
  %6 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.9", %"class.Eigen::TensorCwiseNullaryOp.9"* %5, i64 0, i32 1, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !46
  %8 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.9", %"class.Eigen::TensorCwiseNullaryOp.9"* %5, i64 0, i32 0
  %9 = load %"class.Eigen::Tensor"*, %"class.Eigen::Tensor"** %8, align 8, !tbaa !14
  %10 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %9, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = sdiv i32 %11, 16
  %13 = shl nsw i32 %12, 4
  %14 = icmp sgt i32 %11, 15
  br i1 %14, label %.preheader5.lr.ph, label %._crit_edge16

.preheader5.lr.ph:                                ; preds = %0
  %15 = inttoptr i64 %3 to float*
  %16 = sext i32 %13 to i64
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.lr.ph, %23
  %indvars.iv24 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next25, %23 ]
  %evaluator.sroa.8.014 = phi i64 [ %7, %.preheader5.lr.ph ], [ %.lcssa29, %23 ]
  br label %25

._crit_edge16.loopexit:                           ; preds = %23
  %.lcssa29.lcssa = phi i64 [ %.lcssa29, %23 ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %0
  %evaluator.sroa.8.0.lcssa = phi i64 [ %7, %0 ], [ %.lcssa29.lcssa, %._crit_edge16.loopexit ]
  %17 = sdiv i32 %11, 4
  %18 = shl nsw i32 %17, 2
  %19 = icmp slt i32 %13, %18
  br i1 %19, label %.lr.ph11, label %.preheader

.lr.ph11:                                         ; preds = %._crit_edge16
  %20 = inttoptr i64 %3 to float*
  %21 = sext i32 %13 to i64
  %22 = sext i32 %18 to i64
  br label %84

; <label>:23                                      ; preds = %25
  %.lcssa29 = phi i64 [ %66, %25 ]
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 16
  %24 = icmp slt i64 %indvars.iv.next25, %16
  br i1 %24, label %.preheader5, label %._crit_edge16.loopexit

; <label>:25                                      ; preds = %25, %.preheader5
  %indvars.iv21 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next22, %25 ]
  %evaluator.sroa.8.112 = phi i64 [ %evaluator.sroa.8.014, %.preheader5 ], [ %66, %25 ]
  %26 = shl i64 %indvars.iv21, 2
  %27 = add nuw nsw i64 %26, %indvars.iv24
  %28 = add i64 %27, %evaluator.sroa.8.112
  %29 = mul i64 %28, 6364136223846793005
  %30 = add i64 %29, -2720673578348880933
  %31 = lshr i64 %28, 22
  %32 = xor i64 %31, %28
  %33 = lshr i64 %28, 61
  %34 = add nuw nsw i64 %33, 22
  %35 = lshr i64 %32, %34
  %36 = trunc i64 %35 to i32
  %37 = and i32 %36, 8388607
  %38 = or i32 %37, 1065353216
  %39 = bitcast i32 %38 to float
  %40 = fadd float %39, -1.000000e+00
  %41 = mul i64 %30, 6364136223846793005
  %42 = add i64 %41, -2720673578348880933
  %43 = lshr i64 %30, 22
  %44 = xor i64 %43, %30
  %45 = lshr i64 %30, 61
  %46 = add nuw nsw i64 %45, 22
  %47 = lshr i64 %44, %46
  %48 = trunc i64 %47 to i32
  %49 = and i32 %48, 8388607
  %50 = or i32 %49, 1065353216
  %51 = bitcast i32 %50 to float
  %52 = fadd float %51, -1.000000e+00
  %53 = mul i64 %42, 6364136223846793005
  %54 = add i64 %53, -2720673578348880933
  %55 = lshr i64 %42, 22
  %56 = xor i64 %55, %42
  %57 = lshr i64 %42, 61
  %58 = add nuw nsw i64 %57, 22
  %59 = lshr i64 %56, %58
  %60 = trunc i64 %59 to i32
  %61 = and i32 %60, 8388607
  %62 = or i32 %61, 1065353216
  %63 = bitcast i32 %62 to float
  %64 = fadd float %63, -1.000000e+00
  %65 = mul i64 %54, 6364136223846793005
  %66 = add i64 %65, -2720673578348880933
  %67 = lshr i64 %54, 22
  %68 = xor i64 %67, %54
  %69 = lshr i64 %54, 61
  %70 = add nuw nsw i64 %69, 22
  %71 = lshr i64 %68, %70
  %72 = trunc i64 %71 to i32
  %73 = and i32 %72, 8388607
  %74 = or i32 %73, 1065353216
  %75 = bitcast i32 %74 to float
  %76 = fadd float %75, -1.000000e+00
  %77 = getelementptr inbounds float, float* %15, i64 %27
  store float %40, float* %77, align 4, !tbaa !73
  %78 = getelementptr inbounds float, float* %77, i64 1
  store float %52, float* %78, align 4, !tbaa !73
  %79 = getelementptr inbounds float, float* %77, i64 2
  store float %64, float* %79, align 4, !tbaa !73
  %80 = getelementptr inbounds float, float* %77, i64 3
  store float %76, float* %80, align 4, !tbaa !73
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 4
  br i1 %exitcond23, label %23, label %25

.preheader.loopexit:                              ; preds = %84
  %.lcssa = phi i64 [ %123, %84 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %._crit_edge16
  %evaluator.sroa.8.2.lcssa = phi i64 [ %evaluator.sroa.8.0.lcssa, %._crit_edge16 ], [ %.lcssa, %.preheader.loopexit ]
  %81 = icmp slt i32 %18, %11
  br i1 %81, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %82 = inttoptr i64 %3 to float*
  %83 = sext i32 %18 to i64
  br label %139

; <label>:84                                      ; preds = %.lr.ph11, %84
  %indvars.iv19 = phi i64 [ %21, %.lr.ph11 ], [ %indvars.iv.next20, %84 ]
  %evaluator.sroa.8.28 = phi i64 [ %evaluator.sroa.8.0.lcssa, %.lr.ph11 ], [ %123, %84 ]
  %85 = add i64 %indvars.iv19, %evaluator.sroa.8.28
  %86 = mul i64 %85, 6364136223846793005
  %87 = add i64 %86, -2720673578348880933
  %88 = lshr i64 %85, 22
  %89 = xor i64 %88, %85
  %90 = lshr i64 %85, 61
  %91 = add nuw nsw i64 %90, 22
  %92 = lshr i64 %89, %91
  %93 = trunc i64 %92 to i32
  %94 = and i32 %93, 8388607
  %95 = or i32 %94, 1065353216
  %96 = bitcast i32 %95 to float
  %97 = fadd float %96, -1.000000e+00
  %98 = mul i64 %87, 6364136223846793005
  %99 = add i64 %98, -2720673578348880933
  %100 = lshr i64 %87, 22
  %101 = xor i64 %100, %87
  %102 = lshr i64 %87, 61
  %103 = add nuw nsw i64 %102, 22
  %104 = lshr i64 %101, %103
  %105 = trunc i64 %104 to i32
  %106 = and i32 %105, 8388607
  %107 = or i32 %106, 1065353216
  %108 = bitcast i32 %107 to float
  %109 = fadd float %108, -1.000000e+00
  %110 = mul i64 %99, 6364136223846793005
  %111 = add i64 %110, -2720673578348880933
  %112 = lshr i64 %99, 22
  %113 = xor i64 %112, %99
  %114 = lshr i64 %99, 61
  %115 = add nuw nsw i64 %114, 22
  %116 = lshr i64 %113, %115
  %117 = trunc i64 %116 to i32
  %118 = and i32 %117, 8388607
  %119 = or i32 %118, 1065353216
  %120 = bitcast i32 %119 to float
  %121 = fadd float %120, -1.000000e+00
  %122 = mul i64 %111, 6364136223846793005
  %123 = add i64 %122, -2720673578348880933
  %124 = lshr i64 %111, 22
  %125 = xor i64 %124, %111
  %126 = lshr i64 %111, 61
  %127 = add nuw nsw i64 %126, 22
  %128 = lshr i64 %125, %127
  %129 = trunc i64 %128 to i32
  %130 = and i32 %129, 8388607
  %131 = or i32 %130, 1065353216
  %132 = bitcast i32 %131 to float
  %133 = fadd float %132, -1.000000e+00
  %134 = getelementptr inbounds float, float* %20, i64 %indvars.iv19
  store float %97, float* %134, align 4, !tbaa !73
  %135 = getelementptr inbounds float, float* %134, i64 1
  store float %109, float* %135, align 4, !tbaa !73
  %136 = getelementptr inbounds float, float* %134, i64 2
  store float %121, float* %136, align 4, !tbaa !73
  %137 = getelementptr inbounds float, float* %134, i64 3
  store float %133, float* %137, align 4, !tbaa !73
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 4
  %138 = icmp slt i64 %indvars.iv.next20, %22
  br i1 %138, label %84, label %.preheader.loopexit

; <label>:139                                     ; preds = %139, %.lr.ph
  %indvars.iv = phi i64 [ %83, %.lr.ph ], [ %indvars.iv.next, %139 ]
  %evaluator.sroa.8.36 = phi i64 [ %evaluator.sroa.8.2.lcssa, %.lr.ph ], [ %142, %139 ]
  %140 = add i64 %indvars.iv, %evaluator.sroa.8.36
  %141 = mul i64 %140, 6364136223846793005
  %142 = add i64 %141, -2720673578348880933
  %143 = lshr i64 %140, 22
  %144 = xor i64 %143, %140
  %145 = lshr i64 %140, 61
  %146 = add nuw nsw i64 %145, 22
  %147 = lshr i64 %144, %146
  %148 = trunc i64 %147 to i32
  %149 = and i32 %148, 8388607
  %150 = or i32 %149, 1065353216
  %151 = bitcast i32 %150 to float
  %152 = fadd float %151, -1.000000e+00
  %153 = getelementptr inbounds float, float* %82, i64 %indvars.iv
  store float %152, float* %153, align 4, !tbaa !73
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %11
  br i1 %exitcond, label %._crit_edge.loopexit, label %139

._crit_edge.loopexit:                             ; preds = %139
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret void
}

; Function Attrs: nounwind
declare i32 @clock_gettime(i32, %struct.timespec*) #1

; Function Attrs: nounwind
declare i64 @random() #1

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_(%"class.Eigen::TensorAssignOp.15"* nocapture readonly dereferenceable(16) %expr, %"struct.Eigen::GpuDevice"* dereferenceable(16) %device) #4 comdat align 2 {
  %1 = alloca i32, align 4
  %2 = alloca %"struct.Eigen::TensorEvaluator.17", align 8
  %3 = getelementptr inbounds %"class.Eigen::TensorAssignOp.15", %"class.Eigen::TensorAssignOp.15"* %expr, i64 0, i32 0
  %4 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %3, align 8, !tbaa !14
  %5 = bitcast %"class.Eigen::TensorMap"* %4 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !57
  %7 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %4, i64 0, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %"class.Eigen::TensorAssignOp.15", %"class.Eigen::TensorAssignOp.15"* %expr, i64 0, i32 1
  %10 = load %"class.Eigen::TensorCwiseNullaryOp"*, %"class.Eigen::TensorCwiseNullaryOp"** %9, align 8, !tbaa !14
  %11 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %10, i64 0, i32 1
  %12 = bitcast %"struct.Eigen::internal::scalar_constant_op"* %11 to i32*
  %13 = load i32, i32* %12, align 4, !tbaa !64
  %14 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %10, i64 0, i32 0
  %15 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %14, align 8, !tbaa !14
  %16 = bitcast %"class.Eigen::TensorMap"* %15 to i64*
  %17 = load i64, i64* %16, align 8, !tbaa !57
  %18 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %15, i64 0, i32 1, i32 0, i32 0, i64 0
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %device, i64 0, i32 0
  %21 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %20, align 8, !tbaa !54
  %22 = bitcast %"class.Eigen::StreamInterface"* %21 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %23 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %22, align 8, !tbaa !17
  %24 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %23, i64 3
  %25 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %24, align 8
  %26 = tail call dereferenceable(632) %struct.cudaDeviceProp* %25(%"class.Eigen::StreamInterface"* %21)
  %27 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %26, i64 0, i32 6
  %28 = load i32, i32* %27, align 8, !tbaa !79
  %29 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %20, align 8, !tbaa !54
  %30 = bitcast %"class.Eigen::StreamInterface"* %29 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %31 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %30, align 8, !tbaa !17
  %32 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %31, i64 3
  %33 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %32, align 8
  %34 = tail call dereferenceable(632) %struct.cudaDeviceProp* %33(%"class.Eigen::StreamInterface"* %29)
  %35 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %34, i64 0, i32 16
  %36 = load i32, i32* %35, align 4, !tbaa !81
  %37 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %20, align 8, !tbaa !54
  %38 = bitcast %"class.Eigen::StreamInterface"* %37 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %39 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %38, align 8, !tbaa !17
  %40 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %39, i64 3
  %41 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %40, align 8
  %42 = tail call dereferenceable(632) %struct.cudaDeviceProp* %41(%"class.Eigen::StreamInterface"* %37)
  %43 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %42, i64 0, i32 53
  %44 = load i32, i32* %43, align 4, !tbaa !82
  %45 = mul nsw i32 %44, %36
  %46 = sdiv i32 %45, %28
  %47 = add i32 %19, -1
  %48 = add i32 %47, %28
  %49 = sdiv i32 %48, %28
  %50 = icmp slt i32 %49, %46
  %51 = select i1 %50, i32 %49, i32 %46
  %52 = icmp slt i32 %51, 1
  %53 = select i1 %52, i32 1, i32 %51
  %54 = zext i32 %53 to i64
  %55 = or i64 %54, 4294967296
  %56 = zext i32 %28 to i64
  %57 = or i64 %56, 4294967296
  %58 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %20, align 8, !tbaa !54
  %59 = bitcast %"class.Eigen::StreamInterface"* %58 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %60 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %59, align 8, !tbaa !17
  %61 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %60, i64 2
  %62 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %61, align 8
  %63 = tail call dereferenceable(8) %struct.CUstream_st** %62(%"class.Eigen::StreamInterface"* %58)
  %64 = load %struct.CUstream_st*, %struct.CUstream_st** %63, align 8, !tbaa !16
  %65 = tail call i32 @cudaConfigureCall(i64 %55, i32 1, i64 %57, i32 1, i64 0, %struct.CUstream_st* %64)
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %86

; <label>:67                                      ; preds = %0
  %68 = bitcast %"struct.Eigen::TensorEvaluator.17"* %2 to i8*
  %69 = bitcast %"struct.Eigen::TensorEvaluator.17"* %2 to i64*
  store i64 %6, i64* %69, align 8
  %70 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 %8, i32* %70, align 8
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %71, align 8
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1
  %73 = bitcast %"struct.Eigen::TensorEvaluator.19"* %72 to i32*
  store i32 %13, i32* %73, align 8, !tbaa !64
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2
  %75 = bitcast %"struct.Eigen::TensorEvaluator.20"* %74 to i64*
  store i64 %17, i64* %75, align 8
  %76 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0, i64 0
  store i32 %19, i32* %76, align 8
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %77, align 8
  %78 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %78)
  store i32 %19, i32* %1, align 4, !tbaa !31
  %79 = call i32 @cudaSetupArgument(i8* %68, i64 64, i64 0)
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit

; <label>:81                                      ; preds = %67
  %82 = call i32 @cudaSetupArgument(i8* %78, i64 4, i64 64)
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit

; <label>:84                                      ; preds = %81
  %85 = call i32 @cudaLaunch(i8* nonnull bitcast (void (%"struct.Eigen::TensorEvaluator.17"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit

_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit: ; preds = %67, %81, %84
  call void @llvm.lifetime.end(i64 4, i8* %78)
  br label %86

; <label>:86                                      ; preds = %0, %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit
  %87 = call i32 @cudaGetLastError()
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %90, label %89

; <label>:89                                      ; preds = %86
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([34 x i8], [34 x i8]* @.str.50, i64 0, i64 0), i8* nonnull getelementptr inbounds ([69 x i8], [69 x i8]* @.str.51, i64 0, i64 0), i32 262, i8* nonnull getelementptr inbounds ([633 x i8], [633 x i8]* @__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_, i64 0, i64 0)) #21
  unreachable

; <label>:90                                      ; preds = %86
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #0

; Function Attrs: uwtable
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.17"* %eval, i32 %size) #4 comdat {
  %1 = alloca i32, align 4
  store i32 %size, i32* %1, align 4, !tbaa !31
  %2 = bitcast %"struct.Eigen::TensorEvaluator.17"* %eval to i8*
  %3 = tail call i32 @cudaSetupArgument(i8* %2, i64 64, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32* %1 to i8*
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 64)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %5
  %10 = call i32 @cudaLaunch(i8* nonnull bitcast (void (%"struct.Eigen::TensorEvaluator.17"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %11

; <label>:11                                      ; preds = %9, %5, %0
  ret void
}

declare i32 @cudaGetLastError() #0

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_(%"class.Eigen::TensorAssignOp.23"* nocapture readonly dereferenceable(16) %expr, %"struct.Eigen::GpuDevice"* dereferenceable(16) %device) #4 comdat align 2 {
  %1 = alloca i32, align 4
  %2 = alloca %"struct.Eigen::TensorEvaluator.25", align 8
  %3 = getelementptr inbounds %"class.Eigen::TensorAssignOp.23", %"class.Eigen::TensorAssignOp.23"* %expr, i64 0, i32 0
  %4 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %3, align 8, !tbaa !14
  %5 = bitcast %"class.Eigen::TensorMap"* %4 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !57
  %7 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %4, i64 0, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %"class.Eigen::TensorAssignOp.23", %"class.Eigen::TensorAssignOp.23"* %expr, i64 0, i32 1
  %10 = load %"class.Eigen::TensorCwiseNullaryOp.7"*, %"class.Eigen::TensorCwiseNullaryOp.7"** %9, align 8, !tbaa !14
  %11 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.7", %"class.Eigen::TensorCwiseNullaryOp.7"* %10, i64 0, i32 1, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !46
  %13 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp.7", %"class.Eigen::TensorCwiseNullaryOp.7"* %10, i64 0, i32 0
  %14 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %13, align 8, !tbaa !14
  %15 = bitcast %"class.Eigen::TensorMap"* %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !57
  %17 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %14, i64 0, i32 1, i32 0, i32 0, i64 0
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %device, i64 0, i32 0
  %20 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %19, align 8, !tbaa !54
  %21 = bitcast %"class.Eigen::StreamInterface"* %20 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %22 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %21, align 8, !tbaa !17
  %23 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %22, i64 3
  %24 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %23, align 8
  %25 = tail call dereferenceable(632) %struct.cudaDeviceProp* %24(%"class.Eigen::StreamInterface"* %20)
  %26 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %25, i64 0, i32 6
  %27 = load i32, i32* %26, align 8, !tbaa !79
  %28 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %19, align 8, !tbaa !54
  %29 = bitcast %"class.Eigen::StreamInterface"* %28 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %30 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %29, align 8, !tbaa !17
  %31 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %30, i64 3
  %32 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %31, align 8
  %33 = tail call dereferenceable(632) %struct.cudaDeviceProp* %32(%"class.Eigen::StreamInterface"* %28)
  %34 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %33, i64 0, i32 16
  %35 = load i32, i32* %34, align 4, !tbaa !81
  %36 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %19, align 8, !tbaa !54
  %37 = bitcast %"class.Eigen::StreamInterface"* %36 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %38 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %37, align 8, !tbaa !17
  %39 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %38, i64 3
  %40 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %39, align 8
  %41 = tail call dereferenceable(632) %struct.cudaDeviceProp* %40(%"class.Eigen::StreamInterface"* %36)
  %42 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %41, i64 0, i32 53
  %43 = load i32, i32* %42, align 4, !tbaa !82
  %44 = mul nsw i32 %43, %35
  %45 = sdiv i32 %44, %27
  %46 = add i32 %18, -1
  %47 = add i32 %46, %27
  %48 = sdiv i32 %47, %27
  %49 = icmp slt i32 %48, %45
  %50 = select i1 %49, i32 %48, i32 %45
  %51 = icmp slt i32 %50, 1
  %52 = select i1 %51, i32 1, i32 %50
  %53 = zext i32 %52 to i64
  %54 = or i64 %53, 4294967296
  %55 = zext i32 %27 to i64
  %56 = or i64 %55, 4294967296
  %57 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %19, align 8, !tbaa !54
  %58 = bitcast %"class.Eigen::StreamInterface"* %57 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %59 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %58, align 8, !tbaa !17
  %60 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %59, i64 2
  %61 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %60, align 8
  %62 = tail call dereferenceable(8) %struct.CUstream_st** %61(%"class.Eigen::StreamInterface"* %57)
  %63 = load %struct.CUstream_st*, %struct.CUstream_st** %62, align 8, !tbaa !16
  %64 = tail call i32 @cudaConfigureCall(i64 %54, i32 1, i64 %56, i32 1, i64 0, %struct.CUstream_st* %63)
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %84

; <label>:66                                      ; preds = %0
  %67 = bitcast %"struct.Eigen::TensorEvaluator.25"* %2 to i8*
  %68 = bitcast %"struct.Eigen::TensorEvaluator.25"* %2 to i64*
  store i64 %6, i64* %68, align 8
  %69 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %2, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 %8, i32* %69, align 8
  %70 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %2, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %70, align 8
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %2, i64 0, i32 1, i32 0, i32 0
  store i64 %12, i64* %71, align 8, !tbaa !46
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %2, i64 0, i32 1, i32 1
  %73 = bitcast %"struct.Eigen::TensorEvaluator.20"* %72 to i64*
  store i64 %16, i64* %73, align 8
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %2, i64 0, i32 1, i32 1, i32 1, i32 0, i32 0, i64 0
  store i32 %18, i32* %74, align 8
  %75 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %2, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %75, align 8
  %76 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %76)
  store i32 %18, i32* %1, align 4, !tbaa !31
  %77 = call i32 @cudaSetupArgument(i8* %67, i64 64, i64 0)
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit

; <label>:79                                      ; preds = %66
  %80 = call i32 @cudaSetupArgument(i8* %76, i64 4, i64 64)
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit

; <label>:82                                      ; preds = %79
  %83 = call i32 @cudaLaunch(i8* nonnull bitcast (void (%"struct.Eigen::TensorEvaluator.25"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit

_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit: ; preds = %66, %79, %82
  call void @llvm.lifetime.end(i64 4, i8* %76)
  br label %84

; <label>:84                                      ; preds = %0, %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_.exit
  %85 = call i32 @cudaGetLastError()
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %88, label %87

; <label>:87                                      ; preds = %84
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([34 x i8], [34 x i8]* @.str.50, i64 0, i64 0), i8* nonnull getelementptr inbounds ([69 x i8], [69 x i8]* @.str.51, i64 0, i64 0), i32 262, i8* nonnull getelementptr inbounds ([641 x i8], [641 x i8]* @__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS6_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_, i64 0, i64 0)) #21
  unreachable

; <label>:88                                      ; preds = %84
  ret void
}

; Function Attrs: uwtable
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.25"* %eval, i32 %size) #4 comdat {
  %1 = alloca i32, align 4
  store i32 %size, i32* %1, align 4, !tbaa !31
  %2 = bitcast %"struct.Eigen::TensorEvaluator.25"* %eval to i8*
  %3 = tail call i32 @cudaSetupArgument(i8* %2, i64 64, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32* %1 to i8*
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 64)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %5
  %10 = call i32 @cudaLaunch(i8* nonnull bitcast (void (%"struct.Eigen::TensorEvaluator.25"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %11

; <label>:11                                      ; preds = %9, %5, %0
  ret void
}

; Function Attrs: nounwind readnone
declare float @fabsf(float) #10

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"*, double) #0

; Function Attrs: nounwind readnone
declare float @sqrtf(float) #10

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_test_cuda_nullary.cu() #4 section ".text.startup" personality i32 (...)* @__gxx_personality_v0 {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #2
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E to i8*), i8 0, i64 24, i32 8, i1 false) #2
  %2 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::vector"*)* @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev to void (i8*)*), i8* bitcast (%"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E to i8*), i8* nonnull @__dso_handle) #2
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_ctor(i8* nocapture) #19 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_dtor(i8* nocapture) #19 {
entry:
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { inlinehint uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nobuiltin nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind readnone }
attributes #14 = { nobuiltin "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { noinline noreturn nounwind }
attributes #16 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { inlinehint noreturn uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { inlinehint norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #19 = { norecurse nounwind readnone }
attributes #20 = { noreturn }
attributes #21 = { noreturn nounwind }
attributes #22 = { builtin }
attributes #23 = { builtin nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!1 = !{!2, !4, i64 0}
!2 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !3, i64 0}
!3 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !4, i64 0, !4, i64 8, !4, i64 16}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!2, !4, i64 8}
!8 = !{!9, !4, i64 0}
!9 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !10, i64 0, !11, i64 8, !5, i64 16}
!10 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !4, i64 0}
!11 = !{!"long", !5, i64 0}
!12 = !{!10, !4, i64 0}
!13 = !{!9, !11, i64 8}
!14 = !{!5, !5, i64 0}
!15 = !{!11, !11, i64 0}
!16 = !{!4, !4, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"vtable pointer", !6, i64 0}
!19 = !{!20, !22, i64 32}
!20 = !{!"_ZTSSt8ios_base", !11, i64 8, !11, i64 16, !21, i64 24, !22, i64 28, !22, i64 32, !4, i64 40, !23, i64 48, !5, i64 64, !24, i64 192, !4, i64 200, !25, i64 208}
!21 = !{!"_ZTSSt13_Ios_Fmtflags", !5, i64 0}
!22 = !{!"_ZTSSt12_Ios_Iostate", !5, i64 0}
!23 = !{!"_ZTSNSt8ios_base6_WordsE", !4, i64 0, !11, i64 8}
!24 = !{!"int", !5, i64 0}
!25 = !{!"_ZTSSt6locale", !4, i64 0}
!26 = !{!27, !4, i64 240}
!27 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !4, i64 216, !5, i64 224, !28, i64 225, !4, i64 232, !4, i64 240, !4, i64 248, !4, i64 256}
!28 = !{!"bool", !5, i64 0}
!29 = !{!30, !5, i64 56}
!30 = !{!"_ZTSSt5ctypeIcE", !4, i64 16, !28, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !5, i64 56, !5, i64 57, !5, i64 313, !5, i64 569}
!31 = !{!24, !24, i64 0}
!32 = !{!2, !4, i64 16}
!33 = !{!34, !11, i64 8}
!34 = !{!"_ZTSSi", !11, i64 8}
!35 = !{!36, !4, i64 0}
!36 = !{!"_ZTSN5Eigen13TensorStorageIfNS_6DSizesIiLi1EEELi0EEE", !4, i64 0, !37, i64 8}
!37 = !{!"_ZTSN5Eigen6DSizesIiLi1EEE"}
!38 = !{!39}
!39 = distinct !{!39, !40, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE6randomEv: %agg.result"}
!40 = distinct !{!40, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE6randomEv"}
!41 = !{!42, !11, i64 8}
!42 = !{!"_ZTS8timespec", !11, i64 0, !11, i64 8}
!43 = !{!44, !39}
!44 = distinct !{!44, !45, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_: %agg.result"}
!45 = distinct !{!45, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_"}
!46 = !{!47, !11, i64 0}
!47 = !{!"_ZTSN5Eigen8internal22UniformRandomGeneratorIfEE", !11, i64 0}
!48 = !{!49}
!49 = distinct !{!49, !50, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE6randomEv: %agg.result"}
!50 = distinct !{!50, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE6randomEv"}
!51 = !{!52, !49}
!52 = distinct !{!52, !53, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_: %agg.result"}
!53 = distinct !{!53, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0EiEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_"}
!54 = !{!55, !4, i64 0}
!55 = !{!"_ZTSN5Eigen9GpuDeviceE", !4, i64 0, !24, i64 8}
!56 = !{!55, !24, i64 8}
!57 = !{!58, !4, i64 0}
!58 = !{!"_ZTSN5Eigen9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEE", !4, i64 0, !37, i64 8}
!59 = !{!60, !62}
!60 = distinct !{!60, !61, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE11nullaryExprINS_8internal18scalar_constant_opIfEEEEKNS_20TensorCwiseNullaryOpIT_KS4_EERKSB_: %agg.result"}
!61 = distinct !{!61, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE11nullaryExprINS_8internal18scalar_constant_opIfEEEEKNS_20TensorCwiseNullaryOpIT_KS4_EERKSB_"}
!62 = distinct !{!62, !63, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE8constantERKf: %agg.result"}
!63 = distinct !{!63, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE8constantERKf"}
!64 = !{!65, !66, i64 0}
!65 = !{!"_ZTSN5Eigen8internal18scalar_constant_opIfEE", !66, i64 0}
!66 = !{!"float", !5, i64 0}
!67 = !{!68}
!68 = distinct !{!68, !69, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE6randomEv: %agg.result"}
!69 = distinct !{!69, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE6randomEv"}
!70 = !{!71, !68}
!71 = distinct !{!71, !72, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS4_EERKSB_: %agg.result"}
!72 = distinct !{!72, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS4_EERKSB_"}
!73 = !{!66, !66, i64 0}
!74 = !{!75, !4, i64 24}
!75 = !{!"_ZTSN5Eigen16CudaStreamDeviceE", !4, i64 8, !24, i64 16, !4, i64 24, !4, i64 32}
!76 = !{!75, !24, i64 16}
!77 = !{!75, !4, i64 8}
!78 = !{!75, !4, i64 32}
!79 = !{!80, !24, i64 288}
!80 = !{!"_ZTS14cudaDeviceProp", !5, i64 0, !11, i64 256, !11, i64 264, !24, i64 272, !24, i64 276, !11, i64 280, !24, i64 288, !5, i64 292, !5, i64 304, !24, i64 316, !11, i64 320, !24, i64 328, !24, i64 332, !11, i64 336, !11, i64 344, !24, i64 352, !24, i64 356, !24, i64 360, !24, i64 364, !24, i64 368, !24, i64 372, !24, i64 376, !24, i64 380, !24, i64 384, !5, i64 388, !5, i64 396, !5, i64 404, !5, i64 416, !5, i64 424, !5, i64 436, !24, i64 448, !5, i64 452, !5, i64 460, !5, i64 472, !24, i64 480, !5, i64 484, !5, i64 492, !5, i64 504, !5, i64 512, !24, i64 524, !5, i64 528, !11, i64 536, !24, i64 544, !24, i64 548, !24, i64 552, !24, i64 556, !24, i64 560, !24, i64 564, !24, i64 568, !24, i64 572, !24, i64 576, !24, i64 580, !24, i64 584, !24, i64 588, !24, i64 592, !24, i64 596, !24, i64 600, !11, i64 608, !24, i64 616, !24, i64 620, !24, i64 624, !24, i64 628}
!81 = !{!80, !24, i64 356}
!82 = !{!80, !24, i64 588}
