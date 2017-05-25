; ModuleID = 'tensorflow/core/kernels/softmax_op_gpu.cu.cc'
source_filename = "tensorflow/core/kernels/softmax_op_gpu.cu.cc"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"struct.Eigen::internal::MaxReducer" = type { i8 }
%"struct.Eigen::TensorEvaluator" = type { %"class.Eigen::array", %"struct.Eigen::DSizes", %"class.Eigen::array.0", %"class.Eigen::array.0", %"class.Eigen::array.0", %"class.Eigen::array.0", %"struct.Eigen::TensorEvaluator.1", %"struct.Eigen::internal::MaxReducer", float*, %"struct.Eigen::GpuDevice"* }
%"class.Eigen::array" = type { [2 x i8] }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array.0" }
%"class.Eigen::array.0" = type { [1 x i32] }
%"struct.Eigen::TensorEvaluator.1" = type { float*, %"struct.Eigen::DSizes.2", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap"* }
%"struct.Eigen::DSizes.2" = type { %"class.Eigen::array.3" }
%"class.Eigen::array.3" = type { [2 x i32] }
%"class.Eigen::TensorMap" = type { float*, %"struct.Eigen::DSizes.2" }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::TensorEvaluator.4" = type { %"struct.Eigen::TensorEvaluator", %"struct.Eigen::GpuDevice"*, float*, %"class.Eigen::TensorEvalToOp"*, %"class.Eigen::TensorReductionOp" }
%"class.Eigen::TensorEvalToOp" = type { %"class.Eigen::TensorReductionOp", float* }
%"class.Eigen::TensorReductionOp" = type <{ %"class.Eigen::TensorMap"*, %"struct.Eigen::DSizes", %"struct.Eigen::internal::MaxReducer", [3 x i8] }>
%"struct.Eigen::TensorEvaluator.7" = type { %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.12" }
%"struct.Eigen::TensorEvaluator.8" = type { float*, %"struct.Eigen::DSizes.2", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.9"* }
%"class.Eigen::TensorMap.9" = type { float*, %"struct.Eigen::DSizes.2" }
%"struct.Eigen::TensorEvaluator.12" = type { %"struct.Eigen::internal::scalar_difference_op", %"struct.Eigen::TensorEvaluator.1", %"struct.Eigen::TensorEvaluator.13" }
%"struct.Eigen::internal::scalar_difference_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.13" = type { %"struct.Eigen::DSizes.2", %"struct.Eigen::DSizes.2", %"class.Eigen::array.3", %"class.Eigen::array.3", %"struct.Eigen::TensorEvaluator.14" }
%"struct.Eigen::TensorEvaluator.14" = type { %"struct.Eigen::TensorEvaluator.15", %"struct.Eigen::DSizes.2" }
%"struct.Eigen::TensorEvaluator.15" = type { %"struct.Eigen::TensorEvaluator", %"class.Eigen::TensorReductionOp", %"struct.Eigen::GpuDevice"*, float* }
%struct.float4 = type { float, float, float, float }
%"struct.Eigen::internal::SumReducer" = type { i8 }
%"struct.Eigen::TensorEvaluator.16" = type { %"class.Eigen::array", %"struct.Eigen::DSizes", %"class.Eigen::array.0", %"class.Eigen::array.0", %"class.Eigen::array.0", %"class.Eigen::array.0", %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::internal::SumReducer", float*, %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.17" = type { %"struct.Eigen::internal::scalar_exp_op", %"struct.Eigen::TensorEvaluator.18" }
%"struct.Eigen::internal::scalar_exp_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.18" = type { float*, %"struct.Eigen::DSizes.2", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.9"* }
%"struct.Eigen::TensorEvaluator.20" = type { %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::GpuDevice"*, float*, %"class.Eigen::TensorEvalToOp.21"*, %"class.Eigen::TensorReductionOp.23" }
%"class.Eigen::TensorEvalToOp.21" = type { %"class.Eigen::TensorReductionOp.23", float* }
%"class.Eigen::TensorReductionOp.23" = type <{ %"class.Eigen::TensorCwiseUnaryOp", %"struct.Eigen::DSizes", %"struct.Eigen::internal::SumReducer", [3 x i8] }>
%"class.Eigen::TensorCwiseUnaryOp" = type <{ %"class.Eigen::TensorMap.9"*, %"struct.Eigen::internal::scalar_exp_op", [7 x i8] }>
%"struct.Eigen::TensorEvaluator.27" = type { %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.28" }
%"struct.Eigen::TensorEvaluator.28" = type { %"struct.Eigen::internal::scalar_difference_op.29", %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.30" }
%"struct.Eigen::internal::scalar_difference_op.29" = type { i8 }
%"struct.Eigen::TensorEvaluator.30" = type { %"struct.Eigen::DSizes.2", %"struct.Eigen::DSizes.2", %"class.Eigen::array.3", %"class.Eigen::array.3", %"struct.Eigen::TensorEvaluator.31" }
%"struct.Eigen::TensorEvaluator.31" = type { %"struct.Eigen::internal::scalar_log_op", %"struct.Eigen::TensorEvaluator.32" }
%"struct.Eigen::internal::scalar_log_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.32" = type { %"struct.Eigen::TensorEvaluator.33", %"struct.Eigen::DSizes.2" }
%"struct.Eigen::TensorEvaluator.33" = type { %"struct.Eigen::TensorEvaluator.16", %"class.Eigen::TensorReductionOp.23", %"struct.Eigen::GpuDevice"*, float* }
%"struct.Eigen::TensorEvaluator.34" = type { %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.35" }
%"struct.Eigen::TensorEvaluator.35" = type { %"struct.Eigen::internal::scalar_exp_op", %"struct.Eigen::TensorEvaluator.12" }
%"struct.Eigen::TensorEvaluator.36" = type { %"class.Eigen::array", %"struct.Eigen::DSizes", %"class.Eigen::array.0", %"class.Eigen::array.0", %"class.Eigen::array.0", %"class.Eigen::array.0", %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::internal::SumReducer", float*, %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.37" = type { %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::GpuDevice"*, float*, %"class.Eigen::TensorEvalToOp.39"*, %"class.Eigen::TensorCwiseUnaryOp.41" }
%"struct.Eigen::TensorEvaluator.38" = type { %"struct.Eigen::internal::scalar_inverse_op", %"struct.Eigen::TensorEvaluator.36" }
%"struct.Eigen::internal::scalar_inverse_op" = type { i8 }
%"class.Eigen::TensorEvalToOp.39" = type { %"class.Eigen::TensorCwiseUnaryOp.41", float* }
%"class.Eigen::TensorCwiseUnaryOp.41" = type { %"class.Eigen::TensorReductionOp.43", %"struct.Eigen::internal::scalar_inverse_op", [7 x i8] }
%"class.Eigen::TensorReductionOp.43" = type <{ %"class.Eigen::TensorMap.9"*, %"struct.Eigen::DSizes", %"struct.Eigen::internal::SumReducer", [3 x i8] }>
%"struct.Eigen::TensorEvaluator.47" = type { %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.48" }
%"struct.Eigen::TensorEvaluator.48" = type { %"struct.Eigen::internal::scalar_product_op", %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.49" }
%"struct.Eigen::internal::scalar_product_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.49" = type { %"struct.Eigen::DSizes.2", %"struct.Eigen::DSizes.2", %"class.Eigen::array.3", %"class.Eigen::array.3", %"struct.Eigen::TensorEvaluator.50" }
%"struct.Eigen::TensorEvaluator.50" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::DSizes.2" }
%"struct.Eigen::TensorEvaluator.51" = type { %"struct.Eigen::TensorEvaluator.38", %"class.Eigen::TensorCwiseUnaryOp.41", %"struct.Eigen::GpuDevice"*, float* }

$_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSL_15CoeffReturnTypeEPj = comdat any

$_ZN5Eigen8internal19ReductionInitKernelIfiEEvT_T0_PS2_ = comdat any

$_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SM_PNSL_15CoeffReturnTypeE = comdat any

$_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SM_PNSL_15CoeffReturnTypeE = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EESE_EENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSB_EEKNS4_INS5_ISB_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISJ_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSH_IiLi1EEESF_S7_EEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSP_15CoeffReturnTypeEPj = comdat any

$_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SQ_PNSP_15CoeffReturnTypeE = comdat any

$_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SQ_PNSP_15CoeffReturnTypeE = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEEKNSH_INS0_13scalar_exp_opIfEESC_EES7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSE_EEKNS4_INS5_ISE_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISM_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSK_IiLi1EEESI_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSK_15CoeffReturnTypeEPj = comdat any

$_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SL_PNSK_15CoeffReturnTypeE = comdat any

$_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SL_PNSK_15CoeffReturnTypeE = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESG_EEEESG_EENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEESC_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: norecurse nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  ret i32 0
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSL_15CoeffReturnTypeEPj(%"struct.Eigen::internal::MaxReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8, i32, float*, i32*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %7 = shl i32 %6, 15
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %9 = or i32 %7, %8
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %5
  %13 = icmp eq i32 %9, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %12
  store float 0xFFF0000000000000, float* %3, align 4, !tbaa !30
  br label %28

; <label>:15:                                     ; preds = %5
  %16 = icmp eq i32 %8, 0
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %15
  %18 = tail call i32 @_Z9atomicCASPjjj(i32* %4, i32 0, i32 1) #3
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %21, label %20

; <label>:20:                                     ; preds = %17
  br label %24

; <label>:21:                                     ; preds = %17
  %22 = tail call float @_Z10atomicExchIfET_PS0_S0_(float* %3, float 0xFFF0000000000000) #3
  tail call void @_Z13__threadfencev() #3
  %23 = tail call i32 @_Z10atomicExchIjET_PS0_S0_(i32* %4, i32 2) #3
  br label %28

; <label>:24:                                     ; preds = %20, %24
  %25 = tail call i32 @_Z9atomicCASPjjj(i32* %4, i32 2, i32 2) #3
  %26 = icmp ult i32 %25, 2
  br i1 %26, label %24, label %27

; <label>:27:                                     ; preds = %24
  br label %28

; <label>:28:                                     ; preds = %27, %21, %15, %12, %14
  tail call void @llvm.nvvm.barrier0()
  %29 = sub nsw i32 %2, %9
  %30 = icmp slt i32 %29, 32768
  %31 = select i1 %30, i32 %29, i32 32768
  %32 = icmp sgt i32 %29, 0
  br i1 %32, label %55, label %36

; <label>:33:                                     ; preds = %86
  br label %34

; <label>:34:                                     ; preds = %80, %33
  %35 = phi float [ %83, %80 ], [ %115, %33 ]
  br label %36

; <label>:36:                                     ; preds = %34, %28
  %37 = phi float [ 0xFFF0000000000000, %28 ], [ %35, %34 ]
  %38 = tail call float @_Z11__shfl_downIfET_S0_ii(float %37, i32 16, i32 32) #3
  %39 = fcmp olt float %37, %38
  %40 = select i1 %39, float %38, float %37
  %41 = tail call float @_Z11__shfl_downIfET_S0_ii(float %40, i32 8, i32 32) #3
  %42 = fcmp olt float %40, %41
  %43 = select i1 %42, float %41, float %40
  %44 = tail call float @_Z11__shfl_downIfET_S0_ii(float %43, i32 4, i32 32) #3
  %45 = fcmp olt float %43, %44
  %46 = select i1 %45, float %44, float %43
  %47 = tail call float @_Z11__shfl_downIfET_S0_ii(float %46, i32 2, i32 32) #3
  %48 = fcmp olt float %46, %47
  %49 = select i1 %48, float %47, float %46
  %50 = tail call float @_Z11__shfl_downIfET_S0_ii(float %49, i32 1, i32 32) #3
  %51 = fcmp olt float %49, %50
  %52 = select i1 %51, float %50, float %49
  %53 = and i32 %8, 31
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %118, label %137

; <label>:55:                                     ; preds = %28
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %1, i64 0, i32 6, i32 0
  %57 = load float*, float** %56, align 8, !tbaa !34
  %58 = icmp sgt i32 %31, 256
  %59 = select i1 %58, i32 %31, i32 256
  %60 = add nsw i32 %59, -1
  %61 = lshr i32 %60, 8
  %62 = add nuw nsw i32 %61, 1
  %63 = and i32 %62, 3
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %80, label %65

; <label>:65:                                     ; preds = %55
  br label %66

; <label>:66:                                     ; preds = %66, %65
  %67 = phi i32 [ 0, %65 ], [ %76, %66 ]
  %68 = phi float [ 0xFFF0000000000000, %65 ], [ %75, %66 ]
  %69 = phi i32 [ %63, %65 ], [ %77, %66 ]
  %70 = add nsw i32 %67, %9
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float* %57, i64 %71
  %73 = load float, float* %72, align 4, !tbaa !30
  %74 = fcmp olt float %68, %73
  %75 = select i1 %74, float %73, float %68
  %76 = add nuw nsw i32 %67, 256
  %77 = add i32 %69, -1
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %66, !llvm.loop !38

; <label>:79:                                     ; preds = %66
  br label %80

; <label>:80:                                     ; preds = %55, %79
  %81 = phi i32 [ 0, %55 ], [ %76, %79 ]
  %82 = phi float [ 0xFFF0000000000000, %55 ], [ %75, %79 ]
  %83 = phi float [ undef, %55 ], [ %75, %79 ]
  %84 = icmp ult i32 %60, 768
  br i1 %84, label %34, label %85

; <label>:85:                                     ; preds = %80
  br label %86

; <label>:86:                                     ; preds = %86, %85
  %87 = phi i32 [ %81, %85 ], [ %116, %86 ]
  %88 = phi float [ %82, %85 ], [ %115, %86 ]
  %89 = add nsw i32 %87, %9
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float* %57, i64 %90
  %92 = load float, float* %91, align 4, !tbaa !30
  %93 = fcmp olt float %88, %92
  %94 = select i1 %93, float %92, float %88
  %95 = add nuw nsw i32 %87, 256
  %96 = add nsw i32 %95, %9
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float* %57, i64 %97
  %99 = load float, float* %98, align 4, !tbaa !30
  %100 = fcmp olt float %94, %99
  %101 = select i1 %100, float %99, float %94
  %102 = add nsw i32 %87, 512
  %103 = add nsw i32 %102, %9
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float* %57, i64 %104
  %106 = load float, float* %105, align 4, !tbaa !30
  %107 = fcmp olt float %101, %106
  %108 = select i1 %107, float %106, float %101
  %109 = add nsw i32 %87, 768
  %110 = add nsw i32 %109, %9
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float* %57, i64 %111
  %113 = load float, float* %112, align 4, !tbaa !30
  %114 = fcmp olt float %108, %113
  %115 = select i1 %114, float %113, float %108
  %116 = add nsw i32 %87, 1024
  %117 = icmp slt i32 %116, %31
  br i1 %117, label %86, label %33

; <label>:118:                                    ; preds = %36
  %119 = bitcast float* %3 to i32*
  %120 = load i32, i32* %119, align 4, !tbaa !40
  %121 = bitcast i32 %120 to float
  %122 = fcmp uge float %121, %52
  %123 = bitcast float %52 to i32
  %124 = icmp eq i32 %123, %120
  %125 = or i1 %124, %122
  br i1 %125, label %137, label %126

; <label>:126:                                    ; preds = %118
  br label %127

; <label>:127:                                    ; preds = %126, %131
  %128 = phi i32 [ %129, %131 ], [ %120, %126 ]
  %129 = tail call i32 @_Z9atomicCASPjjj(i32* %119, i32 %128, i32 %123) #3
  %130 = icmp eq i32 %129, %128
  br i1 %130, label %136, label %131

; <label>:131:                                    ; preds = %127
  %132 = bitcast i32 %129 to float
  %133 = fcmp uge float %132, %52
  %134 = icmp eq i32 %123, %129
  %135 = or i1 %134, %133
  br i1 %135, label %136, label %127

; <label>:136:                                    ; preds = %127, %131
  br label %137

; <label>:137:                                    ; preds = %136, %118, %36
  %138 = icmp ugt i32 %10, 1
  %139 = icmp eq i32 %8, 0
  %140 = and i1 %139, %138
  br i1 %140, label %141, label %144

; <label>:141:                                    ; preds = %137
  %142 = add nuw i32 %10, 1
  %143 = tail call i32 @_Z9atomicIncIjET_PS0_S0_(i32* %4, i32 %142) #3
  br label %144

; <label>:144:                                    ; preds = %141, %137
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @_Z9atomicCASPjjj(i32*, i32, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare void @_Z13__threadfencev() local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare i32 @_Z10atomicExchIjET_PS0_S0_(i32*, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #3

; Function Attrs: convergent nounwind
declare float @_Z11__shfl_downIfET_S0_ii(float, i32, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare i32 @_Z9atomicIncIjET_PS0_S0_(i32*, i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #4

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #4

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #4

; Function Attrs: convergent nounwind
declare float @_Z10atomicExchIfET_PS0_S0_(float*, float) local_unnamed_addr #2

; Function Attrs: nounwind
define void @_ZN5Eigen8internal19ReductionInitKernelIfiEEvT_T0_PS2_(float, i32, float* nocapture) local_unnamed_addr #5 comdat {
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %6 = mul i32 %5, %4
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %10 = mul i32 %9, %5
  %11 = icmp slt i32 %8, %1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %3
  br label %15

; <label>:13:                                     ; preds = %15
  br label %14

; <label>:14:                                     ; preds = %13, %3
  ret void

; <label>:15:                                     ; preds = %12, %15
  %16 = phi i32 [ %19, %15 ], [ %8, %12 ]
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %2, i64 %17
  store float %0, float* %18, align 4, !tbaa !30
  %19 = add nsw i32 %16, %10
  %20 = icmp slt i32 %19, %1
  br i1 %20, label %15, label %13
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #4

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SM_PNSL_15CoeffReturnTypeE(%"struct.Eigen::internal::MaxReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8, i32, i32, float*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %7 = shl nuw nsw i32 %6, 7
  %8 = add i32 %2, -1
  %9 = add i32 %8, %7
  %10 = udiv i32 %9, %7
  %11 = mul nsw i32 %10, %3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %13 = mul i32 %12, %6
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %16 = icmp eq i32 %12, 1
  br i1 %16, label %23, label %17

; <label>:17:                                     ; preds = %29, %5
  %18 = icmp slt i32 %14, %11
  br i1 %18, label %19, label %37

; <label>:19:                                     ; preds = %17
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %1, i64 0, i32 6, i32 0
  %21 = and i32 %15, 31
  %22 = icmp eq i32 %21, 0
  br label %38

; <label>:23:                                     ; preds = %5
  %24 = mul i32 %14, %6
  %25 = add i32 %24, %15
  %26 = icmp slt i32 %25, %3
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23
  br label %30

; <label>:28:                                     ; preds = %30
  br label %29

; <label>:29:                                     ; preds = %28, %23
  tail call void @llvm.nvvm.barrier0()
  br label %17

; <label>:30:                                     ; preds = %27, %30
  %31 = phi i32 [ %34, %30 ], [ %25, %27 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float* %4, i64 %32
  store float 0xFFF0000000000000, float* %33, align 4, !tbaa !30
  %34 = add nsw i32 %31, %13
  %35 = icmp slt i32 %34, %3
  br i1 %35, label %30, label %28

; <label>:36:                                     ; preds = %243
  br label %37

; <label>:37:                                     ; preds = %36, %17
  ret void

; <label>:38:                                     ; preds = %19, %243
  %39 = phi i32 [ %14, %19 ], [ %244, %243 ]
  %40 = sdiv i32 %39, %10
  %41 = icmp slt i32 %40, %3
  br i1 %41, label %42, label %243

; <label>:42:                                     ; preds = %38
  %43 = srem i32 %39, %10
  %44 = mul i32 %7, %43
  %45 = add i32 %44, %15
  %46 = mul nsw i32 %40, %2
  %47 = add i32 %45, %46
  br label %48

; <label>:48:                                     ; preds = %42, %56
  %49 = phi i32 [ 0, %42 ], [ %51, %56 ]
  %50 = phi float [ 0xFFF0000000000000, %42 ], [ %184, %56 ]
  %51 = add nuw nsw i32 %49, 16
  %52 = or i32 %49, 15
  %53 = mul i32 %52, %6
  %54 = add i32 %53, %45
  %55 = icmp slt i32 %54, %2
  br i1 %55, label %56, label %186

; <label>:56:                                     ; preds = %48
  %57 = load float*, float** %20, align 8, !tbaa !34
  %58 = mul i32 %49, %6
  %59 = add i32 %47, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float* %57, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !30
  %63 = fcmp olt float %50, %62
  %64 = select i1 %63, float %62, float %50
  %65 = or i32 %49, 1
  %66 = mul i32 %65, %6
  %67 = add i32 %47, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float* %57, i64 %68
  %70 = load float, float* %69, align 4, !tbaa !30
  %71 = fcmp olt float %64, %70
  %72 = select i1 %71, float %70, float %64
  %73 = or i32 %49, 2
  %74 = mul i32 %73, %6
  %75 = add i32 %47, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float* %57, i64 %76
  %78 = load float, float* %77, align 4, !tbaa !30
  %79 = fcmp olt float %72, %78
  %80 = select i1 %79, float %78, float %72
  %81 = or i32 %49, 3
  %82 = mul i32 %81, %6
  %83 = add i32 %47, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float* %57, i64 %84
  %86 = load float, float* %85, align 4, !tbaa !30
  %87 = fcmp olt float %80, %86
  %88 = select i1 %87, float %86, float %80
  %89 = or i32 %49, 4
  %90 = mul i32 %89, %6
  %91 = add i32 %47, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float* %57, i64 %92
  %94 = load float, float* %93, align 4, !tbaa !30
  %95 = fcmp olt float %88, %94
  %96 = select i1 %95, float %94, float %88
  %97 = or i32 %49, 5
  %98 = mul i32 %97, %6
  %99 = add i32 %47, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float* %57, i64 %100
  %102 = load float, float* %101, align 4, !tbaa !30
  %103 = fcmp olt float %96, %102
  %104 = select i1 %103, float %102, float %96
  %105 = or i32 %49, 6
  %106 = mul i32 %105, %6
  %107 = add i32 %47, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float* %57, i64 %108
  %110 = load float, float* %109, align 4, !tbaa !30
  %111 = fcmp olt float %104, %110
  %112 = select i1 %111, float %110, float %104
  %113 = or i32 %49, 7
  %114 = mul i32 %113, %6
  %115 = add i32 %47, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float* %57, i64 %116
  %118 = load float, float* %117, align 4, !tbaa !30
  %119 = fcmp olt float %112, %118
  %120 = select i1 %119, float %118, float %112
  %121 = or i32 %49, 8
  %122 = mul i32 %121, %6
  %123 = add i32 %47, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float* %57, i64 %124
  %126 = load float, float* %125, align 4, !tbaa !30
  %127 = fcmp olt float %120, %126
  %128 = select i1 %127, float %126, float %120
  %129 = or i32 %49, 9
  %130 = mul i32 %129, %6
  %131 = add i32 %47, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float* %57, i64 %132
  %134 = load float, float* %133, align 4, !tbaa !30
  %135 = fcmp olt float %128, %134
  %136 = select i1 %135, float %134, float %128
  %137 = or i32 %49, 10
  %138 = mul i32 %137, %6
  %139 = add i32 %47, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float* %57, i64 %140
  %142 = load float, float* %141, align 4, !tbaa !30
  %143 = fcmp olt float %136, %142
  %144 = select i1 %143, float %142, float %136
  %145 = or i32 %49, 11
  %146 = mul i32 %145, %6
  %147 = add i32 %47, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float* %57, i64 %148
  %150 = load float, float* %149, align 4, !tbaa !30
  %151 = fcmp olt float %144, %150
  %152 = select i1 %151, float %150, float %144
  %153 = or i32 %49, 12
  %154 = mul i32 %153, %6
  %155 = add i32 %47, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float* %57, i64 %156
  %158 = load float, float* %157, align 4, !tbaa !30
  %159 = fcmp olt float %152, %158
  %160 = select i1 %159, float %158, float %152
  %161 = or i32 %49, 13
  %162 = mul i32 %161, %6
  %163 = add i32 %47, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float* %57, i64 %164
  %166 = load float, float* %165, align 4, !tbaa !30
  %167 = fcmp olt float %160, %166
  %168 = select i1 %167, float %166, float %160
  %169 = or i32 %49, 14
  %170 = mul i32 %169, %6
  %171 = add i32 %47, %170
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float* %57, i64 %172
  %174 = load float, float* %173, align 4, !tbaa !30
  %175 = fcmp olt float %168, %174
  %176 = select i1 %175, float %174, float %168
  %177 = or i32 %49, 15
  %178 = mul i32 %177, %6
  %179 = add i32 %47, %178
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float* %57, i64 %180
  %182 = load float, float* %181, align 4, !tbaa !30
  %183 = fcmp olt float %176, %182
  %184 = select i1 %183, float %182, float %176
  %185 = icmp slt i32 %51, 128
  br i1 %185, label %48, label %204

; <label>:186:                                    ; preds = %48
  %187 = mul i32 %49, %6
  %188 = add i32 %187, %45
  %189 = icmp slt i32 %188, %2
  br i1 %189, label %190, label %205

; <label>:190:                                    ; preds = %186
  %191 = load float*, float** %20, align 8, !tbaa !34
  br label %192

; <label>:192:                                    ; preds = %190, %192
  %193 = phi i32 [ %188, %190 ], [ %201, %192 ]
  %194 = phi float [ %50, %190 ], [ %200, %192 ]
  %195 = add nsw i32 %193, %46
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float* %191, i64 %196
  %198 = load float, float* %197, align 4, !tbaa !30
  %199 = fcmp olt float %194, %198
  %200 = select i1 %199, float %198, float %194
  %201 = add i32 %193, %6
  %202 = icmp slt i32 %201, %2
  br i1 %202, label %192, label %203

; <label>:203:                                    ; preds = %192
  br label %205

; <label>:204:                                    ; preds = %56
  br label %205

; <label>:205:                                    ; preds = %204, %203, %186
  %206 = phi float [ %50, %186 ], [ %200, %203 ], [ %184, %204 ]
  %207 = tail call float @_Z11__shfl_downIfET_S0_i(float %206, i32 16) #3
  %208 = fcmp olt float %206, %207
  %209 = select i1 %208, float %207, float %206
  %210 = tail call float @_Z11__shfl_downIfET_S0_i(float %209, i32 8) #3
  %211 = fcmp olt float %209, %210
  %212 = select i1 %211, float %210, float %209
  %213 = tail call float @_Z11__shfl_downIfET_S0_i(float %212, i32 4) #3
  %214 = fcmp olt float %212, %213
  %215 = select i1 %214, float %213, float %212
  %216 = tail call float @_Z11__shfl_downIfET_S0_i(float %215, i32 2) #3
  %217 = fcmp olt float %215, %216
  %218 = select i1 %217, float %216, float %215
  %219 = tail call float @_Z11__shfl_downIfET_S0_i(float %218, i32 1) #3
  %220 = fcmp olt float %218, %219
  %221 = select i1 %220, float %219, float %218
  br i1 %22, label %222, label %243

; <label>:222:                                    ; preds = %205
  %223 = sext i32 %40 to i64
  %224 = getelementptr inbounds float, float* %4, i64 %223
  %225 = bitcast float* %224 to i32*
  %226 = load i32, i32* %225, align 4, !tbaa !40
  %227 = bitcast i32 %226 to float
  %228 = fcmp uge float %227, %221
  %229 = bitcast float %221 to i32
  %230 = icmp eq i32 %229, %226
  %231 = or i1 %230, %228
  br i1 %231, label %243, label %232

; <label>:232:                                    ; preds = %222
  br label %233

; <label>:233:                                    ; preds = %232, %237
  %234 = phi i32 [ %235, %237 ], [ %226, %232 ]
  %235 = tail call i32 @_Z9atomicCASPjjj(i32* %225, i32 %234, i32 %229) #3
  %236 = icmp eq i32 %235, %234
  br i1 %236, label %242, label %237

; <label>:237:                                    ; preds = %233
  %238 = bitcast i32 %235 to float
  %239 = fcmp uge float %238, %221
  %240 = icmp eq i32 %229, %235
  %241 = or i1 %240, %239
  br i1 %241, label %242, label %233

; <label>:242:                                    ; preds = %237, %233
  br label %243

; <label>:243:                                    ; preds = %242, %205, %222, %38
  %244 = add i32 %39, %12
  %245 = icmp slt i32 %244, %11
  br i1 %245, label %38, label %36
}

; Function Attrs: convergent nounwind
declare float @_Z11__shfl_downIfET_S0_i(float, i32) local_unnamed_addr #2

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SM_PNSL_15CoeffReturnTypeE(%"struct.Eigen::internal::MaxReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8, i32, i32, float*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %8 = mul i32 %7, %6
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %10 = mul i32 %9, %6
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %12 = add i32 %10, %11
  %13 = icmp eq i32 %7, 1
  br i1 %13, label %14, label %25

; <label>:14:                                     ; preds = %5
  %15 = icmp slt i32 %12, %3
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %14
  br label %19

; <label>:17:                                     ; preds = %19
  br label %18

; <label>:18:                                     ; preds = %17, %14
  tail call void @llvm.nvvm.barrier0()
  br label %25

; <label>:19:                                     ; preds = %16, %19
  %20 = phi i32 [ %23, %19 ], [ %12, %16 ]
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %4, i64 %21
  store float 0xFFF0000000000000, float* %22, align 4, !tbaa !30
  %23 = add nsw i32 %20, %8
  %24 = icmp slt i32 %23, %3
  br i1 %24, label %19, label %17

; <label>:25:                                     ; preds = %18, %5
  %26 = add i32 %2, 15
  %27 = sdiv i32 %26, 16
  %28 = mul nsw i32 %27, %3
  %29 = icmp slt i32 %12, %28
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %25
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %1, i64 0, i32 6, i32 0
  %32 = xor i32 %2, -1
  br label %35

; <label>:33:                                     ; preds = %102
  br label %34

; <label>:34:                                     ; preds = %33, %25
  ret void

; <label>:35:                                     ; preds = %30, %102
  %36 = phi i32 [ %12, %30 ], [ %103, %102 ]
  %37 = srem i32 %36, %3
  %38 = sdiv i32 %36, %3
  %39 = shl nsw i32 %38, 4
  %40 = add nsw i32 %39, 16
  %41 = icmp sgt i32 %40, %2
  %42 = select i1 %41, i32 %2, i32 %40
  %43 = icmp slt i32 %39, %42
  br i1 %43, label %44, label %80

; <label>:44:                                     ; preds = %35
  %45 = load float*, float** %31, align 8, !tbaa !34
  %46 = sub i32 -17, %39
  %47 = icmp slt i32 %46, %32
  %48 = select i1 %47, i32 %32, i32 %46
  %49 = xor i32 %48, 3
  %50 = sub i32 %49, %39
  %51 = sub i32 -2, %48
  %52 = sub i32 %51, %39
  %53 = and i32 %50, 3
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %71, label %55

; <label>:55:                                     ; preds = %44
  br label %56

; <label>:56:                                     ; preds = %56, %55
  %57 = phi i32 [ %39, %55 ], [ %67, %56 ]
  %58 = phi float [ 0xFFF0000000000000, %55 ], [ %66, %56 ]
  %59 = phi i32 [ %53, %55 ], [ %68, %56 ]
  %60 = mul nsw i32 %57, %3
  %61 = add nsw i32 %60, %37
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %45, i64 %62
  %64 = load float, float* %63, align 4, !tbaa !30
  %65 = fcmp olt float %58, %64
  %66 = select i1 %65, float %64, float %58
  %67 = add nsw i32 %57, 1
  %68 = add i32 %59, -1
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %56, !llvm.loop !43

; <label>:70:                                     ; preds = %56
  br label %71

; <label>:71:                                     ; preds = %44, %70
  %72 = phi i32 [ %39, %44 ], [ %67, %70 ]
  %73 = phi float [ 0xFFF0000000000000, %44 ], [ %66, %70 ]
  %74 = phi float [ undef, %44 ], [ %66, %70 ]
  %75 = icmp ult i32 %52, 3
  br i1 %75, label %78, label %76

; <label>:76:                                     ; preds = %71
  br label %105

; <label>:77:                                     ; preds = %105
  br label %78

; <label>:78:                                     ; preds = %71, %77
  %79 = phi float [ %74, %71 ], [ %138, %77 ]
  br label %80

; <label>:80:                                     ; preds = %78, %35
  %81 = phi float [ 0xFFF0000000000000, %35 ], [ %79, %78 ]
  %82 = sext i32 %37 to i64
  %83 = getelementptr inbounds float, float* %4, i64 %82
  %84 = bitcast float* %83 to i32*
  %85 = load i32, i32* %84, align 4, !tbaa !40
  %86 = bitcast i32 %85 to float
  %87 = fcmp uge float %86, %81
  %88 = bitcast float %81 to i32
  %89 = icmp eq i32 %88, %85
  %90 = or i1 %89, %87
  br i1 %90, label %102, label %91

; <label>:91:                                     ; preds = %80
  br label %92

; <label>:92:                                     ; preds = %91, %96
  %93 = phi i32 [ %94, %96 ], [ %85, %91 ]
  %94 = tail call i32 @_Z9atomicCASPjjj(i32* %84, i32 %93, i32 %88) #3
  %95 = icmp eq i32 %94, %93
  br i1 %95, label %101, label %96

; <label>:96:                                     ; preds = %92
  %97 = bitcast i32 %94 to float
  %98 = fcmp uge float %97, %81
  %99 = icmp eq i32 %88, %94
  %100 = or i1 %99, %98
  br i1 %100, label %101, label %92

; <label>:101:                                    ; preds = %96, %92
  br label %102

; <label>:102:                                    ; preds = %101, %80
  %103 = add nsw i32 %36, %8
  %104 = icmp slt i32 %103, %28
  br i1 %104, label %35, label %33

; <label>:105:                                    ; preds = %105, %76
  %106 = phi i32 [ %72, %76 ], [ %139, %105 ]
  %107 = phi float [ %73, %76 ], [ %138, %105 ]
  %108 = mul nsw i32 %106, %3
  %109 = add nsw i32 %108, %37
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float* %45, i64 %110
  %112 = load float, float* %111, align 4, !tbaa !30
  %113 = fcmp olt float %107, %112
  %114 = select i1 %113, float %112, float %107
  %115 = add nsw i32 %106, 1
  %116 = mul nsw i32 %115, %3
  %117 = add nsw i32 %116, %37
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float* %45, i64 %118
  %120 = load float, float* %119, align 4, !tbaa !30
  %121 = fcmp olt float %114, %120
  %122 = select i1 %121, float %120, float %114
  %123 = add nsw i32 %106, 2
  %124 = mul nsw i32 %123, %3
  %125 = add nsw i32 %124, %37
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float* %45, i64 %126
  %128 = load float, float* %127, align 4, !tbaa !30
  %129 = fcmp olt float %122, %128
  %130 = select i1 %129, float %128, float %122
  %131 = add nsw i32 %106, 3
  %132 = mul nsw i32 %131, %3
  %133 = add nsw i32 %132, %37
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float* %45, i64 %134
  %136 = load float, float* %135, align 4, !tbaa !30
  %137 = fcmp olt float %130, %136
  %138 = select i1 %137, float %136, float %130
  %139 = add nsw i32 %106, 4
  %140 = icmp slt i32 %139, %42
  br i1 %140, label %105, label %77
}

; Function Attrs: nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EESE_EENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.4"* byval nocapture readonly align 8, i32) local_unnamed_addr #5 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %9 = mul i32 %8, %4
  %10 = icmp slt i32 %7, %1
  br i1 %10, label %11, label %100

; <label>:11:                                     ; preds = %2
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.4", %"struct.Eigen::TensorEvaluator.4"* %0, i64 0, i32 0, i32 8
  %13 = load float*, float** %12, align 8, !tbaa !44
  %14 = icmp eq float* %13, null
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.4", %"struct.Eigen::TensorEvaluator.4"* %0, i64 0, i32 0, i32 3, i32 0, i64 0
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.4", %"struct.Eigen::TensorEvaluator.4"* %0, i64 0, i32 0, i32 5, i32 0, i64 0
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.4", %"struct.Eigen::TensorEvaluator.4"* %0, i64 0, i32 0, i32 4, i32 0, i64 0
  %20 = load i32, i32* %19, align 8
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.4", %"struct.Eigen::TensorEvaluator.4"* %0, i64 0, i32 0, i32 6, i32 0
  %22 = load float*, float** %21, align 8
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.4", %"struct.Eigen::TensorEvaluator.4"* %0, i64 0, i32 2
  %24 = load float*, float** %23, align 8, !tbaa !50
  br i1 %14, label %26, label %25

; <label>:25:                                     ; preds = %11
  br label %87

; <label>:26:                                     ; preds = %11
  %27 = icmp sgt i32 %18, 0
  br i1 %27, label %29, label %28

; <label>:28:                                     ; preds = %26
  br label %81

; <label>:29:                                     ; preds = %26
  %30 = and i32 %18, 1
  %31 = icmp eq i32 %30, 0
  %32 = icmp eq i32 %18, 1
  br label %33

; <label>:33:                                     ; preds = %29, %52
  %34 = phi i32 [ %56, %52 ], [ %7, %29 ]
  %35 = mul nsw i32 %34, %16
  br i1 %31, label %44, label %36

; <label>:36:                                     ; preds = %33
  br label %37

; <label>:37:                                     ; preds = %36
  %38 = sext i32 %35 to i64
  %39 = getelementptr inbounds float, float* %22, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !30
  %41 = fcmp ogt float %40, 0xFFF0000000000000
  %42 = select i1 %41, float %40, float 0xFFF0000000000000
  %43 = select i1 %41, float %40, float 0xFFF0000000000000
  br label %44

; <label>:44:                                     ; preds = %33, %37
  %45 = phi float [ %42, %37 ], [ undef, %33 ]
  %46 = phi float [ %42, %37 ], [ 0xFFF0000000000000, %33 ]
  %47 = phi float [ %43, %37 ], [ 0xFFF0000000000000, %33 ]
  %48 = phi i32 [ 1, %37 ], [ 0, %33 ]
  br label %49

; <label>:49:                                     ; preds = %44
  br i1 %32, label %52, label %50

; <label>:50:                                     ; preds = %49
  br label %58

; <label>:51:                                     ; preds = %58
  br label %52

; <label>:52:                                     ; preds = %49, %51
  %53 = phi float [ %45, %49 ], [ %77, %51 ]
  %54 = sext i32 %34 to i64
  %55 = getelementptr inbounds float, float* %24, i64 %54
  store float %53, float* %55, align 4, !tbaa !30
  %56 = add nsw i32 %34, %9
  %57 = icmp slt i32 %56, %1
  br i1 %57, label %33, label %97

; <label>:58:                                     ; preds = %58, %50
  %59 = phi float [ %46, %50 ], [ %77, %58 ]
  %60 = phi float [ %47, %50 ], [ %78, %58 ]
  %61 = phi i32 [ %48, %50 ], [ %79, %58 ]
  %62 = mul nsw i32 %61, %20
  %63 = add nsw i32 %62, %35
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float* %22, i64 %64
  %66 = load float, float* %65, align 4, !tbaa !30
  %67 = fcmp olt float %60, %66
  %68 = select i1 %67, float %66, float %59
  %69 = select i1 %67, float %66, float %60
  %70 = add nuw nsw i32 %61, 1
  %71 = mul nsw i32 %70, %20
  %72 = add nsw i32 %71, %35
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float* %22, i64 %73
  %75 = load float, float* %74, align 4, !tbaa !30
  %76 = fcmp olt float %69, %75
  %77 = select i1 %76, float %75, float %68
  %78 = select i1 %76, float %75, float %69
  %79 = add nsw i32 %61, 2
  %80 = icmp eq i32 %79, %18
  br i1 %80, label %51, label %58

; <label>:81:                                     ; preds = %28, %81
  %82 = phi i32 [ %85, %81 ], [ %7, %28 ]
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %24, i64 %83
  store float 0xFFF0000000000000, float* %84, align 4, !tbaa !30
  %85 = add nsw i32 %82, %9
  %86 = icmp slt i32 %85, %1
  br i1 %86, label %81, label %98

; <label>:87:                                     ; preds = %25, %87
  %88 = phi i32 [ %95, %87 ], [ %7, %25 ]
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %13, i64 %89
  %91 = bitcast float* %90 to i32*
  %92 = load i32, i32* %91, align 4, !tbaa !30
  %93 = getelementptr inbounds float, float* %24, i64 %89
  %94 = bitcast float* %93 to i32*
  store i32 %92, i32* %94, align 4, !tbaa !30
  %95 = add nsw i32 %88, %9
  %96 = icmp slt i32 %95, %1
  br i1 %96, label %87, label %99

; <label>:97:                                     ; preds = %52
  br label %100

; <label>:98:                                     ; preds = %81
  br label %100

; <label>:99:                                     ; preds = %87
  br label %100

; <label>:100:                                    ; preds = %99, %98, %97, %2
  ret void
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSB_EEKNS4_INS5_ISB_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISJ_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSH_IiLi1EEESF_S7_EEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.7"* byval nocapture readonly align 8, i32) local_unnamed_addr #1 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %9 = mul i32 %8, %4
  %10 = sdiv i32 %1, 4
  %11 = shl nsw i32 %10, 2
  %12 = shl i32 %9, 2
  %13 = shl nsw i32 %7, 2
  %14 = icmp slt i32 %13, %11
  br i1 %14, label %15, label %31

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 1, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 1
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 4, i32 0, i32 3
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 0, i32 0
  %23 = load float*, float** %22, align 8
  %24 = load float*, float** %16, align 8, !tbaa !34
  %25 = load i32, i32* %17, align 8, !tbaa !40
  %26 = load i32, i32* %18, align 8, !tbaa !40
  %27 = load i32, i32* %19, align 8, !tbaa !40
  %28 = load i32, i32* %20, align 4, !tbaa !40
  %29 = load float*, float** %21, align 8, !tbaa !53
  br label %49

; <label>:30:                                     ; preds = %123
  br label %31

; <label>:31:                                     ; preds = %30, %2
  %32 = add nsw i32 %7, %11
  %33 = icmp slt i32 %32, %1
  br i1 %33, label %34, label %163

; <label>:34:                                     ; preds = %31
  %35 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 1, i32 0
  %36 = load float*, float** %35, align 8, !tbaa !34
  %37 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %38 = load i32, i32* %37, align 8, !tbaa !40
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 0
  %40 = load i32, i32* %39, align 8, !tbaa !40
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  %42 = load i32, i32* %41, align 8, !tbaa !40
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 1
  %44 = load i32, i32* %43, align 4, !tbaa !40
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 1, i32 2, i32 4, i32 0, i32 3
  %46 = load float*, float** %45, align 8, !tbaa !53
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %0, i64 0, i32 0, i32 0
  %48 = load float*, float** %47, align 8, !tbaa !55
  br label %143

; <label>:49:                                     ; preds = %123, %15
  %50 = phi i32 [ %13, %15 ], [ %141, %123 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float* %24, i64 %51
  %53 = load float, float* %52, align 4, !tbaa !30
  %54 = getelementptr inbounds float, float* %52, i64 1
  %55 = load float, float* %54, align 4, !tbaa !30
  %56 = getelementptr inbounds float, float* %52, i64 2
  %57 = load float, float* %56, align 4, !tbaa !30
  %58 = getelementptr inbounds float, float* %52, i64 3
  %59 = load float, float* %58, align 4, !tbaa !30
  %60 = tail call %struct.float4 @_Z11make_float4ffff(float %53, float %55, float %57, float %59) #3
  %61 = extractvalue %struct.float4 %60, 0
  %62 = extractvalue %struct.float4 %60, 1
  %63 = extractvalue %struct.float4 %60, 2
  %64 = extractvalue %struct.float4 %60, 3
  %65 = sdiv i32 %50, %25
  %66 = srem i32 %65, %26
  %67 = mul nsw i32 %27, %66
  %68 = mul nsw i32 %65, %25
  %69 = sub nsw i32 %50, %68
  %70 = srem i32 %69, %28
  %71 = add nsw i32 %70, %67
  %72 = add nsw i32 %70, 4
  %73 = icmp sgt i32 %72, %28
  %74 = sext i32 %71 to i64
  %75 = getelementptr inbounds float, float* %29, i64 %74
  %76 = load float, float* %75, align 4, !tbaa !30
  br i1 %73, label %89, label %77

; <label>:77:                                     ; preds = %49
  %78 = getelementptr inbounds float, float* %75, i64 1
  %79 = load float, float* %78, align 4, !tbaa !30
  %80 = getelementptr inbounds float, float* %75, i64 2
  %81 = load float, float* %80, align 4, !tbaa !30
  %82 = getelementptr inbounds float, float* %75, i64 3
  %83 = load float, float* %82, align 4, !tbaa !30
  %84 = tail call %struct.float4 @_Z11make_float4ffff(float %76, float %79, float %81, float %83) #3
  %85 = extractvalue %struct.float4 %84, 0
  %86 = extractvalue %struct.float4 %84, 1
  %87 = extractvalue %struct.float4 %84, 2
  %88 = extractvalue %struct.float4 %84, 3
  br label %123

; <label>:89:                                     ; preds = %49
  %90 = or i32 %50, 1
  %91 = sdiv i32 %90, %25
  %92 = srem i32 %91, %26
  %93 = mul nsw i32 %92, %27
  %94 = mul nsw i32 %91, %25
  %95 = sub nsw i32 %90, %94
  %96 = srem i32 %95, %28
  %97 = add nsw i32 %96, %93
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %29, i64 %98
  %100 = load float, float* %99, align 4, !tbaa !30
  %101 = or i32 %50, 2
  %102 = sdiv i32 %101, %25
  %103 = srem i32 %102, %26
  %104 = mul nsw i32 %103, %27
  %105 = mul nsw i32 %102, %25
  %106 = sub nsw i32 %101, %105
  %107 = srem i32 %106, %28
  %108 = add nsw i32 %107, %104
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float* %29, i64 %109
  %111 = load float, float* %110, align 4, !tbaa !30
  %112 = or i32 %50, 3
  %113 = sdiv i32 %112, %25
  %114 = srem i32 %113, %26
  %115 = mul nsw i32 %114, %27
  %116 = mul nsw i32 %113, %25
  %117 = sub nsw i32 %112, %116
  %118 = srem i32 %117, %28
  %119 = add nsw i32 %118, %115
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float* %29, i64 %120
  %122 = load float, float* %121, align 4, !tbaa !30
  br label %123

; <label>:123:                                    ; preds = %89, %77
  %124 = phi float [ %85, %77 ], [ %76, %89 ]
  %125 = phi float [ %86, %77 ], [ %100, %89 ]
  %126 = phi float [ %87, %77 ], [ %111, %89 ]
  %127 = phi float [ %88, %77 ], [ %122, %89 ]
  %128 = fsub float %61, %124
  %129 = fsub float %62, %125
  %130 = fsub float %63, %126
  %131 = fsub float %64, %127
  %132 = tail call %struct.float4 @_Z11make_float4ffff(float %128, float %129, float %130, float %131) #3
  %133 = extractvalue %struct.float4 %132, 0
  %134 = extractvalue %struct.float4 %132, 1
  %135 = extractvalue %struct.float4 %132, 2
  %136 = extractvalue %struct.float4 %132, 3
  %137 = getelementptr inbounds float, float* %23, i64 %51
  store float %133, float* %137, align 4
  %138 = getelementptr inbounds float, float* %137, i64 1
  store float %134, float* %138, align 4
  %139 = getelementptr inbounds float, float* %137, i64 2
  store float %135, float* %139, align 4
  %140 = getelementptr inbounds float, float* %137, i64 3
  store float %136, float* %140, align 4
  %141 = add nsw i32 %50, %12
  %142 = icmp slt i32 %141, %11
  br i1 %142, label %49, label %30

; <label>:143:                                    ; preds = %143, %34
  %144 = phi i32 [ %32, %34 ], [ %160, %143 ]
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float* %36, i64 %145
  %147 = load float, float* %146, align 4, !tbaa !30
  %148 = sdiv i32 %144, %38
  %149 = srem i32 %148, %40
  %150 = mul nsw i32 %149, %42
  %151 = mul nsw i32 %148, %38
  %152 = sub nsw i32 %144, %151
  %153 = srem i32 %152, %44
  %154 = add nsw i32 %153, %150
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float* %46, i64 %155
  %157 = load float, float* %156, align 4, !tbaa !30
  %158 = fsub float %147, %157
  %159 = getelementptr inbounds float, float* %48, i64 %145
  store float %158, float* %159, align 4, !tbaa !30
  %160 = add nsw i32 %144, %9
  %161 = icmp slt i32 %160, %1
  br i1 %161, label %143, label %162

; <label>:162:                                    ; preds = %143
  br label %163

; <label>:163:                                    ; preds = %162, %31
  ret void
}

; Function Attrs: convergent nounwind
declare %struct.float4 @_Z11make_float4ffff(float, float, float, float) local_unnamed_addr #2

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSP_15CoeffReturnTypeEPj(%"struct.Eigen::internal::SumReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator.16"* byval nocapture readonly align 8, i32, float*, i32*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %7 = shl i32 %6, 15
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %9 = or i32 %7, %8
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %5
  %13 = icmp eq i32 %9, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %12
  store float 0.000000e+00, float* %3, align 4, !tbaa !30
  br label %28

; <label>:15:                                     ; preds = %5
  %16 = icmp eq i32 %8, 0
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %15
  %18 = tail call i32 @_Z9atomicCASPjjj(i32* %4, i32 0, i32 1) #3
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %21, label %20

; <label>:20:                                     ; preds = %17
  br label %24

; <label>:21:                                     ; preds = %17
  %22 = tail call float @_Z10atomicExchIfET_PS0_S0_(float* %3, float 0.000000e+00) #3
  tail call void @_Z13__threadfencev() #3
  %23 = tail call i32 @_Z10atomicExchIjET_PS0_S0_(i32* %4, i32 2) #3
  br label %28

; <label>:24:                                     ; preds = %20, %24
  %25 = tail call i32 @_Z9atomicCASPjjj(i32* %4, i32 2, i32 2) #3
  %26 = icmp ult i32 %25, 2
  br i1 %26, label %24, label %27

; <label>:27:                                     ; preds = %24
  br label %28

; <label>:28:                                     ; preds = %27, %21, %15, %12, %14
  tail call void @llvm.nvvm.barrier0()
  %29 = sub nsw i32 %2, %9
  %30 = icmp slt i32 %29, 32768
  %31 = select i1 %30, i32 %29, i32 32768
  %32 = icmp sgt i32 %29, 0
  br i1 %32, label %47, label %34

; <label>:33:                                     ; preds = %50
  br label %34

; <label>:34:                                     ; preds = %33, %28
  %35 = phi float [ 0.000000e+00, %28 ], [ %58, %33 ]
  %36 = tail call float @_Z11__shfl_downIfET_S0_ii(float %35, i32 16, i32 32) #3
  %37 = fadd float %35, %36
  %38 = tail call float @_Z11__shfl_downIfET_S0_ii(float %37, i32 8, i32 32) #3
  %39 = fadd float %37, %38
  %40 = tail call float @_Z11__shfl_downIfET_S0_ii(float %39, i32 4, i32 32) #3
  %41 = fadd float %39, %40
  %42 = tail call float @_Z11__shfl_downIfET_S0_ii(float %41, i32 2, i32 32) #3
  %43 = fadd float %41, %42
  %44 = tail call float @_Z11__shfl_downIfET_S0_ii(float %43, i32 1, i32 32) #3
  %45 = and i32 %8, 31
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %61, label %64

; <label>:47:                                     ; preds = %28
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::TensorEvaluator.16"* %1, i64 0, i32 6, i32 1, i32 0
  %49 = load float*, float** %48, align 8, !tbaa !57
  br label %50

; <label>:50:                                     ; preds = %47, %50
  %51 = phi i32 [ 0, %47 ], [ %59, %50 ]
  %52 = phi float [ 0.000000e+00, %47 ], [ %58, %50 ]
  %53 = add nsw i32 %51, %9
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float* %49, i64 %54
  %56 = load float, float* %55, align 4, !tbaa !30
  %57 = tail call float @_Z4expff(float %56) #3
  %58 = fadd float %52, %57
  %59 = add nuw nsw i32 %51, 256
  %60 = icmp slt i32 %59, %31
  br i1 %60, label %50, label %33

; <label>:61:                                     ; preds = %34
  %62 = fadd float %43, %44
  %63 = tail call float @_Z9atomicAddIfET_PS0_S0_(float* %3, float %62) #3
  br label %64

; <label>:64:                                     ; preds = %61, %34
  %65 = icmp ugt i32 %10, 1
  %66 = icmp eq i32 %8, 0
  %67 = and i1 %66, %65
  br i1 %67, label %68, label %71

; <label>:68:                                     ; preds = %64
  %69 = add nuw i32 %10, 1
  %70 = tail call i32 @_Z9atomicIncIjET_PS0_S0_(i32* %4, i32 %69) #3
  br label %71

; <label>:71:                                     ; preds = %68, %64
  ret void
}

; Function Attrs: convergent nounwind
declare float @_Z4expff(float) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare float @_Z9atomicAddIfET_PS0_S0_(float*, float) local_unnamed_addr #2

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SQ_PNSP_15CoeffReturnTypeE(%"struct.Eigen::internal::SumReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator.16"* byval nocapture readonly align 8, i32, i32, float*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %7 = shl nuw nsw i32 %6, 7
  %8 = add i32 %2, -1
  %9 = add i32 %8, %7
  %10 = udiv i32 %9, %7
  %11 = mul nsw i32 %10, %3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %13 = mul i32 %12, %6
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %16 = icmp eq i32 %12, 1
  br i1 %16, label %23, label %17

; <label>:17:                                     ; preds = %29, %5
  %18 = icmp slt i32 %14, %11
  br i1 %18, label %19, label %37

; <label>:19:                                     ; preds = %17
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::TensorEvaluator.16"* %1, i64 0, i32 6, i32 1, i32 0
  %21 = and i32 %15, 31
  %22 = icmp eq i32 %21, 0
  br label %38

; <label>:23:                                     ; preds = %5
  %24 = mul i32 %14, %6
  %25 = add i32 %24, %15
  %26 = icmp slt i32 %25, %3
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23
  br label %30

; <label>:28:                                     ; preds = %30
  br label %29

; <label>:29:                                     ; preds = %28, %23
  tail call void @llvm.nvvm.barrier0()
  br label %17

; <label>:30:                                     ; preds = %27, %30
  %31 = phi i32 [ %34, %30 ], [ %25, %27 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float* %4, i64 %32
  store float 0.000000e+00, float* %33, align 4, !tbaa !30
  %34 = add nsw i32 %31, %13
  %35 = icmp slt i32 %34, %3
  br i1 %35, label %30, label %28

; <label>:36:                                     ; preds = %221
  br label %37

; <label>:37:                                     ; preds = %36, %17
  ret void

; <label>:38:                                     ; preds = %19, %221
  %39 = phi i32 [ %14, %19 ], [ %222, %221 ]
  %40 = sdiv i32 %39, %10
  %41 = icmp slt i32 %40, %3
  br i1 %41, label %42, label %221

; <label>:42:                                     ; preds = %38
  %43 = srem i32 %39, %10
  %44 = mul i32 %7, %43
  %45 = add i32 %44, %15
  %46 = mul nsw i32 %40, %2
  %47 = add i32 %45, %46
  br label %48

; <label>:48:                                     ; preds = %42, %57
  %49 = phi i32 [ 0, %42 ], [ %51, %57 ]
  %50 = phi float [ 0.000000e+00, %42 ], [ %185, %57 ]
  %51 = add nuw nsw i32 %49, 16
  %52 = or i32 %49, 15
  %53 = mul i32 %52, %6
  %54 = add i32 %53, %45
  %55 = icmp slt i32 %54, %2
  %56 = mul i32 %49, %6
  br i1 %55, label %57, label %187

; <label>:57:                                     ; preds = %48
  %58 = add i32 %47, %56
  %59 = load float*, float** %20, align 8, !tbaa !57
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds float, float* %59, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !30
  %63 = tail call float @_Z4expff(float %62) #3
  %64 = fadd float %50, %63
  %65 = or i32 %49, 1
  %66 = mul i32 %65, %6
  %67 = add i32 %47, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float* %59, i64 %68
  %70 = load float, float* %69, align 4, !tbaa !30
  %71 = tail call float @_Z4expff(float %70) #3
  %72 = fadd float %64, %71
  %73 = or i32 %49, 2
  %74 = mul i32 %73, %6
  %75 = add i32 %47, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float* %59, i64 %76
  %78 = load float, float* %77, align 4, !tbaa !30
  %79 = tail call float @_Z4expff(float %78) #3
  %80 = fadd float %72, %79
  %81 = or i32 %49, 3
  %82 = mul i32 %81, %6
  %83 = add i32 %47, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float* %59, i64 %84
  %86 = load float, float* %85, align 4, !tbaa !30
  %87 = tail call float @_Z4expff(float %86) #3
  %88 = fadd float %80, %87
  %89 = or i32 %49, 4
  %90 = mul i32 %89, %6
  %91 = add i32 %47, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float* %59, i64 %92
  %94 = load float, float* %93, align 4, !tbaa !30
  %95 = tail call float @_Z4expff(float %94) #3
  %96 = fadd float %88, %95
  %97 = or i32 %49, 5
  %98 = mul i32 %97, %6
  %99 = add i32 %47, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float* %59, i64 %100
  %102 = load float, float* %101, align 4, !tbaa !30
  %103 = tail call float @_Z4expff(float %102) #3
  %104 = fadd float %96, %103
  %105 = or i32 %49, 6
  %106 = mul i32 %105, %6
  %107 = add i32 %47, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float* %59, i64 %108
  %110 = load float, float* %109, align 4, !tbaa !30
  %111 = tail call float @_Z4expff(float %110) #3
  %112 = fadd float %104, %111
  %113 = or i32 %49, 7
  %114 = mul i32 %113, %6
  %115 = add i32 %47, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float* %59, i64 %116
  %118 = load float, float* %117, align 4, !tbaa !30
  %119 = tail call float @_Z4expff(float %118) #3
  %120 = fadd float %112, %119
  %121 = or i32 %49, 8
  %122 = mul i32 %121, %6
  %123 = add i32 %47, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float* %59, i64 %124
  %126 = load float, float* %125, align 4, !tbaa !30
  %127 = tail call float @_Z4expff(float %126) #3
  %128 = fadd float %120, %127
  %129 = or i32 %49, 9
  %130 = mul i32 %129, %6
  %131 = add i32 %47, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float* %59, i64 %132
  %134 = load float, float* %133, align 4, !tbaa !30
  %135 = tail call float @_Z4expff(float %134) #3
  %136 = fadd float %128, %135
  %137 = or i32 %49, 10
  %138 = mul i32 %137, %6
  %139 = add i32 %47, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float* %59, i64 %140
  %142 = load float, float* %141, align 4, !tbaa !30
  %143 = tail call float @_Z4expff(float %142) #3
  %144 = fadd float %136, %143
  %145 = or i32 %49, 11
  %146 = mul i32 %145, %6
  %147 = add i32 %47, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float* %59, i64 %148
  %150 = load float, float* %149, align 4, !tbaa !30
  %151 = tail call float @_Z4expff(float %150) #3
  %152 = fadd float %144, %151
  %153 = or i32 %49, 12
  %154 = mul i32 %153, %6
  %155 = add i32 %47, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float* %59, i64 %156
  %158 = load float, float* %157, align 4, !tbaa !30
  %159 = tail call float @_Z4expff(float %158) #3
  %160 = fadd float %152, %159
  %161 = or i32 %49, 13
  %162 = mul i32 %161, %6
  %163 = add i32 %47, %162
  %164 = load float*, float** %20, align 8, !tbaa !57
  %165 = sext i32 %163 to i64
  %166 = getelementptr inbounds float, float* %164, i64 %165
  %167 = load float, float* %166, align 4, !tbaa !30
  %168 = tail call float @_Z4expff(float %167) #3
  %169 = fadd float %160, %168
  %170 = or i32 %49, 14
  %171 = mul i32 %170, %6
  %172 = add i32 %47, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float* %164, i64 %173
  %175 = load float, float* %174, align 4, !tbaa !30
  %176 = tail call float @_Z4expff(float %175) #3
  %177 = fadd float %169, %176
  %178 = or i32 %49, 15
  %179 = mul i32 %178, %6
  %180 = add i32 %47, %179
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float* %164, i64 %181
  %183 = load float, float* %182, align 4, !tbaa !30
  %184 = tail call float @_Z4expff(float %183) #3
  %185 = fadd float %177, %184
  %186 = icmp slt i32 %51, 128
  br i1 %186, label %48, label %204

; <label>:187:                                    ; preds = %48
  %188 = add i32 %56, %45
  %189 = icmp slt i32 %188, %2
  br i1 %189, label %190, label %205

; <label>:190:                                    ; preds = %187
  %191 = load float*, float** %20, align 8, !tbaa !57
  br label %192

; <label>:192:                                    ; preds = %190, %192
  %193 = phi i32 [ %188, %190 ], [ %201, %192 ]
  %194 = phi float [ %50, %190 ], [ %200, %192 ]
  %195 = add nsw i32 %193, %46
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float* %191, i64 %196
  %198 = load float, float* %197, align 4, !tbaa !30
  %199 = tail call float @_Z4expff(float %198) #3
  %200 = fadd float %194, %199
  %201 = add i32 %193, %6
  %202 = icmp slt i32 %201, %2
  br i1 %202, label %192, label %203

; <label>:203:                                    ; preds = %192
  br label %205

; <label>:204:                                    ; preds = %57
  br label %205

; <label>:205:                                    ; preds = %204, %203, %187
  %206 = phi float [ %50, %187 ], [ %200, %203 ], [ %185, %204 ]
  %207 = tail call float @_Z11__shfl_downIfET_S0_i(float %206, i32 16) #3
  %208 = fadd float %206, %207
  %209 = tail call float @_Z11__shfl_downIfET_S0_i(float %208, i32 8) #3
  %210 = fadd float %208, %209
  %211 = tail call float @_Z11__shfl_downIfET_S0_i(float %210, i32 4) #3
  %212 = fadd float %210, %211
  %213 = tail call float @_Z11__shfl_downIfET_S0_i(float %212, i32 2) #3
  %214 = fadd float %212, %213
  %215 = tail call float @_Z11__shfl_downIfET_S0_i(float %214, i32 1) #3
  br i1 %22, label %216, label %221

; <label>:216:                                    ; preds = %205
  %217 = fadd float %214, %215
  %218 = sext i32 %40 to i64
  %219 = getelementptr inbounds float, float* %4, i64 %218
  %220 = tail call float @_Z9atomicAddIfET_PS0_S0_(float* %219, float %217) #3
  br label %221

; <label>:221:                                    ; preds = %205, %216, %38
  %222 = add i32 %39, %12
  %223 = icmp slt i32 %222, %11
  br i1 %223, label %38, label %36
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SQ_PNSP_15CoeffReturnTypeE(%"struct.Eigen::internal::SumReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator.16"* byval nocapture readonly align 8, i32, i32, float*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %8 = mul i32 %7, %6
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %10 = mul i32 %9, %6
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %12 = add i32 %10, %11
  %13 = icmp eq i32 %7, 1
  br i1 %13, label %14, label %25

; <label>:14:                                     ; preds = %5
  %15 = icmp slt i32 %12, %3
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %14
  br label %19

; <label>:17:                                     ; preds = %19
  br label %18

; <label>:18:                                     ; preds = %17, %14
  tail call void @llvm.nvvm.barrier0()
  br label %25

; <label>:19:                                     ; preds = %16, %19
  %20 = phi i32 [ %23, %19 ], [ %12, %16 ]
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %4, i64 %21
  store float 0.000000e+00, float* %22, align 4, !tbaa !30
  %23 = add nsw i32 %20, %8
  %24 = icmp slt i32 %23, %3
  br i1 %24, label %19, label %17

; <label>:25:                                     ; preds = %18, %5
  %26 = add i32 %2, 15
  %27 = sdiv i32 %26, 16
  %28 = mul nsw i32 %27, %3
  %29 = icmp slt i32 %12, %28
  br i1 %29, label %30, label %33

; <label>:30:                                     ; preds = %25
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::TensorEvaluator.16"* %1, i64 0, i32 6, i32 1, i32 0
  br label %34

; <label>:32:                                     ; preds = %46
  br label %33

; <label>:33:                                     ; preds = %32, %25
  ret void

; <label>:34:                                     ; preds = %30, %46
  %35 = phi i32 [ %12, %30 ], [ %51, %46 ]
  %36 = srem i32 %35, %3
  %37 = sdiv i32 %35, %3
  %38 = shl nsw i32 %37, 4
  %39 = add nsw i32 %38, 16
  %40 = icmp sgt i32 %39, %2
  %41 = select i1 %40, i32 %2, i32 %39
  %42 = icmp slt i32 %38, %41
  br i1 %42, label %43, label %46

; <label>:43:                                     ; preds = %34
  %44 = load float*, float** %31, align 8, !tbaa !57
  br label %53

; <label>:45:                                     ; preds = %53
  br label %46

; <label>:46:                                     ; preds = %45, %34
  %47 = phi float [ 0.000000e+00, %34 ], [ %62, %45 ]
  %48 = sext i32 %36 to i64
  %49 = getelementptr inbounds float, float* %4, i64 %48
  %50 = tail call float @_Z9atomicAddIfET_PS0_S0_(float* %49, float %47) #3
  %51 = add nsw i32 %35, %8
  %52 = icmp slt i32 %51, %28
  br i1 %52, label %34, label %32

; <label>:53:                                     ; preds = %43, %53
  %54 = phi i32 [ %63, %53 ], [ %38, %43 ]
  %55 = phi float [ %62, %53 ], [ 0.000000e+00, %43 ]
  %56 = mul nsw i32 %54, %3
  %57 = add nsw i32 %56, %36
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float* %44, i64 %58
  %60 = load float, float* %59, align 4, !tbaa !30
  %61 = tail call float @_Z4expff(float %60) #3
  %62 = fadd float %55, %61
  %63 = add nsw i32 %54, 1
  %64 = icmp slt i32 %63, %41
  br i1 %64, label %53, label %45
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.20"* byval nocapture readonly align 8, i32) local_unnamed_addr #1 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %9 = mul i32 %8, %4
  %10 = icmp slt i32 %7, %1
  br i1 %10, label %11, label %55

; <label>:11:                                     ; preds = %2
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %0, i64 0, i32 0, i32 8
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %0, i64 0, i32 0, i32 3, i32 0, i64 0
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %0, i64 0, i32 0, i32 5, i32 0, i64 0
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %0, i64 0, i32 0, i32 4, i32 0, i64 0
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %0, i64 0, i32 0, i32 6, i32 1, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.20", %"struct.Eigen::TensorEvaluator.20"* %0, i64 0, i32 2
  %18 = load float*, float** %12, align 8, !tbaa !59
  %19 = icmp eq float* %18, null
  br label %20

; <label>:20:                                     ; preds = %47, %11
  %21 = phi i32 [ %7, %11 ], [ %52, %47 ]
  br i1 %19, label %26, label %22

; <label>:22:                                     ; preds = %20
  %23 = sext i32 %21 to i64
  %24 = getelementptr inbounds float, float* %18, i64 %23
  %25 = load float, float* %24, align 4, !tbaa !30
  br label %47

; <label>:26:                                     ; preds = %20
  %27 = load i32, i32* %13, align 4, !tbaa !40
  %28 = mul nsw i32 %27, %21
  %29 = load i32, i32* %14, align 4, !tbaa !40
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %47

; <label>:31:                                     ; preds = %26
  br label %32

; <label>:32:                                     ; preds = %31, %32
  %33 = phi float [ %43, %32 ], [ 0.000000e+00, %31 ]
  %34 = phi i32 [ %44, %32 ], [ 0, %31 ]
  %35 = load i32, i32* %15, align 8, !tbaa !40
  %36 = mul nsw i32 %35, %34
  %37 = add nsw i32 %36, %28
  %38 = load float*, float** %16, align 8, !tbaa !57
  %39 = sext i32 %37 to i64
  %40 = getelementptr inbounds float, float* %38, i64 %39
  %41 = load float, float* %40, align 4, !tbaa !30
  %42 = tail call float @_Z4expff(float %41) #3
  %43 = fadd float %33, %42
  %44 = add nuw nsw i32 %34, 1
  %45 = icmp slt i32 %44, %29
  br i1 %45, label %32, label %46

; <label>:46:                                     ; preds = %32
  br label %47

; <label>:47:                                     ; preds = %46, %26, %22
  %48 = phi float [ %25, %22 ], [ 0.000000e+00, %26 ], [ %43, %46 ]
  %49 = load float*, float** %17, align 8, !tbaa !64
  %50 = sext i32 %21 to i64
  %51 = getelementptr inbounds float, float* %49, i64 %50
  store float %48, float* %51, align 4, !tbaa !30
  %52 = add nsw i32 %21, %9
  %53 = icmp slt i32 %52, %1
  br i1 %53, label %20, label %54

; <label>:54:                                     ; preds = %47
  br label %55

; <label>:55:                                     ; preds = %54, %2
  ret void
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEEKNSH_INS0_13scalar_exp_opIfEESC_EES7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.27"* byval nocapture readonly align 8, i32) local_unnamed_addr #1 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %9 = mul i32 %8, %4
  %10 = sdiv i32 %1, 4
  %11 = shl nsw i32 %10, 2
  %12 = shl i32 %9, 2
  %13 = shl nsw i32 %7, 2
  %14 = icmp slt i32 %13, %11
  br i1 %14, label %15, label %31

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 1, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 1, i32 0, i32 0, i64 0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 1, i32 0, i32 0, i64 1
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 3
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 0, i32 0
  %23 = load float*, float** %22, align 8
  %24 = load float*, float** %16, align 8, !tbaa !57
  %25 = load i32, i32* %17, align 8, !tbaa !40
  %26 = load i32, i32* %18, align 8, !tbaa !40
  %27 = load i32, i32* %19, align 8, !tbaa !40
  %28 = load i32, i32* %20, align 4, !tbaa !40
  %29 = load float*, float** %21, align 8, !tbaa !68
  br label %49

; <label>:30:                                     ; preds = %136
  br label %31

; <label>:31:                                     ; preds = %30, %2
  %32 = add nsw i32 %7, %11
  %33 = icmp slt i32 %32, %1
  br i1 %33, label %34, label %177

; <label>:34:                                     ; preds = %31
  %35 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 1, i32 0
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %37 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 1, i32 0, i32 0, i64 0
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 1, i32 0, i32 0, i64 1
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 3
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %0, i64 0, i32 0, i32 0
  %42 = load float*, float** %41, align 8
  %43 = load float*, float** %35, align 8, !tbaa !57
  %44 = load i32, i32* %36, align 8, !tbaa !40
  %45 = load i32, i32* %37, align 8, !tbaa !40
  %46 = load i32, i32* %38, align 8, !tbaa !40
  %47 = load i32, i32* %39, align 4, !tbaa !40
  %48 = load float*, float** %40, align 8, !tbaa !68
  br label %156

; <label>:49:                                     ; preds = %136, %15
  %50 = phi i32 [ %13, %15 ], [ %154, %136 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float* %24, i64 %51
  %53 = load float, float* %52, align 4, !tbaa !30
  %54 = getelementptr inbounds float, float* %52, i64 1
  %55 = load float, float* %54, align 4, !tbaa !30
  %56 = getelementptr inbounds float, float* %52, i64 2
  %57 = load float, float* %56, align 4, !tbaa !30
  %58 = getelementptr inbounds float, float* %52, i64 3
  %59 = load float, float* %58, align 4, !tbaa !30
  %60 = tail call %struct.float4 @_Z11make_float4ffff(float %53, float %55, float %57, float %59) #3
  %61 = extractvalue %struct.float4 %60, 0
  %62 = extractvalue %struct.float4 %60, 1
  %63 = extractvalue %struct.float4 %60, 2
  %64 = extractvalue %struct.float4 %60, 3
  %65 = sdiv i32 %50, %25
  %66 = srem i32 %65, %26
  %67 = mul nsw i32 %27, %66
  %68 = mul nsw i32 %65, %25
  %69 = sub nsw i32 %50, %68
  %70 = srem i32 %69, %28
  %71 = add nsw i32 %70, %67
  %72 = add nsw i32 %70, 4
  %73 = icmp sgt i32 %72, %28
  %74 = sext i32 %71 to i64
  %75 = getelementptr inbounds float, float* %29, i64 %74
  %76 = load float, float* %75, align 4, !tbaa !30
  br i1 %73, label %98, label %77

; <label>:77:                                     ; preds = %49
  %78 = getelementptr inbounds float, float* %75, i64 1
  %79 = load float, float* %78, align 4, !tbaa !30
  %80 = getelementptr inbounds float, float* %75, i64 2
  %81 = load float, float* %80, align 4, !tbaa !30
  %82 = getelementptr inbounds float, float* %75, i64 3
  %83 = load float, float* %82, align 4, !tbaa !30
  %84 = tail call %struct.float4 @_Z11make_float4ffff(float %76, float %79, float %81, float %83) #3
  %85 = extractvalue %struct.float4 %84, 0
  %86 = extractvalue %struct.float4 %84, 1
  %87 = extractvalue %struct.float4 %84, 2
  %88 = extractvalue %struct.float4 %84, 3
  %89 = tail call float @_Z4logff(float %85) #3
  %90 = tail call float @_Z4logff(float %86) #3
  %91 = tail call float @_Z4logff(float %87) #3
  %92 = tail call float @_Z4logff(float %88) #3
  %93 = tail call %struct.float4 @_Z11make_float4ffff(float %89, float %90, float %91, float %92) #3
  %94 = extractvalue %struct.float4 %93, 0
  %95 = extractvalue %struct.float4 %93, 1
  %96 = extractvalue %struct.float4 %93, 2
  %97 = extractvalue %struct.float4 %93, 3
  br label %136

; <label>:98:                                     ; preds = %49
  %99 = tail call float @_Z4logff(float %76) #3
  %100 = or i32 %50, 1
  %101 = sdiv i32 %100, %25
  %102 = srem i32 %101, %26
  %103 = mul nsw i32 %27, %102
  %104 = mul nsw i32 %101, %25
  %105 = sub nsw i32 %100, %104
  %106 = srem i32 %105, %28
  %107 = add nsw i32 %106, %103
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float* %29, i64 %108
  %110 = load float, float* %109, align 4, !tbaa !30
  %111 = tail call float @_Z4logff(float %110) #3
  %112 = or i32 %50, 2
  %113 = sdiv i32 %112, %25
  %114 = srem i32 %113, %26
  %115 = mul nsw i32 %27, %114
  %116 = mul nsw i32 %113, %25
  %117 = sub nsw i32 %112, %116
  %118 = srem i32 %117, %28
  %119 = add nsw i32 %118, %115
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float* %29, i64 %120
  %122 = load float, float* %121, align 4, !tbaa !30
  %123 = tail call float @_Z4logff(float %122) #3
  %124 = or i32 %50, 3
  %125 = sdiv i32 %124, %25
  %126 = srem i32 %125, %26
  %127 = mul nsw i32 %27, %126
  %128 = mul nsw i32 %125, %25
  %129 = sub nsw i32 %124, %128
  %130 = srem i32 %129, %28
  %131 = add nsw i32 %130, %127
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float* %29, i64 %132
  %134 = load float, float* %133, align 4, !tbaa !30
  %135 = tail call float @_Z4logff(float %134) #3
  br label %136

; <label>:136:                                    ; preds = %98, %77
  %137 = phi float [ %94, %77 ], [ %99, %98 ]
  %138 = phi float [ %95, %77 ], [ %111, %98 ]
  %139 = phi float [ %96, %77 ], [ %123, %98 ]
  %140 = phi float [ %97, %77 ], [ %135, %98 ]
  %141 = fsub float %61, %137
  %142 = fsub float %62, %138
  %143 = fsub float %63, %139
  %144 = fsub float %64, %140
  %145 = tail call %struct.float4 @_Z11make_float4ffff(float %141, float %142, float %143, float %144) #3
  %146 = extractvalue %struct.float4 %145, 0
  %147 = extractvalue %struct.float4 %145, 1
  %148 = extractvalue %struct.float4 %145, 2
  %149 = extractvalue %struct.float4 %145, 3
  %150 = getelementptr inbounds float, float* %23, i64 %51
  store float %146, float* %150, align 4
  %151 = getelementptr inbounds float, float* %150, i64 1
  store float %147, float* %151, align 4
  %152 = getelementptr inbounds float, float* %150, i64 2
  store float %148, float* %152, align 4
  %153 = getelementptr inbounds float, float* %150, i64 3
  store float %149, float* %153, align 4
  %154 = add nsw i32 %50, %12
  %155 = icmp slt i32 %154, %11
  br i1 %155, label %49, label %30

; <label>:156:                                    ; preds = %156, %34
  %157 = phi i32 [ %32, %34 ], [ %174, %156 ]
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float* %43, i64 %158
  %160 = load float, float* %159, align 4, !tbaa !30
  %161 = sdiv i32 %157, %44
  %162 = srem i32 %161, %45
  %163 = mul nsw i32 %46, %162
  %164 = mul nsw i32 %161, %44
  %165 = sub nsw i32 %157, %164
  %166 = srem i32 %165, %47
  %167 = add nsw i32 %166, %163
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float* %48, i64 %168
  %170 = load float, float* %169, align 4, !tbaa !30
  %171 = tail call float @_Z4logff(float %170) #3
  %172 = fsub float %160, %171
  %173 = getelementptr inbounds float, float* %42, i64 %158
  store float %172, float* %173, align 4, !tbaa !30
  %174 = add nsw i32 %157, %9
  %175 = icmp slt i32 %174, %1
  br i1 %175, label %156, label %176

; <label>:176:                                    ; preds = %156
  br label %177

; <label>:177:                                    ; preds = %176, %31
  ret void
}

; Function Attrs: convergent nounwind
declare float @_Z4logff(float) local_unnamed_addr #2

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSE_EEKNS4_INS5_ISE_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISM_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSK_IiLi1EEESI_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.34"* byval nocapture readonly align 8, i32) local_unnamed_addr #1 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %9 = mul i32 %8, %4
  %10 = sdiv i32 %1, 4
  %11 = shl nsw i32 %10, 2
  %12 = shl i32 %9, 2
  %13 = shl nsw i32 %7, 2
  %14 = icmp slt i32 %13, %11
  br i1 %14, label %15, label %31

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 1, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 2, i32 0, i64 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 3, i32 0, i64 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 1
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 3
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 0, i32 0
  %23 = load float*, float** %22, align 8
  %24 = load float*, float** %16, align 8, !tbaa !34
  %25 = load i32, i32* %17, align 8, !tbaa !40
  %26 = load i32, i32* %18, align 8, !tbaa !40
  %27 = load i32, i32* %19, align 8, !tbaa !40
  %28 = load i32, i32* %20, align 4, !tbaa !40
  %29 = load float*, float** %21, align 8, !tbaa !53
  br label %49

; <label>:30:                                     ; preds = %123
  br label %31

; <label>:31:                                     ; preds = %30, %2
  %32 = add nsw i32 %7, %11
  %33 = icmp slt i32 %32, %1
  br i1 %33, label %34, label %173

; <label>:34:                                     ; preds = %31
  %35 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 1, i32 0
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 2, i32 0, i64 0
  %37 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 0
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 3, i32 0, i64 0
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 1
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 3
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34"* %0, i64 0, i32 0, i32 0
  %42 = load float*, float** %41, align 8
  %43 = load float*, float** %35, align 8, !tbaa !34
  %44 = load i32, i32* %36, align 8, !tbaa !40
  %45 = load i32, i32* %37, align 8, !tbaa !40
  %46 = load i32, i32* %38, align 8, !tbaa !40
  %47 = load i32, i32* %39, align 4, !tbaa !40
  %48 = load float*, float** %40, align 8, !tbaa !53
  br label %152

; <label>:49:                                     ; preds = %123, %15
  %50 = phi i32 [ %13, %15 ], [ %150, %123 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float* %24, i64 %51
  %53 = load float, float* %52, align 4, !tbaa !30
  %54 = getelementptr inbounds float, float* %52, i64 1
  %55 = load float, float* %54, align 4, !tbaa !30
  %56 = getelementptr inbounds float, float* %52, i64 2
  %57 = load float, float* %56, align 4, !tbaa !30
  %58 = getelementptr inbounds float, float* %52, i64 3
  %59 = load float, float* %58, align 4, !tbaa !30
  %60 = tail call %struct.float4 @_Z11make_float4ffff(float %53, float %55, float %57, float %59) #3
  %61 = extractvalue %struct.float4 %60, 0
  %62 = extractvalue %struct.float4 %60, 1
  %63 = extractvalue %struct.float4 %60, 2
  %64 = extractvalue %struct.float4 %60, 3
  %65 = sdiv i32 %50, %25
  %66 = srem i32 %65, %26
  %67 = mul nsw i32 %27, %66
  %68 = mul nsw i32 %65, %25
  %69 = sub nsw i32 %50, %68
  %70 = srem i32 %69, %28
  %71 = add nsw i32 %70, %67
  %72 = add nsw i32 %70, 4
  %73 = icmp sgt i32 %72, %28
  %74 = sext i32 %71 to i64
  %75 = getelementptr inbounds float, float* %29, i64 %74
  %76 = load float, float* %75, align 4, !tbaa !30
  br i1 %73, label %89, label %77

; <label>:77:                                     ; preds = %49
  %78 = getelementptr inbounds float, float* %75, i64 1
  %79 = load float, float* %78, align 4, !tbaa !30
  %80 = getelementptr inbounds float, float* %75, i64 2
  %81 = load float, float* %80, align 4, !tbaa !30
  %82 = getelementptr inbounds float, float* %75, i64 3
  %83 = load float, float* %82, align 4, !tbaa !30
  %84 = tail call %struct.float4 @_Z11make_float4ffff(float %76, float %79, float %81, float %83) #3
  %85 = extractvalue %struct.float4 %84, 0
  %86 = extractvalue %struct.float4 %84, 1
  %87 = extractvalue %struct.float4 %84, 2
  %88 = extractvalue %struct.float4 %84, 3
  br label %123

; <label>:89:                                     ; preds = %49
  %90 = or i32 %50, 1
  %91 = sdiv i32 %90, %25
  %92 = srem i32 %91, %26
  %93 = mul nsw i32 %92, %27
  %94 = mul nsw i32 %91, %25
  %95 = sub nsw i32 %90, %94
  %96 = srem i32 %95, %28
  %97 = add nsw i32 %96, %93
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %29, i64 %98
  %100 = load float, float* %99, align 4, !tbaa !30
  %101 = or i32 %50, 2
  %102 = sdiv i32 %101, %25
  %103 = srem i32 %102, %26
  %104 = mul nsw i32 %103, %27
  %105 = mul nsw i32 %102, %25
  %106 = sub nsw i32 %101, %105
  %107 = srem i32 %106, %28
  %108 = add nsw i32 %107, %104
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float* %29, i64 %109
  %111 = load float, float* %110, align 4, !tbaa !30
  %112 = or i32 %50, 3
  %113 = sdiv i32 %112, %25
  %114 = srem i32 %113, %26
  %115 = mul nsw i32 %114, %27
  %116 = mul nsw i32 %113, %25
  %117 = sub nsw i32 %112, %116
  %118 = srem i32 %117, %28
  %119 = add nsw i32 %118, %115
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float* %29, i64 %120
  %122 = load float, float* %121, align 4, !tbaa !30
  br label %123

; <label>:123:                                    ; preds = %89, %77
  %124 = phi float [ %85, %77 ], [ %76, %89 ]
  %125 = phi float [ %86, %77 ], [ %100, %89 ]
  %126 = phi float [ %87, %77 ], [ %111, %89 ]
  %127 = phi float [ %88, %77 ], [ %122, %89 ]
  %128 = fsub float %61, %124
  %129 = fsub float %62, %125
  %130 = fsub float %63, %126
  %131 = fsub float %64, %127
  %132 = tail call %struct.float4 @_Z11make_float4ffff(float %128, float %129, float %130, float %131) #3
  %133 = extractvalue %struct.float4 %132, 0
  %134 = extractvalue %struct.float4 %132, 1
  %135 = extractvalue %struct.float4 %132, 2
  %136 = extractvalue %struct.float4 %132, 3
  %137 = tail call float @_Z4expff(float %133) #3
  %138 = tail call float @_Z4expff(float %134) #3
  %139 = tail call float @_Z4expff(float %135) #3
  %140 = tail call float @_Z4expff(float %136) #3
  %141 = tail call %struct.float4 @_Z11make_float4ffff(float %137, float %138, float %139, float %140) #3
  %142 = extractvalue %struct.float4 %141, 0
  %143 = extractvalue %struct.float4 %141, 1
  %144 = extractvalue %struct.float4 %141, 2
  %145 = extractvalue %struct.float4 %141, 3
  %146 = getelementptr inbounds float, float* %23, i64 %51
  store float %142, float* %146, align 4
  %147 = getelementptr inbounds float, float* %146, i64 1
  store float %143, float* %147, align 4
  %148 = getelementptr inbounds float, float* %146, i64 2
  store float %144, float* %148, align 4
  %149 = getelementptr inbounds float, float* %146, i64 3
  store float %145, float* %149, align 4
  %150 = add nsw i32 %50, %12
  %151 = icmp slt i32 %150, %11
  br i1 %151, label %49, label %30

; <label>:152:                                    ; preds = %152, %34
  %153 = phi i32 [ %32, %34 ], [ %170, %152 ]
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float* %43, i64 %154
  %156 = load float, float* %155, align 4, !tbaa !30
  %157 = sdiv i32 %153, %44
  %158 = srem i32 %157, %45
  %159 = mul nsw i32 %46, %158
  %160 = mul nsw i32 %157, %44
  %161 = sub nsw i32 %153, %160
  %162 = srem i32 %161, %47
  %163 = add nsw i32 %162, %159
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float* %48, i64 %164
  %166 = load float, float* %165, align 4, !tbaa !30
  %167 = fsub float %156, %166
  %168 = tail call float @_Z4expff(float %167) #3
  %169 = getelementptr inbounds float, float* %42, i64 %154
  store float %168, float* %169, align 4, !tbaa !30
  %170 = add nsw i32 %153, %9
  %171 = icmp slt i32 %170, %1
  br i1 %171, label %152, label %172

; <label>:172:                                    ; preds = %152
  br label %173

; <label>:173:                                    ; preds = %172, %31
  ret void
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSK_15CoeffReturnTypeEPj(%"struct.Eigen::internal::SumReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator.36"* byval nocapture readonly align 8, i32, float*, i32*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %7 = shl i32 %6, 15
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %9 = or i32 %7, %8
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %5
  %13 = icmp eq i32 %9, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %12
  store float 0.000000e+00, float* %3, align 4, !tbaa !30
  br label %28

; <label>:15:                                     ; preds = %5
  %16 = icmp eq i32 %8, 0
  br i1 %16, label %17, label %28

; <label>:17:                                     ; preds = %15
  %18 = tail call i32 @_Z9atomicCASPjjj(i32* %4, i32 0, i32 1) #3
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %21, label %20

; <label>:20:                                     ; preds = %17
  br label %24

; <label>:21:                                     ; preds = %17
  %22 = tail call float @_Z10atomicExchIfET_PS0_S0_(float* %3, float 0.000000e+00) #3
  tail call void @_Z13__threadfencev() #3
  %23 = tail call i32 @_Z10atomicExchIjET_PS0_S0_(i32* %4, i32 2) #3
  br label %28

; <label>:24:                                     ; preds = %20, %24
  %25 = tail call i32 @_Z9atomicCASPjjj(i32* %4, i32 2, i32 2) #3
  %26 = icmp ult i32 %25, 2
  br i1 %26, label %24, label %27

; <label>:27:                                     ; preds = %24
  br label %28

; <label>:28:                                     ; preds = %27, %21, %15, %12, %14
  tail call void @llvm.nvvm.barrier0()
  %29 = sub nsw i32 %2, %9
  %30 = icmp slt i32 %29, 32768
  %31 = select i1 %30, i32 %29, i32 32768
  %32 = icmp sgt i32 %29, 0
  br i1 %32, label %49, label %36

; <label>:33:                                     ; preds = %79
  br label %34

; <label>:34:                                     ; preds = %73, %33
  %35 = phi float [ %76, %73 ], [ %104, %33 ]
  br label %36

; <label>:36:                                     ; preds = %34, %28
  %37 = phi float [ 0.000000e+00, %28 ], [ %35, %34 ]
  %38 = tail call float @_Z11__shfl_downIfET_S0_ii(float %37, i32 16, i32 32) #3
  %39 = fadd float %37, %38
  %40 = tail call float @_Z11__shfl_downIfET_S0_ii(float %39, i32 8, i32 32) #3
  %41 = fadd float %39, %40
  %42 = tail call float @_Z11__shfl_downIfET_S0_ii(float %41, i32 4, i32 32) #3
  %43 = fadd float %41, %42
  %44 = tail call float @_Z11__shfl_downIfET_S0_ii(float %43, i32 2, i32 32) #3
  %45 = fadd float %43, %44
  %46 = tail call float @_Z11__shfl_downIfET_S0_ii(float %45, i32 1, i32 32) #3
  %47 = and i32 %8, 31
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %107, label %110

; <label>:49:                                     ; preds = %28
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.36", %"struct.Eigen::TensorEvaluator.36"* %1, i64 0, i32 6, i32 0
  %51 = load float*, float** %50, align 8, !tbaa !57
  %52 = icmp sgt i32 %31, 256
  %53 = select i1 %52, i32 %31, i32 256
  %54 = add nsw i32 %53, -1
  %55 = lshr i32 %54, 8
  %56 = add nuw nsw i32 %55, 1
  %57 = and i32 %56, 3
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %73, label %59

; <label>:59:                                     ; preds = %49
  br label %60

; <label>:60:                                     ; preds = %60, %59
  %61 = phi i32 [ 0, %59 ], [ %69, %60 ]
  %62 = phi float [ 0.000000e+00, %59 ], [ %68, %60 ]
  %63 = phi i32 [ %57, %59 ], [ %70, %60 ]
  %64 = add nsw i32 %61, %9
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %51, i64 %65
  %67 = load float, float* %66, align 4, !tbaa !30
  %68 = fadd float %62, %67
  %69 = add nuw nsw i32 %61, 256
  %70 = add i32 %63, -1
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %60, !llvm.loop !70

; <label>:72:                                     ; preds = %60
  br label %73

; <label>:73:                                     ; preds = %49, %72
  %74 = phi i32 [ 0, %49 ], [ %69, %72 ]
  %75 = phi float [ 0.000000e+00, %49 ], [ %68, %72 ]
  %76 = phi float [ undef, %49 ], [ %68, %72 ]
  %77 = icmp ult i32 %54, 768
  br i1 %77, label %34, label %78

; <label>:78:                                     ; preds = %73
  br label %79

; <label>:79:                                     ; preds = %79, %78
  %80 = phi i32 [ %74, %78 ], [ %105, %79 ]
  %81 = phi float [ %75, %78 ], [ %104, %79 ]
  %82 = add nsw i32 %80, %9
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float* %51, i64 %83
  %85 = load float, float* %84, align 4, !tbaa !30
  %86 = fadd float %81, %85
  %87 = add nuw nsw i32 %80, 256
  %88 = add nsw i32 %87, %9
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %51, i64 %89
  %91 = load float, float* %90, align 4, !tbaa !30
  %92 = fadd float %86, %91
  %93 = add nsw i32 %80, 512
  %94 = add nsw i32 %93, %9
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float* %51, i64 %95
  %97 = load float, float* %96, align 4, !tbaa !30
  %98 = fadd float %92, %97
  %99 = add nsw i32 %80, 768
  %100 = add nsw i32 %99, %9
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float* %51, i64 %101
  %103 = load float, float* %102, align 4, !tbaa !30
  %104 = fadd float %98, %103
  %105 = add nsw i32 %80, 1024
  %106 = icmp slt i32 %105, %31
  br i1 %106, label %79, label %33

; <label>:107:                                    ; preds = %36
  %108 = fadd float %45, %46
  %109 = tail call float @_Z9atomicAddIfET_PS0_S0_(float* %3, float %108) #3
  br label %110

; <label>:110:                                    ; preds = %107, %36
  %111 = icmp ugt i32 %10, 1
  %112 = icmp eq i32 %8, 0
  %113 = and i1 %112, %111
  br i1 %113, label %114, label %117

; <label>:114:                                    ; preds = %110
  %115 = add nuw i32 %10, 1
  %116 = tail call i32 @_Z9atomicIncIjET_PS0_S0_(i32* %4, i32 %115) #3
  br label %117

; <label>:117:                                    ; preds = %114, %110
  ret void
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SL_PNSK_15CoeffReturnTypeE(%"struct.Eigen::internal::SumReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator.36"* byval nocapture readonly align 8, i32, i32, float*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %7 = shl nuw nsw i32 %6, 7
  %8 = add i32 %2, -1
  %9 = add i32 %8, %7
  %10 = udiv i32 %9, %7
  %11 = mul nsw i32 %10, %3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %13 = mul i32 %12, %6
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %16 = icmp eq i32 %12, 1
  br i1 %16, label %23, label %17

; <label>:17:                                     ; preds = %29, %5
  %18 = icmp slt i32 %14, %11
  br i1 %18, label %19, label %37

; <label>:19:                                     ; preds = %17
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.36", %"struct.Eigen::TensorEvaluator.36"* %1, i64 0, i32 6, i32 0
  %21 = and i32 %15, 31
  %22 = icmp eq i32 %21, 0
  br label %38

; <label>:23:                                     ; preds = %5
  %24 = mul i32 %14, %6
  %25 = add i32 %24, %15
  %26 = icmp slt i32 %25, %3
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23
  br label %30

; <label>:28:                                     ; preds = %30
  br label %29

; <label>:29:                                     ; preds = %28, %23
  tail call void @llvm.nvvm.barrier0()
  br label %17

; <label>:30:                                     ; preds = %27, %30
  %31 = phi i32 [ %34, %30 ], [ %25, %27 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float* %4, i64 %32
  store float 0.000000e+00, float* %33, align 4, !tbaa !30
  %34 = add nsw i32 %31, %13
  %35 = icmp slt i32 %34, %3
  br i1 %35, label %30, label %28

; <label>:36:                                     ; preds = %204
  br label %37

; <label>:37:                                     ; preds = %36, %17
  ret void

; <label>:38:                                     ; preds = %19, %204
  %39 = phi i32 [ %14, %19 ], [ %205, %204 ]
  %40 = sdiv i32 %39, %10
  %41 = icmp slt i32 %40, %3
  br i1 %41, label %42, label %204

; <label>:42:                                     ; preds = %38
  %43 = srem i32 %39, %10
  %44 = mul i32 %7, %43
  %45 = add i32 %44, %15
  %46 = mul nsw i32 %40, %2
  %47 = add i32 %45, %46
  br label %48

; <label>:48:                                     ; preds = %42, %56
  %49 = phi i32 [ 0, %42 ], [ %51, %56 ]
  %50 = phi float [ 0.000000e+00, %42 ], [ %168, %56 ]
  %51 = add nuw nsw i32 %49, 16
  %52 = or i32 %49, 15
  %53 = mul i32 %52, %6
  %54 = add i32 %53, %45
  %55 = icmp slt i32 %54, %2
  br i1 %55, label %56, label %170

; <label>:56:                                     ; preds = %48
  %57 = load float*, float** %20, align 8, !tbaa !57
  %58 = mul i32 %49, %6
  %59 = add i32 %47, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float* %57, i64 %60
  %62 = load float, float* %61, align 4, !tbaa !30
  %63 = fadd float %50, %62
  %64 = or i32 %49, 1
  %65 = mul i32 %64, %6
  %66 = add i32 %47, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float* %57, i64 %67
  %69 = load float, float* %68, align 4, !tbaa !30
  %70 = fadd float %63, %69
  %71 = or i32 %49, 2
  %72 = mul i32 %71, %6
  %73 = add i32 %47, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float* %57, i64 %74
  %76 = load float, float* %75, align 4, !tbaa !30
  %77 = fadd float %70, %76
  %78 = or i32 %49, 3
  %79 = mul i32 %78, %6
  %80 = add i32 %47, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float* %57, i64 %81
  %83 = load float, float* %82, align 4, !tbaa !30
  %84 = fadd float %77, %83
  %85 = or i32 %49, 4
  %86 = mul i32 %85, %6
  %87 = add i32 %47, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float* %57, i64 %88
  %90 = load float, float* %89, align 4, !tbaa !30
  %91 = fadd float %84, %90
  %92 = or i32 %49, 5
  %93 = mul i32 %92, %6
  %94 = add i32 %47, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float* %57, i64 %95
  %97 = load float, float* %96, align 4, !tbaa !30
  %98 = fadd float %91, %97
  %99 = or i32 %49, 6
  %100 = mul i32 %99, %6
  %101 = add i32 %47, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float* %57, i64 %102
  %104 = load float, float* %103, align 4, !tbaa !30
  %105 = fadd float %98, %104
  %106 = or i32 %49, 7
  %107 = mul i32 %106, %6
  %108 = add i32 %47, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float* %57, i64 %109
  %111 = load float, float* %110, align 4, !tbaa !30
  %112 = fadd float %105, %111
  %113 = or i32 %49, 8
  %114 = mul i32 %113, %6
  %115 = add i32 %47, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float* %57, i64 %116
  %118 = load float, float* %117, align 4, !tbaa !30
  %119 = fadd float %112, %118
  %120 = or i32 %49, 9
  %121 = mul i32 %120, %6
  %122 = add i32 %47, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float* %57, i64 %123
  %125 = load float, float* %124, align 4, !tbaa !30
  %126 = fadd float %119, %125
  %127 = or i32 %49, 10
  %128 = mul i32 %127, %6
  %129 = add i32 %47, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float* %57, i64 %130
  %132 = load float, float* %131, align 4, !tbaa !30
  %133 = fadd float %126, %132
  %134 = or i32 %49, 11
  %135 = mul i32 %134, %6
  %136 = add i32 %47, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float* %57, i64 %137
  %139 = load float, float* %138, align 4, !tbaa !30
  %140 = fadd float %133, %139
  %141 = or i32 %49, 12
  %142 = mul i32 %141, %6
  %143 = add i32 %47, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float* %57, i64 %144
  %146 = load float, float* %145, align 4, !tbaa !30
  %147 = fadd float %140, %146
  %148 = or i32 %49, 13
  %149 = mul i32 %148, %6
  %150 = add i32 %47, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float* %57, i64 %151
  %153 = load float, float* %152, align 4, !tbaa !30
  %154 = fadd float %147, %153
  %155 = or i32 %49, 14
  %156 = mul i32 %155, %6
  %157 = add i32 %47, %156
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float* %57, i64 %158
  %160 = load float, float* %159, align 4, !tbaa !30
  %161 = fadd float %154, %160
  %162 = or i32 %49, 15
  %163 = mul i32 %162, %6
  %164 = add i32 %47, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float* %57, i64 %165
  %167 = load float, float* %166, align 4, !tbaa !30
  %168 = fadd float %161, %167
  %169 = icmp slt i32 %51, 128
  br i1 %169, label %48, label %187

; <label>:170:                                    ; preds = %48
  %171 = mul i32 %49, %6
  %172 = add i32 %171, %45
  %173 = icmp slt i32 %172, %2
  br i1 %173, label %174, label %188

; <label>:174:                                    ; preds = %170
  %175 = load float*, float** %20, align 8, !tbaa !57
  br label %176

; <label>:176:                                    ; preds = %174, %176
  %177 = phi i32 [ %172, %174 ], [ %184, %176 ]
  %178 = phi float [ %50, %174 ], [ %183, %176 ]
  %179 = add nsw i32 %177, %46
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float* %175, i64 %180
  %182 = load float, float* %181, align 4, !tbaa !30
  %183 = fadd float %178, %182
  %184 = add i32 %177, %6
  %185 = icmp slt i32 %184, %2
  br i1 %185, label %176, label %186

; <label>:186:                                    ; preds = %176
  br label %188

; <label>:187:                                    ; preds = %56
  br label %188

; <label>:188:                                    ; preds = %187, %186, %170
  %189 = phi float [ %50, %170 ], [ %183, %186 ], [ %168, %187 ]
  %190 = tail call float @_Z11__shfl_downIfET_S0_i(float %189, i32 16) #3
  %191 = fadd float %189, %190
  %192 = tail call float @_Z11__shfl_downIfET_S0_i(float %191, i32 8) #3
  %193 = fadd float %191, %192
  %194 = tail call float @_Z11__shfl_downIfET_S0_i(float %193, i32 4) #3
  %195 = fadd float %193, %194
  %196 = tail call float @_Z11__shfl_downIfET_S0_i(float %195, i32 2) #3
  %197 = fadd float %195, %196
  %198 = tail call float @_Z11__shfl_downIfET_S0_i(float %197, i32 1) #3
  br i1 %22, label %199, label %204

; <label>:199:                                    ; preds = %188
  %200 = fadd float %197, %198
  %201 = sext i32 %40 to i64
  %202 = getelementptr inbounds float, float* %4, i64 %201
  %203 = tail call float @_Z9atomicAddIfET_PS0_S0_(float* %202, float %200) #3
  br label %204

; <label>:204:                                    ; preds = %188, %199, %38
  %205 = add i32 %39, %12
  %206 = icmp slt i32 %205, %11
  br i1 %206, label %38, label %36
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SL_PNSK_15CoeffReturnTypeE(%"struct.Eigen::internal::SumReducer"* byval nocapture readnone align 1, %"struct.Eigen::TensorEvaluator.36"* byval nocapture readonly align 8, i32, i32, float*) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %8 = mul i32 %7, %6
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %10 = mul i32 %9, %6
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %12 = add i32 %10, %11
  %13 = icmp eq i32 %7, 1
  br i1 %13, label %14, label %25

; <label>:14:                                     ; preds = %5
  %15 = icmp slt i32 %12, %3
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %14
  br label %19

; <label>:17:                                     ; preds = %19
  br label %18

; <label>:18:                                     ; preds = %17, %14
  tail call void @llvm.nvvm.barrier0()
  br label %25

; <label>:19:                                     ; preds = %16, %19
  %20 = phi i32 [ %23, %19 ], [ %12, %16 ]
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %4, i64 %21
  store float 0.000000e+00, float* %22, align 4, !tbaa !30
  %23 = add nsw i32 %20, %8
  %24 = icmp slt i32 %23, %3
  br i1 %24, label %19, label %17

; <label>:25:                                     ; preds = %18, %5
  %26 = add i32 %2, 15
  %27 = sdiv i32 %26, 16
  %28 = mul nsw i32 %27, %3
  %29 = icmp slt i32 %12, %28
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %25
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.36", %"struct.Eigen::TensorEvaluator.36"* %1, i64 0, i32 6, i32 0
  %32 = xor i32 %2, -1
  br label %35

; <label>:33:                                     ; preds = %79
  br label %34

; <label>:34:                                     ; preds = %33, %25
  ret void

; <label>:35:                                     ; preds = %30, %79
  %36 = phi i32 [ %12, %30 ], [ %84, %79 ]
  %37 = srem i32 %36, %3
  %38 = sdiv i32 %36, %3
  %39 = shl nsw i32 %38, 4
  %40 = add nsw i32 %39, 16
  %41 = icmp sgt i32 %40, %2
  %42 = select i1 %41, i32 %2, i32 %40
  %43 = icmp slt i32 %39, %42
  br i1 %43, label %44, label %79

; <label>:44:                                     ; preds = %35
  %45 = load float*, float** %31, align 8, !tbaa !57
  %46 = sub i32 -17, %39
  %47 = icmp slt i32 %46, %32
  %48 = select i1 %47, i32 %32, i32 %46
  %49 = xor i32 %48, 3
  %50 = sub i32 %49, %39
  %51 = sub i32 -2, %48
  %52 = sub i32 %51, %39
  %53 = and i32 %50, 3
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %70, label %55

; <label>:55:                                     ; preds = %44
  br label %56

; <label>:56:                                     ; preds = %56, %55
  %57 = phi i32 [ %39, %55 ], [ %66, %56 ]
  %58 = phi float [ 0.000000e+00, %55 ], [ %65, %56 ]
  %59 = phi i32 [ %53, %55 ], [ %67, %56 ]
  %60 = mul nsw i32 %57, %3
  %61 = add nsw i32 %60, %37
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float* %45, i64 %62
  %64 = load float, float* %63, align 4, !tbaa !30
  %65 = fadd float %58, %64
  %66 = add nsw i32 %57, 1
  %67 = add i32 %59, -1
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %56, !llvm.loop !71

; <label>:69:                                     ; preds = %56
  br label %70

; <label>:70:                                     ; preds = %44, %69
  %71 = phi i32 [ %39, %44 ], [ %66, %69 ]
  %72 = phi float [ 0.000000e+00, %44 ], [ %65, %69 ]
  %73 = phi float [ undef, %44 ], [ %65, %69 ]
  %74 = icmp ult i32 %52, 3
  br i1 %74, label %77, label %75

; <label>:75:                                     ; preds = %70
  br label %86

; <label>:76:                                     ; preds = %86
  br label %77

; <label>:77:                                     ; preds = %70, %76
  %78 = phi float [ %73, %70 ], [ %115, %76 ]
  br label %79

; <label>:79:                                     ; preds = %77, %35
  %80 = phi float [ 0.000000e+00, %35 ], [ %78, %77 ]
  %81 = sext i32 %37 to i64
  %82 = getelementptr inbounds float, float* %4, i64 %81
  %83 = tail call float @_Z9atomicAddIfET_PS0_S0_(float* %82, float %80) #3
  %84 = add nsw i32 %36, %8
  %85 = icmp slt i32 %84, %28
  br i1 %85, label %35, label %33

; <label>:86:                                     ; preds = %86, %75
  %87 = phi i32 [ %71, %75 ], [ %116, %86 ]
  %88 = phi float [ %72, %75 ], [ %115, %86 ]
  %89 = mul nsw i32 %87, %3
  %90 = add nsw i32 %89, %37
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float* %45, i64 %91
  %93 = load float, float* %92, align 4, !tbaa !30
  %94 = fadd float %88, %93
  %95 = add nsw i32 %87, 1
  %96 = mul nsw i32 %95, %3
  %97 = add nsw i32 %96, %37
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %45, i64 %98
  %100 = load float, float* %99, align 4, !tbaa !30
  %101 = fadd float %94, %100
  %102 = add nsw i32 %87, 2
  %103 = mul nsw i32 %102, %3
  %104 = add nsw i32 %103, %37
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float* %45, i64 %105
  %107 = load float, float* %106, align 4, !tbaa !30
  %108 = fadd float %101, %107
  %109 = add nsw i32 %87, 3
  %110 = mul nsw i32 %109, %3
  %111 = add nsw i32 %110, %37
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float* %45, i64 %112
  %114 = load float, float* %113, align 4, !tbaa !30
  %115 = fadd float %108, %114
  %116 = add nsw i32 %87, 4
  %117 = icmp slt i32 %116, %42
  br i1 %117, label %86, label %76
}

; Function Attrs: nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESG_EEEESG_EENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.37"* byval nocapture readonly align 8, i32) local_unnamed_addr #5 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %9 = mul i32 %8, %4
  %10 = icmp slt i32 %7, %1
  br i1 %10, label %11, label %115

; <label>:11:                                     ; preds = %2
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %0, i64 0, i32 0, i32 1, i32 8
  %13 = load float*, float** %12, align 8, !tbaa !72
  %14 = icmp eq float* %13, null
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %0, i64 0, i32 0, i32 1, i32 3, i32 0, i64 0
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %0, i64 0, i32 0, i32 1, i32 5, i32 0, i64 0
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %0, i64 0, i32 0, i32 1, i32 4, i32 0, i64 0
  %20 = load i32, i32* %19, align 8
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %0, i64 0, i32 0, i32 1, i32 6, i32 0
  %22 = load float*, float** %21, align 8
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %0, i64 0, i32 2
  %24 = load float*, float** %23, align 8, !tbaa !74
  br i1 %14, label %26, label %25

; <label>:25:                                     ; preds = %11
  br label %103

; <label>:26:                                     ; preds = %11
  %27 = icmp sgt i32 %18, 0
  br i1 %27, label %29, label %28

; <label>:28:                                     ; preds = %26
  br label %97

; <label>:29:                                     ; preds = %26
  %30 = add i32 %18, -1
  %31 = and i32 %18, 3
  %32 = icmp eq i32 %31, 0
  %33 = icmp ult i32 %30, 3
  br label %34

; <label>:34:                                     ; preds = %29, %58
  %35 = phi i32 [ %63, %58 ], [ %7, %29 ]
  %36 = mul nsw i32 %35, %16
  br i1 %32, label %52, label %37

; <label>:37:                                     ; preds = %34
  br label %38

; <label>:38:                                     ; preds = %38, %37
  %39 = phi float [ 0.000000e+00, %37 ], [ %47, %38 ]
  %40 = phi i32 [ 0, %37 ], [ %48, %38 ]
  %41 = phi i32 [ %31, %37 ], [ %49, %38 ]
  %42 = mul nsw i32 %40, %20
  %43 = add nsw i32 %42, %36
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float* %22, i64 %44
  %46 = load float, float* %45, align 4, !tbaa !30
  %47 = fadd float %39, %46
  %48 = add nuw nsw i32 %40, 1
  %49 = add i32 %41, -1
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %38, !llvm.loop !80

; <label>:51:                                     ; preds = %38
  br label %52

; <label>:52:                                     ; preds = %34, %51
  %53 = phi float [ undef, %34 ], [ %47, %51 ]
  %54 = phi float [ 0.000000e+00, %34 ], [ %47, %51 ]
  %55 = phi i32 [ 0, %34 ], [ %48, %51 ]
  br i1 %33, label %58, label %56

; <label>:56:                                     ; preds = %52
  br label %65

; <label>:57:                                     ; preds = %65
  br label %58

; <label>:58:                                     ; preds = %52, %57
  %59 = phi float [ %53, %52 ], [ %94, %57 ]
  %60 = fdiv float 1.000000e+00, %59
  %61 = sext i32 %35 to i64
  %62 = getelementptr inbounds float, float* %24, i64 %61
  store float %60, float* %62, align 4, !tbaa !30
  %63 = add nsw i32 %35, %9
  %64 = icmp slt i32 %63, %1
  br i1 %64, label %34, label %112

; <label>:65:                                     ; preds = %65, %56
  %66 = phi float [ %54, %56 ], [ %94, %65 ]
  %67 = phi i32 [ %55, %56 ], [ %95, %65 ]
  %68 = mul nsw i32 %67, %20
  %69 = add nsw i32 %68, %36
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float* %22, i64 %70
  %72 = load float, float* %71, align 4, !tbaa !30
  %73 = fadd float %66, %72
  %74 = add nuw nsw i32 %67, 1
  %75 = mul nsw i32 %74, %20
  %76 = add nsw i32 %75, %36
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float* %22, i64 %77
  %79 = load float, float* %78, align 4, !tbaa !30
  %80 = fadd float %73, %79
  %81 = add nsw i32 %67, 2
  %82 = mul nsw i32 %81, %20
  %83 = add nsw i32 %82, %36
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float* %22, i64 %84
  %86 = load float, float* %85, align 4, !tbaa !30
  %87 = fadd float %80, %86
  %88 = add nsw i32 %67, 3
  %89 = mul nsw i32 %88, %20
  %90 = add nsw i32 %89, %36
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float* %22, i64 %91
  %93 = load float, float* %92, align 4, !tbaa !30
  %94 = fadd float %87, %93
  %95 = add nsw i32 %67, 4
  %96 = icmp eq i32 %95, %18
  br i1 %96, label %57, label %65

; <label>:97:                                     ; preds = %28, %97
  %98 = phi i32 [ %101, %97 ], [ %7, %28 ]
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float* %24, i64 %99
  store float 0x7FF0000000000000, float* %100, align 4, !tbaa !30
  %101 = add nsw i32 %98, %9
  %102 = icmp slt i32 %101, %1
  br i1 %102, label %97, label %113

; <label>:103:                                    ; preds = %25, %103
  %104 = phi i32 [ %110, %103 ], [ %7, %25 ]
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float* %13, i64 %105
  %107 = load float, float* %106, align 4, !tbaa !30
  %108 = fdiv float 1.000000e+00, %107
  %109 = getelementptr inbounds float, float* %24, i64 %105
  store float %108, float* %109, align 4, !tbaa !30
  %110 = add nsw i32 %104, %9
  %111 = icmp slt i32 %110, %1
  br i1 %111, label %103, label %114

; <label>:112:                                    ; preds = %58
  br label %115

; <label>:113:                                    ; preds = %97
  br label %115

; <label>:114:                                    ; preds = %103
  br label %115

; <label>:115:                                    ; preds = %114, %113, %112, %2
  ret void
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEESC_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.47"* byval nocapture readonly align 8, i32) local_unnamed_addr #1 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6, !range !27
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #6, !range !42
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6, !range !28
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6, !range !29
  %9 = mul i32 %8, %4
  %10 = sdiv i32 %1, 4
  %11 = shl nsw i32 %10, 2
  %12 = shl i32 %9, 2
  %13 = shl nsw i32 %7, 2
  %14 = icmp slt i32 %13, %11
  br i1 %14, label %15, label %31

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 1, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 1
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 4, i32 0, i32 3
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 0, i32 0
  %23 = load float*, float** %22, align 8
  %24 = load float*, float** %16, align 8, !tbaa !57
  %25 = load i32, i32* %17, align 8, !tbaa !40
  %26 = load i32, i32* %18, align 8, !tbaa !40
  %27 = load i32, i32* %19, align 8, !tbaa !40
  %28 = load i32, i32* %20, align 4, !tbaa !40
  %29 = load float*, float** %21, align 8, !tbaa !81
  br label %49

; <label>:30:                                     ; preds = %123
  br label %31

; <label>:31:                                     ; preds = %30, %2
  %32 = add nsw i32 %7, %11
  %33 = icmp slt i32 %32, %1
  br i1 %33, label %34, label %163

; <label>:34:                                     ; preds = %31
  %35 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 1, i32 0
  %36 = load float*, float** %35, align 8, !tbaa !57
  %37 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %38 = load i32, i32* %37, align 8, !tbaa !40
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 0
  %40 = load i32, i32* %39, align 8, !tbaa !40
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  %42 = load i32, i32* %41, align 8, !tbaa !40
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i64 1
  %44 = load i32, i32* %43, align 4, !tbaa !40
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 1, i32 2, i32 4, i32 0, i32 3
  %46 = load float*, float** %45, align 8, !tbaa !81
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %0, i64 0, i32 0, i32 0
  %48 = load float*, float** %47, align 8, !tbaa !55
  br label %143

; <label>:49:                                     ; preds = %123, %15
  %50 = phi i32 [ %13, %15 ], [ %141, %123 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float* %24, i64 %51
  %53 = load float, float* %52, align 4, !tbaa !30
  %54 = getelementptr inbounds float, float* %52, i64 1
  %55 = load float, float* %54, align 4, !tbaa !30
  %56 = getelementptr inbounds float, float* %52, i64 2
  %57 = load float, float* %56, align 4, !tbaa !30
  %58 = getelementptr inbounds float, float* %52, i64 3
  %59 = load float, float* %58, align 4, !tbaa !30
  %60 = tail call %struct.float4 @_Z11make_float4ffff(float %53, float %55, float %57, float %59) #3
  %61 = extractvalue %struct.float4 %60, 0
  %62 = extractvalue %struct.float4 %60, 1
  %63 = extractvalue %struct.float4 %60, 2
  %64 = extractvalue %struct.float4 %60, 3
  %65 = sdiv i32 %50, %25
  %66 = srem i32 %65, %26
  %67 = mul nsw i32 %27, %66
  %68 = mul nsw i32 %65, %25
  %69 = sub nsw i32 %50, %68
  %70 = srem i32 %69, %28
  %71 = add nsw i32 %70, %67
  %72 = add nsw i32 %70, 4
  %73 = icmp sgt i32 %72, %28
  %74 = sext i32 %71 to i64
  %75 = getelementptr inbounds float, float* %29, i64 %74
  %76 = load float, float* %75, align 4, !tbaa !30
  br i1 %73, label %89, label %77

; <label>:77:                                     ; preds = %49
  %78 = getelementptr inbounds float, float* %75, i64 1
  %79 = load float, float* %78, align 4, !tbaa !30
  %80 = getelementptr inbounds float, float* %75, i64 2
  %81 = load float, float* %80, align 4, !tbaa !30
  %82 = getelementptr inbounds float, float* %75, i64 3
  %83 = load float, float* %82, align 4, !tbaa !30
  %84 = tail call %struct.float4 @_Z11make_float4ffff(float %76, float %79, float %81, float %83) #3
  %85 = extractvalue %struct.float4 %84, 0
  %86 = extractvalue %struct.float4 %84, 1
  %87 = extractvalue %struct.float4 %84, 2
  %88 = extractvalue %struct.float4 %84, 3
  br label %123

; <label>:89:                                     ; preds = %49
  %90 = or i32 %50, 1
  %91 = sdiv i32 %90, %25
  %92 = srem i32 %91, %26
  %93 = mul nsw i32 %92, %27
  %94 = mul nsw i32 %91, %25
  %95 = sub nsw i32 %90, %94
  %96 = srem i32 %95, %28
  %97 = add nsw i32 %96, %93
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float* %29, i64 %98
  %100 = load float, float* %99, align 4, !tbaa !30
  %101 = or i32 %50, 2
  %102 = sdiv i32 %101, %25
  %103 = srem i32 %102, %26
  %104 = mul nsw i32 %103, %27
  %105 = mul nsw i32 %102, %25
  %106 = sub nsw i32 %101, %105
  %107 = srem i32 %106, %28
  %108 = add nsw i32 %107, %104
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float* %29, i64 %109
  %111 = load float, float* %110, align 4, !tbaa !30
  %112 = or i32 %50, 3
  %113 = sdiv i32 %112, %25
  %114 = srem i32 %113, %26
  %115 = mul nsw i32 %114, %27
  %116 = mul nsw i32 %113, %25
  %117 = sub nsw i32 %112, %116
  %118 = srem i32 %117, %28
  %119 = add nsw i32 %118, %115
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float* %29, i64 %120
  %122 = load float, float* %121, align 4, !tbaa !30
  br label %123

; <label>:123:                                    ; preds = %89, %77
  %124 = phi float [ %85, %77 ], [ %76, %89 ]
  %125 = phi float [ %86, %77 ], [ %100, %89 ]
  %126 = phi float [ %87, %77 ], [ %111, %89 ]
  %127 = phi float [ %88, %77 ], [ %122, %89 ]
  %128 = fmul float %61, %124
  %129 = fmul float %62, %125
  %130 = fmul float %63, %126
  %131 = fmul float %64, %127
  %132 = tail call %struct.float4 @_Z11make_float4ffff(float %128, float %129, float %130, float %131) #3
  %133 = extractvalue %struct.float4 %132, 0
  %134 = extractvalue %struct.float4 %132, 1
  %135 = extractvalue %struct.float4 %132, 2
  %136 = extractvalue %struct.float4 %132, 3
  %137 = getelementptr inbounds float, float* %23, i64 %51
  store float %133, float* %137, align 4
  %138 = getelementptr inbounds float, float* %137, i64 1
  store float %134, float* %138, align 4
  %139 = getelementptr inbounds float, float* %137, i64 2
  store float %135, float* %139, align 4
  %140 = getelementptr inbounds float, float* %137, i64 3
  store float %136, float* %140, align 4
  %141 = add nsw i32 %50, %12
  %142 = icmp slt i32 %141, %11
  br i1 %142, label %49, label %30

; <label>:143:                                    ; preds = %143, %34
  %144 = phi i32 [ %32, %34 ], [ %160, %143 ]
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float* %36, i64 %145
  %147 = load float, float* %146, align 4, !tbaa !30
  %148 = sdiv i32 %144, %38
  %149 = srem i32 %148, %40
  %150 = mul nsw i32 %149, %42
  %151 = mul nsw i32 %148, %38
  %152 = sub nsw i32 %144, %151
  %153 = srem i32 %152, %44
  %154 = add nsw i32 %153, %150
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float* %46, i64 %155
  %157 = load float, float* %156, align 4, !tbaa !30
  %158 = fmul float %147, %157
  %159 = getelementptr inbounds float, float* %48, i64 %145
  store float %158, float* %159, align 4, !tbaa !30
  %160 = add nsw i32 %144, %9
  %161 = icmp slt i32 %160, %1
  br i1 %161, label %143, label %162

; <label>:162:                                    ; preds = %143
  br label %163

; <label>:163:                                    ; preds = %162, %31
  ret void
}

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent nounwind }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = !{void (%"struct.Eigen::internal::MaxReducer"*, %"struct.Eigen::TensorEvaluator"*, i32, float*, i32*)* @_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSL_15CoeffReturnTypeEPj, !"kernel", i32 1}
!1 = !{void (float, i32, float*)* @_ZN5Eigen8internal19ReductionInitKernelIfiEEvT_T0_PS2_, !"kernel", i32 1}
!2 = !{void (%"struct.Eigen::internal::MaxReducer"*, %"struct.Eigen::TensorEvaluator"*, i32, i32, float*)* @_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SM_PNSL_15CoeffReturnTypeE, !"kernel", i32 1}
!3 = !{void (%"struct.Eigen::internal::MaxReducer"*, %"struct.Eigen::TensorEvaluator"*, i32, i32, float*)* @_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SM_PNSL_15CoeffReturnTypeE, !"kernel", i32 1}
!4 = !{void (%"struct.Eigen::TensorEvaluator.4"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EESE_EENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!5 = !{void (%"struct.Eigen::TensorEvaluator.4"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EESE_EENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!6 = !{void (%"struct.Eigen::TensorEvaluator.7"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSB_EEKNS4_INS5_ISB_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISJ_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSH_IiLi1EEESF_S7_EEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!7 = !{void (%"struct.Eigen::TensorEvaluator.7"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSB_EEKNS4_INS5_ISB_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISJ_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSH_IiLi1EEESF_S7_EEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!8 = !{void (%"struct.Eigen::internal::SumReducer"*, %"struct.Eigen::TensorEvaluator.16"*, i32, float*, i32*)* @_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSP_15CoeffReturnTypeEPj, !"kernel", i32 1}
!9 = !{void (%"struct.Eigen::internal::SumReducer"*, %"struct.Eigen::TensorEvaluator.16"*, i32, i32, float*)* @_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SQ_PNSP_15CoeffReturnTypeE, !"kernel", i32 1}
!10 = !{void (%"struct.Eigen::internal::SumReducer"*, %"struct.Eigen::TensorEvaluator.16"*, i32, i32, float*)* @_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SQ_PNSP_15CoeffReturnTypeE, !"kernel", i32 1}
!11 = !{void (%"struct.Eigen::TensorEvaluator.20"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!12 = !{void (%"struct.Eigen::TensorEvaluator.20"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!13 = !{void (%"struct.Eigen::TensorEvaluator.27"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEEKNSH_INS0_13scalar_exp_opIfEESC_EES7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!14 = !{void (%"struct.Eigen::TensorEvaluator.27"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEEKNSH_INS0_13scalar_exp_opIfEESC_EES7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!15 = !{void (%"struct.Eigen::TensorEvaluator.34"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSE_EEKNS4_INS5_ISE_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISM_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSK_IiLi1EEESI_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!16 = !{void (%"struct.Eigen::TensorEvaluator.34"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSE_EEKNS4_INS5_ISE_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISM_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSK_IiLi1EEESI_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!17 = !{void (%"struct.Eigen::internal::SumReducer"*, %"struct.Eigen::TensorEvaluator.36"*, i32, float*, i32*)* @_ZN5Eigen8internal19FullReductionKernelILi256ELi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT2_T1_T3_PNSK_15CoeffReturnTypeEPj, !"kernel", i32 1}
!18 = !{void (%"struct.Eigen::internal::SumReducer"*, %"struct.Eigen::TensorEvaluator.36"*, i32, i32, float*)* @_ZN5Eigen8internal20InnerReductionKernelILi128ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SL_PNSK_15CoeffReturnTypeE, !"kernel", i32 1}
!19 = !{void (%"struct.Eigen::internal::SumReducer"*, %"struct.Eigen::TensorEvaluator.36"*, i32, i32, float*)* @_ZN5Eigen8internal20OuterReductionKernelILi16ENS_15TensorEvaluatorIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEES5_iEEvT1_T0_T2_SL_PNSK_15CoeffReturnTypeE, !"kernel", i32 1}
!20 = !{void (%"struct.Eigen::TensorEvaluator.37"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESG_EEEESG_EENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!21 = !{void (%"struct.Eigen::TensorEvaluator.37"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESG_EEEESG_EENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!22 = !{void (%"struct.Eigen::TensorEvaluator.47"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEESC_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!23 = !{void (%"struct.Eigen::TensorEvaluator.47"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEESC_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!24 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!25 = !{i32 1, !"PIC Level", i32 2}
!26 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!27 = !{i32 0, i32 2147483647}
!28 = !{i32 0, i32 1024}
!29 = !{i32 1, i32 -2147483648}
!30 = !{!31, !31, i64 0}
!31 = !{!"float", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C++ TBAA"}
!34 = !{!35, !36, i64 0}
!35 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !36, i64 0, !37, i64 8, !32, i64 16, !32, i64 24}
!36 = !{!"any pointer", !32, i64 0}
!37 = !{!"_ZTSN5Eigen6DSizesIiLi2EEE"}
!38 = distinct !{!38, !39}
!39 = !{!"llvm.loop.unroll.disable"}
!40 = !{!41, !41, i64 0}
!41 = !{!"int", !32, i64 0}
!42 = !{i32 1, i32 1025}
!43 = distinct !{!43, !39}
!44 = !{!45, !36, i64 64}
!45 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEE", !46, i64 0, !47, i64 4, !48, i64 8, !48, i64 12, !48, i64 16, !48, i64 20, !35, i64 24, !49, i64 56, !36, i64 64, !32, i64 72}
!46 = !{!"_ZTSN5Eigen5arrayIbLm2EEE", !32, i64 0}
!47 = !{!"_ZTSN5Eigen6DSizesIiLi1EEE"}
!48 = !{!"_ZTSN5Eigen5arrayIiLm1EEE", !32, i64 0}
!49 = !{!"_ZTSN5Eigen8internal10MaxReducerIfEE"}
!50 = !{!51, !36, i64 88}
!51 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EESD_EENS_9GpuDeviceEEE", !45, i64 0, !32, i64 80, !36, i64 88, !32, i64 96, !52, i64 104}
!52 = !{!"_ZTSN5Eigen17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESB_EE", !32, i64 0, !47, i64 8, !49, i64 12}
!53 = !{!54, !36, i64 104}
!54 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EEEENS_9GpuDeviceEEE", !45, i64 0, !52, i64 80, !32, i64 96, !36, i64 104}
!55 = !{!56, !36, i64 0}
!56 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !36, i64 0, !37, i64 8, !32, i64 16, !32, i64 24}
!57 = !{!58, !36, i64 0}
!58 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !36, i64 0, !37, i64 8, !32, i64 16, !32, i64 24}
!59 = !{!60, !36, i64 72}
!60 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS2_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESE_EENS_9GpuDeviceEEE", !46, i64 0, !47, i64 4, !48, i64 8, !48, i64 12, !48, i64 16, !48, i64 20, !61, i64 24, !63, i64 64, !36, i64 72, !32, i64 80}
!61 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEEE", !62, i64 0, !58, i64 8}
!62 = !{!"_ZTSN5Eigen8internal13scalar_exp_opIfEE"}
!63 = !{!"_ZTSN5Eigen8internal10SumReducerIfEE"}
!64 = !{!65, !36, i64 96}
!65 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS3_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EESF_EENS_9GpuDeviceEEE", !60, i64 0, !32, i64 88, !36, i64 96, !32, i64 104, !66, i64 112}
!66 = !{!"_ZTSN5Eigen17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS1_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESD_EE", !67, i64 0, !47, i64 16, !63, i64 20}
!67 = !{!"_ZTSN5Eigen18TensorCwiseUnaryOpINS_8internal13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEE", !32, i64 0, !62, i64 8}
!68 = !{!69, !36, i64 120}
!69 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS3_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EEEENS_9GpuDeviceEEE", !60, i64 0, !66, i64 88, !32, i64 112, !36, i64 120}
!70 = distinct !{!70, !39}
!71 = distinct !{!71, !39}
!72 = !{!73, !36, i64 64}
!73 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESB_EENS_9GpuDeviceEEE", !46, i64 0, !47, i64 4, !48, i64 8, !48, i64 12, !48, i64 16, !48, i64 20, !58, i64 24, !63, i64 56, !36, i64 64, !32, i64 72}
!74 = !{!75, !36, i64 96}
!75 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS3_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESF_EEEESF_EENS_9GpuDeviceEEE", !76, i64 0, !32, i64 88, !36, i64 96, !32, i64 104, !78, i64 112}
!76 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS2_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EEEENS_9GpuDeviceEEE", !77, i64 0, !73, i64 8}
!77 = !{!"_ZTSN5Eigen8internal17scalar_inverse_opIfEE"}
!78 = !{!"_ZTSN5Eigen18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS1_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EEEE", !79, i64 0, !77, i64 16}
!79 = !{!"_ZTSN5Eigen17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESA_EE", !32, i64 0, !47, i64 8, !63, i64 12}
!80 = distinct !{!80, !39}
!81 = !{!82, !36, i64 120}
!82 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS3_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESF_EEEEEENS_9GpuDeviceEEE", !76, i64 0, !78, i64 88, !32, i64 112, !36, i64 120}
