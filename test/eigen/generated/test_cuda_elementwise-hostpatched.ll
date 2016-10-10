; ModuleID = 'test/eigen/generated/test_cuda_elementwise-hostraw.ll'
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
%"class.Eigen::TensorAssignOp.15" = type { %"class.Eigen::TensorMap"*, %"class.Eigen::TensorCwiseBinaryOp"* }
%"class.Eigen::TensorMap" = type { float*, %"struct.Eigen::DSizes" }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [3 x i64] }
%"class.Eigen::TensorCwiseBinaryOp" = type <{ %"class.Eigen::TensorMap"*, %"class.Eigen::TensorCwiseBinaryOp.7", %"struct.Eigen::internal::scalar_sum_op", [7 x i8] }>
%"class.Eigen::TensorCwiseBinaryOp.7" = type <{ %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"*, %"struct.Eigen::internal::scalar_product_op", [7 x i8] }>
%"struct.Eigen::internal::scalar_product_op" = type { i8 }
%"struct.Eigen::internal::scalar_sum_op" = type { i8 }
%struct.timespec = type { i64, i64 }
%"class.Eigen::TensorAssignOp" = type { %"class.Eigen::Tensor"*, %"class.Eigen::TensorCwiseNullaryOp"* }
%"class.Eigen::Tensor" = type { %"class.Eigen::TensorStorage" }
%"class.Eigen::TensorStorage" = type { float*, %"struct.Eigen::DSizes" }
%"class.Eigen::TensorCwiseNullaryOp" = type { %"class.Eigen::Tensor"*, %"class.Eigen::internal::UniformRandomGenerator" }
%"class.Eigen::internal::UniformRandomGenerator" = type { i64 }
%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.12", %"struct.Eigen::TensorEvaluator.13" }
%"struct.Eigen::TensorEvaluator.12" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::DefaultDevice"* }
%"struct.Eigen::DefaultDevice" = type { i8 }
%"struct.Eigen::TensorEvaluator.13" = type <{ %"class.Eigen::internal::UniformRandomGenerator", %"struct.Eigen::TensorEvaluator.14", %"struct.Eigen::internal::nullary_wrapper", [7 x i8] }>
%"struct.Eigen::TensorEvaluator.14" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::DefaultDevice"* }
%"struct.Eigen::internal::nullary_wrapper" = type { i8 }
%"class.Eigen::CudaStreamDevice" = type { %"class.Eigen::StreamInterface", %struct.CUstream_st**, i32, i8*, i32* }
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"struct.Eigen::TensorEvaluator.17" = type { %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.19" }
%"struct.Eigen::TensorEvaluator.18" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.19" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.21" }
%"struct.Eigen::TensorEvaluator.20" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.21" = type { %"struct.Eigen::internal::scalar_product_op", %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20" }
%"struct.Eigen::TensorEvaluator.17_nopointers" = type { %"struct.Eigen::TensorEvaluator.18_nopointers", %"struct.Eigen::TensorEvaluator.19_nopointers" }
%"struct.Eigen::TensorEvaluator.18_nopointers" = type { %"struct.Eigen::DSizes_nopointers" }
%"struct.Eigen::DSizes_nopointers" = type { %"class.Eigen::array_nopointers" }
%"class.Eigen::array_nopointers" = type { [3 x i64] }
%"struct.Eigen::TensorEvaluator.19_nopointers" = type { %"struct.Eigen::internal::scalar_sum_op_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.21_nopointers" }
%"struct.Eigen::internal::scalar_sum_op_nopointers" = type { i8 }
%"struct.Eigen::TensorEvaluator.20_nopointers" = type { %"struct.Eigen::DSizes_nopointers" }
%"struct.Eigen::TensorEvaluator.21_nopointers" = type { %"struct.Eigen::internal::scalar_product_op_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers" }
%"struct.Eigen::internal::scalar_product_op_nopointers" = type { i8 }

$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev = comdat any

$_Z22set_repeat_from_stringPKc = comdat any

$_Z20set_seed_from_stringPKc = comdat any

$_ZN5Eigen16CudaStreamDeviceC2Ev = comdat any

$_Z11verify_implbPKcS0_iS0_ = comdat any

$_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_ = comdat any

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

$_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_6DSizesIlLi3EEE = comdat any

$_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi3ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_ = comdat any

$_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_KNS7_INS0_17scalar_product_opIffEESA_SA_EEEEEENS_9GpuDeviceELb0EE3runERSI_RKSJ_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

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
@.str.23 = private unnamed_addr constant [17 x i8] c"cuda_elementwise\00", align 1
@.str.24 = private unnamed_addr constant [106 x i8] c"cudaMemcpyAsync(out.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess\00", align 1
@.str.25 = private unnamed_addr constant [36 x i8] c"test/eigen/test_cuda_elementwise.cu\00", align 1
@__PRETTY_FUNCTION__._Z21test_cuda_elementwisev = private unnamed_addr constant [29 x i8] c"void test_cuda_elementwise()\00", align 1
@.str.26 = private unnamed_addr constant [58 x i8] c"cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess\00", align 1
@.str.27 = private unnamed_addr constant [209 x i8] c"verifyIsApprox(out(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)), in1(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) + in2(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) * in3(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)))\00", align 1
@.str.28 = private unnamed_addr constant [22 x i8] c"Invalid repeat value \00", align 1
@.str.29 = private unnamed_addr constant [20 x i8] c"Invalid seed value \00", align 1
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
@.str.30 = private unnamed_addr constant [43 x i8] c"Failed to get the number of CUDA devices: \00", align 1
@.str.31 = private unnamed_addr constant [22 x i8] c"status == cudaSuccess\00", align 1
@.str.32 = private unnamed_addr constant [71 x i8] c"/usr/local/eigen/unsupported/Eigen/CXX11/src/Tensor/TensorDeviceCuda.h\00", align 1
@__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv = private unnamed_addr constant [35 x i8] c"void Eigen::initializeDeviceProp()\00", align 1
@_ZN5EigenL18m_devicePropertiesE = internal unnamed_addr global %struct.cudaDeviceProp* null, align 8
@.str.33 = private unnamed_addr constant [35 x i8] c"Failed to initialize CUDA device #\00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.35 = private unnamed_addr constant [19 x i8] c"err == cudaSuccess\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm = private unnamed_addr constant [62 x i8] c"virtual void *Eigen::CudaStreamDevice::allocate(size_t) const\00", align 1
@.str.36 = private unnamed_addr constant [15 x i8] c"result != NULL\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv = private unnamed_addr constant [63 x i8] c"virtual void Eigen::CudaStreamDevice::deallocate(void *) const\00", align 1
@.str.37 = private unnamed_addr constant [15 x i8] c"buffer != NULL\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice9semaphoreEv = private unnamed_addr constant [65 x i8] c"virtual unsigned int *Eigen::CudaStreamDevice::semaphore() const\00", align 1
@.str.39 = private unnamed_addr constant [6 x i8] c"Test \00", align 1
@.str.40 = private unnamed_addr constant [12 x i8] c" failed in \00", align 1
@.str.41 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.42 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.43 = private unnamed_addr constant [8 x i8] c"Stack:\0A\00", align 1
@.str.44 = private unnamed_addr constant [5 x i8] c"  - \00", align 1
@.str.45 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [10 x i8*]
@_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [16 x i8*]
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external unnamed_addr constant [16 x i8*]
@_ZTISt9bad_alloc = external constant i8*
@_ZTVSt9bad_alloc = external unnamed_addr constant [5 x i8*], align 8
@.str.48 = private unnamed_addr constant [34 x i8] c"cudaGetLastError() == cudaSuccess\00", align 1
@.str.49 = private unnamed_addr constant [69 x i8] c"/usr/local/eigen/unsupported/Eigen/CXX11/src/Tensor/TensorExecutor.h\00", align 1
@__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_KNS7_INS0_17scalar_product_opIffEESA_SA_EEEEEENS_9GpuDeviceELb0EE3runERSI_RKSJ_ = private unnamed_addr constant [1051 x i8] c"static void Eigen::internal::TensorExecutor<const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0>, const Eigen::TensorCwiseBinaryOp<Eigen::internal::scalar_sum_op<float, float>, const Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0>, const Eigen::TensorCwiseBinaryOp<Eigen::internal::scalar_product_op<float, float>, const Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0>, const Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0> > > >, Eigen::GpuDevice, false>::run(const Expression &, const Eigen::GpuDevice &) [Expression = const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0>, const Eigen::TensorCwiseBinaryOp<Eigen::internal::scalar_sum_op<float, float>, const Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0>, const Eigen::TensorCwiseBinaryOp<Eigen::internal::scalar_product_op<float, float>, const Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0>, const Eigen::TensorMap<Eigen::Tensor<float, 3, 0, long>, 0> > > >, Device = Eigen::GpuDevice, Vectorizable = false]\00", align 1
@.str.50 = private unnamed_addr constant [36 x i8] c"Difference too large wrt tolerance \00", align 1
@.str.51 = private unnamed_addr constant [22 x i8] c", relative error is: \00", align 1
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_test_cuda_elementwise.cu, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_dtor to void ()*), i8* null }]
@__opencl_sourcecode = global [6264 x i8] c"struct class_Eigen__array_nopointers {\0A    long f0[3];\0A};\0A\0Astruct Eigen__DSizes_nopointers {\0A    struct class_Eigen__array_nopointers f0;\0A};\0A\0Astruct Eigen__TensorEvaluator_0_nopointers {\0A        struct Eigen__DSizes_nopointers f1;\0A    };\0A\0Astruct Eigen__internal__scalar_sum_op_nopointers {\0A    char f0;\0A};\0A\0Astruct Eigen__TensorEvaluator_2_nopointers {\0A        struct Eigen__DSizes_nopointers f1;\0A    };\0A\0Astruct Eigen__internal__scalar_product_op_nopointers {\0A    char f0;\0A};\0A\0Astruct Eigen__TensorEvaluator_3_nopointers {\0A    struct Eigen__internal__scalar_product_op_nopointers f0;\0A    struct Eigen__TensorEvaluator_2_nopointers f1;\0A    struct Eigen__TensorEvaluator_2_nopointers f2;\0A};\0A\0Astruct Eigen__TensorEvaluator_1_nopointers {\0A    struct Eigen__internal__scalar_sum_op_nopointers f0;\0A    struct Eigen__TensorEvaluator_2_nopointers f1;\0A    struct Eigen__TensorEvaluator_3_nopointers f2;\0A};\0A\0Astruct Eigen__TensorEvaluator_nopointers {\0A    struct Eigen__TensorEvaluator_0_nopointers f0;\0A    struct Eigen__TensorEvaluator_1_nopointers f1;\0A};\0A\0Astruct class_Eigen__array {\0A    long f0[3];\0A};\0A\0Astruct Eigen__DSizes {\0A    struct class_Eigen__array f0;\0A};\0A\0Astruct class_Eigen__StreamInterface {\0A};\0A\0Astruct Eigen__GpuDevice {\0A    global struct class_Eigen__StreamInterface* f0;\0A    int f1;\0A    char f2[4];\0A};\0A\0Astruct Eigen__TensorEvaluator_0 {\0A    global float* f0;\0A    struct Eigen__DSizes f1;\0A    global struct Eigen__GpuDevice* f2;\0A};\0A\0Astruct Eigen__internal__scalar_sum_op {\0A    char f0;\0A};\0A\0Astruct Eigen__TensorEvaluator_2 {\0A    global float* f0;\0A    struct Eigen__DSizes f1;\0A    global struct Eigen__GpuDevice* f2;\0A};\0A\0Astruct Eigen__internal__scalar_product_op {\0A    char f0;\0A};\0A\0Astruct Eigen__TensorEvaluator_3 {\0A    struct Eigen__internal__scalar_product_op f0;\0A    struct Eigen__TensorEvaluator_2 f1;\0A    struct Eigen__TensorEvaluator_2 f2;\0A};\0A\0Astruct Eigen__TensorEvaluator_1 {\0A    struct Eigen__internal__scalar_sum_op f0;\0A    struct Eigen__TensorEvaluator_2 f1;\0A    struct Eigen__TensorEvaluator_3 f2;\0A};\0A\0Astruct Eigen__TensorEvaluator {\0A    struct Eigen__TensorEvaluator_0 f0;\0A    struct Eigen__TensorEvaluator_1 f1;\0A};\0A\0A\0A\0A\0Akernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_nopointers* eval_nopointers, global float* eval_ptr0, global float* eval_ptr1, global float* eval_ptr2, global float* eval_ptr3, long size) {\0A    long i_01_i;\0Astruct Eigen__TensorEvaluator eval[1];\0Aeval[0].f0.f1.f0.f0[0] = eval_nopointers[0].f0.f1.f0.f0[0];\0Aeval[0].f0.f1.f0.f0[1] = eval_nopointers[0].f0.f1.f0.f0[1];\0Aeval[0].f0.f1.f0.f0[2] = eval_nopointers[0].f0.f1.f0.f0[2];\0Aeval[0].f1.f0.f0 = eval_nopointers[0].f1.f0.f0;\0Aeval[0].f1.f1.f1.f0.f0[0] = eval_nopointers[0].f1.f1.f1.f0.f0[0];\0Aeval[0].f1.f1.f1.f0.f0[1] = eval_nopointers[0].f1.f1.f1.f0.f0[1];\0Aeval[0].f1.f1.f1.f0.f0[2] = eval_nopointers[0].f1.f1.f1.f0.f0[2];\0Aeval[0].f1.f2.f0.f0 = eval_nopointers[0].f1.f2.f0.f0;\0Aeval[0].f1.f2.f1.f1.f0.f0[0] = eval_nopointers[0].f1.f2.f1.f1.f0.f0[0];\0Aeval[0].f1.f2.f1.f1.f0.f0[1] = eval_nopointers[0].f1.f2.f1.f1.f0.f0[1];\0Aeval[0].f1.f2.f1.f1.f0.f0[2] = eval_nopointers[0].f1.f2.f1.f1.f0.f0[2];\0Aeval[0].f1.f2.f2.f1.f0.f0[0] = eval_nopointers[0].f1.f2.f2.f1.f0.f0[0];\0Aeval[0].f1.f2.f2.f1.f0.f0[1] = eval_nopointers[0].f1.f2.f2.f1.f0.f0[1];\0Aeval[0].f1.f2.f2.f1.f0.f0[2] = eval_nopointers[0].f1.f2.f2.f1.f0.f0[2];\0Aeval[0].f0.f0 = eval_ptr0;\0Aeval[0].f1.f1.f0 = eval_ptr1;\0Aeval[0].f1.f2.f1.f0 = eval_ptr2;\0Aeval[0].f1.f2.f2.f0 = eval_ptr3;\0A\0A    label0:;\0A    int v1 = get_group_id(0);\0A    int v2 = get_local_size(0);\0A    int v3 = v2 * v1;\0A    int v4 = get_global_id(0);\0A    int v5 = v3 + v4;\0A    long v6 = v5;\0A    int v7 = get_num_groups(0);\0A    int v8 = v7 * v2;\0A    long v9 = v8;\0A    bool v10 = v6 < size;\0A    if(v10) {\0A        goto v_lr_ph_i;\0A    } else {\0A        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;\0A    }\0A    v_lr_ph_i:;\0A    global float** v12 = (&eval[0].f1.f1.f0);\0A    global float* v13 = v12[0];\0A    global float** v14 = (&eval[0].f1.f2.f1.f0);\0A    global float* v15 = v14[0];\0A    global float** v16 = (&eval[0].f1.f2.f2.f0);\0A    global float* v17 = v16[0];\0A    global float** v18 = (&eval[0].f0.f0);\0A    global float* v19 = v18[0];\0A        i_01_i = v6;\0A    goto v21;\0A    v21:;\0A    global float* v22 = (&v13[i_01_i]);\0A    float v_val_i_i_i_i = v22[0];\0A    global float* v23 = (&v15[i_01_i]);\0A    float v_val_i_i_i_i_i = v23[0];\0A    global float* v24 = (&v17[i_01_i]);\0A    float v_val_i1_i_i_i_i = v24[0];\0A    float v25 = v_val_i_i_i_i_i * v_val_i1_i_i_i_i;\0A    float v26 = v_val_i_i_i_i + v25;\0A    global float* v27 = (&v19[i_01_i]);\0A    v27[0] = v26;\0A    long v29 = i_01_i + v9;\0A    bool v30 = v29 < size;\0A    if(v30) {\0A        i_01_i = v29;\0A        goto v21;\0A    } else {\0A        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit;\0A    }\0A    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit:;\0A        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;\0A    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit:;\0A}\0A\00"
@s._ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_ = global [247 x i8] c"_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_\00"

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

.lr.ph.i.i.i:                                     ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i, %.lr.ph.i.i.i.preheader
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

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev.exit: ; preds = %16, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit
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
  %__dnew.i.i.i.i = alloca i64, align 8
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

.lr.ph:                                           ; preds = %100, %.lr.ph.preheader
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
  %.lcssa94 = phi i8** [ %5, %8 ]
  %10 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i64 9)
  %11 = load i8*, i8** %.lcssa94, align 8, !tbaa !16
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %24, %13
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

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %44, %41
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21: ; preds = %70, %59
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

_ZNKSt5ctypeIcE5widenEc.exit43:                   ; preds = %90, %87
  %.0.i42 = phi i8 [ %89, %87 ], [ %95, %90 ]
  %96 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i42)
  %97 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %96)
  br label %.thread

; <label>:98                                      ; preds = %54
  %99 = getelementptr inbounds i8, i8* %6, i64 1
  tail call void @_Z20set_seed_from_stringPKc(i8* %99)
  br label %100

; <label>:100                                     ; preds = %98, %52, %.lr.ph
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

_ZNKSt5ctypeIcE5widenEc.exit45:                   ; preds = %122, %119
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

_ZNKSt5ctypeIcE5widenEc.exit47:                   ; preds = %151, %148
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

_ZNKSt5ctypeIcE5widenEc.exit49:                   ; preds = %176, %173
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

_ZNKSt5ctypeIcE5widenEc.exit51:                   ; preds = %200, %197
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

_ZNKSt5ctypeIcE5widenEc.exit53:                   ; preds = %225, %222
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

_ZNKSt5ctypeIcE5widenEc.exit55:                   ; preds = %250, %247
  %.0.i54 = phi i8 [ %249, %247 ], [ %255, %250 ]
  %256 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i54)
  %257 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %256)
  br label %.thread

._crit_edge.thread:                               ; preds = %._crit_edge, %0
  %258 = tail call i8* @getenv(i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.17, i64 0, i64 0)) #2
  %.b1015 = load i1, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  %.not = xor i1 %.b1015, true
  %259 = icmp ne i8* %258, null
  %or.cond = and i1 %259, %.not
  br i1 %or.cond, label %260, label %261

; <label>:260                                     ; preds = %._crit_edge.thread
  tail call void @_Z22set_repeat_from_stringPKc(i8* %258)
  br label %261

; <label>:261                                     ; preds = %260, %._crit_edge.thread
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

; <label>:266                                     ; preds = %265, %264
  %267 = tail call i64 @time(i64* null) #2
  %268 = trunc i64 %267 to i32
  store i32 %268, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  br label %269

; <label>:269                                     ; preds = %266, %265, %264
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

_ZNKSt5ctypeIcE5widenEc.exit57:                   ; preds = %294, %291
  %.0.i56 = phi i8 [ %293, %291 ], [ %299, %294 ]
  %300 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %275, i8 signext %.0.i56)
  %301 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %300)
  %302 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i8*
  call void @llvm.lifetime.start(i64 392, i8* %302) #2
  call void @_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::__cxx11::basic_stringstream"* nonnull %ss, i32 24)
  %303 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 1
  %304 = bitcast %"class.std::basic_ostream.base"* %303 to %"class.std::basic_ostream"*
  %305 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %304, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i64 0, i64 0), i64 6)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22 unwind label %429

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22: ; preds = %_ZNKSt5ctypeIcE5widenEc.exit57
  %306 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  %307 = zext i32 %306 to i64
  %308 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* %304, i64 %307)
          to label %_ZNSolsEj.exit unwind label %429

_ZNSolsEj.exit:                                   ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22
  %309 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1
  invoke void @_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::__cxx11::basic_string"* nonnull sret %1, %"class.std::__cxx11::basic_stringbuf"* %309)
          to label %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit unwind label %429

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

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread: ; preds = %323, %321
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
          to label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit unwind label %433

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit: ; preds = %334
  %.phi.trans.insert = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %.pre81 = load i8*, i8** %.phi.trans.insert, align 8, !tbaa !8
  %.pre84 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %.pre86 = bitcast %union.anon* %.pre84 to i8*
  %335 = icmp eq i8* %.pre81, %.pre86
  br i1 %335, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %336

; <label>:336                                     ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit
  call void @_ZdlPv(i8* %.pre81) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %336, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread
  %337 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  call void @srand(i32 %337) #2
  %338 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.21, i64 0, i64 0), i64 20)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24 unwind label %429

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  %339 = load i32, i32* @_ZN5EigenL8g_repeatE, align 4, !tbaa !31
  %340 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i32 %339)
          to label %341 unwind label %429

; <label>:341                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24
  %342 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %340, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0), i64 6)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26 unwind label %429

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
          to label %.noexc72 unwind label %429

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
          to label %.noexc61 unwind label %429

.noexc61:                                         ; preds = %361
  %362 = bitcast %"class.std::ctype"* %352 to i8 (%"class.std::ctype"*, i8)***
  %363 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %362, align 8, !tbaa !17
  %364 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %363, i64 6
  %365 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %364, align 8
  %366 = invoke signext i8 %365(%"class.std::ctype"* nonnull %352, i8 signext 10)
          to label %.noexc28 unwind label %429

.noexc28:                                         ; preds = %.noexc61, %358
  %.0.i60 = phi i8 [ %360, %358 ], [ %366, %.noexc61 ]
  %367 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %340, i8 signext %.0.i60)
          to label %.noexc29 unwind label %429

.noexc29:                                         ; preds = %.noexc28
  %368 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %367)
          to label %_ZNSolsEPFRSoS_E.exit unwind label %429

_ZNSolsEPFRSoS_E.exit:                            ; preds = %.noexc29
  %369 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 2
  %370 = bitcast %"class.std::__cxx11::basic_string"* %2 to %union.anon**
  store %union.anon* %369, %union.anon** %370, align 8, !tbaa !12
  %371 = bitcast %union.anon* %369 to i8*
  %372 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %372) #2
  store i64 16, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %373 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %2, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
          to label %.noexc32 unwind label %443

.noexc32:                                         ; preds = %_ZNSolsEPFRSoS_E.exit
  %374 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 0, i32 0
  store i8* %373, i8** %374, align 8, !tbaa !8
  %375 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %376 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 2, i32 0
  store i64 %375, i64* %376, align 8, !tbaa !15
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %373, i8* nonnull getelementptr inbounds ([17 x i8], [17 x i8]* @.str.23, i64 0, i64 0), i64 16, i32 1, i1 false) #2
  %377 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 1
  store i64 %375, i64* %377, align 8, !tbaa !13
  %378 = load i8*, i8** %374, align 8, !tbaa !8
  %379 = getelementptr inbounds i8, i8* %378, i64 %375
  store i8 0, i8* %379, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %372) #2
  %380 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  %381 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !32
  %382 = icmp eq %"class.std::__cxx11::basic_string"* %380, %381
  br i1 %382, label %398, label %383

; <label>:383                                     ; preds = %.noexc32
  %384 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 2
  %385 = bitcast %"class.std::__cxx11::basic_string"* %380 to %union.anon**
  store %union.anon* %384, %union.anon** %385, align 8, !tbaa !12
  %386 = load i8*, i8** %374, align 8, !tbaa !8
  %387 = icmp eq i8* %386, %371
  br i1 %387, label %388, label %390

; <label>:388                                     ; preds = %383
  %389 = bitcast %union.anon* %384 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %389, i8* nonnull %371, i64 16, i32 1, i1 false) #2
  %.pre82 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread

; <label>:390                                     ; preds = %383
  %391 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 0, i32 0
  store i8* %386, i8** %391, align 8, !tbaa !8
  %392 = load i64, i64* %376, align 8, !tbaa !15
  %393 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 2, i32 0
  store i64 %392, i64* %393, align 8, !tbaa !15
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread: ; preds = %390, %388
  %394 = phi %"class.std::__cxx11::basic_string"* [ %380, %390 ], [ %.pre82, %388 ]
  %395 = load i64, i64* %377, align 8, !tbaa !13
  %396 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 1
  store i64 %395, i64* %396, align 8, !tbaa !13
  store %union.anon* %369, %union.anon** %370, align 8, !tbaa !8
  store i64 0, i64* %377, align 8, !tbaa !13
  store i8 0, i8* %371, align 8, !tbaa !14
  %397 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %394, i64 1
  store %"class.std::__cxx11::basic_string"* %397, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36

; <label>:398                                     ; preds = %.noexc32
  invoke void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_(%"class.std::vector"* nonnull @_ZN5EigenL12g_test_stackB5cxx11E, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %2)
          to label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35 unwind label %447

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35: ; preds = %398
  %.pre83 = load i8*, i8** %374, align 8, !tbaa !8
  %399 = icmp eq i8* %.pre83, %371
  br i1 %399, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36, label %400

; <label>:400                                     ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35
  call void @_ZdlPv(i8* %.pre83) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36: ; preds = %400, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread
  invoke void @_Z21test_cuda_elementwisev()
          to label %401 unwind label %429

; <label>:401                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36
  %402 = load i64, i64* bitcast ([10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE to i64*), align 8
  %403 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i64*
  store i64 %402, i64* %403, align 8, !tbaa !17
  %404 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 8) to i64*), align 8
  %.cast.i.i = inttoptr i64 %402 to i8*
  %405 = getelementptr i8, i8* %.cast.i.i, i64 -24
  %406 = bitcast i8* %405 to i64*
  %407 = load i64, i64* %406, align 8
  %408 = getelementptr inbounds i8, i8* %302, i64 %407
  %409 = bitcast i8* %408 to i64*
  store i64 %404, i64* %409, align 8, !tbaa !17
  %410 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 9) to i64*), align 8
  %411 = bitcast %"class.std::basic_ostream.base"* %303 to i64*
  store i64 %410, i64* %411, align 8, !tbaa !17
  %412 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %412, align 8, !tbaa !17
  %413 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 0, i32 0
  %414 = load i8*, i8** %413, align 8, !tbaa !8
  %415 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 2
  %416 = bitcast %union.anon* %415 to i8*
  %417 = icmp eq i8* %414, %416
  br i1 %417, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, label %418

; <label>:418                                     ; preds = %401
  call void @_ZdlPv(i8* %414) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit: ; preds = %418, %401
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %412, align 8, !tbaa !17
  %419 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* %419) #2
  %420 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i64*), align 8
  store i64 %420, i64* %403, align 8, !tbaa !17
  %421 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 3) to i64*), align 8
  %.cast.i.i.i.i = inttoptr i64 %420 to i8*
  %422 = getelementptr i8, i8* %.cast.i.i.i.i, i64 -24
  %423 = bitcast i8* %422 to i64*
  %424 = load i64, i64* %423, align 8
  %425 = getelementptr inbounds i8, i8* %302, i64 %424
  %426 = bitcast i8* %425 to i64*
  store i64 %421, i64* %426, align 8, !tbaa !17
  %427 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 0, i32 1
  store i64 0, i64* %427, align 8, !tbaa !33
  %428 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* %428) #2
  call void @llvm.lifetime.end(i64 392, i8* nonnull %302) #2
  br label %.thread

; <label>:429                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36, %.noexc29, %.noexc28, %.noexc61, %361, %354, %341, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %_ZNSolsEj.exit, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22, %_ZNKSt5ctypeIcE5widenEc.exit57
  %430 = landingpad { i8*, i32 }
          cleanup
  %431 = extractvalue { i8*, i32 } %430, 0
  %432 = extractvalue { i8*, i32 } %430, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:433                                     ; preds = %334
  %434 = landingpad { i8*, i32 }
          cleanup
  %435 = extractvalue { i8*, i32 } %434, 0
  %436 = extractvalue { i8*, i32 } %434, 1
  %437 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %438 = load i8*, i8** %437, align 8, !tbaa !8
  %439 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %440 = bitcast %union.anon* %439 to i8*
  %441 = icmp eq i8* %438, %440
  br i1 %441, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, label %442

; <label>:442                                     ; preds = %433
  call void @_ZdlPv(i8* %438) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:443                                     ; preds = %_ZNSolsEPFRSoS_E.exit
  %444 = landingpad { i8*, i32 }
          cleanup
  %445 = extractvalue { i8*, i32 } %444, 0
  %446 = extractvalue { i8*, i32 } %444, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:447                                     ; preds = %398
  %448 = landingpad { i8*, i32 }
          cleanup
  %449 = extractvalue { i8*, i32 } %448, 0
  %450 = extractvalue { i8*, i32 } %448, 1
  %451 = load i8*, i8** %374, align 8, !tbaa !8
  %452 = icmp eq i8* %451, %371
  br i1 %452, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, label %453

; <label>:453                                     ; preds = %447
  call void @_ZdlPv(i8* %451) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37: ; preds = %453, %447, %443, %442, %433, %429
  %.16 = phi i8* [ %431, %429 ], [ %435, %433 ], [ %435, %442 ], [ %445, %443 ], [ %449, %447 ], [ %449, %453 ]
  %.1 = phi i32 [ %432, %429 ], [ %436, %433 ], [ %436, %442 ], [ %446, %443 ], [ %450, %447 ], [ %450, %453 ]
  %454 = load i64, i64* bitcast ([10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE to i64*), align 8
  %455 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i64*
  store i64 %454, i64* %455, align 8, !tbaa !17
  %456 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 8) to i64*), align 8
  %.cast.i.i39 = inttoptr i64 %454 to i8*
  %457 = getelementptr i8, i8* %.cast.i.i39, i64 -24
  %458 = bitcast i8* %457 to i64*
  %459 = load i64, i64* %458, align 8
  %460 = getelementptr inbounds i8, i8* %302, i64 %459
  %461 = bitcast i8* %460 to i64*
  store i64 %456, i64* %461, align 8, !tbaa !17
  %462 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 9) to i64*), align 8
  %463 = bitcast %"class.std::basic_ostream.base"* %303 to i64*
  store i64 %462, i64* %463, align 8, !tbaa !17
  %464 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %464, align 8, !tbaa !17
  %465 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 0, i32 0
  %466 = load i8*, i8** %465, align 8, !tbaa !8
  %467 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 2
  %468 = bitcast %union.anon* %467 to i8*
  %469 = icmp eq i8* %466, %468
  br i1 %469, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41, label %470

; <label>:470                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37
  call void @_ZdlPv(i8* %466) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41: ; preds = %470, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %464, align 8, !tbaa !17
  %471 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* %471) #2
  %472 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i64*), align 8
  store i64 %472, i64* %455, align 8, !tbaa !17
  %473 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 3) to i64*), align 8
  %.cast.i.i.i.i40 = inttoptr i64 %472 to i8*
  %474 = getelementptr i8, i8* %.cast.i.i.i.i40, i64 -24
  %475 = bitcast i8* %474 to i64*
  %476 = load i64, i64* %475, align 8
  %477 = getelementptr inbounds i8, i8* %302, i64 %476
  %478 = bitcast i8* %477 to i64*
  store i64 %473, i64* %478, align 8, !tbaa !17
  %479 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 0, i32 1
  store i64 0, i64* %479, align 8, !tbaa !33
  %480 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* %480) #2
  %481 = insertvalue { i8*, i32 } undef, i8* %.16, 0
  %482 = insertvalue { i8*, i32 } %481, i32 %.1, 1
  resume { i8*, i32 } %482

.thread:                                          ; preds = %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, %_ZNKSt5ctypeIcE5widenEc.exit55, %_ZNKSt5ctypeIcE5widenEc.exit43, %_ZNKSt5ctypeIcE5widenEc.exit
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
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.28, i64 0, i64 0), i64 21)
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %21, %10
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

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %40, %37
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
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.29, i64 0, i64 0), i64 19)
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %21, %10
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

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %40, %37
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
define void @_Z21test_cuda_elementwisev() #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i:
  %assign.i = alloca %"class.Eigen::TensorAssignOp.15", align 8
  %ts.i.i.i.i.i30 = alloca %struct.timespec, align 8
  %assign.i.i31 = alloca %"class.Eigen::TensorAssignOp", align 8
  %0 = alloca %"struct.Eigen::TensorEvaluator", align 8
  %1 = alloca %"struct.Eigen::DefaultDevice", align 1
  %2 = alloca %"struct.Eigen::DefaultDevice", align 1
  %3 = alloca %"class.Eigen::TensorCwiseNullaryOp", align 8
  %ts.i.i.i.i.i26 = alloca %struct.timespec, align 8
  %assign.i.i27 = alloca %"class.Eigen::TensorAssignOp", align 8
  %4 = alloca %"struct.Eigen::TensorEvaluator", align 8
  %5 = alloca %"struct.Eigen::DefaultDevice", align 1
  %6 = alloca %"struct.Eigen::DefaultDevice", align 1
  %7 = alloca %"class.Eigen::TensorCwiseNullaryOp", align 8
  %ts.i.i.i.i.i = alloca %struct.timespec, align 8
  %assign.i.i = alloca %"class.Eigen::TensorAssignOp", align 8
  %8 = alloca %"struct.Eigen::TensorEvaluator", align 8
  %9 = alloca %"struct.Eigen::DefaultDevice", align 1
  %10 = alloca %"struct.Eigen::DefaultDevice", align 1
  %11 = alloca %"class.Eigen::TensorCwiseNullaryOp", align 8
  %in1 = alloca %"class.Eigen::Tensor", align 8
  %in2 = alloca %"class.Eigen::Tensor", align 8
  %in3 = alloca %"class.Eigen::Tensor", align 8
  %d_in1 = alloca float*, align 8
  %d_in2 = alloca float*, align 8
  %d_in3 = alloca float*, align 8
  %d_out = alloca float*, align 8
  %stream = alloca %"class.Eigen::CudaStreamDevice", align 8
  %gpu_device = alloca %"struct.Eigen::GpuDevice", align 8
  %gpu_in1 = alloca %"class.Eigen::TensorMap", align 8
  %gpu_in2 = alloca %"class.Eigen::TensorMap", align 8
  %gpu_in3 = alloca %"class.Eigen::TensorMap", align 8
  %gpu_out = alloca %"class.Eigen::TensorMap", align 8
  %12 = alloca %"class.Eigen::TensorCwiseBinaryOp", align 8
  %13 = alloca float, align 4
  %14 = bitcast %"class.Eigen::Tensor"* %in1 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %14) #2
  %15 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 0
  %16 = tail call noalias i8* @malloc(i64 1480608) #2
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i6

; <label>:18                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i6: ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  %19 = bitcast %"class.Eigen::Tensor"* %in1 to i8**
  store i8* %16, i8** %19, align 8, !tbaa !35
  %20 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %21 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %22 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> <i64 72, i64 53>, <2 x i64>* %22, align 8
  %23 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 1, i32 0, i32 0, i64 2
  store i64 97, i64* %23, align 8
  %24 = bitcast %"class.Eigen::Tensor"* %in2 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %24) #2
  %25 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 0
  %26 = tail call noalias i8* @malloc(i64 1480608) #2
  %27 = icmp eq i8* %26, null
  br i1 %27, label %28, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i12

; <label>:28                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i6
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc9 unwind label %245

.noexc9:                                          ; preds = %28
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i12: ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i6
  %29 = bitcast %"class.Eigen::Tensor"* %in2 to i8**
  store i8* %26, i8** %29, align 8, !tbaa !35
  %30 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %31 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %32 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> <i64 72, i64 53>, <2 x i64>* %32, align 8
  %33 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 1, i32 0, i32 0, i64 2
  store i64 97, i64* %33, align 8
  %34 = bitcast %"class.Eigen::Tensor"* %in3 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %34) #2
  %35 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in3, i64 0, i32 0, i32 0
  %36 = tail call noalias i8* @malloc(i64 1480608) #2
  %37 = icmp eq i8* %36, null
  br i1 %37, label %38, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i19

; <label>:38                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i12
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc16 unwind label %249

.noexc16:                                         ; preds = %38
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i19: ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i12
  %39 = bitcast %"class.Eigen::Tensor"* %in3 to i8**
  store i8* %36, i8** %39, align 8, !tbaa !35
  %40 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in3, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %41 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in3, i64 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %42 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> <i64 72, i64 53>, <2 x i64>* %42, align 8
  %43 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in3, i64 0, i32 0, i32 1, i32 0, i32 0, i64 2
  store i64 97, i64* %43, align 8
  %44 = tail call noalias i8* @malloc(i64 1480608) #2
  %45 = icmp eq i8* %44, null
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i19
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc23 unwind label %253

.noexc23:                                         ; preds = %46
  unreachable

; <label>:47                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i19
  %48 = bitcast i8* %44 to float*
  %49 = bitcast %"class.Eigen::TensorCwiseNullaryOp"* %11 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %49)
  %50 = bitcast %struct.timespec* %ts.i.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %50) #2, !noalias !38
  %51 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i.i) #2, !noalias !38
  %52 = call i64 @random() #2, !noalias !38
  %53 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i.i, i64 0, i32 1
  %54 = load i64, i64* %53, align 8, !tbaa !41, !noalias !38
  %55 = xor i64 %54, %52
  call void @llvm.lifetime.end(i64 16, i8* %50) #2, !noalias !38
  %56 = mul i64 %55, 6364136223846793005
  %57 = add i64 %56, -2720673578348880933
  %58 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %11, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in1, %"class.Eigen::Tensor"** %58, align 8, !tbaa !14, !alias.scope !43
  %59 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %11, i64 0, i32 1, i32 0
  store i64 %57, i64* %59, align 8, !tbaa !46, !alias.scope !43
  %60 = bitcast %"struct.Eigen::TensorEvaluator"* %8 to i8*
  call void @llvm.lifetime.start(i64 96, i8* %60)
  %61 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %9, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %61)
  %62 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %10, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %62)
  %63 = bitcast %"class.Eigen::TensorAssignOp"* %assign.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %63) #2
  %64 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in1, %"class.Eigen::Tensor"** %64, align 8, !tbaa !14
  %65 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp"* %11, %"class.Eigen::TensorCwiseNullaryOp"** %65, align 8, !tbaa !14
  %66 = bitcast %"class.Eigen::Tensor"* %in1 to i64*
  %67 = load i64, i64* %66, align 8, !tbaa !35
  %68 = bitcast %"struct.Eigen::TensorEvaluator"* %8 to i64*
  store i64 %67, i64* %68, align 8, !tbaa !48
  %69 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %8, i64 0, i32 0, i32 1
  %70 = bitcast %"struct.Eigen::DSizes"* %69 to i8*
  %71 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 1
  %72 = bitcast %"struct.Eigen::DSizes"* %71 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %70, i8* %72, i64 24, i32 8, i1 false) #2
  %73 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %8, i64 0, i32 0, i32 2
  store %"struct.Eigen::DefaultDevice"* %9, %"struct.Eigen::DefaultDevice"** %73, align 8, !tbaa !14
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %8, i64 0, i32 1, i32 0, i32 0
  store i64 %57, i64* %74, align 8, !tbaa !46
  %75 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %8, i64 0, i32 1, i32 1
  %76 = bitcast %"struct.Eigen::TensorEvaluator.14"* %75 to i64*
  store i64 %67, i64* %76, align 8, !tbaa !50
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %8, i64 0, i32 1, i32 1, i32 1
  %78 = bitcast %"struct.Eigen::DSizes"* %77 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %78, i8* %72, i64 24, i32 8, i1 false) #2
  %79 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %8, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::DefaultDevice"* %9, %"struct.Eigen::DefaultDevice"** %79, align 8, !tbaa !14
  invoke void @_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_6DSizesIlLi3EEE(%"class.Eigen::Tensor"* nonnull %in1, %"struct.Eigen::DSizes"* nonnull dereferenceable(24) %77)
          to label %80 unwind label %257

; <label>:80                                      ; preds = %47
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi3ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %assign.i.i, %"struct.Eigen::DefaultDevice"* nonnull dereferenceable(1) %10)
  call void @llvm.lifetime.end(i64 16, i8* %63) #2
  call void @llvm.lifetime.end(i64 96, i8* %60)
  call void @llvm.lifetime.end(i64 1, i8* %61)
  call void @llvm.lifetime.end(i64 1, i8* %62)
  call void @llvm.lifetime.end(i64 16, i8* %49)
  %81 = bitcast %"class.Eigen::TensorCwiseNullaryOp"* %7 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %81)
  %82 = bitcast %struct.timespec* %ts.i.i.i.i.i26 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %82) #2, !noalias !52
  %83 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i.i26) #2, !noalias !52
  %84 = call i64 @random() #2, !noalias !52
  %85 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i.i26, i64 0, i32 1
  %86 = load i64, i64* %85, align 8, !tbaa !41, !noalias !52
  %87 = xor i64 %86, %84
  call void @llvm.lifetime.end(i64 16, i8* %82) #2, !noalias !52
  %88 = mul i64 %87, 6364136223846793005
  %89 = add i64 %88, -2720673578348880933
  %90 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %7, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in2, %"class.Eigen::Tensor"** %90, align 8, !tbaa !14, !alias.scope !55
  %91 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %7, i64 0, i32 1, i32 0
  store i64 %89, i64* %91, align 8, !tbaa !46, !alias.scope !55
  %92 = bitcast %"struct.Eigen::TensorEvaluator"* %4 to i8*
  call void @llvm.lifetime.start(i64 96, i8* %92)
  %93 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %5, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %93)
  %94 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %6, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %94)
  %95 = bitcast %"class.Eigen::TensorAssignOp"* %assign.i.i27 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %95) #2
  %96 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i27, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in2, %"class.Eigen::Tensor"** %96, align 8, !tbaa !14
  %97 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i27, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp"* %7, %"class.Eigen::TensorCwiseNullaryOp"** %97, align 8, !tbaa !14
  %98 = bitcast %"class.Eigen::Tensor"* %in2 to i64*
  %99 = load i64, i64* %98, align 8, !tbaa !35
  %100 = bitcast %"struct.Eigen::TensorEvaluator"* %4 to i64*
  store i64 %99, i64* %100, align 8, !tbaa !48
  %101 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i64 0, i32 0, i32 1
  %102 = bitcast %"struct.Eigen::DSizes"* %101 to i8*
  %103 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 1
  %104 = bitcast %"struct.Eigen::DSizes"* %103 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %102, i8* %104, i64 24, i32 8, i1 false) #2
  %105 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i64 0, i32 0, i32 2
  store %"struct.Eigen::DefaultDevice"* %5, %"struct.Eigen::DefaultDevice"** %105, align 8, !tbaa !14
  %106 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i64 0, i32 1, i32 0, i32 0
  store i64 %89, i64* %106, align 8, !tbaa !46
  %107 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i64 0, i32 1, i32 1
  %108 = bitcast %"struct.Eigen::TensorEvaluator.14"* %107 to i64*
  store i64 %99, i64* %108, align 8, !tbaa !50
  %109 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i64 0, i32 1, i32 1, i32 1
  %110 = bitcast %"struct.Eigen::DSizes"* %109 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %110, i8* %104, i64 24, i32 8, i1 false) #2
  %111 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::DefaultDevice"* %5, %"struct.Eigen::DefaultDevice"** %111, align 8, !tbaa !14
  invoke void @_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_6DSizesIlLi3EEE(%"class.Eigen::Tensor"* nonnull %in2, %"struct.Eigen::DSizes"* nonnull dereferenceable(24) %109)
          to label %112 unwind label %257

; <label>:112                                     ; preds = %80
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi3ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %assign.i.i27, %"struct.Eigen::DefaultDevice"* nonnull dereferenceable(1) %6)
  call void @llvm.lifetime.end(i64 16, i8* %95) #2
  call void @llvm.lifetime.end(i64 96, i8* %92)
  call void @llvm.lifetime.end(i64 1, i8* %93)
  call void @llvm.lifetime.end(i64 1, i8* %94)
  call void @llvm.lifetime.end(i64 16, i8* %81)
  %113 = bitcast %"class.Eigen::TensorCwiseNullaryOp"* %3 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %113)
  %114 = bitcast %struct.timespec* %ts.i.i.i.i.i30 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %114) #2, !noalias !58
  %115 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i.i30) #2, !noalias !58
  %116 = call i64 @random() #2, !noalias !58
  %117 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i.i30, i64 0, i32 1
  %118 = load i64, i64* %117, align 8, !tbaa !41, !noalias !58
  %119 = xor i64 %118, %116
  call void @llvm.lifetime.end(i64 16, i8* %114) #2, !noalias !58
  %120 = mul i64 %119, 6364136223846793005
  %121 = add i64 %120, -2720673578348880933
  %122 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %3, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in3, %"class.Eigen::Tensor"** %122, align 8, !tbaa !14, !alias.scope !61
  %123 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %3, i64 0, i32 1, i32 0
  store i64 %121, i64* %123, align 8, !tbaa !46, !alias.scope !61
  %124 = bitcast %"struct.Eigen::TensorEvaluator"* %0 to i8*
  call void @llvm.lifetime.start(i64 96, i8* %124)
  %125 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %1, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %125)
  %126 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %2, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %126)
  %127 = bitcast %"class.Eigen::TensorAssignOp"* %assign.i.i31 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %127) #2
  %128 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i31, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in3, %"class.Eigen::Tensor"** %128, align 8, !tbaa !14
  %129 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i31, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp"* %3, %"class.Eigen::TensorCwiseNullaryOp"** %129, align 8, !tbaa !14
  %130 = bitcast %"class.Eigen::Tensor"* %in3 to i64*
  %131 = load i64, i64* %130, align 8, !tbaa !35
  %132 = bitcast %"struct.Eigen::TensorEvaluator"* %0 to i64*
  store i64 %131, i64* %132, align 8, !tbaa !48
  %133 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 0, i32 1
  %134 = bitcast %"struct.Eigen::DSizes"* %133 to i8*
  %135 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in3, i64 0, i32 0, i32 1
  %136 = bitcast %"struct.Eigen::DSizes"* %135 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %134, i8* %136, i64 24, i32 8, i1 false) #2
  %137 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 0, i32 2
  store %"struct.Eigen::DefaultDevice"* %1, %"struct.Eigen::DefaultDevice"** %137, align 8, !tbaa !14
  %138 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 0, i32 0
  store i64 %121, i64* %138, align 8, !tbaa !46
  %139 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1
  %140 = bitcast %"struct.Eigen::TensorEvaluator.14"* %139 to i64*
  store i64 %131, i64* %140, align 8, !tbaa !50
  %141 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 1
  %142 = bitcast %"struct.Eigen::DSizes"* %141 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %142, i8* %136, i64 24, i32 8, i1 false) #2
  %143 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::DefaultDevice"* %1, %"struct.Eigen::DefaultDevice"** %143, align 8, !tbaa !14
  invoke void @_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_6DSizesIlLi3EEE(%"class.Eigen::Tensor"* nonnull %in3, %"struct.Eigen::DSizes"* nonnull dereferenceable(24) %141)
          to label %144 unwind label %257

; <label>:144                                     ; preds = %112
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi3ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %assign.i.i31, %"struct.Eigen::DefaultDevice"* nonnull dereferenceable(1) %2)
  call void @llvm.lifetime.end(i64 16, i8* %127) #2
  call void @llvm.lifetime.end(i64 96, i8* %124)
  call void @llvm.lifetime.end(i64 1, i8* %125)
  call void @llvm.lifetime.end(i64 1, i8* %126)
  call void @llvm.lifetime.end(i64 16, i8* %113)
  %145 = load i64, i64* %20, align 8
  %146 = load i64, i64* %21, align 8
  %147 = load i64, i64* %23, align 8
  %148 = shl i64 %145, 2
  %149 = mul i64 %148, %146
  %150 = mul i64 %149, %147
  %151 = load i64, i64* %30, align 8
  %152 = load i64, i64* %31, align 8
  %153 = load i64, i64* %33, align 8
  %154 = shl i64 %151, 2
  %155 = mul i64 %154, %152
  %156 = mul i64 %155, %153
  %157 = load i64, i64* %40, align 8
  %158 = load i64, i64* %41, align 8
  %159 = load i64, i64* %43, align 8
  %160 = shl i64 %157, 2
  %161 = mul i64 %160, %158
  %162 = mul i64 %161, %159
  %163 = bitcast float** %d_in1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %163) #2
  %164 = bitcast float** %d_in2 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %164) #2
  %165 = bitcast float** %d_in3 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %165) #2
  %166 = bitcast float** %d_out to i8*
  call void @llvm.lifetime.start(i64 8, i8* %166) #2
  %167 = bitcast float** %d_in1 to i8**
  %168 = invoke i32 @cudaMalloc(i8** %167, i64 %150)
          to label %169 unwind label %257

; <label>:169                                     ; preds = %144
  %170 = bitcast float** %d_in2 to i8**
  %171 = invoke i32 @cudaMalloc(i8** %170, i64 %156)
          to label %172 unwind label %257

; <label>:172                                     ; preds = %169
  %173 = bitcast float** %d_in3 to i8**
  %174 = invoke i32 @cudaMalloc(i8** %173, i64 %162)
          to label %175 unwind label %257

; <label>:175                                     ; preds = %172
  %176 = bitcast float** %d_out to i8**
  %177 = invoke i32 @cudaMalloc(i8** %176, i64 1480608)
          to label %178 unwind label %257

; <label>:178                                     ; preds = %175
  %179 = load i8*, i8** %167, align 8, !tbaa !16
  %180 = load i8*, i8** %19, align 8, !tbaa !35
  %181 = invoke i32 @cudaMemcpy(i8* %179, i8* %180, i64 %150, i32 1)
          to label %182 unwind label %257

; <label>:182                                     ; preds = %178
  %183 = load i8*, i8** %170, align 8, !tbaa !16
  %184 = load i8*, i8** %29, align 8, !tbaa !35
  %185 = invoke i32 @cudaMemcpy(i8* %183, i8* %184, i64 %156, i32 1)
          to label %186 unwind label %257

; <label>:186                                     ; preds = %182
  %187 = load i8*, i8** %173, align 8, !tbaa !16
  %188 = load i8*, i8** %39, align 8, !tbaa !35
  %189 = invoke i32 @cudaMemcpy(i8* %187, i8* %188, i64 %162, i32 1)
          to label %190 unwind label %257

; <label>:190                                     ; preds = %186
  %191 = bitcast %"class.Eigen::CudaStreamDevice"* %stream to i8*
  call void @llvm.lifetime.start(i64 40, i8* %191) #2
  invoke void @_ZN5Eigen16CudaStreamDeviceC2Ev(%"class.Eigen::CudaStreamDevice"* nonnull %stream)
          to label %192 unwind label %257

; <label>:192                                     ; preds = %190
  %193 = bitcast %"struct.Eigen::GpuDevice"* %gpu_device to i8*
  call void @llvm.lifetime.start(i64 16, i8* %193) #2
  %194 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0
  %195 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %gpu_device, i64 0, i32 0
  store %"class.Eigen::StreamInterface"* %194, %"class.Eigen::StreamInterface"** %195, align 8, !tbaa !64
  %196 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %gpu_device, i64 0, i32 1
  store i32 2147483647, i32* %196, align 8, !tbaa !66
  %197 = bitcast %"class.Eigen::TensorMap"* %gpu_in1 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %197) #2
  %198 = bitcast float** %d_in1 to i64*
  %199 = load i64, i64* %198, align 8, !tbaa !16
  %200 = bitcast %"class.Eigen::TensorMap"* %gpu_in1 to i64*
  store i64 %199, i64* %200, align 8, !tbaa !67
  %201 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in1, i64 0, i32 1, i32 0, i32 0, i64 0
  %202 = bitcast i64* %201 to <2 x i64>*
  store <2 x i64> <i64 72, i64 53>, <2 x i64>* %202, align 8
  %203 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in1, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 97, i64* %203, align 8
  %204 = bitcast %"class.Eigen::TensorMap"* %gpu_in2 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %204) #2
  %205 = bitcast float** %d_in2 to i64*
  %206 = load i64, i64* %205, align 8, !tbaa !16
  %207 = bitcast %"class.Eigen::TensorMap"* %gpu_in2 to i64*
  store i64 %206, i64* %207, align 8, !tbaa !67
  %208 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in2, i64 0, i32 1, i32 0, i32 0, i64 0
  %209 = bitcast i64* %208 to <2 x i64>*
  store <2 x i64> <i64 72, i64 53>, <2 x i64>* %209, align 8
  %210 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in2, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 97, i64* %210, align 8
  %211 = bitcast %"class.Eigen::TensorMap"* %gpu_in3 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %211) #2
  %212 = bitcast float** %d_in3 to i64*
  %213 = load i64, i64* %212, align 8, !tbaa !16
  %214 = bitcast %"class.Eigen::TensorMap"* %gpu_in3 to i64*
  store i64 %213, i64* %214, align 8, !tbaa !67
  %215 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in3, i64 0, i32 1, i32 0, i32 0, i64 0
  %216 = bitcast i64* %215 to <2 x i64>*
  store <2 x i64> <i64 72, i64 53>, <2 x i64>* %216, align 8
  %217 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in3, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 97, i64* %217, align 8
  %218 = bitcast %"class.Eigen::TensorMap"* %gpu_out to i8*
  call void @llvm.lifetime.start(i64 32, i8* %218) #2
  %219 = bitcast float** %d_out to i64*
  %220 = load i64, i64* %219, align 8, !tbaa !16
  %221 = bitcast %"class.Eigen::TensorMap"* %gpu_out to i64*
  store i64 %220, i64* %221, align 8, !tbaa !67
  %222 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_out, i64 0, i32 1, i32 0, i32 0, i64 0
  %223 = bitcast i64* %222 to <2 x i64>*
  store <2 x i64> <i64 72, i64 53>, <2 x i64>* %223, align 8
  %224 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_out, i64 0, i32 1, i32 0, i32 0, i64 2
  store i64 97, i64* %224, align 8
  %225 = ptrtoint %"class.Eigen::TensorMap"* %gpu_out to i64
  %226 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %12, i64 0, i32 0
  store %"class.Eigen::TensorMap"* %gpu_in1, %"class.Eigen::TensorMap"** %226, align 8, !tbaa !14, !alias.scope !69
  %227 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %12, i64 0, i32 1, i32 0
  store %"class.Eigen::TensorMap"* %gpu_in2, %"class.Eigen::TensorMap"** %227, align 8
  %228 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %12, i64 0, i32 1, i32 1
  store %"class.Eigen::TensorMap"* %gpu_in3, %"class.Eigen::TensorMap"** %228, align 8
  %229 = bitcast %"class.Eigen::TensorAssignOp.15"* %assign.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %229) #2
  %230 = bitcast %"class.Eigen::TensorAssignOp.15"* %assign.i to i64*
  store i64 %225, i64* %230, align 8, !tbaa !14
  %231 = getelementptr inbounds %"class.Eigen::TensorAssignOp.15", %"class.Eigen::TensorAssignOp.15"* %assign.i, i64 0, i32 1
  store %"class.Eigen::TensorCwiseBinaryOp"* %12, %"class.Eigen::TensorCwiseBinaryOp"** %231, align 8, !tbaa !14
  invoke void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_KNS7_INS0_17scalar_product_opIffEESA_SA_EEEEEENS_9GpuDeviceELb0EE3runERSI_RKSJ_(%"class.Eigen::TensorAssignOp.15"* nonnull dereferenceable(16) %assign.i, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %gpu_device)
          to label %232 unwind label %.loopexit.split-lp

; <label>:232                                     ; preds = %192
  call void @llvm.lifetime.end(i64 16, i8* %229) #2
  %233 = load i8*, i8** %176, align 8, !tbaa !16
  %234 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %195, align 8, !tbaa !64
  %235 = bitcast %"class.Eigen::StreamInterface"* %234 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %236 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %235, align 8, !tbaa !17
  %237 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %236, i64 2
  %238 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %237, align 8
  %239 = invoke dereferenceable(8) %struct.CUstream_st** %238(%"class.Eigen::StreamInterface"* %234)
          to label %_ZNK5Eigen9GpuDevice6streamEv.exit unwind label %.loopexit.split-lp

_ZNK5Eigen9GpuDevice6streamEv.exit:               ; preds = %232
  %240 = load %struct.CUstream_st*, %struct.CUstream_st** %239, align 8, !tbaa !16
  %241 = invoke i32 @cudaMemcpyAsync(i8* nonnull %44, i8* %233, i64 1480608, i32 2, %struct.CUstream_st* %240)
          to label %242 unwind label %.loopexit.split-lp

; <label>:242                                     ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit
  %243 = icmp eq i32 %241, 0
  br i1 %243, label %281, label %244

; <label>:244                                     ; preds = %242
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([106 x i8], [106 x i8]* @.str.24, i64 0, i64 0), i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.25, i64 0, i64 0), i32 55, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__._Z21test_cuda_elementwisev, i64 0, i64 0)) #21
  unreachable

; <label>:245                                     ; preds = %28
  %246 = landingpad { i8*, i32 }
          cleanup
  %247 = extractvalue { i8*, i32 } %246, 0
  %248 = extractvalue { i8*, i32 } %246, 1
  br label %376

; <label>:249                                     ; preds = %38
  %250 = landingpad { i8*, i32 }
          cleanup
  %251 = extractvalue { i8*, i32 } %250, 0
  %252 = extractvalue { i8*, i32 } %250, 1
  br label %374

; <label>:253                                     ; preds = %46
  %254 = landingpad { i8*, i32 }
          cleanup
  %255 = extractvalue { i8*, i32 } %254, 0
  %256 = extractvalue { i8*, i32 } %254, 1
  br label %372

; <label>:257                                     ; preds = %190, %186, %182, %178, %175, %172, %169, %144, %112, %80, %47
  %258 = landingpad { i8*, i32 }
          cleanup
  %259 = extractvalue { i8*, i32 } %258, 0
  %260 = extractvalue { i8*, i32 } %258, 1
  br label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit

.loopexit:                                        ; preds = %336, %300
  %lpad.loopexit = landingpad { i8*, i32 }
          cleanup
  br label %261

.loopexit.split-lp:                               ; preds = %348, %345, %342, %293, %_ZNK5Eigen9GpuDevice6streamEv.exit37, %281, %_ZNK5Eigen9GpuDevice6streamEv.exit, %232, %192
  %lpad.loopexit.split-lp = landingpad { i8*, i32 }
          cleanup
  br label %261

; <label>:261                                     ; preds = %.loopexit.split-lp, %.loopexit
  %lpad.phi = phi { i8*, i32 } [ %lpad.loopexit, %.loopexit ], [ %lpad.loopexit.split-lp, %.loopexit.split-lp ]
  %262 = extractvalue { i8*, i32 } %lpad.phi, 0
  %263 = extractvalue { i8*, i32 } %lpad.phi, 1
  %264 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %264, align 8, !tbaa !17
  %265 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 3
  %266 = load i8*, i8** %265, align 8, !tbaa !74
  %267 = icmp eq i8* %266, null
  br i1 %267, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %268

; <label>:268                                     ; preds = %261
  %269 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 2
  %270 = load i32, i32* %269, align 8, !tbaa !76
  %271 = invoke i32 @cudaSetDevice(i32 %270)
          to label %.noexc.i unwind label %278

.noexc.i:                                         ; preds = %268
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %274, label %273

; <label>:273                                     ; preds = %.noexc.i
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:274                                     ; preds = %.noexc.i
  %275 = invoke i32 @cudaFree(i8* nonnull %266)
          to label %.noexc1.i unwind label %278

.noexc1.i:                                        ; preds = %274
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %277

; <label>:277                                     ; preds = %.noexc1.i
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:278                                     ; preds = %274, %268
  %279 = landingpad { i8*, i32 }
          catch i8* null
  %280 = extractvalue { i8*, i32 } %279, 0
  call void @__clang_call_terminate(i8* %280) #21
  unreachable

; <label>:281                                     ; preds = %242
  %282 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %195, align 8, !tbaa !64
  %283 = bitcast %"class.Eigen::StreamInterface"* %282 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %284 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %283, align 8, !tbaa !17
  %285 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %284, i64 2
  %286 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %285, align 8
  %287 = invoke dereferenceable(8) %struct.CUstream_st** %286(%"class.Eigen::StreamInterface"* %282)
          to label %_ZNK5Eigen9GpuDevice6streamEv.exit37 unwind label %.loopexit.split-lp

_ZNK5Eigen9GpuDevice6streamEv.exit37:             ; preds = %281
  %288 = load %struct.CUstream_st*, %struct.CUstream_st** %287, align 8, !tbaa !16
  %289 = invoke i32 @cudaStreamSynchronize(%struct.CUstream_st* %288)
          to label %290 unwind label %.loopexit.split-lp

; <label>:290                                     ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit37
  %291 = icmp eq i32 %289, 0
  br i1 %291, label %.preheader76.preheader, label %292

.preheader76.preheader:                           ; preds = %290
  br label %.preheader76

; <label>:292                                     ; preds = %290
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([58 x i8], [58 x i8]* @.str.26, i64 0, i64 0), i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.25, i64 0, i64 0), i32 56, i8* nonnull getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__._Z21test_cuda_elementwisev, i64 0, i64 0)) #21
  unreachable

.preheader76:                                     ; preds = %296, %.preheader76.preheader
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %296 ], [ 0, %.preheader76.preheader ]
  br label %.preheader

; <label>:293                                     ; preds = %296
  %294 = load i8*, i8** %167, align 8, !tbaa !16
  %295 = invoke i32 @cudaFree(i8* %294)
          to label %342 unwind label %.loopexit.split-lp

.preheader:                                       ; preds = %298, %.preheader76
  %indvars.iv81 = phi i64 [ 0, %.preheader76 ], [ %indvars.iv.next82, %298 ]
  br label %300

; <label>:296                                     ; preds = %298
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %297 = icmp slt i64 %indvars.iv.next84, 72
  br i1 %297, label %.preheader76, label %293

; <label>:298                                     ; preds = %340
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %299 = icmp slt i64 %indvars.iv.next82, 53
  br i1 %299, label %.preheader, label %296

; <label>:300                                     ; preds = %340, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %340 ]
  %301 = mul nuw nsw i64 %indvars.iv, 53
  %302 = add nuw nsw i64 %301, %indvars.iv81
  %303 = mul nuw nsw i64 %302, 72
  %304 = add nuw nsw i64 %303, %indvars.iv83
  %305 = getelementptr inbounds float, float* %48, i64 %304
  %306 = load i64, i64* %20, align 8, !tbaa !15
  %307 = load i64, i64* %21, align 8, !tbaa !15
  %308 = mul nsw i64 %307, %indvars.iv
  %309 = add nsw i64 %308, %indvars.iv81
  %310 = mul nsw i64 %309, %306
  %311 = add nsw i64 %310, %indvars.iv83
  %312 = load float*, float** %15, align 8, !tbaa !35
  %313 = getelementptr inbounds float, float* %312, i64 %311
  %314 = load float, float* %313, align 4, !tbaa !77
  %315 = load i64, i64* %30, align 8, !tbaa !15
  %316 = load i64, i64* %31, align 8, !tbaa !15
  %317 = mul nsw i64 %316, %indvars.iv
  %318 = add nsw i64 %317, %indvars.iv81
  %319 = mul nsw i64 %318, %315
  %320 = add nsw i64 %319, %indvars.iv83
  %321 = load float*, float** %25, align 8, !tbaa !35
  %322 = getelementptr inbounds float, float* %321, i64 %320
  %323 = load float, float* %322, align 4, !tbaa !77
  %324 = load i64, i64* %40, align 8, !tbaa !15
  %325 = load i64, i64* %41, align 8, !tbaa !15
  %326 = mul nsw i64 %325, %indvars.iv
  %327 = add nsw i64 %326, %indvars.iv81
  %328 = mul nsw i64 %327, %324
  %329 = add nsw i64 %328, %indvars.iv83
  %330 = load float*, float** %35, align 8, !tbaa !35
  %331 = getelementptr inbounds float, float* %330, i64 %329
  %332 = load float, float* %331, align 4, !tbaa !77
  %333 = fmul float %323, %332
  %334 = fadd float %314, %333
  store float %334, float* %13, align 4, !tbaa !77
  %335 = invoke zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nonnull dereferenceable(4) %305, float* nonnull dereferenceable(4) %13)
          to label %336 unwind label %.loopexit

; <label>:336                                     ; preds = %300
  %337 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !16
  %338 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %337, i64 -1, i32 0, i32 0
  %339 = load i8*, i8** %338, align 8, !tbaa !8
  invoke void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %335, i8* %339, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.25, i64 0, i64 0), i32 61, i8* nonnull getelementptr inbounds ([209 x i8], [209 x i8]* @.str.27, i64 0, i64 0))
          to label %340 unwind label %.loopexit

; <label>:340                                     ; preds = %336
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %341 = icmp slt i64 %indvars.iv.next, 97
  br i1 %341, label %300, label %298

; <label>:342                                     ; preds = %293
  %343 = load i8*, i8** %170, align 8, !tbaa !16
  %344 = invoke i32 @cudaFree(i8* %343)
          to label %345 unwind label %.loopexit.split-lp

; <label>:345                                     ; preds = %342
  %346 = load i8*, i8** %173, align 8, !tbaa !16
  %347 = invoke i32 @cudaFree(i8* %346)
          to label %348 unwind label %.loopexit.split-lp

; <label>:348                                     ; preds = %345
  %349 = load i8*, i8** %176, align 8, !tbaa !16
  %350 = invoke i32 @cudaFree(i8* %349)
          to label %351 unwind label %.loopexit.split-lp

; <label>:351                                     ; preds = %348
  call void @llvm.lifetime.end(i64 32, i8* %218) #2
  call void @llvm.lifetime.end(i64 32, i8* %211) #2
  call void @llvm.lifetime.end(i64 32, i8* %204) #2
  call void @llvm.lifetime.end(i64 32, i8* %197) #2
  call void @llvm.lifetime.end(i64 16, i8* %193) #2
  %352 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %352, align 8, !tbaa !17
  %353 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 3
  %354 = load i8*, i8** %353, align 8, !tbaa !74
  %355 = icmp eq i8* %354, null
  br i1 %355, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit40, label %356

; <label>:356                                     ; preds = %351
  %357 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 2
  %358 = load i32, i32* %357, align 8, !tbaa !76
  %359 = invoke i32 @cudaSetDevice(i32 %358)
          to label %.noexc.i38 unwind label %366

.noexc.i38:                                       ; preds = %356
  %360 = icmp eq i32 %359, 0
  br i1 %360, label %362, label %361

; <label>:361                                     ; preds = %.noexc.i38
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:362                                     ; preds = %.noexc.i38
  %363 = invoke i32 @cudaFree(i8* nonnull %354)
          to label %.noexc1.i39 unwind label %366

.noexc1.i39:                                      ; preds = %362
  %364 = icmp eq i32 %363, 0
  br i1 %364, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit40, label %365

; <label>:365                                     ; preds = %.noexc1.i39
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:366                                     ; preds = %362, %356
  %367 = landingpad { i8*, i32 }
          catch i8* null
  %368 = extractvalue { i8*, i32 } %367, 0
  call void @__clang_call_terminate(i8* %368) #21
  unreachable

_ZN5Eigen16CudaStreamDeviceD2Ev.exit40:           ; preds = %.noexc1.i39, %351
  call void @llvm.lifetime.end(i64 40, i8* nonnull %191) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %166) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %165) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %164) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %163) #2
  call void @free(i8* %44) #2
  %369 = load i8*, i8** %39, align 8, !tbaa !35
  call void @free(i8* %369) #2
  call void @llvm.lifetime.end(i64 32, i8* nonnull %34) #2
  %370 = load i8*, i8** %29, align 8, !tbaa !35
  call void @free(i8* %370) #2
  call void @llvm.lifetime.end(i64 32, i8* nonnull %24) #2
  %371 = load i8*, i8** %19, align 8, !tbaa !35
  call void @free(i8* %371) #2
  call void @llvm.lifetime.end(i64 32, i8* nonnull %14) #2
  ret void

_ZN5Eigen16CudaStreamDeviceD2Ev.exit:             ; preds = %.noexc1.i, %261, %257
  %.01 = phi i32 [ %260, %257 ], [ %263, %261 ], [ %263, %.noexc1.i ]
  %.0 = phi i8* [ %259, %257 ], [ %262, %261 ], [ %262, %.noexc1.i ]
  call void @free(i8* %44) #2
  br label %372

; <label>:372                                     ; preds = %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, %253
  %.12 = phi i32 [ %.01, %_ZN5Eigen16CudaStreamDeviceD2Ev.exit ], [ %256, %253 ]
  %.1 = phi i8* [ %.0, %_ZN5Eigen16CudaStreamDeviceD2Ev.exit ], [ %255, %253 ]
  %373 = load i8*, i8** %39, align 8, !tbaa !35
  call void @free(i8* %373) #2
  br label %374

; <label>:374                                     ; preds = %372, %249
  %.23 = phi i32 [ %.12, %372 ], [ %252, %249 ]
  %.2 = phi i8* [ %.1, %372 ], [ %251, %249 ]
  %375 = load i8*, i8** %29, align 8, !tbaa !35
  call void @free(i8* %375) #2
  br label %376

; <label>:376                                     ; preds = %374, %245
  %.34 = phi i32 [ %.23, %374 ], [ %248, %245 ]
  %.3 = phi i8* [ %.2, %374 ], [ %247, %245 ]
  %377 = load i8*, i8** %19, align 8, !tbaa !35
  call void @free(i8* %377) #2
  %378 = insertvalue { i8*, i32 } undef, i8* %.3, 0
  %379 = insertvalue { i8*, i32 } %378, i32 %.34, 1
  resume { i8*, i32 } %379
}

declare i32 @cudaMalloc(i8**, i64) #0

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen16CudaStreamDeviceC2Ev(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %num_devices.i = alloca i32, align 4
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !17
  %2 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  store %struct.CUstream_st** @_ZN5EigenL14default_streamE, %struct.CUstream_st*** %2, align 8, !tbaa !79
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
  %14 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.30, i64 0, i64 0), i64 42)
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit.i: ; preds = %28, %17
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
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 66, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv, i64 0, i64 0)) #21
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
  %64 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @.str.33, i64 0, i64 0), i64 34)
  %65 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, i32 %.lcssa)
  %66 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %65, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i64 0, i64 0), i64 2)
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit4.i: ; preds = %.noexc17, %69
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
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 77, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv, i64 0, i64 0)) #21
  unreachable

.lr.ph:                                           ; preds = %..lr.ph11_crit_edge.i, %.lr.ph.preheader
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

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.lr.ph.i.preheader
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
  %2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i64 0, i64 0), i64 5)
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %15, %4
  %18 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.40, i64 0, i64 0), i64 11)
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit1: ; preds = %31, %20
  %34 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.41, i64 0, i64 0), i64 2)
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

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %55, %52
  %.0.i = phi i8 [ %54, %52 ], [ %60, %55 ]
  %61 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %35, i8 signext %.0.i)
  %62 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %61)
  %63 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %62, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.42, i64 0, i64 0), i64 4)
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

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit2: ; preds = %78, %65
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

_ZNKSt5ctypeIcE5widenEc.exit4:                    ; preds = %97, %94
  %.0.i3 = phi i8 [ %96, %94 ], [ %102, %97 ]
  %103 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %62, i8 signext %.0.i3)
  %104 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %103)
  %105 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.43, i64 0, i64 0), i64 7)
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
  %113 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.45, i64 0, i64 0), i64 1)
  tail call void @abort() #21
  unreachable

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %112, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %114 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.44, i64 0, i64 0), i64 4)
  %115 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !1
  %116 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %115, i64 %indvars.iv.next, i32 0, i32 0
  %117 = load i8*, i8** %116, align 8, !tbaa !8
  %118 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %115, i64 %indvars.iv.next, i32 1
  %119 = load i64, i64* %118, align 8, !tbaa !13
  %120 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* %117, i64 %119)
  %121 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %120, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.45, i64 0, i64 0), i64 1)
  %122 = icmp sgt i64 %indvars.iv, 1
  br i1 %122, label %.lr.ph, label %._crit_edge.loopexit

; <label>:123                                     ; preds = %0
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nocapture readonly dereferenceable(4) %a, float* nocapture readonly dereferenceable(4) %b) #7 comdat {
  %1 = load float, float* %a, align 4, !tbaa !77
  %2 = load float, float* %b, align 4, !tbaa !77
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
  %12 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.50, i64 0, i64 0), i64 35)
  %13 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, double 0x3F50624DE0000000)
  %14 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %13, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.51, i64 0, i64 0), i64 21)
  %15 = load float, float* %a, align 4, !tbaa !77
  %16 = load float, float* %b, align 4, !tbaa !77
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

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %45, %42
  %.0.i = phi i8 [ %44, %42 ], [ %50, %45 ]
  %51 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %26, i8 signext %.0.i)
  %52 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %51)
  br label %53

; <label>:53                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit, %0
  ret i1 %10
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
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %.noexc
  %12 = invoke i32 @cudaFree(i8* nonnull %3)
          to label %.noexc1 unwind label %15

.noexc1:                                          ; preds = %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %_ZNK5Eigen16CudaStreamDevice10deallocateEPv.exit, label %14

; <label>:14                                      ; preds = %.noexc1
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
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
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %.noexc.i
  %12 = invoke i32 @cudaFree(i8* nonnull %3)
          to label %.noexc1.i unwind label %15

.noexc1.i:                                        ; preds = %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %14

; <label>:14                                      ; preds = %.noexc1.i
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:15                                      ; preds = %11, %5
  %16 = landingpad { i8*, i32 }
          catch i8* null
  %17 = extractvalue { i8*, i32 } %16, 0
  tail call void @__clang_call_terminate(i8* %17) #21
  unreachable

_ZN5Eigen16CudaStreamDeviceD2Ev.exit:             ; preds = %.noexc1.i, %0
  %18 = bitcast %"class.Eigen::CudaStreamDevice"* %this to i8*
  tail call void @_ZdlPv(i8* %18) #23
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define linkonce_odr dereferenceable(8) %struct.CUstream_st** @_ZNK5Eigen16CudaStreamDevice6streamEv(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this) unnamed_addr #11 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  %2 = load %struct.CUstream_st**, %struct.CUstream_st*** %1, align 8, !tbaa !79
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
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 142, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:6                                       ; preds = %0
  %7 = bitcast i8** %result to i8*
  call void @llvm.lifetime.start(i64 8, i8* %7) #2
  %8 = call i32 @cudaMalloc(i8** nonnull %result, i64 %num_bytes)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %6
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 145, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %6
  %12 = load i8*, i8** %result, align 8, !tbaa !16
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.36, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 146, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
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
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:6                                       ; preds = %0
  %7 = icmp eq i8* %buffer, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %6
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.37, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 153, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:9                                       ; preds = %6
  %10 = tail call i32 @cudaFree(i8* nonnull %buffer)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %9
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
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
  %2 = load i32*, i32** %1, align 8, !tbaa !80
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
  store i8* %10, i8** %11, align 8, !tbaa !80
  %12 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  %13 = load %struct.CUstream_st**, %struct.CUstream_st*** %12, align 8, !tbaa !79
  %14 = load %struct.CUstream_st*, %struct.CUstream_st** %13, align 8, !tbaa !16
  %15 = tail call i32 @cudaMemsetAsync(i8* %10, i32 0, i64 4, %struct.CUstream_st* %14)
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %17

._crit_edge:                                      ; preds = %4
  %.pre = load i32*, i32** %1, align 8, !tbaa !80
  br label %18

; <label>:17                                      ; preds = %4
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.35, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.32, i64 0, i64 0), i32 171, i8* nonnull getelementptr inbounds ([65 x i8], [65 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice9semaphoreEv, i64 0, i64 0)) #21
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

declare i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"*, i64* dereferenceable(8), i64) #0

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

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit: ; preds = %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit
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

.lr.ph.i.i.i3:                                    ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4, %.lr.ph.i.i.i3.preheader
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

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5: ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread
  %85 = phi %"class.std::__cxx11::basic_string"* [ %75, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split ], [ %75, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit ], [ %49, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread ]
  %86 = phi %"class.std::__cxx11::basic_string"* [ %.pr, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split ], [ %.pre8, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit ], [ %46, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread ]
  %87 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 2
  %88 = icmp eq %"class.std::__cxx11::basic_string"* %86, null
  br i1 %88, label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1, label %89

; <label>:89                                      ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5
  %90 = bitcast %"class.std::__cxx11::basic_string"* %86 to i8*
  tail call void @_ZdlPv(i8* %90) #2
  br label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1: ; preds = %89, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5
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

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_6DSizesIlLi3EEE(%"class.Eigen::Tensor"* nocapture %this, %"struct.Eigen::DSizes"* nocapture readonly dereferenceable(24) %dimensions) #4 comdat align 2 {
  %dimensions2 = bitcast %"struct.Eigen::DSizes"* %dimensions to i8*
  %dims = alloca %"class.Eigen::array", align 8
  %1 = bitcast %"class.Eigen::array"* %dims to i8*
  call void @llvm.lifetime.start(i64 24, i8* %1) #2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %dimensions2, i64 24, i32 8, i1 false)
  %2 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %dims, i64 0, i32 0, i64 0
  %3 = load i64, i64* %2, align 8, !tbaa !15
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.thread.i, label %7

_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.thread.i: ; preds = %0
  %5 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %dims, i64 0, i32 0, i64 1
  %6 = load i64, i64* %5, align 8, !tbaa !15
  br label %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.1.i

; <label>:7                                       ; preds = %0
  %8 = sdiv i64 9223372036854775807, %3
  %9 = icmp slt i64 %8, 1
  br i1 %9, label %10, label %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.i

; <label>:10                                      ; preds = %23, %14, %7
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.i: ; preds = %7
  %11 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %dims, i64 0, i32 0, i64 1
  %12 = load i64, i64* %11, align 8, !tbaa !15
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.1.i, label %14

; <label>:14                                      ; preds = %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.i
  %15 = sdiv i64 9223372036854775807, %12
  %16 = icmp slt i64 %15, %3
  br i1 %16, label %10, label %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.1.i

_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.1.i: ; preds = %14, %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.i, %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.thread.i
  %17 = phi i64 [ %6, %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.thread.i ], [ %12, %14 ], [ 0, %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.i ]
  %18 = mul nsw i64 %17, %3
  %19 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %dims, i64 0, i32 0, i64 2
  %20 = load i64, i64* %19, align 8, !tbaa !15
  %21 = icmp eq i64 %18, 0
  %22 = icmp eq i64 %20, 0
  %or.cond.i.2.i = or i1 %21, %22
  br i1 %or.cond.i.2.i, label %_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_5arrayIlLm3EEE.exit, label %23

; <label>:23                                      ; preds = %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.1.i
  %24 = sdiv i64 9223372036854775807, %20
  %25 = icmp slt i64 %24, %18
  br i1 %25, label %10, label %_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_5arrayIlLm3EEE.exit

_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_5arrayIlLm3EEE.exit: ; preds = %23, %_ZN5Eigen8internal28check_rows_cols_for_overflowILin1EE3runIlEEvT_S4_.exit.1.i
  %26 = mul nsw i64 %20, %18
  %27 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %this, i64 0, i32 0, i32 1
  %28 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %27, i64 0, i32 0, i32 0, i64 0
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %this, i64 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %this, i64 0, i32 0, i32 1, i32 0, i32 0, i64 2
  %33 = load i64, i64* %32, align 8
  %34 = mul nsw i64 %31, %29
  %35 = mul nsw i64 %34, %33
  %36 = icmp eq i64 %35, %26
  br i1 %36, label %_ZN5Eigen13TensorStorageIfNS_6DSizesIlLi3EEELi0EE6resizeElRKNS_5arrayIlLm3EEE.exit, label %37

; <label>:37                                      ; preds = %_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_5arrayIlLm3EEE.exit
  %38 = bitcast %"class.Eigen::Tensor"* %this to i8**
  %39 = load i8*, i8** %38, align 8, !tbaa !35
  tail call void @free(i8* %39) #2
  %40 = icmp eq i64 %26, 0
  br i1 %40, label %49, label %41

; <label>:41                                      ; preds = %37
  %42 = icmp ugt i64 %26, 4611686018427387903
  br i1 %42, label %43, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i

; <label>:43                                      ; preds = %41
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i: ; preds = %41
  %44 = shl i64 %26, 2
  %45 = tail call noalias i8* @malloc(i64 %44) #2
  %46 = icmp eq i8* %45, null
  %47 = icmp ne i64 %44, 0
  %or.cond.i.i.i.i = and i1 %47, %46
  br i1 %or.cond.i.i.i.i, label %48, label %_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i

; <label>:48                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i: ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i
  store i8* %45, i8** %38, align 8, !tbaa !35
  br label %_ZN5Eigen13TensorStorageIfNS_6DSizesIlLi3EEELi0EE6resizeElRKNS_5arrayIlLm3EEE.exit

; <label>:49                                      ; preds = %37
  %50 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %this, i64 0, i32 0, i32 0
  store float* null, float** %50, align 8, !tbaa !35
  br label %_ZN5Eigen13TensorStorageIfNS_6DSizesIlLi3EEELi0EE6resizeElRKNS_5arrayIlLm3EEE.exit

_ZN5Eigen13TensorStorageIfNS_6DSizesIlLi3EEELi0EE6resizeElRKNS_5arrayIlLm3EEE.exit: ; preds = %49, %_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i, %_ZN5Eigen6TensorIfLi3ELi0ElE6resizeERKNS_5arrayIlLm3EEE.exit
  %51 = bitcast %"struct.Eigen::DSizes"* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %1, i64 24, i32 8, i1 false) #2, !tbaa.struct !81
  call void @llvm.lifetime.end(i64 24, i8* %1) #2
  ret void
}

; Function Attrs: inlinehint norecurse nounwind uwtable
define linkonce_odr void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi3ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nocapture readonly dereferenceable(16) %expr, %"struct.Eigen::DefaultDevice"* dereferenceable(1) %device) #18 comdat align 2 {
  %1 = bitcast %"class.Eigen::TensorAssignOp"* %expr to i64**
  %2 = load i64*, i64** %1, align 8, !tbaa !14
  %3 = load i64, i64* %2, align 8, !tbaa !35
  %4 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %expr, i64 0, i32 1
  %5 = load %"class.Eigen::TensorCwiseNullaryOp"*, %"class.Eigen::TensorCwiseNullaryOp"** %4, align 8, !tbaa !14
  %6 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %5, i64 0, i32 1, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !46
  %8 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %5, i64 0, i32 0
  %9 = load %"class.Eigen::Tensor"*, %"class.Eigen::Tensor"** %8, align 8, !tbaa !14
  %10 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %9, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %9, i64 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %9, i64 0, i32 0, i32 1, i32 0, i32 0, i64 2
  %15 = load i64, i64* %14, align 8
  %16 = mul i64 %13, %11
  %17 = mul i64 %16, %15
  %18 = sdiv i64 %17, 16
  %19 = shl nsw i64 %18, 4
  %20 = icmp sgt i64 %17, 15
  br i1 %20, label %.preheader3.lr.ph, label %._crit_edge14

.preheader3.lr.ph:                                ; preds = %0
  %21 = inttoptr i64 %3 to float*
  br label %.preheader3

.preheader3:                                      ; preds = %26, %.preheader3.lr.ph
  %i.013 = phi i64 [ 0, %.preheader3.lr.ph ], [ %27, %26 ]
  %evaluator.sroa.8.012 = phi i64 [ %7, %.preheader3.lr.ph ], [ %.lcssa21, %26 ]
  br label %29

._crit_edge14.loopexit:                           ; preds = %26
  %.lcssa21.lcssa = phi i64 [ %.lcssa21, %26 ]
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %0
  %evaluator.sroa.8.0.lcssa = phi i64 [ %7, %0 ], [ %.lcssa21.lcssa, %._crit_edge14.loopexit ]
  %22 = sdiv i64 %17, 4
  %23 = shl nsw i64 %22, 2
  %24 = icmp slt i64 %19, %23
  br i1 %24, label %.lr.ph9, label %.preheader

.lr.ph9:                                          ; preds = %._crit_edge14
  %25 = inttoptr i64 %3 to float*
  br label %88

; <label>:26                                      ; preds = %29
  %.lcssa21 = phi i64 [ %70, %29 ]
  %27 = add nuw nsw i64 %i.013, 16
  %28 = icmp slt i64 %27, %19
  br i1 %28, label %.preheader3, label %._crit_edge14.loopexit

; <label>:29                                      ; preds = %29, %.preheader3
  %j.011 = phi i64 [ 0, %.preheader3 ], [ %85, %29 ]
  %evaluator.sroa.8.110 = phi i64 [ %evaluator.sroa.8.012, %.preheader3 ], [ %70, %29 ]
  %30 = shl nsw i64 %j.011, 2
  %31 = add nuw nsw i64 %30, %i.013
  %32 = add i64 %31, %evaluator.sroa.8.110
  %33 = mul i64 %32, 6364136223846793005
  %34 = add i64 %33, -2720673578348880933
  %35 = lshr i64 %32, 22
  %36 = xor i64 %35, %32
  %37 = lshr i64 %32, 61
  %38 = add nuw nsw i64 %37, 22
  %39 = lshr i64 %36, %38
  %40 = trunc i64 %39 to i32
  %41 = and i32 %40, 8388607
  %42 = or i32 %41, 1065353216
  %43 = bitcast i32 %42 to float
  %44 = fadd float %43, -1.000000e+00
  %45 = mul i64 %34, 6364136223846793005
  %46 = add i64 %45, -2720673578348880933
  %47 = lshr i64 %34, 22
  %48 = xor i64 %47, %34
  %49 = lshr i64 %34, 61
  %50 = add nuw nsw i64 %49, 22
  %51 = lshr i64 %48, %50
  %52 = trunc i64 %51 to i32
  %53 = and i32 %52, 8388607
  %54 = or i32 %53, 1065353216
  %55 = bitcast i32 %54 to float
  %56 = fadd float %55, -1.000000e+00
  %57 = mul i64 %46, 6364136223846793005
  %58 = add i64 %57, -2720673578348880933
  %59 = lshr i64 %46, 22
  %60 = xor i64 %59, %46
  %61 = lshr i64 %46, 61
  %62 = add nuw nsw i64 %61, 22
  %63 = lshr i64 %60, %62
  %64 = trunc i64 %63 to i32
  %65 = and i32 %64, 8388607
  %66 = or i32 %65, 1065353216
  %67 = bitcast i32 %66 to float
  %68 = fadd float %67, -1.000000e+00
  %69 = mul i64 %58, 6364136223846793005
  %70 = add i64 %69, -2720673578348880933
  %71 = lshr i64 %58, 22
  %72 = xor i64 %71, %58
  %73 = lshr i64 %58, 61
  %74 = add nuw nsw i64 %73, 22
  %75 = lshr i64 %72, %74
  %76 = trunc i64 %75 to i32
  %77 = and i32 %76, 8388607
  %78 = or i32 %77, 1065353216
  %79 = bitcast i32 %78 to float
  %80 = fadd float %79, -1.000000e+00
  %81 = getelementptr inbounds float, float* %21, i64 %31
  store float %44, float* %81, align 4, !tbaa !77
  %82 = getelementptr inbounds float, float* %81, i64 1
  store float %56, float* %82, align 4, !tbaa !77
  %83 = getelementptr inbounds float, float* %81, i64 2
  store float %68, float* %83, align 4, !tbaa !77
  %84 = getelementptr inbounds float, float* %81, i64 3
  store float %80, float* %84, align 4, !tbaa !77
  %85 = add nuw nsw i64 %j.011, 1
  %exitcond17 = icmp eq i64 %85, 4
  br i1 %exitcond17, label %26, label %29

.preheader.loopexit:                              ; preds = %88
  %.lcssa = phi i64 [ %127, %88 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %._crit_edge14
  %evaluator.sroa.8.2.lcssa = phi i64 [ %evaluator.sroa.8.0.lcssa, %._crit_edge14 ], [ %.lcssa, %.preheader.loopexit ]
  %86 = icmp slt i64 %23, %17
  br i1 %86, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %87 = inttoptr i64 %3 to float*
  br label %144

; <label>:88                                      ; preds = %88, %.lr.ph9
  %i1.07 = phi i64 [ %19, %.lr.ph9 ], [ %142, %88 ]
  %evaluator.sroa.8.26 = phi i64 [ %evaluator.sroa.8.0.lcssa, %.lr.ph9 ], [ %127, %88 ]
  %89 = add i64 %i1.07, %evaluator.sroa.8.26
  %90 = mul i64 %89, 6364136223846793005
  %91 = add i64 %90, -2720673578348880933
  %92 = lshr i64 %89, 22
  %93 = xor i64 %92, %89
  %94 = lshr i64 %89, 61
  %95 = add nuw nsw i64 %94, 22
  %96 = lshr i64 %93, %95
  %97 = trunc i64 %96 to i32
  %98 = and i32 %97, 8388607
  %99 = or i32 %98, 1065353216
  %100 = bitcast i32 %99 to float
  %101 = fadd float %100, -1.000000e+00
  %102 = mul i64 %91, 6364136223846793005
  %103 = add i64 %102, -2720673578348880933
  %104 = lshr i64 %91, 22
  %105 = xor i64 %104, %91
  %106 = lshr i64 %91, 61
  %107 = add nuw nsw i64 %106, 22
  %108 = lshr i64 %105, %107
  %109 = trunc i64 %108 to i32
  %110 = and i32 %109, 8388607
  %111 = or i32 %110, 1065353216
  %112 = bitcast i32 %111 to float
  %113 = fadd float %112, -1.000000e+00
  %114 = mul i64 %103, 6364136223846793005
  %115 = add i64 %114, -2720673578348880933
  %116 = lshr i64 %103, 22
  %117 = xor i64 %116, %103
  %118 = lshr i64 %103, 61
  %119 = add nuw nsw i64 %118, 22
  %120 = lshr i64 %117, %119
  %121 = trunc i64 %120 to i32
  %122 = and i32 %121, 8388607
  %123 = or i32 %122, 1065353216
  %124 = bitcast i32 %123 to float
  %125 = fadd float %124, -1.000000e+00
  %126 = mul i64 %115, 6364136223846793005
  %127 = add i64 %126, -2720673578348880933
  %128 = lshr i64 %115, 22
  %129 = xor i64 %128, %115
  %130 = lshr i64 %115, 61
  %131 = add nuw nsw i64 %130, 22
  %132 = lshr i64 %129, %131
  %133 = trunc i64 %132 to i32
  %134 = and i32 %133, 8388607
  %135 = or i32 %134, 1065353216
  %136 = bitcast i32 %135 to float
  %137 = fadd float %136, -1.000000e+00
  %138 = getelementptr inbounds float, float* %25, i64 %i1.07
  store float %101, float* %138, align 4, !tbaa !77
  %139 = getelementptr inbounds float, float* %138, i64 1
  store float %113, float* %139, align 4, !tbaa !77
  %140 = getelementptr inbounds float, float* %138, i64 2
  store float %125, float* %140, align 4, !tbaa !77
  %141 = getelementptr inbounds float, float* %138, i64 3
  store float %137, float* %141, align 4, !tbaa !77
  %142 = add nsw i64 %i1.07, 4
  %143 = icmp slt i64 %142, %23
  br i1 %143, label %88, label %.preheader.loopexit

; <label>:144                                     ; preds = %144, %.lr.ph
  %i2.05 = phi i64 [ %23, %.lr.ph ], [ %159, %144 ]
  %evaluator.sroa.8.34 = phi i64 [ %evaluator.sroa.8.2.lcssa, %.lr.ph ], [ %147, %144 ]
  %145 = add i64 %i2.05, %evaluator.sroa.8.34
  %146 = mul i64 %145, 6364136223846793005
  %147 = add i64 %146, -2720673578348880933
  %148 = lshr i64 %145, 22
  %149 = xor i64 %148, %145
  %150 = lshr i64 %145, 61
  %151 = add nuw nsw i64 %150, 22
  %152 = lshr i64 %149, %151
  %153 = trunc i64 %152 to i32
  %154 = and i32 %153, 8388607
  %155 = or i32 %154, 1065353216
  %156 = bitcast i32 %155 to float
  %157 = fadd float %156, -1.000000e+00
  %158 = getelementptr inbounds float, float* %87, i64 %i2.05
  store float %157, float* %158, align 4, !tbaa !77
  %159 = add nsw i64 %i2.05, 1
  %exitcond = icmp eq i64 %159, %17
  br i1 %exitcond, label %._crit_edge.loopexit, label %144

._crit_edge.loopexit:                             ; preds = %144
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret void
}

; Function Attrs: nounwind
declare i32 @clock_gettime(i32, %struct.timespec*) #1

; Function Attrs: nounwind
declare i64 @random() #1

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_KNS7_INS0_17scalar_product_opIffEESA_SA_EEEEEENS_9GpuDeviceELb0EE3runERSI_RKSJ_(%"class.Eigen::TensorAssignOp.15"* nocapture readonly dereferenceable(16) %expr, %"struct.Eigen::GpuDevice"* dereferenceable(16) %device) #4 comdat align 2 {
  %1 = alloca i64, align 8
  %evaluator.sroa.4 = alloca [3 x i64], align 8
  %evaluator.sroa.15 = alloca [3 x i64], align 8
  %evaluator.sroa.18 = alloca [3 x i64], align 8
  %2 = alloca %"struct.Eigen::TensorEvaluator.17", align 8
  %3 = bitcast [3 x i64]* %evaluator.sroa.4 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %3)
  %4 = bitcast [3 x i64]* %evaluator.sroa.15 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %4)
  %5 = bitcast [3 x i64]* %evaluator.sroa.18 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %5)
  %6 = getelementptr inbounds %"class.Eigen::TensorAssignOp.15", %"class.Eigen::TensorAssignOp.15"* %expr, i64 0, i32 0
  %7 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %6, align 8, !tbaa !14
  %8 = bitcast %"class.Eigen::TensorMap"* %7 to i64*
  %9 = load i64, i64* %8, align 8, !tbaa !67
  %10 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %7, i64 0, i32 1
  %11 = bitcast %"struct.Eigen::DSizes"* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %11, i64 24, i32 8, i1 false)
  %12 = getelementptr inbounds %"class.Eigen::TensorAssignOp.15", %"class.Eigen::TensorAssignOp.15"* %expr, i64 0, i32 1
  %13 = load %"class.Eigen::TensorCwiseBinaryOp"*, %"class.Eigen::TensorCwiseBinaryOp"** %12, align 8, !tbaa !14
  %14 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 0
  %15 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %14, align 8, !tbaa !14
  %16 = bitcast %"class.Eigen::TensorMap"* %15 to <2 x i64>*
  %17 = load <2 x i64>, <2 x i64>* %16, align 8
  %18 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %15, i64 0, i32 1, i32 0, i32 0, i64 1
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %15, i64 0, i32 1, i32 0, i32 0, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 1, i32 0
  %23 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %22, align 8, !tbaa !14
  %24 = bitcast %"class.Eigen::TensorMap"* %23 to i64*
  %25 = load i64, i64* %24, align 8, !tbaa !67
  %26 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %23, i64 0, i32 1
  %27 = bitcast %"struct.Eigen::DSizes"* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %27, i64 24, i32 8, i1 false)
  %28 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 1, i32 1
  %29 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %28, align 8, !tbaa !14
  %30 = bitcast %"class.Eigen::TensorMap"* %29 to i64*
  %31 = load i64, i64* %30, align 8, !tbaa !67
  %32 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %29, i64 0, i32 1
  %33 = bitcast %"struct.Eigen::DSizes"* %32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %33, i64 24, i32 8, i1 false)
  %34 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %device, i64 0, i32 0
  %35 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %34, align 8, !tbaa !64
  %36 = bitcast %"class.Eigen::StreamInterface"* %35 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %37 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %36, align 8, !tbaa !17
  %38 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %37, i64 3
  %39 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %38, align 8
  %40 = tail call dereferenceable(632) %struct.cudaDeviceProp* %39(%"class.Eigen::StreamInterface"* %35)
  %41 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %40, i64 0, i32 6
  %42 = load i32, i32* %41, align 8, !tbaa !82
  %43 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %34, align 8, !tbaa !64
  %44 = bitcast %"class.Eigen::StreamInterface"* %43 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %45 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %44, align 8, !tbaa !17
  %46 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %45, i64 3
  %47 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %46, align 8
  %48 = tail call dereferenceable(632) %struct.cudaDeviceProp* %47(%"class.Eigen::StreamInterface"* %43)
  %49 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %48, i64 0, i32 16
  %50 = load i32, i32* %49, align 4, !tbaa !84
  %51 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %34, align 8, !tbaa !64
  %52 = bitcast %"class.Eigen::StreamInterface"* %51 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %53 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %52, align 8, !tbaa !17
  %54 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %53, i64 3
  %55 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %54, align 8
  %56 = tail call dereferenceable(632) %struct.cudaDeviceProp* %55(%"class.Eigen::StreamInterface"* %51)
  %57 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %56, i64 0, i32 53
  %58 = load i32, i32* %57, align 4, !tbaa !85
  %59 = mul nsw i32 %58, %50
  %60 = sdiv i32 %59, %42
  %61 = extractelement <2 x i64> %17, i32 1
  %62 = mul nsw i64 %19, %61
  %63 = mul nsw i64 %62, %21
  %64 = sext i32 %42 to i64
  %65 = add i64 %63, -1
  %66 = add i64 %65, %64
  %67 = sdiv i64 %66, %64
  %68 = trunc i64 %67 to i32
  %69 = icmp slt i32 %68, %60
  %70 = select i1 %69, i32 %68, i32 %60
  %71 = icmp slt i32 %70, 1
  %72 = select i1 %71, i32 1, i32 %70
  %73 = zext i32 %72 to i64
  %74 = or i64 %73, 4294967296
  %75 = zext i32 %42 to i64
  %76 = or i64 %75, 4294967296
  %77 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %34, align 8, !tbaa !64
  %78 = bitcast %"class.Eigen::StreamInterface"* %77 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %79 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %78, align 8, !tbaa !17
  %80 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %79, i64 2
  %81 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %80, align 8
  %82 = tail call dereferenceable(8) %struct.CUstream_st** %81(%"class.Eigen::StreamInterface"* %77)
  %83 = load %struct.CUstream_st*, %struct.CUstream_st** %82, align 8, !tbaa !16
  %84 = tail call i32 @cudaConfigureCall(i64 %74, i32 1, i64 %76, i32 1, i64 0, %struct.CUstream_st* %83)
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %183

; <label>:86                                      ; preds = %0
  %87 = bitcast %"struct.Eigen::TensorEvaluator.17"* %2 to i64*
  store i64 %9, i64* %87, align 8
  %88 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 0, i32 1
  %89 = bitcast %"struct.Eigen::DSizes"* %88 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %89, i8* %3, i64 24, i32 8, i1 false)
  %90 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %90, align 8
  %91 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 1
  %92 = bitcast %"struct.Eigen::TensorEvaluator.20"* %91 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %92, align 8
  %93 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 1, i32 1, i32 0, i32 0, i64 1
  store i64 %19, i64* %93, align 8
  %94 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 1, i32 1, i32 0, i32 0, i64 2
  store i64 %21, i64* %94, align 8
  %95 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %95, align 8
  %96 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 1
  %97 = bitcast %"struct.Eigen::TensorEvaluator.20"* %96 to i64*
  store i64 %25, i64* %97, align 8
  %98 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 1, i32 1
  %99 = bitcast %"struct.Eigen::DSizes"* %98 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %4, i64 24, i32 8, i1 false)
  %100 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %100, align 8
  %101 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 2
  %102 = bitcast %"struct.Eigen::TensorEvaluator.20"* %101 to i64*
  store i64 %31, i64* %102, align 8
  %103 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 2, i32 1
  %104 = bitcast %"struct.Eigen::DSizes"* %103 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %104, i8* %5, i64 24, i32 8, i1 false)
  %105 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i64 0, i32 1, i32 2, i32 2, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %105, align 8
  %106 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %106)
  store i64 %63, i64* %1, align 8, !tbaa !15
  %107 = bitcast %"struct.Eigen::TensorEvaluator.17"* %2 to i8*
  %loadCudaArg = load %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2
  %108 = icmp eq i32 0, 0
  br i1 %108, label %109, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_.exit

; <label>:109                                     ; preds = %86
  %loadCudaArg1 = load i64, i64* %1
  %110 = icmp eq i32 0, 0
  br i1 %110, label %111, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_.exit

; <label>:111                                     ; preds = %109
  %112 = getelementptr inbounds [247 x i8], [247 x i8]* @s._ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_, i32 0, i32 0
  %113 = getelementptr inbounds [6264 x i8], [6264 x i8]* @__opencl_sourcecode, i32 0, i32 0
  call void @configureKernel(i8* %112, i8* %113)
  %newalloca = alloca %"struct.Eigen::TensorEvaluator.17_nopointers"
  %114 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i32 0, i32 0
  %115 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17_nopointers", %"struct.Eigen::TensorEvaluator.17_nopointers"* %newalloca, i32 0, i32 0
  %116 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.18"* %114, i32 0, i32 1
  %117 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.18_nopointers", %"struct.Eigen::TensorEvaluator.18_nopointers"* %115, i32 0, i32 0
  %118 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %116, i32 0, i32 0
  %119 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %117, i32 0, i32 0
  %120 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %118, i32 0, i32 0
  %121 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %119, i32 0, i32 0
  %122 = getelementptr inbounds [3 x i64], [3 x i64]* %120, i32 0, i32 0
  %123 = getelementptr inbounds [3 x i64], [3 x i64]* %121, i32 0, i32 0
  %loadarr = load i64, i64* %122
  store volatile i64 %loadarr, i64* %123
  %124 = getelementptr inbounds [3 x i64], [3 x i64]* %120, i32 0, i32 1
  %125 = getelementptr inbounds [3 x i64], [3 x i64]* %121, i32 0, i32 1
  %loadarr2 = load i64, i64* %124
  store volatile i64 %loadarr2, i64* %125
  %126 = getelementptr inbounds [3 x i64], [3 x i64]* %120, i32 0, i32 2
  %127 = getelementptr inbounds [3 x i64], [3 x i64]* %121, i32 0, i32 2
  %loadarr3 = load i64, i64* %126
  store volatile i64 %loadarr3, i64* %127
  %128 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i32 0, i32 1
  %129 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17_nopointers", %"struct.Eigen::TensorEvaluator.17_nopointers"* %newalloca, i32 0, i32 1
  %130 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19", %"struct.Eigen::TensorEvaluator.19"* %128, i32 0, i32 0
  %131 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19_nopointers", %"struct.Eigen::TensorEvaluator.19_nopointers"* %129, i32 0, i32 0
  %132 = getelementptr inbounds %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::internal::scalar_sum_op"* %130, i32 0, i32 0
  %133 = getelementptr inbounds %"struct.Eigen::internal::scalar_sum_op_nopointers", %"struct.Eigen::internal::scalar_sum_op_nopointers"* %131, i32 0, i32 0
  %loadint = load i8, i8* %132
  store volatile i8 %loadint, i8* %133
  %134 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19", %"struct.Eigen::TensorEvaluator.19"* %128, i32 0, i32 1
  %135 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19_nopointers", %"struct.Eigen::TensorEvaluator.19_nopointers"* %129, i32 0, i32 1
  %136 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %134, i32 0, i32 1
  %137 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers"* %135, i32 0, i32 0
  %138 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %136, i32 0, i32 0
  %139 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %137, i32 0, i32 0
  %140 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %138, i32 0, i32 0
  %141 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %139, i32 0, i32 0
  %142 = getelementptr inbounds [3 x i64], [3 x i64]* %140, i32 0, i32 0
  %143 = getelementptr inbounds [3 x i64], [3 x i64]* %141, i32 0, i32 0
  %loadarr4 = load i64, i64* %142
  store volatile i64 %loadarr4, i64* %143
  %144 = getelementptr inbounds [3 x i64], [3 x i64]* %140, i32 0, i32 1
  %145 = getelementptr inbounds [3 x i64], [3 x i64]* %141, i32 0, i32 1
  %loadarr5 = load i64, i64* %144
  store volatile i64 %loadarr5, i64* %145
  %146 = getelementptr inbounds [3 x i64], [3 x i64]* %140, i32 0, i32 2
  %147 = getelementptr inbounds [3 x i64], [3 x i64]* %141, i32 0, i32 2
  %loadarr6 = load i64, i64* %146
  store volatile i64 %loadarr6, i64* %147
  %148 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19", %"struct.Eigen::TensorEvaluator.19"* %128, i32 0, i32 2
  %149 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19_nopointers", %"struct.Eigen::TensorEvaluator.19_nopointers"* %129, i32 0, i32 2
  %150 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %148, i32 0, i32 0
  %151 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21_nopointers", %"struct.Eigen::TensorEvaluator.21_nopointers"* %149, i32 0, i32 0
  %152 = getelementptr inbounds %"struct.Eigen::internal::scalar_product_op", %"struct.Eigen::internal::scalar_product_op"* %150, i32 0, i32 0
  %153 = getelementptr inbounds %"struct.Eigen::internal::scalar_product_op_nopointers", %"struct.Eigen::internal::scalar_product_op_nopointers"* %151, i32 0, i32 0
  %loadint7 = load i8, i8* %152
  store volatile i8 %loadint7, i8* %153
  %154 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %148, i32 0, i32 1
  %155 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21_nopointers", %"struct.Eigen::TensorEvaluator.21_nopointers"* %149, i32 0, i32 1
  %156 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %154, i32 0, i32 1
  %157 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers"* %155, i32 0, i32 0
  %158 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %156, i32 0, i32 0
  %159 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %157, i32 0, i32 0
  %160 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %158, i32 0, i32 0
  %161 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %159, i32 0, i32 0
  %162 = getelementptr inbounds [3 x i64], [3 x i64]* %160, i32 0, i32 0
  %163 = getelementptr inbounds [3 x i64], [3 x i64]* %161, i32 0, i32 0
  %loadarr8 = load i64, i64* %162
  store volatile i64 %loadarr8, i64* %163
  %164 = getelementptr inbounds [3 x i64], [3 x i64]* %160, i32 0, i32 1
  %165 = getelementptr inbounds [3 x i64], [3 x i64]* %161, i32 0, i32 1
  %loadarr9 = load i64, i64* %164
  store volatile i64 %loadarr9, i64* %165
  %166 = getelementptr inbounds [3 x i64], [3 x i64]* %160, i32 0, i32 2
  %167 = getelementptr inbounds [3 x i64], [3 x i64]* %161, i32 0, i32 2
  %loadarr10 = load i64, i64* %166
  store volatile i64 %loadarr10, i64* %167
  %168 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %148, i32 0, i32 2
  %169 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21_nopointers", %"struct.Eigen::TensorEvaluator.21_nopointers"* %149, i32 0, i32 2
  %170 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %168, i32 0, i32 1
  %171 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers"* %169, i32 0, i32 0
  %172 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %170, i32 0, i32 0
  %173 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %171, i32 0, i32 0
  %174 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %172, i32 0, i32 0
  %175 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %173, i32 0, i32 0
  %176 = getelementptr inbounds [3 x i64], [3 x i64]* %174, i32 0, i32 0
  %177 = getelementptr inbounds [3 x i64], [3 x i64]* %175, i32 0, i32 0
  %loadarr11 = load i64, i64* %176
  store volatile i64 %loadarr11, i64* %177
  %178 = getelementptr inbounds [3 x i64], [3 x i64]* %174, i32 0, i32 1
  %179 = getelementptr inbounds [3 x i64], [3 x i64]* %175, i32 0, i32 1
  %loadarr12 = load i64, i64* %178
  store volatile i64 %loadarr12, i64* %179
  %180 = getelementptr inbounds [3 x i64], [3 x i64]* %174, i32 0, i32 2
  %181 = getelementptr inbounds [3 x i64], [3 x i64]* %175, i32 0, i32 2
  %loadarr13 = load i64, i64* %180
  store volatile i64 %loadarr13, i64* %181
  %182 = bitcast %"struct.Eigen::TensorEvaluator.17_nopointers"* %newalloca to i8*
  call void @_Z18setKernelArgStructPci(i8* %182, i32 112)
  %getfloatstaraddr = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i32 0, i32 0, i32 0
  %loadgep = load float*, float** %getfloatstaraddr
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep)
  %getfloatstaraddr14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i32 0, i32 1, i32 1, i32 0
  %loadgep15 = load float*, float** %getfloatstaraddr14
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep15)
  %getfloatstaraddr16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i32 0, i32 1, i32 2, i32 1, i32 0
  %loadgep17 = load float*, float** %getfloatstaraddr16
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep17)
  %getfloatstaraddr18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %2, i32 0, i32 1, i32 2, i32 2, i32 0
  %loadgep19 = load float*, float** %getfloatstaraddr18
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep19)
  call void @_Z17setKernelArgInt64l(i64 %loadCudaArg1)
  call void @_Z8kernelGov()
  br label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_.exit

_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_.exit: ; preds = %111, %109, %86
  call void @llvm.lifetime.end(i64 8, i8* %106)
  br label %183

; <label>:183                                     ; preds = %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_.exit, %0
  %184 = call i32 @cudaGetLastError()
  %185 = icmp eq i32 %184, 0
  br i1 %185, label %187, label %186

; <label>:186                                     ; preds = %183
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([34 x i8], [34 x i8]* @.str.48, i64 0, i64 0), i8* nonnull getelementptr inbounds ([69 x i8], [69 x i8]* @.str.49, i64 0, i64 0), i32 262, i8* nonnull getelementptr inbounds ([1051 x i8], [1051 x i8]* @__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_KNS7_INS0_17scalar_product_opIffEESA_SA_EEEEEENS_9GpuDeviceELb0EE3runERSI_RKSJ_, i64 0, i64 0)) #21
  unreachable

; <label>:187                                     ; preds = %183
  call void @llvm.lifetime.end(i64 24, i8* %3)
  call void @llvm.lifetime.end(i64 24, i8* %4)
  call void @llvm.lifetime.end(i64 24, i8* %5)
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #0

; Function Attrs: uwtable
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.17"* %eval, i64 %size) #4 comdat {
  %1 = alloca i64, align 8
  store i64 %size, i64* %1, align 8, !tbaa !15
  %2 = bitcast %"struct.Eigen::TensorEvaluator.17"* %eval to i8*
  %loadCudaArg = load %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %79

; <label>:4                                       ; preds = %0
  %5 = bitcast i64* %1 to i8*
  %loadCudaArg1 = load i64, i64* %1
  %6 = icmp eq i32 0, 0
  br i1 %6, label %7, label %79

; <label>:7                                       ; preds = %4
  %8 = getelementptr inbounds [247 x i8], [247 x i8]* @s._ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_, i32 0, i32 0
  %9 = getelementptr inbounds [6264 x i8], [6264 x i8]* @__opencl_sourcecode, i32 0, i32 0
  call void @configureKernel(i8* %8, i8* %9)
  %newalloca = alloca %"struct.Eigen::TensorEvaluator.17_nopointers"
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17_nopointers", %"struct.Eigen::TensorEvaluator.17_nopointers"* %newalloca, i32 0, i32 0
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.18"* %10, i32 0, i32 1
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.18_nopointers", %"struct.Eigen::TensorEvaluator.18_nopointers"* %11, i32 0, i32 0
  %14 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %12, i32 0, i32 0
  %15 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %13, i32 0, i32 0
  %16 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %14, i32 0, i32 0
  %17 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %15, i32 0, i32 0
  %18 = getelementptr inbounds [3 x i64], [3 x i64]* %16, i32 0, i32 0
  %19 = getelementptr inbounds [3 x i64], [3 x i64]* %17, i32 0, i32 0
  %loadarr = load i64, i64* %18
  store volatile i64 %loadarr, i64* %19
  %20 = getelementptr inbounds [3 x i64], [3 x i64]* %16, i32 0, i32 1
  %21 = getelementptr inbounds [3 x i64], [3 x i64]* %17, i32 0, i32 1
  %loadarr2 = load i64, i64* %20
  store volatile i64 %loadarr2, i64* %21
  %22 = getelementptr inbounds [3 x i64], [3 x i64]* %16, i32 0, i32 2
  %23 = getelementptr inbounds [3 x i64], [3 x i64]* %17, i32 0, i32 2
  %loadarr3 = load i64, i64* %22
  store volatile i64 %loadarr3, i64* %23
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i32 0, i32 1
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17_nopointers", %"struct.Eigen::TensorEvaluator.17_nopointers"* %newalloca, i32 0, i32 1
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19", %"struct.Eigen::TensorEvaluator.19"* %24, i32 0, i32 0
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19_nopointers", %"struct.Eigen::TensorEvaluator.19_nopointers"* %25, i32 0, i32 0
  %28 = getelementptr inbounds %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::internal::scalar_sum_op"* %26, i32 0, i32 0
  %29 = getelementptr inbounds %"struct.Eigen::internal::scalar_sum_op_nopointers", %"struct.Eigen::internal::scalar_sum_op_nopointers"* %27, i32 0, i32 0
  %loadint = load i8, i8* %28
  store volatile i8 %loadint, i8* %29
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19", %"struct.Eigen::TensorEvaluator.19"* %24, i32 0, i32 1
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19_nopointers", %"struct.Eigen::TensorEvaluator.19_nopointers"* %25, i32 0, i32 1
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %30, i32 0, i32 1
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers"* %31, i32 0, i32 0
  %34 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %32, i32 0, i32 0
  %35 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %33, i32 0, i32 0
  %36 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %34, i32 0, i32 0
  %37 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %35, i32 0, i32 0
  %38 = getelementptr inbounds [3 x i64], [3 x i64]* %36, i32 0, i32 0
  %39 = getelementptr inbounds [3 x i64], [3 x i64]* %37, i32 0, i32 0
  %loadarr4 = load i64, i64* %38
  store volatile i64 %loadarr4, i64* %39
  %40 = getelementptr inbounds [3 x i64], [3 x i64]* %36, i32 0, i32 1
  %41 = getelementptr inbounds [3 x i64], [3 x i64]* %37, i32 0, i32 1
  %loadarr5 = load i64, i64* %40
  store volatile i64 %loadarr5, i64* %41
  %42 = getelementptr inbounds [3 x i64], [3 x i64]* %36, i32 0, i32 2
  %43 = getelementptr inbounds [3 x i64], [3 x i64]* %37, i32 0, i32 2
  %loadarr6 = load i64, i64* %42
  store volatile i64 %loadarr6, i64* %43
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19", %"struct.Eigen::TensorEvaluator.19"* %24, i32 0, i32 2
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.19_nopointers", %"struct.Eigen::TensorEvaluator.19_nopointers"* %25, i32 0, i32 2
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %44, i32 0, i32 0
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21_nopointers", %"struct.Eigen::TensorEvaluator.21_nopointers"* %45, i32 0, i32 0
  %48 = getelementptr inbounds %"struct.Eigen::internal::scalar_product_op", %"struct.Eigen::internal::scalar_product_op"* %46, i32 0, i32 0
  %49 = getelementptr inbounds %"struct.Eigen::internal::scalar_product_op_nopointers", %"struct.Eigen::internal::scalar_product_op_nopointers"* %47, i32 0, i32 0
  %loadint7 = load i8, i8* %48
  store volatile i8 %loadint7, i8* %49
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %44, i32 0, i32 1
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21_nopointers", %"struct.Eigen::TensorEvaluator.21_nopointers"* %45, i32 0, i32 1
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %50, i32 0, i32 1
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers"* %51, i32 0, i32 0
  %54 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %52, i32 0, i32 0
  %55 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %53, i32 0, i32 0
  %56 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %54, i32 0, i32 0
  %57 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %55, i32 0, i32 0
  %58 = getelementptr inbounds [3 x i64], [3 x i64]* %56, i32 0, i32 0
  %59 = getelementptr inbounds [3 x i64], [3 x i64]* %57, i32 0, i32 0
  %loadarr8 = load i64, i64* %58
  store volatile i64 %loadarr8, i64* %59
  %60 = getelementptr inbounds [3 x i64], [3 x i64]* %56, i32 0, i32 1
  %61 = getelementptr inbounds [3 x i64], [3 x i64]* %57, i32 0, i32 1
  %loadarr9 = load i64, i64* %60
  store volatile i64 %loadarr9, i64* %61
  %62 = getelementptr inbounds [3 x i64], [3 x i64]* %56, i32 0, i32 2
  %63 = getelementptr inbounds [3 x i64], [3 x i64]* %57, i32 0, i32 2
  %loadarr10 = load i64, i64* %62
  store volatile i64 %loadarr10, i64* %63
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %44, i32 0, i32 2
  %65 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21_nopointers", %"struct.Eigen::TensorEvaluator.21_nopointers"* %45, i32 0, i32 2
  %66 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %64, i32 0, i32 1
  %67 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20_nopointers", %"struct.Eigen::TensorEvaluator.20_nopointers"* %65, i32 0, i32 0
  %68 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %66, i32 0, i32 0
  %69 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %67, i32 0, i32 0
  %70 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %68, i32 0, i32 0
  %71 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %69, i32 0, i32 0
  %72 = getelementptr inbounds [3 x i64], [3 x i64]* %70, i32 0, i32 0
  %73 = getelementptr inbounds [3 x i64], [3 x i64]* %71, i32 0, i32 0
  %loadarr11 = load i64, i64* %72
  store volatile i64 %loadarr11, i64* %73
  %74 = getelementptr inbounds [3 x i64], [3 x i64]* %70, i32 0, i32 1
  %75 = getelementptr inbounds [3 x i64], [3 x i64]* %71, i32 0, i32 1
  %loadarr12 = load i64, i64* %74
  store volatile i64 %loadarr12, i64* %75
  %76 = getelementptr inbounds [3 x i64], [3 x i64]* %70, i32 0, i32 2
  %77 = getelementptr inbounds [3 x i64], [3 x i64]* %71, i32 0, i32 2
  %loadarr13 = load i64, i64* %76
  store volatile i64 %loadarr13, i64* %77
  %78 = bitcast %"struct.Eigen::TensorEvaluator.17_nopointers"* %newalloca to i8*
  call void @_Z18setKernelArgStructPci(i8* %78, i32 112)
  %getfloatstaraddr = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i32 0, i32 0, i32 0
  %loadgep = load float*, float** %getfloatstaraddr
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep)
  %getfloatstaraddr14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i32 0, i32 1, i32 1, i32 0
  %loadgep15 = load float*, float** %getfloatstaraddr14
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep15)
  %getfloatstaraddr16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i32 0, i32 1, i32 2, i32 1, i32 0
  %loadgep17 = load float*, float** %getfloatstaraddr16
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep17)
  %getfloatstaraddr18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i32 0, i32 1, i32 2, i32 2, i32 0
  %loadgep19 = load float*, float** %getfloatstaraddr18
  call void @_Z21setKernelArgFloatStarPf(float* %loadgep19)
  call void @_Z17setKernelArgInt64l(i64 %loadCudaArg1)
  call void @_Z8kernelGov()
  br label %79

; <label>:79                                      ; preds = %7, %4, %0
  ret void
}

declare i32 @cudaGetLastError() #0

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: nounwind readnone
declare float @fabsf(float) #10

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"*, double) #0

; Function Attrs: nounwind readnone
declare float @sqrtf(float) #10

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_test_cuda_elementwise.cu() #4 section ".text.startup" personality i32 (...)* @__gxx_personality_v0 {
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

declare void @configureKernel(i8*, i8*)

declare void @_Z18setKernelArgStructPci(i8*, i32)

declare void @_Z21setKernelArgFloatStarPf(float*)

declare void @_Z17setKernelArgInt64l(i64)

declare void @_Z8kernelGov()

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
!36 = !{!"_ZTSN5Eigen13TensorStorageIfNS_6DSizesIlLi3EEELi0EEE", !4, i64 0, !37, i64 8}
!37 = !{!"_ZTSN5Eigen6DSizesIlLi3EEE"}
!38 = !{!39}
!39 = distinct !{!39, !40, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE6randomEv: %agg.result"}
!40 = distinct !{!40, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE6randomEv"}
!41 = !{!42, !11, i64 8}
!42 = !{!"_ZTS8timespec", !11, i64 0, !11, i64 8}
!43 = !{!44, !39}
!44 = distinct !{!44, !45, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_: %agg.result"}
!45 = distinct !{!45, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_"}
!46 = !{!47, !11, i64 0}
!47 = !{!"_ZTSN5Eigen8internal22UniformRandomGeneratorIfEE", !11, i64 0}
!48 = !{!49, !4, i64 0}
!49 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_6TensorIfLi3ELi0ElEENS_13DefaultDeviceEEE", !4, i64 0, !37, i64 8, !5, i64 32}
!50 = !{!51, !4, i64 0}
!51 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_6TensorIfLi3ELi0ElEENS_13DefaultDeviceEEE", !4, i64 0, !37, i64 8, !5, i64 32}
!52 = !{!53}
!53 = distinct !{!53, !54, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE6randomEv: %agg.result"}
!54 = distinct !{!54, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE6randomEv"}
!55 = !{!56, !53}
!56 = distinct !{!56, !57, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_: %agg.result"}
!57 = distinct !{!57, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_"}
!58 = !{!59}
!59 = distinct !{!59, !60, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE6randomEv: %agg.result"}
!60 = distinct !{!60, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE6randomEv"}
!61 = !{!62, !59}
!62 = distinct !{!62, !63, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_: %agg.result"}
!63 = distinct !{!63, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi3ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_"}
!64 = !{!65, !4, i64 0}
!65 = !{!"_ZTSN5Eigen9GpuDeviceE", !4, i64 0, !24, i64 8}
!66 = !{!65, !24, i64 8}
!67 = !{!68, !4, i64 0}
!68 = !{!"_ZTSN5Eigen9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEE", !4, i64 0, !37, i64 8}
!69 = !{!70, !72}
!70 = distinct !{!70, !71, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEELi0EE10binaryExprINS_8internal13scalar_sum_opIffEENS_19TensorCwiseBinaryOpINS7_17scalar_product_opIffEEKS4_SD_EEEEKNSA_IT_SD_KT0_EERSH_RKSF_: %agg.result"}
!71 = distinct !{!71, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEELi0EE10binaryExprINS_8internal13scalar_sum_opIffEENS_19TensorCwiseBinaryOpINS7_17scalar_product_opIffEEKS4_SD_EEEEKNSA_IT_SD_KT0_EERSH_RKSF_"}
!72 = distinct !{!72, !73, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEELi0EEplINS_19TensorCwiseBinaryOpINS_8internal17scalar_product_opIffEEKS4_SB_EEEEKNS7_INS8_13scalar_sum_opIffEESB_KT_EERSG_: %agg.result"}
!73 = distinct !{!73, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEELi0EEplINS_19TensorCwiseBinaryOpINS_8internal17scalar_product_opIffEEKS4_SB_EEEEKNS7_INS8_13scalar_sum_opIffEESB_KT_EERSG_"}
!74 = !{!75, !4, i64 24}
!75 = !{!"_ZTSN5Eigen16CudaStreamDeviceE", !4, i64 8, !24, i64 16, !4, i64 24, !4, i64 32}
!76 = !{!75, !24, i64 16}
!77 = !{!78, !78, i64 0}
!78 = !{!"float", !5, i64 0}
!79 = !{!75, !4, i64 8}
!80 = !{!75, !4, i64 32}
!81 = !{i64 0, i64 24, !14}
!82 = !{!83, !24, i64 288}
!83 = !{!"_ZTS14cudaDeviceProp", !5, i64 0, !11, i64 256, !11, i64 264, !24, i64 272, !24, i64 276, !11, i64 280, !24, i64 288, !5, i64 292, !5, i64 304, !24, i64 316, !11, i64 320, !24, i64 328, !24, i64 332, !11, i64 336, !11, i64 344, !24, i64 352, !24, i64 356, !24, i64 360, !24, i64 364, !24, i64 368, !24, i64 372, !24, i64 376, !24, i64 380, !24, i64 384, !5, i64 388, !5, i64 396, !5, i64 404, !5, i64 416, !5, i64 424, !5, i64 436, !24, i64 448, !5, i64 452, !5, i64 460, !5, i64 472, !24, i64 480, !5, i64 484, !5, i64 492, !5, i64 504, !5, i64 512, !24, i64 524, !5, i64 528, !11, i64 536, !24, i64 544, !24, i64 548, !24, i64 552, !24, i64 556, !24, i64 560, !24, i64 564, !24, i64 568, !24, i64 572, !24, i64 576, !24, i64 580, !24, i64 584, !24, i64 588, !24, i64 592, !24, i64 596, !24, i64 600, !11, i64 608, !24, i64 616, !24, i64 620, !24, i64 624, !24, i64 628}
!84 = !{!83, !24, i64 356}
!85 = !{!83, !24, i64 588}
