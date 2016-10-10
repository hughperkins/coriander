; ModuleID = 'test/eigen/test_cuda_elementwise_small.cu'
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
%"class.Eigen::TensorAssignOp.30" = type { %"class.Eigen::TensorMap"*, %"class.Eigen::TensorCwiseBinaryOp"* }
%"class.Eigen::TensorMap" = type { float*, %"struct.Eigen::DSizes" }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [1 x i64] }
%"class.Eigen::TensorCwiseBinaryOp" = type <{ %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"*, %"struct.Eigen::internal::scalar_sum_op", [7 x i8] }>
%"struct.Eigen::internal::scalar_sum_op" = type { i8 }
%struct.timespec = type { i64, i64 }
%"class.Eigen::TensorAssignOp" = type { %"class.Eigen::Tensor"*, %"class.Eigen::TensorCwiseNullaryOp"* }
%"class.Eigen::Tensor" = type { %"class.Eigen::TensorStorage" }
%"class.Eigen::TensorStorage" = type { float*, %"struct.Eigen::DSizes" }
%"class.Eigen::TensorCwiseNullaryOp" = type { %"class.Eigen::Tensor"*, %"class.Eigen::internal::UniformRandomGenerator" }
%"class.Eigen::internal::UniformRandomGenerator" = type { i64 }
%"struct.Eigen::DefaultDevice" = type { i8 }
%"class.Eigen::CudaStreamDevice" = type { %"class.Eigen::StreamInterface", %struct.CUstream_st**, i32, i8*, i32* }
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::TensorBase.3" = type { i8 }
%"class.Eigen::Map" = type { %"class.Eigen::MapBase.base", %"class.Eigen::Stride", [5 x i8] }
%"class.Eigen::MapBase.base" = type <{ float*, %"class.Eigen::internal::variable_if_dynamic", %"class.Eigen::internal::variable_if_dynamic.17" }>
%"class.Eigen::internal::variable_if_dynamic" = type { i64 }
%"class.Eigen::internal::variable_if_dynamic.17" = type { i8 }
%"class.Eigen::Stride" = type { %"class.Eigen::internal::variable_if_dynamic.18", %"class.Eigen::internal::variable_if_dynamic.18" }
%"class.Eigen::internal::variable_if_dynamic.18" = type { i8 }
%"class.Eigen::DenseBase" = type { i8 }
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"class.Eigen::Array" = type { %"class.Eigen::PlainObjectBase" }
%"class.Eigen::PlainObjectBase" = type { %"class.Eigen::DenseStorage" }
%"class.Eigen::DenseStorage" = type { float*, i64 }
%"struct.Eigen::IOFormat" = type { %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string", i32, i32 }
%"struct.Eigen::TensorEvaluator.32" = type { %"struct.Eigen::TensorEvaluator.33", %"struct.Eigen::TensorEvaluator.34" }
%"struct.Eigen::TensorEvaluator.33" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.34" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35" }
%"struct.Eigen::TensorEvaluator.35" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }

$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev = comdat any

$_Z22set_repeat_from_stringPKc = comdat any

$_Z20set_seed_from_stringPKc = comdat any

$_ZN5EigenlsINS_6TensorIfLi1ELi0ElEEEERSoS3_RKNS_10TensorBaseIT_Li0EEE = comdat any

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

$_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_ = comdat any

$_ZN5EigenlsINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEEERSoS8_RKNS_9DenseBaseIT_EE = comdat any

$_ZN5Eigen8internal12print_matrixINS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEEEERSoS4_RKT_RKNS_8IOFormatE = comdat any

$_ZN5Eigen8IOFormatC2EiiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_S8_S8_S8_ = comdat any

$_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_SA_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

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
@.str.23 = private unnamed_addr constant [23 x i8] c"cuda_elementwise_small\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"in1 \00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"in2 \00", align 1
@.str.26 = private unnamed_addr constant [106 x i8] c"cudaMemcpyAsync(out.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess\00", align 1
@.str.27 = private unnamed_addr constant [42 x i8] c"test/eigen/test_cuda_elementwise_small.cu\00", align 1
@__PRETTY_FUNCTION__._Z27test_cuda_elementwise_smallv = private unnamed_addr constant [35 x i8] c"void test_cuda_elementwise_small()\00", align 1
@.str.28 = private unnamed_addr constant [58 x i8] c"cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess\00", align 1
@.str.29 = private unnamed_addr constant [5 x i8] c"out \00", align 1
@.str.30 = private unnamed_addr constant [149 x i8] c"verifyIsApprox( out(Eigen::array<Eigen::DenseIndex, 1>(i)), in1(Eigen::array<Eigen::DenseIndex, 1>(i)) + in2(Eigen::array<Eigen::DenseIndex, 1>(i)))\00", align 1
@.str.31 = private unnamed_addr constant [22 x i8] c"Invalid repeat value \00", align 1
@.str.32 = private unnamed_addr constant [20 x i8] c"Invalid seed value \00", align 1
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
@.str.33 = private unnamed_addr constant [43 x i8] c"Failed to get the number of CUDA devices: \00", align 1
@.str.34 = private unnamed_addr constant [22 x i8] c"status == cudaSuccess\00", align 1
@.str.35 = private unnamed_addr constant [71 x i8] c"/usr/local/eigen/unsupported/Eigen/CXX11/src/Tensor/TensorDeviceCuda.h\00", align 1
@__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv = private unnamed_addr constant [35 x i8] c"void Eigen::initializeDeviceProp()\00", align 1
@_ZN5EigenL18m_devicePropertiesE = internal unnamed_addr global %struct.cudaDeviceProp* null, align 8
@.str.36 = private unnamed_addr constant [35 x i8] c"Failed to initialize CUDA device #\00", align 1
@.str.37 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.38 = private unnamed_addr constant [19 x i8] c"err == cudaSuccess\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm = private unnamed_addr constant [62 x i8] c"virtual void *Eigen::CudaStreamDevice::allocate(size_t) const\00", align 1
@.str.39 = private unnamed_addr constant [15 x i8] c"result != NULL\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv = private unnamed_addr constant [63 x i8] c"virtual void Eigen::CudaStreamDevice::deallocate(void *) const\00", align 1
@.str.40 = private unnamed_addr constant [15 x i8] c"buffer != NULL\00", align 1
@__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice9semaphoreEv = private unnamed_addr constant [65 x i8] c"virtual unsigned int *Eigen::CudaStreamDevice::semaphore() const\00", align 1
@.str.42 = private unnamed_addr constant [6 x i8] c"Test \00", align 1
@.str.43 = private unnamed_addr constant [12 x i8] c" failed in \00", align 1
@.str.44 = private unnamed_addr constant [3 x i8] c" (\00", align 1
@.str.45 = private unnamed_addr constant [5 x i8] c"    \00", align 1
@.str.46 = private unnamed_addr constant [8 x i8] c"Stack:\0A\00", align 1
@.str.47 = private unnamed_addr constant [5 x i8] c"  - \00", align 1
@.str.48 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.49 = private unnamed_addr constant [42 x i8] c"basic_string::_M_construct null not valid\00", align 1
@_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [10 x i8*]
@_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [16 x i8*]
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external unnamed_addr constant [16 x i8*]
@_ZTISt9bad_alloc = external constant i8*
@_ZTVSt9bad_alloc = external unnamed_addr constant [5 x i8*], align 8
@.str.53 = private unnamed_addr constant [34 x i8] c"cudaGetLastError() == cudaSuccess\00", align 1
@.str.54 = private unnamed_addr constant [69 x i8] c"/usr/local/eigen/unsupported/Eigen/CXX11/src/Tensor/TensorExecutor.h\00", align 1
@__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_SA_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_ = private unnamed_addr constant [763 x i8] c"static void Eigen::internal::TensorExecutor<const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 1, 0, long>, 16>, const Eigen::TensorCwiseBinaryOp<Eigen::internal::scalar_sum_op<float, float>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, long>, 16>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, long>, 16> > >, Eigen::GpuDevice, true>::run(const Expression &, const Eigen::GpuDevice &) [Expression = const Eigen::TensorAssignOp<Eigen::TensorMap<Eigen::Tensor<float, 1, 0, long>, 16>, const Eigen::TensorCwiseBinaryOp<Eigen::internal::scalar_sum_op<float, float>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, long>, 16>, const Eigen::TensorMap<Eigen::Tensor<float, 1, 0, long>, 16> > >, Device = Eigen::GpuDevice, Vectorizable = true]\00", align 1
@.str.55 = private unnamed_addr constant [36 x i8] c"Difference too large wrt tolerance \00", align 1
@.str.56 = private unnamed_addr constant [22 x i8] c", relative error is: \00", align 1
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_test_cuda_elementwise_small.cu, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]
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

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit, %336
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
  store i64 22, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %373 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %2, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
          to label %.noexc32 unwind label %443

.noexc32:                                         ; preds = %_ZNSolsEPFRSoS_E.exit
  %374 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 0, i32 0
  store i8* %373, i8** %374, align 8, !tbaa !8
  %375 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %376 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 2, i32 0
  store i64 %375, i64* %376, align 8, !tbaa !15
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %373, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.23, i64 0, i64 0), i64 22, i32 1, i1 false) #2
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

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread: ; preds = %388, %390
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

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36: ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35, %400
  invoke void @_Z27test_cuda_elementwise_smallv()
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

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit: ; preds = %401, %418
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

; <label>:429                                     ; preds = %354, %.noexc61, %361, %.noexc29, %.noexc28, %341, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %_ZNSolsEj.exit, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22, %_ZNKSt5ctypeIcE5widenEc.exit57, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24
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

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37: ; preds = %443, %447, %453, %442, %433, %429
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

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, %470
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
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31, i64 0, i64 0), i64 21)
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
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.32, i64 0, i64 0), i64 19)
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
define void @_Z27test_cuda_elementwise_smallv() #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i:
  %assign.i = alloca %"class.Eigen::TensorAssignOp.30", align 8
  %ts.i.i.i.i.i18 = alloca %struct.timespec, align 8
  %assign.i.i19 = alloca %"class.Eigen::TensorAssignOp", align 8
  %0 = alloca %"struct.Eigen::DefaultDevice", align 1
  %1 = alloca %"class.Eigen::TensorCwiseNullaryOp", align 8
  %ts.i.i.i.i.i = alloca %struct.timespec, align 8
  %assign.i.i = alloca %"class.Eigen::TensorAssignOp", align 8
  %2 = alloca %"struct.Eigen::DefaultDevice", align 1
  %3 = alloca %"class.Eigen::TensorCwiseNullaryOp", align 8
  %in1 = alloca %"class.Eigen::Tensor", align 8
  %in2 = alloca %"class.Eigen::Tensor", align 8
  %out = alloca %"class.Eigen::Tensor", align 8
  %d_in1 = alloca float*, align 8
  %d_in2 = alloca float*, align 8
  %d_out = alloca float*, align 8
  %stream = alloca %"class.Eigen::CudaStreamDevice", align 8
  %gpu_device = alloca %"struct.Eigen::GpuDevice", align 8
  %gpu_in1 = alloca %"class.Eigen::TensorMap", align 8
  %gpu_in2 = alloca %"class.Eigen::TensorMap", align 8
  %gpu_out = alloca %"class.Eigen::TensorMap", align 8
  %4 = alloca %"class.Eigen::TensorCwiseBinaryOp", align 8
  %5 = alloca float, align 4
  %6 = bitcast %"class.Eigen::Tensor"* %in1 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %6) #2
  %7 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 0
  %8 = tail call noalias i8* @malloc(i64 8) #2
  %9 = icmp eq i8* %8, null
  br i1 %9, label %10, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i5

; <label>:10                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i5: ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  %11 = bitcast %"class.Eigen::Tensor"* %in1 to i8**
  store i8* %8, i8** %11, align 8, !tbaa !35
  %12 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in1, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i64 2, i64* %12, align 8, !tbaa !14
  %13 = bitcast %"class.Eigen::Tensor"* %in2 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %13) #2
  %14 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 0
  %15 = tail call noalias i8* @malloc(i64 8) #2
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i11

; <label>:17                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i5
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc8 unwind label %200

.noexc8:                                          ; preds = %17
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i11: ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i5
  %18 = bitcast %"class.Eigen::Tensor"* %in2 to i8**
  store i8* %15, i8** %18, align 8, !tbaa !35
  %19 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %in2, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i64 2, i64* %19, align 8, !tbaa !14
  %20 = bitcast %"class.Eigen::Tensor"* %out to i8*
  call void @llvm.lifetime.start(i64 16, i8* %20) #2
  %21 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %out, i64 0, i32 0, i32 0
  %22 = tail call noalias i8* @malloc(i64 8) #2
  %23 = icmp eq i8* %22, null
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i11
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc15 unwind label %204

.noexc15:                                         ; preds = %24
  unreachable

; <label>:25                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i11
  %26 = bitcast %"class.Eigen::Tensor"* %out to i8**
  store i8* %22, i8** %26, align 8, !tbaa !35
  %27 = getelementptr inbounds %"class.Eigen::Tensor", %"class.Eigen::Tensor"* %out, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i64 2, i64* %27, align 8, !tbaa !14
  %28 = bitcast %"class.Eigen::TensorCwiseNullaryOp"* %3 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %28)
  %29 = bitcast %struct.timespec* %ts.i.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %29) #2, !noalias !38
  %30 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i.i) #2, !noalias !38
  %31 = call i64 @random() #2, !noalias !38
  %32 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i.i, i64 0, i32 1
  %33 = load i64, i64* %32, align 8, !tbaa !41, !noalias !38
  %34 = xor i64 %33, %31
  call void @llvm.lifetime.end(i64 16, i8* %29) #2, !noalias !38
  %35 = mul i64 %34, 6364136223846793005
  %36 = add i64 %35, -2720673578348880933
  %37 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %3, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in1, %"class.Eigen::Tensor"** %37, align 8, !tbaa !14, !alias.scope !43
  %38 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %3, i64 0, i32 1, i32 0
  store i64 %36, i64* %38, align 8, !tbaa !46, !alias.scope !43
  %39 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %2, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %39)
  %40 = bitcast %"class.Eigen::TensorAssignOp"* %assign.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %40) #2
  %41 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in1, %"class.Eigen::Tensor"** %41, align 8, !tbaa !14
  %42 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp"* %3, %"class.Eigen::TensorCwiseNullaryOp"** %42, align 8, !tbaa !14
  %43 = load i64, i64* %12, align 8
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %49, label %45

; <label>:45                                      ; preds = %25
  %46 = sdiv i64 9223372036854775807, %43
  %47 = icmp slt i64 %46, 1
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc17 unwind label %208

.noexc17:                                         ; preds = %48
  unreachable

; <label>:49                                      ; preds = %45, %25
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %assign.i.i, %"struct.Eigen::DefaultDevice"* nonnull dereferenceable(1) %2)
  call void @llvm.lifetime.end(i64 16, i8* %40) #2
  call void @llvm.lifetime.end(i64 1, i8* %39)
  call void @llvm.lifetime.end(i64 16, i8* %28)
  %50 = bitcast %"class.Eigen::TensorCwiseNullaryOp"* %1 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %50)
  %51 = bitcast %struct.timespec* %ts.i.i.i.i.i18 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %51) #2, !noalias !48
  %52 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %ts.i.i.i.i.i18) #2, !noalias !48
  %53 = call i64 @random() #2, !noalias !48
  %54 = getelementptr inbounds %struct.timespec, %struct.timespec* %ts.i.i.i.i.i18, i64 0, i32 1
  %55 = load i64, i64* %54, align 8, !tbaa !41, !noalias !48
  %56 = xor i64 %55, %53
  call void @llvm.lifetime.end(i64 16, i8* %51) #2, !noalias !48
  %57 = mul i64 %56, 6364136223846793005
  %58 = add i64 %57, -2720673578348880933
  %59 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %1, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in2, %"class.Eigen::Tensor"** %59, align 8, !tbaa !14, !alias.scope !51
  %60 = getelementptr inbounds %"class.Eigen::TensorCwiseNullaryOp", %"class.Eigen::TensorCwiseNullaryOp"* %1, i64 0, i32 1, i32 0
  store i64 %58, i64* %60, align 8, !tbaa !46, !alias.scope !51
  %61 = getelementptr inbounds %"struct.Eigen::DefaultDevice", %"struct.Eigen::DefaultDevice"* %0, i64 0, i32 0
  call void @llvm.lifetime.start(i64 1, i8* %61)
  %62 = bitcast %"class.Eigen::TensorAssignOp"* %assign.i.i19 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %62) #2
  %63 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i19, i64 0, i32 0
  store %"class.Eigen::Tensor"* %in2, %"class.Eigen::Tensor"** %63, align 8, !tbaa !14
  %64 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %assign.i.i19, i64 0, i32 1
  store %"class.Eigen::TensorCwiseNullaryOp"* %1, %"class.Eigen::TensorCwiseNullaryOp"** %64, align 8, !tbaa !14
  %65 = load i64, i64* %19, align 8
  %66 = icmp eq i64 %65, 0
  br i1 %66, label %71, label %67

; <label>:67                                      ; preds = %49
  %68 = sdiv i64 9223372036854775807, %65
  %69 = icmp slt i64 %68, 1
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %67
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc20 unwind label %208

.noexc20:                                         ; preds = %70
  unreachable

; <label>:71                                      ; preds = %67, %49
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %assign.i.i19, %"struct.Eigen::DefaultDevice"* nonnull dereferenceable(1) %0)
  call void @llvm.lifetime.end(i64 16, i8* %62) #2
  call void @llvm.lifetime.end(i64 1, i8* %61)
  call void @llvm.lifetime.end(i64 16, i8* %50)
  %72 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i64 0, i64 0), i64 4)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit unwind label %208

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %71
  %73 = bitcast %"class.Eigen::Tensor"* %in1 to %"class.Eigen::TensorBase.3"*
  %74 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZN5EigenlsINS_6TensorIfLi1ELi0ElEEEERSoS3_RKNS_10TensorBaseIT_Li0EEE(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, %"class.Eigen::TensorBase.3"* dereferenceable(1) %73)
          to label %75 unwind label %208

; <label>:75                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %76 = bitcast %"class.std::basic_ostream"* %74 to i8**
  %77 = load i8*, i8** %76, align 8, !tbaa !17
  %78 = getelementptr i8, i8* %77, i64 -24
  %79 = bitcast i8* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = bitcast %"class.std::basic_ostream"* %74 to i8*
  %82 = getelementptr inbounds i8, i8* %81, i64 %80
  %83 = getelementptr inbounds i8, i8* %82, i64 240
  %84 = bitcast i8* %83 to %"class.std::ctype"**
  %85 = load %"class.std::ctype"*, %"class.std::ctype"** %84, align 8, !tbaa !26
  %86 = icmp eq %"class.std::ctype"* %85, null
  br i1 %86, label %87, label %.noexc43

; <label>:87                                      ; preds = %75
  invoke void @_ZSt16__throw_bad_castv() #20
          to label %.noexc50 unwind label %208

.noexc50:                                         ; preds = %87
  unreachable

.noexc43:                                         ; preds = %75
  %88 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %85, i64 0, i32 8
  %89 = load i8, i8* %88, align 8, !tbaa !29
  %90 = icmp eq i8 %89, 0
  br i1 %90, label %94, label %91

; <label>:91                                      ; preds = %.noexc43
  %92 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %85, i64 0, i32 9, i64 10
  %93 = load i8, i8* %92, align 1, !tbaa !14
  br label %.noexc24

; <label>:94                                      ; preds = %.noexc43
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %85)
          to label %.noexc47 unwind label %208

.noexc47:                                         ; preds = %94
  %95 = bitcast %"class.std::ctype"* %85 to i8 (%"class.std::ctype"*, i8)***
  %96 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %95, align 8, !tbaa !17
  %97 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %96, i64 6
  %98 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %97, align 8
  %99 = invoke signext i8 %98(%"class.std::ctype"* nonnull %85, i8 signext 10)
          to label %.noexc24 unwind label %208

.noexc24:                                         ; preds = %.noexc47, %91
  %.0.i46 = phi i8 [ %93, %91 ], [ %99, %.noexc47 ]
  %100 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %74, i8 signext %.0.i46)
          to label %.noexc25 unwind label %208

.noexc25:                                         ; preds = %.noexc24
  %101 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %100)
          to label %_ZNSolsEPFRSoS_E.exit unwind label %208

_ZNSolsEPFRSoS_E.exit:                            ; preds = %.noexc25
  %102 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i64 0, i64 0), i64 4)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit29 unwind label %208

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit29: ; preds = %_ZNSolsEPFRSoS_E.exit
  %103 = bitcast %"class.Eigen::Tensor"* %in2 to %"class.Eigen::TensorBase.3"*
  %104 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZN5EigenlsINS_6TensorIfLi1ELi0ElEEEERSoS3_RKNS_10TensorBaseIT_Li0EEE(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, %"class.Eigen::TensorBase.3"* dereferenceable(1) %103)
          to label %105 unwind label %208

; <label>:105                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit29
  %106 = bitcast %"class.std::basic_ostream"* %104 to i8**
  %107 = load i8*, i8** %106, align 8, !tbaa !17
  %108 = getelementptr i8, i8* %107, i64 -24
  %109 = bitcast i8* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = bitcast %"class.std::basic_ostream"* %104 to i8*
  %112 = getelementptr inbounds i8, i8* %111, i64 %110
  %113 = getelementptr inbounds i8, i8* %112, i64 240
  %114 = bitcast i8* %113 to %"class.std::ctype"**
  %115 = load %"class.std::ctype"*, %"class.std::ctype"** %114, align 8, !tbaa !26
  %116 = icmp eq %"class.std::ctype"* %115, null
  br i1 %116, label %117, label %.noexc38

; <label>:117                                     ; preds = %105
  invoke void @_ZSt16__throw_bad_castv() #20
          to label %.noexc42 unwind label %208

.noexc42:                                         ; preds = %117
  unreachable

.noexc38:                                         ; preds = %105
  %118 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %115, i64 0, i32 8
  %119 = load i8, i8* %118, align 8, !tbaa !29
  %120 = icmp eq i8 %119, 0
  br i1 %120, label %124, label %121

; <label>:121                                     ; preds = %.noexc38
  %122 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %115, i64 0, i32 9, i64 10
  %123 = load i8, i8* %122, align 1, !tbaa !14
  br label %.noexc32

; <label>:124                                     ; preds = %.noexc38
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %115)
          to label %.noexc40 unwind label %208

.noexc40:                                         ; preds = %124
  %125 = bitcast %"class.std::ctype"* %115 to i8 (%"class.std::ctype"*, i8)***
  %126 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %125, align 8, !tbaa !17
  %127 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %126, i64 6
  %128 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %127, align 8
  %129 = invoke signext i8 %128(%"class.std::ctype"* nonnull %115, i8 signext 10)
          to label %.noexc32 unwind label %208

.noexc32:                                         ; preds = %.noexc40, %121
  %.0.i = phi i8 [ %123, %121 ], [ %129, %.noexc40 ]
  %130 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %104, i8 signext %.0.i)
          to label %.noexc33 unwind label %208

.noexc33:                                         ; preds = %.noexc32
  %131 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %130)
          to label %132 unwind label %208

; <label>:132                                     ; preds = %.noexc33
  %133 = load i64, i64* %12, align 8, !tbaa !15
  %134 = shl i64 %133, 2
  %135 = load i64, i64* %19, align 8, !tbaa !15
  %136 = shl i64 %135, 2
  %137 = load i64, i64* %27, align 8, !tbaa !15
  %138 = shl i64 %137, 2
  %139 = bitcast float** %d_in1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %139) #2
  %140 = bitcast float** %d_in2 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %140) #2
  %141 = bitcast float** %d_out to i8*
  call void @llvm.lifetime.start(i64 8, i8* %141) #2
  %142 = bitcast float** %d_in1 to i8**
  %143 = invoke i32 @cudaMalloc(i8** %142, i64 %134)
          to label %144 unwind label %208

; <label>:144                                     ; preds = %132
  %145 = bitcast float** %d_in2 to i8**
  %146 = invoke i32 @cudaMalloc(i8** %145, i64 %136)
          to label %147 unwind label %208

; <label>:147                                     ; preds = %144
  %148 = bitcast float** %d_out to i8**
  %149 = invoke i32 @cudaMalloc(i8** %148, i64 %138)
          to label %150 unwind label %208

; <label>:150                                     ; preds = %147
  %151 = load i8*, i8** %142, align 8, !tbaa !16
  %152 = load i8*, i8** %11, align 8, !tbaa !35
  %153 = invoke i32 @cudaMemcpy(i8* %151, i8* %152, i64 %134, i32 1)
          to label %154 unwind label %208

; <label>:154                                     ; preds = %150
  %155 = load i8*, i8** %145, align 8, !tbaa !16
  %156 = load i8*, i8** %18, align 8, !tbaa !35
  %157 = invoke i32 @cudaMemcpy(i8* %155, i8* %156, i64 %136, i32 1)
          to label %158 unwind label %208

; <label>:158                                     ; preds = %154
  %159 = bitcast %"class.Eigen::CudaStreamDevice"* %stream to i8*
  call void @llvm.lifetime.start(i64 40, i8* %159) #2
  invoke void @_ZN5Eigen16CudaStreamDeviceC2Ev(%"class.Eigen::CudaStreamDevice"* nonnull %stream)
          to label %160 unwind label %208

; <label>:160                                     ; preds = %158
  %161 = bitcast %"struct.Eigen::GpuDevice"* %gpu_device to i8*
  call void @llvm.lifetime.start(i64 16, i8* %161) #2
  %162 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0
  %163 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %gpu_device, i64 0, i32 0
  store %"class.Eigen::StreamInterface"* %162, %"class.Eigen::StreamInterface"** %163, align 8, !tbaa !54
  %164 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %gpu_device, i64 0, i32 1
  store i32 2147483647, i32* %164, align 8, !tbaa !56
  %165 = bitcast %"class.Eigen::TensorMap"* %gpu_in1 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %165) #2
  %166 = bitcast float** %d_in1 to i64*
  %167 = load i64, i64* %166, align 8, !tbaa !16
  %168 = bitcast %"class.Eigen::TensorMap"* %gpu_in1 to i64*
  store i64 %167, i64* %168, align 8, !tbaa !57
  %169 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in1, i64 0, i32 1, i32 0, i32 0, i64 0
  store i64 2, i64* %169, align 8, !tbaa !14
  %170 = bitcast %"class.Eigen::TensorMap"* %gpu_in2 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %170) #2
  %171 = bitcast float** %d_in2 to i64*
  %172 = load i64, i64* %171, align 8, !tbaa !16
  %173 = bitcast %"class.Eigen::TensorMap"* %gpu_in2 to i64*
  store i64 %172, i64* %173, align 8, !tbaa !57
  %174 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_in2, i64 0, i32 1, i32 0, i32 0, i64 0
  store i64 2, i64* %174, align 8, !tbaa !14
  %175 = bitcast %"class.Eigen::TensorMap"* %gpu_out to i8*
  call void @llvm.lifetime.start(i64 16, i8* %175) #2
  %176 = bitcast float** %d_out to i64*
  %177 = load i64, i64* %176, align 8, !tbaa !16
  %178 = bitcast %"class.Eigen::TensorMap"* %gpu_out to i64*
  store i64 %177, i64* %178, align 8, !tbaa !57
  %179 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %gpu_out, i64 0, i32 1, i32 0, i32 0, i64 0
  store i64 2, i64* %179, align 8, !tbaa !14
  %180 = ptrtoint %"class.Eigen::TensorMap"* %gpu_out to i64
  %181 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %4, i64 0, i32 0
  store %"class.Eigen::TensorMap"* %gpu_in1, %"class.Eigen::TensorMap"** %181, align 8, !tbaa !14, !alias.scope !59
  %182 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %4, i64 0, i32 1
  store %"class.Eigen::TensorMap"* %gpu_in2, %"class.Eigen::TensorMap"** %182, align 8, !tbaa !14, !alias.scope !59
  %183 = bitcast %"class.Eigen::TensorAssignOp.30"* %assign.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %183) #2
  %184 = bitcast %"class.Eigen::TensorAssignOp.30"* %assign.i to i64*
  store i64 %180, i64* %184, align 8, !tbaa !14
  %185 = getelementptr inbounds %"class.Eigen::TensorAssignOp.30", %"class.Eigen::TensorAssignOp.30"* %assign.i, i64 0, i32 1
  store %"class.Eigen::TensorCwiseBinaryOp"* %4, %"class.Eigen::TensorCwiseBinaryOp"** %185, align 8, !tbaa !14
  invoke void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_SA_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_(%"class.Eigen::TensorAssignOp.30"* nonnull dereferenceable(16) %assign.i, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %gpu_device)
          to label %186 unwind label %.loopexit.split-lp

; <label>:186                                     ; preds = %160
  call void @llvm.lifetime.end(i64 16, i8* %183) #2
  %187 = load i8*, i8** %26, align 8, !tbaa !35
  %188 = load i8*, i8** %148, align 8, !tbaa !16
  %189 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %163, align 8, !tbaa !54
  %190 = bitcast %"class.Eigen::StreamInterface"* %189 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %191 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %190, align 8, !tbaa !17
  %192 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %191, i64 2
  %193 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %192, align 8
  %194 = invoke dereferenceable(8) %struct.CUstream_st** %193(%"class.Eigen::StreamInterface"* %189)
          to label %_ZNK5Eigen9GpuDevice6streamEv.exit unwind label %.loopexit.split-lp

_ZNK5Eigen9GpuDevice6streamEv.exit:               ; preds = %186
  %195 = load %struct.CUstream_st*, %struct.CUstream_st** %194, align 8, !tbaa !16
  %196 = invoke i32 @cudaMemcpyAsync(i8* %187, i8* %188, i64 %138, i32 2, %struct.CUstream_st* %195)
          to label %197 unwind label %.loopexit.split-lp

; <label>:197                                     ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit
  %198 = icmp eq i32 %196, 0
  br i1 %198, label %232, label %199

; <label>:199                                     ; preds = %197
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([106 x i8], [106 x i8]* @.str.26, i64 0, i64 0), i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.27, i64 0, i64 0), i32 57, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._Z27test_cuda_elementwise_smallv, i64 0, i64 0)) #21
  unreachable

; <label>:200                                     ; preds = %17
  %201 = landingpad { i8*, i32 }
          cleanup
  %202 = extractvalue { i8*, i32 } %201, 0
  %203 = extractvalue { i8*, i32 } %201, 1
  br label %326

; <label>:204                                     ; preds = %24
  %205 = landingpad { i8*, i32 }
          cleanup
  %206 = extractvalue { i8*, i32 } %205, 0
  %207 = extractvalue { i8*, i32 } %205, 1
  br label %324

; <label>:208                                     ; preds = %87, %.noexc47, %94, %117, %.noexc40, %124, %.noexc33, %.noexc32, %_ZNSolsEPFRSoS_E.exit, %.noexc25, %.noexc24, %71, %70, %48, %158, %154, %150, %147, %144, %132, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit29, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %209 = landingpad { i8*, i32 }
          cleanup
  %210 = extractvalue { i8*, i32 } %209, 0
  %211 = extractvalue { i8*, i32 } %209, 1
  br label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit

.loopexit:                                        ; preds = %330, %_ZNSolsEPFRSoS_E.exit59, %_ZNSolsEPFRSoS_E.exit59.preheader.preheader, %282
  %lpad.loopexit = landingpad { i8*, i32 }
          cleanup
  br label %212

.loopexit.split-lp:                               ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit, %_ZNK5Eigen9GpuDevice6streamEv.exit55, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit57, %_ZNSolsEPFRSoS_E.exit59.1, %296, %299, %160, %186, %232, %244, %.noexc60, %.noexc61, %267, %.noexc70, %260
  %lpad.loopexit.split-lp = landingpad { i8*, i32 }
          cleanup
  br label %212

; <label>:212                                     ; preds = %.loopexit.split-lp, %.loopexit
  %lpad.phi = phi { i8*, i32 } [ %lpad.loopexit, %.loopexit ], [ %lpad.loopexit.split-lp, %.loopexit.split-lp ]
  %213 = extractvalue { i8*, i32 } %lpad.phi, 0
  %214 = extractvalue { i8*, i32 } %lpad.phi, 1
  %215 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %215, align 8, !tbaa !17
  %216 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 3
  %217 = load i8*, i8** %216, align 8, !tbaa !64
  %218 = icmp eq i8* %217, null
  br i1 %218, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %219

; <label>:219                                     ; preds = %212
  %220 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 2
  %221 = load i32, i32* %220, align 8, !tbaa !66
  %222 = invoke i32 @cudaSetDevice(i32 %221)
          to label %.noexc.i unwind label %229

.noexc.i:                                         ; preds = %219
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %225, label %224

; <label>:224                                     ; preds = %.noexc.i
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:225                                     ; preds = %.noexc.i
  %226 = invoke i32 @cudaFree(i8* nonnull %217)
          to label %.noexc1.i unwind label %229

.noexc1.i:                                        ; preds = %225
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %228

; <label>:228                                     ; preds = %.noexc1.i
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:229                                     ; preds = %225, %219
  %230 = landingpad { i8*, i32 }
          catch i8* null
  %231 = extractvalue { i8*, i32 } %230, 0
  call void @__clang_call_terminate(i8* %231) #21
  unreachable

; <label>:232                                     ; preds = %197
  %233 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %163, align 8, !tbaa !54
  %234 = bitcast %"class.Eigen::StreamInterface"* %233 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %235 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %234, align 8, !tbaa !17
  %236 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %235, i64 2
  %237 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %236, align 8
  %238 = invoke dereferenceable(8) %struct.CUstream_st** %237(%"class.Eigen::StreamInterface"* %233)
          to label %_ZNK5Eigen9GpuDevice6streamEv.exit55 unwind label %.loopexit.split-lp

_ZNK5Eigen9GpuDevice6streamEv.exit55:             ; preds = %232
  %239 = load %struct.CUstream_st*, %struct.CUstream_st** %238, align 8, !tbaa !16
  %240 = invoke i32 @cudaStreamSynchronize(%struct.CUstream_st* %239)
          to label %241 unwind label %.loopexit.split-lp

; <label>:241                                     ; preds = %_ZNK5Eigen9GpuDevice6streamEv.exit55
  %242 = icmp eq i32 %240, 0
  br i1 %242, label %244, label %243

; <label>:243                                     ; preds = %241
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([58 x i8], [58 x i8]* @.str.28, i64 0, i64 0), i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.27, i64 0, i64 0), i32 58, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._Z27test_cuda_elementwise_smallv, i64 0, i64 0)) #21
  unreachable

; <label>:244                                     ; preds = %241
  %245 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.29, i64 0, i64 0), i64 4)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit57 unwind label %.loopexit.split-lp

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit57: ; preds = %244
  %246 = bitcast %"class.Eigen::Tensor"* %out to %"class.Eigen::TensorBase.3"*
  %247 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZN5EigenlsINS_6TensorIfLi1ELi0ElEEEERSoS3_RKNS_10TensorBaseIT_Li0EEE(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, %"class.Eigen::TensorBase.3"* dereferenceable(1) %246)
          to label %248 unwind label %.loopexit.split-lp

; <label>:248                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit57
  %249 = bitcast %"class.std::basic_ostream"* %247 to i8**
  %250 = load i8*, i8** %249, align 8, !tbaa !17
  %251 = getelementptr i8, i8* %250, i64 -24
  %252 = bitcast i8* %251 to i64*
  %253 = load i64, i64* %252, align 8
  %254 = bitcast %"class.std::basic_ostream"* %247 to i8*
  %255 = getelementptr inbounds i8, i8* %254, i64 %253
  %256 = getelementptr inbounds i8, i8* %255, i64 240
  %257 = bitcast i8* %256 to %"class.std::ctype"**
  %258 = load %"class.std::ctype"*, %"class.std::ctype"** %257, align 8, !tbaa !26
  %259 = icmp eq %"class.std::ctype"* %258, null
  br i1 %259, label %260, label %.noexc66

; <label>:260                                     ; preds = %248
  invoke void @_ZSt16__throw_bad_castv() #20
          to label %.noexc73 unwind label %.loopexit.split-lp

.noexc73:                                         ; preds = %260
  unreachable

.noexc66:                                         ; preds = %248
  %261 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %258, i64 0, i32 8
  %262 = load i8, i8* %261, align 8, !tbaa !29
  %263 = icmp eq i8 %262, 0
  br i1 %263, label %267, label %264

; <label>:264                                     ; preds = %.noexc66
  %265 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %258, i64 0, i32 9, i64 10
  %266 = load i8, i8* %265, align 1, !tbaa !14
  br label %.noexc60

; <label>:267                                     ; preds = %.noexc66
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %258)
          to label %.noexc70 unwind label %.loopexit.split-lp

.noexc70:                                         ; preds = %267
  %268 = bitcast %"class.std::ctype"* %258 to i8 (%"class.std::ctype"*, i8)***
  %269 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %268, align 8, !tbaa !17
  %270 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %269, i64 6
  %271 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %270, align 8
  %272 = invoke signext i8 %271(%"class.std::ctype"* nonnull %258, i8 signext 10)
          to label %.noexc60 unwind label %.loopexit.split-lp

.noexc60:                                         ; preds = %.noexc70, %264
  %.0.i69 = phi i8 [ %266, %264 ], [ %272, %.noexc70 ]
  %273 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %247, i8 signext %.0.i69)
          to label %.noexc61 unwind label %.loopexit.split-lp

.noexc61:                                         ; preds = %.noexc60
  %274 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %273)
          to label %_ZNSolsEPFRSoS_E.exit59.preheader.preheader unwind label %.loopexit.split-lp

_ZNSolsEPFRSoS_E.exit59.preheader.preheader:      ; preds = %.noexc61
  %275 = load float*, float** %21, align 8, !tbaa !35
  %276 = load float*, float** %7, align 8, !tbaa !35
  %277 = load float, float* %276, align 4, !tbaa !67
  %278 = load float*, float** %14, align 8, !tbaa !35
  %279 = load float, float* %278, align 4, !tbaa !67
  %280 = fadd float %277, %279
  store float %280, float* %5, align 4, !tbaa !67
  %281 = invoke zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nonnull dereferenceable(4) %275, float* nonnull dereferenceable(4) %5)
          to label %282 unwind label %.loopexit

; <label>:282                                     ; preds = %_ZNSolsEPFRSoS_E.exit59.preheader.preheader
  %283 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !16
  %284 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %283, i64 -1, i32 0, i32 0
  %285 = load i8*, i8** %284, align 8, !tbaa !8
  invoke void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %281, i8* %285, i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.27, i64 0, i64 0), i32 65, i8* nonnull getelementptr inbounds ([149 x i8], [149 x i8]* @.str.30, i64 0, i64 0))
          to label %_ZNSolsEPFRSoS_E.exit59 unwind label %.loopexit

_ZNSolsEPFRSoS_E.exit59:                          ; preds = %282
  %286 = load float*, float** %21, align 8, !tbaa !35
  %287 = getelementptr inbounds float, float* %286, i64 1
  %288 = load float*, float** %7, align 8, !tbaa !35
  %289 = getelementptr inbounds float, float* %288, i64 1
  %290 = load float, float* %289, align 4, !tbaa !67
  %291 = load float*, float** %14, align 8, !tbaa !35
  %292 = getelementptr inbounds float, float* %291, i64 1
  %293 = load float, float* %292, align 4, !tbaa !67
  %294 = fadd float %290, %293
  store float %294, float* %5, align 4, !tbaa !67
  %295 = invoke zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nonnull dereferenceable(4) %287, float* nonnull dereferenceable(4) %5)
          to label %330 unwind label %.loopexit

; <label>:296                                     ; preds = %_ZNSolsEPFRSoS_E.exit59.1
  %297 = load i8*, i8** %145, align 8, !tbaa !16
  %298 = invoke i32 @cudaFree(i8* %297)
          to label %299 unwind label %.loopexit.split-lp

; <label>:299                                     ; preds = %296
  %300 = load i8*, i8** %148, align 8, !tbaa !16
  %301 = invoke i32 @cudaFree(i8* %300)
          to label %302 unwind label %.loopexit.split-lp

; <label>:302                                     ; preds = %299
  call void @llvm.lifetime.end(i64 16, i8* %175) #2
  call void @llvm.lifetime.end(i64 16, i8* %170) #2
  call void @llvm.lifetime.end(i64 16, i8* %165) #2
  call void @llvm.lifetime.end(i64 16, i8* nonnull %161) #2
  %303 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %303, align 8, !tbaa !17
  %304 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 3
  %305 = load i8*, i8** %304, align 8, !tbaa !64
  %306 = icmp eq i8* %305, null
  br i1 %306, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit77, label %307

; <label>:307                                     ; preds = %302
  %308 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %stream, i64 0, i32 2
  %309 = load i32, i32* %308, align 8, !tbaa !66
  %310 = invoke i32 @cudaSetDevice(i32 %309)
          to label %.noexc.i75 unwind label %317

.noexc.i75:                                       ; preds = %307
  %311 = icmp eq i32 %310, 0
  br i1 %311, label %313, label %312

; <label>:312                                     ; preds = %.noexc.i75
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:313                                     ; preds = %.noexc.i75
  %314 = invoke i32 @cudaFree(i8* nonnull %305)
          to label %.noexc1.i76 unwind label %317

.noexc1.i76:                                      ; preds = %313
  %315 = icmp eq i32 %314, 0
  br i1 %315, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit77, label %316

; <label>:316                                     ; preds = %.noexc1.i76
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:317                                     ; preds = %313, %307
  %318 = landingpad { i8*, i32 }
          catch i8* null
  %319 = extractvalue { i8*, i32 } %318, 0
  call void @__clang_call_terminate(i8* %319) #21
  unreachable

_ZN5Eigen16CudaStreamDeviceD2Ev.exit77:           ; preds = %302, %.noexc1.i76
  call void @llvm.lifetime.end(i64 40, i8* nonnull %159) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %141) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %140) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %139) #2
  %320 = load i8*, i8** %26, align 8, !tbaa !35
  call void @free(i8* %320) #2
  call void @llvm.lifetime.end(i64 16, i8* nonnull %20) #2
  %321 = load i8*, i8** %18, align 8, !tbaa !35
  call void @free(i8* %321) #2
  call void @llvm.lifetime.end(i64 16, i8* nonnull %13) #2
  %322 = load i8*, i8** %11, align 8, !tbaa !35
  call void @free(i8* %322) #2
  call void @llvm.lifetime.end(i64 16, i8* nonnull %6) #2
  ret void

_ZN5Eigen16CudaStreamDeviceD2Ev.exit:             ; preds = %.noexc1.i, %212, %208
  %.01 = phi i32 [ %211, %208 ], [ %214, %212 ], [ %214, %.noexc1.i ]
  %.0 = phi i8* [ %210, %208 ], [ %213, %212 ], [ %213, %.noexc1.i ]
  %323 = load i8*, i8** %26, align 8, !tbaa !35
  call void @free(i8* %323) #2
  br label %324

; <label>:324                                     ; preds = %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, %204
  %.12 = phi i32 [ %.01, %_ZN5Eigen16CudaStreamDeviceD2Ev.exit ], [ %207, %204 ]
  %.1 = phi i8* [ %.0, %_ZN5Eigen16CudaStreamDeviceD2Ev.exit ], [ %206, %204 ]
  %325 = load i8*, i8** %18, align 8, !tbaa !35
  call void @free(i8* %325) #2
  br label %326

; <label>:326                                     ; preds = %324, %200
  %.23 = phi i32 [ %.12, %324 ], [ %203, %200 ]
  %.2 = phi i8* [ %.1, %324 ], [ %202, %200 ]
  %327 = load i8*, i8** %11, align 8, !tbaa !35
  call void @free(i8* %327) #2
  %328 = insertvalue { i8*, i32 } undef, i8* %.2, 0
  %329 = insertvalue { i8*, i32 } %328, i32 %.23, 1
  resume { i8*, i32 } %329

; <label>:330                                     ; preds = %_ZNSolsEPFRSoS_E.exit59
  %331 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !16
  %332 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %331, i64 -1, i32 0, i32 0
  %333 = load i8*, i8** %332, align 8, !tbaa !8
  invoke void @_Z11verify_implbPKcS0_iS0_(i1 zeroext %295, i8* %333, i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.27, i64 0, i64 0), i32 65, i8* nonnull getelementptr inbounds ([149 x i8], [149 x i8]* @.str.30, i64 0, i64 0))
          to label %_ZNSolsEPFRSoS_E.exit59.1 unwind label %.loopexit

_ZNSolsEPFRSoS_E.exit59.1:                        ; preds = %330
  %334 = load i8*, i8** %142, align 8, !tbaa !16
  %335 = invoke i32 @cudaFree(i8* %334)
          to label %296 unwind label %.loopexit.split-lp
}

; Function Attrs: uwtable
define linkonce_odr nonnull dereferenceable(272) %"class.std::basic_ostream"* @_ZN5EigenlsINS_6TensorIfLi1ELi0ElEEEERSoS3_RKNS_10TensorBaseIT_Li0EEE(%"class.std::basic_ostream"* dereferenceable(272) %os, %"class.Eigen::TensorBase.3"* dereferenceable(1) %expr) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %array.i = alloca %"class.Eigen::Map", align 8
  %1 = getelementptr inbounds %"class.Eigen::TensorBase.3", %"class.Eigen::TensorBase.3"* %expr, i64 8
  %2 = bitcast %"class.Eigen::TensorBase.3"* %1 to i64*
  %3 = load i64, i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEEC2ERS6_RKS7_.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = icmp ugt i64 %3, 4611686018427387903
  br i1 %6, label %7, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i.i

; <label>:7                                       ; preds = %5
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i.i: ; preds = %5
  %8 = shl i64 %3, 2
  %9 = tail call noalias i8* @malloc(i64 %8) #2
  %10 = icmp eq i8* %9, null
  %11 = icmp ne i64 %8, 0
  %or.cond.i.i.i.i.i.i = and i1 %11, %10
  br i1 %or.cond.i.i.i.i.i.i, label %12, label %_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i.i.i

; <label>:12                                      ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i.i
  tail call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i.i.i: ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i.i
  %13 = ptrtoint i8* %9 to i64
  %14 = bitcast %"class.Eigen::TensorBase.3"* %expr to i8**
  %15 = load i8*, i8** %14, align 8, !tbaa !35
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %15, i64 %8, i32 4, i1 false) #2
  br label %_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEEC2ERS6_RKS7_.exit

_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEEC2ERS6_RKS7_.exit: ; preds = %0, %_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i.i.i
  %.pre-phi = phi i64 [ %8, %_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i.i.i ], [ 0, %0 ]
  %16 = phi i64 [ %13, %_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i.i.i ], [ 0, %0 ]
  %17 = phi i64 [ %3, %_ZN5Eigen8internal28conditional_aligned_new_autoIfLb1EEEPT_m.exit.i.i.i ], [ 0, %0 ]
  %18 = tail call noalias i8* @malloc(i64 %.pre-phi) #2
  %19 = icmp eq i8* %18, null
  %20 = icmp ne i64 %.pre-phi, 0
  %or.cond.i.i.i = and i1 %20, %19
  br i1 %or.cond.i.i.i, label %21, label %_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEE20evalSubExprsIfNeededEPf.exit

; <label>:21                                      ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEEC2ERS6_RKS7_.exit
  invoke void @_ZN5Eigen8internal19throw_std_bad_allocEv()
          to label %.noexc unwind label %229

.noexc:                                           ; preds = %21
  unreachable

_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEE20evalSubExprsIfNeededEPf.exit: ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEEC2ERS6_RKS7_.exit
  %22 = ptrtoint i8* %18 to i64
  br i1 %19, label %25, label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEE20evalSubExprsIfNeededEPf.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEE20evalSubExprsIfNeededEPf.exit.i: ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEE20evalSubExprsIfNeededEPf.exit
  %23 = inttoptr i64 %16 to i8*
  %24 = shl i64 %17, 2
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %18, i8* %23, i64 %24, i32 1, i1 false) #2
  br label %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit

; <label>:25                                      ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEE20evalSubExprsIfNeededEPf.exit
  %26 = sdiv i64 %17, 16
  %27 = shl nsw i64 %26, 4
  %28 = icmp sgt i64 %17, 15
  br i1 %28, label %.preheader3.lr.ph.i, label %._crit_edge.i

.preheader3.lr.ph.i:                              ; preds = %25
  %29 = inttoptr i64 %16 to float*
  br label %.preheader3.i

.preheader3.i:                                    ; preds = %.preheader3.i, %.preheader3.lr.ph.i
  %i.08.i = phi i64 [ 0, %.preheader3.lr.ph.i ], [ %97, %.preheader3.i ]
  %30 = getelementptr inbounds float, float* null, i64 %i.08.i
  %31 = getelementptr inbounds float, float* %29, i64 %i.08.i
  %32 = load float, float* %31, align 4, !tbaa !67
  %33 = getelementptr inbounds float, float* %31, i64 1
  %34 = load float, float* %33, align 4, !tbaa !67
  %35 = getelementptr inbounds float, float* %31, i64 2
  %36 = load float, float* %35, align 4, !tbaa !67
  %37 = getelementptr inbounds float, float* %31, i64 3
  %38 = load float, float* %37, align 4, !tbaa !67
  %39 = insertelement <2 x float> undef, float %32, i32 0
  %40 = insertelement <2 x float> %39, float %34, i32 1
  %41 = insertelement <2 x float> undef, float %36, i32 0
  %42 = insertelement <2 x float> %41, float %38, i32 1
  %43 = bitcast float* %30 to <2 x float>*
  store <2 x float> %40, <2 x float>* %43, align 64
  %44 = getelementptr inbounds float, float* %30, i64 2
  %45 = bitcast float* %44 to <2 x float>*
  store <2 x float> %42, <2 x float>* %45, align 8
  %46 = or i64 %i.08.i, 4
  %47 = getelementptr inbounds float, float* null, i64 %46
  %48 = getelementptr inbounds float, float* %29, i64 %46
  %49 = load float, float* %48, align 4, !tbaa !67
  %50 = getelementptr inbounds float, float* %48, i64 1
  %51 = load float, float* %50, align 4, !tbaa !67
  %52 = getelementptr inbounds float, float* %48, i64 2
  %53 = load float, float* %52, align 4, !tbaa !67
  %54 = getelementptr inbounds float, float* %48, i64 3
  %55 = load float, float* %54, align 4, !tbaa !67
  %56 = insertelement <2 x float> undef, float %49, i32 0
  %57 = insertelement <2 x float> %56, float %51, i32 1
  %58 = insertelement <2 x float> undef, float %53, i32 0
  %59 = insertelement <2 x float> %58, float %55, i32 1
  %60 = bitcast float* %47 to <2 x float>*
  store <2 x float> %57, <2 x float>* %60, align 16
  %61 = getelementptr inbounds float, float* %47, i64 2
  %62 = bitcast float* %61 to <2 x float>*
  store <2 x float> %59, <2 x float>* %62, align 8
  %63 = or i64 %i.08.i, 8
  %64 = getelementptr inbounds float, float* null, i64 %63
  %65 = getelementptr inbounds float, float* %29, i64 %63
  %66 = load float, float* %65, align 4, !tbaa !67
  %67 = getelementptr inbounds float, float* %65, i64 1
  %68 = load float, float* %67, align 4, !tbaa !67
  %69 = getelementptr inbounds float, float* %65, i64 2
  %70 = load float, float* %69, align 4, !tbaa !67
  %71 = getelementptr inbounds float, float* %65, i64 3
  %72 = load float, float* %71, align 4, !tbaa !67
  %73 = insertelement <2 x float> undef, float %66, i32 0
  %74 = insertelement <2 x float> %73, float %68, i32 1
  %75 = insertelement <2 x float> undef, float %70, i32 0
  %76 = insertelement <2 x float> %75, float %72, i32 1
  %77 = bitcast float* %64 to <2 x float>*
  store <2 x float> %74, <2 x float>* %77, align 32
  %78 = getelementptr inbounds float, float* %64, i64 2
  %79 = bitcast float* %78 to <2 x float>*
  store <2 x float> %76, <2 x float>* %79, align 8
  %80 = or i64 %i.08.i, 12
  %81 = getelementptr inbounds float, float* null, i64 %80
  %82 = getelementptr inbounds float, float* %29, i64 %80
  %83 = load float, float* %82, align 4, !tbaa !67
  %84 = getelementptr inbounds float, float* %82, i64 1
  %85 = load float, float* %84, align 4, !tbaa !67
  %86 = getelementptr inbounds float, float* %82, i64 2
  %87 = load float, float* %86, align 4, !tbaa !67
  %88 = getelementptr inbounds float, float* %82, i64 3
  %89 = load float, float* %88, align 4, !tbaa !67
  %90 = insertelement <2 x float> undef, float %83, i32 0
  %91 = insertelement <2 x float> %90, float %85, i32 1
  %92 = insertelement <2 x float> undef, float %87, i32 0
  %93 = insertelement <2 x float> %92, float %89, i32 1
  %94 = bitcast float* %81 to <2 x float>*
  store <2 x float> %91, <2 x float>* %94, align 16
  %95 = getelementptr inbounds float, float* %81, i64 2
  %96 = bitcast float* %95 to <2 x float>*
  store <2 x float> %93, <2 x float>* %96, align 8
  %97 = add nuw nsw i64 %i.08.i, 16
  %98 = icmp slt i64 %97, %27
  br i1 %98, label %.preheader3.i, label %._crit_edge.i.loopexit

._crit_edge.i.loopexit:                           ; preds = %.preheader3.i
  br label %._crit_edge.i

._crit_edge.i:                                    ; preds = %._crit_edge.i.loopexit, %25
  %99 = sdiv i64 %17, 4
  %100 = shl nsw i64 %99, 2
  %101 = icmp slt i64 %27, %100
  br i1 %101, label %.lr.ph6.i, label %.preheader.i

.lr.ph6.i:                                        ; preds = %._crit_edge.i
  %102 = inttoptr i64 %16 to float*
  %103 = shl nsw i64 %99, 2
  %104 = add i64 %103, -1
  %105 = shl nsw i64 %26, 4
  %106 = sub i64 %104, %105
  %107 = lshr i64 %106, 2
  %108 = and i64 %107, 1
  %lcmp.mod7 = icmp eq i64 %108, 0
  br i1 %lcmp.mod7, label %109, label %.lr.ph6.i.split

; <label>:109                                     ; preds = %.lr.ph6.i
  %110 = getelementptr inbounds float, float* null, i64 %27
  %111 = getelementptr inbounds float, float* %102, i64 %27
  %112 = load float, float* %111, align 4, !tbaa !67
  %113 = getelementptr inbounds float, float* %111, i64 1
  %114 = load float, float* %113, align 4, !tbaa !67
  %115 = getelementptr inbounds float, float* %111, i64 2
  %116 = load float, float* %115, align 4, !tbaa !67
  %117 = getelementptr inbounds float, float* %111, i64 3
  %118 = load float, float* %117, align 4, !tbaa !67
  %119 = insertelement <2 x float> undef, float %112, i32 0
  %120 = insertelement <2 x float> %119, float %114, i32 1
  %121 = insertelement <2 x float> undef, float %116, i32 0
  %122 = insertelement <2 x float> %121, float %118, i32 1
  %123 = bitcast float* %110 to <2 x float>*
  store <2 x float> %120, <2 x float>* %123, align 64
  %124 = getelementptr inbounds float, float* %110, i64 2
  %125 = bitcast float* %124 to <2 x float>*
  store <2 x float> %122, <2 x float>* %125, align 8
  %126 = or i64 %27, 4
  br label %.lr.ph6.i.split

.lr.ph6.i.split:                                  ; preds = %109, %.lr.ph6.i
  %i1.05.i.unr = phi i64 [ %27, %.lr.ph6.i ], [ %126, %109 ]
  %127 = icmp eq i64 %107, 0
  br i1 %127, label %.preheader.i.loopexit, label %.lr.ph6.i.split.split

.lr.ph6.i.split.split:                            ; preds = %.lr.ph6.i.split
  br label %179

.preheader.i.loopexit.unr-lcssa:                  ; preds = %179
  br label %.preheader.i.loopexit

.preheader.i.loopexit:                            ; preds = %.lr.ph6.i.split, %.preheader.i.loopexit.unr-lcssa
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i.loopexit, %._crit_edge.i
  %128 = icmp slt i64 %100, %17
  br i1 %128, label %.lr.ph.i, label %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit

.lr.ph.i:                                         ; preds = %.preheader.i
  %129 = inttoptr i64 %16 to float*
  %130 = shl nsw i64 %99, 2
  %131 = sub i64 %17, %130
  %min.iters.check = icmp ult i64 %131, 8
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph.i
  %i2.04.i.ph = phi i64 [ %100, %min.iters.checked ], [ %100, %.lr.ph.i ], [ %ind.end, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph.i
  %n.vec = and i64 %131, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %100, %n.vec
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %132 = shl nsw i64 %99, 2
  %133 = sub i64 %17, %132
  %134 = add i64 %133, -8
  %135 = lshr i64 %134, 3
  %136 = add nuw nsw i64 %135, 1
  %xtraiter = and i64 %136, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.preheader.split, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %offset.idx.prol = add i64 %100, %index.prol
  %137 = getelementptr inbounds float, float* %129, i64 %offset.idx.prol
  %138 = bitcast float* %137 to <4 x i32>*
  %wide.load.prol = load <4 x i32>, <4 x i32>* %138, align 4, !tbaa !67
  %139 = getelementptr float, float* %137, i64 4
  %140 = bitcast float* %139 to <4 x i32>*
  %wide.load3.prol = load <4 x i32>, <4 x i32>* %140, align 4, !tbaa !67
  %141 = getelementptr inbounds float, float* null, i64 %offset.idx.prol
  %142 = bitcast float* %141 to <4 x i32>*
  store <4 x i32> %wide.load.prol, <4 x i32>* %142, align 16, !tbaa !67
  %143 = getelementptr float, float* %141, i64 4
  %144 = bitcast float* %143 to <4 x i32>*
  store <4 x i32> %wide.load3.prol, <4 x i32>* %144, align 16, !tbaa !67
  %index.next.prol = add i64 %index.prol, 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.preheader.split.loopexit, label %vector.body.prol, !llvm.loop !69

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.next.prol.lcssa = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol.lcssa, %vector.body.preheader.split.loopexit ]
  %145 = icmp ult i64 %134, 24
  br i1 %145, label %middle.block, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.3, %vector.body ]
  %offset.idx = add i64 %100, %index
  %146 = getelementptr inbounds float, float* %129, i64 %offset.idx
  %147 = bitcast float* %146 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %147, align 4, !tbaa !67
  %148 = getelementptr float, float* %146, i64 4
  %149 = bitcast float* %148 to <4 x i32>*
  %wide.load3 = load <4 x i32>, <4 x i32>* %149, align 4, !tbaa !67
  %150 = getelementptr inbounds float, float* null, i64 %offset.idx
  %151 = bitcast float* %150 to <4 x i32>*
  store <4 x i32> %wide.load, <4 x i32>* %151, align 16, !tbaa !67
  %152 = getelementptr float, float* %150, i64 4
  %153 = bitcast float* %152 to <4 x i32>*
  store <4 x i32> %wide.load3, <4 x i32>* %153, align 16, !tbaa !67
  %index.next = add i64 %index, 8
  %offset.idx.1 = add i64 %100, %index.next
  %154 = getelementptr inbounds float, float* %129, i64 %offset.idx.1
  %155 = bitcast float* %154 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %155, align 4, !tbaa !67
  %156 = getelementptr float, float* %154, i64 4
  %157 = bitcast float* %156 to <4 x i32>*
  %wide.load3.1 = load <4 x i32>, <4 x i32>* %157, align 4, !tbaa !67
  %158 = getelementptr inbounds float, float* null, i64 %offset.idx.1
  %159 = bitcast float* %158 to <4 x i32>*
  store <4 x i32> %wide.load.1, <4 x i32>* %159, align 16, !tbaa !67
  %160 = getelementptr float, float* %158, i64 4
  %161 = bitcast float* %160 to <4 x i32>*
  store <4 x i32> %wide.load3.1, <4 x i32>* %161, align 16, !tbaa !67
  %index.next.1 = add i64 %index, 16
  %offset.idx.2 = add i64 %100, %index.next.1
  %162 = getelementptr inbounds float, float* %129, i64 %offset.idx.2
  %163 = bitcast float* %162 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %163, align 4, !tbaa !67
  %164 = getelementptr float, float* %162, i64 4
  %165 = bitcast float* %164 to <4 x i32>*
  %wide.load3.2 = load <4 x i32>, <4 x i32>* %165, align 4, !tbaa !67
  %166 = getelementptr inbounds float, float* null, i64 %offset.idx.2
  %167 = bitcast float* %166 to <4 x i32>*
  store <4 x i32> %wide.load.2, <4 x i32>* %167, align 16, !tbaa !67
  %168 = getelementptr float, float* %166, i64 4
  %169 = bitcast float* %168 to <4 x i32>*
  store <4 x i32> %wide.load3.2, <4 x i32>* %169, align 16, !tbaa !67
  %index.next.2 = add i64 %index, 24
  %offset.idx.3 = add i64 %100, %index.next.2
  %170 = getelementptr inbounds float, float* %129, i64 %offset.idx.3
  %171 = bitcast float* %170 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %171, align 4, !tbaa !67
  %172 = getelementptr float, float* %170, i64 4
  %173 = bitcast float* %172 to <4 x i32>*
  %wide.load3.3 = load <4 x i32>, <4 x i32>* %173, align 4, !tbaa !67
  %174 = getelementptr inbounds float, float* null, i64 %offset.idx.3
  %175 = bitcast float* %174 to <4 x i32>*
  store <4 x i32> %wide.load.3, <4 x i32>* %175, align 16, !tbaa !67
  %176 = getelementptr float, float* %174, i64 4
  %177 = bitcast float* %176 to <4 x i32>*
  store <4 x i32> %wide.load3.3, <4 x i32>* %177, align 16, !tbaa !67
  %index.next.3 = add i64 %index, 32
  %178 = icmp eq i64 %index.next.3, %n.vec
  br i1 %178, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !71

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %131, %n.vec
  br i1 %cmp.n, label %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit, label %scalar.ph.preheader

; <label>:179                                     ; preds = %179, %.lr.ph6.i.split.split
  %i1.05.i = phi i64 [ %i1.05.i.unr, %.lr.ph6.i.split.split ], [ %213, %179 ]
  %180 = getelementptr inbounds float, float* null, i64 %i1.05.i
  %181 = getelementptr inbounds float, float* %102, i64 %i1.05.i
  %182 = load float, float* %181, align 4, !tbaa !67
  %183 = getelementptr inbounds float, float* %181, i64 1
  %184 = load float, float* %183, align 4, !tbaa !67
  %185 = getelementptr inbounds float, float* %181, i64 2
  %186 = load float, float* %185, align 4, !tbaa !67
  %187 = getelementptr inbounds float, float* %181, i64 3
  %188 = load float, float* %187, align 4, !tbaa !67
  %189 = insertelement <2 x float> undef, float %182, i32 0
  %190 = insertelement <2 x float> %189, float %184, i32 1
  %191 = insertelement <2 x float> undef, float %186, i32 0
  %192 = insertelement <2 x float> %191, float %188, i32 1
  %193 = bitcast float* %180 to <2 x float>*
  store <2 x float> %190, <2 x float>* %193, align 16
  %194 = getelementptr inbounds float, float* %180, i64 2
  %195 = bitcast float* %194 to <2 x float>*
  store <2 x float> %192, <2 x float>* %195, align 8
  %196 = add nsw i64 %i1.05.i, 4
  %197 = getelementptr inbounds float, float* null, i64 %196
  %198 = getelementptr inbounds float, float* %102, i64 %196
  %199 = load float, float* %198, align 4, !tbaa !67
  %200 = getelementptr inbounds float, float* %198, i64 1
  %201 = load float, float* %200, align 4, !tbaa !67
  %202 = getelementptr inbounds float, float* %198, i64 2
  %203 = load float, float* %202, align 4, !tbaa !67
  %204 = getelementptr inbounds float, float* %198, i64 3
  %205 = load float, float* %204, align 4, !tbaa !67
  %206 = insertelement <2 x float> undef, float %199, i32 0
  %207 = insertelement <2 x float> %206, float %201, i32 1
  %208 = insertelement <2 x float> undef, float %203, i32 0
  %209 = insertelement <2 x float> %208, float %205, i32 1
  %210 = bitcast float* %197 to <2 x float>*
  store <2 x float> %207, <2 x float>* %210, align 16
  %211 = getelementptr inbounds float, float* %197, i64 2
  %212 = bitcast float* %211 to <2 x float>*
  store <2 x float> %209, <2 x float>* %212, align 8
  %213 = add nsw i64 %i1.05.i, 8
  %214 = icmp slt i64 %213, %100
  br i1 %214, label %179, label %.preheader.i.loopexit.unr-lcssa

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %i2.04.i = phi i64 [ %219, %scalar.ph ], [ %i2.04.i.ph, %scalar.ph.preheader ]
  %215 = getelementptr inbounds float, float* %129, i64 %i2.04.i
  %216 = bitcast float* %215 to i32*
  %.val.i1.i.i = load i32, i32* %216, align 4, !tbaa !67
  %217 = getelementptr inbounds float, float* null, i64 %i2.04.i
  %218 = bitcast float* %217 to i32*
  store i32 %.val.i1.i.i, i32* %218, align 4, !tbaa !67
  %219 = add nsw i64 %i2.04.i, 1
  %exitcond.i = icmp eq i64 %219, %17
  br i1 %exitcond.i, label %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit.loopexit, label %scalar.ph, !llvm.loop !74

_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit.loopexit: ; preds = %scalar.ph
  br label %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit

_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit: ; preds = %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit.loopexit, %middle.block, %.preheader.i, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceEE20evalSubExprsIfNeededEPf.exit.i
  %220 = icmp sgt i64 %3, 0
  br i1 %220, label %221, label %227

; <label>:221                                     ; preds = %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit
  %222 = bitcast %"class.Eigen::Map"* %array.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %222) #2
  %223 = bitcast %"class.Eigen::Map"* %array.i to i64*
  store i64 %22, i64* %223, align 8, !tbaa !76
  %224 = getelementptr inbounds %"class.Eigen::Map", %"class.Eigen::Map"* %array.i, i64 0, i32 0, i32 1, i32 0
  store i64 %3, i64* %224, align 8, !tbaa !80
  %225 = bitcast %"class.Eigen::Map"* %array.i to %"class.Eigen::DenseBase"*
  %226 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZN5EigenlsINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEEERSoS8_RKNS_9DenseBaseIT_EE(%"class.std::basic_ostream"* nonnull dereferenceable(272) %os, %"class.Eigen::DenseBase"* dereferenceable(1) %225)
          to label %.noexc1 unwind label %229

.noexc1:                                          ; preds = %221
  call void @llvm.lifetime.end(i64 24, i8* %222) #2
  br label %227

; <label>:227                                     ; preds = %_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_6TensorIfLi1ELi0ElEEEENS_13DefaultDeviceELb1EE3runERS7_RKS8_.exit, %.noexc1
  tail call void @free(i8* %18) #2
  %228 = inttoptr i64 %16 to i8*
  tail call void @free(i8* %228) #2
  ret %"class.std::basic_ostream"* %os

; <label>:229                                     ; preds = %221, %21
  %230 = landingpad { i8*, i32 }
          cleanup
  %231 = inttoptr i64 %16 to i8*
  tail call void @free(i8* %231) #2
  resume { i8*, i32 } %230
}

declare i32 @cudaMalloc(i8**, i64) #0

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen16CudaStreamDeviceC2Ev(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %num_devices.i = alloca i32, align 4
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !17
  %2 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  store %struct.CUstream_st** @_ZN5EigenL14default_streamE, %struct.CUstream_st*** %2, align 8, !tbaa !81
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
  %14 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([43 x i8], [43 x i8]* @.str.33, i64 0, i64 0), i64 42)
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
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.34, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 66, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv, i64 0, i64 0)) #21
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
  %64 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @.str.36, i64 0, i64 0), i64 34)
  %65 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, i32 %.lcssa)
  %66 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %65, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.37, i64 0, i64 0), i64 2)
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
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.34, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 77, i8* nonnull getelementptr inbounds ([35 x i8], [35 x i8]* @__PRETTY_FUNCTION__._ZN5EigenL20initializeDevicePropEv, i64 0, i64 0)) #21
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
  %2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str.42, i64 0, i64 0), i64 5)
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
  %18 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.43, i64 0, i64 0), i64 11)
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
  %34 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([3 x i8], [3 x i8]* @.str.44, i64 0, i64 0), i64 2)
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
  %63 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %62, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.45, i64 0, i64 0), i64 4)
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
  %105 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([8 x i8], [8 x i8]* @.str.46, i64 0, i64 0), i64 7)
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
  %113 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.48, i64 0, i64 0), i64 1)
  tail call void @abort() #21
  unreachable

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %112, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %114 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([5 x i8], [5 x i8]* @.str.47, i64 0, i64 0), i64 4)
  %115 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !1
  %116 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %115, i64 %indvars.iv.next, i32 0, i32 0
  %117 = load i8*, i8** %116, align 8, !tbaa !8
  %118 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %115, i64 %indvars.iv.next, i32 1
  %119 = load i64, i64* %118, align 8, !tbaa !13
  %120 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* %117, i64 %119)
  %121 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %120, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.48, i64 0, i64 0), i64 1)
  %122 = icmp sgt i64 %indvars.iv, 1
  br i1 %122, label %.lr.ph, label %._crit_edge.loopexit

; <label>:123                                     ; preds = %0
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_ZN5Eigen14verifyIsApproxIffEEbRKT_RKT0_(float* nocapture readonly dereferenceable(4) %a, float* nocapture readonly dereferenceable(4) %b) #7 comdat {
  %1 = load float, float* %a, align 4, !tbaa !67
  %2 = load float, float* %b, align 4, !tbaa !67
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
  %12 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cerr, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.55, i64 0, i64 0), i64 35)
  %13 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cerr, double 0x3F50624DE0000000)
  %14 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %13, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.56, i64 0, i64 0), i64 21)
  %15 = load float, float* %a, align 4, !tbaa !67
  %16 = load float, float* %b, align 4, !tbaa !67
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

declare i32 @cudaFree(i8*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN5Eigen16CudaStreamDeviceD2Ev(%"class.Eigen::CudaStreamDevice"* nocapture %this) unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTVN5Eigen16CudaStreamDeviceE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, align 8, !tbaa !17
  %2 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 3
  %3 = load i8*, i8** %2, align 8, !tbaa !64
  %4 = icmp eq i8* %3, null
  br i1 %4, label %_ZNK5Eigen16CudaStreamDevice10deallocateEPv.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %7 = load i32, i32* %6, align 8, !tbaa !66
  %8 = invoke i32 @cudaSetDevice(i32 %7)
          to label %.noexc unwind label %15

.noexc:                                           ; preds = %5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %.noexc
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %.noexc
  %12 = invoke i32 @cudaFree(i8* nonnull %3)
          to label %.noexc1 unwind label %15

.noexc1:                                          ; preds = %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %_ZNK5Eigen16CudaStreamDevice10deallocateEPv.exit, label %14

; <label>:14                                      ; preds = %.noexc1
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
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
  %3 = load i8*, i8** %2, align 8, !tbaa !64
  %4 = icmp eq i8* %3, null
  br i1 %4, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %7 = load i32, i32* %6, align 8, !tbaa !66
  %8 = invoke i32 @cudaSetDevice(i32 %7)
          to label %.noexc.i unwind label %15

.noexc.i:                                         ; preds = %5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %.noexc.i
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %.noexc.i
  %12 = invoke i32 @cudaFree(i8* nonnull %3)
          to label %.noexc1.i unwind label %15

.noexc1.i:                                        ; preds = %11
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %_ZN5Eigen16CudaStreamDeviceD2Ev.exit, label %14

; <label>:14                                      ; preds = %.noexc1.i
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
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
  %2 = load %struct.CUstream_st**, %struct.CUstream_st*** %1, align 8, !tbaa !81
  ret %struct.CUstream_st** %2
}

; Function Attrs: norecurse nounwind readonly uwtable
define linkonce_odr dereferenceable(632) %struct.cudaDeviceProp* @_ZNK5Eigen16CudaStreamDevice16devicePropertiesEv(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this) unnamed_addr #11 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %2 = load i32, i32* %1, align 8, !tbaa !66
  %3 = sext i32 %2 to i64
  %4 = load %struct.cudaDeviceProp*, %struct.cudaDeviceProp** @_ZN5EigenL18m_devicePropertiesE, align 8, !tbaa !16
  %5 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %4, i64 %3
  ret %struct.cudaDeviceProp* %5
}

; Function Attrs: uwtable
define linkonce_odr i8* @_ZNK5Eigen16CudaStreamDevice8allocateEm(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this, i64 %num_bytes) unnamed_addr #4 comdat align 2 {
  %result = alloca i8*, align 8
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %2 = load i32, i32* %1, align 8, !tbaa !66
  %3 = tail call i32 @cudaSetDevice(i32 %2)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 142, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:6                                       ; preds = %0
  %7 = bitcast i8** %result to i8*
  call void @llvm.lifetime.start(i64 8, i8* %7) #2
  %8 = call i32 @cudaMalloc(i8** nonnull %result, i64 %num_bytes)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %6
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 145, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:11                                      ; preds = %6
  %12 = load i8*, i8** %result, align 8, !tbaa !16
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.39, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 146, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice8allocateEm, i64 0, i64 0)) #21
  unreachable

; <label>:15                                      ; preds = %11
  call void @llvm.lifetime.end(i64 8, i8* nonnull %7) #2
  ret i8* %12
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK5Eigen16CudaStreamDevice10deallocateEPv(%"class.Eigen::CudaStreamDevice"* nocapture readonly %this, i8* %buffer) unnamed_addr #4 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 2
  %2 = load i32, i32* %1, align 8, !tbaa !66
  %3 = tail call i32 @cudaSetDevice(i32 %2)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 152, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:6                                       ; preds = %0
  %7 = icmp eq i8* %buffer, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %6
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.40, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 153, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:9                                       ; preds = %6
  %10 = tail call i32 @cudaFree(i8* nonnull %buffer)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %9
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 155, i8* nonnull getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice10deallocateEPv, i64 0, i64 0)) #21
  unreachable

; <label>:13                                      ; preds = %9
  ret void
}

; Function Attrs: uwtable
define linkonce_odr i8* @_ZNK5Eigen16CudaStreamDevice10scratchpadEv(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #4 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 3
  %2 = load i8*, i8** %1, align 8, !tbaa !64
  %3 = icmp eq i8* %2, null
  br i1 %3, label %4, label %10

; <label>:4                                       ; preds = %0
  %5 = bitcast %"class.Eigen::CudaStreamDevice"* %this to i8* (%"class.Eigen::CudaStreamDevice"*, i64)***
  %6 = load i8* (%"class.Eigen::CudaStreamDevice"*, i64)**, i8* (%"class.Eigen::CudaStreamDevice"*, i64)*** %5, align 8, !tbaa !17
  %7 = getelementptr inbounds i8* (%"class.Eigen::CudaStreamDevice"*, i64)*, i8* (%"class.Eigen::CudaStreamDevice"*, i64)** %6, i64 4
  %8 = load i8* (%"class.Eigen::CudaStreamDevice"*, i64)*, i8* (%"class.Eigen::CudaStreamDevice"*, i64)** %7, align 8
  %9 = tail call i8* %8(%"class.Eigen::CudaStreamDevice"* nonnull %this, i64 1028)
  store i8* %9, i8** %1, align 8, !tbaa !64
  br label %10

; <label>:10                                      ; preds = %4, %0
  %11 = phi i8* [ %9, %4 ], [ %2, %0 ]
  ret i8* %11
}

; Function Attrs: uwtable
define linkonce_odr i32* @_ZNK5Eigen16CudaStreamDevice9semaphoreEv(%"class.Eigen::CudaStreamDevice"* %this) unnamed_addr #4 comdat align 2 {
  %1 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 4
  %2 = load i32*, i32** %1, align 8, !tbaa !82
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
  store i8* %10, i8** %11, align 8, !tbaa !82
  %12 = getelementptr inbounds %"class.Eigen::CudaStreamDevice", %"class.Eigen::CudaStreamDevice"* %this, i64 0, i32 1
  %13 = load %struct.CUstream_st**, %struct.CUstream_st*** %12, align 8, !tbaa !81
  %14 = load %struct.CUstream_st*, %struct.CUstream_st** %13, align 8, !tbaa !16
  %15 = tail call i32 @cudaMemsetAsync(i8* %10, i32 0, i64 4, %struct.CUstream_st* %14)
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %17

._crit_edge:                                      ; preds = %4
  %.pre = load i32*, i32** %1, align 8, !tbaa !82
  br label %18

; <label>:17                                      ; preds = %4
  tail call void @__assert_fail(i8* nonnull getelementptr inbounds ([19 x i8], [19 x i8]* @.str.38, i64 0, i64 0), i8* nonnull getelementptr inbounds ([71 x i8], [71 x i8]* @.str.35, i64 0, i64 0), i32 171, i8* nonnull getelementptr inbounds ([65 x i8], [65 x i8]* @__PRETTY_FUNCTION__._ZNK5Eigen16CudaStreamDevice9semaphoreEv, i64 0, i64 0)) #21
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

; Function Attrs: noreturn
declare void @_ZSt19__throw_logic_errorPKc(i8*) #16

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
define linkonce_odr void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_6TensorIfLi1ELi0ElEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS4_EEEENS_13DefaultDeviceELb1EE3runERSC_RKSD_(%"class.Eigen::TensorAssignOp"* nocapture readonly dereferenceable(16) %expr, %"struct.Eigen::DefaultDevice"* dereferenceable(1) %device) #18 comdat align 2 {
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
  %12 = sdiv i64 %11, 16
  %13 = shl nsw i64 %12, 4
  %14 = icmp sgt i64 %11, 15
  br i1 %14, label %.preheader3.lr.ph, label %._crit_edge14

.preheader3.lr.ph:                                ; preds = %0
  %15 = inttoptr i64 %3 to float*
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.lr.ph, %20
  %i.013 = phi i64 [ 0, %.preheader3.lr.ph ], [ %21, %20 ]
  %evaluator.sroa.8.012 = phi i64 [ %7, %.preheader3.lr.ph ], [ %.lcssa21, %20 ]
  br label %23

._crit_edge14.loopexit:                           ; preds = %20
  %.lcssa21.lcssa = phi i64 [ %.lcssa21, %20 ]
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %0
  %evaluator.sroa.8.0.lcssa = phi i64 [ %7, %0 ], [ %.lcssa21.lcssa, %._crit_edge14.loopexit ]
  %16 = sdiv i64 %11, 4
  %17 = shl nsw i64 %16, 2
  %18 = icmp slt i64 %13, %17
  br i1 %18, label %.lr.ph9, label %.preheader

.lr.ph9:                                          ; preds = %._crit_edge14
  %19 = inttoptr i64 %3 to float*
  br label %82

; <label>:20                                      ; preds = %23
  %.lcssa21 = phi i64 [ %64, %23 ]
  %21 = add nuw nsw i64 %i.013, 16
  %22 = icmp slt i64 %21, %13
  br i1 %22, label %.preheader3, label %._crit_edge14.loopexit

; <label>:23                                      ; preds = %23, %.preheader3
  %j.011 = phi i64 [ 0, %.preheader3 ], [ %79, %23 ]
  %evaluator.sroa.8.110 = phi i64 [ %evaluator.sroa.8.012, %.preheader3 ], [ %64, %23 ]
  %24 = shl nsw i64 %j.011, 2
  %25 = add nuw nsw i64 %24, %i.013
  %26 = add i64 %25, %evaluator.sroa.8.110
  %27 = mul i64 %26, 6364136223846793005
  %28 = add i64 %27, -2720673578348880933
  %29 = lshr i64 %26, 22
  %30 = xor i64 %29, %26
  %31 = lshr i64 %26, 61
  %32 = add nuw nsw i64 %31, 22
  %33 = lshr i64 %30, %32
  %34 = trunc i64 %33 to i32
  %35 = and i32 %34, 8388607
  %36 = or i32 %35, 1065353216
  %37 = bitcast i32 %36 to float
  %38 = fadd float %37, -1.000000e+00
  %39 = mul i64 %28, 6364136223846793005
  %40 = add i64 %39, -2720673578348880933
  %41 = lshr i64 %28, 22
  %42 = xor i64 %41, %28
  %43 = lshr i64 %28, 61
  %44 = add nuw nsw i64 %43, 22
  %45 = lshr i64 %42, %44
  %46 = trunc i64 %45 to i32
  %47 = and i32 %46, 8388607
  %48 = or i32 %47, 1065353216
  %49 = bitcast i32 %48 to float
  %50 = fadd float %49, -1.000000e+00
  %51 = mul i64 %40, 6364136223846793005
  %52 = add i64 %51, -2720673578348880933
  %53 = lshr i64 %40, 22
  %54 = xor i64 %53, %40
  %55 = lshr i64 %40, 61
  %56 = add nuw nsw i64 %55, 22
  %57 = lshr i64 %54, %56
  %58 = trunc i64 %57 to i32
  %59 = and i32 %58, 8388607
  %60 = or i32 %59, 1065353216
  %61 = bitcast i32 %60 to float
  %62 = fadd float %61, -1.000000e+00
  %63 = mul i64 %52, 6364136223846793005
  %64 = add i64 %63, -2720673578348880933
  %65 = lshr i64 %52, 22
  %66 = xor i64 %65, %52
  %67 = lshr i64 %52, 61
  %68 = add nuw nsw i64 %67, 22
  %69 = lshr i64 %66, %68
  %70 = trunc i64 %69 to i32
  %71 = and i32 %70, 8388607
  %72 = or i32 %71, 1065353216
  %73 = bitcast i32 %72 to float
  %74 = fadd float %73, -1.000000e+00
  %75 = getelementptr inbounds float, float* %15, i64 %25
  store float %38, float* %75, align 4, !tbaa !67
  %76 = getelementptr inbounds float, float* %75, i64 1
  store float %50, float* %76, align 4, !tbaa !67
  %77 = getelementptr inbounds float, float* %75, i64 2
  store float %62, float* %77, align 4, !tbaa !67
  %78 = getelementptr inbounds float, float* %75, i64 3
  store float %74, float* %78, align 4, !tbaa !67
  %79 = add nuw nsw i64 %j.011, 1
  %exitcond17 = icmp eq i64 %79, 4
  br i1 %exitcond17, label %20, label %23

.preheader.loopexit:                              ; preds = %82
  %.lcssa = phi i64 [ %121, %82 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %._crit_edge14
  %evaluator.sroa.8.2.lcssa = phi i64 [ %evaluator.sroa.8.0.lcssa, %._crit_edge14 ], [ %.lcssa, %.preheader.loopexit ]
  %80 = icmp slt i64 %17, %11
  br i1 %80, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %81 = inttoptr i64 %3 to float*
  br label %138

; <label>:82                                      ; preds = %.lr.ph9, %82
  %i1.07 = phi i64 [ %13, %.lr.ph9 ], [ %136, %82 ]
  %evaluator.sroa.8.26 = phi i64 [ %evaluator.sroa.8.0.lcssa, %.lr.ph9 ], [ %121, %82 ]
  %83 = add i64 %i1.07, %evaluator.sroa.8.26
  %84 = mul i64 %83, 6364136223846793005
  %85 = add i64 %84, -2720673578348880933
  %86 = lshr i64 %83, 22
  %87 = xor i64 %86, %83
  %88 = lshr i64 %83, 61
  %89 = add nuw nsw i64 %88, 22
  %90 = lshr i64 %87, %89
  %91 = trunc i64 %90 to i32
  %92 = and i32 %91, 8388607
  %93 = or i32 %92, 1065353216
  %94 = bitcast i32 %93 to float
  %95 = fadd float %94, -1.000000e+00
  %96 = mul i64 %85, 6364136223846793005
  %97 = add i64 %96, -2720673578348880933
  %98 = lshr i64 %85, 22
  %99 = xor i64 %98, %85
  %100 = lshr i64 %85, 61
  %101 = add nuw nsw i64 %100, 22
  %102 = lshr i64 %99, %101
  %103 = trunc i64 %102 to i32
  %104 = and i32 %103, 8388607
  %105 = or i32 %104, 1065353216
  %106 = bitcast i32 %105 to float
  %107 = fadd float %106, -1.000000e+00
  %108 = mul i64 %97, 6364136223846793005
  %109 = add i64 %108, -2720673578348880933
  %110 = lshr i64 %97, 22
  %111 = xor i64 %110, %97
  %112 = lshr i64 %97, 61
  %113 = add nuw nsw i64 %112, 22
  %114 = lshr i64 %111, %113
  %115 = trunc i64 %114 to i32
  %116 = and i32 %115, 8388607
  %117 = or i32 %116, 1065353216
  %118 = bitcast i32 %117 to float
  %119 = fadd float %118, -1.000000e+00
  %120 = mul i64 %109, 6364136223846793005
  %121 = add i64 %120, -2720673578348880933
  %122 = lshr i64 %109, 22
  %123 = xor i64 %122, %109
  %124 = lshr i64 %109, 61
  %125 = add nuw nsw i64 %124, 22
  %126 = lshr i64 %123, %125
  %127 = trunc i64 %126 to i32
  %128 = and i32 %127, 8388607
  %129 = or i32 %128, 1065353216
  %130 = bitcast i32 %129 to float
  %131 = fadd float %130, -1.000000e+00
  %132 = getelementptr inbounds float, float* %19, i64 %i1.07
  store float %95, float* %132, align 4, !tbaa !67
  %133 = getelementptr inbounds float, float* %132, i64 1
  store float %107, float* %133, align 4, !tbaa !67
  %134 = getelementptr inbounds float, float* %132, i64 2
  store float %119, float* %134, align 4, !tbaa !67
  %135 = getelementptr inbounds float, float* %132, i64 3
  store float %131, float* %135, align 4, !tbaa !67
  %136 = add nsw i64 %i1.07, 4
  %137 = icmp slt i64 %136, %17
  br i1 %137, label %82, label %.preheader.loopexit

; <label>:138                                     ; preds = %138, %.lr.ph
  %i2.05 = phi i64 [ %17, %.lr.ph ], [ %153, %138 ]
  %evaluator.sroa.8.34 = phi i64 [ %evaluator.sroa.8.2.lcssa, %.lr.ph ], [ %141, %138 ]
  %139 = add i64 %i2.05, %evaluator.sroa.8.34
  %140 = mul i64 %139, 6364136223846793005
  %141 = add i64 %140, -2720673578348880933
  %142 = lshr i64 %139, 22
  %143 = xor i64 %142, %139
  %144 = lshr i64 %139, 61
  %145 = add nuw nsw i64 %144, 22
  %146 = lshr i64 %143, %145
  %147 = trunc i64 %146 to i32
  %148 = and i32 %147, 8388607
  %149 = or i32 %148, 1065353216
  %150 = bitcast i32 %149 to float
  %151 = fadd float %150, -1.000000e+00
  %152 = getelementptr inbounds float, float* %81, i64 %i2.05
  store float %151, float* %152, align 4, !tbaa !67
  %153 = add nsw i64 %i2.05, 1
  %exitcond = icmp eq i64 %153, %11
  br i1 %exitcond, label %._crit_edge.loopexit, label %138

._crit_edge.loopexit:                             ; preds = %138
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret void
}

; Function Attrs: nounwind
declare i32 @clock_gettime(i32, %struct.timespec*) #1

; Function Attrs: nounwind
declare i64 @random() #1

; Function Attrs: uwtable
define linkonce_odr nonnull dereferenceable(272) %"class.std::basic_ostream"* @_ZN5EigenlsINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEEERSoS8_RKNS_9DenseBaseIT_EE(%"class.std::basic_ostream"* dereferenceable(272) %s, %"class.Eigen::DenseBase"* nocapture readonly dereferenceable(1) %m) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %"class.Eigen::Array", align 8
  %2 = alloca %"struct.Eigen::IOFormat", align 8
  %3 = alloca %"class.std::__cxx11::basic_string", align 8
  %4 = alloca %"class.std::__cxx11::basic_string", align 8
  %5 = alloca %"class.std::__cxx11::basic_string", align 8
  %6 = alloca %"class.std::__cxx11::basic_string", align 8
  %7 = alloca %"class.std::__cxx11::basic_string", align 8
  %8 = alloca %"class.std::__cxx11::basic_string", align 8
  %9 = bitcast %"class.Eigen::Array"* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 16, i32 8, i1 false) #2, !alias.scope !83
  %10 = getelementptr inbounds %"class.Eigen::DenseBase", %"class.Eigen::DenseBase"* %m, i64 8
  %11 = bitcast %"class.Eigen::DenseBase"* %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !15
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit, label %14

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %"class.Eigen::Array", %"class.Eigen::Array"* %1, i64 0, i32 0, i32 0, i32 1
  %16 = bitcast %"class.Eigen::Array"* %1 to i8**
  %17 = icmp ugt i64 %12, 4611686018427387903
  br i1 %17, label %.noexc, label %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i

.noexc:                                           ; preds = %14
  call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i: ; preds = %14
  %18 = shl i64 %12, 2
  %19 = tail call noalias i8* @malloc(i64 %18) #2
  %20 = icmp eq i8* %19, null
  %21 = icmp ne i64 %18, 0
  %or.cond.i.i.i.i.i = and i1 %21, %20
  br i1 %or.cond.i.i.i.i.i, label %.noexc8, label %.lr.ph.i.i.i.i.i.i.i.i.preheader

.noexc8:                                          ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  call void @_ZN5Eigen8internal19throw_std_bad_allocEv()
  unreachable

.lr.ph.i.i.i.i.i.i.i.i.preheader:                 ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  store i8* %19, i8** %16, align 8, !tbaa !86
  %22 = bitcast i8* %19 to float*
  store i64 %12, i64* %15, align 8, !tbaa !88
  %23 = bitcast %"class.Eigen::DenseBase"* %m to float**
  %24 = load float*, float** %23, align 8, !tbaa !76, !noalias !83
  %25 = bitcast float* %24 to i8*
  %min.iters.check = icmp ult i64 %12, 4
  br i1 %min.iters.check, label %.lr.ph.i.i.i.i.i.i.i.i.preheader74, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.i.i.i.i.i.i.i.i.preheader
  %n.vec = and i64 %12, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph.i.i.i.i.i.i.i.i.preheader74, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %26 = shl i64 %12, 2
  %27 = add i64 %26, -4
  %scevgep = getelementptr i8, i8* %19, i64 %27
  %28 = add i64 %12, -1
  %scevgep70 = getelementptr float, float* %24, i64 %28
  %scevgep7071 = bitcast float* %scevgep70 to i8*
  %bound0 = icmp ule i8* %19, %scevgep7071
  %bound1 = icmp ule i8* %25, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph.i.i.i.i.i.i.i.i.preheader74, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %29 = add i64 %12, -4
  %30 = lshr i64 %29, 2
  %31 = add nuw nsw i64 %30, 1
  %xtraiter75 = and i64 %31, 7
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  br i1 %lcmp.mod76, label %vector.body.preheader.split, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter77 = phi i64 [ %prol.iter77.sub, %vector.body.prol ], [ %xtraiter75, %vector.body.prol.preheader ]
  %32 = getelementptr inbounds float, float* %22, i64 %index.prol
  %33 = getelementptr inbounds float, float* %24, i64 %index.prol
  %34 = bitcast float* %33 to <4 x i32>*
  %wide.load.prol = load <4 x i32>, <4 x i32>* %34, align 4, !tbaa !67, !noalias !83
  %35 = bitcast float* %32 to <4 x i32>*
  store <4 x i32> %wide.load.prol, <4 x i32>* %35, align 4, !tbaa !67, !noalias !83
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter77.sub = add i64 %prol.iter77, -1
  %prol.iter77.cmp = icmp eq i64 %prol.iter77.sub, 0
  br i1 %prol.iter77.cmp, label %vector.body.preheader.split.loopexit, label %vector.body.prol, !llvm.loop !89

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.next.prol.lcssa = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol.lcssa, %vector.body.preheader.split.loopexit ]
  %36 = icmp ult i64 %29, 28
  br i1 %36, label %middle.block, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.7, %vector.body ]
  %37 = getelementptr inbounds float, float* %22, i64 %index
  %38 = getelementptr inbounds float, float* %24, i64 %index
  %39 = bitcast float* %38 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %39, align 4, !tbaa !67, !noalias !83
  %40 = bitcast float* %37 to <4 x i32>*
  store <4 x i32> %wide.load, <4 x i32>* %40, align 4, !tbaa !67, !noalias !83
  %index.next = add i64 %index, 4
  %41 = getelementptr inbounds float, float* %22, i64 %index.next
  %42 = getelementptr inbounds float, float* %24, i64 %index.next
  %43 = bitcast float* %42 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %43, align 4, !tbaa !67, !noalias !83
  %44 = bitcast float* %41 to <4 x i32>*
  store <4 x i32> %wide.load.1, <4 x i32>* %44, align 4, !tbaa !67, !noalias !83
  %index.next.1 = add i64 %index, 8
  %45 = getelementptr inbounds float, float* %22, i64 %index.next.1
  %46 = getelementptr inbounds float, float* %24, i64 %index.next.1
  %47 = bitcast float* %46 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %47, align 4, !tbaa !67, !noalias !83
  %48 = bitcast float* %45 to <4 x i32>*
  store <4 x i32> %wide.load.2, <4 x i32>* %48, align 4, !tbaa !67, !noalias !83
  %index.next.2 = add i64 %index, 12
  %49 = getelementptr inbounds float, float* %22, i64 %index.next.2
  %50 = getelementptr inbounds float, float* %24, i64 %index.next.2
  %51 = bitcast float* %50 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %51, align 4, !tbaa !67, !noalias !83
  %52 = bitcast float* %49 to <4 x i32>*
  store <4 x i32> %wide.load.3, <4 x i32>* %52, align 4, !tbaa !67, !noalias !83
  %index.next.3 = add i64 %index, 16
  %53 = getelementptr inbounds float, float* %22, i64 %index.next.3
  %54 = getelementptr inbounds float, float* %24, i64 %index.next.3
  %55 = bitcast float* %54 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %55, align 4, !tbaa !67, !noalias !83
  %56 = bitcast float* %53 to <4 x i32>*
  store <4 x i32> %wide.load.4, <4 x i32>* %56, align 4, !tbaa !67, !noalias !83
  %index.next.4 = add i64 %index, 20
  %57 = getelementptr inbounds float, float* %22, i64 %index.next.4
  %58 = getelementptr inbounds float, float* %24, i64 %index.next.4
  %59 = bitcast float* %58 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %59, align 4, !tbaa !67, !noalias !83
  %60 = bitcast float* %57 to <4 x i32>*
  store <4 x i32> %wide.load.5, <4 x i32>* %60, align 4, !tbaa !67, !noalias !83
  %index.next.5 = add i64 %index, 24
  %61 = getelementptr inbounds float, float* %22, i64 %index.next.5
  %62 = getelementptr inbounds float, float* %24, i64 %index.next.5
  %63 = bitcast float* %62 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %63, align 4, !tbaa !67, !noalias !83
  %64 = bitcast float* %61 to <4 x i32>*
  store <4 x i32> %wide.load.6, <4 x i32>* %64, align 4, !tbaa !67, !noalias !83
  %index.next.6 = add i64 %index, 28
  %65 = getelementptr inbounds float, float* %22, i64 %index.next.6
  %66 = getelementptr inbounds float, float* %24, i64 %index.next.6
  %67 = bitcast float* %66 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %67, align 4, !tbaa !67, !noalias !83
  %68 = bitcast float* %65 to <4 x i32>*
  store <4 x i32> %wide.load.7, <4 x i32>* %68, align 4, !tbaa !67, !noalias !83
  %index.next.7 = add i64 %index, 32
  %69 = icmp eq i64 %index.next.7, %n.vec
  br i1 %69, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !90

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit, label %.lr.ph.i.i.i.i.i.i.i.i.preheader74

.lr.ph.i.i.i.i.i.i.i.i.preheader74:               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.i.i.i.i.i.i.i.i.preheader
  %i.01.i.i.i.i.i.i.i.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph.i.i.i.i.i.i.i.i.preheader ], [ %n.vec, %middle.block ]
  %70 = sub i64 %12, %i.01.i.i.i.i.i.i.i.i.ph
  %71 = add i64 %12, -1
  %72 = sub i64 %71, %i.01.i.i.i.i.i.i.i.i.ph
  %xtraiter = and i64 %70, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split, label %.lr.ph.i.i.i.i.i.i.i.i.prol.preheader

.lr.ph.i.i.i.i.i.i.i.i.prol.preheader:            ; preds = %.lr.ph.i.i.i.i.i.i.i.i.preheader74
  br label %.lr.ph.i.i.i.i.i.i.i.i.prol

.lr.ph.i.i.i.i.i.i.i.i.prol:                      ; preds = %.lr.ph.i.i.i.i.i.i.i.i.prol.preheader, %.lr.ph.i.i.i.i.i.i.i.i.prol
  %i.01.i.i.i.i.i.i.i.i.prol = phi i64 [ %78, %.lr.ph.i.i.i.i.i.i.i.i.prol ], [ %i.01.i.i.i.i.i.i.i.i.ph, %.lr.ph.i.i.i.i.i.i.i.i.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.i.i.i.i.i.i.i.i.prol ], [ %xtraiter, %.lr.ph.i.i.i.i.i.i.i.i.prol.preheader ]
  %73 = getelementptr inbounds float, float* %22, i64 %i.01.i.i.i.i.i.i.i.i.prol
  %74 = getelementptr inbounds float, float* %24, i64 %i.01.i.i.i.i.i.i.i.i.prol
  %75 = bitcast float* %74 to i32*
  %76 = load i32, i32* %75, align 4, !tbaa !67, !noalias !83
  %77 = bitcast float* %73 to i32*
  store i32 %76, i32* %77, align 4, !tbaa !67, !noalias !83
  %78 = add nuw nsw i64 %i.01.i.i.i.i.i.i.i.i.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.loopexit, label %.lr.ph.i.i.i.i.i.i.i.i.prol, !llvm.loop !91

.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.loopexit: ; preds = %.lr.ph.i.i.i.i.i.i.i.i.prol
  %.lcssa = phi i64 [ %78, %.lr.ph.i.i.i.i.i.i.i.i.prol ]
  br label %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split

.lr.ph.i.i.i.i.i.i.i.i.preheader74.split:         ; preds = %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.loopexit, %.lr.ph.i.i.i.i.i.i.i.i.preheader74
  %i.01.i.i.i.i.i.i.i.i.unr = phi i64 [ %i.01.i.i.i.i.i.i.i.i.ph, %.lr.ph.i.i.i.i.i.i.i.i.preheader74 ], [ %.lcssa, %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.loopexit ]
  %79 = icmp ult i64 %72, 7
  br i1 %79, label %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit, label %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.split

.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.split:   ; preds = %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split
  br label %.lr.ph.i.i.i.i.i.i.i.i

.lr.ph.i.i.i.i.i.i.i.i:                           ; preds = %.lr.ph.i.i.i.i.i.i.i.i, %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.split
  %i.01.i.i.i.i.i.i.i.i = phi i64 [ %i.01.i.i.i.i.i.i.i.i.unr, %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split.split ], [ %127, %.lr.ph.i.i.i.i.i.i.i.i ]
  %80 = getelementptr inbounds float, float* %22, i64 %i.01.i.i.i.i.i.i.i.i
  %81 = getelementptr inbounds float, float* %24, i64 %i.01.i.i.i.i.i.i.i.i
  %82 = bitcast float* %81 to i32*
  %83 = load i32, i32* %82, align 4, !tbaa !67, !noalias !83
  %84 = bitcast float* %80 to i32*
  store i32 %83, i32* %84, align 4, !tbaa !67, !noalias !83
  %85 = add nuw nsw i64 %i.01.i.i.i.i.i.i.i.i, 1
  %86 = getelementptr inbounds float, float* %22, i64 %85
  %87 = getelementptr inbounds float, float* %24, i64 %85
  %88 = bitcast float* %87 to i32*
  %89 = load i32, i32* %88, align 4, !tbaa !67, !noalias !83
  %90 = bitcast float* %86 to i32*
  store i32 %89, i32* %90, align 4, !tbaa !67, !noalias !83
  %91 = add nsw i64 %i.01.i.i.i.i.i.i.i.i, 2
  %92 = getelementptr inbounds float, float* %22, i64 %91
  %93 = getelementptr inbounds float, float* %24, i64 %91
  %94 = bitcast float* %93 to i32*
  %95 = load i32, i32* %94, align 4, !tbaa !67, !noalias !83
  %96 = bitcast float* %92 to i32*
  store i32 %95, i32* %96, align 4, !tbaa !67, !noalias !83
  %97 = add nsw i64 %i.01.i.i.i.i.i.i.i.i, 3
  %98 = getelementptr inbounds float, float* %22, i64 %97
  %99 = getelementptr inbounds float, float* %24, i64 %97
  %100 = bitcast float* %99 to i32*
  %101 = load i32, i32* %100, align 4, !tbaa !67, !noalias !83
  %102 = bitcast float* %98 to i32*
  store i32 %101, i32* %102, align 4, !tbaa !67, !noalias !83
  %103 = add nsw i64 %i.01.i.i.i.i.i.i.i.i, 4
  %104 = getelementptr inbounds float, float* %22, i64 %103
  %105 = getelementptr inbounds float, float* %24, i64 %103
  %106 = bitcast float* %105 to i32*
  %107 = load i32, i32* %106, align 4, !tbaa !67, !noalias !83
  %108 = bitcast float* %104 to i32*
  store i32 %107, i32* %108, align 4, !tbaa !67, !noalias !83
  %109 = add nsw i64 %i.01.i.i.i.i.i.i.i.i, 5
  %110 = getelementptr inbounds float, float* %22, i64 %109
  %111 = getelementptr inbounds float, float* %24, i64 %109
  %112 = bitcast float* %111 to i32*
  %113 = load i32, i32* %112, align 4, !tbaa !67, !noalias !83
  %114 = bitcast float* %110 to i32*
  store i32 %113, i32* %114, align 4, !tbaa !67, !noalias !83
  %115 = add nsw i64 %i.01.i.i.i.i.i.i.i.i, 6
  %116 = getelementptr inbounds float, float* %22, i64 %115
  %117 = getelementptr inbounds float, float* %24, i64 %115
  %118 = bitcast float* %117 to i32*
  %119 = load i32, i32* %118, align 4, !tbaa !67, !noalias !83
  %120 = bitcast float* %116 to i32*
  store i32 %119, i32* %120, align 4, !tbaa !67, !noalias !83
  %121 = add nsw i64 %i.01.i.i.i.i.i.i.i.i, 7
  %122 = getelementptr inbounds float, float* %22, i64 %121
  %123 = getelementptr inbounds float, float* %24, i64 %121
  %124 = bitcast float* %123 to i32*
  %125 = load i32, i32* %124, align 4, !tbaa !67, !noalias !83
  %126 = bitcast float* %122 to i32*
  store i32 %125, i32* %126, align 4, !tbaa !67, !noalias !83
  %127 = add nsw i64 %i.01.i.i.i.i.i.i.i.i, 8
  %exitcond.i.i.i.i.i.i.i.i.7 = icmp eq i64 %127, %12
  br i1 %exitcond.i.i.i.i.i.i.i.i.7, label %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit.unr-lcssa, label %.lr.ph.i.i.i.i.i.i.i.i, !llvm.loop !92

_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit.unr-lcssa: ; preds = %.lr.ph.i.i.i.i.i.i.i.i
  br label %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit

_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit: ; preds = %.lr.ph.i.i.i.i.i.i.i.i.preheader74.split, %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit.unr-lcssa
  br label %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit

_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit: ; preds = %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit, %middle.block, %0
  %128 = phi i8* [ null, %0 ], [ %19, %middle.block ], [ %19, %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit.loopexit ]
  %129 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 2
  %130 = bitcast %"class.std::__cxx11::basic_string"* %3 to %union.anon**
  store %union.anon* %129, %union.anon** %130, align 8, !tbaa !12
  %131 = bitcast %union.anon* %129 to i8*
  store i8 32, i8* %131, align 8, !tbaa !14
  %132 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 1
  store i64 1, i64* %132, align 8, !tbaa !13
  %133 = getelementptr inbounds i8, i8* %131, i64 1
  store i8 0, i8* %133, align 1, !tbaa !14
  %134 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 2
  %135 = bitcast %"class.std::__cxx11::basic_string"* %4 to %union.anon**
  store %union.anon* %134, %union.anon** %135, align 8, !tbaa !12
  %136 = bitcast %union.anon* %134 to i8*
  store i8 10, i8* %136, align 8, !tbaa !14
  %137 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 1
  store i64 1, i64* %137, align 8, !tbaa !13
  %138 = getelementptr inbounds i8, i8* %136, i64 1
  store i8 0, i8* %138, align 1, !tbaa !14
  %139 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 2
  %140 = bitcast %"class.std::__cxx11::basic_string"* %5 to %union.anon**
  store %union.anon* %139, %union.anon** %140, align 8, !tbaa !12
  %141 = bitcast %union.anon* %139 to i8*
  %142 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 1
  store i64 0, i64* %142, align 8, !tbaa !13
  store i8 0, i8* %141, align 8, !tbaa !14
  %143 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 2
  %144 = bitcast %"class.std::__cxx11::basic_string"* %6 to %union.anon**
  store %union.anon* %143, %union.anon** %144, align 8, !tbaa !12
  %145 = bitcast %union.anon* %143 to i8*
  %146 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 1
  store i64 0, i64* %146, align 8, !tbaa !13
  store i8 0, i8* %145, align 8, !tbaa !14
  %147 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %7, i64 0, i32 2
  %148 = bitcast %"class.std::__cxx11::basic_string"* %7 to %union.anon**
  store %union.anon* %147, %union.anon** %148, align 8, !tbaa !12
  %149 = bitcast %union.anon* %147 to i8*
  %150 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %7, i64 0, i32 1
  store i64 0, i64* %150, align 8, !tbaa !13
  store i8 0, i8* %149, align 8, !tbaa !14
  %151 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %8, i64 0, i32 2
  %152 = bitcast %"class.std::__cxx11::basic_string"* %8 to %union.anon**
  store %union.anon* %151, %union.anon** %152, align 8, !tbaa !12
  %153 = bitcast %union.anon* %151 to i8*
  %154 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %8, i64 0, i32 1
  store i64 0, i64* %154, align 8, !tbaa !13
  store i8 0, i8* %153, align 8, !tbaa !14
  invoke void @_ZN5Eigen8IOFormatC2EiiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_S8_S8_S8_(%"struct.Eigen::IOFormat"* nonnull %2, i32 -1, i32 0, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %3, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %4, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %5, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %6, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %7, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %8)
          to label %155 unwind label %224

; <label>:155                                     ; preds = %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit
  %156 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZN5Eigen8internal12print_matrixINS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEEEERSoS4_RKT_RKNS_8IOFormatE(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, %"class.Eigen::Array"* nonnull dereferenceable(16) %1, %"struct.Eigen::IOFormat"* nonnull dereferenceable(232) %2)
          to label %157 unwind label %228

; <label>:157                                     ; preds = %155
  %158 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 6, i32 0, i32 0
  %159 = load i8*, i8** %158, align 8, !tbaa !8
  %160 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 6, i32 2
  %161 = bitcast %union.anon* %160 to i8*
  %162 = icmp eq i8* %159, %161
  br i1 %162, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i, label %163

; <label>:163                                     ; preds = %157
  call void @_ZdlPv(i8* %159) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i: ; preds = %163, %157
  %164 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 5, i32 0, i32 0
  %165 = load i8*, i8** %164, align 8, !tbaa !8
  %166 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 5, i32 2
  %167 = bitcast %union.anon* %166 to i8*
  %168 = icmp eq i8* %165, %167
  br i1 %168, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i, label %169

; <label>:169                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i
  call void @_ZdlPv(i8* %165) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i: ; preds = %169, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i
  %170 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 4, i32 0, i32 0
  %171 = load i8*, i8** %170, align 8, !tbaa !8
  %172 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 4, i32 2
  %173 = bitcast %union.anon* %172 to i8*
  %174 = icmp eq i8* %171, %173
  br i1 %174, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i, label %175

; <label>:175                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i
  call void @_ZdlPv(i8* %171) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i: ; preds = %175, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i
  %176 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 3, i32 0, i32 0
  %177 = load i8*, i8** %176, align 8, !tbaa !8
  %178 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 3, i32 2
  %179 = bitcast %union.anon* %178 to i8*
  %180 = icmp eq i8* %177, %179
  br i1 %180, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i, label %181

; <label>:181                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i
  call void @_ZdlPv(i8* %177) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i: ; preds = %181, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i
  %182 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 2, i32 0, i32 0
  %183 = load i8*, i8** %182, align 8, !tbaa !8
  %184 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 2, i32 2
  %185 = bitcast %union.anon* %184 to i8*
  %186 = icmp eq i8* %183, %185
  br i1 %186, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i, label %187

; <label>:187                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i
  call void @_ZdlPv(i8* %183) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i: ; preds = %187, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i
  %188 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 1, i32 0, i32 0
  %189 = load i8*, i8** %188, align 8, !tbaa !8
  %190 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 1, i32 2
  %191 = bitcast %union.anon* %190 to i8*
  %192 = icmp eq i8* %189, %191
  br i1 %192, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i, label %193

; <label>:193                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i
  call void @_ZdlPv(i8* %189) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i: ; preds = %193, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i
  %194 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 0, i32 0, i32 0
  %195 = load i8*, i8** %194, align 8, !tbaa !8
  %196 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 0, i32 2
  %197 = bitcast %union.anon* %196 to i8*
  %198 = icmp eq i8* %195, %197
  br i1 %198, label %_ZN5Eigen8IOFormatD2Ev.exit, label %199

; <label>:199                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i
  call void @_ZdlPv(i8* %195) #2
  br label %_ZN5Eigen8IOFormatD2Ev.exit

_ZN5Eigen8IOFormatD2Ev.exit:                      ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i, %199
  %200 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %8, i64 0, i32 0, i32 0
  %201 = load i8*, i8** %200, align 8, !tbaa !8
  %202 = icmp eq i8* %201, %153
  br i1 %202, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %203

; <label>:203                                     ; preds = %_ZN5Eigen8IOFormatD2Ev.exit
  call void @_ZdlPv(i8* %201) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %_ZN5Eigen8IOFormatD2Ev.exit, %203
  %204 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %7, i64 0, i32 0, i32 0
  %205 = load i8*, i8** %204, align 8, !tbaa !8
  %206 = icmp eq i8* %205, %149
  br i1 %206, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit45, label %207

; <label>:207                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  call void @_ZdlPv(i8* %205) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit45

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit45: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %207
  %208 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 0, i32 0
  %209 = load i8*, i8** %208, align 8, !tbaa !8
  %210 = icmp eq i8* %209, %145
  br i1 %210, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46, label %211

; <label>:211                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit45
  call void @_ZdlPv(i8* %209) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit45, %211
  %212 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 0, i32 0
  %213 = load i8*, i8** %212, align 8, !tbaa !8
  %214 = icmp eq i8* %213, %141
  br i1 %214, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit47, label %215

; <label>:215                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46
  call void @_ZdlPv(i8* %213) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit47

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit47: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit46, %215
  %216 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 0, i32 0
  %217 = load i8*, i8** %216, align 8, !tbaa !8
  %218 = icmp eq i8* %217, %136
  br i1 %218, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit48, label %219

; <label>:219                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit47
  call void @_ZdlPv(i8* %217) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit48

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit48: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit47, %219
  %220 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0
  %221 = load i8*, i8** %220, align 8, !tbaa !8
  %222 = icmp eq i8* %221, %131
  br i1 %222, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit49, label %223

; <label>:223                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit48
  call void @_ZdlPv(i8* %221) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit49

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit49: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit48, %223
  call void @free(i8* %128) #2
  ret %"class.std::basic_ostream"* %156

; <label>:224                                     ; preds = %_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv.exit
  %225 = landingpad { i8*, i32 }
          cleanup
  %226 = extractvalue { i8*, i32 } %225, 0
  %227 = extractvalue { i8*, i32 } %225, 1
  br label %_ZN5Eigen8IOFormatD2Ev.exit56

; <label>:228                                     ; preds = %155
  %229 = landingpad { i8*, i32 }
          cleanup
  %230 = extractvalue { i8*, i32 } %229, 0
  %231 = extractvalue { i8*, i32 } %229, 1
  %232 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 6, i32 0, i32 0
  %233 = load i8*, i8** %232, align 8, !tbaa !8
  %234 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 6, i32 2
  %235 = bitcast %union.anon* %234 to i8*
  %236 = icmp eq i8* %233, %235
  br i1 %236, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i50, label %237

; <label>:237                                     ; preds = %228
  call void @_ZdlPv(i8* %233) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i50

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i50: ; preds = %237, %228
  %238 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 5, i32 0, i32 0
  %239 = load i8*, i8** %238, align 8, !tbaa !8
  %240 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 5, i32 2
  %241 = bitcast %union.anon* %240 to i8*
  %242 = icmp eq i8* %239, %241
  br i1 %242, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i51, label %243

; <label>:243                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i50
  call void @_ZdlPv(i8* %239) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i51

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i51: ; preds = %243, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit.i50
  %244 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 4, i32 0, i32 0
  %245 = load i8*, i8** %244, align 8, !tbaa !8
  %246 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 4, i32 2
  %247 = bitcast %union.anon* %246 to i8*
  %248 = icmp eq i8* %245, %247
  br i1 %248, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i52, label %249

; <label>:249                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i51
  call void @_ZdlPv(i8* %245) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i52

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i52: ; preds = %249, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit1.i51
  %250 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 3, i32 0, i32 0
  %251 = load i8*, i8** %250, align 8, !tbaa !8
  %252 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 3, i32 2
  %253 = bitcast %union.anon* %252 to i8*
  %254 = icmp eq i8* %251, %253
  br i1 %254, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i53, label %255

; <label>:255                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i52
  call void @_ZdlPv(i8* %251) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i53

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i53: ; preds = %255, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit2.i52
  %256 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 2, i32 0, i32 0
  %257 = load i8*, i8** %256, align 8, !tbaa !8
  %258 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 2, i32 2
  %259 = bitcast %union.anon* %258 to i8*
  %260 = icmp eq i8* %257, %259
  br i1 %260, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i54, label %261

; <label>:261                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i53
  call void @_ZdlPv(i8* %257) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i54

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i54: ; preds = %261, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit3.i53
  %262 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 1, i32 0, i32 0
  %263 = load i8*, i8** %262, align 8, !tbaa !8
  %264 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 1, i32 2
  %265 = bitcast %union.anon* %264 to i8*
  %266 = icmp eq i8* %263, %265
  br i1 %266, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i55, label %267

; <label>:267                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i54
  call void @_ZdlPv(i8* %263) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i55

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i55: ; preds = %267, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit4.i54
  %268 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 0, i32 0, i32 0
  %269 = load i8*, i8** %268, align 8, !tbaa !8
  %270 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %2, i64 0, i32 0, i32 2
  %271 = bitcast %union.anon* %270 to i8*
  %272 = icmp eq i8* %269, %271
  br i1 %272, label %_ZN5Eigen8IOFormatD2Ev.exit56, label %273

; <label>:273                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i55
  call void @_ZdlPv(i8* %269) #2
  br label %_ZN5Eigen8IOFormatD2Ev.exit56

_ZN5Eigen8IOFormatD2Ev.exit56:                    ; preds = %273, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i55, %224
  %.01 = phi i8* [ %226, %224 ], [ %230, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i55 ], [ %230, %273 ]
  %.0 = phi i32 [ %227, %224 ], [ %231, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit5.i55 ], [ %231, %273 ]
  %274 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %8, i64 0, i32 0, i32 0
  %275 = load i8*, i8** %274, align 8, !tbaa !8
  %276 = icmp eq i8* %275, %153
  br i1 %276, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit57, label %277

; <label>:277                                     ; preds = %_ZN5Eigen8IOFormatD2Ev.exit56
  call void @_ZdlPv(i8* %275) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit57

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit57: ; preds = %277, %_ZN5Eigen8IOFormatD2Ev.exit56
  %278 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %7, i64 0, i32 0, i32 0
  %279 = load i8*, i8** %278, align 8, !tbaa !8
  %280 = icmp eq i8* %279, %149
  br i1 %280, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit58, label %281

; <label>:281                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit57
  call void @_ZdlPv(i8* %279) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit58

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit58: ; preds = %281, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit57
  %282 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 0, i32 0
  %283 = load i8*, i8** %282, align 8, !tbaa !8
  %284 = icmp eq i8* %283, %145
  br i1 %284, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit59, label %285

; <label>:285                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit58
  call void @_ZdlPv(i8* %283) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit59

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit59: ; preds = %285, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit58
  %286 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %5, i64 0, i32 0, i32 0
  %287 = load i8*, i8** %286, align 8, !tbaa !8
  %288 = icmp eq i8* %287, %141
  br i1 %288, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit60, label %289

; <label>:289                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit59
  call void @_ZdlPv(i8* %287) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit60

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit60: ; preds = %289, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit59
  %290 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %4, i64 0, i32 0, i32 0
  %291 = load i8*, i8** %290, align 8, !tbaa !8
  %292 = icmp eq i8* %291, %136
  br i1 %292, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit61, label %293

; <label>:293                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit60
  call void @_ZdlPv(i8* %291) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit61

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit61: ; preds = %293, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit60
  %294 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %3, i64 0, i32 0, i32 0
  %295 = load i8*, i8** %294, align 8, !tbaa !8
  %296 = icmp eq i8* %295, %131
  br i1 %296, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit62, label %297

; <label>:297                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit61
  call void @_ZdlPv(i8* %295) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit62

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit62: ; preds = %297, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit61
  call void @free(i8* %128) #2
  %298 = insertvalue { i8*, i32 } undef, i8* %.01, 0
  %299 = insertvalue { i8*, i32 } %298, i32 %.0, 1
  resume { i8*, i32 } %299
}

; Function Attrs: uwtable
define linkonce_odr nonnull dereferenceable(272) %"class.std::basic_ostream"* @_ZN5Eigen8internal12print_matrixINS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEEEERSoS4_RKT_RKNS_8IOFormatE(%"class.std::basic_ostream"* dereferenceable(272) %s, %"class.Eigen::Array"* nocapture readonly dereferenceable(16) %_m, %"struct.Eigen::IOFormat"* nocapture readonly dereferenceable(232) %fmt) #4 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %sstr = alloca %"class.std::__cxx11::basic_stringstream", align 8
  %1 = alloca %"class.std::__cxx11::basic_string", align 8
  %2 = getelementptr inbounds %"class.Eigen::Array", %"class.Eigen::Array"* %_m, i64 0, i32 0, i32 0, i32 1
  %3 = load i64, i64* %2, align 8, !tbaa !88
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %16

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 0, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8, !tbaa !8
  %8 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 0, i32 1
  %9 = load i64, i64* %8, align 8, !tbaa !13
  %10 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %7, i64 %9)
  %11 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 1, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8, !tbaa !8
  %13 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 1, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !13
  %15 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %10, i8* %12, i64 %14)
  br label %213

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 7
  %18 = bitcast i32* %17 to i64*
  %19 = load i64, i64* %18, align 8
  %20 = trunc i64 %19 to i32
  switch i32 %20, label %21 [
    i32 -1, label %.thread7
    i32 -2, label %.thread
  ]

; <label>:21                                      ; preds = %16
  %sext = shl i64 %19, 32
  %22 = ashr exact i64 %sext, 32
  %23 = icmp eq i32 %20, 0
  br i1 %23, label %.thread7, label %.thread

.thread:                                          ; preds = %21, %16
  %explicit_precision.06 = phi i64 [ %22, %21 ], [ 6, %16 ]
  %24 = bitcast %"class.std::basic_ostream"* %s to i8**
  %25 = load i8*, i8** %24, align 8, !tbaa !17
  %26 = getelementptr i8, i8* %25, i64 -24
  %27 = bitcast i8* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = bitcast %"class.std::basic_ostream"* %s to i8*
  %30 = getelementptr inbounds i8, i8* %29, i64 %28
  %31 = getelementptr inbounds i8, i8* %30, i64 8
  %32 = bitcast i8* %31 to i64*
  %33 = load i64, i64* %32, align 8, !tbaa !93
  store i64 %explicit_precision.06, i64* %32, align 8, !tbaa !93
  br label %.thread7

.thread7:                                         ; preds = %21, %16, %.thread
  %34 = phi i1 [ true, %.thread ], [ false, %21 ], [ false, %16 ]
  %old_precision.0 = phi i64 [ %33, %.thread ], [ 0, %21 ], [ 0, %16 ]
  %35 = and i64 %19, 4294967296
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %.preheader8, label %.loopexit

.preheader8:                                      ; preds = %.thread7
  %37 = bitcast %"class.std::__cxx11::basic_stringstream"* %sstr to i8*
  %38 = bitcast %"class.std::__cxx11::basic_stringstream"* %sstr to i8**
  %39 = bitcast %"class.std::basic_ostream"* %s to i8**
  %40 = bitcast %"class.std::basic_ostream"* %s to i8*
  %41 = getelementptr inbounds %"class.Eigen::Array", %"class.Eigen::Array"* %_m, i64 0, i32 0, i32 0, i32 0
  %42 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 0, i32 1
  %43 = bitcast %"class.std::basic_ostream.base"* %42 to %"class.std::basic_ostream"*
  %44 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 1
  %45 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 1
  %46 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %47 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %48 = bitcast %union.anon* %47 to i8*
  %49 = load i64, i64* bitcast ([10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE to i64*), align 8
  %50 = bitcast %"class.std::__cxx11::basic_stringstream"* %sstr to i64*
  %51 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 8) to i64*), align 8
  %.cast.i.i3 = inttoptr i64 %49 to i8*
  %52 = getelementptr i8, i8* %.cast.i.i3, i64 -24
  %53 = bitcast i8* %52 to i64*
  %54 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 9) to i64*), align 8
  %55 = bitcast %"class.std::basic_ostream.base"* %42 to i64*
  %56 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 1, i32 0, i32 0
  %57 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 1, i32 2, i32 0, i32 0
  %58 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 1, i32 2, i32 2
  %59 = bitcast %union.anon* %58 to i8*
  %60 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 1, i32 0, i32 7
  %61 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i64*), align 8
  %62 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 3) to i64*), align 8
  %.cast.i.i.i.i4 = inttoptr i64 %61 to i8*
  %63 = getelementptr i8, i8* %.cast.i.i.i.i4, i64 -24
  %64 = bitcast i8* %63 to i64*
  %65 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 0, i32 0, i32 1
  %66 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %sstr, i64 0, i32 2, i32 0
  %67 = icmp sgt i64 %3, 0
  br i1 %67, label %.lr.ph14.preheader, label %.loopexit

.lr.ph14.preheader:                               ; preds = %.preheader8
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader, %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5
  %i.013 = phi i64 [ %102, %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5 ], [ 0, %.lr.ph14.preheader ]
  %width.112 = phi i64 [ %89, %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5 ], [ 0, %.lr.ph14.preheader ]
  call void @llvm.lifetime.start(i64 392, i8* %37) #2
  call void @_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::__cxx11::basic_stringstream"* nonnull %sstr, i32 24)
  %68 = load i8*, i8** %38, align 8, !tbaa !17
  %69 = getelementptr i8, i8* %68, i64 -24
  %70 = bitcast i8* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds i8, i8* %37, i64 %71
  %73 = bitcast i8* %72 to %"class.std::basic_ios"*
  %74 = load i8*, i8** %39, align 8, !tbaa !17
  %75 = getelementptr i8, i8* %74, i64 -24
  %76 = bitcast i8* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds i8, i8* %40, i64 %77
  %79 = bitcast i8* %78 to %"class.std::basic_ios"*
  %80 = invoke dereferenceable(264) %"class.std::basic_ios"* @_ZNSt9basic_iosIcSt11char_traitsIcEE7copyfmtERKS2_(%"class.std::basic_ios"* %73, %"class.std::basic_ios"* dereferenceable(264) %79)
          to label %81 unwind label %105

; <label>:81                                      ; preds = %.lr.ph14
  %82 = load float*, float** %41, align 8, !tbaa !86
  %83 = getelementptr inbounds float, float* %82, i64 %i.013
  %84 = load float, float* %83, align 4, !tbaa !67
  %85 = fpext float %84 to double
  %86 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull %43, double %85)
          to label %_ZNSolsEf.exit unwind label %105

_ZNSolsEf.exit:                                   ; preds = %81
  invoke void @_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::__cxx11::basic_string"* nonnull sret %1, %"class.std::__cxx11::basic_stringbuf"* nonnull %44)
          to label %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit unwind label %105

_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit: ; preds = %_ZNSolsEf.exit
  %87 = load i64, i64* %45, align 8, !tbaa !13
  %88 = icmp slt i64 %width.112, %87
  %89 = select i1 %88, i64 %87, i64 %width.112
  %90 = load i8*, i8** %46, align 8, !tbaa !8
  %91 = icmp eq i8* %90, %48
  br i1 %91, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %92

; <label>:92                                      ; preds = %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit
  call void @_ZdlPv(i8* %90) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit, %92
  store i64 %49, i64* %50, align 8, !tbaa !17
  %93 = load i64, i64* %53, align 8
  %94 = getelementptr inbounds i8, i8* %37, i64 %93
  %95 = bitcast i8* %94 to i64*
  store i64 %51, i64* %95, align 8, !tbaa !17
  store i64 %54, i64* %55, align 8, !tbaa !17
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %56, align 8, !tbaa !17
  %96 = load i8*, i8** %57, align 8, !tbaa !8
  %97 = icmp eq i8* %96, %59
  br i1 %97, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5, label %98

; <label>:98                                      ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  call void @_ZdlPv(i8* %96) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %98
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %56, align 8, !tbaa !17
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* nonnull %60) #2
  store i64 %61, i64* %50, align 8, !tbaa !17
  %99 = load i64, i64* %64, align 8
  %100 = getelementptr inbounds i8, i8* %37, i64 %99
  %101 = bitcast i8* %100 to i64*
  store i64 %62, i64* %101, align 8, !tbaa !17
  store i64 0, i64* %65, align 8, !tbaa !33
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* nonnull %66) #2
  call void @llvm.lifetime.end(i64 392, i8* nonnull %37) #2
  %102 = add nuw nsw i64 %i.013, 1
  %103 = load i64, i64* %2, align 8, !tbaa !88
  %104 = icmp slt i64 %102, %103
  br i1 %104, label %.lr.ph14, label %.loopexit.loopexit

; <label>:105                                     ; preds = %_ZNSolsEf.exit, %81, %.lr.ph14
  %106 = landingpad { i8*, i32 }
          cleanup
  store i64 %49, i64* %50, align 8, !tbaa !17
  %107 = load i64, i64* %53, align 8
  %108 = getelementptr inbounds i8, i8* %37, i64 %107
  %109 = bitcast i8* %108 to i64*
  store i64 %51, i64* %109, align 8, !tbaa !17
  store i64 %54, i64* %55, align 8, !tbaa !17
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %56, align 8, !tbaa !17
  %110 = load i8*, i8** %57, align 8, !tbaa !8
  %111 = icmp eq i8* %110, %59
  br i1 %111, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, label %112

; <label>:112                                     ; preds = %105
  call void @_ZdlPv(i8* %110) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit: ; preds = %105, %112
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %56, align 8, !tbaa !17
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* nonnull %60) #2
  store i64 %61, i64* %50, align 8, !tbaa !17
  %113 = load i64, i64* %64, align 8
  %114 = getelementptr inbounds i8, i8* %37, i64 %113
  %115 = bitcast i8* %114 to i64*
  store i64 %62, i64* %115, align 8, !tbaa !17
  store i64 0, i64* %65, align 8, !tbaa !33
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* nonnull %66) #2
  resume { i8*, i32 } %106

.loopexit.loopexit:                               ; preds = %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5
  %.lcssa = phi i64 [ %89, %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit5 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader8, %.thread7
  %width.2 = phi i64 [ 0, %.thread7 ], [ 0, %.preheader8 ], [ %.lcssa, %.loopexit.loopexit ]
  %116 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 0, i32 0, i32 0
  %117 = load i8*, i8** %116, align 8, !tbaa !8
  %118 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 0, i32 1
  %119 = load i64, i64* %118, align 8, !tbaa !13
  %120 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %117, i64 %119)
  %121 = load i64, i64* %2, align 8, !tbaa !88
  %122 = icmp sgt i64 %121, 0
  br i1 %122, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.loopexit
  %123 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 2, i32 0, i32 0
  %124 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 2, i32 1
  %125 = icmp eq i64 %width.2, 0
  %126 = getelementptr inbounds %"class.Eigen::Array", %"class.Eigen::Array"* %_m, i64 0, i32 0, i32 0, i32 0
  %127 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 3, i32 0, i32 0
  %128 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 3, i32 1
  %129 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 4, i32 0, i32 0
  %130 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 4, i32 1
  %131 = bitcast %"class.std::basic_ostream"* %s to i8**
  %132 = bitcast %"class.std::basic_ostream"* %s to i8*
  %133 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 5, i32 0, i32 0
  %134 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 5, i32 1
  br i1 %125, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %159
  %i1.011.us = phi i64 [ %161, %159 ], [ 0, %.lr.ph.split.us.preheader ]
  %135 = icmp eq i64 %i1.011.us, 0
  br i1 %135, label %140, label %136

; <label>:136                                     ; preds = %.lr.ph.split.us
  %137 = load i8*, i8** %133, align 8, !tbaa !8
  %138 = load i64, i64* %134, align 8, !tbaa !13
  %139 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %137, i64 %138)
  br label %140

; <label>:140                                     ; preds = %136, %.lr.ph.split.us
  %141 = load i8*, i8** %123, align 8, !tbaa !8
  %142 = load i64, i64* %124, align 8, !tbaa !13
  %143 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %141, i64 %142)
  %144 = load float*, float** %126, align 8, !tbaa !86
  %145 = getelementptr inbounds float, float* %144, i64 %i1.011.us
  %146 = load float, float* %145, align 4, !tbaa !67
  %147 = fpext float %146 to double
  %148 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull %s, double %147)
  %149 = load i8*, i8** %127, align 8, !tbaa !8
  %150 = load i64, i64* %128, align 8, !tbaa !13
  %151 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %149, i64 %150)
  %152 = load i64, i64* %2, align 8, !tbaa !88
  %153 = add nsw i64 %152, -1
  %154 = icmp slt i64 %i1.011.us, %153
  br i1 %154, label %155, label %159

; <label>:155                                     ; preds = %140
  %156 = load i8*, i8** %129, align 8, !tbaa !8
  %157 = load i64, i64* %130, align 8, !tbaa !13
  %158 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %156, i64 %157)
  %.pre20 = load i64, i64* %2, align 8, !tbaa !88
  br label %159

; <label>:159                                     ; preds = %155, %140
  %160 = phi i64 [ %.pre20, %155 ], [ %152, %140 ]
  %161 = add nuw nsw i64 %i1.011.us, 1
  %162 = icmp slt i64 %161, %160
  br i1 %162, label %.lr.ph.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %159
  br label %._crit_edge

._crit_edge.loopexit23:                           ; preds = %199
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit23, %._crit_edge.loopexit, %.loopexit
  %163 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 1, i32 0, i32 0
  %164 = load i8*, i8** %163, align 8, !tbaa !8
  %165 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %fmt, i64 0, i32 1, i32 1
  %166 = load i64, i64* %165, align 8, !tbaa !13
  %167 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %164, i64 %166)
  br i1 %34, label %203, label %213

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %199
  %i1.011 = phi i64 [ %201, %199 ], [ 0, %.lr.ph.split.preheader ]
  %168 = icmp eq i64 %i1.011, 0
  br i1 %168, label %173, label %169

; <label>:169                                     ; preds = %.lr.ph.split
  %170 = load i8*, i8** %133, align 8, !tbaa !8
  %171 = load i64, i64* %134, align 8, !tbaa !13
  %172 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %170, i64 %171)
  br label %173

; <label>:173                                     ; preds = %.lr.ph.split, %169
  %174 = load i8*, i8** %123, align 8, !tbaa !8
  %175 = load i64, i64* %124, align 8, !tbaa !13
  %176 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %174, i64 %175)
  %177 = load i8*, i8** %131, align 8, !tbaa !17
  %178 = getelementptr i8, i8* %177, i64 -24
  %179 = bitcast i8* %178 to i64*
  %180 = load i64, i64* %179, align 8
  %181 = getelementptr inbounds i8, i8* %132, i64 %180
  %182 = getelementptr inbounds i8, i8* %181, i64 16
  %183 = bitcast i8* %182 to i64*
  store i64 %width.2, i64* %183, align 8, !tbaa !94
  %184 = load float*, float** %126, align 8, !tbaa !86
  %185 = getelementptr inbounds float, float* %184, i64 %i1.011
  %186 = load float, float* %185, align 4, !tbaa !67
  %187 = fpext float %186 to double
  %188 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull %s, double %187)
  %189 = load i8*, i8** %127, align 8, !tbaa !8
  %190 = load i64, i64* %128, align 8, !tbaa !13
  %191 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %189, i64 %190)
  %192 = load i64, i64* %2, align 8, !tbaa !88
  %193 = add nsw i64 %192, -1
  %194 = icmp slt i64 %i1.011, %193
  br i1 %194, label %195, label %199

; <label>:195                                     ; preds = %173
  %196 = load i8*, i8** %129, align 8, !tbaa !8
  %197 = load i64, i64* %130, align 8, !tbaa !13
  %198 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %s, i8* %196, i64 %197)
  %.pre = load i64, i64* %2, align 8, !tbaa !88
  br label %199

; <label>:199                                     ; preds = %173, %195
  %200 = phi i64 [ %192, %173 ], [ %.pre, %195 ]
  %201 = add nuw nsw i64 %i1.011, 1
  %202 = icmp slt i64 %201, %200
  br i1 %202, label %.lr.ph.split, label %._crit_edge.loopexit23

; <label>:203                                     ; preds = %._crit_edge
  %204 = bitcast %"class.std::basic_ostream"* %s to i8**
  %205 = load i8*, i8** %204, align 8, !tbaa !17
  %206 = getelementptr i8, i8* %205, i64 -24
  %207 = bitcast i8* %206 to i64*
  %208 = load i64, i64* %207, align 8
  %209 = bitcast %"class.std::basic_ostream"* %s to i8*
  %210 = getelementptr inbounds i8, i8* %209, i64 %208
  %211 = getelementptr inbounds i8, i8* %210, i64 8
  %212 = bitcast i8* %211 to i64*
  store i64 %old_precision.0, i64* %212, align 8, !tbaa !93
  br label %213

; <label>:213                                     ; preds = %._crit_edge, %203, %5
  ret %"class.std::basic_ostream"* %s
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen8IOFormatC2EiiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_S8_S8_S8_S8_(%"struct.Eigen::IOFormat"* %this, i32 %_precision, i32 %_flags, %"class.std::__cxx11::basic_string"* nocapture readonly dereferenceable(32) %_coeffSeparator, %"class.std::__cxx11::basic_string"* nocapture readonly dereferenceable(32) %_rowSeparator, %"class.std::__cxx11::basic_string"* nocapture readonly dereferenceable(32) %_rowPrefix, %"class.std::__cxx11::basic_string"* nocapture readonly dereferenceable(32) %_rowSuffix, %"class.std::__cxx11::basic_string"* nocapture readonly dereferenceable(32) %_matPrefix, %"class.std::__cxx11::basic_string"* nocapture readonly dereferenceable(32) %_matSuffix) unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %__dnew.i.i.i.i56 = alloca i64, align 8
  %__dnew.i.i.i.i39 = alloca i64, align 8
  %__dnew.i.i.i.i28 = alloca i64, align 8
  %__dnew.i.i.i.i17 = alloca i64, align 8
  %__dnew.i.i.i.i7 = alloca i64, align 8
  %__dnew.i.i.i.i = alloca i64, align 8
  %1 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 0
  %2 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 0, i32 2
  %3 = bitcast %"struct.Eigen::IOFormat"* %this to %union.anon**
  store %union.anon* %2, %union.anon** %3, align 8, !tbaa !12
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_matPrefix, i64 0, i32 0, i32 0
  %5 = load i8*, i8** %4, align 8, !tbaa !8
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_matPrefix, i64 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !13
  %.not.i.i.i.i = icmp ne i8* %5, null
  %8 = icmp eq i64 %7, 0
  %or.cond.i.i.i.i = or i1 %.not.i.i.i.i, %8
  %9 = bitcast %union.anon* %2 to i8*
  br i1 %or.cond.i.i.i.i, label %10, label %.noexc.i

.noexc.i:                                         ; preds = %0
  tail call void @_ZSt19__throw_logic_errorPKc(i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.49, i64 0, i64 0)) #20
  unreachable

; <label>:10                                      ; preds = %0
  %11 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %11) #2
  store i64 %7, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %12 = icmp ugt i64 %7, 15
  br i1 %12, label %.noexc1.i, label %._crit_edge.i.i.i.i

._crit_edge.i.i.i.i:                              ; preds = %10
  %.phi.trans.insert.i.i.i.i = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 0, i32 0, i32 0
  br label %17

.noexc1.i:                                        ; preds = %10
  %13 = call i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %1, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
  %14 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 0, i32 0, i32 0
  store i8* %13, i8** %14, align 8, !tbaa !8
  %15 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %16 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 0, i32 2, i32 0
  store i64 %15, i64* %16, align 8, !tbaa !15
  br label %17

; <label>:17                                      ; preds = %.noexc1.i, %._crit_edge.i.i.i.i
  %.pre-phi.i.i.i.i = phi i8** [ %.phi.trans.insert.i.i.i.i, %._crit_edge.i.i.i.i ], [ %14, %.noexc1.i ]
  %18 = phi i8* [ %9, %._crit_edge.i.i.i.i ], [ %13, %.noexc1.i ]
  switch i64 %7, label %21 [
    i64 1, label %19
    i64 0, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit
  ]

; <label>:19                                      ; preds = %17
  %20 = load i8, i8* %5, align 1, !tbaa !14
  store i8 %20, i8* %18, align 1, !tbaa !14
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit

; <label>:21                                      ; preds = %17
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %5, i64 %7, i32 1, i1 false) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit: ; preds = %17, %19, %21
  %22 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %23 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 0, i32 1
  store i64 %22, i64* %23, align 8, !tbaa !13
  %24 = load i8*, i8** %.pre-phi.i.i.i.i, align 8, !tbaa !8
  %25 = getelementptr inbounds i8, i8* %24, i64 %22
  store i8 0, i8* %25, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %11) #2
  %26 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 1
  %27 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 1, i32 2
  %28 = bitcast %"class.std::__cxx11::basic_string"* %26 to %union.anon**
  store %union.anon* %27, %union.anon** %28, align 8, !tbaa !12
  %29 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_matSuffix, i64 0, i32 0, i32 0
  %30 = load i8*, i8** %29, align 8, !tbaa !8
  %31 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_matSuffix, i64 0, i32 1
  %32 = load i64, i64* %31, align 8, !tbaa !13
  %.not.i.i.i.i8 = icmp ne i8* %30, null
  %33 = icmp eq i64 %32, 0
  %or.cond.i.i.i.i9 = or i1 %.not.i.i.i.i8, %33
  %34 = bitcast %union.anon* %27 to i8*
  br i1 %or.cond.i.i.i.i9, label %35, label %.noexc.i10

.noexc.i10:                                       ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit
  invoke void @_ZSt19__throw_logic_errorPKc(i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.49, i64 0, i64 0)) #20
          to label %.noexc unwind label %164

.noexc:                                           ; preds = %.noexc.i10
  unreachable

; <label>:35                                      ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_.exit
  %36 = bitcast i64* %__dnew.i.i.i.i7 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %36) #2
  store i64 %32, i64* %__dnew.i.i.i.i7, align 8, !tbaa !15
  %37 = icmp ugt i64 %32, 15
  br i1 %37, label %.noexc1.i13, label %._crit_edge.i.i.i.i12

._crit_edge.i.i.i.i12:                            ; preds = %35
  %.phi.trans.insert.i.i.i.i11 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %26, i64 0, i32 0, i32 0
  br label %42

.noexc1.i13:                                      ; preds = %35
  %38 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %26, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i7, i64 0)
          to label %.noexc15 unwind label %164

.noexc15:                                         ; preds = %.noexc1.i13
  %39 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %26, i64 0, i32 0, i32 0
  store i8* %38, i8** %39, align 8, !tbaa !8
  %40 = load i64, i64* %__dnew.i.i.i.i7, align 8, !tbaa !15
  %41 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 1, i32 2, i32 0
  store i64 %40, i64* %41, align 8, !tbaa !15
  br label %42

; <label>:42                                      ; preds = %.noexc15, %._crit_edge.i.i.i.i12
  %.pre-phi.i.i.i.i14 = phi i8** [ %.phi.trans.insert.i.i.i.i11, %._crit_edge.i.i.i.i12 ], [ %39, %.noexc15 ]
  %43 = phi i8* [ %34, %._crit_edge.i.i.i.i12 ], [ %38, %.noexc15 ]
  switch i64 %32, label %46 [
    i64 1, label %44
    i64 0, label %47
  ]

; <label>:44                                      ; preds = %42
  %45 = load i8, i8* %30, align 1, !tbaa !14
  store i8 %45, i8* %43, align 1, !tbaa !14
  br label %47

; <label>:46                                      ; preds = %42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %30, i64 %32, i32 1, i1 false) #2
  br label %47

; <label>:47                                      ; preds = %46, %44, %42
  %48 = load i64, i64* %__dnew.i.i.i.i7, align 8, !tbaa !15
  %49 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 1, i32 1
  store i64 %48, i64* %49, align 8, !tbaa !13
  %50 = load i8*, i8** %.pre-phi.i.i.i.i14, align 8, !tbaa !8
  %51 = getelementptr inbounds i8, i8* %50, i64 %48
  store i8 0, i8* %51, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %36) #2
  %52 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 2
  %53 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 2, i32 2
  %54 = bitcast %"class.std::__cxx11::basic_string"* %52 to %union.anon**
  store %union.anon* %53, %union.anon** %54, align 8, !tbaa !12
  %55 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_rowPrefix, i64 0, i32 0, i32 0
  %56 = load i8*, i8** %55, align 8, !tbaa !8
  %57 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_rowPrefix, i64 0, i32 1
  %58 = load i64, i64* %57, align 8, !tbaa !13
  %.not.i.i.i.i18 = icmp ne i8* %56, null
  %59 = icmp eq i64 %58, 0
  %or.cond.i.i.i.i19 = or i1 %.not.i.i.i.i18, %59
  %60 = bitcast %union.anon* %53 to i8*
  br i1 %or.cond.i.i.i.i19, label %61, label %.noexc.i20

.noexc.i20:                                       ; preds = %47
  invoke void @_ZSt19__throw_logic_errorPKc(i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.49, i64 0, i64 0)) #20
          to label %.noexc25 unwind label %168

.noexc25:                                         ; preds = %.noexc.i20
  unreachable

; <label>:61                                      ; preds = %47
  %62 = bitcast i64* %__dnew.i.i.i.i17 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %62) #2
  store i64 %58, i64* %__dnew.i.i.i.i17, align 8, !tbaa !15
  %63 = icmp ugt i64 %58, 15
  br i1 %63, label %.noexc1.i23, label %._crit_edge.i.i.i.i22

._crit_edge.i.i.i.i22:                            ; preds = %61
  %.phi.trans.insert.i.i.i.i21 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %52, i64 0, i32 0, i32 0
  br label %68

.noexc1.i23:                                      ; preds = %61
  %64 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %52, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i17, i64 0)
          to label %.noexc26 unwind label %168

.noexc26:                                         ; preds = %.noexc1.i23
  %65 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %52, i64 0, i32 0, i32 0
  store i8* %64, i8** %65, align 8, !tbaa !8
  %66 = load i64, i64* %__dnew.i.i.i.i17, align 8, !tbaa !15
  %67 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 2, i32 2, i32 0
  store i64 %66, i64* %67, align 8, !tbaa !15
  br label %68

; <label>:68                                      ; preds = %.noexc26, %._crit_edge.i.i.i.i22
  %.pre-phi.i.i.i.i24 = phi i8** [ %.phi.trans.insert.i.i.i.i21, %._crit_edge.i.i.i.i22 ], [ %65, %.noexc26 ]
  %69 = phi i8* [ %60, %._crit_edge.i.i.i.i22 ], [ %64, %.noexc26 ]
  switch i64 %58, label %72 [
    i64 1, label %70
    i64 0, label %73
  ]

; <label>:70                                      ; preds = %68
  %71 = load i8, i8* %56, align 1, !tbaa !14
  store i8 %71, i8* %69, align 1, !tbaa !14
  br label %73

; <label>:72                                      ; preds = %68
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %69, i8* %56, i64 %58, i32 1, i1 false) #2
  br label %73

; <label>:73                                      ; preds = %72, %70, %68
  %74 = load i64, i64* %__dnew.i.i.i.i17, align 8, !tbaa !15
  %75 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 2, i32 1
  store i64 %74, i64* %75, align 8, !tbaa !13
  %76 = load i8*, i8** %.pre-phi.i.i.i.i24, align 8, !tbaa !8
  %77 = getelementptr inbounds i8, i8* %76, i64 %74
  store i8 0, i8* %77, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %62) #2
  %78 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 3
  %79 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 3, i32 2
  %80 = bitcast %"class.std::__cxx11::basic_string"* %78 to %union.anon**
  store %union.anon* %79, %union.anon** %80, align 8, !tbaa !12
  %81 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_rowSuffix, i64 0, i32 0, i32 0
  %82 = load i8*, i8** %81, align 8, !tbaa !8
  %83 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_rowSuffix, i64 0, i32 1
  %84 = load i64, i64* %83, align 8, !tbaa !13
  %.not.i.i.i.i29 = icmp ne i8* %82, null
  %85 = icmp eq i64 %84, 0
  %or.cond.i.i.i.i30 = or i1 %.not.i.i.i.i29, %85
  %86 = bitcast %union.anon* %79 to i8*
  br i1 %or.cond.i.i.i.i30, label %87, label %.noexc.i31

.noexc.i31:                                       ; preds = %73
  invoke void @_ZSt19__throw_logic_errorPKc(i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.49, i64 0, i64 0)) #20
          to label %.noexc36 unwind label %172

.noexc36:                                         ; preds = %.noexc.i31
  unreachable

; <label>:87                                      ; preds = %73
  %88 = bitcast i64* %__dnew.i.i.i.i28 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %88) #2
  store i64 %84, i64* %__dnew.i.i.i.i28, align 8, !tbaa !15
  %89 = icmp ugt i64 %84, 15
  br i1 %89, label %.noexc1.i34, label %._crit_edge.i.i.i.i33

._crit_edge.i.i.i.i33:                            ; preds = %87
  %.phi.trans.insert.i.i.i.i32 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %78, i64 0, i32 0, i32 0
  br label %94

.noexc1.i34:                                      ; preds = %87
  %90 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %78, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i28, i64 0)
          to label %.noexc37 unwind label %172

.noexc37:                                         ; preds = %.noexc1.i34
  %91 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %78, i64 0, i32 0, i32 0
  store i8* %90, i8** %91, align 8, !tbaa !8
  %92 = load i64, i64* %__dnew.i.i.i.i28, align 8, !tbaa !15
  %93 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 3, i32 2, i32 0
  store i64 %92, i64* %93, align 8, !tbaa !15
  br label %94

; <label>:94                                      ; preds = %.noexc37, %._crit_edge.i.i.i.i33
  %.pre-phi.i.i.i.i35 = phi i8** [ %.phi.trans.insert.i.i.i.i32, %._crit_edge.i.i.i.i33 ], [ %91, %.noexc37 ]
  %95 = phi i8* [ %86, %._crit_edge.i.i.i.i33 ], [ %90, %.noexc37 ]
  switch i64 %84, label %98 [
    i64 1, label %96
    i64 0, label %99
  ]

; <label>:96                                      ; preds = %94
  %97 = load i8, i8* %82, align 1, !tbaa !14
  store i8 %97, i8* %95, align 1, !tbaa !14
  br label %99

; <label>:98                                      ; preds = %94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %95, i8* %82, i64 %84, i32 1, i1 false) #2
  br label %99

; <label>:99                                      ; preds = %98, %96, %94
  %100 = load i64, i64* %__dnew.i.i.i.i28, align 8, !tbaa !15
  %101 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 3, i32 1
  store i64 %100, i64* %101, align 8, !tbaa !13
  %102 = load i8*, i8** %.pre-phi.i.i.i.i35, align 8, !tbaa !8
  %103 = getelementptr inbounds i8, i8* %102, i64 %100
  store i8 0, i8* %103, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %88) #2
  %104 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 4
  %105 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 4, i32 2
  %106 = bitcast %"class.std::__cxx11::basic_string"* %104 to %union.anon**
  store %union.anon* %105, %union.anon** %106, align 8, !tbaa !12
  %107 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_rowSeparator, i64 0, i32 0, i32 0
  %108 = load i8*, i8** %107, align 8, !tbaa !8
  %109 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_rowSeparator, i64 0, i32 1
  %110 = load i64, i64* %109, align 8, !tbaa !13
  %.not.i.i.i.i40 = icmp ne i8* %108, null
  %111 = icmp eq i64 %110, 0
  %or.cond.i.i.i.i41 = or i1 %.not.i.i.i.i40, %111
  %112 = bitcast %union.anon* %105 to i8*
  br i1 %or.cond.i.i.i.i41, label %113, label %.noexc.i42

.noexc.i42:                                       ; preds = %99
  invoke void @_ZSt19__throw_logic_errorPKc(i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.49, i64 0, i64 0)) #20
          to label %.noexc47 unwind label %176

.noexc47:                                         ; preds = %.noexc.i42
  unreachable

; <label>:113                                     ; preds = %99
  %114 = bitcast i64* %__dnew.i.i.i.i39 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %114) #2
  store i64 %110, i64* %__dnew.i.i.i.i39, align 8, !tbaa !15
  %115 = icmp ugt i64 %110, 15
  br i1 %115, label %.noexc1.i45, label %._crit_edge.i.i.i.i44

._crit_edge.i.i.i.i44:                            ; preds = %113
  %.phi.trans.insert.i.i.i.i43 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %104, i64 0, i32 0, i32 0
  br label %120

.noexc1.i45:                                      ; preds = %113
  %116 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %104, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i39, i64 0)
          to label %.noexc48 unwind label %176

.noexc48:                                         ; preds = %.noexc1.i45
  %117 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %104, i64 0, i32 0, i32 0
  store i8* %116, i8** %117, align 8, !tbaa !8
  %118 = load i64, i64* %__dnew.i.i.i.i39, align 8, !tbaa !15
  %119 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 4, i32 2, i32 0
  store i64 %118, i64* %119, align 8, !tbaa !15
  br label %120

; <label>:120                                     ; preds = %.noexc48, %._crit_edge.i.i.i.i44
  %.pre-phi.i.i.i.i46 = phi i8** [ %.phi.trans.insert.i.i.i.i43, %._crit_edge.i.i.i.i44 ], [ %117, %.noexc48 ]
  %121 = phi i8* [ %112, %._crit_edge.i.i.i.i44 ], [ %116, %.noexc48 ]
  switch i64 %110, label %124 [
    i64 1, label %122
    i64 0, label %._crit_edge.i.i.i.i52
  ]

; <label>:122                                     ; preds = %120
  %123 = load i8, i8* %108, align 1, !tbaa !14
  store i8 %123, i8* %121, align 1, !tbaa !14
  br label %._crit_edge.i.i.i.i52

; <label>:124                                     ; preds = %120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %121, i8* %108, i64 %110, i32 1, i1 false) #2
  br label %._crit_edge.i.i.i.i52

._crit_edge.i.i.i.i52:                            ; preds = %124, %122, %120
  %125 = load i64, i64* %__dnew.i.i.i.i39, align 8, !tbaa !15
  %126 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 4, i32 1
  store i64 %125, i64* %126, align 8, !tbaa !13
  %127 = load i8*, i8** %.pre-phi.i.i.i.i46, align 8, !tbaa !8
  %128 = getelementptr inbounds i8, i8* %127, i64 %125
  store i8 0, i8* %128, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %114) #2
  %129 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 5
  %130 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 5, i32 2
  %131 = bitcast %"class.std::__cxx11::basic_string"* %129 to %union.anon**
  store %union.anon* %130, %union.anon** %131, align 8, !tbaa !12
  %132 = bitcast %union.anon* %130 to i8*
  %133 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 5, i32 1
  store i64 0, i64* %133, align 8, !tbaa !13
  store i8 0, i8* %132, align 1, !tbaa !14
  %134 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 6
  %135 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 6, i32 2
  %136 = bitcast %"class.std::__cxx11::basic_string"* %134 to %union.anon**
  store %union.anon* %135, %union.anon** %136, align 8, !tbaa !12
  %137 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_coeffSeparator, i64 0, i32 0, i32 0
  %138 = load i8*, i8** %137, align 8, !tbaa !8
  %139 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %_coeffSeparator, i64 0, i32 1
  %140 = load i64, i64* %139, align 8, !tbaa !13
  %.not.i.i.i.i57 = icmp ne i8* %138, null
  %141 = icmp eq i64 %140, 0
  %or.cond.i.i.i.i58 = or i1 %.not.i.i.i.i57, %141
  %142 = bitcast %union.anon* %135 to i8*
  br i1 %or.cond.i.i.i.i58, label %143, label %.noexc.i59

.noexc.i59:                                       ; preds = %._crit_edge.i.i.i.i52
  invoke void @_ZSt19__throw_logic_errorPKc(i8* nonnull getelementptr inbounds ([42 x i8], [42 x i8]* @.str.49, i64 0, i64 0)) #20
          to label %.noexc64 unwind label %180

.noexc64:                                         ; preds = %.noexc.i59
  unreachable

; <label>:143                                     ; preds = %._crit_edge.i.i.i.i52
  %144 = bitcast i64* %__dnew.i.i.i.i56 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %144) #2
  store i64 %140, i64* %__dnew.i.i.i.i56, align 8, !tbaa !15
  %145 = icmp ugt i64 %140, 15
  br i1 %145, label %.noexc1.i62, label %._crit_edge.i.i.i.i61

._crit_edge.i.i.i.i61:                            ; preds = %143
  %.phi.trans.insert.i.i.i.i60 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %134, i64 0, i32 0, i32 0
  br label %150

.noexc1.i62:                                      ; preds = %143
  %146 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %134, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i56, i64 0)
          to label %.noexc65 unwind label %180

.noexc65:                                         ; preds = %.noexc1.i62
  %147 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %134, i64 0, i32 0, i32 0
  store i8* %146, i8** %147, align 8, !tbaa !8
  %148 = load i64, i64* %__dnew.i.i.i.i56, align 8, !tbaa !15
  %149 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 6, i32 2, i32 0
  store i64 %148, i64* %149, align 8, !tbaa !15
  br label %150

; <label>:150                                     ; preds = %.noexc65, %._crit_edge.i.i.i.i61
  %.pre-phi.i.i.i.i63 = phi i8** [ %.phi.trans.insert.i.i.i.i60, %._crit_edge.i.i.i.i61 ], [ %147, %.noexc65 ]
  %151 = phi i8* [ %142, %._crit_edge.i.i.i.i61 ], [ %146, %.noexc65 ]
  switch i64 %140, label %154 [
    i64 1, label %152
    i64 0, label %155
  ]

; <label>:152                                     ; preds = %150
  %153 = load i8, i8* %138, align 1, !tbaa !14
  store i8 %153, i8* %151, align 1, !tbaa !14
  br label %155

; <label>:154                                     ; preds = %150
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %151, i8* %138, i64 %140, i32 1, i1 false) #2
  br label %155

; <label>:155                                     ; preds = %154, %152, %150
  %156 = load i64, i64* %__dnew.i.i.i.i56, align 8, !tbaa !15
  %157 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 6, i32 1
  store i64 %156, i64* %157, align 8, !tbaa !13
  %158 = load i8*, i8** %.pre-phi.i.i.i.i63, align 8, !tbaa !8
  %159 = getelementptr inbounds i8, i8* %158, i64 %156
  store i8 0, i8* %159, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %144) #2
  %160 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 7
  store i32 %_precision, i32* %160, align 8, !tbaa !95
  %161 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 8
  store i32 %_flags, i32* %161, align 4, !tbaa !97
  %162 = and i32 %_flags, 1
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %184, label %.critedge

; <label>:164                                     ; preds = %.noexc1.i13, %.noexc.i10
  %165 = landingpad { i8*, i32 }
          cleanup
  %166 = extractvalue { i8*, i32 } %165, 0
  %167 = extractvalue { i8*, i32 } %165, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit72

; <label>:168                                     ; preds = %.noexc1.i23, %.noexc.i20
  %169 = landingpad { i8*, i32 }
          cleanup
  %170 = extractvalue { i8*, i32 } %169, 0
  %171 = extractvalue { i8*, i32 } %169, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71

; <label>:172                                     ; preds = %.noexc1.i34, %.noexc.i31
  %173 = landingpad { i8*, i32 }
          cleanup
  %174 = extractvalue { i8*, i32 } %173, 0
  %175 = extractvalue { i8*, i32 } %173, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70

; <label>:176                                     ; preds = %.noexc1.i45, %.noexc.i42
  %177 = landingpad { i8*, i32 }
          cleanup
  %178 = extractvalue { i8*, i32 } %177, 0
  %179 = extractvalue { i8*, i32 } %177, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69

; <label>:180                                     ; preds = %.noexc1.i62, %.noexc.i59
  %181 = landingpad { i8*, i32 }
          cleanup
  %182 = extractvalue { i8*, i32 } %181, 0
  %183 = extractvalue { i8*, i32 } %181, 1
  %.pre = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %129, i64 0, i32 0, i32 0
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

; <label>:184                                     ; preds = %155
  %185 = load i64, i64* %49, align 8, !tbaa !13
  %186 = trunc i64 %185 to i32
  %187 = icmp sgt i32 %186, 0
  br i1 %187, label %.lr.ph, label %.critedge

.lr.ph:                                           ; preds = %184
  %188 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %26, i64 0, i32 0, i32 0
  %189 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %129, i64 0, i32 0, i32 0
  %190 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 5, i32 2, i32 0
  %sext = shl i64 %185, 32
  %191 = ashr exact i64 %sext, 32
  br label %192

; <label>:192                                     ; preds = %.lr.ph, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc.exit
  %indvars.iv = phi i64 [ %191, %.lr.ph ], [ %indvars.iv.next, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc.exit ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %193 = load i8*, i8** %188, align 8, !tbaa !8
  %194 = getelementptr inbounds i8, i8* %193, i64 %indvars.iv.next
  %195 = load i8, i8* %194, align 1, !tbaa !14
  %196 = icmp eq i8 %195, 10
  br i1 %196, label %.critedge.loopexit, label %197

; <label>:197                                     ; preds = %192
  %198 = load i64, i64* %133, align 8, !tbaa !13
  %199 = add i64 %198, 1
  %200 = load i8*, i8** %189, align 8, !tbaa !8
  %201 = icmp eq i8* %200, %132
  br i1 %201, label %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv.exit.i.i, label %202

; <label>:202                                     ; preds = %197
  %203 = load i64, i64* %190, align 8, !tbaa !15
  br label %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv.exit.i.i

_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv.exit.i.i: ; preds = %202, %197
  %204 = phi i64 [ %203, %202 ], [ 15, %197 ]
  %205 = icmp ugt i64 %199, %204
  br i1 %205, label %206, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc.exit

; <label>:206                                     ; preds = %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv.exit.i.i
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm(%"class.std::__cxx11::basic_string"* nonnull %129, i64 %198, i64 0, i8* null, i64 1)
          to label %.noexc67 unwind label %212

.noexc67:                                         ; preds = %206
  %.pre.i.i = load i8*, i8** %189, align 8, !tbaa !8
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc.exit: ; preds = %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv.exit.i.i, %.noexc67
  %207 = phi i8* [ %.pre.i.i, %.noexc67 ], [ %200, %_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv.exit.i.i ]
  %208 = getelementptr inbounds i8, i8* %207, i64 %198
  store i8 32, i8* %208, align 1, !tbaa !14
  store i64 %199, i64* %133, align 8, !tbaa !13
  %209 = load i8*, i8** %189, align 8, !tbaa !8
  %210 = getelementptr inbounds i8, i8* %209, i64 %199
  store i8 0, i8* %210, align 1, !tbaa !14
  %211 = icmp sgt i64 %indvars.iv, 1
  br i1 %211, label %192, label %.critedge.loopexit

; <label>:212                                     ; preds = %206
  %213 = landingpad { i8*, i32 }
          cleanup
  %214 = extractvalue { i8*, i32 } %213, 0
  %215 = extractvalue { i8*, i32 } %213, 1
  %216 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %134, i64 0, i32 0, i32 0
  %217 = load i8*, i8** %216, align 8, !tbaa !8
  %218 = icmp eq i8* %217, %142
  br i1 %218, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %219

; <label>:219                                     ; preds = %212
  call void @_ZdlPv(i8* %217) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

.critedge.loopexit:                               ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEc.exit, %192
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %184, %155
  ret void

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %219, %212, %180
  %.pre-phi = phi i8** [ %189, %219 ], [ %189, %212 ], [ %.pre, %180 ]
  %.01 = phi i8* [ %214, %219 ], [ %214, %212 ], [ %182, %180 ]
  %.0 = phi i32 [ %215, %219 ], [ %215, %212 ], [ %183, %180 ]
  %220 = load i8*, i8** %.pre-phi, align 8, !tbaa !8
  %221 = icmp eq i8* %220, %132
  br i1 %221, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit68, label %222

; <label>:222                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  call void @_ZdlPv(i8* %220) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit68

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit68: ; preds = %222, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  %223 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %104, i64 0, i32 0, i32 0
  %224 = load i8*, i8** %223, align 8, !tbaa !8
  %225 = icmp eq i8* %224, %112
  br i1 %225, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69, label %226

; <label>:226                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit68
  call void @_ZdlPv(i8* %224) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69: ; preds = %226, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit68, %176
  %.23 = phi i8* [ %178, %176 ], [ %.01, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit68 ], [ %.01, %226 ]
  %.2 = phi i32 [ %179, %176 ], [ %.0, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit68 ], [ %.0, %226 ]
  %227 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %78, i64 0, i32 0, i32 0
  %228 = load i8*, i8** %227, align 8, !tbaa !8
  %229 = icmp eq i8* %228, %86
  br i1 %229, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70, label %230

; <label>:230                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69
  call void @_ZdlPv(i8* %228) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70: ; preds = %230, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69, %172
  %.34 = phi i8* [ %174, %172 ], [ %.23, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69 ], [ %.23, %230 ]
  %.3 = phi i32 [ %175, %172 ], [ %.2, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit69 ], [ %.2, %230 ]
  %231 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %52, i64 0, i32 0, i32 0
  %232 = load i8*, i8** %231, align 8, !tbaa !8
  %233 = icmp eq i8* %232, %60
  br i1 %233, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71, label %234

; <label>:234                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70
  call void @_ZdlPv(i8* %232) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71: ; preds = %234, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70, %168
  %.45 = phi i8* [ %170, %168 ], [ %.34, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70 ], [ %.34, %234 ]
  %.4 = phi i32 [ %171, %168 ], [ %.3, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit70 ], [ %.3, %234 ]
  %235 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %26, i64 0, i32 0, i32 0
  %236 = load i8*, i8** %235, align 8, !tbaa !8
  %237 = icmp eq i8* %236, %34
  br i1 %237, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit72, label %238

; <label>:238                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71
  call void @_ZdlPv(i8* %236) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit72

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit72: ; preds = %238, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71, %164
  %.56 = phi i8* [ %166, %164 ], [ %.45, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71 ], [ %.45, %238 ]
  %.5 = phi i32 [ %167, %164 ], [ %.4, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit71 ], [ %.4, %238 ]
  %239 = getelementptr inbounds %"struct.Eigen::IOFormat", %"struct.Eigen::IOFormat"* %this, i64 0, i32 0, i32 0, i32 0
  %240 = load i8*, i8** %239, align 8, !tbaa !8
  %241 = icmp eq i8* %240, %9
  br i1 %241, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit73, label %242

; <label>:242                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit72
  call void @_ZdlPv(i8* %240) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit73

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit73: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit72, %242
  %243 = insertvalue { i8*, i32 } undef, i8* %.56, 0
  %244 = insertvalue { i8*, i32 } %243, i32 %.5, 1
  resume { i8*, i32 } %244
}

declare dereferenceable(264) %"class.std::basic_ios"* @_ZNSt9basic_iosIcSt11char_traitsIcEE7copyfmtERKS2_(%"class.std::basic_ios"*, %"class.std::basic_ios"* dereferenceable(264)) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"*, double) #0

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm(%"class.std::__cxx11::basic_string"*, i64, i64, i8*, i64) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_SA_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_(%"class.Eigen::TensorAssignOp.30"* nocapture readonly dereferenceable(16) %expr, %"struct.Eigen::GpuDevice"* dereferenceable(16) %device) #4 comdat align 2 {
  %1 = alloca i64, align 8
  %2 = alloca %"struct.Eigen::TensorEvaluator.32", align 16
  %3 = bitcast %"class.Eigen::TensorAssignOp.30"* %expr to <2 x i64>**
  %4 = load <2 x i64>*, <2 x i64>** %3, align 8, !tbaa !14
  %5 = load <2 x i64>, <2 x i64>* %4, align 8
  %6 = getelementptr inbounds %"class.Eigen::TensorAssignOp.30", %"class.Eigen::TensorAssignOp.30"* %expr, i64 0, i32 1
  %7 = load %"class.Eigen::TensorCwiseBinaryOp"*, %"class.Eigen::TensorCwiseBinaryOp"** %6, align 8, !tbaa !14
  %8 = bitcast %"class.Eigen::TensorCwiseBinaryOp"* %7 to <2 x i64>**
  %9 = load <2 x i64>*, <2 x i64>** %8, align 8, !tbaa !14
  %10 = load <2 x i64>, <2 x i64>* %9, align 8
  %11 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %7, i64 0, i32 1
  %12 = bitcast %"class.Eigen::TensorMap"** %11 to <2 x i64>**
  %13 = load <2 x i64>*, <2 x i64>** %12, align 8, !tbaa !14
  %14 = load <2 x i64>, <2 x i64>* %13, align 8
  %15 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %device, i64 0, i32 0
  %16 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !54
  %17 = bitcast %"class.Eigen::StreamInterface"* %16 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %18 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %17, align 8, !tbaa !17
  %19 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %18, i64 3
  %20 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %19, align 8
  %21 = tail call dereferenceable(632) %struct.cudaDeviceProp* %20(%"class.Eigen::StreamInterface"* %16)
  %22 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %21, i64 0, i32 6
  %23 = load i32, i32* %22, align 8, !tbaa !98
  %24 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !54
  %25 = bitcast %"class.Eigen::StreamInterface"* %24 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %26 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %25, align 8, !tbaa !17
  %27 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %26, i64 3
  %28 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %27, align 8
  %29 = tail call dereferenceable(632) %struct.cudaDeviceProp* %28(%"class.Eigen::StreamInterface"* %24)
  %30 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %29, i64 0, i32 16
  %31 = load i32, i32* %30, align 4, !tbaa !100
  %32 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !54
  %33 = bitcast %"class.Eigen::StreamInterface"* %32 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %34 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %33, align 8, !tbaa !17
  %35 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %34, i64 3
  %36 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %35, align 8
  %37 = tail call dereferenceable(632) %struct.cudaDeviceProp* %36(%"class.Eigen::StreamInterface"* %32)
  %38 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %37, i64 0, i32 53
  %39 = load i32, i32* %38, align 4, !tbaa !101
  %40 = mul nsw i32 %39, %31
  %41 = sdiv i32 %40, %23
  %42 = sext i32 %23 to i64
  %43 = extractelement <2 x i64> %10, i32 1
  %44 = add i64 %43, -1
  %45 = add i64 %44, %42
  %46 = sdiv i64 %45, %42
  %47 = trunc i64 %46 to i32
  %48 = icmp slt i32 %47, %41
  %49 = select i1 %48, i32 %47, i32 %41
  %50 = icmp slt i32 %49, 1
  %51 = select i1 %50, i32 1, i32 %49
  %52 = zext i32 %51 to i64
  %53 = or i64 %52, 4294967296
  %54 = zext i32 %23 to i64
  %55 = or i64 %54, 4294967296
  %56 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !54
  %57 = bitcast %"class.Eigen::StreamInterface"* %56 to %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)***
  %58 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)**, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*** %57, align 8, !tbaa !17
  %59 = getelementptr inbounds %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %58, i64 2
  %60 = load %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)*, %struct.CUstream_st** (%"class.Eigen::StreamInterface"*)** %59, align 8
  %61 = tail call dereferenceable(8) %struct.CUstream_st** %60(%"class.Eigen::StreamInterface"* %56)
  %62 = load %struct.CUstream_st*, %struct.CUstream_st** %61, align 8, !tbaa !16
  %63 = tail call i32 @cudaConfigureCall(i64 %53, i32 1, i64 %55, i32 1, i64 0, %struct.CUstream_st* %62)
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %83

; <label>:65                                      ; preds = %0
  %66 = bitcast %"struct.Eigen::TensorEvaluator.32"* %2 to <2 x i64>*
  store <2 x i64> %5, <2 x i64>* %66, align 16
  %67 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %2, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %67, align 16
  %68 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %2, i64 0, i32 1, i32 1
  %69 = bitcast %"struct.Eigen::TensorEvaluator.35"* %68 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %69, align 8
  %70 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %2, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %70, align 8
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %2, i64 0, i32 1, i32 2
  %72 = bitcast %"struct.Eigen::TensorEvaluator.35"* %71 to <2 x i64>*
  store <2 x i64> %14, <2 x i64>* %72, align 8
  %73 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %2, i64 0, i32 1, i32 2, i32 2
  store %"struct.Eigen::GpuDevice"* %device, %"struct.Eigen::GpuDevice"** %73, align 8
  %74 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %74)
  store i64 %43, i64* %1, align 8, !tbaa !15
  %75 = bitcast %"struct.Eigen::TensorEvaluator.32"* %2 to i8*
  %76 = call i32 @cudaSetupArgument(i8* %75, i64 80, i64 0)
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_.exit

; <label>:78                                      ; preds = %65
  %79 = call i32 @cudaSetupArgument(i8* %74, i64 8, i64 80)
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_.exit

; <label>:81                                      ; preds = %78
  %82 = call i32 @cudaLaunch(i8* nonnull bitcast (void (%"struct.Eigen::TensorEvaluator.32"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_ to i8*))
  br label %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_.exit

_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_.exit: ; preds = %65, %78, %81
  call void @llvm.lifetime.end(i64 8, i8* %74)
  br label %83

; <label>:83                                      ; preds = %0, %_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_.exit
  %84 = call i32 @cudaGetLastError()
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %87, label %86

; <label>:86                                      ; preds = %83
  call void @__assert_fail(i8* nonnull getelementptr inbounds ([34 x i8], [34 x i8]* @.str.53, i64 0, i64 0), i8* nonnull getelementptr inbounds ([69 x i8], [69 x i8]* @.str.54, i64 0, i64 0), i32 262, i8* nonnull getelementptr inbounds ([763 x i8], [763 x i8]* @__PRETTY_FUNCTION__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS6_SA_EEEENS_9GpuDeviceELb1EE3runERSE_RKSF_, i64 0, i64 0)) #21
  unreachable

; <label>:87                                      ; preds = %83
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #0

; Function Attrs: uwtable
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.32"* %eval, i64 %size) #4 comdat {
  %1 = alloca i64, align 8
  store i64 %size, i64* %1, align 8, !tbaa !15
  %2 = bitcast %"struct.Eigen::TensorEvaluator.32"* %eval to i8*
  %3 = tail call i32 @cudaSetupArgument(i8* %2, i64 80, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i64* %1 to i8*
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 80)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %5
  %10 = call i32 @cudaLaunch(i8* nonnull bitcast (void (%"struct.Eigen::TensorEvaluator.32"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_ to i8*))
  br label %11

; <label>:11                                      ; preds = %9, %5, %0
  ret void
}

declare i32 @cudaGetLastError() #0

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: nounwind readnone
declare float @fabsf(float) #10

; Function Attrs: nounwind readnone
declare float @sqrtf(float) #10

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_test_cuda_elementwise_small.cu() #4 section ".text.startup" personality i32 (...)* @__gxx_personality_v0 {
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
!36 = !{!"_ZTSN5Eigen13TensorStorageIfNS_6DSizesIlLi1EEELi0EEE", !4, i64 0, !37, i64 8}
!37 = !{!"_ZTSN5Eigen6DSizesIlLi1EEE"}
!38 = !{!39}
!39 = distinct !{!39, !40, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE6randomEv: %agg.result"}
!40 = distinct !{!40, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE6randomEv"}
!41 = !{!42, !11, i64 8}
!42 = !{!"_ZTS8timespec", !11, i64 0, !11, i64 8}
!43 = !{!44, !39}
!44 = distinct !{!44, !45, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_: %agg.result"}
!45 = distinct !{!45, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_"}
!46 = !{!47, !11, i64 0}
!47 = !{!"_ZTSN5Eigen8internal22UniformRandomGeneratorIfEE", !11, i64 0}
!48 = !{!49}
!49 = distinct !{!49, !50, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE6randomEv: %agg.result"}
!50 = distinct !{!50, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE6randomEv"}
!51 = !{!52, !49}
!52 = distinct !{!52, !53, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_: %agg.result"}
!53 = distinct !{!53, !"_ZNK5Eigen10TensorBaseINS_6TensorIfLi1ELi0ElEELi0EE11nullaryExprINS_8internal22UniformRandomGeneratorIfEEEEKNS_20TensorCwiseNullaryOpIT_KS2_EERKS9_"}
!54 = !{!55, !4, i64 0}
!55 = !{!"_ZTSN5Eigen9GpuDeviceE", !4, i64 0, !24, i64 8}
!56 = !{!55, !24, i64 8}
!57 = !{!58, !4, i64 0}
!58 = !{!"_ZTSN5Eigen9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEE", !4, i64 0, !37, i64 8}
!59 = !{!60, !62}
!60 = distinct !{!60, !61, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEELi0EE10binaryExprINS_8internal13scalar_sum_opIffEES4_EEKNS_19TensorCwiseBinaryOpIT_KS4_KT0_EERSE_RKSB_: %agg.result"}
!61 = distinct !{!61, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEELi0EE10binaryExprINS_8internal13scalar_sum_opIffEES4_EEKNS_19TensorCwiseBinaryOpIT_KS4_KT0_EERSE_RKSB_"}
!62 = distinct !{!62, !63, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEELi0EEplIS4_EEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKS4_KT_EERSD_: %agg.result"}
!63 = distinct !{!63, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEELi0EEplIS4_EEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKS4_KT_EERSD_"}
!64 = !{!65, !4, i64 24}
!65 = !{!"_ZTSN5Eigen16CudaStreamDeviceE", !4, i64 8, !24, i64 16, !4, i64 24, !4, i64 32}
!66 = !{!65, !24, i64 16}
!67 = !{!68, !68, i64 0}
!68 = !{!"float", !5, i64 0}
!69 = distinct !{!69, !70}
!70 = !{!"llvm.loop.unroll.disable"}
!71 = distinct !{!71, !72, !73}
!72 = !{!"llvm.loop.vectorize.width", i32 1}
!73 = !{!"llvm.loop.interleave.count", i32 1}
!74 = distinct !{!74, !75, !72, !73}
!75 = !{!"llvm.loop.unroll.runtime.disable"}
!76 = !{!77, !4, i64 0}
!77 = !{!"_ZTSN5Eigen7MapBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEELi0EEE", !4, i64 0, !78, i64 8, !79, i64 16}
!78 = !{!"_ZTSN5Eigen8internal19variable_if_dynamicIlLin1EEE", !11, i64 0}
!79 = !{!"_ZTSN5Eigen8internal19variable_if_dynamicIlLi1EEE"}
!80 = !{!78, !11, i64 0}
!81 = !{!65, !4, i64 8}
!82 = !{!65, !4, i64 32}
!83 = !{!84}
!84 = distinct !{!84, !85, !"_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv: %agg.result"}
!85 = distinct !{!85, !"_ZNK5Eigen9DenseBaseINS_3MapIKNS_5ArrayIfLin1ELi1ELi0ELin1ELi1EEELi0ENS_6StrideILi0ELi0EEEEEE4evalEv"}
!86 = !{!87, !4, i64 0}
!87 = !{!"_ZTSN5Eigen12DenseStorageIfLin1ELin1ELi1ELi0EEE", !4, i64 0, !11, i64 8}
!88 = !{!87, !11, i64 8}
!89 = distinct !{!89, !70}
!90 = distinct !{!90, !72, !73}
!91 = distinct !{!91, !70}
!92 = distinct !{!92, !72, !73}
!93 = !{!20, !11, i64 8}
!94 = !{!20, !11, i64 16}
!95 = !{!96, !24, i64 224}
!96 = !{!"_ZTSN5Eigen8IOFormatE", !9, i64 0, !9, i64 32, !9, i64 64, !9, i64 96, !9, i64 128, !9, i64 160, !9, i64 192, !24, i64 224, !24, i64 228}
!97 = !{!96, !24, i64 228}
!98 = !{!99, !24, i64 288}
!99 = !{!"_ZTS14cudaDeviceProp", !5, i64 0, !11, i64 256, !11, i64 264, !24, i64 272, !24, i64 276, !11, i64 280, !24, i64 288, !5, i64 292, !5, i64 304, !24, i64 316, !11, i64 320, !24, i64 328, !24, i64 332, !11, i64 336, !11, i64 344, !24, i64 352, !24, i64 356, !24, i64 360, !24, i64 364, !24, i64 368, !24, i64 372, !24, i64 376, !24, i64 380, !24, i64 384, !5, i64 388, !5, i64 396, !5, i64 404, !5, i64 416, !5, i64 424, !5, i64 436, !24, i64 448, !5, i64 452, !5, i64 460, !5, i64 472, !24, i64 480, !5, i64 484, !5, i64 492, !5, i64 504, !5, i64 512, !24, i64 524, !5, i64 528, !11, i64 536, !24, i64 544, !24, i64 548, !24, i64 552, !24, i64 556, !24, i64 560, !24, i64 564, !24, i64 568, !24, i64 572, !24, i64 576, !24, i64 580, !24, i64 584, !24, i64 588, !24, i64 592, !24, i64 596, !24, i64 600, !11, i64 608, !24, i64 616, !24, i64 620, !24, i64 624, !24, i64 628}
!100 = !{!99, !24, i64 356}
!101 = !{!99, !24, i64 588}
