; ModuleID = 'tensorflow/core/kernels/cwise_op_gpu_sqrt.cu.cc'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.__cuda_builtin_gridDim_t = type { i8 }
%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::TensorEvaluator.0" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap"* }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [1 x i32] }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"class.Eigen::TensorMap" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%"struct.Eigen::TensorEvaluator.2" = type { %"struct.Eigen::internal::scalar_sqrt_op", %"struct.Eigen::TensorEvaluator.3" }
%"struct.Eigen::internal::scalar_sqrt_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.3" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.4"* }
%"class.Eigen::TensorMap.4" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%struct.float4 = type { float, float, float, float }
%"struct.Eigen::TensorEvaluator.7" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.8" }
%"struct.Eigen::TensorEvaluator.8" = type { %"struct.Eigen::internal::scalar_sqrt_gradient_op", %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.9" }
%"struct.Eigen::internal::scalar_sqrt_gradient_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.9" = type { float*, %"struct.Eigen::DSizes.10", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.12"* }
%"struct.Eigen::DSizes.10" = type { %"class.Eigen::array.11" }
%"class.Eigen::array.11" = type { [1 x i64] }
%"class.Eigen::TensorMap.12" = type { float*, %"struct.Eigen::DSizes.10" }

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_14scalar_sqrt_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEEEEENS_9GpuDeviceEE10evalPacketEi = comdat any

$_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEEEEENS_9GpuDeviceEE10evalScalarEi = comdat any

$_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE11writePacketILi16EEEviRK6float4 = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE6packetILi16EEE6float4i = comdat any

$_ZN5Eigen8internal6pstoreIf6float4EEvPT_RKT0_ = comdat any

$_ZNK5Eigen8internal14scalar_sqrt_opIfE8packetOpI6float4EET_RKS5_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE6packetILi16EEE6float4i = comdat any

$_ZN5Eigen8internal5psqrtI6float4EET_RKS3_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE8coeffRefEi = comdat any

$_ZNK5Eigen8internal14scalar_sqrt_opIfEclERKf = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_23scalar_sqrt_gradient_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEKNS4_INS5_ISC_Li1ELi1ElEELi16ES7_EEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEKNS2_INS3_ISB_Li1ELi1ElEELi16ES5_EEEEEENS_9GpuDeviceEE10evalPacketEl = comdat any

$_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEKNS2_INS3_ISB_Li1ELi1ElEELi16ES5_EEEEEENS_9GpuDeviceEE10evalScalarEl = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS5_INS6_IS7_Li1ELi1ElEELi16ES9_EEEENS_9GpuDeviceEE6packetILi16EEE6float4l = comdat any

$_ZNK5Eigen8internal23scalar_sqrt_gradient_opIfE8packetOpI6float4EEKT_RS6_S7_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1ElEELi16ENS_11MakePointerEEENS_9GpuDeviceEE6packetILi16EEE6float4l = comdat any

$_ZN5Eigen8internal5pset1I6float4EET_RKNS0_15unpacket_traitsIS3_E4typeE = comdat any

$_ZN5Eigen8internal5pconjI6float4EET_RKS3_ = comdat any

$_ZN5Eigen8internal4pdivI6float4EET_RKS3_S5_ = comdat any

$_ZN5Eigen8internal4pmulI6float4EET_RKS3_S5_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS5_INS6_IS7_Li1ELi1ElEELi16ES9_EEEENS_9GpuDeviceEE5coeffEl = comdat any

$_ZNK5Eigen8internal23scalar_sqrt_gradient_opIfEclERKfS4_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1ElEELi16ENS_11MakePointerEEENS_9GpuDeviceEE5coeffEl = comdat any

$_ZN5Eigen6numext4conjIfEENS_8internal11conj_retvalINS2_36global_math_functions_filtering_baseIT_vE4typeEE4typeERKS5_ = comdat any

$_ZN5Eigen8internal9conj_implIfLb0EE3runERKf = comdat any

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@gridDim = extern_weak addrspace(1) global %struct.__cuda_builtin_gridDim_t, align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)) #3
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #1

define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_14scalar_sqrt_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval align 8 %eval, i32 %size) #2 comdat {
  %1 = alloca %"struct.Eigen::TensorEvaluator"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %PacketSize.i = alloca i32, align 4
  %vectorized_size.i = alloca i32, align 4
  %vectorized_step_size.i = alloca i32, align 4
  %i.i = alloca i32, align 4
  %i1.i = alloca i32, align 4
  %5 = alloca i32, align 4
  %first_index = alloca i32, align 4
  %step_size = alloca i32, align 4
  %vectorizable = alloca i8, align 1
  store i32 %size, i32* %5, align 4
  %6 = call i32 @llvm.ptx.read.ctaid.x() #7
  %7 = call i32 @llvm.ptx.read.ntid.x() #7
  %8 = mul i32 %6, %7
  %9 = call i32 @llvm.ptx.read.tid.x() #7
  %10 = add i32 %8, %9
  store i32 %10, i32* %first_index, align 4
  %11 = call i32 @llvm.ptx.read.ntid.x() #7
  %12 = call i32 @llvm.ptx.read.nctaid.x() #7
  %13 = mul i32 %11, %12
  store i32 %13, i32* %step_size, align 4
  store i8 1, i8* %vectorizable, align 1
  %14 = load i32, i32* %first_index, align 4
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %step_size, align 4
  store %"struct.Eigen::TensorEvaluator"* %eval, %"struct.Eigen::TensorEvaluator"** %1, align 8
  store i32 %14, i32* %2, align 4
  store i32 %15, i32* %3, align 4
  store i32 %16, i32* %4, align 4
  store i32 4, i32* %PacketSize.i, align 4
  %17 = load i32, i32* %3, align 4
  %18 = sdiv i32 %17, 4
  %19 = mul nsw i32 %18, 4
  store i32 %19, i32* %vectorized_size.i, align 4
  %20 = load i32, i32* %4, align 4
  %21 = mul nsw i32 %20, 4
  store i32 %21, i32* %vectorized_step_size.i, align 4
  %22 = load i32, i32* %2, align 4
  %23 = mul nsw i32 %22, 4
  store i32 %23, i32* %i.i, align 4
  br label %24

; <label>:24                                      ; preds = %28, %0
  %25 = load i32, i32* %i.i, align 4
  %26 = load i32, i32* %vectorized_size.i, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %24
  %29 = load %"struct.Eigen::TensorEvaluator"*, %"struct.Eigen::TensorEvaluator"** %1, align 8
  %30 = load i32, i32* %i.i, align 4
  call void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEEEEENS_9GpuDeviceEE10evalPacketEi(%"struct.Eigen::TensorEvaluator"* %29, i32 %30)
  %31 = load i32, i32* %vectorized_step_size.i, align 4
  %32 = load i32, i32* %i.i, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %i.i, align 4
  br label %24

; <label>:34                                      ; preds = %24
  %35 = load i32, i32* %vectorized_size.i, align 4
  %36 = load i32, i32* %2, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, i32* %i1.i, align 4
  br label %38

; <label>:38                                      ; preds = %42, %34
  %39 = load i32, i32* %i1.i, align 4
  %40 = load i32, i32* %3, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_14scalar_sqrt_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSL_iii.exit

; <label>:42                                      ; preds = %38
  %43 = load %"struct.Eigen::TensorEvaluator"*, %"struct.Eigen::TensorEvaluator"** %1, align 8
  %44 = load i32, i32* %i1.i, align 4
  call void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEEEEENS_9GpuDeviceEE10evalScalarEi(%"struct.Eigen::TensorEvaluator"* %43, i32 %44)
  %45 = load i32, i32* %4, align 4
  %46 = load i32, i32* %i1.i, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, i32* %i1.i, align 4
  br label %38

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_14scalar_sqrt_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSL_iii.exit: ; preds = %38
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ntid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.nctaid.x() #3

; Function Attrs: inlinehint
define linkonce_odr void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEEEEENS_9GpuDeviceEE10evalPacketEi(%"struct.Eigen::TensorEvaluator"* %this, i32 %i) #4 comdat align 2 {
  %1 = alloca %"struct.Eigen::TensorEvaluator"*, align 8
  %2 = alloca i32, align 4
  %LhsStoreMode = alloca i32, align 4
  %RhsLoadMode = alloca i32, align 4
  %3 = alloca %struct.float4, align 4
  store %"struct.Eigen::TensorEvaluator"* %this, %"struct.Eigen::TensorEvaluator"** %1, align 8
  store i32 %i, i32* %2, align 4
  %4 = load %"struct.Eigen::TensorEvaluator"*, %"struct.Eigen::TensorEvaluator"** %1, align 8
  store i32 16, i32* %LhsStoreMode, align 4
  store i32 16, i32* %RhsLoadMode, align 4
  %5 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i32 0, i32 0
  %6 = load i32, i32* %2, align 4
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i32 0, i32 1
  %8 = load i32, i32* %2, align 4
  %9 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE6packetILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.2"* %7, i32 %8)
  %10 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 0
  %11 = extractvalue %struct.float4 %9, 0
  store float %11, float* %10, align 4
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 1
  %13 = extractvalue %struct.float4 %9, 1
  store float %13, float* %12, align 4
  %14 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 2
  %15 = extractvalue %struct.float4 %9, 2
  store float %15, float* %14, align 4
  %16 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 3
  %17 = extractvalue %struct.float4 %9, 3
  store float %17, float* %16, align 4
  call void @_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE11writePacketILi16EEEviRK6float4(%"struct.Eigen::TensorEvaluator.0"* %5, i32 %6, %struct.float4* dereferenceable(16) %3)
  ret void
}

; Function Attrs: inlinehint
define linkonce_odr void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEEEEENS_9GpuDeviceEE10evalScalarEi(%"struct.Eigen::TensorEvaluator"* %this, i32 %i) #4 comdat align 2 {
  %1 = alloca %"struct.Eigen::TensorEvaluator"*, align 8
  %2 = alloca i32, align 4
  store %"struct.Eigen::TensorEvaluator"* %this, %"struct.Eigen::TensorEvaluator"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"struct.Eigen::TensorEvaluator"*, %"struct.Eigen::TensorEvaluator"** %1, align 8
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %3, i32 0, i32 1
  %5 = load i32, i32* %2, align 4
  %6 = call float @_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::TensorEvaluator.2"* %4, i32 %5)
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %3, i32 0, i32 0
  %8 = load i32, i32* %2, align 4
  %9 = call dereferenceable(4) float* @_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE8coeffRefEi(%"struct.Eigen::TensorEvaluator.0"* %7, i32 %8)
  store float %6, float* %9, align 4
  ret void
}

; Function Attrs: inlinehint
define linkonce_odr void @_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE11writePacketILi16EEEviRK6float4(%"struct.Eigen::TensorEvaluator.0"* %this, i32 %index, %struct.float4* dereferenceable(16) %x) #4 comdat align 2 {
  %1 = alloca float*, align 8
  %2 = alloca %struct.float4*, align 8
  %3 = alloca %"struct.Eigen::TensorEvaluator.0"*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.float4*, align 8
  store %"struct.Eigen::TensorEvaluator.0"* %this, %"struct.Eigen::TensorEvaluator.0"** %3, align 8
  store i32 %index, i32* %4, align 4
  store %struct.float4* %x, %struct.float4** %5, align 8
  %6 = load %"struct.Eigen::TensorEvaluator.0"*, %"struct.Eigen::TensorEvaluator.0"** %3, align 8
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.0"* %6, i32 0, i32 0
  %8 = load float*, float** %7, align 8
  %9 = load i32, i32* %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float* %8, i64 %10
  %12 = load %struct.float4*, %struct.float4** %5, align 8
  store float* %11, float** %1, align 8
  store %struct.float4* %12, %struct.float4** %2, align 8
  %13 = load float*, float** %1, align 8
  %14 = load %struct.float4*, %struct.float4** %2, align 8
  call void @_ZN5Eigen8internal6pstoreIf6float4EEvPT_RKT0_(float* %13, %struct.float4* dereferenceable(16) %14)
  ret void
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE6packetILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.2"* %this, i32 %index) #4 comdat align 2 {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %"struct.Eigen::TensorEvaluator.2"*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.float4, align 4
  store %"struct.Eigen::TensorEvaluator.2"* %this, %"struct.Eigen::TensorEvaluator.2"** %2, align 8
  store i32 %index, i32* %3, align 4
  %5 = load %"struct.Eigen::TensorEvaluator.2"*, %"struct.Eigen::TensorEvaluator.2"** %2, align 8
  %6 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.2"* %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.2"* %5, i32 0, i32 1
  %8 = load i32, i32* %3, align 4
  %9 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE6packetILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.3"* %7, i32 %8)
  %10 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 0
  %11 = extractvalue %struct.float4 %9, 0
  store float %11, float* %10, align 4
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 1
  %13 = extractvalue %struct.float4 %9, 1
  store float %13, float* %12, align 4
  %14 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 2
  %15 = extractvalue %struct.float4 %9, 2
  store float %15, float* %14, align 4
  %16 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 3
  %17 = extractvalue %struct.float4 %9, 3
  store float %17, float* %16, align 4
  %18 = call %struct.float4 @_ZNK5Eigen8internal14scalar_sqrt_opIfE8packetOpI6float4EET_RKS5_(%"struct.Eigen::internal::scalar_sqrt_op"* %6, %struct.float4* dereferenceable(16) %4)
  %19 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %20 = extractvalue %struct.float4 %18, 0
  store float %20, float* %19, align 4
  %21 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %22 = extractvalue %struct.float4 %18, 1
  store float %22, float* %21, align 4
  %23 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %24 = extractvalue %struct.float4 %18, 2
  store float %24, float* %23, align 4
  %25 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %26 = extractvalue %struct.float4 %18, 3
  store float %26, float* %25, align 4
  %27 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %27
}

; Function Attrs: inlinehint nounwind
define linkonce_odr void @_ZN5Eigen8internal6pstoreIf6float4EEvPT_RKT0_(float* %to, %struct.float4* dereferenceable(16) %from) #5 comdat {
  %1 = alloca float*, align 8
  %2 = alloca %struct.float4*, align 8
  store float* %to, float** %1, align 8
  store %struct.float4* %from, %struct.float4** %2, align 8
  %3 = load float*, float** %1, align 8
  %4 = bitcast float* %3 to %struct.float4*
  %5 = load %struct.float4*, %struct.float4** %2, align 8
  %6 = bitcast %struct.float4* %4 to i8*
  %7 = bitcast %struct.float4* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 16, i32 4, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZNK5Eigen8internal14scalar_sqrt_opIfE8packetOpI6float4EET_RKS5_(%"struct.Eigen::internal::scalar_sqrt_op"* %this, %struct.float4* dereferenceable(16) %a) #4 comdat align 2 {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %"struct.Eigen::internal::scalar_sqrt_op"*, align 8
  %3 = alloca %struct.float4*, align 8
  store %"struct.Eigen::internal::scalar_sqrt_op"* %this, %"struct.Eigen::internal::scalar_sqrt_op"** %2, align 8
  store %struct.float4* %a, %struct.float4** %3, align 8
  %4 = load %"struct.Eigen::internal::scalar_sqrt_op"*, %"struct.Eigen::internal::scalar_sqrt_op"** %2, align 8
  %5 = load %struct.float4*, %struct.float4** %3, align 8
  %6 = call %struct.float4 @_ZN5Eigen8internal5psqrtI6float4EET_RKS3_(%struct.float4* dereferenceable(16) %5)
  %7 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %8 = extractvalue %struct.float4 %6, 0
  store float %8, float* %7, align 4
  %9 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %10 = extractvalue %struct.float4 %6, 1
  store float %10, float* %9, align 4
  %11 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %12 = extractvalue %struct.float4 %6, 2
  store float %12, float* %11, align 4
  %13 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %14 = extractvalue %struct.float4 %6, 3
  store float %14, float* %13, align 4
  %15 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %15
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE6packetILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.3"* %this, i32 %index) #4 comdat align 2 {
  %1 = alloca %struct.float4, align 4
  %2 = alloca float*, align 8
  %3 = alloca %struct.float4, align 4
  %4 = alloca %"struct.Eigen::TensorEvaluator.3"*, align 8
  %5 = alloca i32, align 4
  store %"struct.Eigen::TensorEvaluator.3"* %this, %"struct.Eigen::TensorEvaluator.3"** %4, align 8
  store i32 %index, i32* %5, align 4
  %6 = load %"struct.Eigen::TensorEvaluator.3"*, %"struct.Eigen::TensorEvaluator.3"** %4, align 8
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %6, i32 0, i32 0
  %8 = load float*, float** %7, align 8
  %9 = load i32, i32* %5, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float* %8, i64 %10
  store float* %11, float** %2, align 8
  %12 = load float*, float** %2, align 8
  %13 = load float, float* %12, align 4
  %14 = load float*, float** %2, align 8
  %15 = getelementptr inbounds float, float* %14, i64 1
  %16 = load float, float* %15, align 4
  %17 = load float*, float** %2, align 8
  %18 = getelementptr inbounds float, float* %17, i64 2
  %19 = load float, float* %18, align 4
  %20 = load float*, float** %2, align 8
  %21 = getelementptr inbounds float, float* %20, i64 3
  %22 = load float, float* %21, align 4
  %23 = call %struct.float4 @_Z11make_float4ffff(float %13, float %16, float %19, float %22)
  %24 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %25 = extractvalue %struct.float4 %23, 0
  store float %25, float* %24, align 4
  %26 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %27 = extractvalue %struct.float4 %23, 1
  store float %27, float* %26, align 4
  %28 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %29 = extractvalue %struct.float4 %23, 2
  store float %29, float* %28, align 4
  %30 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %31 = extractvalue %struct.float4 %23, 3
  store float %31, float* %30, align 4
  %32 = load %struct.float4, %struct.float4* %1, align 4
  %33 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 0
  %34 = extractvalue %struct.float4 %32, 0
  store float %34, float* %33, align 4
  %35 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 1
  %36 = extractvalue %struct.float4 %32, 1
  store float %36, float* %35, align 4
  %37 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 2
  %38 = extractvalue %struct.float4 %32, 2
  store float %38, float* %37, align 4
  %39 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 3
  %40 = extractvalue %struct.float4 %32, 3
  store float %40, float* %39, align 4
  %41 = load %struct.float4, %struct.float4* %3, align 4
  ret %struct.float4 %41
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZN5Eigen8internal5psqrtI6float4EET_RKS3_(%struct.float4* dereferenceable(16) %a) #4 comdat {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %struct.float4*, align 8
  store %struct.float4* %a, %struct.float4** %2, align 8
  %3 = load %struct.float4*, %struct.float4** %2, align 8
  %4 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 0
  %5 = load float, float* %4, align 4
  %6 = call float @sqrtf(float %5) #7
  %7 = load %struct.float4*, %struct.float4** %2, align 8
  %8 = getelementptr inbounds %struct.float4, %struct.float4* %7, i32 0, i32 1
  %9 = load float, float* %8, align 4
  %10 = call float @sqrtf(float %9) #7
  %11 = load %struct.float4*, %struct.float4** %2, align 8
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %11, i32 0, i32 2
  %13 = load float, float* %12, align 4
  %14 = call float @sqrtf(float %13) #7
  %15 = load %struct.float4*, %struct.float4** %2, align 8
  %16 = getelementptr inbounds %struct.float4, %struct.float4* %15, i32 0, i32 3
  %17 = load float, float* %16, align 4
  %18 = call float @sqrtf(float %17) #7
  %19 = call %struct.float4 @_Z11make_float4ffff(float %6, float %10, float %14, float %18)
  %20 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %21 = extractvalue %struct.float4 %19, 0
  store float %21, float* %20, align 4
  %22 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %23 = extractvalue %struct.float4 %19, 1
  store float %23, float* %22, align 4
  %24 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %25 = extractvalue %struct.float4 %19, 2
  store float %25, float* %24, align 4
  %26 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %27 = extractvalue %struct.float4 %19, 3
  store float %27, float* %26, align 4
  %28 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %28
}

declare %struct.float4 @_Z11make_float4ffff(float, float, float, float) #2

; Function Attrs: nounwind
declare float @sqrtf(float) #0

define linkonce_odr float @_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal14scalar_sqrt_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::TensorEvaluator.2"* %this, i32 %index) #2 comdat align 2 {
  %1 = alloca %"struct.Eigen::TensorEvaluator.2"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store %"struct.Eigen::TensorEvaluator.2"* %this, %"struct.Eigen::TensorEvaluator.2"** %1, align 8
  store i32 %index, i32* %2, align 4
  %4 = load %"struct.Eigen::TensorEvaluator.2"*, %"struct.Eigen::TensorEvaluator.2"** %1, align 8
  %5 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.2"* %4, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.2"* %4, i32 0, i32 1
  %7 = load i32, i32* %2, align 4
  %8 = call float @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::TensorEvaluator.3"* %6, i32 %7)
  store float %8, float* %3, align 4
  %9 = call float @_ZNK5Eigen8internal14scalar_sqrt_opIfEclERKf(%"struct.Eigen::internal::scalar_sqrt_op"* %5, float* dereferenceable(4) %3)
  ret float %9
}

; Function Attrs: inlinehint nounwind
define linkonce_odr dereferenceable(4) float* @_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE8coeffRefEi(%"struct.Eigen::TensorEvaluator.0"* %this, i32 %index) #5 comdat align 2 {
  %1 = alloca %"struct.Eigen::TensorEvaluator.0"*, align 8
  %2 = alloca i32, align 4
  store %"struct.Eigen::TensorEvaluator.0"* %this, %"struct.Eigen::TensorEvaluator.0"** %1, align 8
  store i32 %index, i32* %2, align 4
  %3 = load %"struct.Eigen::TensorEvaluator.0"*, %"struct.Eigen::TensorEvaluator.0"** %1, align 8
  %4 = load i32, i32* %2, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.0"* %3, i32 0, i32 0
  %7 = load float*, float** %6, align 8
  %8 = getelementptr inbounds float, float* %7, i64 %5
  ret float* %8
}

; Function Attrs: inlinehint
define linkonce_odr float @_ZNK5Eigen8internal14scalar_sqrt_opIfEclERKf(%"struct.Eigen::internal::scalar_sqrt_op"* %this, float* dereferenceable(4) %a) #4 comdat align 2 {
  %1 = alloca float*, align 8
  %2 = alloca %"struct.Eigen::internal::scalar_sqrt_op"*, align 8
  %3 = alloca float*, align 8
  store %"struct.Eigen::internal::scalar_sqrt_op"* %this, %"struct.Eigen::internal::scalar_sqrt_op"** %2, align 8
  store float* %a, float** %3, align 8
  %4 = load %"struct.Eigen::internal::scalar_sqrt_op"*, %"struct.Eigen::internal::scalar_sqrt_op"** %2, align 8
  %5 = load float*, float** %3, align 8
  store float* %5, float** %1, align 8
  %6 = load float*, float** %1, align 8
  %7 = load float, float* %6, align 4
  %8 = fpext float %7 to double
  %9 = call double @sqrt(double %8) #7
  %10 = fptrunc double %9 to float
  ret float %10
}

; Function Attrs: inlinehint
define linkonce_odr float @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::TensorEvaluator.3"* %this, i32 %index) #4 comdat align 2 {
  %1 = alloca float*, align 8
  %2 = alloca %"struct.Eigen::TensorEvaluator.3"*, align 8
  %3 = alloca i32, align 4
  store %"struct.Eigen::TensorEvaluator.3"* %this, %"struct.Eigen::TensorEvaluator.3"** %2, align 8
  store i32 %index, i32* %3, align 4
  %4 = load %"struct.Eigen::TensorEvaluator.3"*, %"struct.Eigen::TensorEvaluator.3"** %2, align 8
  %5 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %4, i32 0, i32 0
  %6 = load float*, float** %5, align 8
  %7 = load i32, i32* %3, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, float* %6, i64 %8
  store float* %9, float** %1, align 8
  %10 = load float*, float** %1, align 8
  %11 = load float, float* %10, align 4
  ret float %11
}

; Function Attrs: nounwind
declare double @sqrt(double) #0

define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_23scalar_sqrt_gradient_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEKNS4_INS5_ISC_Li1ELi1ElEELi16ES7_EEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.7"* byval align 8 %eval, i64 %size) #2 comdat {
  %1 = alloca %"struct.Eigen::TensorEvaluator.7"*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %PacketSize.i = alloca i64, align 8
  %vectorized_size.i = alloca i64, align 8
  %vectorized_step_size.i = alloca i64, align 8
  %i.i = alloca i64, align 8
  %i1.i = alloca i64, align 8
  %5 = alloca i64, align 8
  %first_index = alloca i64, align 8
  %step_size = alloca i64, align 8
  %vectorizable = alloca i8, align 1
  store i64 %size, i64* %5, align 8
  %6 = call i32 @llvm.ptx.read.ctaid.x() #7
  %7 = call i32 @llvm.ptx.read.ntid.x() #7
  %8 = mul i32 %6, %7
  %9 = call i32 @llvm.ptx.read.tid.x() #7
  %10 = add i32 %8, %9
  %11 = zext i32 %10 to i64
  store i64 %11, i64* %first_index, align 8
  %12 = call i32 @llvm.ptx.read.ntid.x() #7
  %13 = call i32 @llvm.ptx.read.nctaid.x() #7
  %14 = mul i32 %12, %13
  %15 = zext i32 %14 to i64
  store i64 %15, i64* %step_size, align 8
  store i8 1, i8* %vectorizable, align 1
  %16 = load i64, i64* %first_index, align 8
  %17 = load i64, i64* %5, align 8
  %18 = load i64, i64* %step_size, align 8
  store %"struct.Eigen::TensorEvaluator.7"* %eval, %"struct.Eigen::TensorEvaluator.7"** %1, align 8
  store i64 %16, i64* %2, align 8
  store i64 %17, i64* %3, align 8
  store i64 %18, i64* %4, align 8
  store i64 4, i64* %PacketSize.i, align 8
  %19 = load i64, i64* %3, align 8
  %20 = sdiv i64 %19, 4
  %21 = mul nsw i64 %20, 4
  store i64 %21, i64* %vectorized_size.i, align 8
  %22 = load i64, i64* %4, align 8
  %23 = mul nsw i64 %22, 4
  store i64 %23, i64* %vectorized_step_size.i, align 8
  %24 = load i64, i64* %2, align 8
  %25 = mul nsw i64 %24, 4
  store i64 %25, i64* %i.i, align 8
  br label %26

; <label>:26                                      ; preds = %30, %0
  %27 = load i64, i64* %i.i, align 8
  %28 = load i64, i64* %vectorized_size.i, align 8
  %29 = icmp slt i64 %27, %28
  br i1 %29, label %30, label %36

; <label>:30                                      ; preds = %26
  %31 = load %"struct.Eigen::TensorEvaluator.7"*, %"struct.Eigen::TensorEvaluator.7"** %1, align 8
  %32 = load i64, i64* %i.i, align 8
  call void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEKNS2_INS3_ISB_Li1ELi1ElEELi16ES5_EEEEEENS_9GpuDeviceEE10evalPacketEl(%"struct.Eigen::TensorEvaluator.7"* %31, i64 %32)
  %33 = load i64, i64* %vectorized_step_size.i, align 8
  %34 = load i64, i64* %i.i, align 8
  %35 = add nsw i64 %34, %33
  store i64 %35, i64* %i.i, align 8
  br label %26

; <label>:36                                      ; preds = %26
  %37 = load i64, i64* %vectorized_size.i, align 8
  %38 = load i64, i64* %2, align 8
  %39 = add nsw i64 %37, %38
  store i64 %39, i64* %i1.i, align 8
  br label %40

; <label>:40                                      ; preds = %44, %36
  %41 = load i64, i64* %i1.i, align 8
  %42 = load i64, i64* %3, align 8
  %43 = icmp slt i64 %41, %42
  br i1 %43, label %44, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_23scalar_sqrt_gradient_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEKNS4_INS5_ISC_Li1ELi1ElEELi16ES7_EEEEEENS_9GpuDeviceEEElLb1EE3runERSO_lll.exit

; <label>:44                                      ; preds = %40
  %45 = load %"struct.Eigen::TensorEvaluator.7"*, %"struct.Eigen::TensorEvaluator.7"** %1, align 8
  %46 = load i64, i64* %i1.i, align 8
  call void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEKNS2_INS3_ISB_Li1ELi1ElEELi16ES5_EEEEEENS_9GpuDeviceEE10evalScalarEl(%"struct.Eigen::TensorEvaluator.7"* %45, i64 %46)
  %47 = load i64, i64* %4, align 8
  %48 = load i64, i64* %i1.i, align 8
  %49 = add nsw i64 %48, %47
  store i64 %49, i64* %i1.i, align 8
  br label %40

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_23scalar_sqrt_gradient_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEKNS4_INS5_ISC_Li1ELi1ElEELi16ES7_EEEEEENS_9GpuDeviceEEElLb1EE3runERSO_lll.exit: ; preds = %40
  ret void
}

; Function Attrs: inlinehint
define linkonce_odr void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEKNS2_INS3_ISB_Li1ELi1ElEELi16ES5_EEEEEENS_9GpuDeviceEE10evalPacketEl(%"struct.Eigen::TensorEvaluator.7"* %this, i64 %i) #4 comdat align 2 {
  %1 = alloca %"struct.Eigen::TensorEvaluator.7"*, align 8
  %2 = alloca i64, align 8
  %LhsStoreMode = alloca i32, align 4
  %RhsLoadMode = alloca i32, align 4
  %3 = alloca %struct.float4, align 4
  store %"struct.Eigen::TensorEvaluator.7"* %this, %"struct.Eigen::TensorEvaluator.7"** %1, align 8
  store i64 %i, i64* %2, align 8
  %4 = load %"struct.Eigen::TensorEvaluator.7"*, %"struct.Eigen::TensorEvaluator.7"** %1, align 8
  store i32 16, i32* %LhsStoreMode, align 4
  store i32 16, i32* %RhsLoadMode, align 4
  %5 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %4, i32 0, i32 0
  %6 = load i64, i64* %2, align 8
  %7 = trunc i64 %6 to i32
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %4, i32 0, i32 1
  %9 = load i64, i64* %2, align 8
  %10 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS5_INS6_IS7_Li1ELi1ElEELi16ES9_EEEENS_9GpuDeviceEE6packetILi16EEE6float4l(%"struct.Eigen::TensorEvaluator.8"* %8, i64 %9)
  %11 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 0
  %12 = extractvalue %struct.float4 %10, 0
  store float %12, float* %11, align 4
  %13 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 1
  %14 = extractvalue %struct.float4 %10, 1
  store float %14, float* %13, align 4
  %15 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 2
  %16 = extractvalue %struct.float4 %10, 2
  store float %16, float* %15, align 4
  %17 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 3
  %18 = extractvalue %struct.float4 %10, 3
  store float %18, float* %17, align 4
  call void @_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE11writePacketILi16EEEviRK6float4(%"struct.Eigen::TensorEvaluator.0"* %5, i32 %7, %struct.float4* dereferenceable(16) %3)
  ret void
}

; Function Attrs: inlinehint
define linkonce_odr void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS2_INS3_IKfLi1ELi1EiEELi16ES5_EEKNS2_INS3_ISB_Li1ELi1ElEELi16ES5_EEEEEENS_9GpuDeviceEE10evalScalarEl(%"struct.Eigen::TensorEvaluator.7"* %this, i64 %i) #4 comdat align 2 {
  %1 = alloca %"struct.Eigen::TensorEvaluator.7"*, align 8
  %2 = alloca i64, align 8
  store %"struct.Eigen::TensorEvaluator.7"* %this, %"struct.Eigen::TensorEvaluator.7"** %1, align 8
  store i64 %i, i64* %2, align 8
  %3 = load %"struct.Eigen::TensorEvaluator.7"*, %"struct.Eigen::TensorEvaluator.7"** %1, align 8
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %3, i32 0, i32 1
  %5 = load i64, i64* %2, align 8
  %6 = call float @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS5_INS6_IS7_Li1ELi1ElEELi16ES9_EEEENS_9GpuDeviceEE5coeffEl(%"struct.Eigen::TensorEvaluator.8"* %4, i64 %5)
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %3, i32 0, i32 0
  %8 = load i64, i64* %2, align 8
  %9 = trunc i64 %8 to i32
  %10 = call dereferenceable(4) float* @_ZN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE8coeffRefEi(%"struct.Eigen::TensorEvaluator.0"* %7, i32 %9)
  store float %6, float* %10, align 4
  ret void
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS5_INS6_IS7_Li1ELi1ElEELi16ES9_EEEENS_9GpuDeviceEE6packetILi16EEE6float4l(%"struct.Eigen::TensorEvaluator.8"* %this, i64 %index) #4 comdat align 2 {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %"struct.Eigen::TensorEvaluator.8"*, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.float4, align 4
  %5 = alloca %struct.float4, align 4
  store %"struct.Eigen::TensorEvaluator.8"* %this, %"struct.Eigen::TensorEvaluator.8"** %2, align 8
  store i64 %index, i64* %3, align 8
  %6 = load %"struct.Eigen::TensorEvaluator.8"*, %"struct.Eigen::TensorEvaluator.8"** %2, align 8
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %6, i32 0, i32 0
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %6, i32 0, i32 1
  %9 = load i64, i64* %3, align 8
  %10 = trunc i64 %9 to i32
  %11 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE6packetILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.3"* %8, i32 %10)
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 0
  %13 = extractvalue %struct.float4 %11, 0
  store float %13, float* %12, align 4
  %14 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 1
  %15 = extractvalue %struct.float4 %11, 1
  store float %15, float* %14, align 4
  %16 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 2
  %17 = extractvalue %struct.float4 %11, 2
  store float %17, float* %16, align 4
  %18 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 3
  %19 = extractvalue %struct.float4 %11, 3
  store float %19, float* %18, align 4
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %6, i32 0, i32 2
  %21 = load i64, i64* %3, align 8
  %22 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1ElEELi16ENS_11MakePointerEEENS_9GpuDeviceEE6packetILi16EEE6float4l(%"struct.Eigen::TensorEvaluator.9"* %20, i64 %21)
  %23 = getelementptr inbounds %struct.float4, %struct.float4* %5, i32 0, i32 0
  %24 = extractvalue %struct.float4 %22, 0
  store float %24, float* %23, align 4
  %25 = getelementptr inbounds %struct.float4, %struct.float4* %5, i32 0, i32 1
  %26 = extractvalue %struct.float4 %22, 1
  store float %26, float* %25, align 4
  %27 = getelementptr inbounds %struct.float4, %struct.float4* %5, i32 0, i32 2
  %28 = extractvalue %struct.float4 %22, 2
  store float %28, float* %27, align 4
  %29 = getelementptr inbounds %struct.float4, %struct.float4* %5, i32 0, i32 3
  %30 = extractvalue %struct.float4 %22, 3
  store float %30, float* %29, align 4
  %31 = call %struct.float4 @_ZNK5Eigen8internal23scalar_sqrt_gradient_opIfE8packetOpI6float4EEKT_RS6_S7_(%"struct.Eigen::internal::scalar_sqrt_gradient_op"* %7, %struct.float4* dereferenceable(16) %4, %struct.float4* dereferenceable(16) %5)
  %32 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %33 = extractvalue %struct.float4 %31, 0
  store float %33, float* %32, align 4
  %34 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %35 = extractvalue %struct.float4 %31, 1
  store float %35, float* %34, align 4
  %36 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %37 = extractvalue %struct.float4 %31, 2
  store float %37, float* %36, align 4
  %38 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %39 = extractvalue %struct.float4 %31, 3
  store float %39, float* %38, align 4
  %40 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %40
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZNK5Eigen8internal23scalar_sqrt_gradient_opIfE8packetOpI6float4EEKT_RS6_S7_(%"struct.Eigen::internal::scalar_sqrt_gradient_op"* %this, %struct.float4* dereferenceable(16) %output, %struct.float4* dereferenceable(16) %output_gradient) #4 comdat align 2 {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %"struct.Eigen::internal::scalar_sqrt_gradient_op"*, align 8
  %3 = alloca %struct.float4*, align 8
  %4 = alloca %struct.float4*, align 8
  %const_half = alloca %struct.float4, align 4
  %5 = alloca float, align 4
  %out_conj = alloca %struct.float4, align 4
  %6 = alloca %struct.float4, align 4
  store %"struct.Eigen::internal::scalar_sqrt_gradient_op"* %this, %"struct.Eigen::internal::scalar_sqrt_gradient_op"** %2, align 8
  store %struct.float4* %output, %struct.float4** %3, align 8
  store %struct.float4* %output_gradient, %struct.float4** %4, align 8
  %7 = load %"struct.Eigen::internal::scalar_sqrt_gradient_op"*, %"struct.Eigen::internal::scalar_sqrt_gradient_op"** %2, align 8
  store float 5.000000e-01, float* %5, align 4
  %8 = call %struct.float4 @_ZN5Eigen8internal5pset1I6float4EET_RKNS0_15unpacket_traitsIS3_E4typeE(float* dereferenceable(4) %5)
  %9 = getelementptr inbounds %struct.float4, %struct.float4* %const_half, i32 0, i32 0
  %10 = extractvalue %struct.float4 %8, 0
  store float %10, float* %9, align 4
  %11 = getelementptr inbounds %struct.float4, %struct.float4* %const_half, i32 0, i32 1
  %12 = extractvalue %struct.float4 %8, 1
  store float %12, float* %11, align 4
  %13 = getelementptr inbounds %struct.float4, %struct.float4* %const_half, i32 0, i32 2
  %14 = extractvalue %struct.float4 %8, 2
  store float %14, float* %13, align 4
  %15 = getelementptr inbounds %struct.float4, %struct.float4* %const_half, i32 0, i32 3
  %16 = extractvalue %struct.float4 %8, 3
  store float %16, float* %15, align 4
  %17 = load %struct.float4*, %struct.float4** %3, align 8
  %18 = call %struct.float4 @_ZN5Eigen8internal5pconjI6float4EET_RKS3_(%struct.float4* dereferenceable(16) %17)
  %19 = getelementptr inbounds %struct.float4, %struct.float4* %out_conj, i32 0, i32 0
  %20 = extractvalue %struct.float4 %18, 0
  store float %20, float* %19, align 4
  %21 = getelementptr inbounds %struct.float4, %struct.float4* %out_conj, i32 0, i32 1
  %22 = extractvalue %struct.float4 %18, 1
  store float %22, float* %21, align 4
  %23 = getelementptr inbounds %struct.float4, %struct.float4* %out_conj, i32 0, i32 2
  %24 = extractvalue %struct.float4 %18, 2
  store float %24, float* %23, align 4
  %25 = getelementptr inbounds %struct.float4, %struct.float4* %out_conj, i32 0, i32 3
  %26 = extractvalue %struct.float4 %18, 3
  store float %26, float* %25, align 4
  %27 = load %struct.float4*, %struct.float4** %4, align 8
  %28 = call %struct.float4 @_ZN5Eigen8internal4pmulI6float4EET_RKS3_S5_(%struct.float4* dereferenceable(16) %const_half, %struct.float4* dereferenceable(16) %27)
  %29 = getelementptr inbounds %struct.float4, %struct.float4* %6, i32 0, i32 0
  %30 = extractvalue %struct.float4 %28, 0
  store float %30, float* %29, align 4
  %31 = getelementptr inbounds %struct.float4, %struct.float4* %6, i32 0, i32 1
  %32 = extractvalue %struct.float4 %28, 1
  store float %32, float* %31, align 4
  %33 = getelementptr inbounds %struct.float4, %struct.float4* %6, i32 0, i32 2
  %34 = extractvalue %struct.float4 %28, 2
  store float %34, float* %33, align 4
  %35 = getelementptr inbounds %struct.float4, %struct.float4* %6, i32 0, i32 3
  %36 = extractvalue %struct.float4 %28, 3
  store float %36, float* %35, align 4
  %37 = call %struct.float4 @_ZN5Eigen8internal4pdivI6float4EET_RKS3_S5_(%struct.float4* dereferenceable(16) %6, %struct.float4* dereferenceable(16) %out_conj)
  %38 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %39 = extractvalue %struct.float4 %37, 0
  store float %39, float* %38, align 4
  %40 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %41 = extractvalue %struct.float4 %37, 1
  store float %41, float* %40, align 4
  %42 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %43 = extractvalue %struct.float4 %37, 2
  store float %43, float* %42, align 4
  %44 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %45 = extractvalue %struct.float4 %37, 3
  store float %45, float* %44, align 4
  %46 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %46
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1ElEELi16ENS_11MakePointerEEENS_9GpuDeviceEE6packetILi16EEE6float4l(%"struct.Eigen::TensorEvaluator.9"* %this, i64 %index) #4 comdat align 2 {
  %1 = alloca %struct.float4, align 4
  %2 = alloca float*, align 8
  %3 = alloca %struct.float4, align 4
  %4 = alloca %"struct.Eigen::TensorEvaluator.9"*, align 8
  %5 = alloca i64, align 8
  store %"struct.Eigen::TensorEvaluator.9"* %this, %"struct.Eigen::TensorEvaluator.9"** %4, align 8
  store i64 %index, i64* %5, align 8
  %6 = load %"struct.Eigen::TensorEvaluator.9"*, %"struct.Eigen::TensorEvaluator.9"** %4, align 8
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.9", %"struct.Eigen::TensorEvaluator.9"* %6, i32 0, i32 0
  %8 = load float*, float** %7, align 8
  %9 = load i64, i64* %5, align 8
  %10 = getelementptr inbounds float, float* %8, i64 %9
  store float* %10, float** %2, align 8
  %11 = load float*, float** %2, align 8
  %12 = load float, float* %11, align 4
  %13 = load float*, float** %2, align 8
  %14 = getelementptr inbounds float, float* %13, i64 1
  %15 = load float, float* %14, align 4
  %16 = load float*, float** %2, align 8
  %17 = getelementptr inbounds float, float* %16, i64 2
  %18 = load float, float* %17, align 4
  %19 = load float*, float** %2, align 8
  %20 = getelementptr inbounds float, float* %19, i64 3
  %21 = load float, float* %20, align 4
  %22 = call %struct.float4 @_Z11make_float4ffff(float %12, float %15, float %18, float %21)
  %23 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %24 = extractvalue %struct.float4 %22, 0
  store float %24, float* %23, align 4
  %25 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %26 = extractvalue %struct.float4 %22, 1
  store float %26, float* %25, align 4
  %27 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %28 = extractvalue %struct.float4 %22, 2
  store float %28, float* %27, align 4
  %29 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %30 = extractvalue %struct.float4 %22, 3
  store float %30, float* %29, align 4
  %31 = load %struct.float4, %struct.float4* %1, align 4
  %32 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 0
  %33 = extractvalue %struct.float4 %31, 0
  store float %33, float* %32, align 4
  %34 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 1
  %35 = extractvalue %struct.float4 %31, 1
  store float %35, float* %34, align 4
  %36 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 2
  %37 = extractvalue %struct.float4 %31, 2
  store float %37, float* %36, align 4
  %38 = getelementptr inbounds %struct.float4, %struct.float4* %3, i32 0, i32 3
  %39 = extractvalue %struct.float4 %31, 3
  store float %39, float* %38, align 4
  %40 = load %struct.float4, %struct.float4* %3, align 4
  ret %struct.float4 %40
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZN5Eigen8internal5pset1I6float4EET_RKNS0_15unpacket_traitsIS3_E4typeE(float* dereferenceable(4) %from) #4 comdat {
  %1 = alloca %struct.float4, align 4
  %2 = alloca float*, align 8
  store float* %from, float** %2, align 8
  %3 = load float*, float** %2, align 8
  %4 = load float, float* %3, align 4
  %5 = load float*, float** %2, align 8
  %6 = load float, float* %5, align 4
  %7 = load float*, float** %2, align 8
  %8 = load float, float* %7, align 4
  %9 = load float*, float** %2, align 8
  %10 = load float, float* %9, align 4
  %11 = call %struct.float4 @_Z11make_float4ffff(float %4, float %6, float %8, float %10)
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %13 = extractvalue %struct.float4 %11, 0
  store float %13, float* %12, align 4
  %14 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %15 = extractvalue %struct.float4 %11, 1
  store float %15, float* %14, align 4
  %16 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %17 = extractvalue %struct.float4 %11, 2
  store float %17, float* %16, align 4
  %18 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %19 = extractvalue %struct.float4 %11, 3
  store float %19, float* %18, align 4
  %20 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %20
}

; Function Attrs: inlinehint nounwind
define linkonce_odr %struct.float4 @_ZN5Eigen8internal5pconjI6float4EET_RKS3_(%struct.float4* dereferenceable(16) %a) #5 comdat {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %struct.float4*, align 8
  store %struct.float4* %a, %struct.float4** %2, align 8
  %3 = load %struct.float4*, %struct.float4** %2, align 8
  %4 = bitcast %struct.float4* %1 to i8*
  %5 = bitcast %struct.float4* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 16, i32 4, i1 false)
  %6 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %6
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZN5Eigen8internal4pdivI6float4EET_RKS3_S5_(%struct.float4* dereferenceable(16) %a, %struct.float4* dereferenceable(16) %b) #4 comdat {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %struct.float4*, align 8
  %3 = alloca %struct.float4*, align 8
  store %struct.float4* %a, %struct.float4** %2, align 8
  store %struct.float4* %b, %struct.float4** %3, align 8
  %4 = load %struct.float4*, %struct.float4** %2, align 8
  %5 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 0
  %6 = load float, float* %5, align 4
  %7 = load %struct.float4*, %struct.float4** %3, align 8
  %8 = getelementptr inbounds %struct.float4, %struct.float4* %7, i32 0, i32 0
  %9 = load float, float* %8, align 4
  %10 = fdiv float %6, %9
  %11 = load %struct.float4*, %struct.float4** %2, align 8
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %11, i32 0, i32 1
  %13 = load float, float* %12, align 4
  %14 = load %struct.float4*, %struct.float4** %3, align 8
  %15 = getelementptr inbounds %struct.float4, %struct.float4* %14, i32 0, i32 1
  %16 = load float, float* %15, align 4
  %17 = fdiv float %13, %16
  %18 = load %struct.float4*, %struct.float4** %2, align 8
  %19 = getelementptr inbounds %struct.float4, %struct.float4* %18, i32 0, i32 2
  %20 = load float, float* %19, align 4
  %21 = load %struct.float4*, %struct.float4** %3, align 8
  %22 = getelementptr inbounds %struct.float4, %struct.float4* %21, i32 0, i32 2
  %23 = load float, float* %22, align 4
  %24 = fdiv float %20, %23
  %25 = load %struct.float4*, %struct.float4** %2, align 8
  %26 = getelementptr inbounds %struct.float4, %struct.float4* %25, i32 0, i32 3
  %27 = load float, float* %26, align 4
  %28 = load %struct.float4*, %struct.float4** %3, align 8
  %29 = getelementptr inbounds %struct.float4, %struct.float4* %28, i32 0, i32 3
  %30 = load float, float* %29, align 4
  %31 = fdiv float %27, %30
  %32 = call %struct.float4 @_Z11make_float4ffff(float %10, float %17, float %24, float %31)
  %33 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %34 = extractvalue %struct.float4 %32, 0
  store float %34, float* %33, align 4
  %35 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %36 = extractvalue %struct.float4 %32, 1
  store float %36, float* %35, align 4
  %37 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %38 = extractvalue %struct.float4 %32, 2
  store float %38, float* %37, align 4
  %39 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %40 = extractvalue %struct.float4 %32, 3
  store float %40, float* %39, align 4
  %41 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %41
}

; Function Attrs: inlinehint
define linkonce_odr %struct.float4 @_ZN5Eigen8internal4pmulI6float4EET_RKS3_S5_(%struct.float4* dereferenceable(16) %a, %struct.float4* dereferenceable(16) %b) #4 comdat {
  %1 = alloca %struct.float4, align 4
  %2 = alloca %struct.float4*, align 8
  %3 = alloca %struct.float4*, align 8
  store %struct.float4* %a, %struct.float4** %2, align 8
  store %struct.float4* %b, %struct.float4** %3, align 8
  %4 = load %struct.float4*, %struct.float4** %2, align 8
  %5 = getelementptr inbounds %struct.float4, %struct.float4* %4, i32 0, i32 0
  %6 = load float, float* %5, align 4
  %7 = load %struct.float4*, %struct.float4** %3, align 8
  %8 = getelementptr inbounds %struct.float4, %struct.float4* %7, i32 0, i32 0
  %9 = load float, float* %8, align 4
  %10 = fmul float %6, %9
  %11 = load %struct.float4*, %struct.float4** %2, align 8
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %11, i32 0, i32 1
  %13 = load float, float* %12, align 4
  %14 = load %struct.float4*, %struct.float4** %3, align 8
  %15 = getelementptr inbounds %struct.float4, %struct.float4* %14, i32 0, i32 1
  %16 = load float, float* %15, align 4
  %17 = fmul float %13, %16
  %18 = load %struct.float4*, %struct.float4** %2, align 8
  %19 = getelementptr inbounds %struct.float4, %struct.float4* %18, i32 0, i32 2
  %20 = load float, float* %19, align 4
  %21 = load %struct.float4*, %struct.float4** %3, align 8
  %22 = getelementptr inbounds %struct.float4, %struct.float4* %21, i32 0, i32 2
  %23 = load float, float* %22, align 4
  %24 = fmul float %20, %23
  %25 = load %struct.float4*, %struct.float4** %2, align 8
  %26 = getelementptr inbounds %struct.float4, %struct.float4* %25, i32 0, i32 3
  %27 = load float, float* %26, align 4
  %28 = load %struct.float4*, %struct.float4** %3, align 8
  %29 = getelementptr inbounds %struct.float4, %struct.float4* %28, i32 0, i32 3
  %30 = load float, float* %29, align 4
  %31 = fmul float %27, %30
  %32 = call %struct.float4 @_Z11make_float4ffff(float %10, float %17, float %24, float %31)
  %33 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 0
  %34 = extractvalue %struct.float4 %32, 0
  store float %34, float* %33, align 4
  %35 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 1
  %36 = extractvalue %struct.float4 %32, 1
  store float %36, float* %35, align 4
  %37 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 2
  %38 = extractvalue %struct.float4 %32, 2
  store float %38, float* %37, align 4
  %39 = getelementptr inbounds %struct.float4, %struct.float4* %1, i32 0, i32 3
  %40 = extractvalue %struct.float4 %32, 3
  store float %40, float* %39, align 4
  %41 = load %struct.float4, %struct.float4* %1, align 4
  ret %struct.float4 %41
}

define linkonce_odr float @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal23scalar_sqrt_gradient_opIfEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS5_INS6_IS7_Li1ELi1ElEELi16ES9_EEEENS_9GpuDeviceEE5coeffEl(%"struct.Eigen::TensorEvaluator.8"* %this, i64 %index) #2 comdat align 2 {
  %1 = alloca %"struct.Eigen::TensorEvaluator.8"*, align 8
  %2 = alloca i64, align 8
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store %"struct.Eigen::TensorEvaluator.8"* %this, %"struct.Eigen::TensorEvaluator.8"** %1, align 8
  store i64 %index, i64* %2, align 8
  %5 = load %"struct.Eigen::TensorEvaluator.8"*, %"struct.Eigen::TensorEvaluator.8"** %1, align 8
  %6 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %5, i32 0, i32 1
  %8 = load i64, i64* %2, align 8
  %9 = trunc i64 %8 to i32
  %10 = call float @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::TensorEvaluator.3"* %7, i32 %9)
  store float %10, float* %3, align 4
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %5, i32 0, i32 2
  %12 = load i64, i64* %2, align 8
  %13 = call float @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1ElEELi16ENS_11MakePointerEEENS_9GpuDeviceEE5coeffEl(%"struct.Eigen::TensorEvaluator.9"* %11, i64 %12)
  store float %13, float* %4, align 4
  %14 = call float @_ZNK5Eigen8internal23scalar_sqrt_gradient_opIfEclERKfS4_(%"struct.Eigen::internal::scalar_sqrt_gradient_op"* %6, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  ret float %14
}

; Function Attrs: inlinehint
define linkonce_odr float @_ZNK5Eigen8internal23scalar_sqrt_gradient_opIfEclERKfS4_(%"struct.Eigen::internal::scalar_sqrt_gradient_op"* %this, float* dereferenceable(4) %output, float* dereferenceable(4) %output_gradient) #4 comdat align 2 {
  %1 = alloca %"struct.Eigen::internal::scalar_sqrt_gradient_op"*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %out_conj = alloca float, align 4
  store %"struct.Eigen::internal::scalar_sqrt_gradient_op"* %this, %"struct.Eigen::internal::scalar_sqrt_gradient_op"** %1, align 8
  store float* %output, float** %2, align 8
  store float* %output_gradient, float** %3, align 8
  %4 = load %"struct.Eigen::internal::scalar_sqrt_gradient_op"*, %"struct.Eigen::internal::scalar_sqrt_gradient_op"** %1, align 8
  %5 = load float*, float** %2, align 8
  %6 = call float @_ZN5Eigen6numext4conjIfEENS_8internal11conj_retvalINS2_36global_math_functions_filtering_baseIT_vE4typeEE4typeERKS5_(float* dereferenceable(4) %5)
  store float %6, float* %out_conj, align 4
  %7 = load float*, float** %3, align 8
  %8 = load float, float* %7, align 4
  %9 = fmul float 5.000000e-01, %8
  %10 = load float, float* %out_conj, align 4
  %11 = fdiv float %9, %10
  ret float %11
}

; Function Attrs: inlinehint nounwind
define linkonce_odr float @_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi1ELi1ElEELi16ENS_11MakePointerEEENS_9GpuDeviceEE5coeffEl(%"struct.Eigen::TensorEvaluator.9"* %this, i64 %index) #5 comdat align 2 {
  %1 = alloca float*, align 8
  %2 = alloca %"struct.Eigen::TensorEvaluator.9"*, align 8
  %3 = alloca i64, align 8
  store %"struct.Eigen::TensorEvaluator.9"* %this, %"struct.Eigen::TensorEvaluator.9"** %2, align 8
  store i64 %index, i64* %3, align 8
  %4 = load %"struct.Eigen::TensorEvaluator.9"*, %"struct.Eigen::TensorEvaluator.9"** %2, align 8
  %5 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.9", %"struct.Eigen::TensorEvaluator.9"* %4, i32 0, i32 0
  %6 = load float*, float** %5, align 8
  %7 = load i64, i64* %3, align 8
  %8 = getelementptr inbounds float, float* %6, i64 %7
  store float* %8, float** %1, align 8
  %9 = load float*, float** %1, align 8
  %10 = load float, float* %9, align 4
  ret float %10
}

; Function Attrs: inlinehint
define linkonce_odr float @_ZN5Eigen6numext4conjIfEENS_8internal11conj_retvalINS2_36global_math_functions_filtering_baseIT_vE4typeEE4typeERKS5_(float* dereferenceable(4) %x) #4 comdat {
  %1 = alloca float*, align 8
  store float* %x, float** %1, align 8
  %2 = load float*, float** %1, align 8
  %3 = call float @_ZN5Eigen8internal9conj_implIfLb0EE3runERKf(float* dereferenceable(4) %2)
  ret float %3
}

; Function Attrs: inlinehint nounwind
define linkonce_odr float @_ZN5Eigen8internal9conj_implIfLb0EE3runERKf(float* dereferenceable(4) %x) #5 comdat align 2 {
  %1 = alloca float*, align 8
  store float* %x, float** %1, align 8
  %2 = load float*, float** %1, align 8
  %3 = load float, float* %2, align 4
  ret float %3
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { inlinehint "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}
!llvm.ident = !{!5}

!0 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_14scalar_sqrt_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!1 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_14scalar_sqrt_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!2 = !{void (%"struct.Eigen::TensorEvaluator.7"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_23scalar_sqrt_gradient_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEKNS4_INS5_ISC_Li1ELi1ElEELi16ES7_EEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!3 = !{void (%"struct.Eigen::TensorEvaluator.7"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_23scalar_sqrt_gradient_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEKNS4_INS5_ISC_Li1ELi1ElEELi16ES7_EEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!4 = !{i32 1, !"PIC Level", i32 2}
!5 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
