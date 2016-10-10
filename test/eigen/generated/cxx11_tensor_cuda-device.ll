; ModuleID = 'test/eigen/cxx11_tensor_cuda.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.1" }
%"struct.Eigen::TensorEvaluator.0" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [1 x i32] }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::TensorEvaluator.1" = type <{ %"struct.Eigen::internal::scalar_constant_op", [4 x i8], %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::internal::nullary_wrapper", [7 x i8] }>
%"struct.Eigen::internal::scalar_constant_op" = type { float }
%"struct.Eigen::TensorEvaluator.2" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::internal::nullary_wrapper" = type { i8 }
%"struct.Eigen::TensorEvaluator.3" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.4" }
%"struct.Eigen::TensorEvaluator.4" = type <{ %"class.Eigen::internal::UniformRandomGenerator", %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::internal::nullary_wrapper.5", [7 x i8] }>
%"class.Eigen::internal::UniformRandomGenerator" = type { i64 }
%"struct.Eigen::internal::nullary_wrapper.5" = type { i8 }
%"struct.Eigen::TensorEvaluator.7" = type { %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.11" }
%"struct.Eigen::TensorEvaluator.8" = type { float*, %"struct.Eigen::DSizes.9", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.9" = type { %"class.Eigen::array.10" }
%"class.Eigen::array.10" = type { [1 x i64] }
%"struct.Eigen::TensorEvaluator.11" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.12", %"struct.Eigen::TensorEvaluator.12" }
%"struct.Eigen::internal::scalar_sum_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.12" = type { float*, %"struct.Eigen::DSizes.9", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.13" = type { %"struct.Eigen::TensorEvaluator.14", %"struct.Eigen::TensorEvaluator.17" }
%"struct.Eigen::TensorEvaluator.14" = type { float*, %"struct.Eigen::DSizes.15", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.15" = type { %"class.Eigen::array.16" }
%"class.Eigen::array.16" = type { [3 x i64] }
%"struct.Eigen::TensorEvaluator.17" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.19" }
%"struct.Eigen::TensorEvaluator.18" = type { float*, %"struct.Eigen::DSizes.15", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.19" = type { %"struct.Eigen::internal::scalar_product_op", %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.18" }
%"struct.Eigen::internal::scalar_product_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.20" = type { %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.22" }
%"struct.Eigen::TensorEvaluator.21" = type { i8*, %"struct.Eigen::DSizes.9", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.22" = type { %"struct.Eigen::internal::scalar_isnan_op", %"struct.Eigen::TensorEvaluator.12" }
%"struct.Eigen::internal::scalar_isnan_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.23" = type { %"struct.Eigen::TensorEvaluator.24", %"struct.Eigen::GpuDevice"*, float* }
%"struct.Eigen::TensorEvaluator.24" = type { float*, %"struct.Eigen::DSizes.9", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.25" = type { float*, %"struct.Eigen::DSizes.26", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.26" = type { %"class.Eigen::array.27" }
%"class.Eigen::array.27" = type { [4 x i64] }
%"class.Eigen::internal::IndexMapper" = type { %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27" }
%"class.Eigen::internal::IndexMapper.30" = type { %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27" }
%"class.Eigen::internal::IndexMapper.31" = type { %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27" }
%"struct.Eigen::TensorEvaluator.32" = type { %"struct.Eigen::TensorEvaluator.33", %"struct.Eigen::TensorEvaluator.34" }
%"struct.Eigen::TensorEvaluator.33" = type { float*, %"struct.Eigen::DSizes.26", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.34" = type { %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.24", %"class.Eigen::TensorMap", %"class.Eigen::array.10", %"struct.Eigen::DSizes.26", float*, float*, i8, %"struct.Eigen::GpuDevice"* }
%"class.Eigen::TensorMap" = type { float*, %"struct.Eigen::DSizes.9" }
%"struct.Eigen::TensorEvaluator.36" = type { %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::GpuDevice"*, float* }
%"struct.Eigen::TensorEvaluator.37" = type { float*, %"struct.Eigen::DSizes.9", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.38" = type { float*, %"struct.Eigen::DSizes.26", %"struct.Eigen::GpuDevice"* }
%"class.Eigen::internal::IndexMapper.39" = type { %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27" }
%"class.Eigen::internal::IndexMapper.40" = type { %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27" }
%"class.Eigen::internal::IndexMapper.41" = type { %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27", %"class.Eigen::array.27" }
%"struct.Eigen::TensorEvaluator.42" = type { %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.44" }
%"struct.Eigen::TensorEvaluator.43" = type { float*, %"struct.Eigen::DSizes.26", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.44" = type { %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.37", %"class.Eigen::TensorMap.45", %"class.Eigen::array.10", %"struct.Eigen::DSizes.26", float*, float*, i8, %"struct.Eigen::GpuDevice"* }
%"class.Eigen::TensorMap.45" = type { float*, %"struct.Eigen::DSizes.9" }

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf = comdat any

$_ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@_ZN5Eigen1sE = external addrspace(3) global [0 x float], align 4
@"$str" = private addrspace(1) constant [11 x i8] c"__CUDA_FTZ\00"
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #2
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #0

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8 %eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %7 = mul i32 %6, %2
  %8 = sdiv i32 %size, 4
  %9 = shl nsw i32 %8, 2
  %10 = shl i32 %7, 2
  %11 = shl nsw i32 %5, 2
  %12 = icmp slt i32 %11, %9
  br i1 %12, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 0, i32 0
  %14 = bitcast float* %13 to i32*
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 0, i32 0
  %16 = load i32, i32* %14, align 8
  %17 = load float*, float** %15, align 8
  br label %25

._crit_edge6.i.loopexit:                          ; preds = %25
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %18 = add nsw i32 %5, %9
  %19 = icmp slt i32 %18, %size
  br i1 %19, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 0, i32 0
  %21 = bitcast float* %20 to i32*
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 0, i32 0
  %23 = load float*, float** %22, align 8
  %24 = load i32, i32* %21, align 8
  br label %37

; <label>:25                                      ; preds = %25, %.lr.ph5.i
  %i.03.i = phi i32 [ %11, %.lr.ph5.i ], [ %35, %25 ]
  %26 = sext i32 %i.03.i to i64
  %27 = getelementptr inbounds float, float* %17, i64 %26
  %28 = bitcast float* %27 to i32*
  store i32 %16, i32* %28, align 16
  %29 = getelementptr inbounds float, float* %27, i64 1
  %30 = bitcast float* %29 to i32*
  store i32 %16, i32* %30, align 4
  %31 = getelementptr inbounds float, float* %27, i64 2
  %32 = bitcast float* %31 to i32*
  store i32 %16, i32* %32, align 8
  %33 = getelementptr inbounds float, float* %27, i64 3
  %34 = bitcast float* %33 to i32*
  store i32 %16, i32* %34, align 4
  %35 = add nsw i32 %i.03.i, %10
  %36 = icmp slt i32 %35, %9
  br i1 %36, label %25, label %._crit_edge6.i.loopexit

; <label>:37                                      ; preds = %37, %.lr.ph.i
  %i1.02.i = phi i32 [ %18, %.lr.ph.i ], [ %41, %37 ]
  %38 = sext i32 %i1.02.i to i64
  %39 = getelementptr inbounds float, float* %23, i64 %38
  %40 = bitcast float* %39 to i32*
  store i32 %24, i32* %40, align 4, !tbaa !42
  %41 = add nsw i32 %i1.02.i, %7
  %42 = icmp slt i32 %41, %size
  br i1 %42, label %37, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit.loopexit: ; preds = %37
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.nctaid.x() #2

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.3"* byval nocapture align 8 %eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %7 = mul i32 %6, %2
  %8 = sdiv i32 %size, 4
  %9 = shl nsw i32 %8, 2
  %10 = shl i32 %7, 2
  %11 = shl nsw i32 %5, 2
  %12 = icmp slt i32 %11, %9
  br i1 %12, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %eval, i64 0, i32 1, i32 0, i32 0
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %eval, i64 0, i32 0, i32 0
  %15 = load float*, float** %14, align 8
  %.promoted = load i64, i64* %13, align 8, !tbaa !46
  br label %21

._crit_edge6.i.loopexit:                          ; preds = %21
  %.lcssa6 = phi i64 [ %62, %21 ]
  store i64 %.lcssa6, i64* %13, align 8, !tbaa !46
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %16 = add nsw i32 %5, %9
  %17 = icmp slt i32 %16, %size
  br i1 %17, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %eval, i64 0, i32 1, i32 0, i32 0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %eval, i64 0, i32 0, i32 0
  %20 = load float*, float** %19, align 8
  %.promoted.i = load i64, i64* %18, align 8, !tbaa !46
  br label %79

; <label>:21                                      ; preds = %21, %.lr.ph5.i
  %22 = phi i64 [ %.promoted, %.lr.ph5.i ], [ %62, %21 ]
  %i.03.i = phi i32 [ %11, %.lr.ph5.i ], [ %77, %21 ]
  %23 = sext i32 %i.03.i to i64
  %24 = add i64 %22, %23
  %25 = mul i64 %24, 6364136223846793005
  %26 = add i64 %25, -2720673578348880933
  %27 = lshr i64 %24, 22
  %28 = xor i64 %27, %24
  %29 = lshr i64 %24, 61
  %30 = add nuw nsw i64 %29, 22
  %31 = lshr i64 %28, %30
  %32 = trunc i64 %31 to i32
  %33 = and i32 %32, 8388607
  %34 = or i32 %33, 1065353216
  %35 = bitcast i32 %34 to float
  %36 = fadd float %35, -1.000000e+00
  %37 = mul i64 %26, 6364136223846793005
  %38 = add i64 %37, -2720673578348880933
  %39 = lshr i64 %26, 22
  %40 = xor i64 %39, %26
  %41 = lshr i64 %26, 61
  %42 = add nuw nsw i64 %41, 22
  %43 = lshr i64 %40, %42
  %44 = trunc i64 %43 to i32
  %45 = and i32 %44, 8388607
  %46 = or i32 %45, 1065353216
  %47 = bitcast i32 %46 to float
  %48 = fadd float %47, -1.000000e+00
  %49 = mul i64 %38, 6364136223846793005
  %50 = add i64 %49, -2720673578348880933
  %51 = lshr i64 %38, 22
  %52 = xor i64 %51, %38
  %53 = lshr i64 %38, 61
  %54 = add nuw nsw i64 %53, 22
  %55 = lshr i64 %52, %54
  %56 = trunc i64 %55 to i32
  %57 = and i32 %56, 8388607
  %58 = or i32 %57, 1065353216
  %59 = bitcast i32 %58 to float
  %60 = fadd float %59, -1.000000e+00
  %61 = mul i64 %50, 6364136223846793005
  %62 = add i64 %61, -2720673578348880933
  %63 = lshr i64 %50, 22
  %64 = xor i64 %63, %50
  %65 = lshr i64 %50, 61
  %66 = add nuw nsw i64 %65, 22
  %67 = lshr i64 %64, %66
  %68 = trunc i64 %67 to i32
  %69 = and i32 %68, 8388607
  %70 = or i32 %69, 1065353216
  %71 = bitcast i32 %70 to float
  %72 = fadd float %71, -1.000000e+00
  %73 = getelementptr inbounds float, float* %15, i64 %23
  store float %36, float* %73, align 16
  %74 = getelementptr inbounds float, float* %73, i64 1
  store float %48, float* %74, align 4
  %75 = getelementptr inbounds float, float* %73, i64 2
  store float %60, float* %75, align 8
  %76 = getelementptr inbounds float, float* %73, i64 3
  store float %72, float* %76, align 4
  %77 = add nsw i32 %i.03.i, %10
  %78 = icmp slt i32 %77, %9
  br i1 %78, label %21, label %._crit_edge6.i.loopexit

._crit_edge.i:                                    ; preds = %79
  %.lcssa = phi i64 [ %84, %79 ]
  store i64 %.lcssa, i64* %18, align 8, !tbaa !46
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit

; <label>:79                                      ; preds = %79, %.lr.ph.i
  %80 = phi i64 [ %.promoted.i, %.lr.ph.i ], [ %84, %79 ]
  %i1.02.i = phi i32 [ %16, %.lr.ph.i ], [ %96, %79 ]
  %81 = sext i32 %i1.02.i to i64
  %82 = add i64 %81, %80
  %83 = mul i64 %82, 6364136223846793005
  %84 = add i64 %83, -2720673578348880933
  %85 = lshr i64 %82, 22
  %86 = xor i64 %85, %82
  %87 = lshr i64 %82, 61
  %88 = add nuw nsw i64 %87, 22
  %89 = lshr i64 %86, %88
  %90 = trunc i64 %89 to i32
  %91 = and i32 %90, 8388607
  %92 = or i32 %91, 1065353216
  %93 = bitcast i32 %92 to float
  %94 = fadd float %93, -1.000000e+00
  %95 = getelementptr inbounds float, float* %20, i64 %81
  store float %94, float* %95, align 4, !tbaa !42
  %96 = add nsw i32 %i1.02.i, %7
  %97 = icmp slt i32 %96, %size
  br i1 %97, label %79, label %._crit_edge.i

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit: ; preds = %._crit_edge6.i, %._crit_edge.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.7"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = sdiv i64 %size, 4
  %11 = shl nsw i64 %10, 2
  %12 = shl nuw nsw i64 %9, 2
  %13 = shl nuw nsw i64 %6, 2
  %14 = icmp slt i64 %13, %11
  br i1 %14, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %eval, i64 0, i32 1, i32 1, i32 0
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %eval, i64 0, i32 1, i32 2, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %eval, i64 0, i32 0, i32 0
  %18 = load float*, float** %15, align 8
  %19 = load float*, float** %16, align 8
  %20 = load float*, float** %17, align 8
  br label %29

._crit_edge6.i.loopexit:                          ; preds = %29
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i64 %6, %11
  %22 = icmp slt i64 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %eval, i64 0, i32 1, i32 1, i32 0
  %24 = load float*, float** %23, align 8
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %eval, i64 0, i32 1, i32 2, i32 0
  %26 = load float*, float** %25, align 8
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %eval, i64 0, i32 0, i32 0
  %28 = load float*, float** %27, align 8
  br label %56

; <label>:29                                      ; preds = %29, %.lr.ph5.i
  %i.03.i = phi i64 [ %13, %.lr.ph5.i ], [ %54, %29 ]
  %30 = getelementptr inbounds float, float* %18, i64 %i.03.i
  %31 = load float, float* %30, align 4, !tbaa !42
  %32 = getelementptr inbounds float, float* %30, i64 1
  %33 = load float, float* %32, align 4, !tbaa !42
  %34 = getelementptr inbounds float, float* %30, i64 2
  %35 = load float, float* %34, align 4, !tbaa !42
  %36 = getelementptr inbounds float, float* %30, i64 3
  %37 = load float, float* %36, align 4, !tbaa !42
  %38 = getelementptr inbounds float, float* %19, i64 %i.03.i
  %39 = load float, float* %38, align 4, !tbaa !42
  %40 = getelementptr inbounds float, float* %38, i64 1
  %41 = load float, float* %40, align 4, !tbaa !42
  %42 = getelementptr inbounds float, float* %38, i64 2
  %43 = load float, float* %42, align 4, !tbaa !42
  %44 = getelementptr inbounds float, float* %38, i64 3
  %45 = load float, float* %44, align 4, !tbaa !42
  %46 = fadd float %31, %39
  %47 = fadd float %33, %41
  %48 = fadd float %35, %43
  %49 = fadd float %37, %45
  %50 = getelementptr inbounds float, float* %20, i64 %i.03.i
  store float %46, float* %50, align 16
  %51 = getelementptr inbounds float, float* %50, i64 1
  store float %47, float* %51, align 4
  %52 = getelementptr inbounds float, float* %50, i64 2
  store float %48, float* %52, align 8
  %53 = getelementptr inbounds float, float* %50, i64 3
  store float %49, float* %53, align 4
  %54 = add nuw nsw i64 %i.03.i, %12
  %55 = icmp slt i64 %54, %11
  br i1 %55, label %29, label %._crit_edge6.i.loopexit

; <label>:56                                      ; preds = %56, %.lr.ph.i
  %i1.02.i = phi i64 [ %21, %.lr.ph.i ], [ %61, %56 ]
  %57 = getelementptr inbounds float, float* %24, i64 %i1.02.i
  %.val.i.i.i.i = load float, float* %57, align 4, !tbaa !42
  %58 = getelementptr inbounds float, float* %26, i64 %i1.02.i
  %.val.i1.i.i.i = load float, float* %58, align 4, !tbaa !42
  %59 = fadd float %.val.i.i.i.i, %.val.i1.i.i.i
  %60 = getelementptr inbounds float, float* %28, i64 %i1.02.i
  store float %59, float* %60, align 4, !tbaa !42
  %61 = add nsw i64 %i1.02.i, %9
  %62 = icmp slt i64 %61, %size
  br i1 %62, label %56, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit.loopexit: ; preds = %56
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.13"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %size
  br i1 %10, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

.lr.ph.i:                                         ; preds = %0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %eval, i64 0, i32 1, i32 1, i32 0
  %12 = load float*, float** %11, align 8
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0
  %14 = load float*, float** %13, align 8
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0
  %16 = load float*, float** %15, align 8
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %eval, i64 0, i32 0, i32 0
  %18 = load float*, float** %17, align 8
  br label %19

; <label>:19                                      ; preds = %19, %.lr.ph.i
  %i.01.i = phi i64 [ %6, %.lr.ph.i ], [ %26, %19 ]
  %20 = getelementptr inbounds float, float* %12, i64 %i.01.i
  %.val.i.i.i.i = load float, float* %20, align 4, !tbaa !42
  %21 = getelementptr inbounds float, float* %14, i64 %i.01.i
  %.val.i.i.i.i.i = load float, float* %21, align 4, !tbaa !42
  %22 = getelementptr inbounds float, float* %16, i64 %i.01.i
  %.val.i1.i.i.i.i = load float, float* %22, align 4, !tbaa !42
  %23 = fmul float %.val.i.i.i.i.i, %.val.i1.i.i.i.i
  %24 = fadd float %.val.i.i.i.i, %23
  %25 = getelementptr inbounds float, float* %18, i64 %i.01.i
  store float %24, float* %25, align 4, !tbaa !42
  %26 = add nuw nsw i64 %i.01.i, %9
  %27 = icmp slt i64 %26, %size
  br i1 %27, label %19, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit: ; preds = %19
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit, %0
  ret void
}

; Function Attrs: nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.20"* byval nocapture readonly align 8 %eval, i64 %size) #3 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %size
  br i1 %10, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit

.lr.ph.i:                                         ; preds = %0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %eval, i64 0, i32 1, i32 1, i32 0
  %12 = load float*, float** %11, align 8
  %call.i.i.i.i.i.i.i.i.i.i = tail call i32 @__nvvm_reflect(i8* addrspacecast (i8 addrspace(1)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(1)* @"$str", i64 0, i64 0) to i8*)) #5
  %13 = icmp eq i32 %call.i.i.i.i.i.i.i.i.i.i, 0
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %eval, i64 0, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  br i1 %13, label %.lr.ph.split.us.i.preheader, label %.lr.ph.split.i.preheader

.lr.ph.split.i.preheader:                         ; preds = %.lr.ph.i
  br label %.lr.ph.split.i

.lr.ph.split.us.i.preheader:                      ; preds = %.lr.ph.i
  br label %.lr.ph.split.us.i

.lr.ph.split.us.i:                                ; preds = %.lr.ph.split.us.i.preheader, %.lr.ph.split.us.i
  %i.01.us.i = phi i64 [ %21, %.lr.ph.split.us.i ], [ %6, %.lr.ph.split.us.i.preheader ]
  %16 = getelementptr inbounds float, float* %12, i64 %i.01.us.i
  %.val.i.i.i.us.i = load float, float* %16, align 4, !tbaa !42
  %17 = tail call float @llvm.nvvm.fabs.f(float %.val.i.i.i.us.i) #5
  %18 = fcmp ugt float %17, 0x7FF0000000000000
  %19 = getelementptr inbounds i8, i8* %15, i64 %i.01.us.i
  %20 = zext i1 %18 to i8
  store i8 %20, i8* %19, align 1, !tbaa !49
  %21 = add nuw nsw i64 %i.01.us.i, %9
  %22 = icmp slt i64 %21, %size
  br i1 %22, label %.lr.ph.split.us.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit.loopexit

.lr.ph.split.i:                                   ; preds = %.lr.ph.split.i.preheader, %.lr.ph.split.i
  %i.01.i = phi i64 [ %28, %.lr.ph.split.i ], [ %6, %.lr.ph.split.i.preheader ]
  %23 = getelementptr inbounds float, float* %12, i64 %i.01.i
  %.val.i.i.i.i = load float, float* %23, align 4, !tbaa !42
  %24 = tail call float @llvm.nvvm.fabs.ftz.f(float %.val.i.i.i.i) #5
  %25 = fcmp ugt float %24, 0x7FF0000000000000
  %26 = getelementptr inbounds i8, i8* %15, i64 %i.01.i
  %27 = zext i1 %25 to i8
  store i8 %27, i8* %26, align 1, !tbaa !49
  %28 = add nuw nsw i64 %i.01.i, %9
  %29 = icmp slt i64 %28, %size
  br i1 %29, label %.lr.ph.split.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit.loopexit5

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit.loopexit: ; preds = %.lr.ph.split.us.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit.loopexit5: ; preds = %.lr.ph.split.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit.loopexit5, %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.23"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %size
  br i1 %10, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit

.lr.ph.i:                                         ; preds = %0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.23", %"struct.Eigen::TensorEvaluator.23"* %eval, i64 0, i32 0, i32 0
  %12 = load float*, float** %11, align 8
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.23", %"struct.Eigen::TensorEvaluator.23"* %eval, i64 0, i32 2
  %14 = load float*, float** %13, align 8
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph.i
  %i.01.i = phi i64 [ %6, %.lr.ph.i ], [ %20, %15 ]
  %16 = getelementptr inbounds float, float* %12, i64 %i.01.i
  %17 = bitcast float* %16 to i32*
  %.val.i1.i.i = load i32, i32* %17, align 4, !tbaa !42
  %18 = getelementptr inbounds float, float* %14, i64 %i.01.i
  %19 = bitcast float* %18 to i32*
  store i32 %.val.i1.i.i, i32* %19, align 4, !tbaa !42
  %20 = add nuw nsw i64 %i.01.i, %9
  %21 = icmp slt i64 %20, %size
  br i1 %21, label %15, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit.loopexit: ; preds = %15
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %kernelSize, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 4
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.ptx.read.nctaid.y() #5
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.ptx.read.tid.y() #5
  %14 = add i32 %13, %10
  %15 = icmp slt i32 %14, %numPlanes
  br i1 %15, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %0
  %16 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 2, i32 0, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %25 = load i64, i64* %24, align 8
  %26 = mul i32 %7, %13
  %27 = tail call i32 @llvm.ptx.read.tid.x() #5
  %28 = icmp slt i32 %27, %7
  %29 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 3, i32 0, i64 2
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %27, %6
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %45 = load float*, float** %44, align 8
  %.phi.trans.insert = getelementptr inbounds float, float* %kernel, i64 1
  %.phi.trans.insert19 = getelementptr inbounds float, float* %kernel, i64 2
  %.phi.trans.insert21 = getelementptr inbounds float, float* %kernel, i64 3
  br label %46

._crit_edge17.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %0
  ret void

; <label>:46                                      ; preds = %.lr.ph16, %._crit_edge13
  %p.014 = phi i32 [ %14, %.lr.ph16 ], [ %87, %._crit_edge13 ]
  %47 = sext i32 %p.014 to i64
  %48 = sdiv i64 %47, %17
  %49 = mul nsw i64 %19, %48
  %50 = mul nsw i64 %48, %17
  %51 = sub nsw i64 %47, %50
  %52 = sdiv i64 %51, %21
  %53 = mul nsw i64 %23, %52
  %54 = add nsw i64 %53, %49
  %55 = mul nsw i64 %52, %21
  %56 = sub nsw i64 %51, %55
  %57 = mul nsw i64 %25, %56
  %58 = add nsw i64 %54, %57
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %46
  %59 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %72

._crit_edge.loopexit:                             ; preds = %72
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %46
  tail call void @llvm.cuda.syncthreads()
  %60 = sdiv i64 %47, %30
  %61 = mul nsw i64 %32, %60
  %62 = mul nsw i64 %60, %30
  %63 = sub nsw i64 %47, %62
  %64 = sdiv i64 %63, %34
  %65 = mul nsw i64 %36, %64
  %66 = add nsw i64 %65, %61
  %67 = mul nsw i64 %64, %34
  %68 = sub nsw i64 %63, %67
  %69 = mul nsw i64 %38, %68
  %70 = add nsw i64 %66, %69
  br i1 %39, label %._crit_edge13, label %.lr.ph12

.lr.ph12:                                         ; preds = %._crit_edge
  %71 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %.pre = load float, float* %kernel, align 4, !tbaa !42
  %.pre18 = load float, float* %.phi.trans.insert, align 4, !tbaa !42
  %.pre20 = load float, float* %.phi.trans.insert19, align 4, !tbaa !42
  %.pre22 = load float, float* %.phi.trans.insert21, align 4, !tbaa !42
  br label %89

; <label>:72                                      ; preds = %.lr.ph, %72
  %i.07 = phi i32 [ %27, %.lr.ph ], [ %85, %72 ]
  %73 = add nsw i32 %i.07, %2
  %74 = sext i32 %73 to i64
  %75 = mul nsw i64 %43, %74
  %76 = add i64 %58, %75
  %sext5 = shl i64 %76, 32
  %77 = ashr exact i64 %sext5, 32
  %78 = getelementptr inbounds float, float* %45, i64 %77
  %79 = bitcast float* %78 to i32*
  %.val.i6 = load i32, i32* %79, align 4, !tbaa !42
  %80 = add nsw i32 %i.07, %26
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %81
  %83 = bitcast float addrspace(3)* %82 to i32 addrspace(3)*
  %84 = addrspacecast i32 addrspace(3)* %83 to i32*
  store i32 %.val.i6, i32* %84, align 4, !tbaa !42
  %85 = add i32 %59, %i.07
  %86 = icmp slt i32 %85, %7
  br i1 %86, label %72, label %._crit_edge.loopexit, !llvm.loop !51

._crit_edge13.loopexit:                           ; preds = %89
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %._crit_edge
  tail call void @llvm.cuda.syncthreads()
  %87 = add nsw i32 %p.014, %12
  %88 = icmp slt i32 %87, %numPlanes
  br i1 %88, label %46, label %._crit_edge17.loopexit

; <label>:89                                      ; preds = %.lr.ph12, %89
  %i1.010 = phi i32 [ %27, %.lr.ph12 ], [ %124, %89 ]
  %90 = add nsw i32 %i1.010, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  %94 = load float, float* %93, align 4, !tbaa !42
  %95 = fmul float %94, %.pre
  %96 = fadd float %95, 0.000000e+00
  %97 = add nsw i32 %90, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %98
  %100 = addrspacecast float addrspace(3)* %99 to float*
  %101 = load float, float* %100, align 4, !tbaa !42
  %102 = fmul float %101, %.pre18
  %103 = fadd float %96, %102
  %104 = add nsw i32 %90, 2
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %105
  %107 = addrspacecast float addrspace(3)* %106 to float*
  %108 = load float, float* %107, align 4, !tbaa !42
  %109 = fmul float %108, %.pre20
  %110 = fadd float %103, %109
  %111 = add nsw i32 %90, 3
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %112
  %114 = addrspacecast float addrspace(3)* %113 to float*
  %115 = load float, float* %114, align 4, !tbaa !42
  %116 = fmul float %115, %.pre22
  %117 = fadd float %110, %116
  %118 = add nsw i32 %i1.010, %2
  %119 = sext i32 %118 to i64
  %120 = mul nsw i64 %41, %119
  %121 = add i64 %70, %120
  %sext3 = shl i64 %121, 32
  %122 = ashr exact i64 %sext3, 32
  %123 = getelementptr inbounds float, float* %buffer, i64 %122
  store float %117, float* %123, align 4, !tbaa !42
  %124 = add i32 %71, %i1.010
  %125 = icmp sgt i32 %124, %6
  br i1 %125, label %._crit_edge13.loopexit, label %89, !llvm.loop !53
}

; Function Attrs: noduplicate nounwind
declare void @llvm.cuda.syncthreads() #4

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ctaid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ntid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.nctaid.y() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.y() #2

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %kernelSize, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 7
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.ptx.read.nctaid.y() #5
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.ptx.read.tid.y() #5
  %14 = add i32 %13, %10
  %15 = icmp slt i32 %14, %numPlanes
  br i1 %15, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %0
  %16 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 2, i32 0, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %25 = load i64, i64* %24, align 8
  %26 = mul i32 %7, %13
  %27 = tail call i32 @llvm.ptx.read.tid.x() #5
  %28 = icmp slt i32 %27, %7
  %29 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 3, i32 0, i64 2
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %27, %6
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %45 = load float*, float** %44, align 8
  %.phi.trans.insert = getelementptr inbounds float, float* %kernel, i64 1
  %.phi.trans.insert19 = getelementptr inbounds float, float* %kernel, i64 2
  %.phi.trans.insert21 = getelementptr inbounds float, float* %kernel, i64 3
  %.phi.trans.insert23 = getelementptr inbounds float, float* %kernel, i64 4
  %.phi.trans.insert25 = getelementptr inbounds float, float* %kernel, i64 5
  %.phi.trans.insert27 = getelementptr inbounds float, float* %kernel, i64 6
  br label %46

._crit_edge17.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %0
  ret void

; <label>:46                                      ; preds = %.lr.ph16, %._crit_edge13
  %p.014 = phi i32 [ %14, %.lr.ph16 ], [ %87, %._crit_edge13 ]
  %47 = sext i32 %p.014 to i64
  %48 = sdiv i64 %47, %17
  %49 = mul nsw i64 %19, %48
  %50 = mul nsw i64 %48, %17
  %51 = sub nsw i64 %47, %50
  %52 = sdiv i64 %51, %21
  %53 = mul nsw i64 %23, %52
  %54 = add nsw i64 %53, %49
  %55 = mul nsw i64 %52, %21
  %56 = sub nsw i64 %51, %55
  %57 = mul nsw i64 %25, %56
  %58 = add nsw i64 %54, %57
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %46
  %59 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %72

._crit_edge.loopexit:                             ; preds = %72
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %46
  tail call void @llvm.cuda.syncthreads()
  %60 = sdiv i64 %47, %30
  %61 = mul nsw i64 %32, %60
  %62 = mul nsw i64 %60, %30
  %63 = sub nsw i64 %47, %62
  %64 = sdiv i64 %63, %34
  %65 = mul nsw i64 %36, %64
  %66 = add nsw i64 %65, %61
  %67 = mul nsw i64 %64, %34
  %68 = sub nsw i64 %63, %67
  %69 = mul nsw i64 %38, %68
  %70 = add nsw i64 %66, %69
  br i1 %39, label %._crit_edge13, label %.lr.ph12

.lr.ph12:                                         ; preds = %._crit_edge
  %71 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %.pre = load float, float* %kernel, align 4, !tbaa !42
  %.pre18 = load float, float* %.phi.trans.insert, align 4, !tbaa !42
  %.pre20 = load float, float* %.phi.trans.insert19, align 4, !tbaa !42
  %.pre22 = load float, float* %.phi.trans.insert21, align 4, !tbaa !42
  %.pre24 = load float, float* %.phi.trans.insert23, align 4, !tbaa !42
  %.pre26 = load float, float* %.phi.trans.insert25, align 4, !tbaa !42
  %.pre28 = load float, float* %.phi.trans.insert27, align 4, !tbaa !42
  br label %89

; <label>:72                                      ; preds = %.lr.ph, %72
  %i.07 = phi i32 [ %27, %.lr.ph ], [ %85, %72 ]
  %73 = add nsw i32 %i.07, %2
  %74 = sext i32 %73 to i64
  %75 = mul nsw i64 %43, %74
  %76 = add i64 %58, %75
  %sext5 = shl i64 %76, 32
  %77 = ashr exact i64 %sext5, 32
  %78 = getelementptr inbounds float, float* %45, i64 %77
  %79 = bitcast float* %78 to i32*
  %.val.i6 = load i32, i32* %79, align 4, !tbaa !42
  %80 = add nsw i32 %i.07, %26
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %81
  %83 = bitcast float addrspace(3)* %82 to i32 addrspace(3)*
  %84 = addrspacecast i32 addrspace(3)* %83 to i32*
  store i32 %.val.i6, i32* %84, align 4, !tbaa !42
  %85 = add i32 %59, %i.07
  %86 = icmp slt i32 %85, %7
  br i1 %86, label %72, label %._crit_edge.loopexit, !llvm.loop !54

._crit_edge13.loopexit:                           ; preds = %89
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %._crit_edge
  tail call void @llvm.cuda.syncthreads()
  %87 = add nsw i32 %p.014, %12
  %88 = icmp slt i32 %87, %numPlanes
  br i1 %88, label %46, label %._crit_edge17.loopexit

; <label>:89                                      ; preds = %.lr.ph12, %89
  %i1.010 = phi i32 [ %27, %.lr.ph12 ], [ %145, %89 ]
  %90 = add nsw i32 %i1.010, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  %94 = load float, float* %93, align 4, !tbaa !42
  %95 = fmul float %94, %.pre
  %96 = fadd float %95, 0.000000e+00
  %97 = add nsw i32 %90, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %98
  %100 = addrspacecast float addrspace(3)* %99 to float*
  %101 = load float, float* %100, align 4, !tbaa !42
  %102 = fmul float %101, %.pre18
  %103 = fadd float %96, %102
  %104 = add nsw i32 %90, 2
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %105
  %107 = addrspacecast float addrspace(3)* %106 to float*
  %108 = load float, float* %107, align 4, !tbaa !42
  %109 = fmul float %108, %.pre20
  %110 = fadd float %103, %109
  %111 = add nsw i32 %90, 3
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %112
  %114 = addrspacecast float addrspace(3)* %113 to float*
  %115 = load float, float* %114, align 4, !tbaa !42
  %116 = fmul float %115, %.pre22
  %117 = fadd float %110, %116
  %118 = add nsw i32 %90, 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %119
  %121 = addrspacecast float addrspace(3)* %120 to float*
  %122 = load float, float* %121, align 4, !tbaa !42
  %123 = fmul float %122, %.pre24
  %124 = fadd float %117, %123
  %125 = add nsw i32 %90, 5
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %126
  %128 = addrspacecast float addrspace(3)* %127 to float*
  %129 = load float, float* %128, align 4, !tbaa !42
  %130 = fmul float %129, %.pre26
  %131 = fadd float %124, %130
  %132 = add nsw i32 %90, 6
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %133
  %135 = addrspacecast float addrspace(3)* %134 to float*
  %136 = load float, float* %135, align 4, !tbaa !42
  %137 = fmul float %136, %.pre28
  %138 = fadd float %131, %137
  %139 = add nsw i32 %i1.010, %2
  %140 = sext i32 %139 to i64
  %141 = mul nsw i64 %41, %140
  %142 = add i64 %70, %141
  %sext3 = shl i64 %142, 32
  %143 = ashr exact i64 %sext3, 32
  %144 = getelementptr inbounds float, float* %buffer, i64 %143
  store float %138, float* %144, align 4, !tbaa !42
  %145 = add i32 %71, %i1.010
  %146 = icmp sgt i32 %145, %6
  br i1 %146, label %._crit_edge13.loopexit, label %89, !llvm.loop !55
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %kernelSize, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, %kernelSize
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.ptx.read.nctaid.y() #5
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.ptx.read.tid.y() #5
  %14 = add i32 %13, %10
  %15 = icmp slt i32 %14, %numPlanes
  br i1 %15, label %.lr.ph19, label %._crit_edge20

.lr.ph19:                                         ; preds = %0
  %16 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 2, i32 0, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %25 = load i64, i64* %24, align 8
  %26 = mul i32 %7, %13
  %27 = tail call i32 @llvm.ptx.read.tid.x() #5
  %28 = icmp slt i32 %27, %7
  %29 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 3, i32 0, i64 2
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %27, %6
  %40 = icmp sgt i32 %kernelSize, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper", %"class.Eigen::internal::IndexMapper"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %46 = load float*, float** %45, align 8
  %xtraiter = and i32 %kernelSize, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %47 = icmp eq i32 %kernelSize, 1
  br label %48

._crit_edge20.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %0
  ret void

; <label>:48                                      ; preds = %.lr.ph19, %._crit_edge16
  %p.017 = phi i32 [ %14, %.lr.ph19 ], [ %128, %._crit_edge16 ]
  %49 = sext i32 %p.017 to i64
  %50 = sdiv i64 %49, %17
  %51 = mul nsw i64 %19, %50
  %52 = mul nsw i64 %50, %17
  %53 = sub nsw i64 %49, %52
  %54 = sdiv i64 %53, %21
  %55 = mul nsw i64 %23, %54
  %56 = add nsw i64 %55, %51
  %57 = mul nsw i64 %54, %21
  %58 = sub nsw i64 %53, %57
  %59 = mul nsw i64 %25, %58
  %60 = add nsw i64 %56, %59
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %48
  %61 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %113

._crit_edge.loopexit:                             ; preds = %113
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %48
  tail call void @llvm.cuda.syncthreads()
  %62 = sdiv i64 %49, %30
  %63 = mul nsw i64 %32, %62
  %64 = mul nsw i64 %62, %30
  %65 = sub nsw i64 %49, %64
  %66 = sdiv i64 %65, %34
  %67 = mul nsw i64 %36, %66
  %68 = add nsw i64 %67, %63
  %69 = mul nsw i64 %66, %34
  %70 = sub nsw i64 %65, %69
  %71 = mul nsw i64 %38, %70
  %72 = add nsw i64 %68, %71
  br i1 %39, label %._crit_edge16, label %.lr.ph15

.lr.ph15:                                         ; preds = %._crit_edge
  %73 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br i1 %40, label %.lr.ph15.split.us.preheader, label %.lr.ph15.split.preheader

.lr.ph15.split.preheader:                         ; preds = %.lr.ph15
  br label %.lr.ph15.split

.lr.ph15.split.us.preheader:                      ; preds = %.lr.ph15
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %._crit_edge12.us
  %i1.013.us = phi i32 [ %111, %._crit_edge12.us ], [ %27, %.lr.ph15.split.us.preheader ]
  %74 = add nsw i32 %i1.013.us, %26
  br i1 %lcmp.mod, label %.lr.ph15.split.us.split, label %75

; <label>:75                                      ; preds = %.lr.ph15.split.us
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %76
  %78 = addrspacecast float addrspace(3)* %77 to float*
  %79 = load float, float* %78, align 4, !tbaa !42
  %80 = load float, float* %kernel, align 4, !tbaa !42
  %81 = fmul float %79, %80
  %82 = fadd float %81, 0.000000e+00
  br label %.lr.ph15.split.us.split

.lr.ph15.split.us.split:                          ; preds = %.lr.ph15.split.us, %75
  %k.09.us.unr = phi i32 [ 0, %.lr.ph15.split.us ], [ 1, %75 ]
  %result.08.us.unr = phi float [ 0.000000e+00, %.lr.ph15.split.us ], [ %82, %75 ]
  %.lcssa.unr = phi float [ undef, %.lr.ph15.split.us ], [ %82, %75 ]
  br i1 %47, label %._crit_edge12.us, label %.lr.ph15.split.us.split.split.preheader

.lr.ph15.split.us.split.split.preheader:          ; preds = %.lr.ph15.split.us.split
  br label %.lr.ph15.split.us.split.split

.lr.ph15.split.us.split.split:                    ; preds = %.lr.ph15.split.us.split.split.preheader, %.lr.ph15.split.us.split.split
  %k.09.us = phi i32 [ %104, %.lr.ph15.split.us.split.split ], [ %k.09.us.unr, %.lr.ph15.split.us.split.split.preheader ]
  %result.08.us = phi float [ %103, %.lr.ph15.split.us.split.split ], [ %result.08.us.unr, %.lr.ph15.split.us.split.split.preheader ]
  %83 = add nsw i32 %74, %k.09.us
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %84
  %86 = addrspacecast float addrspace(3)* %85 to float*
  %87 = load float, float* %86, align 4, !tbaa !42
  %88 = sext i32 %k.09.us to i64
  %89 = getelementptr inbounds float, float* %kernel, i64 %88
  %90 = load float, float* %89, align 4, !tbaa !42
  %91 = fmul float %87, %90
  %92 = fadd float %result.08.us, %91
  %93 = add nuw nsw i32 %k.09.us, 1
  %94 = add nsw i32 %74, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %95
  %97 = addrspacecast float addrspace(3)* %96 to float*
  %98 = load float, float* %97, align 4, !tbaa !42
  %99 = sext i32 %93 to i64
  %100 = getelementptr inbounds float, float* %kernel, i64 %99
  %101 = load float, float* %100, align 4, !tbaa !42
  %102 = fmul float %98, %101
  %103 = fadd float %92, %102
  %104 = add nsw i32 %k.09.us, 2
  %exitcond.1 = icmp eq i32 %104, %kernelSize
  br i1 %exitcond.1, label %._crit_edge12.us.loopexit, label %.lr.ph15.split.us.split.split, !llvm.loop !56

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph15.split.us.split.split
  %.lcssa28 = phi float [ %103, %.lr.ph15.split.us.split.split ]
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.lr.ph15.split.us.split
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph15.split.us.split ], [ %.lcssa28, %._crit_edge12.us.loopexit ]
  %105 = add nsw i32 %i1.013.us, %2
  %106 = sext i32 %105 to i64
  %107 = mul nsw i64 %42, %106
  %108 = add i64 %72, %107
  %sext3.us = shl i64 %108, 32
  %109 = ashr exact i64 %sext3.us, 32
  %110 = getelementptr inbounds float, float* %buffer, i64 %109
  store float %.lcssa, float* %110, align 4, !tbaa !42
  %111 = add i32 %73, %i1.013.us
  %112 = icmp sgt i32 %111, %6
  br i1 %112, label %._crit_edge16.loopexit, label %.lr.ph15.split.us, !llvm.loop !57

; <label>:113                                     ; preds = %.lr.ph, %113
  %i.07 = phi i32 [ %27, %.lr.ph ], [ %126, %113 ]
  %114 = add nsw i32 %i.07, %2
  %115 = sext i32 %114 to i64
  %116 = mul nsw i64 %44, %115
  %117 = add i64 %60, %116
  %sext5 = shl i64 %117, 32
  %118 = ashr exact i64 %sext5, 32
  %119 = getelementptr inbounds float, float* %46, i64 %118
  %120 = bitcast float* %119 to i32*
  %.val.i6 = load i32, i32* %120, align 4, !tbaa !42
  %121 = add nsw i32 %i.07, %26
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %122
  %124 = bitcast float addrspace(3)* %123 to i32 addrspace(3)*
  %125 = addrspacecast i32 addrspace(3)* %124 to i32*
  store i32 %.val.i6, i32* %125, align 4, !tbaa !42
  %126 = add i32 %61, %i.07
  %127 = icmp slt i32 %126, %7
  br i1 %127, label %113, label %._crit_edge.loopexit, !llvm.loop !58

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16.loopexit26:                         ; preds = %.lr.ph15.split
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit26, %._crit_edge16.loopexit, %._crit_edge
  tail call void @llvm.cuda.syncthreads()
  %128 = add nsw i32 %p.017, %12
  %129 = icmp slt i32 %128, %numPlanes
  br i1 %129, label %48, label %._crit_edge20.loopexit

.lr.ph15.split:                                   ; preds = %.lr.ph15.split.preheader, %.lr.ph15.split
  %i1.013 = phi i32 [ %136, %.lr.ph15.split ], [ %27, %.lr.ph15.split.preheader ]
  %130 = add nsw i32 %i1.013, %2
  %131 = sext i32 %130 to i64
  %132 = mul nsw i64 %42, %131
  %133 = add i64 %72, %132
  %sext3 = shl i64 %133, 32
  %134 = ashr exact i64 %sext3, 32
  %135 = getelementptr inbounds float, float* %buffer, i64 %134
  store float 0.000000e+00, float* %135, align 4, !tbaa !42
  %136 = add i32 %73, %i1.013
  %137 = icmp sgt i32 %136, %6
  br i1 %137, label %._crit_edge16.loopexit26, label %.lr.ph15.split, !llvm.loop !57
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.30"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 4
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, 7
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph29, label %._crit_edge30

.lr.ph29:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %49 = load float*, float** %48, align 8
  %50 = getelementptr inbounds float, float* %kernel, i64 1
  %51 = getelementptr inbounds float, float* %kernel, i64 2
  %52 = getelementptr inbounds float, float* %kernel, i64 3
  %53 = sext i32 %kernelSizeX to i64
  %54 = getelementptr inbounds float, float* %kernel, i64 %53
  %55 = add nsw i32 %kernelSizeX, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float* %kernel, i64 %56
  %58 = add nsw i32 %kernelSizeX, 2
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float* %kernel, i64 %59
  %61 = add nsw i32 %kernelSizeX, 3
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %kernel, i64 %62
  %64 = shl nsw i32 %kernelSizeX, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %kernel, i64 %65
  %67 = or i32 %64, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float* %kernel, i64 %68
  %70 = add nsw i32 %64, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float* %kernel, i64 %71
  %73 = add nsw i32 %64, 3
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float* %kernel, i64 %74
  %76 = mul nsw i32 %kernelSizeX, 3
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %kernel, i64 %77
  %79 = add nsw i32 %76, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float* %kernel, i64 %80
  %82 = add nsw i32 %76, 2
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %kernel, i64 %83
  %85 = add nsw i32 %76, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float* %kernel, i64 %86
  %88 = shl nsw i32 %kernelSizeX, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %kernel, i64 %89
  %91 = or i32 %88, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float* %kernel, i64 %92
  %94 = or i32 %88, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float* %kernel, i64 %95
  %97 = or i32 %88, 3
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %kernel, i64 %98
  %100 = mul nsw i32 %kernelSizeX, 5
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float* %kernel, i64 %101
  %103 = add nsw i32 %100, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float* %kernel, i64 %104
  %106 = add nsw i32 %100, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float* %kernel, i64 %107
  %109 = add nsw i32 %100, 3
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float* %kernel, i64 %110
  %112 = mul nsw i32 %kernelSizeX, 6
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float* %kernel, i64 %113
  %115 = or i32 %112, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float* %kernel, i64 %116
  %118 = add nsw i32 %112, 2
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float* %kernel, i64 %119
  %121 = add nsw i32 %112, 3
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float* %kernel, i64 %122
  br label %124

._crit_edge30.loopexit:                           ; preds = %._crit_edge26
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %0
  ret void

; <label>:124                                     ; preds = %.lr.ph29, %._crit_edge26
  %p.027 = phi i32 [ %22, %.lr.ph29 ], [ %201, %._crit_edge26 ]
  %125 = sext i32 %p.027 to i64
  %126 = sdiv i64 %125, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %124
  %127 = mul nsw i64 %126, %25
  %128 = sub nsw i64 %125, %127
  %129 = mul nsw i64 %29, %128
  %130 = mul nsw i64 %27, %126
  %131 = tail call i32 @llvm.ptx.read.tid.x() #5
  %132 = icmp slt i32 %131, %7
  %133 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %134 = add i64 %129, %130
  br i1 %132, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %135 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %157, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %136 = add nsw i32 %j.011.us, %30
  %137 = mul nsw i32 %136, %7
  %138 = add nsw i32 %j.011.us, %9
  %139 = sext i32 %138 to i64
  %140 = mul nsw i64 %47, %139
  br label %141

; <label>:141                                     ; preds = %.lr.ph14.split.us, %141
  %i.010.us = phi i32 [ %131, %.lr.ph14.split.us ], [ %155, %141 ]
  %142 = add nsw i32 %i.010.us, %2
  %143 = sext i32 %142 to i64
  %144 = mul nsw i64 %45, %143
  %145 = add i64 %134, %144
  %146 = add i64 %145, %140
  %sext7.us = shl i64 %146, 32
  %147 = ashr exact i64 %sext7.us, 32
  %148 = getelementptr inbounds float, float* %49, i64 %147
  %149 = bitcast float* %148 to i32*
  %.val.i8.us = load i32, i32* %149, align 4, !tbaa !42
  %150 = add nsw i32 %i.010.us, %137
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %151
  %153 = bitcast float addrspace(3)* %152 to i32 addrspace(3)*
  %154 = addrspacecast i32 addrspace(3)* %153 to i32*
  store i32 %.val.i8.us, i32* %154, align 4, !tbaa !42
  %155 = add i32 %135, %i.010.us
  %156 = icmp slt i32 %155, %7
  br i1 %156, label %141, label %._crit_edge.us, !llvm.loop !59

._crit_edge.us:                                   ; preds = %141
  %157 = add i32 %133, %j.011.us
  %158 = icmp slt i32 %157, %15
  br i1 %158, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !60

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit39:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit39, %._crit_edge15.loopexit, %124
  tail call void @llvm.cuda.syncthreads()
  %159 = sdiv i64 %125, %34
  br i1 %39, label %._crit_edge26, label %.lr.ph25

.lr.ph25:                                         ; preds = %._crit_edge15
  %160 = mul nsw i64 %159, %34
  %161 = sub nsw i64 %125, %160
  %162 = mul nsw i64 %38, %161
  %163 = mul nsw i64 %36, %159
  %164 = tail call i32 @llvm.ptx.read.tid.x() #5
  %165 = icmp sgt i32 %164, %6
  %166 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %167 = add i64 %162, %163
  br i1 %165, label %.lr.ph25.split.us.preheader, label %.preheader.lr.ph.preheader

.lr.ph25.split.us.preheader:                      ; preds = %.lr.ph25
  br label %.lr.ph25.split.us

.preheader.lr.ph.preheader:                       ; preds = %.lr.ph25
  %168 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %169 = load float, float* %kernel, align 4
  %170 = load float, float* %50, align 4
  %171 = load float, float* %51, align 4
  %172 = load float, float* %52, align 4
  %173 = load float, float* %54, align 4
  %174 = load float, float* %57, align 4
  %175 = load float, float* %60, align 4
  %176 = load float, float* %63, align 4
  %177 = load float, float* %66, align 4
  %178 = load float, float* %69, align 4
  %179 = load float, float* %72, align 4
  %180 = load float, float* %75, align 4
  %181 = load float, float* %78, align 4
  %182 = load float, float* %81, align 4
  %183 = load float, float* %84, align 4
  %184 = load float, float* %87, align 4
  %185 = load float, float* %90, align 4
  %186 = load float, float* %93, align 4
  %187 = load float, float* %96, align 4
  %188 = load float, float* %99, align 4
  %189 = load float, float* %102, align 4
  %190 = load float, float* %105, align 4
  %191 = load float, float* %108, align 4
  %192 = load float, float* %111, align 4
  %193 = load float, float* %114, align 4
  %194 = load float, float* %117, align 4
  %195 = load float, float* %120, align 4
  %196 = load float, float* %123, align 4
  br label %.preheader.lr.ph

.lr.ph25.split.us:                                ; preds = %.lr.ph25.split.us.preheader, %.lr.ph25.split.us
  %j1.022.us = phi i32 [ %197, %.lr.ph25.split.us ], [ %31, %.lr.ph25.split.us.preheader ]
  %197 = add i32 %166, %j1.022.us
  %198 = icmp sgt i32 %197, %14
  br i1 %198, label %._crit_edge26.loopexit, label %.lr.ph25.split.us, !llvm.loop !61

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %199, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %199 = add i32 %133, %j.011
  %200 = icmp slt i32 %199, %15
  br i1 %200, label %.lr.ph14.split, label %._crit_edge15.loopexit39, !llvm.loop !60

._crit_edge26.loopexit:                           ; preds = %.lr.ph25.split.us
  br label %._crit_edge26

._crit_edge26.loopexit38:                         ; preds = %._crit_edge21
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit38, %._crit_edge26.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %201 = add nsw i32 %p.027, %20
  %202 = icmp slt i32 %201, %numPlanes
  br i1 %202, label %124, label %._crit_edge30.loopexit

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge21
  %j1.022 = phi i32 [ %425, %._crit_edge21 ], [ %31, %.preheader.lr.ph.preheader ]
  %203 = add i32 %j1.022, %30
  %204 = add nsw i32 %j1.022, %9
  %205 = sext i32 %204 to i64
  %206 = mul nsw i64 %43, %205
  %207 = add i32 %203, 6
  %208 = mul nsw i32 %207, %7
  %209 = mul nsw i32 %203, %7
  %210 = add i32 %203, 1
  %211 = mul nsw i32 %210, %7
  %212 = add i32 %203, 2
  %213 = mul nsw i32 %212, %7
  %214 = add i32 %203, 3
  %215 = mul nsw i32 %214, %7
  %216 = add i32 %203, 4
  %217 = mul nsw i32 %216, %7
  %218 = add i32 %203, 5
  %219 = mul nsw i32 %218, %7
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %.preheader
  %i2.020 = phi i32 [ %164, %.preheader.lr.ph ], [ %423, %.preheader ]
  %220 = add nsw i32 %209, %i2.020
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %221
  %223 = addrspacecast float addrspace(3)* %222 to float*
  %224 = load float, float* %223, align 4, !tbaa !42
  %225 = fmul float %224, %169
  %226 = fadd float %225, 0.000000e+00
  %227 = add nsw i32 %220, 1
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %228
  %230 = addrspacecast float addrspace(3)* %229 to float*
  %231 = load float, float* %230, align 4, !tbaa !42
  %232 = fmul float %231, %170
  %233 = fadd float %226, %232
  %234 = add nsw i32 %220, 2
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %235
  %237 = addrspacecast float addrspace(3)* %236 to float*
  %238 = load float, float* %237, align 4, !tbaa !42
  %239 = fmul float %238, %171
  %240 = fadd float %233, %239
  %241 = add nsw i32 %220, 3
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %242
  %244 = addrspacecast float addrspace(3)* %243 to float*
  %245 = load float, float* %244, align 4, !tbaa !42
  %246 = fmul float %245, %172
  %247 = fadd float %240, %246
  %248 = add nsw i32 %211, %i2.020
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %249
  %251 = addrspacecast float addrspace(3)* %250 to float*
  %252 = load float, float* %251, align 4, !tbaa !42
  %253 = fmul float %252, %173
  %254 = fadd float %247, %253
  %255 = add nsw i32 %248, 1
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %256
  %258 = addrspacecast float addrspace(3)* %257 to float*
  %259 = load float, float* %258, align 4, !tbaa !42
  %260 = fmul float %259, %174
  %261 = fadd float %254, %260
  %262 = add nsw i32 %248, 2
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %263
  %265 = addrspacecast float addrspace(3)* %264 to float*
  %266 = load float, float* %265, align 4, !tbaa !42
  %267 = fmul float %266, %175
  %268 = fadd float %261, %267
  %269 = add nsw i32 %248, 3
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %270
  %272 = addrspacecast float addrspace(3)* %271 to float*
  %273 = load float, float* %272, align 4, !tbaa !42
  %274 = fmul float %273, %176
  %275 = fadd float %268, %274
  %276 = add nsw i32 %213, %i2.020
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %277
  %279 = addrspacecast float addrspace(3)* %278 to float*
  %280 = load float, float* %279, align 4, !tbaa !42
  %281 = fmul float %280, %177
  %282 = fadd float %275, %281
  %283 = add nsw i32 %276, 1
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %284
  %286 = addrspacecast float addrspace(3)* %285 to float*
  %287 = load float, float* %286, align 4, !tbaa !42
  %288 = fmul float %287, %178
  %289 = fadd float %282, %288
  %290 = add nsw i32 %276, 2
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %291
  %293 = addrspacecast float addrspace(3)* %292 to float*
  %294 = load float, float* %293, align 4, !tbaa !42
  %295 = fmul float %294, %179
  %296 = fadd float %289, %295
  %297 = add nsw i32 %276, 3
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %298
  %300 = addrspacecast float addrspace(3)* %299 to float*
  %301 = load float, float* %300, align 4, !tbaa !42
  %302 = fmul float %301, %180
  %303 = fadd float %296, %302
  %304 = add nsw i32 %215, %i2.020
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %305
  %307 = addrspacecast float addrspace(3)* %306 to float*
  %308 = load float, float* %307, align 4, !tbaa !42
  %309 = fmul float %308, %181
  %310 = fadd float %303, %309
  %311 = add nsw i32 %304, 1
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %312
  %314 = addrspacecast float addrspace(3)* %313 to float*
  %315 = load float, float* %314, align 4, !tbaa !42
  %316 = fmul float %315, %182
  %317 = fadd float %310, %316
  %318 = add nsw i32 %304, 2
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %319
  %321 = addrspacecast float addrspace(3)* %320 to float*
  %322 = load float, float* %321, align 4, !tbaa !42
  %323 = fmul float %322, %183
  %324 = fadd float %317, %323
  %325 = add nsw i32 %304, 3
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %326
  %328 = addrspacecast float addrspace(3)* %327 to float*
  %329 = load float, float* %328, align 4, !tbaa !42
  %330 = fmul float %329, %184
  %331 = fadd float %324, %330
  %332 = add nsw i32 %217, %i2.020
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %333
  %335 = addrspacecast float addrspace(3)* %334 to float*
  %336 = load float, float* %335, align 4, !tbaa !42
  %337 = fmul float %336, %185
  %338 = fadd float %331, %337
  %339 = add nsw i32 %332, 1
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %340
  %342 = addrspacecast float addrspace(3)* %341 to float*
  %343 = load float, float* %342, align 4, !tbaa !42
  %344 = fmul float %343, %186
  %345 = fadd float %338, %344
  %346 = add nsw i32 %332, 2
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %347
  %349 = addrspacecast float addrspace(3)* %348 to float*
  %350 = load float, float* %349, align 4, !tbaa !42
  %351 = fmul float %350, %187
  %352 = fadd float %345, %351
  %353 = add nsw i32 %332, 3
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %354
  %356 = addrspacecast float addrspace(3)* %355 to float*
  %357 = load float, float* %356, align 4, !tbaa !42
  %358 = fmul float %357, %188
  %359 = fadd float %352, %358
  %360 = add nsw i32 %219, %i2.020
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %361
  %363 = addrspacecast float addrspace(3)* %362 to float*
  %364 = load float, float* %363, align 4, !tbaa !42
  %365 = fmul float %364, %189
  %366 = fadd float %359, %365
  %367 = add nsw i32 %360, 1
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %368
  %370 = addrspacecast float addrspace(3)* %369 to float*
  %371 = load float, float* %370, align 4, !tbaa !42
  %372 = fmul float %371, %190
  %373 = fadd float %366, %372
  %374 = add nsw i32 %360, 2
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %375
  %377 = addrspacecast float addrspace(3)* %376 to float*
  %378 = load float, float* %377, align 4, !tbaa !42
  %379 = fmul float %378, %191
  %380 = fadd float %373, %379
  %381 = add nsw i32 %360, 3
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %382
  %384 = addrspacecast float addrspace(3)* %383 to float*
  %385 = load float, float* %384, align 4, !tbaa !42
  %386 = fmul float %385, %192
  %387 = fadd float %380, %386
  %388 = add nsw i32 %208, %i2.020
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %389
  %391 = addrspacecast float addrspace(3)* %390 to float*
  %392 = load float, float* %391, align 4, !tbaa !42
  %393 = fmul float %392, %193
  %394 = fadd float %387, %393
  %395 = add nsw i32 %388, 1
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %396
  %398 = addrspacecast float addrspace(3)* %397 to float*
  %399 = load float, float* %398, align 4, !tbaa !42
  %400 = fmul float %399, %194
  %401 = fadd float %394, %400
  %402 = add nsw i32 %388, 2
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %403
  %405 = addrspacecast float addrspace(3)* %404 to float*
  %406 = load float, float* %405, align 4, !tbaa !42
  %407 = fmul float %406, %195
  %408 = fadd float %401, %407
  %409 = add nsw i32 %388, 3
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %410
  %412 = addrspacecast float addrspace(3)* %411 to float*
  %413 = load float, float* %412, align 4, !tbaa !42
  %414 = fmul float %413, %196
  %415 = fadd float %408, %414
  %416 = add nsw i32 %i2.020, %2
  %417 = sext i32 %416 to i64
  %418 = mul nsw i64 %41, %417
  %419 = add i64 %167, %418
  %420 = add i64 %419, %206
  %sext5 = shl i64 %420, 32
  %421 = ashr exact i64 %sext5, 32
  %422 = getelementptr inbounds float, float* %buffer, i64 %421
  store float %415, float* %422, align 4, !tbaa !42
  %423 = add i32 %168, %i2.020
  %424 = icmp sgt i32 %423, %6
  br i1 %424, label %._crit_edge21, label %.preheader, !llvm.loop !62

._crit_edge21:                                    ; preds = %.preheader
  %425 = add i32 %166, %j1.022
  %426 = icmp sgt i32 %425, %14
  br i1 %426, label %._crit_edge26.loopexit38, label %.preheader.lr.ph, !llvm.loop !61
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ctaid.z() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ntid.z() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.nctaid.z() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.z() #2

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.30"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 4
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, %kernelSizeY
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = icmp sgt i32 %kernelSizeY, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %50 = load float*, float** %49, align 8
  br label %51

._crit_edge33.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %0
  ret void

; <label>:51                                      ; preds = %.lr.ph32, %._crit_edge29
  %p.030 = phi i32 [ %22, %.lr.ph32 ], [ %97, %._crit_edge29 ]
  %52 = sext i32 %p.030 to i64
  %53 = sdiv i64 %52, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %51
  %54 = mul nsw i64 %53, %25
  %55 = sub nsw i64 %52, %54
  %56 = mul nsw i64 %29, %55
  %57 = mul nsw i64 %27, %53
  %58 = tail call i32 @llvm.ptx.read.tid.x() #5
  %59 = icmp slt i32 %58, %7
  %60 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %61 = add i64 %56, %57
  br i1 %59, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %62 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %84, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %63 = add nsw i32 %j.011.us, %30
  %64 = mul nsw i32 %63, %7
  %65 = add nsw i32 %j.011.us, %9
  %66 = sext i32 %65 to i64
  %67 = mul nsw i64 %48, %66
  br label %68

; <label>:68                                      ; preds = %.lr.ph14.split.us, %68
  %i.010.us = phi i32 [ %58, %.lr.ph14.split.us ], [ %82, %68 ]
  %69 = add nsw i32 %i.010.us, %2
  %70 = sext i32 %69 to i64
  %71 = mul nsw i64 %46, %70
  %72 = add i64 %61, %71
  %73 = add i64 %72, %67
  %sext7.us = shl i64 %73, 32
  %74 = ashr exact i64 %sext7.us, 32
  %75 = getelementptr inbounds float, float* %50, i64 %74
  %76 = bitcast float* %75 to i32*
  %.val.i8.us = load i32, i32* %76, align 4, !tbaa !42
  %77 = add nsw i32 %i.010.us, %64
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %78
  %80 = bitcast float addrspace(3)* %79 to i32 addrspace(3)*
  %81 = addrspacecast i32 addrspace(3)* %80 to i32*
  store i32 %.val.i8.us, i32* %81, align 4, !tbaa !42
  %82 = add i32 %62, %i.010.us
  %83 = icmp slt i32 %82, %7
  br i1 %83, label %68, label %._crit_edge.us, !llvm.loop !63

._crit_edge.us:                                   ; preds = %68
  %84 = add i32 %60, %j.011.us
  %85 = icmp slt i32 %84, %15
  br i1 %85, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !64

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit42:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit42, %._crit_edge15.loopexit, %51
  tail call void @llvm.cuda.syncthreads()
  %86 = sdiv i64 %52, %34
  br i1 %39, label %._crit_edge29, label %.lr.ph28

.lr.ph28:                                         ; preds = %._crit_edge15
  %87 = mul nsw i64 %86, %34
  %88 = sub nsw i64 %52, %87
  %89 = mul nsw i64 %38, %88
  %90 = mul nsw i64 %36, %86
  %91 = tail call i32 @llvm.ptx.read.tid.x() #5
  %92 = icmp sgt i32 %91, %6
  %93 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %94 = add i64 %89, %90
  br label %99

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %95, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %95 = add i32 %60, %j.011
  %96 = icmp slt i32 %95, %15
  br i1 %96, label %.lr.ph14.split, label %._crit_edge15.loopexit42, !llvm.loop !64

._crit_edge29.loopexit:                           ; preds = %._crit_edge24
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %97 = add nsw i32 %p.030, %20
  %98 = icmp slt i32 %97, %numPlanes
  br i1 %98, label %51, label %._crit_edge33.loopexit

; <label>:99                                      ; preds = %.lr.ph28, %._crit_edge24
  %j1.025 = phi i32 [ %31, %.lr.ph28 ], [ %162, %._crit_edge24 ]
  br i1 %92, label %._crit_edge24, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %99
  %100 = add nsw i32 %j1.025, %9
  %101 = sext i32 %100 to i64
  %102 = mul nsw i64 %44, %101
  %103 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %104 = add i32 %j1.025, %30
  br i1 %40, label %.lr.ph20.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.lr.ph20.us.preheader:                            ; preds = %.preheader.lr.ph
  br label %.lr.ph20.us

; <label>:105                                     ; preds = %105, %.lr.ph20.us
  %l.019.us = phi i32 [ 0, %.lr.ph20.us ], [ %152, %105 ]
  %result.018.us = phi float [ 0.000000e+00, %.lr.ph20.us ], [ %151, %105 ]
  %106 = mul nsw i32 %l.019.us, %kernelSizeX
  %107 = add i32 %104, %l.019.us
  %108 = mul nsw i32 %107, %7
  %109 = add nsw i32 %108, %i2.022.us
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %110
  %112 = addrspacecast float addrspace(3)* %111 to float*
  %113 = load float, float* %112, align 4, !tbaa !42
  %114 = sext i32 %106 to i64
  %115 = getelementptr inbounds float, float* %kernel, i64 %114
  %116 = load float, float* %115, align 4, !tbaa !42
  %117 = fmul float %113, %116
  %118 = fadd float %result.018.us, %117
  %119 = add nsw i32 %109, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %120
  %122 = addrspacecast float addrspace(3)* %121 to float*
  %123 = load float, float* %122, align 4, !tbaa !42
  %124 = add nsw i32 %106, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float* %kernel, i64 %125
  %127 = load float, float* %126, align 4, !tbaa !42
  %128 = fmul float %123, %127
  %129 = fadd float %118, %128
  %130 = add nsw i32 %109, 2
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %131
  %133 = addrspacecast float addrspace(3)* %132 to float*
  %134 = load float, float* %133, align 4, !tbaa !42
  %135 = add nsw i32 %106, 2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float* %kernel, i64 %136
  %138 = load float, float* %137, align 4, !tbaa !42
  %139 = fmul float %134, %138
  %140 = fadd float %129, %139
  %141 = add nsw i32 %109, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %142
  %144 = addrspacecast float addrspace(3)* %143 to float*
  %145 = load float, float* %144, align 4, !tbaa !42
  %146 = add nsw i32 %106, 3
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float* %kernel, i64 %147
  %149 = load float, float* %148, align 4, !tbaa !42
  %150 = fmul float %145, %149
  %151 = fadd float %140, %150
  %152 = add nuw nsw i32 %l.019.us, 1
  %exitcond36 = icmp eq i32 %152, %kernelSizeY
  br i1 %exitcond36, label %._crit_edge21.us, label %105, !llvm.loop !65

.lr.ph20.us:                                      ; preds = %.lr.ph20.us.preheader, %._crit_edge21.us
  %i2.022.us = phi i32 [ %160, %._crit_edge21.us ], [ %91, %.lr.ph20.us.preheader ]
  br label %105

._crit_edge21.us:                                 ; preds = %105
  %.lcssa = phi float [ %151, %105 ]
  %153 = add nsw i32 %i2.022.us, %2
  %154 = sext i32 %153 to i64
  %155 = mul nsw i64 %42, %154
  %156 = add i64 %94, %155
  %157 = add i64 %156, %102
  %sext5.us = shl i64 %157, 32
  %158 = ashr exact i64 %sext5.us, 32
  %159 = getelementptr inbounds float, float* %buffer, i64 %158
  store float %.lcssa, float* %159, align 4, !tbaa !42
  %160 = add i32 %103, %i2.022.us
  %161 = icmp sgt i32 %160, %6
  br i1 %161, label %._crit_edge24.loopexit, label %.lr.ph20.us, !llvm.loop !66

._crit_edge24.loopexit:                           ; preds = %._crit_edge21.us
  br label %._crit_edge24

._crit_edge24.loopexit41:                         ; preds = %.preheader
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit41, %._crit_edge24.loopexit, %99
  %162 = add i32 %93, %j1.025
  %163 = icmp sgt i32 %162, %14
  br i1 %163, label %._crit_edge29.loopexit, label %99, !llvm.loop !67

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %i2.022 = phi i32 [ %171, %.preheader ], [ %91, %.preheader.preheader ]
  %164 = add nsw i32 %i2.022, %2
  %165 = sext i32 %164 to i64
  %166 = mul nsw i64 %42, %165
  %167 = add i64 %94, %166
  %168 = add i64 %167, %102
  %sext5 = shl i64 %168, 32
  %169 = ashr exact i64 %sext5, 32
  %170 = getelementptr inbounds float, float* %buffer, i64 %169
  store float 0.000000e+00, float* %170, align 4, !tbaa !42
  %171 = add i32 %103, %i2.022
  %172 = icmp sgt i32 %171, %6
  br i1 %172, label %._crit_edge24.loopexit41, label %.preheader, !llvm.loop !66
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.30"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 7
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, 4
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph29, label %._crit_edge30

.lr.ph29:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %49 = load float*, float** %48, align 8
  %50 = getelementptr inbounds float, float* %kernel, i64 1
  %51 = getelementptr inbounds float, float* %kernel, i64 2
  %52 = getelementptr inbounds float, float* %kernel, i64 3
  %53 = getelementptr inbounds float, float* %kernel, i64 4
  %54 = getelementptr inbounds float, float* %kernel, i64 5
  %55 = getelementptr inbounds float, float* %kernel, i64 6
  %56 = sext i32 %kernelSizeX to i64
  %57 = getelementptr inbounds float, float* %kernel, i64 %56
  %58 = add nsw i32 %kernelSizeX, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float* %kernel, i64 %59
  %61 = add nsw i32 %kernelSizeX, 2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %kernel, i64 %62
  %64 = add nsw i32 %kernelSizeX, 3
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %kernel, i64 %65
  %67 = add nsw i32 %kernelSizeX, 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float* %kernel, i64 %68
  %70 = add nsw i32 %kernelSizeX, 5
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float* %kernel, i64 %71
  %73 = add nsw i32 %kernelSizeX, 6
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float* %kernel, i64 %74
  %76 = shl nsw i32 %kernelSizeX, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %kernel, i64 %77
  %79 = or i32 %76, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float* %kernel, i64 %80
  %82 = add nsw i32 %76, 2
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %kernel, i64 %83
  %85 = add nsw i32 %76, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float* %kernel, i64 %86
  %88 = add nsw i32 %76, 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %kernel, i64 %89
  %91 = add nsw i32 %76, 5
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float* %kernel, i64 %92
  %94 = add nsw i32 %76, 6
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float* %kernel, i64 %95
  %97 = mul nsw i32 %kernelSizeX, 3
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %kernel, i64 %98
  %100 = add nsw i32 %97, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float* %kernel, i64 %101
  %103 = add nsw i32 %97, 2
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float* %kernel, i64 %104
  %106 = add nsw i32 %97, 3
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float* %kernel, i64 %107
  %109 = add nsw i32 %97, 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float* %kernel, i64 %110
  %112 = add nsw i32 %97, 5
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float* %kernel, i64 %113
  %115 = add nsw i32 %97, 6
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float* %kernel, i64 %116
  br label %118

._crit_edge30.loopexit:                           ; preds = %._crit_edge26
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %0
  ret void

; <label>:118                                     ; preds = %.lr.ph29, %._crit_edge26
  %p.027 = phi i32 [ %22, %.lr.ph29 ], [ %195, %._crit_edge26 ]
  %119 = sext i32 %p.027 to i64
  %120 = sdiv i64 %119, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %118
  %121 = mul nsw i64 %120, %25
  %122 = sub nsw i64 %119, %121
  %123 = mul nsw i64 %29, %122
  %124 = mul nsw i64 %27, %120
  %125 = tail call i32 @llvm.ptx.read.tid.x() #5
  %126 = icmp slt i32 %125, %7
  %127 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %128 = add i64 %123, %124
  br i1 %126, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %129 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %151, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %130 = add nsw i32 %j.011.us, %30
  %131 = mul nsw i32 %130, %7
  %132 = add nsw i32 %j.011.us, %9
  %133 = sext i32 %132 to i64
  %134 = mul nsw i64 %47, %133
  br label %135

; <label>:135                                     ; preds = %.lr.ph14.split.us, %135
  %i.010.us = phi i32 [ %125, %.lr.ph14.split.us ], [ %149, %135 ]
  %136 = add nsw i32 %i.010.us, %2
  %137 = sext i32 %136 to i64
  %138 = mul nsw i64 %45, %137
  %139 = add i64 %128, %138
  %140 = add i64 %139, %134
  %sext7.us = shl i64 %140, 32
  %141 = ashr exact i64 %sext7.us, 32
  %142 = getelementptr inbounds float, float* %49, i64 %141
  %143 = bitcast float* %142 to i32*
  %.val.i8.us = load i32, i32* %143, align 4, !tbaa !42
  %144 = add nsw i32 %i.010.us, %131
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %145
  %147 = bitcast float addrspace(3)* %146 to i32 addrspace(3)*
  %148 = addrspacecast i32 addrspace(3)* %147 to i32*
  store i32 %.val.i8.us, i32* %148, align 4, !tbaa !42
  %149 = add i32 %129, %i.010.us
  %150 = icmp slt i32 %149, %7
  br i1 %150, label %135, label %._crit_edge.us, !llvm.loop !68

._crit_edge.us:                                   ; preds = %135
  %151 = add i32 %127, %j.011.us
  %152 = icmp slt i32 %151, %15
  br i1 %152, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !69

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit39:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit39, %._crit_edge15.loopexit, %118
  tail call void @llvm.cuda.syncthreads()
  %153 = sdiv i64 %119, %34
  br i1 %39, label %._crit_edge26, label %.lr.ph25

.lr.ph25:                                         ; preds = %._crit_edge15
  %154 = mul nsw i64 %153, %34
  %155 = sub nsw i64 %119, %154
  %156 = mul nsw i64 %38, %155
  %157 = mul nsw i64 %36, %153
  %158 = tail call i32 @llvm.ptx.read.tid.x() #5
  %159 = icmp sgt i32 %158, %6
  %160 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %161 = add i64 %156, %157
  br i1 %159, label %.lr.ph25.split.us.preheader, label %.preheader.lr.ph.preheader

.lr.ph25.split.us.preheader:                      ; preds = %.lr.ph25
  br label %.lr.ph25.split.us

.preheader.lr.ph.preheader:                       ; preds = %.lr.ph25
  %162 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %163 = load float, float* %kernel, align 4
  %164 = load float, float* %50, align 4
  %165 = load float, float* %51, align 4
  %166 = load float, float* %52, align 4
  %167 = load float, float* %53, align 4
  %168 = load float, float* %54, align 4
  %169 = load float, float* %55, align 4
  %170 = load float, float* %57, align 4
  %171 = load float, float* %60, align 4
  %172 = load float, float* %63, align 4
  %173 = load float, float* %66, align 4
  %174 = load float, float* %69, align 4
  %175 = load float, float* %72, align 4
  %176 = load float, float* %75, align 4
  %177 = load float, float* %78, align 4
  %178 = load float, float* %81, align 4
  %179 = load float, float* %84, align 4
  %180 = load float, float* %87, align 4
  %181 = load float, float* %90, align 4
  %182 = load float, float* %93, align 4
  %183 = load float, float* %96, align 4
  %184 = load float, float* %99, align 4
  %185 = load float, float* %102, align 4
  %186 = load float, float* %105, align 4
  %187 = load float, float* %108, align 4
  %188 = load float, float* %111, align 4
  %189 = load float, float* %114, align 4
  %190 = load float, float* %117, align 4
  br label %.preheader.lr.ph

.lr.ph25.split.us:                                ; preds = %.lr.ph25.split.us.preheader, %.lr.ph25.split.us
  %j1.022.us = phi i32 [ %191, %.lr.ph25.split.us ], [ %31, %.lr.ph25.split.us.preheader ]
  %191 = add i32 %160, %j1.022.us
  %192 = icmp sgt i32 %191, %14
  br i1 %192, label %._crit_edge26.loopexit, label %.lr.ph25.split.us, !llvm.loop !70

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %193, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %193 = add i32 %127, %j.011
  %194 = icmp slt i32 %193, %15
  br i1 %194, label %.lr.ph14.split, label %._crit_edge15.loopexit39, !llvm.loop !69

._crit_edge26.loopexit:                           ; preds = %.lr.ph25.split.us
  br label %._crit_edge26

._crit_edge26.loopexit38:                         ; preds = %._crit_edge21
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit38, %._crit_edge26.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %195 = add nsw i32 %p.027, %20
  %196 = icmp slt i32 %195, %numPlanes
  br i1 %196, label %118, label %._crit_edge30.loopexit

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge21
  %j1.022 = phi i32 [ %413, %._crit_edge21 ], [ %31, %.preheader.lr.ph.preheader ]
  %197 = add i32 %j1.022, %30
  %198 = add nsw i32 %j1.022, %9
  %199 = sext i32 %198 to i64
  %200 = mul nsw i64 %43, %199
  %201 = add i32 %197, 3
  %202 = mul nsw i32 %201, %7
  %203 = mul nsw i32 %197, %7
  %204 = add i32 %197, 1
  %205 = mul nsw i32 %204, %7
  %206 = add i32 %197, 2
  %207 = mul nsw i32 %206, %7
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %.preheader
  %i2.020 = phi i32 [ %158, %.preheader.lr.ph ], [ %411, %.preheader ]
  %208 = add nsw i32 %203, %i2.020
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %209
  %211 = addrspacecast float addrspace(3)* %210 to float*
  %212 = load float, float* %211, align 4, !tbaa !42
  %213 = fmul float %212, %163
  %214 = fadd float %213, 0.000000e+00
  %215 = add nsw i32 %208, 1
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %216
  %218 = addrspacecast float addrspace(3)* %217 to float*
  %219 = load float, float* %218, align 4, !tbaa !42
  %220 = fmul float %219, %164
  %221 = fadd float %214, %220
  %222 = add nsw i32 %208, 2
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %223
  %225 = addrspacecast float addrspace(3)* %224 to float*
  %226 = load float, float* %225, align 4, !tbaa !42
  %227 = fmul float %226, %165
  %228 = fadd float %221, %227
  %229 = add nsw i32 %208, 3
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %230
  %232 = addrspacecast float addrspace(3)* %231 to float*
  %233 = load float, float* %232, align 4, !tbaa !42
  %234 = fmul float %233, %166
  %235 = fadd float %228, %234
  %236 = add nsw i32 %208, 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %237
  %239 = addrspacecast float addrspace(3)* %238 to float*
  %240 = load float, float* %239, align 4, !tbaa !42
  %241 = fmul float %240, %167
  %242 = fadd float %235, %241
  %243 = add nsw i32 %208, 5
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %244
  %246 = addrspacecast float addrspace(3)* %245 to float*
  %247 = load float, float* %246, align 4, !tbaa !42
  %248 = fmul float %247, %168
  %249 = fadd float %242, %248
  %250 = add nsw i32 %208, 6
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %251
  %253 = addrspacecast float addrspace(3)* %252 to float*
  %254 = load float, float* %253, align 4, !tbaa !42
  %255 = fmul float %254, %169
  %256 = fadd float %249, %255
  %257 = add nsw i32 %205, %i2.020
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %258
  %260 = addrspacecast float addrspace(3)* %259 to float*
  %261 = load float, float* %260, align 4, !tbaa !42
  %262 = fmul float %261, %170
  %263 = fadd float %256, %262
  %264 = add nsw i32 %257, 1
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %265
  %267 = addrspacecast float addrspace(3)* %266 to float*
  %268 = load float, float* %267, align 4, !tbaa !42
  %269 = fmul float %268, %171
  %270 = fadd float %263, %269
  %271 = add nsw i32 %257, 2
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %272
  %274 = addrspacecast float addrspace(3)* %273 to float*
  %275 = load float, float* %274, align 4, !tbaa !42
  %276 = fmul float %275, %172
  %277 = fadd float %270, %276
  %278 = add nsw i32 %257, 3
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %279
  %281 = addrspacecast float addrspace(3)* %280 to float*
  %282 = load float, float* %281, align 4, !tbaa !42
  %283 = fmul float %282, %173
  %284 = fadd float %277, %283
  %285 = add nsw i32 %257, 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %286
  %288 = addrspacecast float addrspace(3)* %287 to float*
  %289 = load float, float* %288, align 4, !tbaa !42
  %290 = fmul float %289, %174
  %291 = fadd float %284, %290
  %292 = add nsw i32 %257, 5
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %293
  %295 = addrspacecast float addrspace(3)* %294 to float*
  %296 = load float, float* %295, align 4, !tbaa !42
  %297 = fmul float %296, %175
  %298 = fadd float %291, %297
  %299 = add nsw i32 %257, 6
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %300
  %302 = addrspacecast float addrspace(3)* %301 to float*
  %303 = load float, float* %302, align 4, !tbaa !42
  %304 = fmul float %303, %176
  %305 = fadd float %298, %304
  %306 = add nsw i32 %207, %i2.020
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %307
  %309 = addrspacecast float addrspace(3)* %308 to float*
  %310 = load float, float* %309, align 4, !tbaa !42
  %311 = fmul float %310, %177
  %312 = fadd float %305, %311
  %313 = add nsw i32 %306, 1
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %314
  %316 = addrspacecast float addrspace(3)* %315 to float*
  %317 = load float, float* %316, align 4, !tbaa !42
  %318 = fmul float %317, %178
  %319 = fadd float %312, %318
  %320 = add nsw i32 %306, 2
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %321
  %323 = addrspacecast float addrspace(3)* %322 to float*
  %324 = load float, float* %323, align 4, !tbaa !42
  %325 = fmul float %324, %179
  %326 = fadd float %319, %325
  %327 = add nsw i32 %306, 3
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %328
  %330 = addrspacecast float addrspace(3)* %329 to float*
  %331 = load float, float* %330, align 4, !tbaa !42
  %332 = fmul float %331, %180
  %333 = fadd float %326, %332
  %334 = add nsw i32 %306, 4
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %335
  %337 = addrspacecast float addrspace(3)* %336 to float*
  %338 = load float, float* %337, align 4, !tbaa !42
  %339 = fmul float %338, %181
  %340 = fadd float %333, %339
  %341 = add nsw i32 %306, 5
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %342
  %344 = addrspacecast float addrspace(3)* %343 to float*
  %345 = load float, float* %344, align 4, !tbaa !42
  %346 = fmul float %345, %182
  %347 = fadd float %340, %346
  %348 = add nsw i32 %306, 6
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %349
  %351 = addrspacecast float addrspace(3)* %350 to float*
  %352 = load float, float* %351, align 4, !tbaa !42
  %353 = fmul float %352, %183
  %354 = fadd float %347, %353
  %355 = add nsw i32 %202, %i2.020
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %356
  %358 = addrspacecast float addrspace(3)* %357 to float*
  %359 = load float, float* %358, align 4, !tbaa !42
  %360 = fmul float %359, %184
  %361 = fadd float %354, %360
  %362 = add nsw i32 %355, 1
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %363
  %365 = addrspacecast float addrspace(3)* %364 to float*
  %366 = load float, float* %365, align 4, !tbaa !42
  %367 = fmul float %366, %185
  %368 = fadd float %361, %367
  %369 = add nsw i32 %355, 2
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %370
  %372 = addrspacecast float addrspace(3)* %371 to float*
  %373 = load float, float* %372, align 4, !tbaa !42
  %374 = fmul float %373, %186
  %375 = fadd float %368, %374
  %376 = add nsw i32 %355, 3
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %377
  %379 = addrspacecast float addrspace(3)* %378 to float*
  %380 = load float, float* %379, align 4, !tbaa !42
  %381 = fmul float %380, %187
  %382 = fadd float %375, %381
  %383 = add nsw i32 %355, 4
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %384
  %386 = addrspacecast float addrspace(3)* %385 to float*
  %387 = load float, float* %386, align 4, !tbaa !42
  %388 = fmul float %387, %188
  %389 = fadd float %382, %388
  %390 = add nsw i32 %355, 5
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %391
  %393 = addrspacecast float addrspace(3)* %392 to float*
  %394 = load float, float* %393, align 4, !tbaa !42
  %395 = fmul float %394, %189
  %396 = fadd float %389, %395
  %397 = add nsw i32 %355, 6
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %398
  %400 = addrspacecast float addrspace(3)* %399 to float*
  %401 = load float, float* %400, align 4, !tbaa !42
  %402 = fmul float %401, %190
  %403 = fadd float %396, %402
  %404 = add nsw i32 %i2.020, %2
  %405 = sext i32 %404 to i64
  %406 = mul nsw i64 %41, %405
  %407 = add i64 %161, %406
  %408 = add i64 %407, %200
  %sext5 = shl i64 %408, 32
  %409 = ashr exact i64 %sext5, 32
  %410 = getelementptr inbounds float, float* %buffer, i64 %409
  store float %403, float* %410, align 4, !tbaa !42
  %411 = add i32 %162, %i2.020
  %412 = icmp sgt i32 %411, %6
  br i1 %412, label %._crit_edge21, label %.preheader, !llvm.loop !71

._crit_edge21:                                    ; preds = %.preheader
  %413 = add i32 %160, %j1.022
  %414 = icmp sgt i32 %413, %14
  br i1 %414, label %._crit_edge26.loopexit38, label %.preheader.lr.ph, !llvm.loop !70
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.30"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 7
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, %kernelSizeY
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = icmp sgt i32 %kernelSizeY, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %50 = load float*, float** %49, align 8
  br label %51

._crit_edge33.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %0
  ret void

; <label>:51                                      ; preds = %.lr.ph32, %._crit_edge29
  %p.030 = phi i32 [ %22, %.lr.ph32 ], [ %97, %._crit_edge29 ]
  %52 = sext i32 %p.030 to i64
  %53 = sdiv i64 %52, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %51
  %54 = mul nsw i64 %53, %25
  %55 = sub nsw i64 %52, %54
  %56 = mul nsw i64 %29, %55
  %57 = mul nsw i64 %27, %53
  %58 = tail call i32 @llvm.ptx.read.tid.x() #5
  %59 = icmp slt i32 %58, %7
  %60 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %61 = add i64 %56, %57
  br i1 %59, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %62 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %84, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %63 = add nsw i32 %j.011.us, %30
  %64 = mul nsw i32 %63, %7
  %65 = add nsw i32 %j.011.us, %9
  %66 = sext i32 %65 to i64
  %67 = mul nsw i64 %48, %66
  br label %68

; <label>:68                                      ; preds = %.lr.ph14.split.us, %68
  %i.010.us = phi i32 [ %58, %.lr.ph14.split.us ], [ %82, %68 ]
  %69 = add nsw i32 %i.010.us, %2
  %70 = sext i32 %69 to i64
  %71 = mul nsw i64 %46, %70
  %72 = add i64 %61, %71
  %73 = add i64 %72, %67
  %sext7.us = shl i64 %73, 32
  %74 = ashr exact i64 %sext7.us, 32
  %75 = getelementptr inbounds float, float* %50, i64 %74
  %76 = bitcast float* %75 to i32*
  %.val.i8.us = load i32, i32* %76, align 4, !tbaa !42
  %77 = add nsw i32 %i.010.us, %64
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %78
  %80 = bitcast float addrspace(3)* %79 to i32 addrspace(3)*
  %81 = addrspacecast i32 addrspace(3)* %80 to i32*
  store i32 %.val.i8.us, i32* %81, align 4, !tbaa !42
  %82 = add i32 %62, %i.010.us
  %83 = icmp slt i32 %82, %7
  br i1 %83, label %68, label %._crit_edge.us, !llvm.loop !72

._crit_edge.us:                                   ; preds = %68
  %84 = add i32 %60, %j.011.us
  %85 = icmp slt i32 %84, %15
  br i1 %85, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !73

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit42:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit42, %._crit_edge15.loopexit, %51
  tail call void @llvm.cuda.syncthreads()
  %86 = sdiv i64 %52, %34
  br i1 %39, label %._crit_edge29, label %.lr.ph28

.lr.ph28:                                         ; preds = %._crit_edge15
  %87 = mul nsw i64 %86, %34
  %88 = sub nsw i64 %52, %87
  %89 = mul nsw i64 %38, %88
  %90 = mul nsw i64 %36, %86
  %91 = tail call i32 @llvm.ptx.read.tid.x() #5
  %92 = icmp sgt i32 %91, %6
  %93 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %94 = add i64 %89, %90
  br label %99

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %95, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %95 = add i32 %60, %j.011
  %96 = icmp slt i32 %95, %15
  br i1 %96, label %.lr.ph14.split, label %._crit_edge15.loopexit42, !llvm.loop !73

._crit_edge29.loopexit:                           ; preds = %._crit_edge24
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %97 = add nsw i32 %p.030, %20
  %98 = icmp slt i32 %97, %numPlanes
  br i1 %98, label %51, label %._crit_edge33.loopexit

; <label>:99                                      ; preds = %.lr.ph28, %._crit_edge24
  %j1.025 = phi i32 [ %31, %.lr.ph28 ], [ %195, %._crit_edge24 ]
  br i1 %92, label %._crit_edge24, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %99
  %100 = add nsw i32 %j1.025, %9
  %101 = sext i32 %100 to i64
  %102 = mul nsw i64 %44, %101
  %103 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %104 = add i32 %j1.025, %30
  br i1 %40, label %.lr.ph20.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.lr.ph20.us.preheader:                            ; preds = %.preheader.lr.ph
  br label %.lr.ph20.us

; <label>:105                                     ; preds = %105, %.lr.ph20.us
  %l.019.us = phi i32 [ 0, %.lr.ph20.us ], [ %185, %105 ]
  %result.018.us = phi float [ 0.000000e+00, %.lr.ph20.us ], [ %184, %105 ]
  %106 = mul nsw i32 %l.019.us, %kernelSizeX
  %107 = add i32 %104, %l.019.us
  %108 = mul nsw i32 %107, %7
  %109 = add nsw i32 %108, %i2.022.us
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %110
  %112 = addrspacecast float addrspace(3)* %111 to float*
  %113 = load float, float* %112, align 4, !tbaa !42
  %114 = sext i32 %106 to i64
  %115 = getelementptr inbounds float, float* %kernel, i64 %114
  %116 = load float, float* %115, align 4, !tbaa !42
  %117 = fmul float %113, %116
  %118 = fadd float %result.018.us, %117
  %119 = add nsw i32 %109, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %120
  %122 = addrspacecast float addrspace(3)* %121 to float*
  %123 = load float, float* %122, align 4, !tbaa !42
  %124 = add nsw i32 %106, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float* %kernel, i64 %125
  %127 = load float, float* %126, align 4, !tbaa !42
  %128 = fmul float %123, %127
  %129 = fadd float %118, %128
  %130 = add nsw i32 %109, 2
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %131
  %133 = addrspacecast float addrspace(3)* %132 to float*
  %134 = load float, float* %133, align 4, !tbaa !42
  %135 = add nsw i32 %106, 2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float* %kernel, i64 %136
  %138 = load float, float* %137, align 4, !tbaa !42
  %139 = fmul float %134, %138
  %140 = fadd float %129, %139
  %141 = add nsw i32 %109, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %142
  %144 = addrspacecast float addrspace(3)* %143 to float*
  %145 = load float, float* %144, align 4, !tbaa !42
  %146 = add nsw i32 %106, 3
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float* %kernel, i64 %147
  %149 = load float, float* %148, align 4, !tbaa !42
  %150 = fmul float %145, %149
  %151 = fadd float %140, %150
  %152 = add nsw i32 %109, 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %153
  %155 = addrspacecast float addrspace(3)* %154 to float*
  %156 = load float, float* %155, align 4, !tbaa !42
  %157 = add nsw i32 %106, 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float* %kernel, i64 %158
  %160 = load float, float* %159, align 4, !tbaa !42
  %161 = fmul float %156, %160
  %162 = fadd float %151, %161
  %163 = add nsw i32 %109, 5
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %164
  %166 = addrspacecast float addrspace(3)* %165 to float*
  %167 = load float, float* %166, align 4, !tbaa !42
  %168 = add nsw i32 %106, 5
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float* %kernel, i64 %169
  %171 = load float, float* %170, align 4, !tbaa !42
  %172 = fmul float %167, %171
  %173 = fadd float %162, %172
  %174 = add nsw i32 %109, 6
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %175
  %177 = addrspacecast float addrspace(3)* %176 to float*
  %178 = load float, float* %177, align 4, !tbaa !42
  %179 = add nsw i32 %106, 6
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float* %kernel, i64 %180
  %182 = load float, float* %181, align 4, !tbaa !42
  %183 = fmul float %178, %182
  %184 = fadd float %173, %183
  %185 = add nuw nsw i32 %l.019.us, 1
  %exitcond36 = icmp eq i32 %185, %kernelSizeY
  br i1 %exitcond36, label %._crit_edge21.us, label %105, !llvm.loop !74

.lr.ph20.us:                                      ; preds = %.lr.ph20.us.preheader, %._crit_edge21.us
  %i2.022.us = phi i32 [ %193, %._crit_edge21.us ], [ %91, %.lr.ph20.us.preheader ]
  br label %105

._crit_edge21.us:                                 ; preds = %105
  %.lcssa = phi float [ %184, %105 ]
  %186 = add nsw i32 %i2.022.us, %2
  %187 = sext i32 %186 to i64
  %188 = mul nsw i64 %42, %187
  %189 = add i64 %94, %188
  %190 = add i64 %189, %102
  %sext5.us = shl i64 %190, 32
  %191 = ashr exact i64 %sext5.us, 32
  %192 = getelementptr inbounds float, float* %buffer, i64 %191
  store float %.lcssa, float* %192, align 4, !tbaa !42
  %193 = add i32 %103, %i2.022.us
  %194 = icmp sgt i32 %193, %6
  br i1 %194, label %._crit_edge24.loopexit, label %.lr.ph20.us, !llvm.loop !75

._crit_edge24.loopexit:                           ; preds = %._crit_edge21.us
  br label %._crit_edge24

._crit_edge24.loopexit41:                         ; preds = %.preheader
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit41, %._crit_edge24.loopexit, %99
  %195 = add i32 %93, %j1.025
  %196 = icmp sgt i32 %195, %14
  br i1 %196, label %._crit_edge29.loopexit, label %99, !llvm.loop !76

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %i2.022 = phi i32 [ %204, %.preheader ], [ %91, %.preheader.preheader ]
  %197 = add nsw i32 %i2.022, %2
  %198 = sext i32 %197 to i64
  %199 = mul nsw i64 %42, %198
  %200 = add i64 %94, %199
  %201 = add i64 %200, %102
  %sext5 = shl i64 %201, 32
  %202 = ashr exact i64 %sext5, 32
  %203 = getelementptr inbounds float, float* %buffer, i64 %202
  store float 0.000000e+00, float* %203, align 4, !tbaa !42
  %204 = add i32 %103, %i2.022
  %205 = icmp sgt i32 %204, %6
  br i1 %205, label %._crit_edge24.loopexit41, label %.preheader, !llvm.loop !75
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.30"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, %kernelSizeX
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, %kernelSizeY
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph36, label %._crit_edge37

.lr.ph36:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 2, i32 0, i64 3
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 3, i32 0, i64 3
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = icmp sgt i32 %kernelSizeY, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %44 = load i64, i64* %43, align 8
  %45 = icmp sgt i32 %kernelSizeX, 0
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.30", %"class.Eigen::internal::IndexMapper.30"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %51 = load float*, float** %50, align 8
  %xtraiter = and i32 %kernelSizeX, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %52 = icmp eq i32 %kernelSizeX, 1
  br label %53

._crit_edge37.loopexit:                           ; preds = %._crit_edge33
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %0
  ret void

; <label>:53                                      ; preds = %.lr.ph36, %._crit_edge33
  %p.034 = phi i32 [ %22, %.lr.ph36 ], [ %99, %._crit_edge33 ]
  %54 = sext i32 %p.034 to i64
  %55 = sdiv i64 %54, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %53
  %56 = mul nsw i64 %55, %25
  %57 = sub nsw i64 %54, %56
  %58 = mul nsw i64 %29, %57
  %59 = mul nsw i64 %27, %55
  %60 = tail call i32 @llvm.ptx.read.tid.x() #5
  %61 = icmp slt i32 %60, %7
  %62 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %63 = add i64 %58, %59
  br i1 %61, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %64 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %86, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %65 = add nsw i32 %j.011.us, %30
  %66 = mul nsw i32 %65, %7
  %67 = add nsw i32 %j.011.us, %9
  %68 = sext i32 %67 to i64
  %69 = mul nsw i64 %49, %68
  br label %70

; <label>:70                                      ; preds = %.lr.ph14.split.us, %70
  %i.010.us = phi i32 [ %60, %.lr.ph14.split.us ], [ %84, %70 ]
  %71 = add nsw i32 %i.010.us, %2
  %72 = sext i32 %71 to i64
  %73 = mul nsw i64 %47, %72
  %74 = add i64 %63, %73
  %75 = add i64 %74, %69
  %sext7.us = shl i64 %75, 32
  %76 = ashr exact i64 %sext7.us, 32
  %77 = getelementptr inbounds float, float* %51, i64 %76
  %78 = bitcast float* %77 to i32*
  %.val.i8.us = load i32, i32* %78, align 4, !tbaa !42
  %79 = add nsw i32 %i.010.us, %66
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %80
  %82 = bitcast float addrspace(3)* %81 to i32 addrspace(3)*
  %83 = addrspacecast i32 addrspace(3)* %82 to i32*
  store i32 %.val.i8.us, i32* %83, align 4, !tbaa !42
  %84 = add i32 %64, %i.010.us
  %85 = icmp slt i32 %84, %7
  br i1 %85, label %70, label %._crit_edge.us, !llvm.loop !77

._crit_edge.us:                                   ; preds = %70
  %86 = add i32 %62, %j.011.us
  %87 = icmp slt i32 %86, %15
  br i1 %87, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !78

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit61:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit61, %._crit_edge15.loopexit, %53
  tail call void @llvm.cuda.syncthreads()
  %88 = sdiv i64 %54, %34
  br i1 %39, label %._crit_edge33, label %.lr.ph32

.lr.ph32:                                         ; preds = %._crit_edge15
  %89 = mul nsw i64 %88, %34
  %90 = sub nsw i64 %54, %89
  %91 = mul nsw i64 %38, %90
  %92 = mul nsw i64 %36, %88
  %93 = tail call i32 @llvm.ptx.read.tid.x() #5
  %94 = icmp sgt i32 %93, %6
  %95 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %96 = add i64 %91, %92
  br label %101

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %97, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %97 = add i32 %62, %j.011
  %98 = icmp slt i32 %97, %15
  br i1 %98, label %.lr.ph14.split, label %._crit_edge15.loopexit61, !llvm.loop !78

._crit_edge33.loopexit:                           ; preds = %._crit_edge28
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %99 = add nsw i32 %p.034, %20
  %100 = icmp slt i32 %99, %numPlanes
  br i1 %100, label %53, label %._crit_edge37.loopexit

; <label>:101                                     ; preds = %.lr.ph32, %._crit_edge28
  %j1.029 = phi i32 [ %31, %.lr.ph32 ], [ %155, %._crit_edge28 ]
  br i1 %94, label %._crit_edge28, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %101
  %102 = add nsw i32 %j1.029, %9
  %103 = sext i32 %102 to i64
  %104 = mul nsw i64 %44, %103
  %105 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %106 = add i32 %j1.029, %30
  br i1 %40, label %.lr.ph23.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.lr.ph23.us.preheader:                            ; preds = %.preheader.lr.ph
  br label %.lr.ph23.us

.lr.ph23.us:                                      ; preds = %.lr.ph23.us.preheader, %._crit_edge24.us
  %i2.026.us = phi i32 [ %114, %._crit_edge24.us ], [ %93, %.lr.ph23.us.preheader ]
  br i1 %45, label %.lr.ph19.us.us.preheader, label %._crit_edge24.us

.lr.ph19.us.us.preheader:                         ; preds = %.lr.ph23.us
  br label %.lr.ph19.us.us

._crit_edge24.us.loopexit:                        ; preds = %._crit_edge20.us.us
  %.lcssa.lcssa = phi float [ %.lcssa, %._crit_edge20.us.us ]
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.lr.ph23.us
  %split25.us = phi float [ 0.000000e+00, %.lr.ph23.us ], [ %.lcssa.lcssa, %._crit_edge24.us.loopexit ]
  %107 = add nsw i32 %i2.026.us, %2
  %108 = sext i32 %107 to i64
  %109 = mul nsw i64 %42, %108
  %110 = add i64 %96, %109
  %111 = add i64 %110, %104
  %sext5.us = shl i64 %111, 32
  %112 = ashr exact i64 %sext5.us, 32
  %113 = getelementptr inbounds float, float* %buffer, i64 %112
  store float %split25.us, float* %113, align 4, !tbaa !42
  %114 = add i32 %105, %i2.026.us
  %115 = icmp sgt i32 %114, %6
  br i1 %115, label %._crit_edge28.loopexit, label %.lr.ph23.us, !llvm.loop !79

.lr.ph19.us.us:                                   ; preds = %.lr.ph19.us.us.preheader, %._crit_edge20.us.us
  %l.022.us.us = phi i32 [ %130, %._crit_edge20.us.us ], [ 0, %.lr.ph19.us.us.preheader ]
  %result.021.us.us = phi float [ %.lcssa, %._crit_edge20.us.us ], [ 0.000000e+00, %.lr.ph19.us.us.preheader ]
  %116 = mul nsw i32 %l.022.us.us, %kernelSizeX
  %117 = add i32 %106, %l.022.us.us
  %118 = mul nsw i32 %117, %7
  %119 = add nsw i32 %118, %i2.026.us
  br i1 %lcmp.mod, label %.lr.ph19.us.us.split, label %120

; <label>:120                                     ; preds = %.lr.ph19.us.us
  %121 = sext i32 %119 to i64
  %122 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %121
  %123 = addrspacecast float addrspace(3)* %122 to float*
  %124 = load float, float* %123, align 4, !tbaa !42
  %125 = sext i32 %116 to i64
  %126 = getelementptr inbounds float, float* %kernel, i64 %125
  %127 = load float, float* %126, align 4, !tbaa !42
  %128 = fmul float %124, %127
  %129 = fadd float %result.021.us.us, %128
  br label %.lr.ph19.us.us.split

.lr.ph19.us.us.split:                             ; preds = %.lr.ph19.us.us, %120
  %k.017.us.us.unr = phi i32 [ 0, %.lr.ph19.us.us ], [ 1, %120 ]
  %result.116.us.us.unr = phi float [ %result.021.us.us, %.lr.ph19.us.us ], [ %129, %120 ]
  %.lcssa.unr = phi float [ undef, %.lr.ph19.us.us ], [ %129, %120 ]
  br i1 %52, label %._crit_edge20.us.us, label %.lr.ph19.us.us.split.split.preheader

.lr.ph19.us.us.split.split.preheader:             ; preds = %.lr.ph19.us.us.split
  br label %.lr.ph19.us.us.split.split

._crit_edge20.us.us.loopexit:                     ; preds = %.lr.ph19.us.us.split.split
  %.lcssa63 = phi float [ %153, %.lr.ph19.us.us.split.split ]
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %.lr.ph19.us.us.split
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph19.us.us.split ], [ %.lcssa63, %._crit_edge20.us.us.loopexit ]
  %130 = add nuw nsw i32 %l.022.us.us, 1
  %exitcond53 = icmp eq i32 %130, %kernelSizeY
  br i1 %exitcond53, label %._crit_edge24.us.loopexit, label %.lr.ph19.us.us, !llvm.loop !80

.lr.ph19.us.us.split.split:                       ; preds = %.lr.ph19.us.us.split.split.preheader, %.lr.ph19.us.us.split.split
  %k.017.us.us = phi i32 [ %154, %.lr.ph19.us.us.split.split ], [ %k.017.us.us.unr, %.lr.ph19.us.us.split.split.preheader ]
  %result.116.us.us = phi float [ %153, %.lr.ph19.us.us.split.split ], [ %result.116.us.us.unr, %.lr.ph19.us.us.split.split.preheader ]
  %131 = add nsw i32 %119, %k.017.us.us
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %132
  %134 = addrspacecast float addrspace(3)* %133 to float*
  %135 = load float, float* %134, align 4, !tbaa !42
  %136 = add nsw i32 %k.017.us.us, %116
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float* %kernel, i64 %137
  %139 = load float, float* %138, align 4, !tbaa !42
  %140 = fmul float %135, %139
  %141 = fadd float %result.116.us.us, %140
  %142 = add nuw nsw i32 %k.017.us.us, 1
  %143 = add nsw i32 %119, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %144
  %146 = addrspacecast float addrspace(3)* %145 to float*
  %147 = load float, float* %146, align 4, !tbaa !42
  %148 = add nsw i32 %142, %116
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float* %kernel, i64 %149
  %151 = load float, float* %150, align 4, !tbaa !42
  %152 = fmul float %147, %151
  %153 = fadd float %141, %152
  %154 = add nsw i32 %k.017.us.us, 2
  %exitcond52.1 = icmp eq i32 %154, %kernelSizeX
  br i1 %exitcond52.1, label %._crit_edge20.us.us.loopexit, label %.lr.ph19.us.us.split.split, !llvm.loop !81

._crit_edge28.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge28

._crit_edge28.loopexit60:                         ; preds = %.preheader
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit60, %._crit_edge28.loopexit, %101
  %155 = add i32 %95, %j1.029
  %156 = icmp sgt i32 %155, %14
  br i1 %156, label %._crit_edge33.loopexit, label %101, !llvm.loop !82

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %i2.026 = phi i32 [ %164, %.preheader ], [ %93, %.preheader.preheader ]
  %157 = add nsw i32 %i2.026, %2
  %158 = sext i32 %157 to i64
  %159 = mul nsw i64 %42, %158
  %160 = add i64 %96, %159
  %161 = add i64 %160, %104
  %sext5 = shl i64 %161, 32
  %162 = ashr exact i64 %sext5, 32
  %163 = getelementptr inbounds float, float* %buffer, i64 %162
  store float 0.000000e+00, float* %163, align 4, !tbaa !42
  %164 = add i32 %105, %i2.026
  %165 = icmp sgt i32 %164, %6
  br i1 %165, label %._crit_edge28.loopexit60, label %.preheader, !llvm.loop !79
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf(%"struct.Eigen::TensorEvaluator.25"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.31"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i64 %numPlanes, i64 %numX, i64 %maxX, i64 %numY, i64 %maxY, i64 %numZ, i64 %maxZ, i64 %kernelSizeX, i64 %kernelSizeY, i64 %kernelSizeZ, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = zext i32 %1 to i64
  %3 = mul i64 %2, %maxX
  %4 = trunc i64 %3 to i32
  %sext = shl i64 %3, 32
  %5 = ashr exact i64 %sext, 32
  %6 = add i64 %5, %maxX
  %7 = icmp ult i64 %6, %numX
  %.numX = select i1 %7, i64 %6, i64 %numX
  %8 = add i64 %.numX, 4294967295
  %9 = trunc i64 %8 to i32
  %10 = sub nsw i32 %9, %4
  %11 = zext i32 %10 to i64
  %12 = add i64 %11, %kernelSizeX
  %13 = trunc i64 %12 to i32
  %14 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %15 = zext i32 %14 to i64
  %16 = mul i64 %15, %maxY
  %17 = trunc i64 %16 to i32
  %sext5 = shl i64 %16, 32
  %18 = ashr exact i64 %sext5, 32
  %19 = add i64 %18, %maxY
  %20 = icmp ult i64 %19, %numY
  %21 = select i1 %20, i64 %19, i64 %numY
  %22 = add i64 %21, 4294967295
  %23 = trunc i64 %22 to i32
  %24 = sub nsw i32 %23, %17
  %25 = zext i32 %24 to i64
  %26 = add i64 %25, %kernelSizeY
  %27 = trunc i64 %26 to i32
  %28 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %29 = zext i32 %28 to i64
  %30 = mul i64 %29, %maxZ
  %31 = trunc i64 %30 to i32
  %sext6 = shl i64 %30, 32
  %32 = ashr exact i64 %sext6, 32
  %33 = add i64 %32, %maxZ
  %34 = icmp ult i64 %33, %numZ
  %.numZ = select i1 %34, i64 %33, i64 %numZ
  %35 = add i64 %.numZ, 4294967295
  %36 = trunc i64 %35 to i32
  %37 = sub nsw i32 %36, %31
  %38 = zext i32 %37 to i64
  %39 = add i64 %38, %kernelSizeZ
  %40 = trunc i64 %39 to i32
  %41 = icmp eq i64 %numPlanes, 0
  br i1 %41, label %._crit_edge55, label %.lr.ph54

.lr.ph54:                                         ; preds = %0
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %43 = load i64, i64* %42, align 8
  %44 = tail call i32 @llvm.ptx.read.tid.z() #5
  %45 = icmp slt i32 %44, %40
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %47 = load i64, i64* %46, align 8
  %48 = icmp sgt i32 %44, %37
  %49 = icmp eq i64 %kernelSizeZ, 0
  %50 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %55 = load i64, i64* %54, align 8
  %56 = icmp eq i64 %kernelSizeY, 0
  %57 = icmp eq i64 %kernelSizeX, 0
  %58 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.31", %"class.Eigen::internal::IndexMapper.31"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %eval, i64 0, i32 0
  %65 = load float*, float** %64, align 8
  %brmerge = or i1 %49, %56
  %xtraiter = and i64 %kernelSizeX, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %66 = icmp eq i64 %kernelSizeX, 1
  br label %67

._crit_edge55.loopexit:                           ; preds = %._crit_edge51
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %0
  ret void

; <label>:67                                      ; preds = %.lr.ph54, %._crit_edge51
  %68 = phi i64 [ 0, %.lr.ph54 ], [ %116, %._crit_edge51 ]
  %p.052 = phi i32 [ 0, %.lr.ph54 ], [ %115, %._crit_edge51 ]
  %69 = mul nsw i64 %43, %68
  br i1 %45, label %.lr.ph23, label %._crit_edge24

.lr.ph23:                                         ; preds = %67
  %70 = tail call i32 @llvm.ptx.read.tid.y() #5
  %71 = icmp slt i32 %70, %27
  %72 = tail call i32 @llvm.ptx.read.ntid.z() #5
  br i1 %71, label %.lr.ph18.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  br label %.lr.ph23.split

.lr.ph18.us.preheader:                            ; preds = %.lr.ph23
  %73 = tail call i32 @llvm.ptx.read.tid.x() #5
  %74 = icmp slt i32 %73, %13
  %75 = tail call i32 @llvm.ptx.read.ntid.y() #5
  br label %.lr.ph18.us

.lr.ph18..lr.ph18.split_crit_edge.us:             ; preds = %.lr.ph18..lr.ph18.split_crit_edge.us.preheader, %.lr.ph18..lr.ph18.split_crit_edge.us
  %j.015.us56 = phi i32 [ %76, %.lr.ph18..lr.ph18.split_crit_edge.us ], [ %70, %.lr.ph18..lr.ph18.split_crit_edge.us.preheader ]
  %76 = add i32 %75, %j.015.us56
  %77 = icmp slt i32 %76, %27
  br i1 %77, label %.lr.ph18..lr.ph18.split_crit_edge.us, label %._crit_edge19.us.loopexit86

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader, %._crit_edge19.us
  %k.020.us = phi i32 [ %83, %._crit_edge19.us ], [ %44, %.lr.ph18.us.preheader ]
  %78 = add nsw i32 %k.020.us, %31
  %79 = sext i32 %78 to i64
  %80 = mul nsw i64 %63, %79
  %81 = mul nsw i32 %k.020.us, %27
  br i1 %74, label %.lr.ph.us.us.preheader, label %.lr.ph18..lr.ph18.split_crit_edge.us.preheader

.lr.ph18..lr.ph18.split_crit_edge.us.preheader:   ; preds = %.lr.ph18.us
  br label %.lr.ph18..lr.ph18.split_crit_edge.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph18.us
  %82 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph.us.us

._crit_edge19.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge19.us

._crit_edge19.us.loopexit86:                      ; preds = %.lr.ph18..lr.ph18.split_crit_edge.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit86, %._crit_edge19.us.loopexit
  %83 = add i32 %72, %k.020.us
  %84 = icmp slt i32 %83, %40
  br i1 %84, label %.lr.ph18.us, label %._crit_edge24.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %j.015.us.us = phi i32 [ %90, %._crit_edge.us.us ], [ %70, %.lr.ph.us.us.preheader ]
  %85 = add nsw i32 %j.015.us.us, %17
  %86 = sext i32 %85 to i64
  %87 = mul nsw i64 %61, %86
  %88 = add nsw i32 %j.015.us.us, %81
  %89 = mul nsw i32 %88, %13
  br label %92

._crit_edge.us.us:                                ; preds = %92
  %90 = add i32 %75, %j.015.us.us
  %91 = icmp slt i32 %90, %27
  br i1 %91, label %.lr.ph.us.us, label %._crit_edge19.us.loopexit

; <label>:92                                      ; preds = %92, %.lr.ph.us.us
  %i.014.us.us = phi i32 [ %73, %.lr.ph.us.us ], [ %107, %92 ]
  %93 = add nsw i32 %i.014.us.us, %4
  %94 = sext i32 %93 to i64
  %95 = mul nsw i64 %59, %94
  %96 = add i64 %95, %69
  %97 = add i64 %96, %87
  %98 = add i64 %97, %80
  %sext10.us.us = shl i64 %98, 32
  %99 = ashr exact i64 %sext10.us.us, 32
  %100 = getelementptr inbounds float, float* %65, i64 %99
  %101 = bitcast float* %100 to i32*
  %.val.i11.us.us = load i32, i32* %101, align 4, !tbaa !42
  %102 = add nsw i32 %i.014.us.us, %89
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %103
  %105 = bitcast float addrspace(3)* %104 to i32 addrspace(3)*
  %106 = addrspacecast i32 addrspace(3)* %105 to i32*
  store i32 %.val.i11.us.us, i32* %106, align 4, !tbaa !42
  %107 = add i32 %82, %i.014.us.us
  %108 = icmp slt i32 %107, %13
  br i1 %108, label %92, label %._crit_edge.us.us

._crit_edge24.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge24

._crit_edge24.loopexit87:                         ; preds = %.lr.ph23.split
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit87, %._crit_edge24.loopexit, %67
  tail call void @llvm.cuda.syncthreads()
  %109 = mul nsw i64 %47, %68
  br i1 %48, label %._crit_edge51, label %.lr.ph50

.lr.ph50:                                         ; preds = %._crit_edge24
  %110 = tail call i32 @llvm.ptx.read.tid.y() #5
  %111 = icmp sgt i32 %110, %24
  %112 = tail call i32 @llvm.ptx.read.ntid.z() #5
  br label %118

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %.lr.ph23.split
  %k.020 = phi i32 [ %113, %.lr.ph23.split ], [ %44, %.lr.ph23.split.preheader ]
  %113 = add i32 %72, %k.020
  %114 = icmp slt i32 %113, %40
  br i1 %114, label %.lr.ph23.split, label %._crit_edge24.loopexit87

._crit_edge51.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %._crit_edge24
  tail call void @llvm.cuda.syncthreads()
  %115 = add nuw nsw i32 %p.052, 1
  %116 = sext i32 %115 to i64
  %117 = icmp ult i64 %116, %numPlanes
  br i1 %117, label %67, label %._crit_edge55.loopexit

; <label>:118                                     ; preds = %.lr.ph50, %._crit_edge46
  %k1.047 = phi i32 [ %44, %.lr.ph50 ], [ %125, %._crit_edge46 ]
  br i1 %111, label %._crit_edge46, label %.lr.ph45

.lr.ph45:                                         ; preds = %118
  %119 = tail call i32 @llvm.ptx.read.tid.x() #5
  %120 = icmp sgt i32 %119, %10
  %121 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %122 = add nsw i32 %k1.047, %31
  %123 = sext i32 %122 to i64
  %124 = mul nsw i64 %55, %123
  br label %127

._crit_edge46.loopexit:                           ; preds = %._crit_edge41
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %118
  %125 = add i32 %112, %k1.047
  %126 = icmp sgt i32 %125, %37
  br i1 %126, label %._crit_edge51.loopexit, label %118

; <label>:127                                     ; preds = %.lr.ph45, %._crit_edge41
  %j2.042 = phi i32 [ %110, %.lr.ph45 ], [ %186, %._crit_edge41 ]
  br i1 %120, label %._crit_edge41, label %.preheader13.lr.ph

.preheader13.lr.ph:                               ; preds = %127
  %128 = add nsw i32 %j2.042, %17
  %129 = sext i32 %128 to i64
  %130 = mul nsw i64 %53, %129
  %131 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.lr.ph, %._crit_edge37
  %i3.039 = phi i32 [ %119, %.preheader13.lr.ph ], [ %196, %._crit_edge37 ]
  br i1 %brmerge, label %._crit_edge37, label %.preheader.lr.ph.us.preheader

.preheader.lr.ph.us.preheader:                    ; preds = %.preheader13
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.preheader.lr.ph.us.preheader, %._crit_edge32.us
  %132 = phi i64 [ %138, %._crit_edge32.us ], [ 0, %.preheader.lr.ph.us.preheader ]
  %n.035.us = phi i32 [ %137, %._crit_edge32.us ], [ 0, %.preheader.lr.ph.us.preheader ]
  %result.034.us = phi float [ %split33.us, %._crit_edge32.us ], [ 0.000000e+00, %.preheader.lr.ph.us.preheader ]
  %133 = add nsw i32 %n.035.us, %k1.047
  %134 = mul nsw i32 %133, %27
  %135 = add i32 %134, %j2.042
  %136 = mul i64 %132, %kernelSizeY
  br i1 %57, label %._crit_edge32.us, label %.lr.ph27.us.us.preheader

.lr.ph27.us.us.preheader:                         ; preds = %.preheader.lr.ph.us
  br label %.lr.ph27.us.us

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge28.us.us
  %.lcssa.lcssa = phi float [ %.lcssa, %._crit_edge28.us.us ]
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.preheader.lr.ph.us
  %split33.us = phi float [ %result.034.us, %.preheader.lr.ph.us ], [ %.lcssa.lcssa, %._crit_edge32.us.loopexit ]
  %137 = add nuw nsw i32 %n.035.us, 1
  %138 = sext i32 %137 to i64
  %139 = icmp ult i64 %138, %kernelSizeZ
  br i1 %139, label %.preheader.lr.ph.us, label %._crit_edge37.loopexit

.lr.ph27.us.us:                                   ; preds = %.lr.ph27.us.us.preheader, %._crit_edge28.us.us
  %140 = phi i64 [ %157, %._crit_edge28.us.us ], [ 0, %.lr.ph27.us.us.preheader ]
  %m.030.us.us = phi i32 [ %156, %._crit_edge28.us.us ], [ 0, %.lr.ph27.us.us.preheader ]
  %result.129.us.us = phi float [ %.lcssa, %._crit_edge28.us.us ], [ %result.034.us, %.lr.ph27.us.us.preheader ]
  %141 = add i32 %135, %m.030.us.us
  %142 = mul nsw i32 %141, %13
  %143 = add i32 %142, %i3.039
  %144 = add i64 %140, %136
  %145 = mul i64 %144, %kernelSizeX
  br i1 %lcmp.mod, label %.lr.ph27.us.us.split, label %146

; <label>:146                                     ; preds = %.lr.ph27.us.us
  %147 = add i32 %142, %i3.039
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %148
  %150 = addrspacecast float addrspace(3)* %149 to float*
  %151 = load float, float* %150, align 4, !tbaa !42
  %152 = getelementptr inbounds float, float* %kernel, i64 %145
  %153 = load float, float* %152, align 4, !tbaa !42
  %154 = fmul float %151, %153
  %155 = fadd float %result.129.us.us, %154
  br label %.lr.ph27.us.us.split

.lr.ph27.us.us.split:                             ; preds = %.lr.ph27.us.us, %146
  %.unr = phi i64 [ 0, %.lr.ph27.us.us ], [ 1, %146 ]
  %l.026.us.us.unr = phi i32 [ 0, %.lr.ph27.us.us ], [ 1, %146 ]
  %result.225.us.us.unr = phi float [ %result.129.us.us, %.lr.ph27.us.us ], [ %155, %146 ]
  %.lcssa.unr = phi float [ undef, %.lr.ph27.us.us ], [ %155, %146 ]
  br i1 %66, label %._crit_edge28.us.us, label %.lr.ph27.us.us.split.split

.lr.ph27.us.us.split.split:                       ; preds = %.lr.ph27.us.us.split
  br label %159

._crit_edge28.us.us.unr-lcssa:                    ; preds = %159
  %.lcssa88 = phi float [ %182, %159 ]
  br label %._crit_edge28.us.us

._crit_edge28.us.us:                              ; preds = %.lr.ph27.us.us.split, %._crit_edge28.us.us.unr-lcssa
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph27.us.us.split ], [ %.lcssa88, %._crit_edge28.us.us.unr-lcssa ]
  %156 = add nuw nsw i32 %m.030.us.us, 1
  %157 = sext i32 %156 to i64
  %158 = icmp ult i64 %157, %kernelSizeY
  br i1 %158, label %.lr.ph27.us.us, label %._crit_edge32.us.loopexit

; <label>:159                                     ; preds = %159, %.lr.ph27.us.us.split.split
  %160 = phi i64 [ %.unr, %.lr.ph27.us.us.split.split ], [ %184, %159 ]
  %l.026.us.us = phi i32 [ %l.026.us.us.unr, %.lr.ph27.us.us.split.split ], [ %183, %159 ]
  %result.225.us.us = phi float [ %result.225.us.us.unr, %.lr.ph27.us.us.split.split ], [ %182, %159 ]
  %161 = add i32 %143, %l.026.us.us
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %162
  %164 = addrspacecast float addrspace(3)* %163 to float*
  %165 = load float, float* %164, align 4, !tbaa !42
  %166 = add i64 %160, %145
  %167 = getelementptr inbounds float, float* %kernel, i64 %166
  %168 = load float, float* %167, align 4, !tbaa !42
  %169 = fmul float %165, %168
  %170 = fadd float %result.225.us.us, %169
  %171 = add nuw nsw i32 %l.026.us.us, 1
  %172 = sext i32 %171 to i64
  %173 = add i32 %143, %171
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %174
  %176 = addrspacecast float addrspace(3)* %175 to float*
  %177 = load float, float* %176, align 4, !tbaa !42
  %178 = add i64 %172, %145
  %179 = getelementptr inbounds float, float* %kernel, i64 %178
  %180 = load float, float* %179, align 4, !tbaa !42
  %181 = fmul float %177, %180
  %182 = fadd float %170, %181
  %183 = add nsw i32 %l.026.us.us, 2
  %184 = sext i32 %183 to i64
  %185 = icmp ult i64 %184, %kernelSizeX
  br i1 %185, label %159, label %._crit_edge28.us.us.unr-lcssa

._crit_edge41.loopexit:                           ; preds = %._crit_edge37
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %127
  %186 = add i32 %121, %j2.042
  %187 = icmp sgt i32 %186, %24
  br i1 %187, label %._crit_edge46.loopexit, label %127

._crit_edge37.loopexit:                           ; preds = %._crit_edge32.us
  %split33.us.lcssa = phi float [ %split33.us, %._crit_edge32.us ]
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %.preheader13
  %result.0.lcssa = phi float [ 0.000000e+00, %.preheader13 ], [ %split33.us.lcssa, %._crit_edge37.loopexit ]
  %188 = add nsw i32 %i3.039, %4
  %189 = sext i32 %188 to i64
  %190 = mul nsw i64 %51, %189
  %191 = add i64 %190, %109
  %192 = add i64 %191, %130
  %193 = add i64 %192, %124
  %sext8 = shl i64 %193, 32
  %194 = ashr exact i64 %sext8, 32
  %195 = getelementptr inbounds float, float* %buffer, i64 %194
  store float %result.0.lcssa, float* %195, align 4, !tbaa !42
  %196 = add i32 %131, %i3.039
  %197 = icmp sgt i32 %196, %10
  br i1 %197, label %._crit_edge41.loopexit, label %.preheader13
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.32"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %size
  br i1 %10, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

.lr.ph.i:                                         ; preds = %0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %eval, i64 0, i32 1, i32 5
  %12 = load float*, float** %11, align 8
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %eval, i64 0, i32 0, i32 0
  %14 = load float*, float** %13, align 8
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph.i
  %i.01.i = phi i64 [ %6, %.lr.ph.i ], [ %21, %15 ]
  %16 = getelementptr inbounds float, float* %12, i64 %i.01.i
  %17 = bitcast float* %16 to i32*
  %18 = load i32, i32* %17, align 4, !tbaa !42
  %19 = getelementptr inbounds float, float* %14, i64 %i.01.i
  %20 = bitcast float* %19 to i32*
  store i32 %18, i32* %20, align 4, !tbaa !42
  %21 = add nuw nsw i64 %i.01.i, %9
  %22 = icmp slt i64 %21, %size
  br i1 %22, label %15, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit: ; preds = %15
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.36"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %size
  br i1 %10, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit

.lr.ph.i:                                         ; preds = %0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.36", %"struct.Eigen::TensorEvaluator.36"* %eval, i64 0, i32 0, i32 0
  %12 = load float*, float** %11, align 8
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.36", %"struct.Eigen::TensorEvaluator.36"* %eval, i64 0, i32 2
  %14 = load float*, float** %13, align 8
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph.i
  %i.01.i = phi i64 [ %6, %.lr.ph.i ], [ %20, %15 ]
  %16 = getelementptr inbounds float, float* %12, i64 %i.01.i
  %17 = bitcast float* %16 to i32*
  %.val.i1.i.i = load i32, i32* %17, align 4, !tbaa !42
  %18 = getelementptr inbounds float, float* %14, i64 %i.01.i
  %19 = bitcast float* %18 to i32*
  store i32 %.val.i1.i.i, i32* %19, align 4, !tbaa !42
  %20 = add nuw nsw i64 %i.01.i, %9
  %21 = icmp slt i64 %20, %size
  br i1 %21, label %15, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit.loopexit: ; preds = %15
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.39"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %kernelSize, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 4
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.ptx.read.nctaid.y() #5
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.ptx.read.tid.y() #5
  %14 = add i32 %13, %10
  %15 = icmp slt i32 %14, %numPlanes
  br i1 %15, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %0
  %16 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 2, i32 0, i64 1
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %25 = load i64, i64* %24, align 8
  %26 = mul i32 %7, %13
  %27 = tail call i32 @llvm.ptx.read.tid.x() #5
  %28 = icmp slt i32 %27, %7
  %29 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 3, i32 0, i64 1
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %27, %6
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %45 = load float*, float** %44, align 8
  %.phi.trans.insert = getelementptr inbounds float, float* %kernel, i64 1
  %.phi.trans.insert19 = getelementptr inbounds float, float* %kernel, i64 2
  %.phi.trans.insert21 = getelementptr inbounds float, float* %kernel, i64 3
  br label %46

._crit_edge17.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %0
  ret void

; <label>:46                                      ; preds = %.lr.ph16, %._crit_edge13
  %p.014 = phi i32 [ %14, %.lr.ph16 ], [ %87, %._crit_edge13 ]
  %47 = sext i32 %p.014 to i64
  %48 = sdiv i64 %47, %17
  %49 = mul nsw i64 %19, %48
  %50 = mul nsw i64 %48, %17
  %51 = sub nsw i64 %47, %50
  %52 = sdiv i64 %51, %21
  %53 = mul nsw i64 %23, %52
  %54 = add nsw i64 %53, %49
  %55 = mul nsw i64 %52, %21
  %56 = sub nsw i64 %51, %55
  %57 = mul nsw i64 %25, %56
  %58 = add nsw i64 %54, %57
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %46
  %59 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %72

._crit_edge.loopexit:                             ; preds = %72
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %46
  tail call void @llvm.cuda.syncthreads()
  %60 = sdiv i64 %47, %30
  %61 = mul nsw i64 %32, %60
  %62 = mul nsw i64 %60, %30
  %63 = sub nsw i64 %47, %62
  %64 = sdiv i64 %63, %34
  %65 = mul nsw i64 %36, %64
  %66 = add nsw i64 %65, %61
  %67 = mul nsw i64 %64, %34
  %68 = sub nsw i64 %63, %67
  %69 = mul nsw i64 %38, %68
  %70 = add nsw i64 %66, %69
  br i1 %39, label %._crit_edge13, label %.lr.ph12

.lr.ph12:                                         ; preds = %._crit_edge
  %71 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %.pre = load float, float* %kernel, align 4, !tbaa !42
  %.pre18 = load float, float* %.phi.trans.insert, align 4, !tbaa !42
  %.pre20 = load float, float* %.phi.trans.insert19, align 4, !tbaa !42
  %.pre22 = load float, float* %.phi.trans.insert21, align 4, !tbaa !42
  br label %89

; <label>:72                                      ; preds = %.lr.ph, %72
  %i.07 = phi i32 [ %27, %.lr.ph ], [ %85, %72 ]
  %73 = add nsw i32 %i.07, %2
  %74 = sext i32 %73 to i64
  %75 = mul nsw i64 %43, %74
  %76 = add i64 %58, %75
  %sext5 = shl i64 %76, 32
  %77 = ashr exact i64 %sext5, 32
  %78 = getelementptr inbounds float, float* %45, i64 %77
  %79 = bitcast float* %78 to i32*
  %.val.i6 = load i32, i32* %79, align 4, !tbaa !42
  %80 = add nsw i32 %i.07, %26
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %81
  %83 = bitcast float addrspace(3)* %82 to i32 addrspace(3)*
  %84 = addrspacecast i32 addrspace(3)* %83 to i32*
  store i32 %.val.i6, i32* %84, align 4, !tbaa !42
  %85 = add i32 %59, %i.07
  %86 = icmp slt i32 %85, %7
  br i1 %86, label %72, label %._crit_edge.loopexit, !llvm.loop !83

._crit_edge13.loopexit:                           ; preds = %89
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %._crit_edge
  tail call void @llvm.cuda.syncthreads()
  %87 = add nsw i32 %p.014, %12
  %88 = icmp slt i32 %87, %numPlanes
  br i1 %88, label %46, label %._crit_edge17.loopexit

; <label>:89                                      ; preds = %.lr.ph12, %89
  %i1.010 = phi i32 [ %27, %.lr.ph12 ], [ %124, %89 ]
  %90 = add nsw i32 %i1.010, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  %94 = load float, float* %93, align 4, !tbaa !42
  %95 = fmul float %94, %.pre
  %96 = fadd float %95, 0.000000e+00
  %97 = add nsw i32 %90, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %98
  %100 = addrspacecast float addrspace(3)* %99 to float*
  %101 = load float, float* %100, align 4, !tbaa !42
  %102 = fmul float %101, %.pre18
  %103 = fadd float %96, %102
  %104 = add nsw i32 %90, 2
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %105
  %107 = addrspacecast float addrspace(3)* %106 to float*
  %108 = load float, float* %107, align 4, !tbaa !42
  %109 = fmul float %108, %.pre20
  %110 = fadd float %103, %109
  %111 = add nsw i32 %90, 3
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %112
  %114 = addrspacecast float addrspace(3)* %113 to float*
  %115 = load float, float* %114, align 4, !tbaa !42
  %116 = fmul float %115, %.pre22
  %117 = fadd float %110, %116
  %118 = add nsw i32 %i1.010, %2
  %119 = sext i32 %118 to i64
  %120 = mul nsw i64 %41, %119
  %121 = add i64 %70, %120
  %sext3 = shl i64 %121, 32
  %122 = ashr exact i64 %sext3, 32
  %123 = getelementptr inbounds float, float* %buffer, i64 %122
  store float %117, float* %123, align 4, !tbaa !42
  %124 = add i32 %71, %i1.010
  %125 = icmp sgt i32 %124, %6
  br i1 %125, label %._crit_edge13.loopexit, label %89, !llvm.loop !84
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.39"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %kernelSize, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 7
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.ptx.read.nctaid.y() #5
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.ptx.read.tid.y() #5
  %14 = add i32 %13, %10
  %15 = icmp slt i32 %14, %numPlanes
  br i1 %15, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %0
  %16 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 2, i32 0, i64 1
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %25 = load i64, i64* %24, align 8
  %26 = mul i32 %7, %13
  %27 = tail call i32 @llvm.ptx.read.tid.x() #5
  %28 = icmp slt i32 %27, %7
  %29 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 3, i32 0, i64 1
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %27, %6
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %45 = load float*, float** %44, align 8
  %.phi.trans.insert = getelementptr inbounds float, float* %kernel, i64 1
  %.phi.trans.insert19 = getelementptr inbounds float, float* %kernel, i64 2
  %.phi.trans.insert21 = getelementptr inbounds float, float* %kernel, i64 3
  %.phi.trans.insert23 = getelementptr inbounds float, float* %kernel, i64 4
  %.phi.trans.insert25 = getelementptr inbounds float, float* %kernel, i64 5
  %.phi.trans.insert27 = getelementptr inbounds float, float* %kernel, i64 6
  br label %46

._crit_edge17.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %0
  ret void

; <label>:46                                      ; preds = %.lr.ph16, %._crit_edge13
  %p.014 = phi i32 [ %14, %.lr.ph16 ], [ %87, %._crit_edge13 ]
  %47 = sext i32 %p.014 to i64
  %48 = sdiv i64 %47, %17
  %49 = mul nsw i64 %19, %48
  %50 = mul nsw i64 %48, %17
  %51 = sub nsw i64 %47, %50
  %52 = sdiv i64 %51, %21
  %53 = mul nsw i64 %23, %52
  %54 = add nsw i64 %53, %49
  %55 = mul nsw i64 %52, %21
  %56 = sub nsw i64 %51, %55
  %57 = mul nsw i64 %25, %56
  %58 = add nsw i64 %54, %57
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %46
  %59 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %72

._crit_edge.loopexit:                             ; preds = %72
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %46
  tail call void @llvm.cuda.syncthreads()
  %60 = sdiv i64 %47, %30
  %61 = mul nsw i64 %32, %60
  %62 = mul nsw i64 %60, %30
  %63 = sub nsw i64 %47, %62
  %64 = sdiv i64 %63, %34
  %65 = mul nsw i64 %36, %64
  %66 = add nsw i64 %65, %61
  %67 = mul nsw i64 %64, %34
  %68 = sub nsw i64 %63, %67
  %69 = mul nsw i64 %38, %68
  %70 = add nsw i64 %66, %69
  br i1 %39, label %._crit_edge13, label %.lr.ph12

.lr.ph12:                                         ; preds = %._crit_edge
  %71 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %.pre = load float, float* %kernel, align 4, !tbaa !42
  %.pre18 = load float, float* %.phi.trans.insert, align 4, !tbaa !42
  %.pre20 = load float, float* %.phi.trans.insert19, align 4, !tbaa !42
  %.pre22 = load float, float* %.phi.trans.insert21, align 4, !tbaa !42
  %.pre24 = load float, float* %.phi.trans.insert23, align 4, !tbaa !42
  %.pre26 = load float, float* %.phi.trans.insert25, align 4, !tbaa !42
  %.pre28 = load float, float* %.phi.trans.insert27, align 4, !tbaa !42
  br label %89

; <label>:72                                      ; preds = %.lr.ph, %72
  %i.07 = phi i32 [ %27, %.lr.ph ], [ %85, %72 ]
  %73 = add nsw i32 %i.07, %2
  %74 = sext i32 %73 to i64
  %75 = mul nsw i64 %43, %74
  %76 = add i64 %58, %75
  %sext5 = shl i64 %76, 32
  %77 = ashr exact i64 %sext5, 32
  %78 = getelementptr inbounds float, float* %45, i64 %77
  %79 = bitcast float* %78 to i32*
  %.val.i6 = load i32, i32* %79, align 4, !tbaa !42
  %80 = add nsw i32 %i.07, %26
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %81
  %83 = bitcast float addrspace(3)* %82 to i32 addrspace(3)*
  %84 = addrspacecast i32 addrspace(3)* %83 to i32*
  store i32 %.val.i6, i32* %84, align 4, !tbaa !42
  %85 = add i32 %59, %i.07
  %86 = icmp slt i32 %85, %7
  br i1 %86, label %72, label %._crit_edge.loopexit, !llvm.loop !85

._crit_edge13.loopexit:                           ; preds = %89
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %._crit_edge
  tail call void @llvm.cuda.syncthreads()
  %87 = add nsw i32 %p.014, %12
  %88 = icmp slt i32 %87, %numPlanes
  br i1 %88, label %46, label %._crit_edge17.loopexit

; <label>:89                                      ; preds = %.lr.ph12, %89
  %i1.010 = phi i32 [ %27, %.lr.ph12 ], [ %145, %89 ]
  %90 = add nsw i32 %i1.010, %26
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  %94 = load float, float* %93, align 4, !tbaa !42
  %95 = fmul float %94, %.pre
  %96 = fadd float %95, 0.000000e+00
  %97 = add nsw i32 %90, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %98
  %100 = addrspacecast float addrspace(3)* %99 to float*
  %101 = load float, float* %100, align 4, !tbaa !42
  %102 = fmul float %101, %.pre18
  %103 = fadd float %96, %102
  %104 = add nsw i32 %90, 2
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %105
  %107 = addrspacecast float addrspace(3)* %106 to float*
  %108 = load float, float* %107, align 4, !tbaa !42
  %109 = fmul float %108, %.pre20
  %110 = fadd float %103, %109
  %111 = add nsw i32 %90, 3
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %112
  %114 = addrspacecast float addrspace(3)* %113 to float*
  %115 = load float, float* %114, align 4, !tbaa !42
  %116 = fmul float %115, %.pre22
  %117 = fadd float %110, %116
  %118 = add nsw i32 %90, 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %119
  %121 = addrspacecast float addrspace(3)* %120 to float*
  %122 = load float, float* %121, align 4, !tbaa !42
  %123 = fmul float %122, %.pre24
  %124 = fadd float %117, %123
  %125 = add nsw i32 %90, 5
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %126
  %128 = addrspacecast float addrspace(3)* %127 to float*
  %129 = load float, float* %128, align 4, !tbaa !42
  %130 = fmul float %129, %.pre26
  %131 = fadd float %124, %130
  %132 = add nsw i32 %90, 6
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %133
  %135 = addrspacecast float addrspace(3)* %134 to float*
  %136 = load float, float* %135, align 4, !tbaa !42
  %137 = fmul float %136, %.pre28
  %138 = fadd float %131, %137
  %139 = add nsw i32 %i1.010, %2
  %140 = sext i32 %139 to i64
  %141 = mul nsw i64 %41, %140
  %142 = add i64 %70, %141
  %sext3 = shl i64 %142, 32
  %143 = ashr exact i64 %sext3, 32
  %144 = getelementptr inbounds float, float* %buffer, i64 %143
  store float %138, float* %144, align 4, !tbaa !42
  %145 = add i32 %71, %i1.010
  %146 = icmp sgt i32 %145, %6
  br i1 %146, label %._crit_edge13.loopexit, label %89, !llvm.loop !86
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.39"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %kernelSize, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, %kernelSize
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.ptx.read.nctaid.y() #5
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.ptx.read.tid.y() #5
  %14 = add i32 %13, %10
  %15 = icmp slt i32 %14, %numPlanes
  br i1 %15, label %.lr.ph19, label %._crit_edge20

.lr.ph19:                                         ; preds = %0
  %16 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 2, i32 0, i64 1
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %25 = load i64, i64* %24, align 8
  %26 = mul i32 %7, %13
  %27 = tail call i32 @llvm.ptx.read.tid.x() #5
  %28 = icmp slt i32 %27, %7
  %29 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 3, i32 0, i64 1
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %27, %6
  %40 = icmp sgt i32 %kernelSize, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.39", %"class.Eigen::internal::IndexMapper.39"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %46 = load float*, float** %45, align 8
  %xtraiter = and i32 %kernelSize, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %47 = icmp eq i32 %kernelSize, 1
  br label %48

._crit_edge20.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %0
  ret void

; <label>:48                                      ; preds = %.lr.ph19, %._crit_edge16
  %p.017 = phi i32 [ %14, %.lr.ph19 ], [ %128, %._crit_edge16 ]
  %49 = sext i32 %p.017 to i64
  %50 = sdiv i64 %49, %17
  %51 = mul nsw i64 %19, %50
  %52 = mul nsw i64 %50, %17
  %53 = sub nsw i64 %49, %52
  %54 = sdiv i64 %53, %21
  %55 = mul nsw i64 %23, %54
  %56 = add nsw i64 %55, %51
  %57 = mul nsw i64 %54, %21
  %58 = sub nsw i64 %53, %57
  %59 = mul nsw i64 %25, %58
  %60 = add nsw i64 %56, %59
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %48
  %61 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %113

._crit_edge.loopexit:                             ; preds = %113
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %48
  tail call void @llvm.cuda.syncthreads()
  %62 = sdiv i64 %49, %30
  %63 = mul nsw i64 %32, %62
  %64 = mul nsw i64 %62, %30
  %65 = sub nsw i64 %49, %64
  %66 = sdiv i64 %65, %34
  %67 = mul nsw i64 %36, %66
  %68 = add nsw i64 %67, %63
  %69 = mul nsw i64 %66, %34
  %70 = sub nsw i64 %65, %69
  %71 = mul nsw i64 %38, %70
  %72 = add nsw i64 %68, %71
  br i1 %39, label %._crit_edge16, label %.lr.ph15

.lr.ph15:                                         ; preds = %._crit_edge
  %73 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br i1 %40, label %.lr.ph15.split.us.preheader, label %.lr.ph15.split.preheader

.lr.ph15.split.preheader:                         ; preds = %.lr.ph15
  br label %.lr.ph15.split

.lr.ph15.split.us.preheader:                      ; preds = %.lr.ph15
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %._crit_edge12.us
  %i1.013.us = phi i32 [ %111, %._crit_edge12.us ], [ %27, %.lr.ph15.split.us.preheader ]
  %74 = add nsw i32 %i1.013.us, %26
  br i1 %lcmp.mod, label %.lr.ph15.split.us.split, label %75

; <label>:75                                      ; preds = %.lr.ph15.split.us
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %76
  %78 = addrspacecast float addrspace(3)* %77 to float*
  %79 = load float, float* %78, align 4, !tbaa !42
  %80 = load float, float* %kernel, align 4, !tbaa !42
  %81 = fmul float %79, %80
  %82 = fadd float %81, 0.000000e+00
  br label %.lr.ph15.split.us.split

.lr.ph15.split.us.split:                          ; preds = %.lr.ph15.split.us, %75
  %k.09.us.unr = phi i32 [ 0, %.lr.ph15.split.us ], [ 1, %75 ]
  %result.08.us.unr = phi float [ 0.000000e+00, %.lr.ph15.split.us ], [ %82, %75 ]
  %.lcssa.unr = phi float [ undef, %.lr.ph15.split.us ], [ %82, %75 ]
  br i1 %47, label %._crit_edge12.us, label %.lr.ph15.split.us.split.split.preheader

.lr.ph15.split.us.split.split.preheader:          ; preds = %.lr.ph15.split.us.split
  br label %.lr.ph15.split.us.split.split

.lr.ph15.split.us.split.split:                    ; preds = %.lr.ph15.split.us.split.split.preheader, %.lr.ph15.split.us.split.split
  %k.09.us = phi i32 [ %104, %.lr.ph15.split.us.split.split ], [ %k.09.us.unr, %.lr.ph15.split.us.split.split.preheader ]
  %result.08.us = phi float [ %103, %.lr.ph15.split.us.split.split ], [ %result.08.us.unr, %.lr.ph15.split.us.split.split.preheader ]
  %83 = add nsw i32 %74, %k.09.us
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %84
  %86 = addrspacecast float addrspace(3)* %85 to float*
  %87 = load float, float* %86, align 4, !tbaa !42
  %88 = sext i32 %k.09.us to i64
  %89 = getelementptr inbounds float, float* %kernel, i64 %88
  %90 = load float, float* %89, align 4, !tbaa !42
  %91 = fmul float %87, %90
  %92 = fadd float %result.08.us, %91
  %93 = add nuw nsw i32 %k.09.us, 1
  %94 = add nsw i32 %74, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %95
  %97 = addrspacecast float addrspace(3)* %96 to float*
  %98 = load float, float* %97, align 4, !tbaa !42
  %99 = sext i32 %93 to i64
  %100 = getelementptr inbounds float, float* %kernel, i64 %99
  %101 = load float, float* %100, align 4, !tbaa !42
  %102 = fmul float %98, %101
  %103 = fadd float %92, %102
  %104 = add nsw i32 %k.09.us, 2
  %exitcond.1 = icmp eq i32 %104, %kernelSize
  br i1 %exitcond.1, label %._crit_edge12.us.loopexit, label %.lr.ph15.split.us.split.split, !llvm.loop !87

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph15.split.us.split.split
  %.lcssa28 = phi float [ %103, %.lr.ph15.split.us.split.split ]
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.lr.ph15.split.us.split
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph15.split.us.split ], [ %.lcssa28, %._crit_edge12.us.loopexit ]
  %105 = add nsw i32 %i1.013.us, %2
  %106 = sext i32 %105 to i64
  %107 = mul nsw i64 %42, %106
  %108 = add i64 %72, %107
  %sext3.us = shl i64 %108, 32
  %109 = ashr exact i64 %sext3.us, 32
  %110 = getelementptr inbounds float, float* %buffer, i64 %109
  store float %.lcssa, float* %110, align 4, !tbaa !42
  %111 = add i32 %73, %i1.013.us
  %112 = icmp sgt i32 %111, %6
  br i1 %112, label %._crit_edge16.loopexit, label %.lr.ph15.split.us, !llvm.loop !88

; <label>:113                                     ; preds = %.lr.ph, %113
  %i.07 = phi i32 [ %27, %.lr.ph ], [ %126, %113 ]
  %114 = add nsw i32 %i.07, %2
  %115 = sext i32 %114 to i64
  %116 = mul nsw i64 %44, %115
  %117 = add i64 %60, %116
  %sext5 = shl i64 %117, 32
  %118 = ashr exact i64 %sext5, 32
  %119 = getelementptr inbounds float, float* %46, i64 %118
  %120 = bitcast float* %119 to i32*
  %.val.i6 = load i32, i32* %120, align 4, !tbaa !42
  %121 = add nsw i32 %i.07, %26
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %122
  %124 = bitcast float addrspace(3)* %123 to i32 addrspace(3)*
  %125 = addrspacecast i32 addrspace(3)* %124 to i32*
  store i32 %.val.i6, i32* %125, align 4, !tbaa !42
  %126 = add i32 %61, %i.07
  %127 = icmp slt i32 %126, %7
  br i1 %127, label %113, label %._crit_edge.loopexit, !llvm.loop !89

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16.loopexit26:                         ; preds = %.lr.ph15.split
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit26, %._crit_edge16.loopexit, %._crit_edge
  tail call void @llvm.cuda.syncthreads()
  %128 = add nsw i32 %p.017, %12
  %129 = icmp slt i32 %128, %numPlanes
  br i1 %129, label %48, label %._crit_edge20.loopexit

.lr.ph15.split:                                   ; preds = %.lr.ph15.split.preheader, %.lr.ph15.split
  %i1.013 = phi i32 [ %136, %.lr.ph15.split ], [ %27, %.lr.ph15.split.preheader ]
  %130 = add nsw i32 %i1.013, %2
  %131 = sext i32 %130 to i64
  %132 = mul nsw i64 %42, %131
  %133 = add i64 %72, %132
  %sext3 = shl i64 %133, 32
  %134 = ashr exact i64 %sext3, 32
  %135 = getelementptr inbounds float, float* %buffer, i64 %134
  store float 0.000000e+00, float* %135, align 4, !tbaa !42
  %136 = add i32 %73, %i1.013
  %137 = icmp sgt i32 %136, %6
  br i1 %137, label %._crit_edge16.loopexit26, label %.lr.ph15.split, !llvm.loop !88
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.40"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 4
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, 7
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph29, label %._crit_edge30

.lr.ph29:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %49 = load float*, float** %48, align 8
  %50 = getelementptr inbounds float, float* %kernel, i64 1
  %51 = getelementptr inbounds float, float* %kernel, i64 2
  %52 = getelementptr inbounds float, float* %kernel, i64 3
  %53 = sext i32 %kernelSizeX to i64
  %54 = getelementptr inbounds float, float* %kernel, i64 %53
  %55 = add nsw i32 %kernelSizeX, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float* %kernel, i64 %56
  %58 = add nsw i32 %kernelSizeX, 2
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float* %kernel, i64 %59
  %61 = add nsw i32 %kernelSizeX, 3
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %kernel, i64 %62
  %64 = shl nsw i32 %kernelSizeX, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %kernel, i64 %65
  %67 = or i32 %64, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float* %kernel, i64 %68
  %70 = add nsw i32 %64, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float* %kernel, i64 %71
  %73 = add nsw i32 %64, 3
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float* %kernel, i64 %74
  %76 = mul nsw i32 %kernelSizeX, 3
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %kernel, i64 %77
  %79 = add nsw i32 %76, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float* %kernel, i64 %80
  %82 = add nsw i32 %76, 2
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %kernel, i64 %83
  %85 = add nsw i32 %76, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float* %kernel, i64 %86
  %88 = shl nsw i32 %kernelSizeX, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %kernel, i64 %89
  %91 = or i32 %88, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float* %kernel, i64 %92
  %94 = or i32 %88, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float* %kernel, i64 %95
  %97 = or i32 %88, 3
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %kernel, i64 %98
  %100 = mul nsw i32 %kernelSizeX, 5
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float* %kernel, i64 %101
  %103 = add nsw i32 %100, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float* %kernel, i64 %104
  %106 = add nsw i32 %100, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float* %kernel, i64 %107
  %109 = add nsw i32 %100, 3
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float* %kernel, i64 %110
  %112 = mul nsw i32 %kernelSizeX, 6
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float* %kernel, i64 %113
  %115 = or i32 %112, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float* %kernel, i64 %116
  %118 = add nsw i32 %112, 2
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float* %kernel, i64 %119
  %121 = add nsw i32 %112, 3
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float* %kernel, i64 %122
  br label %124

._crit_edge30.loopexit:                           ; preds = %._crit_edge26
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %0
  ret void

; <label>:124                                     ; preds = %.lr.ph29, %._crit_edge26
  %p.027 = phi i32 [ %22, %.lr.ph29 ], [ %201, %._crit_edge26 ]
  %125 = sext i32 %p.027 to i64
  %126 = sdiv i64 %125, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %124
  %127 = mul nsw i64 %126, %25
  %128 = sub nsw i64 %125, %127
  %129 = mul nsw i64 %29, %128
  %130 = mul nsw i64 %27, %126
  %131 = tail call i32 @llvm.ptx.read.tid.x() #5
  %132 = icmp slt i32 %131, %7
  %133 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %134 = add i64 %129, %130
  br i1 %132, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %135 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %157, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %136 = add nsw i32 %j.011.us, %30
  %137 = mul nsw i32 %136, %7
  %138 = add nsw i32 %j.011.us, %9
  %139 = sext i32 %138 to i64
  %140 = mul nsw i64 %47, %139
  br label %141

; <label>:141                                     ; preds = %.lr.ph14.split.us, %141
  %i.010.us = phi i32 [ %131, %.lr.ph14.split.us ], [ %155, %141 ]
  %142 = add nsw i32 %i.010.us, %2
  %143 = sext i32 %142 to i64
  %144 = mul nsw i64 %45, %143
  %145 = add i64 %134, %144
  %146 = add i64 %145, %140
  %sext7.us = shl i64 %146, 32
  %147 = ashr exact i64 %sext7.us, 32
  %148 = getelementptr inbounds float, float* %49, i64 %147
  %149 = bitcast float* %148 to i32*
  %.val.i8.us = load i32, i32* %149, align 4, !tbaa !42
  %150 = add nsw i32 %i.010.us, %137
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %151
  %153 = bitcast float addrspace(3)* %152 to i32 addrspace(3)*
  %154 = addrspacecast i32 addrspace(3)* %153 to i32*
  store i32 %.val.i8.us, i32* %154, align 4, !tbaa !42
  %155 = add i32 %135, %i.010.us
  %156 = icmp slt i32 %155, %7
  br i1 %156, label %141, label %._crit_edge.us, !llvm.loop !90

._crit_edge.us:                                   ; preds = %141
  %157 = add i32 %133, %j.011.us
  %158 = icmp slt i32 %157, %15
  br i1 %158, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !91

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit39:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit39, %._crit_edge15.loopexit, %124
  tail call void @llvm.cuda.syncthreads()
  %159 = sdiv i64 %125, %34
  br i1 %39, label %._crit_edge26, label %.lr.ph25

.lr.ph25:                                         ; preds = %._crit_edge15
  %160 = mul nsw i64 %159, %34
  %161 = sub nsw i64 %125, %160
  %162 = mul nsw i64 %38, %161
  %163 = mul nsw i64 %36, %159
  %164 = tail call i32 @llvm.ptx.read.tid.x() #5
  %165 = icmp sgt i32 %164, %6
  %166 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %167 = add i64 %162, %163
  br i1 %165, label %.lr.ph25.split.us.preheader, label %.preheader.lr.ph.preheader

.lr.ph25.split.us.preheader:                      ; preds = %.lr.ph25
  br label %.lr.ph25.split.us

.preheader.lr.ph.preheader:                       ; preds = %.lr.ph25
  %168 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %169 = load float, float* %kernel, align 4
  %170 = load float, float* %50, align 4
  %171 = load float, float* %51, align 4
  %172 = load float, float* %52, align 4
  %173 = load float, float* %54, align 4
  %174 = load float, float* %57, align 4
  %175 = load float, float* %60, align 4
  %176 = load float, float* %63, align 4
  %177 = load float, float* %66, align 4
  %178 = load float, float* %69, align 4
  %179 = load float, float* %72, align 4
  %180 = load float, float* %75, align 4
  %181 = load float, float* %78, align 4
  %182 = load float, float* %81, align 4
  %183 = load float, float* %84, align 4
  %184 = load float, float* %87, align 4
  %185 = load float, float* %90, align 4
  %186 = load float, float* %93, align 4
  %187 = load float, float* %96, align 4
  %188 = load float, float* %99, align 4
  %189 = load float, float* %102, align 4
  %190 = load float, float* %105, align 4
  %191 = load float, float* %108, align 4
  %192 = load float, float* %111, align 4
  %193 = load float, float* %114, align 4
  %194 = load float, float* %117, align 4
  %195 = load float, float* %120, align 4
  %196 = load float, float* %123, align 4
  br label %.preheader.lr.ph

.lr.ph25.split.us:                                ; preds = %.lr.ph25.split.us.preheader, %.lr.ph25.split.us
  %j1.022.us = phi i32 [ %197, %.lr.ph25.split.us ], [ %31, %.lr.ph25.split.us.preheader ]
  %197 = add i32 %166, %j1.022.us
  %198 = icmp sgt i32 %197, %14
  br i1 %198, label %._crit_edge26.loopexit, label %.lr.ph25.split.us, !llvm.loop !92

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %199, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %199 = add i32 %133, %j.011
  %200 = icmp slt i32 %199, %15
  br i1 %200, label %.lr.ph14.split, label %._crit_edge15.loopexit39, !llvm.loop !91

._crit_edge26.loopexit:                           ; preds = %.lr.ph25.split.us
  br label %._crit_edge26

._crit_edge26.loopexit38:                         ; preds = %._crit_edge21
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit38, %._crit_edge26.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %201 = add nsw i32 %p.027, %20
  %202 = icmp slt i32 %201, %numPlanes
  br i1 %202, label %124, label %._crit_edge30.loopexit

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge21
  %j1.022 = phi i32 [ %425, %._crit_edge21 ], [ %31, %.preheader.lr.ph.preheader ]
  %203 = add i32 %j1.022, %30
  %204 = add nsw i32 %j1.022, %9
  %205 = sext i32 %204 to i64
  %206 = mul nsw i64 %43, %205
  %207 = add i32 %203, 6
  %208 = mul nsw i32 %207, %7
  %209 = mul nsw i32 %203, %7
  %210 = add i32 %203, 1
  %211 = mul nsw i32 %210, %7
  %212 = add i32 %203, 2
  %213 = mul nsw i32 %212, %7
  %214 = add i32 %203, 3
  %215 = mul nsw i32 %214, %7
  %216 = add i32 %203, 4
  %217 = mul nsw i32 %216, %7
  %218 = add i32 %203, 5
  %219 = mul nsw i32 %218, %7
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %.preheader
  %i2.020 = phi i32 [ %164, %.preheader.lr.ph ], [ %423, %.preheader ]
  %220 = add nsw i32 %209, %i2.020
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %221
  %223 = addrspacecast float addrspace(3)* %222 to float*
  %224 = load float, float* %223, align 4, !tbaa !42
  %225 = fmul float %224, %169
  %226 = fadd float %225, 0.000000e+00
  %227 = add nsw i32 %220, 1
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %228
  %230 = addrspacecast float addrspace(3)* %229 to float*
  %231 = load float, float* %230, align 4, !tbaa !42
  %232 = fmul float %231, %170
  %233 = fadd float %226, %232
  %234 = add nsw i32 %220, 2
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %235
  %237 = addrspacecast float addrspace(3)* %236 to float*
  %238 = load float, float* %237, align 4, !tbaa !42
  %239 = fmul float %238, %171
  %240 = fadd float %233, %239
  %241 = add nsw i32 %220, 3
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %242
  %244 = addrspacecast float addrspace(3)* %243 to float*
  %245 = load float, float* %244, align 4, !tbaa !42
  %246 = fmul float %245, %172
  %247 = fadd float %240, %246
  %248 = add nsw i32 %211, %i2.020
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %249
  %251 = addrspacecast float addrspace(3)* %250 to float*
  %252 = load float, float* %251, align 4, !tbaa !42
  %253 = fmul float %252, %173
  %254 = fadd float %247, %253
  %255 = add nsw i32 %248, 1
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %256
  %258 = addrspacecast float addrspace(3)* %257 to float*
  %259 = load float, float* %258, align 4, !tbaa !42
  %260 = fmul float %259, %174
  %261 = fadd float %254, %260
  %262 = add nsw i32 %248, 2
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %263
  %265 = addrspacecast float addrspace(3)* %264 to float*
  %266 = load float, float* %265, align 4, !tbaa !42
  %267 = fmul float %266, %175
  %268 = fadd float %261, %267
  %269 = add nsw i32 %248, 3
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %270
  %272 = addrspacecast float addrspace(3)* %271 to float*
  %273 = load float, float* %272, align 4, !tbaa !42
  %274 = fmul float %273, %176
  %275 = fadd float %268, %274
  %276 = add nsw i32 %213, %i2.020
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %277
  %279 = addrspacecast float addrspace(3)* %278 to float*
  %280 = load float, float* %279, align 4, !tbaa !42
  %281 = fmul float %280, %177
  %282 = fadd float %275, %281
  %283 = add nsw i32 %276, 1
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %284
  %286 = addrspacecast float addrspace(3)* %285 to float*
  %287 = load float, float* %286, align 4, !tbaa !42
  %288 = fmul float %287, %178
  %289 = fadd float %282, %288
  %290 = add nsw i32 %276, 2
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %291
  %293 = addrspacecast float addrspace(3)* %292 to float*
  %294 = load float, float* %293, align 4, !tbaa !42
  %295 = fmul float %294, %179
  %296 = fadd float %289, %295
  %297 = add nsw i32 %276, 3
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %298
  %300 = addrspacecast float addrspace(3)* %299 to float*
  %301 = load float, float* %300, align 4, !tbaa !42
  %302 = fmul float %301, %180
  %303 = fadd float %296, %302
  %304 = add nsw i32 %215, %i2.020
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %305
  %307 = addrspacecast float addrspace(3)* %306 to float*
  %308 = load float, float* %307, align 4, !tbaa !42
  %309 = fmul float %308, %181
  %310 = fadd float %303, %309
  %311 = add nsw i32 %304, 1
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %312
  %314 = addrspacecast float addrspace(3)* %313 to float*
  %315 = load float, float* %314, align 4, !tbaa !42
  %316 = fmul float %315, %182
  %317 = fadd float %310, %316
  %318 = add nsw i32 %304, 2
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %319
  %321 = addrspacecast float addrspace(3)* %320 to float*
  %322 = load float, float* %321, align 4, !tbaa !42
  %323 = fmul float %322, %183
  %324 = fadd float %317, %323
  %325 = add nsw i32 %304, 3
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %326
  %328 = addrspacecast float addrspace(3)* %327 to float*
  %329 = load float, float* %328, align 4, !tbaa !42
  %330 = fmul float %329, %184
  %331 = fadd float %324, %330
  %332 = add nsw i32 %217, %i2.020
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %333
  %335 = addrspacecast float addrspace(3)* %334 to float*
  %336 = load float, float* %335, align 4, !tbaa !42
  %337 = fmul float %336, %185
  %338 = fadd float %331, %337
  %339 = add nsw i32 %332, 1
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %340
  %342 = addrspacecast float addrspace(3)* %341 to float*
  %343 = load float, float* %342, align 4, !tbaa !42
  %344 = fmul float %343, %186
  %345 = fadd float %338, %344
  %346 = add nsw i32 %332, 2
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %347
  %349 = addrspacecast float addrspace(3)* %348 to float*
  %350 = load float, float* %349, align 4, !tbaa !42
  %351 = fmul float %350, %187
  %352 = fadd float %345, %351
  %353 = add nsw i32 %332, 3
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %354
  %356 = addrspacecast float addrspace(3)* %355 to float*
  %357 = load float, float* %356, align 4, !tbaa !42
  %358 = fmul float %357, %188
  %359 = fadd float %352, %358
  %360 = add nsw i32 %219, %i2.020
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %361
  %363 = addrspacecast float addrspace(3)* %362 to float*
  %364 = load float, float* %363, align 4, !tbaa !42
  %365 = fmul float %364, %189
  %366 = fadd float %359, %365
  %367 = add nsw i32 %360, 1
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %368
  %370 = addrspacecast float addrspace(3)* %369 to float*
  %371 = load float, float* %370, align 4, !tbaa !42
  %372 = fmul float %371, %190
  %373 = fadd float %366, %372
  %374 = add nsw i32 %360, 2
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %375
  %377 = addrspacecast float addrspace(3)* %376 to float*
  %378 = load float, float* %377, align 4, !tbaa !42
  %379 = fmul float %378, %191
  %380 = fadd float %373, %379
  %381 = add nsw i32 %360, 3
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %382
  %384 = addrspacecast float addrspace(3)* %383 to float*
  %385 = load float, float* %384, align 4, !tbaa !42
  %386 = fmul float %385, %192
  %387 = fadd float %380, %386
  %388 = add nsw i32 %208, %i2.020
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %389
  %391 = addrspacecast float addrspace(3)* %390 to float*
  %392 = load float, float* %391, align 4, !tbaa !42
  %393 = fmul float %392, %193
  %394 = fadd float %387, %393
  %395 = add nsw i32 %388, 1
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %396
  %398 = addrspacecast float addrspace(3)* %397 to float*
  %399 = load float, float* %398, align 4, !tbaa !42
  %400 = fmul float %399, %194
  %401 = fadd float %394, %400
  %402 = add nsw i32 %388, 2
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %403
  %405 = addrspacecast float addrspace(3)* %404 to float*
  %406 = load float, float* %405, align 4, !tbaa !42
  %407 = fmul float %406, %195
  %408 = fadd float %401, %407
  %409 = add nsw i32 %388, 3
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %410
  %412 = addrspacecast float addrspace(3)* %411 to float*
  %413 = load float, float* %412, align 4, !tbaa !42
  %414 = fmul float %413, %196
  %415 = fadd float %408, %414
  %416 = add nsw i32 %i2.020, %2
  %417 = sext i32 %416 to i64
  %418 = mul nsw i64 %41, %417
  %419 = add i64 %167, %418
  %420 = add i64 %419, %206
  %sext5 = shl i64 %420, 32
  %421 = ashr exact i64 %sext5, 32
  %422 = getelementptr inbounds float, float* %buffer, i64 %421
  store float %415, float* %422, align 4, !tbaa !42
  %423 = add i32 %168, %i2.020
  %424 = icmp sgt i32 %423, %6
  br i1 %424, label %._crit_edge21, label %.preheader, !llvm.loop !93

._crit_edge21:                                    ; preds = %.preheader
  %425 = add i32 %166, %j1.022
  %426 = icmp sgt i32 %425, %14
  br i1 %426, label %._crit_edge26.loopexit38, label %.preheader.lr.ph, !llvm.loop !92
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.40"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 4
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, %kernelSizeY
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = icmp sgt i32 %kernelSizeY, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %50 = load float*, float** %49, align 8
  br label %51

._crit_edge33.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %0
  ret void

; <label>:51                                      ; preds = %.lr.ph32, %._crit_edge29
  %p.030 = phi i32 [ %22, %.lr.ph32 ], [ %97, %._crit_edge29 ]
  %52 = sext i32 %p.030 to i64
  %53 = sdiv i64 %52, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %51
  %54 = mul nsw i64 %53, %25
  %55 = sub nsw i64 %52, %54
  %56 = mul nsw i64 %29, %55
  %57 = mul nsw i64 %27, %53
  %58 = tail call i32 @llvm.ptx.read.tid.x() #5
  %59 = icmp slt i32 %58, %7
  %60 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %61 = add i64 %56, %57
  br i1 %59, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %62 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %84, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %63 = add nsw i32 %j.011.us, %30
  %64 = mul nsw i32 %63, %7
  %65 = add nsw i32 %j.011.us, %9
  %66 = sext i32 %65 to i64
  %67 = mul nsw i64 %48, %66
  br label %68

; <label>:68                                      ; preds = %.lr.ph14.split.us, %68
  %i.010.us = phi i32 [ %58, %.lr.ph14.split.us ], [ %82, %68 ]
  %69 = add nsw i32 %i.010.us, %2
  %70 = sext i32 %69 to i64
  %71 = mul nsw i64 %46, %70
  %72 = add i64 %61, %71
  %73 = add i64 %72, %67
  %sext7.us = shl i64 %73, 32
  %74 = ashr exact i64 %sext7.us, 32
  %75 = getelementptr inbounds float, float* %50, i64 %74
  %76 = bitcast float* %75 to i32*
  %.val.i8.us = load i32, i32* %76, align 4, !tbaa !42
  %77 = add nsw i32 %i.010.us, %64
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %78
  %80 = bitcast float addrspace(3)* %79 to i32 addrspace(3)*
  %81 = addrspacecast i32 addrspace(3)* %80 to i32*
  store i32 %.val.i8.us, i32* %81, align 4, !tbaa !42
  %82 = add i32 %62, %i.010.us
  %83 = icmp slt i32 %82, %7
  br i1 %83, label %68, label %._crit_edge.us, !llvm.loop !94

._crit_edge.us:                                   ; preds = %68
  %84 = add i32 %60, %j.011.us
  %85 = icmp slt i32 %84, %15
  br i1 %85, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !95

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit42:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit42, %._crit_edge15.loopexit, %51
  tail call void @llvm.cuda.syncthreads()
  %86 = sdiv i64 %52, %34
  br i1 %39, label %._crit_edge29, label %.lr.ph28

.lr.ph28:                                         ; preds = %._crit_edge15
  %87 = mul nsw i64 %86, %34
  %88 = sub nsw i64 %52, %87
  %89 = mul nsw i64 %38, %88
  %90 = mul nsw i64 %36, %86
  %91 = tail call i32 @llvm.ptx.read.tid.x() #5
  %92 = icmp sgt i32 %91, %6
  %93 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %94 = add i64 %89, %90
  br label %99

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %95, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %95 = add i32 %60, %j.011
  %96 = icmp slt i32 %95, %15
  br i1 %96, label %.lr.ph14.split, label %._crit_edge15.loopexit42, !llvm.loop !95

._crit_edge29.loopexit:                           ; preds = %._crit_edge24
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %97 = add nsw i32 %p.030, %20
  %98 = icmp slt i32 %97, %numPlanes
  br i1 %98, label %51, label %._crit_edge33.loopexit

; <label>:99                                      ; preds = %.lr.ph28, %._crit_edge24
  %j1.025 = phi i32 [ %31, %.lr.ph28 ], [ %162, %._crit_edge24 ]
  br i1 %92, label %._crit_edge24, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %99
  %100 = add nsw i32 %j1.025, %9
  %101 = sext i32 %100 to i64
  %102 = mul nsw i64 %44, %101
  %103 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %104 = add i32 %j1.025, %30
  br i1 %40, label %.lr.ph20.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.lr.ph20.us.preheader:                            ; preds = %.preheader.lr.ph
  br label %.lr.ph20.us

; <label>:105                                     ; preds = %105, %.lr.ph20.us
  %l.019.us = phi i32 [ 0, %.lr.ph20.us ], [ %152, %105 ]
  %result.018.us = phi float [ 0.000000e+00, %.lr.ph20.us ], [ %151, %105 ]
  %106 = mul nsw i32 %l.019.us, %kernelSizeX
  %107 = add i32 %104, %l.019.us
  %108 = mul nsw i32 %107, %7
  %109 = add nsw i32 %108, %i2.022.us
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %110
  %112 = addrspacecast float addrspace(3)* %111 to float*
  %113 = load float, float* %112, align 4, !tbaa !42
  %114 = sext i32 %106 to i64
  %115 = getelementptr inbounds float, float* %kernel, i64 %114
  %116 = load float, float* %115, align 4, !tbaa !42
  %117 = fmul float %113, %116
  %118 = fadd float %result.018.us, %117
  %119 = add nsw i32 %109, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %120
  %122 = addrspacecast float addrspace(3)* %121 to float*
  %123 = load float, float* %122, align 4, !tbaa !42
  %124 = add nsw i32 %106, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float* %kernel, i64 %125
  %127 = load float, float* %126, align 4, !tbaa !42
  %128 = fmul float %123, %127
  %129 = fadd float %118, %128
  %130 = add nsw i32 %109, 2
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %131
  %133 = addrspacecast float addrspace(3)* %132 to float*
  %134 = load float, float* %133, align 4, !tbaa !42
  %135 = add nsw i32 %106, 2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float* %kernel, i64 %136
  %138 = load float, float* %137, align 4, !tbaa !42
  %139 = fmul float %134, %138
  %140 = fadd float %129, %139
  %141 = add nsw i32 %109, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %142
  %144 = addrspacecast float addrspace(3)* %143 to float*
  %145 = load float, float* %144, align 4, !tbaa !42
  %146 = add nsw i32 %106, 3
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float* %kernel, i64 %147
  %149 = load float, float* %148, align 4, !tbaa !42
  %150 = fmul float %145, %149
  %151 = fadd float %140, %150
  %152 = add nuw nsw i32 %l.019.us, 1
  %exitcond36 = icmp eq i32 %152, %kernelSizeY
  br i1 %exitcond36, label %._crit_edge21.us, label %105, !llvm.loop !96

.lr.ph20.us:                                      ; preds = %.lr.ph20.us.preheader, %._crit_edge21.us
  %i2.022.us = phi i32 [ %160, %._crit_edge21.us ], [ %91, %.lr.ph20.us.preheader ]
  br label %105

._crit_edge21.us:                                 ; preds = %105
  %.lcssa = phi float [ %151, %105 ]
  %153 = add nsw i32 %i2.022.us, %2
  %154 = sext i32 %153 to i64
  %155 = mul nsw i64 %42, %154
  %156 = add i64 %94, %155
  %157 = add i64 %156, %102
  %sext5.us = shl i64 %157, 32
  %158 = ashr exact i64 %sext5.us, 32
  %159 = getelementptr inbounds float, float* %buffer, i64 %158
  store float %.lcssa, float* %159, align 4, !tbaa !42
  %160 = add i32 %103, %i2.022.us
  %161 = icmp sgt i32 %160, %6
  br i1 %161, label %._crit_edge24.loopexit, label %.lr.ph20.us, !llvm.loop !97

._crit_edge24.loopexit:                           ; preds = %._crit_edge21.us
  br label %._crit_edge24

._crit_edge24.loopexit41:                         ; preds = %.preheader
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit41, %._crit_edge24.loopexit, %99
  %162 = add i32 %93, %j1.025
  %163 = icmp sgt i32 %162, %14
  br i1 %163, label %._crit_edge29.loopexit, label %99, !llvm.loop !98

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %i2.022 = phi i32 [ %171, %.preheader ], [ %91, %.preheader.preheader ]
  %164 = add nsw i32 %i2.022, %2
  %165 = sext i32 %164 to i64
  %166 = mul nsw i64 %42, %165
  %167 = add i64 %94, %166
  %168 = add i64 %167, %102
  %sext5 = shl i64 %168, 32
  %169 = ashr exact i64 %sext5, 32
  %170 = getelementptr inbounds float, float* %buffer, i64 %169
  store float 0.000000e+00, float* %170, align 4, !tbaa !42
  %171 = add i32 %103, %i2.022
  %172 = icmp sgt i32 %171, %6
  br i1 %172, label %._crit_edge24.loopexit41, label %.preheader, !llvm.loop !97
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.40"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 7
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, 4
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph29, label %._crit_edge30

.lr.ph29:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %49 = load float*, float** %48, align 8
  %50 = getelementptr inbounds float, float* %kernel, i64 1
  %51 = getelementptr inbounds float, float* %kernel, i64 2
  %52 = getelementptr inbounds float, float* %kernel, i64 3
  %53 = getelementptr inbounds float, float* %kernel, i64 4
  %54 = getelementptr inbounds float, float* %kernel, i64 5
  %55 = getelementptr inbounds float, float* %kernel, i64 6
  %56 = sext i32 %kernelSizeX to i64
  %57 = getelementptr inbounds float, float* %kernel, i64 %56
  %58 = add nsw i32 %kernelSizeX, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float* %kernel, i64 %59
  %61 = add nsw i32 %kernelSizeX, 2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %kernel, i64 %62
  %64 = add nsw i32 %kernelSizeX, 3
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %kernel, i64 %65
  %67 = add nsw i32 %kernelSizeX, 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float* %kernel, i64 %68
  %70 = add nsw i32 %kernelSizeX, 5
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float* %kernel, i64 %71
  %73 = add nsw i32 %kernelSizeX, 6
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float* %kernel, i64 %74
  %76 = shl nsw i32 %kernelSizeX, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %kernel, i64 %77
  %79 = or i32 %76, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float* %kernel, i64 %80
  %82 = add nsw i32 %76, 2
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %kernel, i64 %83
  %85 = add nsw i32 %76, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float* %kernel, i64 %86
  %88 = add nsw i32 %76, 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %kernel, i64 %89
  %91 = add nsw i32 %76, 5
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float* %kernel, i64 %92
  %94 = add nsw i32 %76, 6
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float* %kernel, i64 %95
  %97 = mul nsw i32 %kernelSizeX, 3
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %kernel, i64 %98
  %100 = add nsw i32 %97, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float* %kernel, i64 %101
  %103 = add nsw i32 %97, 2
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float* %kernel, i64 %104
  %106 = add nsw i32 %97, 3
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float* %kernel, i64 %107
  %109 = add nsw i32 %97, 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float* %kernel, i64 %110
  %112 = add nsw i32 %97, 5
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float* %kernel, i64 %113
  %115 = add nsw i32 %97, 6
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float* %kernel, i64 %116
  br label %118

._crit_edge30.loopexit:                           ; preds = %._crit_edge26
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %0
  ret void

; <label>:118                                     ; preds = %.lr.ph29, %._crit_edge26
  %p.027 = phi i32 [ %22, %.lr.ph29 ], [ %195, %._crit_edge26 ]
  %119 = sext i32 %p.027 to i64
  %120 = sdiv i64 %119, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %118
  %121 = mul nsw i64 %120, %25
  %122 = sub nsw i64 %119, %121
  %123 = mul nsw i64 %29, %122
  %124 = mul nsw i64 %27, %120
  %125 = tail call i32 @llvm.ptx.read.tid.x() #5
  %126 = icmp slt i32 %125, %7
  %127 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %128 = add i64 %123, %124
  br i1 %126, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %129 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %151, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %130 = add nsw i32 %j.011.us, %30
  %131 = mul nsw i32 %130, %7
  %132 = add nsw i32 %j.011.us, %9
  %133 = sext i32 %132 to i64
  %134 = mul nsw i64 %47, %133
  br label %135

; <label>:135                                     ; preds = %.lr.ph14.split.us, %135
  %i.010.us = phi i32 [ %125, %.lr.ph14.split.us ], [ %149, %135 ]
  %136 = add nsw i32 %i.010.us, %2
  %137 = sext i32 %136 to i64
  %138 = mul nsw i64 %45, %137
  %139 = add i64 %128, %138
  %140 = add i64 %139, %134
  %sext7.us = shl i64 %140, 32
  %141 = ashr exact i64 %sext7.us, 32
  %142 = getelementptr inbounds float, float* %49, i64 %141
  %143 = bitcast float* %142 to i32*
  %.val.i8.us = load i32, i32* %143, align 4, !tbaa !42
  %144 = add nsw i32 %i.010.us, %131
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %145
  %147 = bitcast float addrspace(3)* %146 to i32 addrspace(3)*
  %148 = addrspacecast i32 addrspace(3)* %147 to i32*
  store i32 %.val.i8.us, i32* %148, align 4, !tbaa !42
  %149 = add i32 %129, %i.010.us
  %150 = icmp slt i32 %149, %7
  br i1 %150, label %135, label %._crit_edge.us, !llvm.loop !99

._crit_edge.us:                                   ; preds = %135
  %151 = add i32 %127, %j.011.us
  %152 = icmp slt i32 %151, %15
  br i1 %152, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !100

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit39:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit39, %._crit_edge15.loopexit, %118
  tail call void @llvm.cuda.syncthreads()
  %153 = sdiv i64 %119, %34
  br i1 %39, label %._crit_edge26, label %.lr.ph25

.lr.ph25:                                         ; preds = %._crit_edge15
  %154 = mul nsw i64 %153, %34
  %155 = sub nsw i64 %119, %154
  %156 = mul nsw i64 %38, %155
  %157 = mul nsw i64 %36, %153
  %158 = tail call i32 @llvm.ptx.read.tid.x() #5
  %159 = icmp sgt i32 %158, %6
  %160 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %161 = add i64 %156, %157
  br i1 %159, label %.lr.ph25.split.us.preheader, label %.preheader.lr.ph.preheader

.lr.ph25.split.us.preheader:                      ; preds = %.lr.ph25
  br label %.lr.ph25.split.us

.preheader.lr.ph.preheader:                       ; preds = %.lr.ph25
  %162 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %163 = load float, float* %kernel, align 4
  %164 = load float, float* %50, align 4
  %165 = load float, float* %51, align 4
  %166 = load float, float* %52, align 4
  %167 = load float, float* %53, align 4
  %168 = load float, float* %54, align 4
  %169 = load float, float* %55, align 4
  %170 = load float, float* %57, align 4
  %171 = load float, float* %60, align 4
  %172 = load float, float* %63, align 4
  %173 = load float, float* %66, align 4
  %174 = load float, float* %69, align 4
  %175 = load float, float* %72, align 4
  %176 = load float, float* %75, align 4
  %177 = load float, float* %78, align 4
  %178 = load float, float* %81, align 4
  %179 = load float, float* %84, align 4
  %180 = load float, float* %87, align 4
  %181 = load float, float* %90, align 4
  %182 = load float, float* %93, align 4
  %183 = load float, float* %96, align 4
  %184 = load float, float* %99, align 4
  %185 = load float, float* %102, align 4
  %186 = load float, float* %105, align 4
  %187 = load float, float* %108, align 4
  %188 = load float, float* %111, align 4
  %189 = load float, float* %114, align 4
  %190 = load float, float* %117, align 4
  br label %.preheader.lr.ph

.lr.ph25.split.us:                                ; preds = %.lr.ph25.split.us.preheader, %.lr.ph25.split.us
  %j1.022.us = phi i32 [ %191, %.lr.ph25.split.us ], [ %31, %.lr.ph25.split.us.preheader ]
  %191 = add i32 %160, %j1.022.us
  %192 = icmp sgt i32 %191, %14
  br i1 %192, label %._crit_edge26.loopexit, label %.lr.ph25.split.us, !llvm.loop !101

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %193, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %193 = add i32 %127, %j.011
  %194 = icmp slt i32 %193, %15
  br i1 %194, label %.lr.ph14.split, label %._crit_edge15.loopexit39, !llvm.loop !100

._crit_edge26.loopexit:                           ; preds = %.lr.ph25.split.us
  br label %._crit_edge26

._crit_edge26.loopexit38:                         ; preds = %._crit_edge21
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit38, %._crit_edge26.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %195 = add nsw i32 %p.027, %20
  %196 = icmp slt i32 %195, %numPlanes
  br i1 %196, label %118, label %._crit_edge30.loopexit

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge21
  %j1.022 = phi i32 [ %413, %._crit_edge21 ], [ %31, %.preheader.lr.ph.preheader ]
  %197 = add i32 %j1.022, %30
  %198 = add nsw i32 %j1.022, %9
  %199 = sext i32 %198 to i64
  %200 = mul nsw i64 %43, %199
  %201 = add i32 %197, 3
  %202 = mul nsw i32 %201, %7
  %203 = mul nsw i32 %197, %7
  %204 = add i32 %197, 1
  %205 = mul nsw i32 %204, %7
  %206 = add i32 %197, 2
  %207 = mul nsw i32 %206, %7
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %.preheader
  %i2.020 = phi i32 [ %158, %.preheader.lr.ph ], [ %411, %.preheader ]
  %208 = add nsw i32 %203, %i2.020
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %209
  %211 = addrspacecast float addrspace(3)* %210 to float*
  %212 = load float, float* %211, align 4, !tbaa !42
  %213 = fmul float %212, %163
  %214 = fadd float %213, 0.000000e+00
  %215 = add nsw i32 %208, 1
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %216
  %218 = addrspacecast float addrspace(3)* %217 to float*
  %219 = load float, float* %218, align 4, !tbaa !42
  %220 = fmul float %219, %164
  %221 = fadd float %214, %220
  %222 = add nsw i32 %208, 2
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %223
  %225 = addrspacecast float addrspace(3)* %224 to float*
  %226 = load float, float* %225, align 4, !tbaa !42
  %227 = fmul float %226, %165
  %228 = fadd float %221, %227
  %229 = add nsw i32 %208, 3
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %230
  %232 = addrspacecast float addrspace(3)* %231 to float*
  %233 = load float, float* %232, align 4, !tbaa !42
  %234 = fmul float %233, %166
  %235 = fadd float %228, %234
  %236 = add nsw i32 %208, 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %237
  %239 = addrspacecast float addrspace(3)* %238 to float*
  %240 = load float, float* %239, align 4, !tbaa !42
  %241 = fmul float %240, %167
  %242 = fadd float %235, %241
  %243 = add nsw i32 %208, 5
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %244
  %246 = addrspacecast float addrspace(3)* %245 to float*
  %247 = load float, float* %246, align 4, !tbaa !42
  %248 = fmul float %247, %168
  %249 = fadd float %242, %248
  %250 = add nsw i32 %208, 6
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %251
  %253 = addrspacecast float addrspace(3)* %252 to float*
  %254 = load float, float* %253, align 4, !tbaa !42
  %255 = fmul float %254, %169
  %256 = fadd float %249, %255
  %257 = add nsw i32 %205, %i2.020
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %258
  %260 = addrspacecast float addrspace(3)* %259 to float*
  %261 = load float, float* %260, align 4, !tbaa !42
  %262 = fmul float %261, %170
  %263 = fadd float %256, %262
  %264 = add nsw i32 %257, 1
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %265
  %267 = addrspacecast float addrspace(3)* %266 to float*
  %268 = load float, float* %267, align 4, !tbaa !42
  %269 = fmul float %268, %171
  %270 = fadd float %263, %269
  %271 = add nsw i32 %257, 2
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %272
  %274 = addrspacecast float addrspace(3)* %273 to float*
  %275 = load float, float* %274, align 4, !tbaa !42
  %276 = fmul float %275, %172
  %277 = fadd float %270, %276
  %278 = add nsw i32 %257, 3
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %279
  %281 = addrspacecast float addrspace(3)* %280 to float*
  %282 = load float, float* %281, align 4, !tbaa !42
  %283 = fmul float %282, %173
  %284 = fadd float %277, %283
  %285 = add nsw i32 %257, 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %286
  %288 = addrspacecast float addrspace(3)* %287 to float*
  %289 = load float, float* %288, align 4, !tbaa !42
  %290 = fmul float %289, %174
  %291 = fadd float %284, %290
  %292 = add nsw i32 %257, 5
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %293
  %295 = addrspacecast float addrspace(3)* %294 to float*
  %296 = load float, float* %295, align 4, !tbaa !42
  %297 = fmul float %296, %175
  %298 = fadd float %291, %297
  %299 = add nsw i32 %257, 6
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %300
  %302 = addrspacecast float addrspace(3)* %301 to float*
  %303 = load float, float* %302, align 4, !tbaa !42
  %304 = fmul float %303, %176
  %305 = fadd float %298, %304
  %306 = add nsw i32 %207, %i2.020
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %307
  %309 = addrspacecast float addrspace(3)* %308 to float*
  %310 = load float, float* %309, align 4, !tbaa !42
  %311 = fmul float %310, %177
  %312 = fadd float %305, %311
  %313 = add nsw i32 %306, 1
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %314
  %316 = addrspacecast float addrspace(3)* %315 to float*
  %317 = load float, float* %316, align 4, !tbaa !42
  %318 = fmul float %317, %178
  %319 = fadd float %312, %318
  %320 = add nsw i32 %306, 2
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %321
  %323 = addrspacecast float addrspace(3)* %322 to float*
  %324 = load float, float* %323, align 4, !tbaa !42
  %325 = fmul float %324, %179
  %326 = fadd float %319, %325
  %327 = add nsw i32 %306, 3
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %328
  %330 = addrspacecast float addrspace(3)* %329 to float*
  %331 = load float, float* %330, align 4, !tbaa !42
  %332 = fmul float %331, %180
  %333 = fadd float %326, %332
  %334 = add nsw i32 %306, 4
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %335
  %337 = addrspacecast float addrspace(3)* %336 to float*
  %338 = load float, float* %337, align 4, !tbaa !42
  %339 = fmul float %338, %181
  %340 = fadd float %333, %339
  %341 = add nsw i32 %306, 5
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %342
  %344 = addrspacecast float addrspace(3)* %343 to float*
  %345 = load float, float* %344, align 4, !tbaa !42
  %346 = fmul float %345, %182
  %347 = fadd float %340, %346
  %348 = add nsw i32 %306, 6
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %349
  %351 = addrspacecast float addrspace(3)* %350 to float*
  %352 = load float, float* %351, align 4, !tbaa !42
  %353 = fmul float %352, %183
  %354 = fadd float %347, %353
  %355 = add nsw i32 %202, %i2.020
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %356
  %358 = addrspacecast float addrspace(3)* %357 to float*
  %359 = load float, float* %358, align 4, !tbaa !42
  %360 = fmul float %359, %184
  %361 = fadd float %354, %360
  %362 = add nsw i32 %355, 1
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %363
  %365 = addrspacecast float addrspace(3)* %364 to float*
  %366 = load float, float* %365, align 4, !tbaa !42
  %367 = fmul float %366, %185
  %368 = fadd float %361, %367
  %369 = add nsw i32 %355, 2
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %370
  %372 = addrspacecast float addrspace(3)* %371 to float*
  %373 = load float, float* %372, align 4, !tbaa !42
  %374 = fmul float %373, %186
  %375 = fadd float %368, %374
  %376 = add nsw i32 %355, 3
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %377
  %379 = addrspacecast float addrspace(3)* %378 to float*
  %380 = load float, float* %379, align 4, !tbaa !42
  %381 = fmul float %380, %187
  %382 = fadd float %375, %381
  %383 = add nsw i32 %355, 4
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %384
  %386 = addrspacecast float addrspace(3)* %385 to float*
  %387 = load float, float* %386, align 4, !tbaa !42
  %388 = fmul float %387, %188
  %389 = fadd float %382, %388
  %390 = add nsw i32 %355, 5
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %391
  %393 = addrspacecast float addrspace(3)* %392 to float*
  %394 = load float, float* %393, align 4, !tbaa !42
  %395 = fmul float %394, %189
  %396 = fadd float %389, %395
  %397 = add nsw i32 %355, 6
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %398
  %400 = addrspacecast float addrspace(3)* %399 to float*
  %401 = load float, float* %400, align 4, !tbaa !42
  %402 = fmul float %401, %190
  %403 = fadd float %396, %402
  %404 = add nsw i32 %i2.020, %2
  %405 = sext i32 %404 to i64
  %406 = mul nsw i64 %41, %405
  %407 = add i64 %161, %406
  %408 = add i64 %407, %200
  %sext5 = shl i64 %408, 32
  %409 = ashr exact i64 %sext5, 32
  %410 = getelementptr inbounds float, float* %buffer, i64 %409
  store float %403, float* %410, align 4, !tbaa !42
  %411 = add i32 %162, %i2.020
  %412 = icmp sgt i32 %411, %6
  br i1 %412, label %._crit_edge21, label %.preheader, !llvm.loop !102

._crit_edge21:                                    ; preds = %.preheader
  %413 = add i32 %160, %j1.022
  %414 = icmp sgt i32 %413, %14
  br i1 %414, label %._crit_edge26.loopexit38, label %.preheader.lr.ph, !llvm.loop !101
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.40"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, 7
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, %kernelSizeY
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = icmp sgt i32 %kernelSizeY, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %50 = load float*, float** %49, align 8
  br label %51

._crit_edge33.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %0
  ret void

; <label>:51                                      ; preds = %.lr.ph32, %._crit_edge29
  %p.030 = phi i32 [ %22, %.lr.ph32 ], [ %97, %._crit_edge29 ]
  %52 = sext i32 %p.030 to i64
  %53 = sdiv i64 %52, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %51
  %54 = mul nsw i64 %53, %25
  %55 = sub nsw i64 %52, %54
  %56 = mul nsw i64 %29, %55
  %57 = mul nsw i64 %27, %53
  %58 = tail call i32 @llvm.ptx.read.tid.x() #5
  %59 = icmp slt i32 %58, %7
  %60 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %61 = add i64 %56, %57
  br i1 %59, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %62 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %84, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %63 = add nsw i32 %j.011.us, %30
  %64 = mul nsw i32 %63, %7
  %65 = add nsw i32 %j.011.us, %9
  %66 = sext i32 %65 to i64
  %67 = mul nsw i64 %48, %66
  br label %68

; <label>:68                                      ; preds = %.lr.ph14.split.us, %68
  %i.010.us = phi i32 [ %58, %.lr.ph14.split.us ], [ %82, %68 ]
  %69 = add nsw i32 %i.010.us, %2
  %70 = sext i32 %69 to i64
  %71 = mul nsw i64 %46, %70
  %72 = add i64 %61, %71
  %73 = add i64 %72, %67
  %sext7.us = shl i64 %73, 32
  %74 = ashr exact i64 %sext7.us, 32
  %75 = getelementptr inbounds float, float* %50, i64 %74
  %76 = bitcast float* %75 to i32*
  %.val.i8.us = load i32, i32* %76, align 4, !tbaa !42
  %77 = add nsw i32 %i.010.us, %64
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %78
  %80 = bitcast float addrspace(3)* %79 to i32 addrspace(3)*
  %81 = addrspacecast i32 addrspace(3)* %80 to i32*
  store i32 %.val.i8.us, i32* %81, align 4, !tbaa !42
  %82 = add i32 %62, %i.010.us
  %83 = icmp slt i32 %82, %7
  br i1 %83, label %68, label %._crit_edge.us, !llvm.loop !103

._crit_edge.us:                                   ; preds = %68
  %84 = add i32 %60, %j.011.us
  %85 = icmp slt i32 %84, %15
  br i1 %85, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !104

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit42:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit42, %._crit_edge15.loopexit, %51
  tail call void @llvm.cuda.syncthreads()
  %86 = sdiv i64 %52, %34
  br i1 %39, label %._crit_edge29, label %.lr.ph28

.lr.ph28:                                         ; preds = %._crit_edge15
  %87 = mul nsw i64 %86, %34
  %88 = sub nsw i64 %52, %87
  %89 = mul nsw i64 %38, %88
  %90 = mul nsw i64 %36, %86
  %91 = tail call i32 @llvm.ptx.read.tid.x() #5
  %92 = icmp sgt i32 %91, %6
  %93 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %94 = add i64 %89, %90
  br label %99

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %95, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %95 = add i32 %60, %j.011
  %96 = icmp slt i32 %95, %15
  br i1 %96, label %.lr.ph14.split, label %._crit_edge15.loopexit42, !llvm.loop !104

._crit_edge29.loopexit:                           ; preds = %._crit_edge24
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %97 = add nsw i32 %p.030, %20
  %98 = icmp slt i32 %97, %numPlanes
  br i1 %98, label %51, label %._crit_edge33.loopexit

; <label>:99                                      ; preds = %.lr.ph28, %._crit_edge24
  %j1.025 = phi i32 [ %31, %.lr.ph28 ], [ %195, %._crit_edge24 ]
  br i1 %92, label %._crit_edge24, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %99
  %100 = add nsw i32 %j1.025, %9
  %101 = sext i32 %100 to i64
  %102 = mul nsw i64 %44, %101
  %103 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %104 = add i32 %j1.025, %30
  br i1 %40, label %.lr.ph20.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.lr.ph20.us.preheader:                            ; preds = %.preheader.lr.ph
  br label %.lr.ph20.us

; <label>:105                                     ; preds = %105, %.lr.ph20.us
  %l.019.us = phi i32 [ 0, %.lr.ph20.us ], [ %185, %105 ]
  %result.018.us = phi float [ 0.000000e+00, %.lr.ph20.us ], [ %184, %105 ]
  %106 = mul nsw i32 %l.019.us, %kernelSizeX
  %107 = add i32 %104, %l.019.us
  %108 = mul nsw i32 %107, %7
  %109 = add nsw i32 %108, %i2.022.us
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %110
  %112 = addrspacecast float addrspace(3)* %111 to float*
  %113 = load float, float* %112, align 4, !tbaa !42
  %114 = sext i32 %106 to i64
  %115 = getelementptr inbounds float, float* %kernel, i64 %114
  %116 = load float, float* %115, align 4, !tbaa !42
  %117 = fmul float %113, %116
  %118 = fadd float %result.018.us, %117
  %119 = add nsw i32 %109, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %120
  %122 = addrspacecast float addrspace(3)* %121 to float*
  %123 = load float, float* %122, align 4, !tbaa !42
  %124 = add nsw i32 %106, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float* %kernel, i64 %125
  %127 = load float, float* %126, align 4, !tbaa !42
  %128 = fmul float %123, %127
  %129 = fadd float %118, %128
  %130 = add nsw i32 %109, 2
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %131
  %133 = addrspacecast float addrspace(3)* %132 to float*
  %134 = load float, float* %133, align 4, !tbaa !42
  %135 = add nsw i32 %106, 2
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float* %kernel, i64 %136
  %138 = load float, float* %137, align 4, !tbaa !42
  %139 = fmul float %134, %138
  %140 = fadd float %129, %139
  %141 = add nsw i32 %109, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %142
  %144 = addrspacecast float addrspace(3)* %143 to float*
  %145 = load float, float* %144, align 4, !tbaa !42
  %146 = add nsw i32 %106, 3
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float* %kernel, i64 %147
  %149 = load float, float* %148, align 4, !tbaa !42
  %150 = fmul float %145, %149
  %151 = fadd float %140, %150
  %152 = add nsw i32 %109, 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %153
  %155 = addrspacecast float addrspace(3)* %154 to float*
  %156 = load float, float* %155, align 4, !tbaa !42
  %157 = add nsw i32 %106, 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float* %kernel, i64 %158
  %160 = load float, float* %159, align 4, !tbaa !42
  %161 = fmul float %156, %160
  %162 = fadd float %151, %161
  %163 = add nsw i32 %109, 5
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %164
  %166 = addrspacecast float addrspace(3)* %165 to float*
  %167 = load float, float* %166, align 4, !tbaa !42
  %168 = add nsw i32 %106, 5
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float* %kernel, i64 %169
  %171 = load float, float* %170, align 4, !tbaa !42
  %172 = fmul float %167, %171
  %173 = fadd float %162, %172
  %174 = add nsw i32 %109, 6
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %175
  %177 = addrspacecast float addrspace(3)* %176 to float*
  %178 = load float, float* %177, align 4, !tbaa !42
  %179 = add nsw i32 %106, 6
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float* %kernel, i64 %180
  %182 = load float, float* %181, align 4, !tbaa !42
  %183 = fmul float %178, %182
  %184 = fadd float %173, %183
  %185 = add nuw nsw i32 %l.019.us, 1
  %exitcond36 = icmp eq i32 %185, %kernelSizeY
  br i1 %exitcond36, label %._crit_edge21.us, label %105, !llvm.loop !105

.lr.ph20.us:                                      ; preds = %.lr.ph20.us.preheader, %._crit_edge21.us
  %i2.022.us = phi i32 [ %193, %._crit_edge21.us ], [ %91, %.lr.ph20.us.preheader ]
  br label %105

._crit_edge21.us:                                 ; preds = %105
  %.lcssa = phi float [ %184, %105 ]
  %186 = add nsw i32 %i2.022.us, %2
  %187 = sext i32 %186 to i64
  %188 = mul nsw i64 %42, %187
  %189 = add i64 %94, %188
  %190 = add i64 %189, %102
  %sext5.us = shl i64 %190, 32
  %191 = ashr exact i64 %sext5.us, 32
  %192 = getelementptr inbounds float, float* %buffer, i64 %191
  store float %.lcssa, float* %192, align 4, !tbaa !42
  %193 = add i32 %103, %i2.022.us
  %194 = icmp sgt i32 %193, %6
  br i1 %194, label %._crit_edge24.loopexit, label %.lr.ph20.us, !llvm.loop !106

._crit_edge24.loopexit:                           ; preds = %._crit_edge21.us
  br label %._crit_edge24

._crit_edge24.loopexit41:                         ; preds = %.preheader
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit41, %._crit_edge24.loopexit, %99
  %195 = add i32 %93, %j1.025
  %196 = icmp sgt i32 %195, %14
  br i1 %196, label %._crit_edge29.loopexit, label %99, !llvm.loop !107

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %i2.022 = phi i32 [ %204, %.preheader ], [ %91, %.preheader.preheader ]
  %197 = add nsw i32 %i2.022, %2
  %198 = sext i32 %197 to i64
  %199 = mul nsw i64 %42, %198
  %200 = add i64 %94, %199
  %201 = add i64 %200, %102
  %sext5 = shl i64 %201, 32
  %202 = ashr exact i64 %sext5, 32
  %203 = getelementptr inbounds float, float* %buffer, i64 %202
  store float 0.000000e+00, float* %203, align 4, !tbaa !42
  %204 = add i32 %103, %i2.022
  %205 = icmp sgt i32 %204, %6
  br i1 %205, label %._crit_edge24.loopexit41, label %.preheader, !llvm.loop !106
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.40"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i32 %numPlanes, i32 %numX, i32 %maxX, i32 %numY, i32 %maxY, i32 %kernelSizeX, i32 %kernelSizeY, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = mul i32 %1, %maxX
  %3 = add nsw i32 %2, %maxX
  %4 = icmp slt i32 %3, %numX
  %.numX = select i1 %4, i32 %3, i32 %numX
  %5 = xor i32 %2, -1
  %6 = add i32 %.numX, %5
  %7 = add nsw i32 %6, %kernelSizeX
  %8 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %9 = mul i32 %8, %maxY
  %10 = add nsw i32 %9, %maxY
  %11 = icmp slt i32 %10, %numY
  %12 = select i1 %11, i32 %10, i32 %numY
  %13 = xor i32 %9, -1
  %14 = add i32 %12, %13
  %15 = add nsw i32 %14, %kernelSizeY
  %16 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %17 = tail call i32 @llvm.ptx.read.ntid.z() #5
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.ptx.read.nctaid.z() #5
  %20 = mul i32 %19, %17
  %21 = tail call i32 @llvm.ptx.read.tid.z() #5
  %22 = add i32 %21, %18
  %23 = icmp slt i32 %22, %numPlanes
  br i1 %23, label %.lr.ph36, label %._crit_edge37

.lr.ph36:                                         ; preds = %0
  %24 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 2, i32 0, i64 0
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %29 = load i64, i64* %28, align 8
  %30 = mul i32 %15, %21
  %31 = tail call i32 @llvm.ptx.read.tid.y() #5
  %32 = icmp slt i32 %31, %15
  %33 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 3, i32 0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i32 %31, %14
  %40 = icmp sgt i32 %kernelSizeY, 0
  %41 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %44 = load i64, i64* %43, align 8
  %45 = icmp sgt i32 %kernelSizeX, 0
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.40", %"class.Eigen::internal::IndexMapper.40"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %51 = load float*, float** %50, align 8
  %xtraiter = and i32 %kernelSizeX, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %52 = icmp eq i32 %kernelSizeX, 1
  br label %53

._crit_edge37.loopexit:                           ; preds = %._crit_edge33
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %0
  ret void

; <label>:53                                      ; preds = %.lr.ph36, %._crit_edge33
  %p.034 = phi i32 [ %22, %.lr.ph36 ], [ %99, %._crit_edge33 ]
  %54 = sext i32 %p.034 to i64
  %55 = sdiv i64 %54, %25
  br i1 %32, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %53
  %56 = mul nsw i64 %55, %25
  %57 = sub nsw i64 %54, %56
  %58 = mul nsw i64 %29, %57
  %59 = mul nsw i64 %27, %55
  %60 = tail call i32 @llvm.ptx.read.tid.x() #5
  %61 = icmp slt i32 %60, %7
  %62 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %63 = add i64 %58, %59
  br i1 %61, label %.lr.ph14.split.us.preheader, label %.lr.ph14.split.preheader

.lr.ph14.split.preheader:                         ; preds = %.lr.ph14
  br label %.lr.ph14.split

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %64 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %j.011.us = phi i32 [ %86, %._crit_edge.us ], [ %31, %.lr.ph14.split.us.preheader ]
  %65 = add nsw i32 %j.011.us, %30
  %66 = mul nsw i32 %65, %7
  %67 = add nsw i32 %j.011.us, %9
  %68 = sext i32 %67 to i64
  %69 = mul nsw i64 %49, %68
  br label %70

; <label>:70                                      ; preds = %.lr.ph14.split.us, %70
  %i.010.us = phi i32 [ %60, %.lr.ph14.split.us ], [ %84, %70 ]
  %71 = add nsw i32 %i.010.us, %2
  %72 = sext i32 %71 to i64
  %73 = mul nsw i64 %47, %72
  %74 = add i64 %63, %73
  %75 = add i64 %74, %69
  %sext7.us = shl i64 %75, 32
  %76 = ashr exact i64 %sext7.us, 32
  %77 = getelementptr inbounds float, float* %51, i64 %76
  %78 = bitcast float* %77 to i32*
  %.val.i8.us = load i32, i32* %78, align 4, !tbaa !42
  %79 = add nsw i32 %i.010.us, %66
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %80
  %82 = bitcast float addrspace(3)* %81 to i32 addrspace(3)*
  %83 = addrspacecast i32 addrspace(3)* %82 to i32*
  store i32 %.val.i8.us, i32* %83, align 4, !tbaa !42
  %84 = add i32 %64, %i.010.us
  %85 = icmp slt i32 %84, %7
  br i1 %85, label %70, label %._crit_edge.us, !llvm.loop !108

._crit_edge.us:                                   ; preds = %70
  %86 = add i32 %62, %j.011.us
  %87 = icmp slt i32 %86, %15
  br i1 %87, label %.lr.ph14.split.us, label %._crit_edge15.loopexit, !llvm.loop !109

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15.loopexit61:                         ; preds = %.lr.ph14.split
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit61, %._crit_edge15.loopexit, %53
  tail call void @llvm.cuda.syncthreads()
  %88 = sdiv i64 %54, %34
  br i1 %39, label %._crit_edge33, label %.lr.ph32

.lr.ph32:                                         ; preds = %._crit_edge15
  %89 = mul nsw i64 %88, %34
  %90 = sub nsw i64 %54, %89
  %91 = mul nsw i64 %38, %90
  %92 = mul nsw i64 %36, %88
  %93 = tail call i32 @llvm.ptx.read.tid.x() #5
  %94 = icmp sgt i32 %93, %6
  %95 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %96 = add i64 %91, %92
  br label %101

.lr.ph14.split:                                   ; preds = %.lr.ph14.split.preheader, %.lr.ph14.split
  %j.011 = phi i32 [ %97, %.lr.ph14.split ], [ %31, %.lr.ph14.split.preheader ]
  %97 = add i32 %62, %j.011
  %98 = icmp slt i32 %97, %15
  br i1 %98, label %.lr.ph14.split, label %._crit_edge15.loopexit61, !llvm.loop !109

._crit_edge33.loopexit:                           ; preds = %._crit_edge28
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %._crit_edge15
  tail call void @llvm.cuda.syncthreads()
  %99 = add nsw i32 %p.034, %20
  %100 = icmp slt i32 %99, %numPlanes
  br i1 %100, label %53, label %._crit_edge37.loopexit

; <label>:101                                     ; preds = %.lr.ph32, %._crit_edge28
  %j1.029 = phi i32 [ %31, %.lr.ph32 ], [ %155, %._crit_edge28 ]
  br i1 %94, label %._crit_edge28, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %101
  %102 = add nsw i32 %j1.029, %9
  %103 = sext i32 %102 to i64
  %104 = mul nsw i64 %44, %103
  %105 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %106 = add i32 %j1.029, %30
  br i1 %40, label %.lr.ph23.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.lr.ph23.us.preheader:                            ; preds = %.preheader.lr.ph
  br label %.lr.ph23.us

.lr.ph23.us:                                      ; preds = %.lr.ph23.us.preheader, %._crit_edge24.us
  %i2.026.us = phi i32 [ %114, %._crit_edge24.us ], [ %93, %.lr.ph23.us.preheader ]
  br i1 %45, label %.lr.ph19.us.us.preheader, label %._crit_edge24.us

.lr.ph19.us.us.preheader:                         ; preds = %.lr.ph23.us
  br label %.lr.ph19.us.us

._crit_edge24.us.loopexit:                        ; preds = %._crit_edge20.us.us
  %.lcssa.lcssa = phi float [ %.lcssa, %._crit_edge20.us.us ]
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.lr.ph23.us
  %split25.us = phi float [ 0.000000e+00, %.lr.ph23.us ], [ %.lcssa.lcssa, %._crit_edge24.us.loopexit ]
  %107 = add nsw i32 %i2.026.us, %2
  %108 = sext i32 %107 to i64
  %109 = mul nsw i64 %42, %108
  %110 = add i64 %96, %109
  %111 = add i64 %110, %104
  %sext5.us = shl i64 %111, 32
  %112 = ashr exact i64 %sext5.us, 32
  %113 = getelementptr inbounds float, float* %buffer, i64 %112
  store float %split25.us, float* %113, align 4, !tbaa !42
  %114 = add i32 %105, %i2.026.us
  %115 = icmp sgt i32 %114, %6
  br i1 %115, label %._crit_edge28.loopexit, label %.lr.ph23.us, !llvm.loop !110

.lr.ph19.us.us:                                   ; preds = %.lr.ph19.us.us.preheader, %._crit_edge20.us.us
  %l.022.us.us = phi i32 [ %130, %._crit_edge20.us.us ], [ 0, %.lr.ph19.us.us.preheader ]
  %result.021.us.us = phi float [ %.lcssa, %._crit_edge20.us.us ], [ 0.000000e+00, %.lr.ph19.us.us.preheader ]
  %116 = mul nsw i32 %l.022.us.us, %kernelSizeX
  %117 = add i32 %106, %l.022.us.us
  %118 = mul nsw i32 %117, %7
  %119 = add nsw i32 %118, %i2.026.us
  br i1 %lcmp.mod, label %.lr.ph19.us.us.split, label %120

; <label>:120                                     ; preds = %.lr.ph19.us.us
  %121 = sext i32 %119 to i64
  %122 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %121
  %123 = addrspacecast float addrspace(3)* %122 to float*
  %124 = load float, float* %123, align 4, !tbaa !42
  %125 = sext i32 %116 to i64
  %126 = getelementptr inbounds float, float* %kernel, i64 %125
  %127 = load float, float* %126, align 4, !tbaa !42
  %128 = fmul float %124, %127
  %129 = fadd float %result.021.us.us, %128
  br label %.lr.ph19.us.us.split

.lr.ph19.us.us.split:                             ; preds = %.lr.ph19.us.us, %120
  %k.017.us.us.unr = phi i32 [ 0, %.lr.ph19.us.us ], [ 1, %120 ]
  %result.116.us.us.unr = phi float [ %result.021.us.us, %.lr.ph19.us.us ], [ %129, %120 ]
  %.lcssa.unr = phi float [ undef, %.lr.ph19.us.us ], [ %129, %120 ]
  br i1 %52, label %._crit_edge20.us.us, label %.lr.ph19.us.us.split.split.preheader

.lr.ph19.us.us.split.split.preheader:             ; preds = %.lr.ph19.us.us.split
  br label %.lr.ph19.us.us.split.split

._crit_edge20.us.us.loopexit:                     ; preds = %.lr.ph19.us.us.split.split
  %.lcssa63 = phi float [ %153, %.lr.ph19.us.us.split.split ]
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %.lr.ph19.us.us.split
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph19.us.us.split ], [ %.lcssa63, %._crit_edge20.us.us.loopexit ]
  %130 = add nuw nsw i32 %l.022.us.us, 1
  %exitcond53 = icmp eq i32 %130, %kernelSizeY
  br i1 %exitcond53, label %._crit_edge24.us.loopexit, label %.lr.ph19.us.us, !llvm.loop !111

.lr.ph19.us.us.split.split:                       ; preds = %.lr.ph19.us.us.split.split.preheader, %.lr.ph19.us.us.split.split
  %k.017.us.us = phi i32 [ %154, %.lr.ph19.us.us.split.split ], [ %k.017.us.us.unr, %.lr.ph19.us.us.split.split.preheader ]
  %result.116.us.us = phi float [ %153, %.lr.ph19.us.us.split.split ], [ %result.116.us.us.unr, %.lr.ph19.us.us.split.split.preheader ]
  %131 = add nsw i32 %119, %k.017.us.us
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %132
  %134 = addrspacecast float addrspace(3)* %133 to float*
  %135 = load float, float* %134, align 4, !tbaa !42
  %136 = add nsw i32 %k.017.us.us, %116
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float* %kernel, i64 %137
  %139 = load float, float* %138, align 4, !tbaa !42
  %140 = fmul float %135, %139
  %141 = fadd float %result.116.us.us, %140
  %142 = add nuw nsw i32 %k.017.us.us, 1
  %143 = add nsw i32 %119, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %144
  %146 = addrspacecast float addrspace(3)* %145 to float*
  %147 = load float, float* %146, align 4, !tbaa !42
  %148 = add nsw i32 %142, %116
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float* %kernel, i64 %149
  %151 = load float, float* %150, align 4, !tbaa !42
  %152 = fmul float %147, %151
  %153 = fadd float %141, %152
  %154 = add nsw i32 %k.017.us.us, 2
  %exitcond52.1 = icmp eq i32 %154, %kernelSizeX
  br i1 %exitcond52.1, label %._crit_edge20.us.us.loopexit, label %.lr.ph19.us.us.split.split, !llvm.loop !112

._crit_edge28.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge28

._crit_edge28.loopexit60:                         ; preds = %.preheader
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit60, %._crit_edge28.loopexit, %101
  %155 = add i32 %95, %j1.029
  %156 = icmp sgt i32 %155, %14
  br i1 %156, label %._crit_edge33.loopexit, label %101, !llvm.loop !113

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %i2.026 = phi i32 [ %164, %.preheader ], [ %93, %.preheader.preheader ]
  %157 = add nsw i32 %i2.026, %2
  %158 = sext i32 %157 to i64
  %159 = mul nsw i64 %42, %158
  %160 = add i64 %96, %159
  %161 = add i64 %160, %104
  %sext5 = shl i64 %161, 32
  %162 = ashr exact i64 %sext5, 32
  %163 = getelementptr inbounds float, float* %buffer, i64 %162
  store float 0.000000e+00, float* %163, align 4, !tbaa !42
  %164 = add i32 %105, %i2.026
  %165 = icmp sgt i32 %164, %6
  br i1 %165, label %._crit_edge28.loopexit60, label %.preheader, !llvm.loop !110
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf(%"struct.Eigen::TensorEvaluator.38"* byval nocapture readonly align 8 %eval, %"class.Eigen::internal::IndexMapper.41"* byval nocapture readonly align 8 %indexMapper, float* noalias nocapture readonly %kernel, i64 %numPlanes, i64 %numX, i64 %maxX, i64 %numY, i64 %maxY, i64 %numZ, i64 %maxZ, i64 %kernelSizeX, i64 %kernelSizeY, i64 %kernelSizeZ, float* nocapture %buffer) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = zext i32 %1 to i64
  %3 = mul i64 %2, %maxX
  %4 = trunc i64 %3 to i32
  %sext = shl i64 %3, 32
  %5 = ashr exact i64 %sext, 32
  %6 = add i64 %5, %maxX
  %7 = icmp ult i64 %6, %numX
  %.numX = select i1 %7, i64 %6, i64 %numX
  %8 = add i64 %.numX, 4294967295
  %9 = trunc i64 %8 to i32
  %10 = sub nsw i32 %9, %4
  %11 = zext i32 %10 to i64
  %12 = add i64 %11, %kernelSizeX
  %13 = trunc i64 %12 to i32
  %14 = tail call i32 @llvm.ptx.read.ctaid.y() #5
  %15 = zext i32 %14 to i64
  %16 = mul i64 %15, %maxY
  %17 = trunc i64 %16 to i32
  %sext5 = shl i64 %16, 32
  %18 = ashr exact i64 %sext5, 32
  %19 = add i64 %18, %maxY
  %20 = icmp ult i64 %19, %numY
  %21 = select i1 %20, i64 %19, i64 %numY
  %22 = add i64 %21, 4294967295
  %23 = trunc i64 %22 to i32
  %24 = sub nsw i32 %23, %17
  %25 = zext i32 %24 to i64
  %26 = add i64 %25, %kernelSizeY
  %27 = trunc i64 %26 to i32
  %28 = tail call i32 @llvm.ptx.read.ctaid.z() #5
  %29 = zext i32 %28 to i64
  %30 = mul i64 %29, %maxZ
  %31 = trunc i64 %30 to i32
  %sext6 = shl i64 %30, 32
  %32 = ashr exact i64 %sext6, 32
  %33 = add i64 %32, %maxZ
  %34 = icmp ult i64 %33, %numZ
  %.numZ = select i1 %34, i64 %33, i64 %numZ
  %35 = add i64 %.numZ, 4294967295
  %36 = trunc i64 %35 to i32
  %37 = sub nsw i32 %36, %31
  %38 = zext i32 %37 to i64
  %39 = add i64 %38, %kernelSizeZ
  %40 = trunc i64 %39 to i32
  %41 = icmp eq i64 %numPlanes, 0
  br i1 %41, label %._crit_edge55, label %.lr.ph54

.lr.ph54:                                         ; preds = %0
  %42 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 0, i32 0, i64 0
  %43 = load i64, i64* %42, align 8
  %44 = tail call i32 @llvm.ptx.read.tid.z() #5
  %45 = icmp slt i32 %44, %40
  %46 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 1, i32 0, i64 0
  %47 = load i64, i64* %46, align 8
  %48 = icmp sgt i32 %44, %37
  %49 = icmp eq i64 %kernelSizeZ, 0
  %50 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 1, i32 0, i64 1
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 1, i32 0, i64 2
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 1, i32 0, i64 3
  %55 = load i64, i64* %54, align 8
  %56 = icmp eq i64 %kernelSizeY, 0
  %57 = icmp eq i64 %kernelSizeX, 0
  %58 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 0, i32 0, i64 1
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 0, i32 0, i64 2
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds %"class.Eigen::internal::IndexMapper.41", %"class.Eigen::internal::IndexMapper.41"* %indexMapper, i64 0, i32 0, i32 0, i64 3
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %eval, i64 0, i32 0
  %65 = load float*, float** %64, align 8
  %brmerge = or i1 %49, %56
  %xtraiter = and i64 %kernelSizeX, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %66 = icmp eq i64 %kernelSizeX, 1
  br label %67

._crit_edge55.loopexit:                           ; preds = %._crit_edge51
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %0
  ret void

; <label>:67                                      ; preds = %.lr.ph54, %._crit_edge51
  %68 = phi i64 [ 0, %.lr.ph54 ], [ %116, %._crit_edge51 ]
  %p.052 = phi i32 [ 0, %.lr.ph54 ], [ %115, %._crit_edge51 ]
  %69 = mul nsw i64 %43, %68
  br i1 %45, label %.lr.ph23, label %._crit_edge24

.lr.ph23:                                         ; preds = %67
  %70 = tail call i32 @llvm.ptx.read.tid.y() #5
  %71 = icmp slt i32 %70, %27
  %72 = tail call i32 @llvm.ptx.read.ntid.z() #5
  br i1 %71, label %.lr.ph18.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  br label %.lr.ph23.split

.lr.ph18.us.preheader:                            ; preds = %.lr.ph23
  %73 = tail call i32 @llvm.ptx.read.tid.x() #5
  %74 = icmp slt i32 %73, %13
  %75 = tail call i32 @llvm.ptx.read.ntid.y() #5
  br label %.lr.ph18.us

.lr.ph18..lr.ph18.split_crit_edge.us:             ; preds = %.lr.ph18..lr.ph18.split_crit_edge.us.preheader, %.lr.ph18..lr.ph18.split_crit_edge.us
  %j.015.us56 = phi i32 [ %76, %.lr.ph18..lr.ph18.split_crit_edge.us ], [ %70, %.lr.ph18..lr.ph18.split_crit_edge.us.preheader ]
  %76 = add i32 %75, %j.015.us56
  %77 = icmp slt i32 %76, %27
  br i1 %77, label %.lr.ph18..lr.ph18.split_crit_edge.us, label %._crit_edge19.us.loopexit86

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader, %._crit_edge19.us
  %k.020.us = phi i32 [ %83, %._crit_edge19.us ], [ %44, %.lr.ph18.us.preheader ]
  %78 = add nsw i32 %k.020.us, %31
  %79 = sext i32 %78 to i64
  %80 = mul nsw i64 %63, %79
  %81 = mul nsw i32 %k.020.us, %27
  br i1 %74, label %.lr.ph.us.us.preheader, label %.lr.ph18..lr.ph18.split_crit_edge.us.preheader

.lr.ph18..lr.ph18.split_crit_edge.us.preheader:   ; preds = %.lr.ph18.us
  br label %.lr.ph18..lr.ph18.split_crit_edge.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph18.us
  %82 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.lr.ph.us.us

._crit_edge19.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge19.us

._crit_edge19.us.loopexit86:                      ; preds = %.lr.ph18..lr.ph18.split_crit_edge.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit86, %._crit_edge19.us.loopexit
  %83 = add i32 %72, %k.020.us
  %84 = icmp slt i32 %83, %40
  br i1 %84, label %.lr.ph18.us, label %._crit_edge24.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %j.015.us.us = phi i32 [ %90, %._crit_edge.us.us ], [ %70, %.lr.ph.us.us.preheader ]
  %85 = add nsw i32 %j.015.us.us, %17
  %86 = sext i32 %85 to i64
  %87 = mul nsw i64 %61, %86
  %88 = add nsw i32 %j.015.us.us, %81
  %89 = mul nsw i32 %88, %13
  br label %92

._crit_edge.us.us:                                ; preds = %92
  %90 = add i32 %75, %j.015.us.us
  %91 = icmp slt i32 %90, %27
  br i1 %91, label %.lr.ph.us.us, label %._crit_edge19.us.loopexit

; <label>:92                                      ; preds = %92, %.lr.ph.us.us
  %i.014.us.us = phi i32 [ %73, %.lr.ph.us.us ], [ %107, %92 ]
  %93 = add nsw i32 %i.014.us.us, %4
  %94 = sext i32 %93 to i64
  %95 = mul nsw i64 %59, %94
  %96 = add i64 %95, %69
  %97 = add i64 %96, %87
  %98 = add i64 %97, %80
  %sext10.us.us = shl i64 %98, 32
  %99 = ashr exact i64 %sext10.us.us, 32
  %100 = getelementptr inbounds float, float* %65, i64 %99
  %101 = bitcast float* %100 to i32*
  %.val.i11.us.us = load i32, i32* %101, align 4, !tbaa !42
  %102 = add nsw i32 %i.014.us.us, %89
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %103
  %105 = bitcast float addrspace(3)* %104 to i32 addrspace(3)*
  %106 = addrspacecast i32 addrspace(3)* %105 to i32*
  store i32 %.val.i11.us.us, i32* %106, align 4, !tbaa !42
  %107 = add i32 %82, %i.014.us.us
  %108 = icmp slt i32 %107, %13
  br i1 %108, label %92, label %._crit_edge.us.us

._crit_edge24.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge24

._crit_edge24.loopexit87:                         ; preds = %.lr.ph23.split
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit87, %._crit_edge24.loopexit, %67
  tail call void @llvm.cuda.syncthreads()
  %109 = mul nsw i64 %47, %68
  br i1 %48, label %._crit_edge51, label %.lr.ph50

.lr.ph50:                                         ; preds = %._crit_edge24
  %110 = tail call i32 @llvm.ptx.read.tid.y() #5
  %111 = icmp sgt i32 %110, %24
  %112 = tail call i32 @llvm.ptx.read.ntid.z() #5
  br label %118

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %.lr.ph23.split
  %k.020 = phi i32 [ %113, %.lr.ph23.split ], [ %44, %.lr.ph23.split.preheader ]
  %113 = add i32 %72, %k.020
  %114 = icmp slt i32 %113, %40
  br i1 %114, label %.lr.ph23.split, label %._crit_edge24.loopexit87

._crit_edge51.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %._crit_edge24
  tail call void @llvm.cuda.syncthreads()
  %115 = add nuw nsw i32 %p.052, 1
  %116 = sext i32 %115 to i64
  %117 = icmp ult i64 %116, %numPlanes
  br i1 %117, label %67, label %._crit_edge55.loopexit

; <label>:118                                     ; preds = %.lr.ph50, %._crit_edge46
  %k1.047 = phi i32 [ %44, %.lr.ph50 ], [ %125, %._crit_edge46 ]
  br i1 %111, label %._crit_edge46, label %.lr.ph45

.lr.ph45:                                         ; preds = %118
  %119 = tail call i32 @llvm.ptx.read.tid.x() #5
  %120 = icmp sgt i32 %119, %10
  %121 = tail call i32 @llvm.ptx.read.ntid.y() #5
  %122 = add nsw i32 %k1.047, %31
  %123 = sext i32 %122 to i64
  %124 = mul nsw i64 %55, %123
  br label %127

._crit_edge46.loopexit:                           ; preds = %._crit_edge41
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %118
  %125 = add i32 %112, %k1.047
  %126 = icmp sgt i32 %125, %37
  br i1 %126, label %._crit_edge51.loopexit, label %118

; <label>:127                                     ; preds = %.lr.ph45, %._crit_edge41
  %j2.042 = phi i32 [ %110, %.lr.ph45 ], [ %186, %._crit_edge41 ]
  br i1 %120, label %._crit_edge41, label %.preheader13.lr.ph

.preheader13.lr.ph:                               ; preds = %127
  %128 = add nsw i32 %j2.042, %17
  %129 = sext i32 %128 to i64
  %130 = mul nsw i64 %53, %129
  %131 = tail call i32 @llvm.ptx.read.ntid.x() #5
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.lr.ph, %._crit_edge37
  %i3.039 = phi i32 [ %119, %.preheader13.lr.ph ], [ %196, %._crit_edge37 ]
  br i1 %brmerge, label %._crit_edge37, label %.preheader.lr.ph.us.preheader

.preheader.lr.ph.us.preheader:                    ; preds = %.preheader13
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.preheader.lr.ph.us.preheader, %._crit_edge32.us
  %132 = phi i64 [ %138, %._crit_edge32.us ], [ 0, %.preheader.lr.ph.us.preheader ]
  %n.035.us = phi i32 [ %137, %._crit_edge32.us ], [ 0, %.preheader.lr.ph.us.preheader ]
  %result.034.us = phi float [ %split33.us, %._crit_edge32.us ], [ 0.000000e+00, %.preheader.lr.ph.us.preheader ]
  %133 = add nsw i32 %n.035.us, %k1.047
  %134 = mul nsw i32 %133, %27
  %135 = add i32 %134, %j2.042
  %136 = mul i64 %132, %kernelSizeY
  br i1 %57, label %._crit_edge32.us, label %.lr.ph27.us.us.preheader

.lr.ph27.us.us.preheader:                         ; preds = %.preheader.lr.ph.us
  br label %.lr.ph27.us.us

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge28.us.us
  %.lcssa.lcssa = phi float [ %.lcssa, %._crit_edge28.us.us ]
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.preheader.lr.ph.us
  %split33.us = phi float [ %result.034.us, %.preheader.lr.ph.us ], [ %.lcssa.lcssa, %._crit_edge32.us.loopexit ]
  %137 = add nuw nsw i32 %n.035.us, 1
  %138 = sext i32 %137 to i64
  %139 = icmp ult i64 %138, %kernelSizeZ
  br i1 %139, label %.preheader.lr.ph.us, label %._crit_edge37.loopexit

.lr.ph27.us.us:                                   ; preds = %.lr.ph27.us.us.preheader, %._crit_edge28.us.us
  %140 = phi i64 [ %157, %._crit_edge28.us.us ], [ 0, %.lr.ph27.us.us.preheader ]
  %m.030.us.us = phi i32 [ %156, %._crit_edge28.us.us ], [ 0, %.lr.ph27.us.us.preheader ]
  %result.129.us.us = phi float [ %.lcssa, %._crit_edge28.us.us ], [ %result.034.us, %.lr.ph27.us.us.preheader ]
  %141 = add i32 %135, %m.030.us.us
  %142 = mul nsw i32 %141, %13
  %143 = add i32 %142, %i3.039
  %144 = add i64 %140, %136
  %145 = mul i64 %144, %kernelSizeX
  br i1 %lcmp.mod, label %.lr.ph27.us.us.split, label %146

; <label>:146                                     ; preds = %.lr.ph27.us.us
  %147 = add i32 %142, %i3.039
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %148
  %150 = addrspacecast float addrspace(3)* %149 to float*
  %151 = load float, float* %150, align 4, !tbaa !42
  %152 = getelementptr inbounds float, float* %kernel, i64 %145
  %153 = load float, float* %152, align 4, !tbaa !42
  %154 = fmul float %151, %153
  %155 = fadd float %result.129.us.us, %154
  br label %.lr.ph27.us.us.split

.lr.ph27.us.us.split:                             ; preds = %.lr.ph27.us.us, %146
  %.unr = phi i64 [ 0, %.lr.ph27.us.us ], [ 1, %146 ]
  %l.026.us.us.unr = phi i32 [ 0, %.lr.ph27.us.us ], [ 1, %146 ]
  %result.225.us.us.unr = phi float [ %result.129.us.us, %.lr.ph27.us.us ], [ %155, %146 ]
  %.lcssa.unr = phi float [ undef, %.lr.ph27.us.us ], [ %155, %146 ]
  br i1 %66, label %._crit_edge28.us.us, label %.lr.ph27.us.us.split.split

.lr.ph27.us.us.split.split:                       ; preds = %.lr.ph27.us.us.split
  br label %159

._crit_edge28.us.us.unr-lcssa:                    ; preds = %159
  %.lcssa88 = phi float [ %182, %159 ]
  br label %._crit_edge28.us.us

._crit_edge28.us.us:                              ; preds = %.lr.ph27.us.us.split, %._crit_edge28.us.us.unr-lcssa
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph27.us.us.split ], [ %.lcssa88, %._crit_edge28.us.us.unr-lcssa ]
  %156 = add nuw nsw i32 %m.030.us.us, 1
  %157 = sext i32 %156 to i64
  %158 = icmp ult i64 %157, %kernelSizeY
  br i1 %158, label %.lr.ph27.us.us, label %._crit_edge32.us.loopexit

; <label>:159                                     ; preds = %159, %.lr.ph27.us.us.split.split
  %160 = phi i64 [ %.unr, %.lr.ph27.us.us.split.split ], [ %184, %159 ]
  %l.026.us.us = phi i32 [ %l.026.us.us.unr, %.lr.ph27.us.us.split.split ], [ %183, %159 ]
  %result.225.us.us = phi float [ %result.225.us.us.unr, %.lr.ph27.us.us.split.split ], [ %182, %159 ]
  %161 = add i32 %143, %l.026.us.us
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %162
  %164 = addrspacecast float addrspace(3)* %163 to float*
  %165 = load float, float* %164, align 4, !tbaa !42
  %166 = add i64 %160, %145
  %167 = getelementptr inbounds float, float* %kernel, i64 %166
  %168 = load float, float* %167, align 4, !tbaa !42
  %169 = fmul float %165, %168
  %170 = fadd float %result.225.us.us, %169
  %171 = add nuw nsw i32 %l.026.us.us, 1
  %172 = sext i32 %171 to i64
  %173 = add i32 %143, %171
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_ZN5Eigen1sE, i64 0, i64 %174
  %176 = addrspacecast float addrspace(3)* %175 to float*
  %177 = load float, float* %176, align 4, !tbaa !42
  %178 = add i64 %172, %145
  %179 = getelementptr inbounds float, float* %kernel, i64 %178
  %180 = load float, float* %179, align 4, !tbaa !42
  %181 = fmul float %177, %180
  %182 = fadd float %170, %181
  %183 = add nsw i32 %l.026.us.us, 2
  %184 = sext i32 %183 to i64
  %185 = icmp ult i64 %184, %kernelSizeX
  br i1 %185, label %159, label %._crit_edge28.us.us.unr-lcssa

._crit_edge41.loopexit:                           ; preds = %._crit_edge37
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %127
  %186 = add i32 %121, %j2.042
  %187 = icmp sgt i32 %186, %24
  br i1 %187, label %._crit_edge46.loopexit, label %127

._crit_edge37.loopexit:                           ; preds = %._crit_edge32.us
  %split33.us.lcssa = phi float [ %split33.us, %._crit_edge32.us ]
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %.preheader13
  %result.0.lcssa = phi float [ 0.000000e+00, %.preheader13 ], [ %split33.us.lcssa, %._crit_edge37.loopexit ]
  %188 = add nsw i32 %i3.039, %4
  %189 = sext i32 %188 to i64
  %190 = mul nsw i64 %51, %189
  %191 = add i64 %190, %109
  %192 = add i64 %191, %130
  %193 = add i64 %192, %124
  %sext8 = shl i64 %193, 32
  %194 = ashr exact i64 %sext8, 32
  %195 = getelementptr inbounds float, float* %buffer, i64 %194
  store float %result.0.lcssa, float* %195, align 4, !tbaa !42
  %196 = add i32 %131, %i3.039
  %197 = icmp sgt i32 %196, %10
  br i1 %197, label %._crit_edge41.loopexit, label %.preheader13
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.42"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #5
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #5
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #5
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #5
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %size
  br i1 %10, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

.lr.ph.i:                                         ; preds = %0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.42", %"struct.Eigen::TensorEvaluator.42"* %eval, i64 0, i32 1, i32 5
  %12 = load float*, float** %11, align 8
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.42", %"struct.Eigen::TensorEvaluator.42"* %eval, i64 0, i32 0, i32 0
  %14 = load float*, float** %13, align 8
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph.i
  %i.01.i = phi i64 [ %6, %.lr.ph.i ], [ %21, %15 ]
  %16 = getelementptr inbounds float, float* %12, i64 %i.01.i
  %17 = bitcast float* %16 to i32*
  %18 = load i32, i32* %17, align 4, !tbaa !42
  %19 = getelementptr inbounds float, float* %14, i64 %i.01.i
  %20 = bitcast float* %19 to i32*
  store i32 %18, i32* %20, align 4, !tbaa !42
  %21 = add nuw nsw i64 %i.01.i, %9
  %22 = icmp slt i64 %21, %size
  br i1 %22, label %15, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit: ; preds = %15
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit, %0
  ret void
}

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fabs.ftz.f(float) #2

; Function Attrs: nounwind readnone
declare float @llvm.nvvm.fabs.f(float) #2

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noduplicate nounwind }
attributes #5 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !36, !38, !38, !38, !38, !39, !39, !38}
!llvm.ident = !{!40}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!41}

!0 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!1 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!2 = !{void (%"struct.Eigen::TensorEvaluator.3"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!3 = !{void (%"struct.Eigen::TensorEvaluator.3"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!4 = !{void (%"struct.Eigen::TensorEvaluator.7"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!5 = !{void (%"struct.Eigen::TensorEvaluator.7"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!6 = !{void (%"struct.Eigen::TensorEvaluator.13"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!7 = !{void (%"struct.Eigen::TensorEvaluator.13"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!8 = !{void (%"struct.Eigen::TensorEvaluator.20"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!9 = !{void (%"struct.Eigen::TensorEvaluator.20"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!10 = !{void (%"struct.Eigen::TensorEvaluator.23"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!11 = !{void (%"struct.Eigen::TensorEvaluator.23"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!12 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper"*, float*, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf, !"kernel", i32 1}
!13 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper"*, float*, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf, !"kernel", i32 1}
!14 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper"*, float*, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf, !"kernel", i32 1}
!15 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper.30"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!16 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper.30"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!17 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper.30"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!18 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper.30"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!19 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper.30"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!20 = !{void (%"struct.Eigen::TensorEvaluator.25"*, %"class.Eigen::internal::IndexMapper.31"*, float*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, float*)* @_ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf, !"kernel", i32 1}
!21 = !{void (%"struct.Eigen::TensorEvaluator.32"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!22 = !{void (%"struct.Eigen::TensorEvaluator.32"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!23 = !{void (%"struct.Eigen::TensorEvaluator.36"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!24 = !{void (%"struct.Eigen::TensorEvaluator.36"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!25 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.39"*, float*, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf, !"kernel", i32 1}
!26 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.39"*, float*, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf, !"kernel", i32 1}
!27 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.39"*, float*, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf, !"kernel", i32 1}
!28 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.40"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!29 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.40"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!30 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.40"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!31 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.40"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!32 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.40"*, float*, i32, i32, i32, i32, i32, i32, i32, float*)* @_ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf, !"kernel", i32 1}
!33 = !{void (%"struct.Eigen::TensorEvaluator.38"*, %"class.Eigen::internal::IndexMapper.41"*, float*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, float*)* @_ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf, !"kernel", i32 1}
!34 = !{void (%"struct.Eigen::TensorEvaluator.42"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!35 = !{void (%"struct.Eigen::TensorEvaluator.42"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!36 = !{null, !"align", i32 8}
!37 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!38 = !{null, !"align", i32 16}
!39 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!40 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!41 = !{i32 1, i32 2}
!42 = !{!43, !43, i64 0}
!43 = !{!"float", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C/C++ TBAA"}
!46 = !{!47, !48, i64 0}
!47 = !{!"_ZTSN5Eigen8internal22UniformRandomGeneratorIfEE", !48, i64 0}
!48 = !{!"long", !44, i64 0}
!49 = !{!50, !50, i64 0}
!50 = !{!"bool", !44, i64 0}
!51 = distinct !{!51, !52}
!52 = !{!"llvm.loop.unroll.enable"}
!53 = distinct !{!53, !52}
!54 = distinct !{!54, !52}
!55 = distinct !{!55, !52}
!56 = distinct !{!56, !52}
!57 = distinct !{!57, !52}
!58 = distinct !{!58, !52}
!59 = distinct !{!59, !52}
!60 = distinct !{!60, !52}
!61 = distinct !{!61, !52}
!62 = distinct !{!62, !52}
!63 = distinct !{!63, !52}
!64 = distinct !{!64, !52}
!65 = distinct !{!65, !52}
!66 = distinct !{!66, !52}
!67 = distinct !{!67, !52}
!68 = distinct !{!68, !52}
!69 = distinct !{!69, !52}
!70 = distinct !{!70, !52}
!71 = distinct !{!71, !52}
!72 = distinct !{!72, !52}
!73 = distinct !{!73, !52}
!74 = distinct !{!74, !52}
!75 = distinct !{!75, !52}
!76 = distinct !{!76, !52}
!77 = distinct !{!77, !52}
!78 = distinct !{!78, !52}
!79 = distinct !{!79, !52}
!80 = distinct !{!80, !52}
!81 = distinct !{!81, !52}
!82 = distinct !{!82, !52}
!83 = distinct !{!83, !52}
!84 = distinct !{!84, !52}
!85 = distinct !{!85, !52}
!86 = distinct !{!86, !52}
!87 = distinct !{!87, !52}
!88 = distinct !{!88, !52}
!89 = distinct !{!89, !52}
!90 = distinct !{!90, !52}
!91 = distinct !{!91, !52}
!92 = distinct !{!92, !52}
!93 = distinct !{!93, !52}
!94 = distinct !{!94, !52}
!95 = distinct !{!95, !52}
!96 = distinct !{!96, !52}
!97 = distinct !{!97, !52}
!98 = distinct !{!98, !52}
!99 = distinct !{!99, !52}
!100 = distinct !{!100, !52}
!101 = distinct !{!101, !52}
!102 = distinct !{!102, !52}
!103 = distinct !{!103, !52}
!104 = distinct !{!104, !52}
!105 = distinct !{!105, !52}
!106 = distinct !{!106, !52}
!107 = distinct !{!107, !52}
!108 = distinct !{!108, !52}
!109 = distinct !{!109, !52}
!110 = distinct !{!110, !52}
!111 = distinct !{!111, !52}
!112 = distinct !{!112, !52}
!113 = distinct !{!113, !52}
