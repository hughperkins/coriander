; ModuleID = 'tensorflow/core/kernels/softmax_op_gpu.cu.cc'
source_filename = "tensorflow/core/kernels/softmax_op_gpu.cu.cc"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%"struct.tensorflow::functor::SoftmaxFunctor" = type { i8 }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"class.Eigen::TensorAssignOp" = type { %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorCwiseBinaryOp"* }
%"class.Eigen::TensorMap.1" = type { float*, %"struct.Eigen::DSizes" }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [2 x i32] }
%"class.Eigen::TensorCwiseBinaryOp" = type <{ %"class.Eigen::TensorMap"*, %"class.Eigen::TensorBroadcastingOp", %"struct.Eigen::internal::scalar_difference_op", [7 x i8] }>
%"class.Eigen::TensorMap" = type { float*, %"struct.Eigen::DSizes" }
%"class.Eigen::TensorBroadcastingOp" = type { %"class.Eigen::TensorReshapingOp", %"struct.Eigen::DSizes" }
%"class.Eigen::TensorReshapingOp" = type { %"class.Eigen::TensorForcedEvalOp", %"struct.Eigen::DSizes" }
%"class.Eigen::TensorForcedEvalOp" = type { %"class.Eigen::TensorReductionOp" }
%"class.Eigen::TensorReductionOp" = type <{ %"class.Eigen::TensorMap"*, %"struct.Eigen::DSizes.4", %"struct.Eigen::internal::MaxReducer", [3 x i8] }>
%"struct.Eigen::DSizes.4" = type { %"class.Eigen::array.5" }
%"class.Eigen::array.5" = type { [1 x i32] }
%"struct.Eigen::internal::MaxReducer" = type { i8 }
%"struct.Eigen::internal::scalar_difference_op" = type { i8 }
%"class.Eigen::TensorAssignOp.61" = type { %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorCwiseBinaryOp.12"* }
%"class.Eigen::TensorCwiseBinaryOp.12" = type <{ %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorBroadcastingOp.14", %"struct.Eigen::internal::scalar_difference_op.28", [7 x i8] }>
%"class.Eigen::TensorBroadcastingOp.14" = type { %"class.Eigen::TensorCwiseUnaryOp", %"struct.Eigen::DSizes" }
%"class.Eigen::TensorCwiseUnaryOp" = type <{ %"class.Eigen::TensorReshapingOp.17", %"struct.Eigen::internal::scalar_log_op", [7 x i8] }>
%"class.Eigen::TensorReshapingOp.17" = type { %"class.Eigen::TensorForcedEvalOp.20", %"struct.Eigen::DSizes" }
%"class.Eigen::TensorForcedEvalOp.20" = type { %"class.Eigen::TensorReductionOp.22" }
%"class.Eigen::TensorReductionOp.22" = type <{ %"class.Eigen::TensorCwiseUnaryOp.24", %"struct.Eigen::DSizes.4", %"struct.Eigen::internal::SumReducer", [3 x i8] }>
%"class.Eigen::TensorCwiseUnaryOp.24" = type <{ %"class.Eigen::TensorMap.1"*, %"struct.Eigen::internal::scalar_exp_op", [7 x i8] }>
%"struct.Eigen::internal::scalar_exp_op" = type { i8 }
%"struct.Eigen::internal::SumReducer" = type { i8 }
%"struct.Eigen::internal::scalar_log_op" = type { i8 }
%"struct.Eigen::internal::scalar_difference_op.28" = type { i8 }
%"class.Eigen::TensorAssignOp.75" = type { %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorCwiseUnaryOp.31"* }
%"class.Eigen::TensorCwiseUnaryOp.31" = type { %"class.Eigen::TensorCwiseBinaryOp", %"struct.Eigen::internal::scalar_exp_op", [7 x i8] }
%"class.Eigen::TensorAssignOp.79" = type { %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorCwiseBinaryOp.34"* }
%"class.Eigen::TensorCwiseBinaryOp.34" = type <{ %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorBroadcastingOp.36", %"struct.Eigen::internal::scalar_product_op", [7 x i8] }>
%"class.Eigen::TensorBroadcastingOp.36" = type { %"class.Eigen::TensorReshapingOp.38", %"struct.Eigen::DSizes" }
%"class.Eigen::TensorReshapingOp.38" = type { %"class.Eigen::TensorForcedEvalOp.41", %"struct.Eigen::DSizes" }
%"class.Eigen::TensorForcedEvalOp.41" = type { %"class.Eigen::TensorCwiseUnaryOp.43" }
%"class.Eigen::TensorCwiseUnaryOp.43" = type { %"class.Eigen::TensorReductionOp.45", %"struct.Eigen::internal::scalar_inverse_op", [7 x i8] }
%"class.Eigen::TensorReductionOp.45" = type <{ %"class.Eigen::TensorMap.1"*, %"struct.Eigen::DSizes.4", %"struct.Eigen::internal::SumReducer", [3 x i8] }>
%"struct.Eigen::internal::scalar_inverse_op" = type { i8 }
%"struct.Eigen::internal::scalar_product_op" = type { i8 }
%"class.Eigen::TensorEvalToOp" = type { %"class.Eigen::TensorReductionOp", float* }
%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::TensorEvaluator.52" }
%"struct.Eigen::TensorEvaluator.51" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.1"* }
%"struct.Eigen::TensorEvaluator.52" = type { %"struct.Eigen::internal::scalar_difference_op", %"struct.Eigen::TensorEvaluator.53", %"struct.Eigen::TensorEvaluator.54" }
%"struct.Eigen::TensorEvaluator.53" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap"* }
%"struct.Eigen::TensorEvaluator.54" = type { %"struct.Eigen::DSizes", %"struct.Eigen::DSizes", %"class.Eigen::array", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.55" }
%"struct.Eigen::TensorEvaluator.55" = type { %"struct.Eigen::TensorEvaluator.56", %"struct.Eigen::DSizes" }
%"struct.Eigen::TensorEvaluator.56" = type { %"struct.Eigen::TensorEvaluator.57", %"class.Eigen::TensorReductionOp", %"struct.Eigen::GpuDevice"*, float* }
%"struct.Eigen::TensorEvaluator.57" = type { %"class.Eigen::array.58", %"struct.Eigen::DSizes.4", %"class.Eigen::array.5", %"class.Eigen::array.5", %"class.Eigen::array.5", %"class.Eigen::array.5", %"struct.Eigen::TensorEvaluator.53", %"struct.Eigen::internal::MaxReducer", float*, %"struct.Eigen::GpuDevice"* }
%"class.Eigen::array.58" = type { [2 x i8] }
%struct.cudaDeviceProp = type { i64, i64, i64, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }
%"struct.Eigen::TensorEvaluator.60" = type { %"struct.Eigen::TensorEvaluator.57", %"struct.Eigen::GpuDevice"*, float*, %"class.Eigen::TensorEvalToOp"*, %"class.Eigen::TensorReductionOp" }
%"class.Eigen::TensorEvalToOp.72" = type { %"class.Eigen::TensorReductionOp.22", float* }
%"struct.Eigen::TensorEvaluator.63" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::TensorEvaluator.64" }
%"struct.Eigen::TensorEvaluator.64" = type { %"struct.Eigen::internal::scalar_difference_op.28", %"struct.Eigen::TensorEvaluator.65", %"struct.Eigen::TensorEvaluator.66" }
%"struct.Eigen::TensorEvaluator.65" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.1"* }
%"struct.Eigen::TensorEvaluator.66" = type { %"struct.Eigen::DSizes", %"struct.Eigen::DSizes", %"class.Eigen::array", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.67" }
%"struct.Eigen::TensorEvaluator.67" = type { %"struct.Eigen::internal::scalar_log_op", %"struct.Eigen::TensorEvaluator.68" }
%"struct.Eigen::TensorEvaluator.68" = type { %"struct.Eigen::TensorEvaluator.69", %"struct.Eigen::DSizes" }
%"struct.Eigen::TensorEvaluator.69" = type { %"struct.Eigen::TensorEvaluator.70", %"class.Eigen::TensorReductionOp.22", %"struct.Eigen::GpuDevice"*, float* }
%"struct.Eigen::TensorEvaluator.70" = type { %"class.Eigen::array.58", %"struct.Eigen::DSizes.4", %"class.Eigen::array.5", %"class.Eigen::array.5", %"class.Eigen::array.5", %"class.Eigen::array.5", %"struct.Eigen::TensorEvaluator.71", %"struct.Eigen::internal::SumReducer", float*, %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.71" = type { %"struct.Eigen::internal::scalar_exp_op", %"struct.Eigen::TensorEvaluator.65" }
%"struct.Eigen::TensorEvaluator.74" = type { %"struct.Eigen::TensorEvaluator.70", %"struct.Eigen::GpuDevice"*, float*, %"class.Eigen::TensorEvalToOp.72"*, %"class.Eigen::TensorReductionOp.22" }
%"struct.Eigen::TensorEvaluator.77" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::TensorEvaluator.78" }
%"struct.Eigen::TensorEvaluator.78" = type { %"struct.Eigen::internal::scalar_exp_op", %"struct.Eigen::TensorEvaluator.52" }
%"class.Eigen::TensorEvalToOp.88" = type { %"class.Eigen::TensorCwiseUnaryOp.43", float* }
%"struct.Eigen::TensorEvaluator.81" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::TensorEvaluator.82" }
%"struct.Eigen::TensorEvaluator.82" = type { %"struct.Eigen::internal::scalar_product_op", %"struct.Eigen::TensorEvaluator.65", %"struct.Eigen::TensorEvaluator.83" }
%"struct.Eigen::TensorEvaluator.83" = type { %"struct.Eigen::DSizes", %"struct.Eigen::DSizes", %"class.Eigen::array", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.84" }
%"struct.Eigen::TensorEvaluator.84" = type { %"struct.Eigen::TensorEvaluator.85", %"struct.Eigen::DSizes" }
%"struct.Eigen::TensorEvaluator.85" = type { %"struct.Eigen::TensorEvaluator.86", %"class.Eigen::TensorCwiseUnaryOp.43", %"struct.Eigen::GpuDevice"*, float* }
%"struct.Eigen::TensorEvaluator.86" = type { %"struct.Eigen::internal::scalar_inverse_op", %"struct.Eigen::TensorEvaluator.87" }
%"struct.Eigen::TensorEvaluator.87" = type { %"class.Eigen::array.58", %"struct.Eigen::DSizes.4", %"class.Eigen::array.5", %"class.Eigen::array.5", %"class.Eigen::array.5", %"class.Eigen::array.5", %"struct.Eigen::TensorEvaluator.65", %"struct.Eigen::internal::SumReducer", float*, %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.90" = type { %"struct.Eigen::TensorEvaluator.86", %"struct.Eigen::GpuDevice"*, float*, %"class.Eigen::TensorEvalToOp.88"*, %"class.Eigen::TensorCwiseUnaryOp.43" }

@__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_ = private unnamed_addr constant [4 x i8] c"run\00", align 1
@.str = private unnamed_addr constant [75 x i8] c"external/eigen_archive/unsupported/Eigen/CXX11/src/Tensor/TensorExecutor.h\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"cudaGetLastError() == cudaSuccess\00", align 1
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: ssp uwtable
define weak_odr void @_ZN10tensorflow7functor14SoftmaxFunctorIN5Eigen9GpuDeviceEfEclERKS3_NS2_9TensorMapINS2_6TensorIKfLi2ELi1EiEELi16ENS2_11MakePointerEEENS7_INS8_IfLi2ELi1EiEELi16ESB_EEb(%"struct.tensorflow::functor::SoftmaxFunctor"*, %"struct.Eigen::GpuDevice"* dereferenceable(16), float*, i64, float*, i64, i1 zeroext) local_unnamed_addr #0 align 2 {
  tail call void @_ZN10tensorflow7functor16SoftmaxEigenImplIN5Eigen9GpuDeviceEfE7ComputeERKS3_NS2_9TensorMapINS2_6TensorIKfLi2ELi1EiEELi16ENS2_11MakePointerEEENS7_INS8_IfLi2ELi1EiEELi16ESB_EEb(%"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %1, float* %2, i64 %3, float* %4, i64 %5, i1 zeroext %6)
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN10tensorflow7functor16SoftmaxEigenImplIN5Eigen9GpuDeviceEfE7ComputeERKS3_NS2_9TensorMapINS2_6TensorIKfLi2ELi1EiEELi16ENS2_11MakePointerEEENS7_INS8_IfLi2ELi1EiEELi16ESB_EEb(%"struct.Eigen::GpuDevice"* dereferenceable(16), float*, i64, float*, i64, i1 zeroext) local_unnamed_addr #0 align 2 {
  %7 = alloca %"class.Eigen::TensorAssignOp", align 8
  %8 = alloca %"class.Eigen::TensorAssignOp.61", align 8
  %9 = alloca %"class.Eigen::TensorAssignOp.75", align 8
  %10 = alloca %"class.Eigen::TensorAssignOp.79", align 8
  %11 = alloca %"class.Eigen::TensorMap", align 8
  %12 = alloca %"class.Eigen::TensorMap.1", align 8
  %13 = alloca %"class.Eigen::TensorCwiseBinaryOp", align 8
  %14 = alloca %"class.Eigen::TensorCwiseBinaryOp.12", align 8
  %15 = alloca %"class.Eigen::TensorCwiseUnaryOp.31", align 8
  %16 = alloca %"class.Eigen::TensorCwiseBinaryOp.34", align 8
  %17 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %11, i64 0, i32 0
  store float* %1, float** %17, align 8
  %18 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %11, i64 0, i32 1
  %19 = bitcast %"struct.Eigen::DSizes"* %18 to i64*
  store i64 %2, i64* %19, align 8
  %20 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %12, i64 0, i32 0
  store float* %3, float** %20, align 8
  %21 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %12, i64 0, i32 1
  %22 = bitcast %"struct.Eigen::DSizes"* %21 to i64*
  store i64 %4, i64* %22, align 8
  %23 = and i64 %2, -4294967296
  %24 = and i64 %2, 4294967295
  %25 = or i64 %24, 4294967296
  %26 = or i64 %23, 1
  %27 = bitcast %"class.Eigen::TensorCwiseBinaryOp"* %13 to i8*
  call void @llvm.lifetime.start(i64 48, i8* nonnull %27) #4
  %28 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 0
  store %"class.Eigen::TensorMap"* %11, %"class.Eigen::TensorMap"** %28, align 8, !tbaa !2, !alias.scope !5
  %29 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0
  store %"class.Eigen::TensorMap"* %11, %"class.Eigen::TensorMap"** %29, align 8
  %30 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 1, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 1, i32* %30, align 8
  %31 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 1, i32 0, i32 1
  %32 = bitcast %"struct.Eigen::DSizes"* %31 to i64*
  store i64 %25, i64* %32, align 8
  %33 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %13, i64 0, i32 1, i32 1
  %34 = bitcast %"struct.Eigen::DSizes"* %33 to i64*
  store i64 %26, i64* %34, align 8
  br i1 %5, label %35, label %52

; <label>:35:                                     ; preds = %6
  %36 = ptrtoint %"class.Eigen::TensorMap.1"* %12 to i64
  %37 = bitcast %"class.Eigen::TensorAssignOp"* %7 to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %37) #4
  %38 = bitcast %"class.Eigen::TensorAssignOp"* %7 to i64*
  store i64 %36, i64* %38, align 8, !tbaa !2
  %39 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %7, i64 0, i32 1
  store %"class.Eigen::TensorCwiseBinaryOp"* %13, %"class.Eigen::TensorCwiseBinaryOp"** %39, align 8, !tbaa !2
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %7, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %0)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %37) #4
  %40 = bitcast %"class.Eigen::TensorCwiseBinaryOp.12"* %14 to i8*
  call void @llvm.lifetime.start(i64 64, i8* nonnull %40) #4
  %41 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %14, i64 0, i32 0
  store %"class.Eigen::TensorMap.1"* %12, %"class.Eigen::TensorMap.1"** %41, align 8, !tbaa !2, !alias.scope !10
  %42 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %14, i64 0, i32 1
  %43 = bitcast %"class.Eigen::TensorBroadcastingOp.14"* %42 to i64*
  store i64 %36, i64* %43, align 8, !tbaa !2, !alias.scope !10
  %44 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %14, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 1, i32* %44, align 8
  %45 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %14, i64 0, i32 1, i32 0, i32 0, i32 1
  %46 = bitcast %"struct.Eigen::DSizes"* %45 to i64*
  store i64 %25, i64* %46, align 8, !alias.scope !10
  %47 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %14, i64 0, i32 1, i32 1
  %48 = bitcast %"struct.Eigen::DSizes"* %47 to i64*
  store i64 %26, i64* %48, align 8, !alias.scope !10
  %49 = bitcast %"class.Eigen::TensorAssignOp.61"* %8 to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %49) #4
  %50 = bitcast %"class.Eigen::TensorAssignOp.61"* %8 to i64*
  store i64 %36, i64* %50, align 8, !tbaa !2
  %51 = getelementptr inbounds %"class.Eigen::TensorAssignOp.61", %"class.Eigen::TensorAssignOp.61"* %8, i64 0, i32 1
  store %"class.Eigen::TensorCwiseBinaryOp.12"* %14, %"class.Eigen::TensorCwiseBinaryOp.12"** %51, align 8, !tbaa !2
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS7_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISF_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSD_IiLi1EEEKNSG_INS0_13scalar_exp_opIfEESB_EES6_EEEEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS17_RKS18_(%"class.Eigen::TensorAssignOp.61"* nonnull dereferenceable(16) %8, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %0)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %49) #4
  call void @llvm.lifetime.end(i64 64, i8* nonnull %40) #4
  br label %69

; <label>:52:                                     ; preds = %6
  %53 = bitcast %"class.Eigen::TensorCwiseUnaryOp.31"* %15 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %53) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %53, i8* nonnull %27, i64 40, i32 8, i1 false)
  %54 = ptrtoint %"class.Eigen::TensorMap.1"* %12 to i64
  %55 = bitcast %"class.Eigen::TensorAssignOp.75"* %9 to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %55) #4
  %56 = bitcast %"class.Eigen::TensorAssignOp.75"* %9 to i64*
  store i64 %54, i64* %56, align 8, !tbaa !2
  %57 = getelementptr inbounds %"class.Eigen::TensorAssignOp.75", %"class.Eigen::TensorAssignOp.75"* %9, i64 0, i32 1
  store %"class.Eigen::TensorCwiseUnaryOp.31"* %15, %"class.Eigen::TensorCwiseUnaryOp.31"** %57, align 8, !tbaa !2
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSD_EEKNS3_INS4_ISD_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISL_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSJ_IiLi1EEESH_S6_EEEEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS16_RKS17_(%"class.Eigen::TensorAssignOp.75"* nonnull dereferenceable(16) %9, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %0)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %55) #4
  call void @llvm.lifetime.end(i64 56, i8* nonnull %53) #4
  %58 = bitcast %"class.Eigen::TensorCwiseBinaryOp.34"* %16 to i8*
  call void @llvm.lifetime.start(i64 56, i8* nonnull %58) #4
  %59 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 0
  store %"class.Eigen::TensorMap.1"* %12, %"class.Eigen::TensorMap.1"** %59, align 8, !tbaa !2, !alias.scope !15
  %60 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0
  store %"class.Eigen::TensorMap.1"* %12, %"class.Eigen::TensorMap.1"** %60, align 8
  %61 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 1, i32* %61, align 8
  %62 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 0, i32 1
  %63 = bitcast %"struct.Eigen::DSizes"* %62 to i64*
  store i64 %25, i64* %63, align 8, !alias.scope !15
  %64 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 1
  %65 = bitcast %"struct.Eigen::DSizes"* %64 to i64*
  store i64 %26, i64* %65, align 8, !alias.scope !15
  %66 = bitcast %"class.Eigen::TensorAssignOp.79"* %10 to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %66) #4
  %67 = bitcast %"class.Eigen::TensorAssignOp.79"* %10 to i64*
  store i64 %54, i64* %67, align 8, !tbaa !2
  %68 = getelementptr inbounds %"class.Eigen::TensorAssignOp.79", %"class.Eigen::TensorAssignOp.79"* %10, i64 0, i32 1
  store %"class.Eigen::TensorCwiseBinaryOp.34"* %16, %"class.Eigen::TensorCwiseBinaryOp.34"** %68, align 8, !tbaa !2
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS7_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISF_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSD_IiLi1EEESB_S6_EEEEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS13_RKS14_(%"class.Eigen::TensorAssignOp.79"* nonnull dereferenceable(16) %10, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %0)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %66) #4
  call void @llvm.lifetime.end(i64 56, i8* nonnull %58) #4
  br label %69

; <label>:69:                                     ; preds = %52, %35
  call void @llvm.lifetime.end(i64 48, i8* nonnull %27) #4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_(%"class.Eigen::TensorAssignOp"* dereferenceable(16), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 {
  %3 = alloca i32, align 4
  %4 = alloca %"class.Eigen::TensorEvalToOp", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator", align 16
  %6 = alloca %"struct.Eigen::TensorEvaluator", align 8
  %7 = bitcast %"struct.Eigen::TensorEvaluator"* %5 to i8*
  call void @llvm.lifetime.start(i64 224, i8* nonnull %7) #4
  %8 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %0, i64 0, i32 0
  %9 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %8, align 8, !tbaa !2
  %10 = bitcast %"class.Eigen::TensorMap.1"* %9 to <2 x i64>*
  %11 = load <2 x i64>, <2 x i64>* %10, align 8
  %12 = bitcast %"struct.Eigen::TensorEvaluator"* %5 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %12, align 16
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %13, align 16, !tbaa !2
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 0, i32 3
  store %"class.Eigen::TensorMap.1"* %9, %"class.Eigen::TensorMap.1"** %14, align 8, !tbaa !2
  %15 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %0, i64 0, i32 1
  %16 = load %"class.Eigen::TensorCwiseBinaryOp"*, %"class.Eigen::TensorCwiseBinaryOp"** %15, align 8, !tbaa !2
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1
  %18 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %16, i64 0, i32 0
  %19 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %18, align 8, !tbaa !2
  %20 = bitcast %"class.Eigen::TensorMap"* %19 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !20
  %22 = bitcast %"struct.Eigen::TensorEvaluator.53"* %17 to i64*
  store i64 %21, i64* %22, align 8, !tbaa !24
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 1
  %24 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %19, i64 0, i32 1
  %25 = bitcast %"struct.Eigen::DSizes"* %24 to i64*
  %26 = bitcast %"struct.Eigen::DSizes"* %23 to i64*
  %27 = load i64, i64* %25, align 4
  store i64 %27, i64* %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %28, align 8, !tbaa !2
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 3
  store %"class.Eigen::TensorMap"* %19, %"class.Eigen::TensorMap"** %29, align 8, !tbaa !2
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2
  %31 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %16, i64 0, i32 1
  %32 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %16, i64 0, i32 1, i32 1
  %33 = bitcast %"struct.Eigen::DSizes"* %32 to i64*
  %34 = bitcast %"struct.Eigen::TensorEvaluator.54"* %30 to i64*
  %35 = load i64, i64* %33, align 4
  store i64 %35, i64* %34, align 8
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 1
  %37 = bitcast %"struct.Eigen::DSizes"* %36 to i64*
  store i64 0, i64* %37, align 8
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 0, i32* %39, align 4, !tbaa !26
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6
  %41 = getelementptr inbounds %"class.Eigen::TensorBroadcastingOp", %"class.Eigen::TensorBroadcastingOp"* %31, i64 0, i32 0, i32 0, i32 0, i32 0
  %42 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %41, align 8, !tbaa !2
  %43 = bitcast %"class.Eigen::TensorMap"* %42 to i64*
  %44 = load i64, i64* %43, align 8, !tbaa !20
  %45 = bitcast %"struct.Eigen::TensorEvaluator.53"* %40 to i64*
  store i64 %44, i64* %45, align 8, !tbaa !24
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 1
  %47 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %42, i64 0, i32 1
  %48 = bitcast %"struct.Eigen::DSizes"* %47 to i64*
  %49 = bitcast %"struct.Eigen::DSizes"* %46 to i64*
  %50 = load i64, i64* %48, align 4
  store i64 %50, i64* %49, align 8
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %51, align 8, !tbaa !2
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 3
  store %"class.Eigen::TensorMap"* %42, %"class.Eigen::TensorMap"** %52, align 8, !tbaa !2
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 8
  store float* null, float** %53, align 8, !tbaa !28
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 9
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %54, align 8, !tbaa !2
  %55 = bitcast %"struct.Eigen::TensorEvaluator.55"* %38 to i16*
  store i16 0, i16* %55, align 8
  %56 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %16, i64 0, i32 1, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %57 = load i32, i32* %56, align 4, !tbaa !26
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 0, i32 0, i64 %58
  store i8 1, i8* %59, align 1, !tbaa !34
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.55", %"struct.Eigen::TensorEvaluator.55"* %38, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %61 = load i8, i8* %60, align 8, !tbaa !34, !range !36
  %62 = icmp eq i8 %61, 0
  %63 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %46, i64 0, i32 0, i32 0, i64 0
  %64 = load i32, i32* %63, align 8, !tbaa !26
  %65 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 5, i32 0, i64 0
  %66 = select i1 %62, i32* %39, i32* %65
  %67 = xor i8 %61, 1
  %68 = zext i8 %67 to i64
  %69 = xor i1 %62, true
  %70 = zext i1 %69 to i64
  store i32 %64, i32* %66, align 4, !tbaa !26
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 0, i32 0, i64 1
  %72 = load i8, i8* %71, align 1, !tbaa !34, !range !36
  %73 = icmp eq i8 %72, 0
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i64 1
  %75 = load i32, i32* %74, align 4, !tbaa !26
  %76 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 %68
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 5, i32 0, i64 %70
  %78 = select i1 %73, i32* %76, i32* %77
  store i32 %75, i32* %78, align 4, !tbaa !26
  %79 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 2, i32 0, i64 0
  store i32 1, i32* %79, align 8, !tbaa !26
  %80 = load i32, i32* %74, align 4, !tbaa !26
  %81 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 4, i32 0, i64 0
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 3, i32 0, i64 0
  %83 = select i1 %62, i32* %82, i32* %81
  store i32 %80, i32* %83, align 4, !tbaa !26
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 3, i32 0, i64 %68
  %85 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 4, i32 0, i64 %70
  %86 = select i1 %73, i32* %84, i32* %85
  store i32 1, i32* %86, align 4, !tbaa !26
  %87 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 1
  %88 = bitcast %"class.Eigen::TensorReductionOp"* %87 to i8*
  %89 = bitcast %"class.Eigen::TensorBroadcastingOp"* %31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %88, i8* nonnull %89, i64 16, i32 8, i1 false)
  %90 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %90, align 8, !tbaa !2
  %91 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 3
  store float* null, float** %91, align 8, !tbaa !37
  %92 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 4, i32 1
  %93 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %16, i64 0, i32 1, i32 0, i32 1
  %94 = bitcast %"struct.Eigen::DSizes"* %93 to i64*
  %95 = bitcast %"struct.Eigen::DSizes"* %92 to i64*
  %96 = load i64, i64* %94, align 4
  store i64 %96, i64* %95, align 8
  %97 = trunc i64 %96 to i32
  %98 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %16, i64 0, i32 1, i32 1, i32 0, i32 0, i64 0
  %99 = load i32, i32* %98, align 4, !tbaa !26
  %100 = mul nsw i32 %99, %97
  %101 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0, i64 0
  store i32 %100, i32* %101, align 8, !tbaa !26
  %102 = lshr i64 %96, 32
  %103 = trunc i64 %102 to i32
  %104 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp", %"class.Eigen::TensorCwiseBinaryOp"* %16, i64 0, i32 1, i32 1, i32 0, i32 0, i64 1
  %105 = load i32, i32* %104, align 4, !tbaa !26
  %106 = mul nsw i32 %105, %103
  %107 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0, i64 1
  store i32 %106, i32* %107, align 4, !tbaa !26
  %108 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 3, i32 0, i64 1
  store i32 1, i32* %108, align 4, !tbaa !26
  %109 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 2, i32 0, i64 1
  store i32 1, i32* %109, align 4, !tbaa !26
  %110 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  store i32 %103, i32* %110, align 8, !tbaa !26
  %111 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  store i32 %106, i32* %111, align 8, !tbaa !26
  %112 = load i32, i32* %39, align 4, !tbaa !26
  %113 = sext i32 %112 to i64
  %114 = shl nsw i64 %113, 2
  %115 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %116 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %117 = bitcast %"class.Eigen::StreamInterface"* %116 to i8* (%"class.Eigen::StreamInterface"*, i64)***
  %118 = load i8* (%"class.Eigen::StreamInterface"*, i64)**, i8* (%"class.Eigen::StreamInterface"*, i64)*** %117, align 8, !tbaa !42
  %119 = getelementptr inbounds i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %118, i64 4
  %120 = load i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %119, align 8
  %121 = tail call i8* %120(%"class.Eigen::StreamInterface"* %116, i64 %114)
  %122 = bitcast float** %91 to i8**
  store i8* %121, i8** %122, align 8, !tbaa !37
  %123 = bitcast %"class.Eigen::TensorEvalToOp"* %4 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %123) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %123, i8* nonnull %88, i64 16, i32 8, i1 false) #4
  %124 = getelementptr inbounds %"class.Eigen::TensorEvalToOp", %"class.Eigen::TensorEvalToOp"* %4, i64 0, i32 1
  %125 = bitcast float** %124 to i8**
  store i8* %121, i8** %125, align 8, !tbaa !44
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EESD_EENS_9GpuDeviceELb0EE3runERSJ_RKSK_(%"class.Eigen::TensorEvalToOp"* nonnull dereferenceable(24) %4, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %1)
  call void @llvm.lifetime.end(i64 24, i8* nonnull %123) #4
  %126 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %127 = bitcast %"class.Eigen::StreamInterface"* %126 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %128 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %127, align 8, !tbaa !42
  %129 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %128, i64 3
  %130 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %129, align 8
  %131 = call dereferenceable(352) %struct.cudaDeviceProp* %130(%"class.Eigen::StreamInterface"* %126)
  %132 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %131, i64 0, i32 5
  %133 = load i32, i32* %132, align 8, !tbaa !46
  %134 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %135 = bitcast %"class.Eigen::StreamInterface"* %134 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %136 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %135, align 8, !tbaa !42
  %137 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %136, i64 3
  %138 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %137, align 8
  %139 = call dereferenceable(352) %struct.cudaDeviceProp* %138(%"class.Eigen::StreamInterface"* %134)
  %140 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %139, i64 0, i32 10
  %141 = load i32, i32* %140, align 4, !tbaa !49
  %142 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %143 = bitcast %"class.Eigen::StreamInterface"* %142 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %144 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %143, align 8, !tbaa !42
  %145 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %144, i64 3
  %146 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %145, align 8
  %147 = call dereferenceable(352) %struct.cudaDeviceProp* %146(%"class.Eigen::StreamInterface"* %142)
  %148 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %147, i64 0, i32 8
  %149 = load i32, i32* %148, align 4, !tbaa !50
  %150 = mul nsw i32 %149, %141
  %151 = sdiv i32 %150, %133
  %152 = load i64, i64* %26, align 8
  %153 = trunc i64 %152 to i32
  %154 = lshr i64 %152, 32
  %155 = trunc i64 %154 to i32
  %156 = mul nsw i32 %155, %153
  %157 = add i32 %133, -1
  %158 = add i32 %157, %156
  %159 = sdiv i32 %158, %133
  %160 = icmp slt i32 %159, %151
  %161 = select i1 %160, i32 %159, i32 %151
  %162 = icmp sgt i32 %161, 1
  %163 = select i1 %162, i32 %161, i32 1
  %164 = zext i32 %163 to i64
  %165 = or i64 %164, 4294967296
  %166 = zext i32 %133 to i64
  %167 = or i64 %166, 4294967296
  %168 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %169 = bitcast %"class.Eigen::StreamInterface"* %168 to i8** (%"class.Eigen::StreamInterface"*)***
  %170 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %169, align 8, !tbaa !42
  %171 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %170, i64 2
  %172 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %171, align 8
  %173 = call dereferenceable(8) i8** %172(%"class.Eigen::StreamInterface"* %168)
  %174 = load i8*, i8** %173, align 8, !tbaa !51
  %175 = call i32 @cudaConfigureCall(i64 %165, i32 1, i64 %167, i32 1, i64 0, i8* %174)
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %177, label %191

; <label>:177:                                    ; preds = %2
  %178 = bitcast %"struct.Eigen::TensorEvaluator"* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %178, i8* nonnull %7, i64 32, i32 8, i1 false)
  %179 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %6, i64 0, i32 1, i32 1
  %180 = bitcast %"struct.Eigen::TensorEvaluator.53"* %179 to i8*
  %181 = bitcast %"struct.Eigen::TensorEvaluator.53"* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %180, i8* %181, i64 184, i32 8, i1 false)
  %182 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %182)
  store i32 %156, i32* %3, align 4, !tbaa !26
  %183 = call i32 @cudaSetupArgument(i8* nonnull %178, i64 224, i64 0)
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %190

; <label>:185:                                    ; preds = %177
  %186 = call i32 @cudaSetupArgument(i8* nonnull %182, i64 4, i64 224)
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %188, label %190

; <label>:188:                                    ; preds = %185
  %189 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSB_EEKNS4_INS5_ISB_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISJ_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSH_IiLi1EEESF_S7_EEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %190

; <label>:190:                                    ; preds = %177, %185, %188
  call void @llvm.lifetime.end(i64 4, i8* nonnull %182)
  br label %191

; <label>:191:                                    ; preds = %2, %190
  %192 = call i64 @cudaGetLastError()
  %193 = icmp eq i64 %192, 0
  br i1 %193, label %195, label %194, !prof !52

; <label>:194:                                    ; preds = %191
  call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #5
  unreachable

; <label>:195:                                    ; preds = %191
  %196 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %90, align 8, !tbaa !2
  %197 = load i8*, i8** %122, align 8, !tbaa !37
  %198 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %196, i64 0, i32 0
  %199 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %198, align 8, !tbaa !40
  %200 = bitcast %"class.Eigen::StreamInterface"* %199 to void (%"class.Eigen::StreamInterface"*, i8*)***
  %201 = load void (%"class.Eigen::StreamInterface"*, i8*)**, void (%"class.Eigen::StreamInterface"*, i8*)*** %200, align 8, !tbaa !42
  %202 = getelementptr inbounds void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %201, i64 5
  %203 = load void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %202, align 8
  call void %203(%"class.Eigen::StreamInterface"* %199, i8* %197)
  call void @llvm.lifetime.end(i64 224, i8* nonnull %7) #4
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, i8*) local_unnamed_addr #2

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSB_EEKNS4_INS5_ISB_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISJ_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSH_IiLi1EEESF_S7_EEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator"*, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = bitcast %"struct.Eigen::TensorEvaluator"* %0 to i8*
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 224, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 224)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSB_EEKNS4_INS5_ISB_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISJ_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSH_IiLi1EEESF_S7_EEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
  ret void
}

declare i64 @cudaGetLastError() local_unnamed_addr #2

; Function Attrs: noreturn
declare void @__assert_rtn(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EESD_EENS_9GpuDeviceELb0EE3runERSJ_RKSK_(%"class.Eigen::TensorEvalToOp"* dereferenceable(24), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca i32, align 4
  %4 = alloca %"struct.Eigen::TensorEvaluator.60", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator.60", align 8
  %6 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 0, i32 0, i64 0
  call void @llvm.lifetime.start(i64 120, i8* nonnull %6) #4
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 0, i32* %7, align 4, !tbaa !26
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 6
  %9 = getelementptr inbounds %"class.Eigen::TensorEvalToOp", %"class.Eigen::TensorEvalToOp"* %0, i64 0, i32 0, i32 0
  %10 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %9, align 8, !tbaa !2
  %11 = bitcast %"class.Eigen::TensorMap"* %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !20
  %13 = bitcast %"struct.Eigen::TensorEvaluator.53"* %8 to i64*
  store i64 %12, i64* %13, align 8, !tbaa !24
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 6, i32 1
  %15 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %10, i64 0, i32 1
  %16 = bitcast %"struct.Eigen::DSizes"* %15 to i64*
  %17 = bitcast %"struct.Eigen::DSizes"* %14 to i64*
  %18 = load i64, i64* %16, align 4
  store i64 %18, i64* %17, align 8
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 6, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %19, align 8, !tbaa !2
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 6, i32 3
  store %"class.Eigen::TensorMap"* %10, %"class.Eigen::TensorMap"** %20, align 8, !tbaa !2
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 8
  store float* null, float** %21, align 8, !tbaa !28
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 9
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %22, align 8, !tbaa !2
  %23 = bitcast %"struct.Eigen::TensorEvaluator.60"* %4 to i16*
  store i16 0, i16* %23, align 8
  %24 = getelementptr inbounds %"class.Eigen::TensorEvalToOp", %"class.Eigen::TensorEvalToOp"* %0, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %25 = load i32, i32* %24, align 4, !tbaa !26
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 0, i32 0, i64 %26
  store i8 1, i8* %27, align 1, !tbaa !34
  %28 = load i8, i8* %6, align 8, !tbaa !34, !range !36
  %29 = icmp eq i8 %28, 0
  %30 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %14, i64 0, i32 0, i32 0, i64 0
  %31 = load i32, i32* %30, align 8, !tbaa !26
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 5, i32 0, i64 0
  %33 = select i1 %29, i32* %7, i32* %32
  %34 = xor i8 %28, 1
  %35 = zext i8 %34 to i64
  %36 = xor i1 %29, true
  %37 = zext i1 %36 to i64
  store i32 %31, i32* %33, align 4, !tbaa !26
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 0, i32 0, i64 1
  %39 = load i8, i8* %38, align 1, !tbaa !34, !range !36
  %40 = icmp eq i8 %39, 0
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 6, i32 1, i32 0, i32 0, i64 1
  %42 = load i32, i32* %41, align 4, !tbaa !26
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 1, i32 0, i32 0, i64 %35
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 5, i32 0, i64 %37
  %45 = select i1 %40, i32* %43, i32* %44
  store i32 %42, i32* %45, align 4, !tbaa !26
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 2, i32 0, i64 0
  store i32 1, i32* %46, align 8, !tbaa !26
  %47 = load i32, i32* %41, align 4, !tbaa !26
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 4, i32 0, i64 0
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 3, i32 0, i64 0
  %50 = select i1 %29, i32* %49, i32* %48
  store i32 %47, i32* %50, align 4, !tbaa !26
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 3, i32 0, i64 %35
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 0, i32 4, i32 0, i64 %37
  %53 = select i1 %40, i32* %51, i32* %52
  store i32 1, i32* %53, align 4, !tbaa !26
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 1
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %54, align 8, !tbaa !2
  %55 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 2
  %56 = getelementptr inbounds %"class.Eigen::TensorEvalToOp", %"class.Eigen::TensorEvalToOp"* %0, i64 0, i32 1
  %57 = bitcast float** %56 to i64*
  %58 = load i64, i64* %57, align 8, !tbaa !44
  %59 = bitcast float** %55 to i64*
  store i64 %58, i64* %59, align 8, !tbaa !53
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 3
  store %"class.Eigen::TensorEvalToOp"* %0, %"class.Eigen::TensorEvalToOp"** %60, align 8, !tbaa !2
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %4, i64 0, i32 4
  %62 = bitcast %"class.Eigen::TensorReductionOp"* %61 to i8*
  %63 = bitcast %"class.Eigen::TensorEvalToOp"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %62, i8* nonnull %63, i64 16, i32 8, i1 false)
  %64 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %22, align 8, !tbaa !2
  %65 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %64, i64 0, i32 0
  %66 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %65, align 8, !tbaa !40
  %67 = bitcast %"class.Eigen::StreamInterface"* %66 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %68 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %67, align 8, !tbaa !42
  %69 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %68, i64 3
  %70 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %69, align 8
  %71 = invoke dereferenceable(352) %struct.cudaDeviceProp* %70(%"class.Eigen::StreamInterface"* %66)
          to label %72 unwind label %138

; <label>:72:                                     ; preds = %2
  %73 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %74 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %73, align 8, !tbaa !40
  %75 = bitcast %"class.Eigen::StreamInterface"* %74 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %76 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %75, align 8, !tbaa !42
  %77 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %76, i64 3
  %78 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %77, align 8
  %79 = invoke dereferenceable(352) %struct.cudaDeviceProp* %78(%"class.Eigen::StreamInterface"* %74)
          to label %80 unwind label %140

; <label>:80:                                     ; preds = %72
  %81 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %79, i64 0, i32 5
  %82 = load i32, i32* %81, align 8, !tbaa !46
  %83 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %73, align 8, !tbaa !40
  %84 = bitcast %"class.Eigen::StreamInterface"* %83 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %85 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %84, align 8, !tbaa !42
  %86 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %85, i64 3
  %87 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %86, align 8
  %88 = invoke dereferenceable(352) %struct.cudaDeviceProp* %87(%"class.Eigen::StreamInterface"* %83)
          to label %89 unwind label %142

; <label>:89:                                     ; preds = %80
  %90 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %88, i64 0, i32 10
  %91 = load i32, i32* %90, align 4, !tbaa !49
  %92 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %73, align 8, !tbaa !40
  %93 = bitcast %"class.Eigen::StreamInterface"* %92 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %94 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %93, align 8, !tbaa !42
  %95 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %94, i64 3
  %96 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %95, align 8
  %97 = invoke dereferenceable(352) %struct.cudaDeviceProp* %96(%"class.Eigen::StreamInterface"* %92)
          to label %98 unwind label %142

; <label>:98:                                     ; preds = %89
  %99 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %97, i64 0, i32 8
  %100 = load i32, i32* %99, align 4, !tbaa !50
  %101 = mul nsw i32 %100, %91
  %102 = sdiv i32 %101, %82
  %103 = load i32, i32* %7, align 4, !tbaa !26
  %104 = add i32 %82, -1
  %105 = add i32 %104, %103
  %106 = sdiv i32 %105, %82
  %107 = icmp slt i32 %106, %102
  %108 = select i1 %107, i32 %106, i32 %102
  %109 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %73, align 8, !tbaa !40
  %110 = bitcast %"class.Eigen::StreamInterface"* %109 to i8** (%"class.Eigen::StreamInterface"*)***
  %111 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %110, align 8, !tbaa !42
  %112 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %111, i64 2
  %113 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %112, align 8
  %114 = invoke dereferenceable(8) i8** %113(%"class.Eigen::StreamInterface"* %109)
          to label %115 unwind label %144

; <label>:115:                                    ; preds = %98
  %116 = zext i32 %82 to i64
  %117 = or i64 %116, 4294967296
  %118 = icmp sgt i32 %108, 1
  %119 = select i1 %118, i32 %108, i32 1
  %120 = zext i32 %119 to i64
  %121 = or i64 %120, 4294967296
  %122 = load i8*, i8** %114, align 8, !tbaa !51
  %123 = invoke i32 @cudaConfigureCall(i64 %121, i32 1, i64 %117, i32 1, i64 0, i8* %122)
          to label %124 unwind label %144

; <label>:124:                                    ; preds = %115
  %125 = icmp eq i32 %123, 0
  br i1 %125, label %126, label %149

; <label>:126:                                    ; preds = %124
  %127 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %5, i64 0, i32 0, i32 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %127, i8* nonnull %6, i64 120, i32 8, i1 false)
  %128 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %128)
  store i32 %103, i32* %3, align 4, !tbaa !26
  %129 = invoke i32 @cudaSetupArgument(i8* nonnull %127, i64 120, i64 0)
          to label %130 unwind label %146

; <label>:130:                                    ; preds = %126
  %131 = icmp eq i32 %129, 0
  br i1 %131, label %132, label %148

; <label>:132:                                    ; preds = %130
  %133 = invoke i32 @cudaSetupArgument(i8* nonnull %128, i64 4, i64 120)
          to label %134 unwind label %146

; <label>:134:                                    ; preds = %132
  %135 = icmp eq i32 %133, 0
  br i1 %135, label %136, label %148

; <label>:136:                                    ; preds = %134
  %137 = invoke i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.60"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EESE_EENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
          to label %148 unwind label %146

; <label>:138:                                    ; preds = %2
  %139 = landingpad { i8*, i32 }
          cleanup
  br label %169

; <label>:140:                                    ; preds = %72, %158
  %141 = landingpad { i8*, i32 }
          cleanup
  br label %169

; <label>:142:                                    ; preds = %89, %80
  %143 = landingpad { i8*, i32 }
          cleanup
  br label %169

; <label>:144:                                    ; preds = %98, %153, %149, %115
  %145 = landingpad { i8*, i32 }
          cleanup
  br label %169

; <label>:146:                                    ; preds = %136, %132, %126
  %147 = landingpad { i8*, i32 }
          cleanup
  br label %169

; <label>:148:                                    ; preds = %134, %130, %136
  call void @llvm.lifetime.end(i64 4, i8* nonnull %128)
  br label %149

; <label>:149:                                    ; preds = %124, %148
  %150 = invoke i64 @cudaGetLastError()
          to label %151 unwind label %144

; <label>:151:                                    ; preds = %149
  %152 = icmp eq i64 %150, 0
  br i1 %152, label %155, label %153, !prof !52

; <label>:153:                                    ; preds = %151
  invoke void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #5
          to label %154 unwind label %144

; <label>:154:                                    ; preds = %153
  unreachable

; <label>:155:                                    ; preds = %151
  %156 = load float*, float** %21, align 8, !tbaa !28
  %157 = icmp eq float* %156, null
  br i1 %157, label %168, label %158

; <label>:158:                                    ; preds = %155
  %159 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %22, align 8, !tbaa !2
  %160 = bitcast float* %156 to i8*
  %161 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %159, i64 0, i32 0
  %162 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %161, align 8, !tbaa !40
  %163 = bitcast %"class.Eigen::StreamInterface"* %162 to void (%"class.Eigen::StreamInterface"*, i8*)***
  %164 = load void (%"class.Eigen::StreamInterface"*, i8*)**, void (%"class.Eigen::StreamInterface"*, i8*)*** %163, align 8, !tbaa !42
  %165 = getelementptr inbounds void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %164, i64 5
  %166 = load void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %165, align 8
  invoke void %166(%"class.Eigen::StreamInterface"* %162, i8* %160)
          to label %167 unwind label %140

; <label>:167:                                    ; preds = %158
  store float* null, float** %21, align 8, !tbaa !28
  br label %168

; <label>:168:                                    ; preds = %167, %155
  call void @llvm.lifetime.end(i64 120, i8* nonnull %6) #4
  ret void

; <label>:169:                                    ; preds = %144, %146, %140, %142, %138
  %170 = phi { i8*, i32 } [ %145, %144 ], [ %147, %146 ], [ %141, %140 ], [ %143, %142 ], [ %139, %138 ]
  call void @llvm.lifetime.end(i64 120, i8* nonnull %6) #4
  resume { i8*, i32 } %170
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EESE_EENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.60"*, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %0, i64 0, i32 0, i32 0, i32 0, i64 0
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 120, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 120)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.60"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EESE_EENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
  ret void
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS7_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISF_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSD_IiLi1EEEKNSG_INS0_13scalar_exp_opIfEESB_EES6_EEEEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS17_RKS18_(%"class.Eigen::TensorAssignOp.61"* dereferenceable(16), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 {
  %3 = alloca i32, align 4
  %4 = alloca %"class.Eigen::TensorEvalToOp.72", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator.63", align 16
  %6 = alloca %"struct.Eigen::TensorEvaluator.63", align 8
  %7 = bitcast %"struct.Eigen::TensorEvaluator.63"* %5 to i8*
  call void @llvm.lifetime.start(i64 248, i8* nonnull %7) #4
  %8 = getelementptr inbounds %"class.Eigen::TensorAssignOp.61", %"class.Eigen::TensorAssignOp.61"* %0, i64 0, i32 0
  %9 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %8, align 8, !tbaa !2
  %10 = bitcast %"class.Eigen::TensorMap.1"* %9 to <2 x i64>*
  %11 = load <2 x i64>, <2 x i64>* %10, align 8
  %12 = bitcast %"struct.Eigen::TensorEvaluator.63"* %5 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %12, align 16
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %13, align 16, !tbaa !2
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 0, i32 3
  store %"class.Eigen::TensorMap.1"* %9, %"class.Eigen::TensorMap.1"** %14, align 8, !tbaa !2
  %15 = getelementptr inbounds %"class.Eigen::TensorAssignOp.61", %"class.Eigen::TensorAssignOp.61"* %0, i64 0, i32 1
  %16 = load %"class.Eigen::TensorCwiseBinaryOp.12"*, %"class.Eigen::TensorCwiseBinaryOp.12"** %15, align 8, !tbaa !2
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 1
  %18 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 0
  %19 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %18, align 8, !tbaa !2
  %20 = bitcast %"class.Eigen::TensorMap.1"* %19 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !55
  %22 = bitcast %"struct.Eigen::TensorEvaluator.65"* %17 to i64*
  store i64 %21, i64* %22, align 8, !tbaa !57
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 1, i32 1
  %24 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %19, i64 0, i32 1
  %25 = bitcast %"struct.Eigen::DSizes"* %24 to i64*
  %26 = bitcast %"struct.Eigen::DSizes"* %23 to i64*
  %27 = load i64, i64* %25, align 4
  store i64 %27, i64* %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %28, align 8, !tbaa !2
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 1, i32 3
  store %"class.Eigen::TensorMap.1"* %19, %"class.Eigen::TensorMap.1"** %29, align 8, !tbaa !2
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2
  %31 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 1
  %32 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 1, i32 1
  %33 = bitcast %"struct.Eigen::DSizes"* %32 to i64*
  %34 = bitcast %"struct.Eigen::TensorEvaluator.66"* %30 to i64*
  %35 = load i64, i64* %33, align 4
  store i64 %35, i64* %34, align 8
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 1
  %37 = bitcast %"struct.Eigen::DSizes"* %36 to i64*
  store i64 0, i64* %37, align 8
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 0, i32* %39, align 4, !tbaa !26
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 6, i32 1
  %41 = getelementptr inbounds %"class.Eigen::TensorBroadcastingOp.14", %"class.Eigen::TensorBroadcastingOp.14"* %31, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %42 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %41, align 8, !tbaa !2
  %43 = bitcast %"class.Eigen::TensorMap.1"* %42 to i64*
  %44 = load i64, i64* %43, align 8, !tbaa !55
  %45 = bitcast %"struct.Eigen::TensorEvaluator.65"* %40 to i64*
  store i64 %44, i64* %45, align 8, !tbaa !57
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 6, i32 1, i32 1
  %47 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %42, i64 0, i32 1
  %48 = bitcast %"struct.Eigen::DSizes"* %47 to i64*
  %49 = bitcast %"struct.Eigen::DSizes"* %46 to i64*
  %50 = load i64, i64* %48, align 4
  store i64 %50, i64* %49, align 8
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 6, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %51, align 8, !tbaa !2
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 6, i32 1, i32 3
  store %"class.Eigen::TensorMap.1"* %42, %"class.Eigen::TensorMap.1"** %52, align 8, !tbaa !2
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 8
  store float* null, float** %53, align 8, !tbaa !59
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 9
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %54, align 8, !tbaa !2
  %55 = bitcast %"struct.Eigen::TensorEvaluator.68"* %38 to i16*
  store i16 0, i16* %55, align 8
  %56 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %57 = load i32, i32* %56, align 4, !tbaa !26
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 0, i32 0, i64 %58
  store i8 1, i8* %59, align 1, !tbaa !34
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.68", %"struct.Eigen::TensorEvaluator.68"* %38, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %61 = load i8, i8* %60, align 8, !tbaa !34, !range !36
  %62 = icmp eq i8 %61, 0
  %63 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %46, i64 0, i32 0, i32 0, i64 0
  %64 = load i32, i32* %63, align 8, !tbaa !26
  %65 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 5, i32 0, i64 0
  %66 = select i1 %62, i32* %39, i32* %65
  %67 = xor i8 %61, 1
  %68 = zext i8 %67 to i64
  %69 = xor i1 %62, true
  %70 = zext i1 %69 to i64
  store i32 %64, i32* %66, align 4, !tbaa !26
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 0, i32 0, i64 1
  %72 = load i8, i8* %71, align 1, !tbaa !34, !range !36
  %73 = icmp eq i8 %72, 0
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 6, i32 1, i32 1, i32 0, i32 0, i64 1
  %75 = load i32, i32* %74, align 4, !tbaa !26
  %76 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0, i64 %68
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 5, i32 0, i64 %70
  %78 = select i1 %73, i32* %76, i32* %77
  store i32 %75, i32* %78, align 4, !tbaa !26
  %79 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 2, i32 0, i64 0
  store i32 1, i32* %79, align 8, !tbaa !26
  %80 = load i32, i32* %74, align 4, !tbaa !26
  %81 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 4, i32 0, i64 0
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 3, i32 0, i64 0
  %83 = select i1 %62, i32* %82, i32* %81
  store i32 %80, i32* %83, align 4, !tbaa !26
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 3, i32 0, i64 %68
  %85 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 4, i32 0, i64 %70
  %86 = select i1 %73, i32* %84, i32* %85
  store i32 1, i32* %86, align 4, !tbaa !26
  %87 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 1
  %88 = bitcast %"class.Eigen::TensorBroadcastingOp.14"* %31 to i64*
  %89 = load i64, i64* %88, align 8, !tbaa !2
  %90 = bitcast %"class.Eigen::TensorReductionOp.22"* %87 to i64*
  store i64 %89, i64* %90, align 8, !tbaa !2
  %91 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 1, i32 1
  %92 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1
  %93 = bitcast %"struct.Eigen::DSizes.4"* %91 to i8*
  %94 = bitcast %"struct.Eigen::DSizes.4"* %92 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %93, i8* %94, i64 5, i32 8, i1 false)
  %95 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %95, align 8, !tbaa !2
  %96 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 3
  store float* null, float** %96, align 8, !tbaa !64
  %97 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 1
  %98 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 1, i32 0, i32 0, i32 1
  %99 = bitcast %"struct.Eigen::DSizes"* %98 to i64*
  %100 = bitcast %"struct.Eigen::DSizes"* %97 to i64*
  %101 = load i64, i64* %99, align 4
  store i64 %101, i64* %100, align 8
  %102 = trunc i64 %101 to i32
  %103 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 1, i32 1, i32 0, i32 0, i64 0
  %104 = load i32, i32* %103, align 4, !tbaa !26
  %105 = mul nsw i32 %104, %102
  %106 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0, i64 0
  store i32 %105, i32* %106, align 8, !tbaa !26
  %107 = lshr i64 %101, 32
  %108 = trunc i64 %107 to i32
  %109 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.12", %"class.Eigen::TensorCwiseBinaryOp.12"* %16, i64 0, i32 1, i32 1, i32 0, i32 0, i64 1
  %110 = load i32, i32* %109, align 4, !tbaa !26
  %111 = mul nsw i32 %110, %108
  %112 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0, i64 1
  store i32 %111, i32* %112, align 4, !tbaa !26
  %113 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 3, i32 0, i64 1
  store i32 1, i32* %113, align 4, !tbaa !26
  %114 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 2, i32 0, i64 1
  store i32 1, i32* %114, align 4, !tbaa !26
  %115 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  store i32 %108, i32* %115, align 8, !tbaa !26
  %116 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  store i32 %111, i32* %116, align 8, !tbaa !26
  %117 = load i32, i32* %39, align 4, !tbaa !26
  %118 = sext i32 %117 to i64
  %119 = shl nsw i64 %118, 2
  %120 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %121 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %120, align 8, !tbaa !40
  %122 = bitcast %"class.Eigen::StreamInterface"* %121 to i8* (%"class.Eigen::StreamInterface"*, i64)***
  %123 = load i8* (%"class.Eigen::StreamInterface"*, i64)**, i8* (%"class.Eigen::StreamInterface"*, i64)*** %122, align 8, !tbaa !42
  %124 = getelementptr inbounds i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %123, i64 4
  %125 = load i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %124, align 8
  %126 = tail call i8* %125(%"class.Eigen::StreamInterface"* %121, i64 %119)
  %127 = bitcast float** %96 to i8**
  store i8* %126, i8** %127, align 8, !tbaa !64
  %128 = bitcast %"class.Eigen::TensorEvalToOp.72"* %4 to i8*
  call void @llvm.lifetime.start(i64 32, i8* nonnull %128) #4
  %129 = bitcast %"class.Eigen::TensorEvalToOp.72"* %4 to i64*
  store i64 %89, i64* %129, align 8, !tbaa !2
  %130 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.72", %"class.Eigen::TensorEvalToOp.72"* %4, i64 0, i32 0, i32 1
  %131 = bitcast %"struct.Eigen::DSizes.4"* %130 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %131, i8* %93, i64 5, i32 8, i1 false)
  %132 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.72", %"class.Eigen::TensorEvalToOp.72"* %4, i64 0, i32 1
  %133 = bitcast float** %132 to i8**
  store i8* %126, i8** %133, align 8, !tbaa !68
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EESF_EENS_9GpuDeviceELb0EE3runERSN_RKSO_(%"class.Eigen::TensorEvalToOp.72"* nonnull dereferenceable(32) %4, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %1)
  call void @llvm.lifetime.end(i64 32, i8* nonnull %128) #4
  %134 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %120, align 8, !tbaa !40
  %135 = bitcast %"class.Eigen::StreamInterface"* %134 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %136 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %135, align 8, !tbaa !42
  %137 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %136, i64 3
  %138 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %137, align 8
  %139 = call dereferenceable(352) %struct.cudaDeviceProp* %138(%"class.Eigen::StreamInterface"* %134)
  %140 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %139, i64 0, i32 5
  %141 = load i32, i32* %140, align 8, !tbaa !46
  %142 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %120, align 8, !tbaa !40
  %143 = bitcast %"class.Eigen::StreamInterface"* %142 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %144 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %143, align 8, !tbaa !42
  %145 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %144, i64 3
  %146 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %145, align 8
  %147 = call dereferenceable(352) %struct.cudaDeviceProp* %146(%"class.Eigen::StreamInterface"* %142)
  %148 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %147, i64 0, i32 10
  %149 = load i32, i32* %148, align 4, !tbaa !49
  %150 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %120, align 8, !tbaa !40
  %151 = bitcast %"class.Eigen::StreamInterface"* %150 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %152 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %151, align 8, !tbaa !42
  %153 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %152, i64 3
  %154 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %153, align 8
  %155 = call dereferenceable(352) %struct.cudaDeviceProp* %154(%"class.Eigen::StreamInterface"* %150)
  %156 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %155, i64 0, i32 8
  %157 = load i32, i32* %156, align 4, !tbaa !50
  %158 = mul nsw i32 %157, %149
  %159 = sdiv i32 %158, %141
  %160 = load i64, i64* %26, align 8
  %161 = trunc i64 %160 to i32
  %162 = lshr i64 %160, 32
  %163 = trunc i64 %162 to i32
  %164 = mul nsw i32 %163, %161
  %165 = add i32 %141, -1
  %166 = add i32 %165, %164
  %167 = sdiv i32 %166, %141
  %168 = icmp slt i32 %167, %159
  %169 = select i1 %168, i32 %167, i32 %159
  %170 = icmp sgt i32 %169, 1
  %171 = select i1 %170, i32 %169, i32 1
  %172 = zext i32 %171 to i64
  %173 = or i64 %172, 4294967296
  %174 = zext i32 %141 to i64
  %175 = or i64 %174, 4294967296
  %176 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %120, align 8, !tbaa !40
  %177 = bitcast %"class.Eigen::StreamInterface"* %176 to i8** (%"class.Eigen::StreamInterface"*)***
  %178 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %177, align 8, !tbaa !42
  %179 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %178, i64 2
  %180 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %179, align 8
  %181 = call dereferenceable(8) i8** %180(%"class.Eigen::StreamInterface"* %176)
  %182 = load i8*, i8** %181, align 8, !tbaa !51
  %183 = call i32 @cudaConfigureCall(i64 %173, i32 1, i64 %175, i32 1, i64 0, i8* %182)
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %220

; <label>:185:                                    ; preds = %2
  %186 = bitcast %"struct.Eigen::TensorEvaluator.63"* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %186, i8* nonnull %7, i64 32, i32 8, i1 false)
  %187 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 1
  %188 = bitcast %"struct.Eigen::TensorEvaluator.65"* %187 to i8*
  %189 = bitcast %"struct.Eigen::TensorEvaluator.65"* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %188, i8* %189, i64 32, i32 8, i1 false)
  %190 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2
  %191 = bitcast %"struct.Eigen::TensorEvaluator.66"* %190 to i8*
  %192 = bitcast %"struct.Eigen::TensorEvaluator.66"* %30 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %191, i8* nonnull %192, i64 32, i32 8, i1 false)
  %193 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 0, i32 0, i64 0
  %194 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %193, i8* nonnull %194, i64 24, i32 8, i1 false)
  %195 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 6, i32 1
  %196 = bitcast %"struct.Eigen::TensorEvaluator.65"* %195 to i8*
  %197 = bitcast %"struct.Eigen::TensorEvaluator.65"* %40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %196, i8* %197, i64 32, i32 8, i1 false)
  %198 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 7, i32 0
  %199 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %5, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 0, i32 7, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %198, i8* %199, i64 24, i32 8, i1 false)
  %200 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 1
  %201 = load i64, i64* %90, align 8, !tbaa !2
  %202 = bitcast %"class.Eigen::TensorReductionOp.22"* %200 to i64*
  store i64 %201, i64* %202, align 8, !tbaa !2
  %203 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 1, i32 1
  %204 = bitcast %"struct.Eigen::DSizes.4"* %203 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %204, i8* %93, i64 5, i32 8, i1 false)
  %205 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2, i32 4, i32 1, i32 0, i32 2
  %206 = bitcast %"struct.Eigen::GpuDevice"** %205 to i8*
  %207 = bitcast %"struct.Eigen::GpuDevice"** %95 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %206, i8* %207, i64 16, i32 8, i1 false)
  %208 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.63", %"struct.Eigen::TensorEvaluator.63"* %6, i64 0, i32 1, i32 2, i32 4, i32 1, i32 1
  %209 = bitcast %"struct.Eigen::DSizes"* %208 to i64*
  %210 = load i64, i64* %100, align 8
  store i64 %210, i64* %209, align 8
  %211 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %211)
  store i32 %164, i32* %3, align 4, !tbaa !26
  %212 = call i32 @cudaSetupArgument(i8* nonnull %186, i64 248, i64 0)
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %214, label %219

; <label>:214:                                    ; preds = %185
  %215 = call i32 @cudaSetupArgument(i8* nonnull %211, i64 4, i64 248)
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %217, label %219

; <label>:217:                                    ; preds = %214
  %218 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.63"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEEKNSH_INS0_13scalar_exp_opIfEESC_EES7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %219

; <label>:219:                                    ; preds = %185, %214, %217
  call void @llvm.lifetime.end(i64 4, i8* nonnull %211)
  br label %220

; <label>:220:                                    ; preds = %2, %219
  %221 = call i64 @cudaGetLastError()
  %222 = icmp eq i64 %221, 0
  br i1 %222, label %224, label %223, !prof !52

; <label>:223:                                    ; preds = %220
  call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #5
  unreachable

; <label>:224:                                    ; preds = %220
  %225 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %95, align 8, !tbaa !2
  %226 = load i8*, i8** %127, align 8, !tbaa !64
  %227 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %225, i64 0, i32 0
  %228 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %227, align 8, !tbaa !40
  %229 = bitcast %"class.Eigen::StreamInterface"* %228 to void (%"class.Eigen::StreamInterface"*, i8*)***
  %230 = load void (%"class.Eigen::StreamInterface"*, i8*)**, void (%"class.Eigen::StreamInterface"*, i8*)*** %229, align 8, !tbaa !42
  %231 = getelementptr inbounds void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %230, i64 5
  %232 = load void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %231, align 8
  call void %232(%"class.Eigen::StreamInterface"* %228, i8* %226)
  call void @llvm.lifetime.end(i64 248, i8* nonnull %7) #4
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEEKNSH_INS0_13scalar_exp_opIfEESC_EES7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.63"*, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = bitcast %"struct.Eigen::TensorEvaluator.63"* %0 to i8*
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 248, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 248)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.63"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_log_opIfEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEEKNSH_INS0_13scalar_exp_opIfEESC_EES7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EESF_EENS_9GpuDeviceELb0EE3runERSN_RKSO_(%"class.Eigen::TensorEvalToOp.72"* dereferenceable(32), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca i32, align 4
  %4 = alloca %"struct.Eigen::TensorEvaluator.74", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator.74", align 8
  %6 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 0, i32 0, i64 0
  call void @llvm.lifetime.start(i64 136, i8* nonnull %6) #4
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 0, i32* %7, align 4, !tbaa !26
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 6, i32 1
  %9 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.72", %"class.Eigen::TensorEvalToOp.72"* %0, i64 0, i32 0, i32 0, i32 0
  %10 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %9, align 8, !tbaa !2
  %11 = bitcast %"class.Eigen::TensorMap.1"* %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !55
  %13 = bitcast %"struct.Eigen::TensorEvaluator.65"* %8 to i64*
  store i64 %12, i64* %13, align 8, !tbaa !57
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 6, i32 1, i32 1
  %15 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %10, i64 0, i32 1
  %16 = bitcast %"struct.Eigen::DSizes"* %15 to i64*
  %17 = bitcast %"struct.Eigen::DSizes"* %14 to i64*
  %18 = load i64, i64* %16, align 4
  store i64 %18, i64* %17, align 8
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 6, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %19, align 8, !tbaa !2
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 6, i32 1, i32 3
  store %"class.Eigen::TensorMap.1"* %10, %"class.Eigen::TensorMap.1"** %20, align 8, !tbaa !2
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 8
  store float* null, float** %21, align 8, !tbaa !59
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 9
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %22, align 8, !tbaa !2
  %23 = bitcast %"struct.Eigen::TensorEvaluator.74"* %4 to i16*
  store i16 0, i16* %23, align 8
  %24 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.72", %"class.Eigen::TensorEvalToOp.72"* %0, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %25 = load i32, i32* %24, align 4, !tbaa !26
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 0, i32 0, i64 %26
  store i8 1, i8* %27, align 1, !tbaa !34
  %28 = load i8, i8* %6, align 8, !tbaa !34, !range !36
  %29 = icmp eq i8 %28, 0
  %30 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %14, i64 0, i32 0, i32 0, i64 0
  %31 = load i32, i32* %30, align 8, !tbaa !26
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 5, i32 0, i64 0
  %33 = select i1 %29, i32* %7, i32* %32
  %34 = xor i8 %28, 1
  %35 = zext i8 %34 to i64
  %36 = xor i1 %29, true
  %37 = zext i1 %36 to i64
  store i32 %31, i32* %33, align 4, !tbaa !26
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 0, i32 0, i64 1
  %39 = load i8, i8* %38, align 1, !tbaa !34, !range !36
  %40 = icmp eq i8 %39, 0
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 6, i32 1, i32 1, i32 0, i32 0, i64 1
  %42 = load i32, i32* %41, align 4, !tbaa !26
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 1, i32 0, i32 0, i64 %35
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 5, i32 0, i64 %37
  %45 = select i1 %40, i32* %43, i32* %44
  store i32 %42, i32* %45, align 4, !tbaa !26
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 2, i32 0, i64 0
  store i32 1, i32* %46, align 8, !tbaa !26
  %47 = load i32, i32* %41, align 4, !tbaa !26
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 4, i32 0, i64 0
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 3, i32 0, i64 0
  %50 = select i1 %29, i32* %49, i32* %48
  store i32 %47, i32* %50, align 4, !tbaa !26
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 3, i32 0, i64 %35
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 4, i32 0, i64 %37
  %53 = select i1 %40, i32* %51, i32* %52
  store i32 1, i32* %53, align 4, !tbaa !26
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 1
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %54, align 8, !tbaa !2
  %55 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 2
  %56 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.72", %"class.Eigen::TensorEvalToOp.72"* %0, i64 0, i32 1
  %57 = bitcast float** %56 to i64*
  %58 = load i64, i64* %57, align 8, !tbaa !68
  %59 = bitcast float** %55 to i64*
  store i64 %58, i64* %59, align 8, !tbaa !70
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 3
  store %"class.Eigen::TensorEvalToOp.72"* %0, %"class.Eigen::TensorEvalToOp.72"** %60, align 8, !tbaa !2
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 4
  %62 = ptrtoint %"class.Eigen::TensorMap.1"* %10 to i64
  %63 = bitcast %"class.Eigen::TensorReductionOp.22"* %61 to i64*
  store i64 %62, i64* %63, align 8, !tbaa !2
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 4, i32 1
  %65 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.72", %"class.Eigen::TensorEvalToOp.72"* %0, i64 0, i32 0, i32 1
  %66 = bitcast %"struct.Eigen::DSizes.4"* %64 to i8*
  %67 = bitcast %"struct.Eigen::DSizes.4"* %65 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %66, i8* %67, i64 5, i32 8, i1 false)
  %68 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %22, align 8, !tbaa !2
  %69 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %68, i64 0, i32 0
  %70 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %69, align 8, !tbaa !40
  %71 = bitcast %"class.Eigen::StreamInterface"* %70 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %72 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %71, align 8, !tbaa !42
  %73 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %72, i64 3
  %74 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %73, align 8
  %75 = invoke dereferenceable(352) %struct.cudaDeviceProp* %74(%"class.Eigen::StreamInterface"* %70)
          to label %76 unwind label %155

; <label>:76:                                     ; preds = %2
  %77 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %78 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %77, align 8, !tbaa !40
  %79 = bitcast %"class.Eigen::StreamInterface"* %78 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %80 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %79, align 8, !tbaa !42
  %81 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %80, i64 3
  %82 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %81, align 8
  %83 = invoke dereferenceable(352) %struct.cudaDeviceProp* %82(%"class.Eigen::StreamInterface"* %78)
          to label %84 unwind label %157

; <label>:84:                                     ; preds = %76
  %85 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %83, i64 0, i32 5
  %86 = load i32, i32* %85, align 8, !tbaa !46
  %87 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %77, align 8, !tbaa !40
  %88 = bitcast %"class.Eigen::StreamInterface"* %87 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %89 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %88, align 8, !tbaa !42
  %90 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %89, i64 3
  %91 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %90, align 8
  %92 = invoke dereferenceable(352) %struct.cudaDeviceProp* %91(%"class.Eigen::StreamInterface"* %87)
          to label %93 unwind label %159

; <label>:93:                                     ; preds = %84
  %94 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %92, i64 0, i32 10
  %95 = load i32, i32* %94, align 4, !tbaa !49
  %96 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %77, align 8, !tbaa !40
  %97 = bitcast %"class.Eigen::StreamInterface"* %96 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %98 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %97, align 8, !tbaa !42
  %99 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %98, i64 3
  %100 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %99, align 8
  %101 = invoke dereferenceable(352) %struct.cudaDeviceProp* %100(%"class.Eigen::StreamInterface"* %96)
          to label %102 unwind label %159

; <label>:102:                                    ; preds = %93
  %103 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %101, i64 0, i32 8
  %104 = load i32, i32* %103, align 4, !tbaa !50
  %105 = mul nsw i32 %104, %95
  %106 = sdiv i32 %105, %86
  %107 = load i32, i32* %7, align 4, !tbaa !26
  %108 = add i32 %86, -1
  %109 = add i32 %108, %107
  %110 = sdiv i32 %109, %86
  %111 = icmp slt i32 %110, %106
  %112 = select i1 %111, i32 %110, i32 %106
  %113 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %77, align 8, !tbaa !40
  %114 = bitcast %"class.Eigen::StreamInterface"* %113 to i8** (%"class.Eigen::StreamInterface"*)***
  %115 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %114, align 8, !tbaa !42
  %116 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %115, i64 2
  %117 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %116, align 8
  %118 = invoke dereferenceable(8) i8** %117(%"class.Eigen::StreamInterface"* %113)
          to label %119 unwind label %161

; <label>:119:                                    ; preds = %102
  %120 = zext i32 %86 to i64
  %121 = or i64 %120, 4294967296
  %122 = icmp sgt i32 %112, 1
  %123 = select i1 %122, i32 %112, i32 1
  %124 = zext i32 %123 to i64
  %125 = or i64 %124, 4294967296
  %126 = load i8*, i8** %118, align 8, !tbaa !51
  %127 = invoke i32 @cudaConfigureCall(i64 %125, i32 1, i64 %121, i32 1, i64 0, i8* %126)
          to label %128 unwind label %161

; <label>:128:                                    ; preds = %119
  %129 = icmp eq i32 %127, 0
  br i1 %129, label %130, label %166

; <label>:130:                                    ; preds = %128
  %131 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %5, i64 0, i32 0, i32 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %131, i8* nonnull %6, i64 24, i32 8, i1 false)
  %132 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %5, i64 0, i32 0, i32 6, i32 1
  %133 = bitcast %"struct.Eigen::TensorEvaluator.65"* %132 to i8*
  %134 = bitcast %"struct.Eigen::TensorEvaluator.65"* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %133, i8* %134, i64 32, i32 8, i1 false)
  %135 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %5, i64 0, i32 0, i32 7, i32 0
  %136 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %4, i64 0, i32 0, i32 7, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* %136, i64 24, i32 8, i1 false)
  %137 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %5, i64 0, i32 1
  %138 = bitcast %"struct.Eigen::GpuDevice"** %137 to i8*
  %139 = bitcast %"struct.Eigen::GpuDevice"** %54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %138, i8* %139, i64 24, i32 8, i1 false)
  %140 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %5, i64 0, i32 4
  %141 = load i64, i64* %63, align 8, !tbaa !2
  %142 = bitcast %"class.Eigen::TensorReductionOp.22"* %140 to i64*
  store i64 %141, i64* %142, align 8, !tbaa !2
  %143 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %5, i64 0, i32 4, i32 1
  %144 = bitcast %"struct.Eigen::DSizes.4"* %143 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %144, i8* nonnull %66, i64 5, i32 8, i1 false)
  %145 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %145)
  store i32 %107, i32* %3, align 4, !tbaa !26
  %146 = invoke i32 @cudaSetupArgument(i8* nonnull %131, i64 136, i64 0)
          to label %147 unwind label %163

; <label>:147:                                    ; preds = %130
  %148 = icmp eq i32 %146, 0
  br i1 %148, label %149, label %165

; <label>:149:                                    ; preds = %147
  %150 = invoke i32 @cudaSetupArgument(i8* nonnull %145, i64 4, i64 136)
          to label %151 unwind label %163

; <label>:151:                                    ; preds = %149
  %152 = icmp eq i32 %150, 0
  br i1 %152, label %153, label %165

; <label>:153:                                    ; preds = %151
  %154 = invoke i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.74"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
          to label %165 unwind label %163

; <label>:155:                                    ; preds = %2
  %156 = landingpad { i8*, i32 }
          cleanup
  br label %186

; <label>:157:                                    ; preds = %76, %175
  %158 = landingpad { i8*, i32 }
          cleanup
  br label %186

; <label>:159:                                    ; preds = %93, %84
  %160 = landingpad { i8*, i32 }
          cleanup
  br label %186

; <label>:161:                                    ; preds = %102, %170, %166, %119
  %162 = landingpad { i8*, i32 }
          cleanup
  br label %186

; <label>:163:                                    ; preds = %153, %149, %130
  %164 = landingpad { i8*, i32 }
          cleanup
  br label %186

; <label>:165:                                    ; preds = %151, %147, %153
  call void @llvm.lifetime.end(i64 4, i8* nonnull %145)
  br label %166

; <label>:166:                                    ; preds = %128, %165
  %167 = invoke i64 @cudaGetLastError()
          to label %168 unwind label %161

; <label>:168:                                    ; preds = %166
  %169 = icmp eq i64 %167, 0
  br i1 %169, label %172, label %170, !prof !52

; <label>:170:                                    ; preds = %168
  invoke void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #5
          to label %171 unwind label %161

; <label>:171:                                    ; preds = %170
  unreachable

; <label>:172:                                    ; preds = %168
  %173 = load float*, float** %21, align 8, !tbaa !59
  %174 = icmp eq float* %173, null
  br i1 %174, label %185, label %175

; <label>:175:                                    ; preds = %172
  %176 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %22, align 8, !tbaa !2
  %177 = bitcast float* %173 to i8*
  %178 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %176, i64 0, i32 0
  %179 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %178, align 8, !tbaa !40
  %180 = bitcast %"class.Eigen::StreamInterface"* %179 to void (%"class.Eigen::StreamInterface"*, i8*)***
  %181 = load void (%"class.Eigen::StreamInterface"*, i8*)**, void (%"class.Eigen::StreamInterface"*, i8*)*** %180, align 8, !tbaa !42
  %182 = getelementptr inbounds void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %181, i64 5
  %183 = load void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %182, align 8
  invoke void %183(%"class.Eigen::StreamInterface"* %179, i8* %177)
          to label %184 unwind label %157

; <label>:184:                                    ; preds = %175
  store float* null, float** %21, align 8, !tbaa !59
  br label %185

; <label>:185:                                    ; preds = %184, %172
  call void @llvm.lifetime.end(i64 136, i8* nonnull %6) #4
  ret void

; <label>:186:                                    ; preds = %161, %163, %157, %159, %155
  %187 = phi { i8*, i32 } [ %162, %161 ], [ %164, %163 ], [ %158, %157 ], [ %160, %159 ], [ %156, %155 ]
  call void @llvm.lifetime.end(i64 136, i8* nonnull %6) #4
  resume { i8*, i32 } %187
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.74"*, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %0, i64 0, i32 0, i32 0, i32 0, i64 0
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 136, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 136)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.74"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESG_EESG_EENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSD_EEKNS3_INS4_ISD_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISL_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSJ_IiLi1EEESH_S6_EEEEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS16_RKS17_(%"class.Eigen::TensorAssignOp.75"* dereferenceable(16), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 {
  %3 = alloca i32, align 4
  %4 = alloca %"class.Eigen::TensorEvalToOp", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator.77", align 16
  %6 = alloca %"struct.Eigen::TensorEvaluator.77", align 8
  %7 = bitcast %"struct.Eigen::TensorEvaluator.77"* %5 to i8*
  call void @llvm.lifetime.start(i64 232, i8* nonnull %7) #4
  %8 = getelementptr inbounds %"class.Eigen::TensorAssignOp.75", %"class.Eigen::TensorAssignOp.75"* %0, i64 0, i32 0
  %9 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %8, align 8, !tbaa !2
  %10 = bitcast %"class.Eigen::TensorMap.1"* %9 to <2 x i64>*
  %11 = load <2 x i64>, <2 x i64>* %10, align 8
  %12 = bitcast %"struct.Eigen::TensorEvaluator.77"* %5 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %12, align 16
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %13, align 16, !tbaa !2
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 0, i32 3
  store %"class.Eigen::TensorMap.1"* %9, %"class.Eigen::TensorMap.1"** %14, align 8, !tbaa !2
  %15 = getelementptr inbounds %"class.Eigen::TensorAssignOp.75", %"class.Eigen::TensorAssignOp.75"* %0, i64 0, i32 1
  %16 = load %"class.Eigen::TensorCwiseUnaryOp.31"*, %"class.Eigen::TensorCwiseUnaryOp.31"** %15, align 8, !tbaa !2
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 1
  %18 = getelementptr inbounds %"class.Eigen::TensorCwiseUnaryOp.31", %"class.Eigen::TensorCwiseUnaryOp.31"* %16, i64 0, i32 0, i32 0
  %19 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %18, align 8, !tbaa !2
  %20 = bitcast %"class.Eigen::TensorMap"* %19 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !20
  %22 = bitcast %"struct.Eigen::TensorEvaluator.53"* %17 to i64*
  store i64 %21, i64* %22, align 8, !tbaa !24
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 1, i32 1
  %24 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %19, i64 0, i32 1
  %25 = bitcast %"struct.Eigen::DSizes"* %24 to i64*
  %26 = bitcast %"struct.Eigen::DSizes"* %23 to i64*
  %27 = load i64, i64* %25, align 4
  store i64 %27, i64* %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %28, align 8, !tbaa !2
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 1, i32 3
  store %"class.Eigen::TensorMap"* %19, %"class.Eigen::TensorMap"** %29, align 8, !tbaa !2
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2
  %31 = getelementptr inbounds %"class.Eigen::TensorCwiseUnaryOp.31", %"class.Eigen::TensorCwiseUnaryOp.31"* %16, i64 0, i32 0, i32 1
  %32 = getelementptr inbounds %"class.Eigen::TensorCwiseUnaryOp.31", %"class.Eigen::TensorCwiseUnaryOp.31"* %16, i64 0, i32 0, i32 1, i32 1
  %33 = bitcast %"struct.Eigen::DSizes"* %32 to i64*
  %34 = bitcast %"struct.Eigen::TensorEvaluator.54"* %30 to i64*
  %35 = load i64, i64* %33, align 4
  store i64 %35, i64* %34, align 8
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 1
  %37 = bitcast %"struct.Eigen::DSizes"* %36 to i64*
  store i64 0, i64* %37, align 8
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  store i32 0, i32* %39, align 4, !tbaa !26
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6
  %41 = getelementptr inbounds %"class.Eigen::TensorBroadcastingOp", %"class.Eigen::TensorBroadcastingOp"* %31, i64 0, i32 0, i32 0, i32 0, i32 0
  %42 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %41, align 8, !tbaa !2
  %43 = bitcast %"class.Eigen::TensorMap"* %42 to i64*
  %44 = load i64, i64* %43, align 8, !tbaa !20
  %45 = bitcast %"struct.Eigen::TensorEvaluator.53"* %40 to i64*
  store i64 %44, i64* %45, align 8, !tbaa !24
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 1
  %47 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %42, i64 0, i32 1
  %48 = bitcast %"struct.Eigen::DSizes"* %47 to i64*
  %49 = bitcast %"struct.Eigen::DSizes"* %46 to i64*
  %50 = load i64, i64* %48, align 4
  store i64 %50, i64* %49, align 8
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %51, align 8, !tbaa !2
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 3
  store %"class.Eigen::TensorMap"* %42, %"class.Eigen::TensorMap"** %52, align 8, !tbaa !2
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 8
  store float* null, float** %53, align 8, !tbaa !28
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 9
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %54, align 8, !tbaa !2
  %55 = bitcast %"struct.Eigen::TensorEvaluator.55"* %38 to i16*
  store i16 0, i16* %55, align 8
  %56 = getelementptr inbounds %"class.Eigen::TensorCwiseUnaryOp.31", %"class.Eigen::TensorCwiseUnaryOp.31"* %16, i64 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %57 = load i32, i32* %56, align 4, !tbaa !26
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 0, i32 0, i64 %58
  store i8 1, i8* %59, align 1, !tbaa !34
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.55", %"struct.Eigen::TensorEvaluator.55"* %38, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  %61 = load i8, i8* %60, align 8, !tbaa !34, !range !36
  %62 = icmp eq i8 %61, 0
  %63 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %46, i64 0, i32 0, i32 0, i64 0
  %64 = load i32, i32* %63, align 8, !tbaa !26
  %65 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 5, i32 0, i64 0
  %66 = select i1 %62, i32* %39, i32* %65
  %67 = xor i8 %61, 1
  %68 = zext i8 %67 to i64
  %69 = xor i1 %62, true
  %70 = zext i1 %69 to i64
  store i32 %64, i32* %66, align 4, !tbaa !26
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 0, i32 0, i64 1
  %72 = load i8, i8* %71, align 1, !tbaa !34, !range !36
  %73 = icmp eq i8 %72, 0
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0, i64 1
  %75 = load i32, i32* %74, align 4, !tbaa !26
  %76 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 %68
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 5, i32 0, i64 %70
  %78 = select i1 %73, i32* %76, i32* %77
  store i32 %75, i32* %78, align 4, !tbaa !26
  %79 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 2, i32 0, i64 0
  store i32 1, i32* %79, align 8, !tbaa !26
  %80 = load i32, i32* %74, align 4, !tbaa !26
  %81 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 4, i32 0, i64 0
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 3, i32 0, i64 0
  %83 = select i1 %62, i32* %82, i32* %81
  store i32 %80, i32* %83, align 4, !tbaa !26
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 3, i32 0, i64 %68
  %85 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 0, i32 4, i32 0, i64 %70
  %86 = select i1 %73, i32* %84, i32* %85
  store i32 1, i32* %86, align 4, !tbaa !26
  %87 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 1
  %88 = bitcast %"class.Eigen::TensorReductionOp"* %87 to i8*
  %89 = bitcast %"class.Eigen::TensorBroadcastingOp"* %31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %88, i8* nonnull %89, i64 16, i32 8, i1 false)
  %90 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %90, align 8, !tbaa !2
  %91 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 0, i32 3
  store float* null, float** %91, align 8, !tbaa !37
  %92 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 4, i32 1
  %93 = getelementptr inbounds %"class.Eigen::TensorCwiseUnaryOp.31", %"class.Eigen::TensorCwiseUnaryOp.31"* %16, i64 0, i32 0, i32 1, i32 0, i32 1
  %94 = bitcast %"struct.Eigen::DSizes"* %93 to i64*
  %95 = bitcast %"struct.Eigen::DSizes"* %92 to i64*
  %96 = load i64, i64* %94, align 4
  store i64 %96, i64* %95, align 8
  %97 = trunc i64 %96 to i32
  %98 = getelementptr inbounds %"class.Eigen::TensorCwiseUnaryOp.31", %"class.Eigen::TensorCwiseUnaryOp.31"* %16, i64 0, i32 0, i32 1, i32 1, i32 0, i32 0, i64 0
  %99 = load i32, i32* %98, align 4, !tbaa !26
  %100 = mul nsw i32 %99, %97
  %101 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 1, i32 0, i32 0, i64 0
  store i32 %100, i32* %101, align 8, !tbaa !26
  %102 = lshr i64 %96, 32
  %103 = trunc i64 %102 to i32
  %104 = getelementptr inbounds %"class.Eigen::TensorCwiseUnaryOp.31", %"class.Eigen::TensorCwiseUnaryOp.31"* %16, i64 0, i32 0, i32 1, i32 1, i32 0, i32 0, i64 1
  %105 = load i32, i32* %104, align 4, !tbaa !26
  %106 = mul nsw i32 %105, %103
  %107 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 1, i32 0, i32 0, i64 1
  store i32 %106, i32* %107, align 4, !tbaa !26
  %108 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 3, i32 0, i64 1
  store i32 1, i32* %108, align 4, !tbaa !26
  %109 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 2, i32 0, i64 1
  store i32 1, i32* %109, align 4, !tbaa !26
  %110 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 3, i32 0, i64 0
  store i32 %103, i32* %110, align 8, !tbaa !26
  %111 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %5, i64 0, i32 1, i32 1, i32 2, i32 2, i32 0, i64 0
  store i32 %106, i32* %111, align 8, !tbaa !26
  %112 = load i32, i32* %39, align 4, !tbaa !26
  %113 = sext i32 %112 to i64
  %114 = shl nsw i64 %113, 2
  %115 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %116 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %117 = bitcast %"class.Eigen::StreamInterface"* %116 to i8* (%"class.Eigen::StreamInterface"*, i64)***
  %118 = load i8* (%"class.Eigen::StreamInterface"*, i64)**, i8* (%"class.Eigen::StreamInterface"*, i64)*** %117, align 8, !tbaa !42
  %119 = getelementptr inbounds i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %118, i64 4
  %120 = load i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %119, align 8
  %121 = tail call i8* %120(%"class.Eigen::StreamInterface"* %116, i64 %114)
  %122 = bitcast float** %91 to i8**
  store i8* %121, i8** %122, align 8, !tbaa !37
  %123 = bitcast %"class.Eigen::TensorEvalToOp"* %4 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %123) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %123, i8* nonnull %88, i64 16, i32 8, i1 false) #4
  %124 = getelementptr inbounds %"class.Eigen::TensorEvalToOp", %"class.Eigen::TensorEvalToOp"* %4, i64 0, i32 1
  %125 = bitcast float** %124 to i8**
  store i8* %121, i8** %125, align 8, !tbaa !44
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EESD_EENS_9GpuDeviceELb0EE3runERSJ_RKSK_(%"class.Eigen::TensorEvalToOp"* nonnull dereferenceable(24) %4, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %1)
  call void @llvm.lifetime.end(i64 24, i8* nonnull %123) #4
  %126 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %127 = bitcast %"class.Eigen::StreamInterface"* %126 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %128 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %127, align 8, !tbaa !42
  %129 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %128, i64 3
  %130 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %129, align 8
  %131 = call dereferenceable(352) %struct.cudaDeviceProp* %130(%"class.Eigen::StreamInterface"* %126)
  %132 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %131, i64 0, i32 5
  %133 = load i32, i32* %132, align 8, !tbaa !46
  %134 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %135 = bitcast %"class.Eigen::StreamInterface"* %134 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %136 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %135, align 8, !tbaa !42
  %137 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %136, i64 3
  %138 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %137, align 8
  %139 = call dereferenceable(352) %struct.cudaDeviceProp* %138(%"class.Eigen::StreamInterface"* %134)
  %140 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %139, i64 0, i32 10
  %141 = load i32, i32* %140, align 4, !tbaa !49
  %142 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %143 = bitcast %"class.Eigen::StreamInterface"* %142 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %144 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %143, align 8, !tbaa !42
  %145 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %144, i64 3
  %146 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %145, align 8
  %147 = call dereferenceable(352) %struct.cudaDeviceProp* %146(%"class.Eigen::StreamInterface"* %142)
  %148 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %147, i64 0, i32 8
  %149 = load i32, i32* %148, align 4, !tbaa !50
  %150 = mul nsw i32 %149, %141
  %151 = sdiv i32 %150, %133
  %152 = load i64, i64* %26, align 8
  %153 = trunc i64 %152 to i32
  %154 = lshr i64 %152, 32
  %155 = trunc i64 %154 to i32
  %156 = mul nsw i32 %155, %153
  %157 = add i32 %133, -1
  %158 = add i32 %157, %156
  %159 = sdiv i32 %158, %133
  %160 = icmp slt i32 %159, %151
  %161 = select i1 %160, i32 %159, i32 %151
  %162 = icmp sgt i32 %161, 1
  %163 = select i1 %162, i32 %161, i32 1
  %164 = zext i32 %163 to i64
  %165 = or i64 %164, 4294967296
  %166 = zext i32 %133 to i64
  %167 = or i64 %166, 4294967296
  %168 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %169 = bitcast %"class.Eigen::StreamInterface"* %168 to i8** (%"class.Eigen::StreamInterface"*)***
  %170 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %169, align 8, !tbaa !42
  %171 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %170, i64 2
  %172 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %171, align 8
  %173 = call dereferenceable(8) i8** %172(%"class.Eigen::StreamInterface"* %168)
  %174 = load i8*, i8** %173, align 8, !tbaa !51
  %175 = call i32 @cudaConfigureCall(i64 %165, i32 1, i64 %167, i32 1, i64 0, i8* %174)
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %177, label %191

; <label>:177:                                    ; preds = %2
  %178 = bitcast %"struct.Eigen::TensorEvaluator.77"* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %178, i8* nonnull %7, i64 32, i32 8, i1 false)
  %179 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %6, i64 0, i32 1, i32 1, i32 1
  %180 = bitcast %"struct.Eigen::TensorEvaluator.53"* %179 to i8*
  %181 = bitcast %"struct.Eigen::TensorEvaluator.53"* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %180, i8* %181, i64 184, i32 8, i1 false)
  %182 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %182)
  store i32 %156, i32* %3, align 4, !tbaa !26
  %183 = call i32 @cudaSetupArgument(i8* nonnull %178, i64 232, i64 0)
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %190

; <label>:185:                                    ; preds = %177
  %186 = call i32 @cudaSetupArgument(i8* nonnull %182, i64 4, i64 232)
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %188, label %190

; <label>:188:                                    ; preds = %185
  %189 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.77"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSE_EEKNS4_INS5_ISE_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISM_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSK_IiLi1EEESI_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %190

; <label>:190:                                    ; preds = %177, %185, %188
  call void @llvm.lifetime.end(i64 4, i8* nonnull %182)
  br label %191

; <label>:191:                                    ; preds = %2, %190
  %192 = call i64 @cudaGetLastError()
  %193 = icmp eq i64 %192, 0
  br i1 %193, label %195, label %194, !prof !52

; <label>:194:                                    ; preds = %191
  call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #5
  unreachable

; <label>:195:                                    ; preds = %191
  %196 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %90, align 8, !tbaa !2
  %197 = load i8*, i8** %122, align 8, !tbaa !37
  %198 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %196, i64 0, i32 0
  %199 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %198, align 8, !tbaa !40
  %200 = bitcast %"class.Eigen::StreamInterface"* %199 to void (%"class.Eigen::StreamInterface"*, i8*)***
  %201 = load void (%"class.Eigen::StreamInterface"*, i8*)**, void (%"class.Eigen::StreamInterface"*, i8*)*** %200, align 8, !tbaa !42
  %202 = getelementptr inbounds void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %201, i64 5
  %203 = load void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %202, align 8
  call void %203(%"class.Eigen::StreamInterface"* %199, i8* %197)
  call void @llvm.lifetime.end(i64 232, i8* nonnull %7) #4
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSE_EEKNS4_INS5_ISE_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISM_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSK_IiLi1EEESI_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.77"*, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = bitcast %"struct.Eigen::TensorEvaluator.77"* %0 to i8*
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 232, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 232)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.77"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_18TensorCwiseUnaryOpINS0_13scalar_exp_opIfEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSE_EEKNS4_INS5_ISE_Li2ELi1EiEELi16ES7_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISM_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSK_IiLi1EEESI_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS7_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISF_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSD_IiLi1EEESB_S6_EEEEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS13_RKS14_(%"class.Eigen::TensorAssignOp.79"* dereferenceable(16), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 {
  %3 = alloca i32, align 4
  %4 = alloca %"class.Eigen::TensorEvalToOp.88", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator.81", align 16
  %6 = alloca %"struct.Eigen::TensorEvaluator.81", align 8
  %7 = bitcast %"struct.Eigen::TensorEvaluator.81"* %5 to i8*
  call void @llvm.lifetime.start(i64 240, i8* nonnull %7) #4
  %8 = getelementptr inbounds %"class.Eigen::TensorAssignOp.79", %"class.Eigen::TensorAssignOp.79"* %0, i64 0, i32 0
  %9 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %8, align 8, !tbaa !2
  %10 = bitcast %"class.Eigen::TensorMap.1"* %9 to <2 x i64>*
  %11 = load <2 x i64>, <2 x i64>* %10, align 8
  %12 = bitcast %"struct.Eigen::TensorEvaluator.81"* %5 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %12, align 16
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %13, align 16, !tbaa !2
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 0, i32 3
  store %"class.Eigen::TensorMap.1"* %9, %"class.Eigen::TensorMap.1"** %14, align 8, !tbaa !2
  %15 = getelementptr inbounds %"class.Eigen::TensorAssignOp.79", %"class.Eigen::TensorAssignOp.79"* %0, i64 0, i32 1
  %16 = load %"class.Eigen::TensorCwiseBinaryOp.34"*, %"class.Eigen::TensorCwiseBinaryOp.34"** %15, align 8, !tbaa !2
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 1
  %18 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 0
  %19 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %18, align 8, !tbaa !2
  %20 = bitcast %"class.Eigen::TensorMap.1"* %19 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !55
  %22 = bitcast %"struct.Eigen::TensorEvaluator.65"* %17 to i64*
  store i64 %21, i64* %22, align 8, !tbaa !57
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 1, i32 1
  %24 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %19, i64 0, i32 1
  %25 = bitcast %"struct.Eigen::DSizes"* %24 to i64*
  %26 = bitcast %"struct.Eigen::DSizes"* %23 to i64*
  %27 = load i64, i64* %25, align 4
  store i64 %27, i64* %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 1, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %28, align 8, !tbaa !2
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 1, i32 3
  store %"class.Eigen::TensorMap.1"* %19, %"class.Eigen::TensorMap.1"** %29, align 8, !tbaa !2
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2
  %31 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1
  %32 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 1
  %33 = bitcast %"struct.Eigen::DSizes"* %32 to i64*
  %34 = bitcast %"struct.Eigen::TensorEvaluator.83"* %30 to i64*
  %35 = load i64, i64* %33, align 4
  store i64 %35, i64* %34, align 8
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 1
  %37 = bitcast %"struct.Eigen::DSizes"* %36 to i64*
  store i64 0, i64* %37, align 8
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i64 0
  store i32 0, i32* %39, align 4, !tbaa !26
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 6
  %41 = getelementptr inbounds %"class.Eigen::TensorBroadcastingOp.36", %"class.Eigen::TensorBroadcastingOp.36"* %31, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %42 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %41, align 8, !tbaa !2
  %43 = bitcast %"class.Eigen::TensorMap.1"* %42 to i64*
  %44 = load i64, i64* %43, align 8, !tbaa !55
  %45 = bitcast %"struct.Eigen::TensorEvaluator.65"* %40 to i64*
  store i64 %44, i64* %45, align 8, !tbaa !57
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 6, i32 1
  %47 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %42, i64 0, i32 1
  %48 = bitcast %"struct.Eigen::DSizes"* %47 to i64*
  %49 = bitcast %"struct.Eigen::DSizes"* %46 to i64*
  %50 = load i64, i64* %48, align 4
  store i64 %50, i64* %49, align 8
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 6, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %51, align 8, !tbaa !2
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 6, i32 3
  store %"class.Eigen::TensorMap.1"* %42, %"class.Eigen::TensorMap.1"** %52, align 8, !tbaa !2
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 8
  store float* null, float** %53, align 8, !tbaa !72
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 9
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %54, align 8, !tbaa !2
  %55 = bitcast %"struct.Eigen::TensorEvaluator.87"* %38 to i16*
  store i16 0, i16* %55, align 8
  %56 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %57 = load i32, i32* %56, align 4, !tbaa !26
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 %58
  store i8 1, i8* %59, align 1, !tbaa !34
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.87", %"struct.Eigen::TensorEvaluator.87"* %38, i64 0, i32 0, i32 0, i64 0
  %61 = load i8, i8* %60, align 8, !tbaa !34, !range !36
  %62 = icmp eq i8 %61, 0
  %63 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %46, i64 0, i32 0, i32 0, i64 0
  %64 = load i32, i32* %63, align 8, !tbaa !26
  %65 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 5, i32 0, i64 0
  %66 = select i1 %62, i32* %39, i32* %65
  %67 = xor i8 %61, 1
  %68 = zext i8 %67 to i64
  %69 = xor i1 %62, true
  %70 = zext i1 %69 to i64
  store i32 %64, i32* %66, align 4, !tbaa !26
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %72 = load i8, i8* %71, align 1, !tbaa !34, !range !36
  %73 = icmp eq i8 %72, 0
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 6, i32 1, i32 0, i32 0, i64 1
  %75 = load i32, i32* %74, align 4, !tbaa !26
  %76 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i64 %68
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 5, i32 0, i64 %70
  %78 = select i1 %73, i32* %76, i32* %77
  store i32 %75, i32* %78, align 4, !tbaa !26
  %79 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 2, i32 0, i64 0
  store i32 1, i32* %79, align 8, !tbaa !26
  %80 = load i32, i32* %74, align 4, !tbaa !26
  %81 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 4, i32 0, i64 0
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 3, i32 0, i64 0
  %83 = select i1 %62, i32* %82, i32* %81
  store i32 %80, i32* %83, align 4, !tbaa !26
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 3, i32 0, i64 %68
  %85 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 4, i32 0, i64 %70
  %86 = select i1 %73, i32* %84, i32* %85
  store i32 1, i32* %86, align 4, !tbaa !26
  %87 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 1
  %88 = bitcast %"class.Eigen::TensorCwiseUnaryOp.43"* %87 to i8*
  %89 = bitcast %"class.Eigen::TensorBroadcastingOp.36"* %31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %88, i8* nonnull %89, i64 16, i32 8, i1 false)
  %90 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %90, align 8, !tbaa !2
  %91 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 3
  store float* null, float** %91, align 8, !tbaa !74
  %92 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 1
  %93 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 0, i32 1
  %94 = bitcast %"struct.Eigen::DSizes"* %93 to i64*
  %95 = bitcast %"struct.Eigen::DSizes"* %92 to i64*
  %96 = load i64, i64* %94, align 4
  store i64 %96, i64* %95, align 8
  %97 = trunc i64 %96 to i32
  %98 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 1, i32 0, i32 0, i64 0
  %99 = load i32, i32* %98, align 4, !tbaa !26
  %100 = mul nsw i32 %99, %97
  %101 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0, i64 0
  store i32 %100, i32* %101, align 8, !tbaa !26
  %102 = lshr i64 %96, 32
  %103 = trunc i64 %102 to i32
  %104 = getelementptr inbounds %"class.Eigen::TensorCwiseBinaryOp.34", %"class.Eigen::TensorCwiseBinaryOp.34"* %16, i64 0, i32 1, i32 1, i32 0, i32 0, i64 1
  %105 = load i32, i32* %104, align 4, !tbaa !26
  %106 = mul nsw i32 %105, %103
  %107 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 1, i32 0, i32 0, i64 1
  store i32 %106, i32* %107, align 4, !tbaa !26
  %108 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 3, i32 0, i64 1
  store i32 1, i32* %108, align 4, !tbaa !26
  %109 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 2, i32 0, i64 1
  store i32 1, i32* %109, align 4, !tbaa !26
  %110 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 3, i32 0, i64 0
  store i32 %103, i32* %110, align 8, !tbaa !26
  %111 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  store i32 %106, i32* %111, align 8, !tbaa !26
  %112 = load i32, i32* %39, align 4, !tbaa !26
  %113 = sext i32 %112 to i64
  %114 = shl nsw i64 %113, 2
  %115 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %116 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %117 = bitcast %"class.Eigen::StreamInterface"* %116 to i8* (%"class.Eigen::StreamInterface"*, i64)***
  %118 = load i8* (%"class.Eigen::StreamInterface"*, i64)**, i8* (%"class.Eigen::StreamInterface"*, i64)*** %117, align 8, !tbaa !42
  %119 = getelementptr inbounds i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %118, i64 4
  %120 = load i8* (%"class.Eigen::StreamInterface"*, i64)*, i8* (%"class.Eigen::StreamInterface"*, i64)** %119, align 8
  %121 = tail call i8* %120(%"class.Eigen::StreamInterface"* %116, i64 %114)
  %122 = bitcast float** %91 to i8**
  store i8* %121, i8** %122, align 8, !tbaa !74
  %123 = bitcast %"class.Eigen::TensorEvalToOp.88"* %4 to i8*
  call void @llvm.lifetime.start(i64 32, i8* nonnull %123) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %123, i8* nonnull %88, i64 16, i32 8, i1 false)
  %124 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.88", %"class.Eigen::TensorEvalToOp.88"* %4, i64 0, i32 1
  %125 = bitcast float** %124 to i8**
  store i8* %121, i8** %125, align 8, !tbaa !80
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESF_EEEESF_EENS_9GpuDeviceELb0EE3runERSN_RKSO_(%"class.Eigen::TensorEvalToOp.88"* nonnull dereferenceable(32) %4, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %1)
  call void @llvm.lifetime.end(i64 32, i8* nonnull %123) #4
  %126 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %127 = bitcast %"class.Eigen::StreamInterface"* %126 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %128 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %127, align 8, !tbaa !42
  %129 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %128, i64 3
  %130 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %129, align 8
  %131 = call dereferenceable(352) %struct.cudaDeviceProp* %130(%"class.Eigen::StreamInterface"* %126)
  %132 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %131, i64 0, i32 5
  %133 = load i32, i32* %132, align 8, !tbaa !46
  %134 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %135 = bitcast %"class.Eigen::StreamInterface"* %134 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %136 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %135, align 8, !tbaa !42
  %137 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %136, i64 3
  %138 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %137, align 8
  %139 = call dereferenceable(352) %struct.cudaDeviceProp* %138(%"class.Eigen::StreamInterface"* %134)
  %140 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %139, i64 0, i32 10
  %141 = load i32, i32* %140, align 4, !tbaa !49
  %142 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %143 = bitcast %"class.Eigen::StreamInterface"* %142 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %144 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %143, align 8, !tbaa !42
  %145 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %144, i64 3
  %146 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %145, align 8
  %147 = call dereferenceable(352) %struct.cudaDeviceProp* %146(%"class.Eigen::StreamInterface"* %142)
  %148 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %147, i64 0, i32 8
  %149 = load i32, i32* %148, align 4, !tbaa !50
  %150 = mul nsw i32 %149, %141
  %151 = sdiv i32 %150, %133
  %152 = load i64, i64* %26, align 8
  %153 = trunc i64 %152 to i32
  %154 = lshr i64 %152, 32
  %155 = trunc i64 %154 to i32
  %156 = mul nsw i32 %155, %153
  %157 = add i32 %133, -1
  %158 = add i32 %157, %156
  %159 = sdiv i32 %158, %133
  %160 = icmp slt i32 %159, %151
  %161 = select i1 %160, i32 %159, i32 %151
  %162 = icmp sgt i32 %161, 1
  %163 = select i1 %162, i32 %161, i32 1
  %164 = zext i32 %163 to i64
  %165 = or i64 %164, 4294967296
  %166 = zext i32 %133 to i64
  %167 = or i64 %166, 4294967296
  %168 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %115, align 8, !tbaa !40
  %169 = bitcast %"class.Eigen::StreamInterface"* %168 to i8** (%"class.Eigen::StreamInterface"*)***
  %170 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %169, align 8, !tbaa !42
  %171 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %170, i64 2
  %172 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %171, align 8
  %173 = call dereferenceable(8) i8** %172(%"class.Eigen::StreamInterface"* %168)
  %174 = load i8*, i8** %173, align 8, !tbaa !51
  %175 = call i32 @cudaConfigureCall(i64 %165, i32 1, i64 %167, i32 1, i64 0, i8* %174)
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %177, label %204

; <label>:177:                                    ; preds = %2
  %178 = bitcast %"struct.Eigen::TensorEvaluator.81"* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %178, i8* nonnull %7, i64 32, i32 8, i1 false)
  %179 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %6, i64 0, i32 1, i32 1
  %180 = bitcast %"struct.Eigen::TensorEvaluator.65"* %179 to i8*
  %181 = bitcast %"struct.Eigen::TensorEvaluator.65"* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %180, i8* %181, i64 32, i32 8, i1 false)
  %182 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %6, i64 0, i32 1, i32 2
  %183 = bitcast %"struct.Eigen::TensorEvaluator.83"* %182 to i8*
  %184 = bitcast %"struct.Eigen::TensorEvaluator.83"* %30 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %183, i8* nonnull %184, i64 32, i32 8, i1 false)
  %185 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %6, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %186 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %5, i64 0, i32 1, i32 2, i32 4, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %185, i8* %186, i64 80, i32 8, i1 false)
  %187 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %6, i64 0, i32 1, i32 2, i32 4, i32 0, i32 1
  %188 = bitcast %"class.Eigen::TensorCwiseUnaryOp.43"* %187 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %188, i8* nonnull %88, i64 16, i32 8, i1 false)
  %189 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %6, i64 0, i32 1, i32 2, i32 4, i32 0, i32 2
  %190 = bitcast %"struct.Eigen::GpuDevice"** %189 to i8*
  %191 = bitcast %"struct.Eigen::GpuDevice"** %90 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %190, i8* %191, i64 16, i32 8, i1 false)
  %192 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %6, i64 0, i32 1, i32 2, i32 4, i32 1
  %193 = bitcast %"struct.Eigen::DSizes"* %192 to i64*
  %194 = load i64, i64* %95, align 8
  store i64 %194, i64* %193, align 8
  %195 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %195)
  store i32 %156, i32* %3, align 4, !tbaa !26
  %196 = call i32 @cudaSetupArgument(i8* nonnull %178, i64 240, i64 0)
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %203

; <label>:198:                                    ; preds = %177
  %199 = call i32 @cudaSetupArgument(i8* nonnull %195, i64 4, i64 240)
  %200 = icmp eq i32 %199, 0
  br i1 %200, label %201, label %203

; <label>:201:                                    ; preds = %198
  %202 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.81"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEESC_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %203

; <label>:203:                                    ; preds = %177, %198, %201
  call void @llvm.lifetime.end(i64 4, i8* nonnull %195)
  br label %204

; <label>:204:                                    ; preds = %2, %203
  %205 = call i64 @cudaGetLastError()
  %206 = icmp eq i64 %205, 0
  br i1 %206, label %208, label %207, !prof !52

; <label>:207:                                    ; preds = %204
  call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #5
  unreachable

; <label>:208:                                    ; preds = %204
  %209 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %90, align 8, !tbaa !2
  %210 = load i8*, i8** %122, align 8, !tbaa !74
  %211 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %209, i64 0, i32 0
  %212 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %211, align 8, !tbaa !40
  %213 = bitcast %"class.Eigen::StreamInterface"* %212 to void (%"class.Eigen::StreamInterface"*, i8*)***
  %214 = load void (%"class.Eigen::StreamInterface"*, i8*)**, void (%"class.Eigen::StreamInterface"*, i8*)*** %213, align 8, !tbaa !42
  %215 = getelementptr inbounds void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %214, i64 5
  %216 = load void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %215, align 8
  call void %216(%"class.Eigen::StreamInterface"* %212, i8* %210)
  call void @llvm.lifetime.end(i64 240, i8* nonnull %7) #4
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEESC_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.81"*, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = bitcast %"struct.Eigen::TensorEvaluator.81"* %0 to i8*
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 240, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 240)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.81"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_17scalar_product_opIffEEKS8_KNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISG_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNSE_IiLi1EEESC_S7_EEEEEEEEEEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESF_EEEESF_EENS_9GpuDeviceELb0EE3runERSN_RKSO_(%"class.Eigen::TensorEvalToOp.88"* dereferenceable(32), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca i32, align 4
  %4 = alloca %"struct.Eigen::TensorEvaluator.90", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator.90", align 8
  %6 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 0, i32 0
  call void @llvm.lifetime.start(i64 136, i8* nonnull %6) #4
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 1, i32 0, i32 0, i64 0
  store i32 0, i32* %8, align 4, !tbaa !26
  %9 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 6
  %10 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.88", %"class.Eigen::TensorEvalToOp.88"* %0, i64 0, i32 0, i32 0, i32 0
  %11 = load %"class.Eigen::TensorMap.1"*, %"class.Eigen::TensorMap.1"** %10, align 8, !tbaa !2
  %12 = bitcast %"class.Eigen::TensorMap.1"* %11 to i64*
  %13 = load i64, i64* %12, align 8, !tbaa !55
  %14 = bitcast %"struct.Eigen::TensorEvaluator.65"* %9 to i64*
  store i64 %13, i64* %14, align 8, !tbaa !57
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 6, i32 1
  %16 = getelementptr inbounds %"class.Eigen::TensorMap.1", %"class.Eigen::TensorMap.1"* %11, i64 0, i32 1
  %17 = bitcast %"struct.Eigen::DSizes"* %16 to i64*
  %18 = bitcast %"struct.Eigen::DSizes"* %15 to i64*
  %19 = load i64, i64* %17, align 4
  store i64 %19, i64* %18, align 8
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 6, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %20, align 8, !tbaa !2
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 6, i32 3
  store %"class.Eigen::TensorMap.1"* %11, %"class.Eigen::TensorMap.1"** %21, align 8, !tbaa !2
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 8
  store float* null, float** %22, align 8, !tbaa !72
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 9
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %23, align 8, !tbaa !2
  %24 = bitcast %"struct.Eigen::TensorEvaluator.87"* %7 to i16*
  store i16 0, i16* %24, align 8
  %25 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.88", %"class.Eigen::TensorEvalToOp.88"* %0, i64 0, i32 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %26 = load i32, i32* %25, align 4, !tbaa !26
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 0, i32 0, i64 %27
  store i8 1, i8* %28, align 1, !tbaa !34
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.87", %"struct.Eigen::TensorEvaluator.87"* %7, i64 0, i32 0, i32 0, i64 0
  %30 = load i8, i8* %29, align 8, !tbaa !34, !range !36
  %31 = icmp eq i8 %30, 0
  %32 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %15, i64 0, i32 0, i32 0, i64 0
  %33 = load i32, i32* %32, align 8, !tbaa !26
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 5, i32 0, i64 0
  %35 = select i1 %31, i32* %8, i32* %34
  %36 = xor i8 %30, 1
  %37 = zext i8 %36 to i64
  %38 = xor i1 %31, true
  %39 = zext i1 %38 to i64
  store i32 %33, i32* %35, align 4, !tbaa !26
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 0, i32 0, i64 1
  %41 = load i8, i8* %40, align 1, !tbaa !34, !range !36
  %42 = icmp eq i8 %41, 0
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 6, i32 1, i32 0, i32 0, i64 1
  %44 = load i32, i32* %43, align 4, !tbaa !26
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 1, i32 0, i32 0, i64 %37
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 5, i32 0, i64 %39
  %47 = select i1 %42, i32* %45, i32* %46
  store i32 %44, i32* %47, align 4, !tbaa !26
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 2, i32 0, i64 0
  store i32 1, i32* %48, align 8, !tbaa !26
  %49 = load i32, i32* %43, align 4, !tbaa !26
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 4, i32 0, i64 0
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 3, i32 0, i64 0
  %52 = select i1 %31, i32* %51, i32* %50
  store i32 %49, i32* %52, align 4, !tbaa !26
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 3, i32 0, i64 %37
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 4, i32 0, i64 %39
  %55 = select i1 %42, i32* %53, i32* %54
  store i32 1, i32* %55, align 4, !tbaa !26
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 1
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %56, align 8, !tbaa !2
  %57 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 2
  %58 = getelementptr inbounds %"class.Eigen::TensorEvalToOp.88", %"class.Eigen::TensorEvalToOp.88"* %0, i64 0, i32 1
  %59 = bitcast float** %58 to i64*
  %60 = load i64, i64* %59, align 8, !tbaa !80
  %61 = bitcast float** %57 to i64*
  store i64 %60, i64* %61, align 8, !tbaa !82
  %62 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 3
  store %"class.Eigen::TensorEvalToOp.88"* %0, %"class.Eigen::TensorEvalToOp.88"** %62, align 8, !tbaa !2
  %63 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 4
  %64 = bitcast %"class.Eigen::TensorCwiseUnaryOp.43"* %63 to i8*
  %65 = bitcast %"class.Eigen::TensorEvalToOp.88"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %64, i8* nonnull %65, i64 16, i32 8, i1 false)
  %66 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %23, align 8, !tbaa !2
  %67 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %66, i64 0, i32 0
  %68 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %67, align 8, !tbaa !40
  %69 = bitcast %"class.Eigen::StreamInterface"* %68 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %70 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %69, align 8, !tbaa !42
  %71 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %70, i64 3
  %72 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %71, align 8
  %73 = invoke dereferenceable(352) %struct.cudaDeviceProp* %72(%"class.Eigen::StreamInterface"* %68)
          to label %74 unwind label %147

; <label>:74:                                     ; preds = %2
  %75 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %76 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %75, align 8, !tbaa !40
  %77 = bitcast %"class.Eigen::StreamInterface"* %76 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %78 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %77, align 8, !tbaa !42
  %79 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %78, i64 3
  %80 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %79, align 8
  %81 = invoke dereferenceable(352) %struct.cudaDeviceProp* %80(%"class.Eigen::StreamInterface"* %76)
          to label %82 unwind label %149

; <label>:82:                                     ; preds = %74
  %83 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %81, i64 0, i32 5
  %84 = load i32, i32* %83, align 8, !tbaa !46
  %85 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %75, align 8, !tbaa !40
  %86 = bitcast %"class.Eigen::StreamInterface"* %85 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %87 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %86, align 8, !tbaa !42
  %88 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %87, i64 3
  %89 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %88, align 8
  %90 = invoke dereferenceable(352) %struct.cudaDeviceProp* %89(%"class.Eigen::StreamInterface"* %85)
          to label %91 unwind label %151

; <label>:91:                                     ; preds = %82
  %92 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %90, i64 0, i32 10
  %93 = load i32, i32* %92, align 4, !tbaa !49
  %94 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %75, align 8, !tbaa !40
  %95 = bitcast %"class.Eigen::StreamInterface"* %94 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %96 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %95, align 8, !tbaa !42
  %97 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %96, i64 3
  %98 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %97, align 8
  %99 = invoke dereferenceable(352) %struct.cudaDeviceProp* %98(%"class.Eigen::StreamInterface"* %94)
          to label %100 unwind label %151

; <label>:100:                                    ; preds = %91
  %101 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %99, i64 0, i32 8
  %102 = load i32, i32* %101, align 4, !tbaa !50
  %103 = mul nsw i32 %102, %93
  %104 = sdiv i32 %103, %84
  %105 = load i32, i32* %8, align 4, !tbaa !26
  %106 = add i32 %84, -1
  %107 = add i32 %106, %105
  %108 = sdiv i32 %107, %84
  %109 = icmp slt i32 %108, %104
  %110 = select i1 %109, i32 %108, i32 %104
  %111 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %75, align 8, !tbaa !40
  %112 = bitcast %"class.Eigen::StreamInterface"* %111 to i8** (%"class.Eigen::StreamInterface"*)***
  %113 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %112, align 8, !tbaa !42
  %114 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %113, i64 2
  %115 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %114, align 8
  %116 = invoke dereferenceable(8) i8** %115(%"class.Eigen::StreamInterface"* %111)
          to label %117 unwind label %153

; <label>:117:                                    ; preds = %100
  %118 = zext i32 %84 to i64
  %119 = or i64 %118, 4294967296
  %120 = icmp sgt i32 %110, 1
  %121 = select i1 %120, i32 %110, i32 1
  %122 = zext i32 %121 to i64
  %123 = or i64 %122, 4294967296
  %124 = load i8*, i8** %116, align 8, !tbaa !51
  %125 = invoke i32 @cudaConfigureCall(i64 %123, i32 1, i64 %119, i32 1, i64 0, i8* %124)
          to label %126 unwind label %153

; <label>:126:                                    ; preds = %117
  %127 = icmp eq i32 %125, 0
  br i1 %127, label %128, label %158

; <label>:128:                                    ; preds = %126
  %129 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %5, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  %130 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %4, i64 0, i32 0, i32 1, i32 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %129, i8* %130, i64 80, i32 8, i1 false)
  %131 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %5, i64 0, i32 1
  %132 = bitcast %"struct.Eigen::GpuDevice"** %131 to i8*
  %133 = bitcast %"struct.Eigen::GpuDevice"** %56 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %132, i8* %133, i64 24, i32 8, i1 false)
  %134 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %5, i64 0, i32 4
  %135 = bitcast %"class.Eigen::TensorCwiseUnaryOp.43"* %134 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* nonnull %64, i64 16, i32 8, i1 false)
  %136 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %136)
  store i32 %105, i32* %3, align 4, !tbaa !26
  %137 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %5, i64 0, i32 0, i32 0, i32 0
  %138 = invoke i32 @cudaSetupArgument(i8* nonnull %137, i64 136, i64 0)
          to label %139 unwind label %155

; <label>:139:                                    ; preds = %128
  %140 = icmp eq i32 %138, 0
  br i1 %140, label %141, label %157

; <label>:141:                                    ; preds = %139
  %142 = invoke i32 @cudaSetupArgument(i8* nonnull %136, i64 4, i64 136)
          to label %143 unwind label %155

; <label>:143:                                    ; preds = %141
  %144 = icmp eq i32 %142, 0
  br i1 %144, label %145, label %157

; <label>:145:                                    ; preds = %143
  %146 = invoke i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.90"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESG_EEEESG_EENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
          to label %157 unwind label %155

; <label>:147:                                    ; preds = %2
  %148 = landingpad { i8*, i32 }
          cleanup
  br label %178

; <label>:149:                                    ; preds = %74, %167
  %150 = landingpad { i8*, i32 }
          cleanup
  br label %178

; <label>:151:                                    ; preds = %91, %82
  %152 = landingpad { i8*, i32 }
          cleanup
  br label %178

; <label>:153:                                    ; preds = %100, %162, %158, %117
  %154 = landingpad { i8*, i32 }
          cleanup
  br label %178

; <label>:155:                                    ; preds = %145, %141, %128
  %156 = landingpad { i8*, i32 }
          cleanup
  br label %178

; <label>:157:                                    ; preds = %143, %139, %145
  call void @llvm.lifetime.end(i64 4, i8* nonnull %136)
  br label %158

; <label>:158:                                    ; preds = %126, %157
  %159 = invoke i64 @cudaGetLastError()
          to label %160 unwind label %153

; <label>:160:                                    ; preds = %158
  %161 = icmp eq i64 %159, 0
  br i1 %161, label %164, label %162, !prof !52

; <label>:162:                                    ; preds = %160
  invoke void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_20scalar_difference_opIKfSA_EEKNS3_INS4_ISA_Li2ELi1EiEELi16ES6_EEKNS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISI_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS0_10MaxReducerIfEEKNSG_IiLi1EEESE_S6_EEEEEEEEEEEENS_9GpuDeviceELb1EE3runERS11_RKS12_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #5
          to label %163 unwind label %153

; <label>:163:                                    ; preds = %162
  unreachable

; <label>:164:                                    ; preds = %160
  %165 = load float*, float** %22, align 8, !tbaa !72
  %166 = icmp eq float* %165, null
  br i1 %166, label %177, label %167

; <label>:167:                                    ; preds = %164
  %168 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %23, align 8, !tbaa !2
  %169 = bitcast float* %165 to i8*
  %170 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %168, i64 0, i32 0
  %171 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %170, align 8, !tbaa !40
  %172 = bitcast %"class.Eigen::StreamInterface"* %171 to void (%"class.Eigen::StreamInterface"*, i8*)***
  %173 = load void (%"class.Eigen::StreamInterface"*, i8*)**, void (%"class.Eigen::StreamInterface"*, i8*)*** %172, align 8, !tbaa !42
  %174 = getelementptr inbounds void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %173, i64 5
  %175 = load void (%"class.Eigen::StreamInterface"*, i8*)*, void (%"class.Eigen::StreamInterface"*, i8*)** %174, align 8
  invoke void %175(%"class.Eigen::StreamInterface"* %171, i8* %169)
          to label %176 unwind label %149

; <label>:176:                                    ; preds = %167
  store float* null, float** %22, align 8, !tbaa !72
  br label %177

; <label>:177:                                    ; preds = %176, %164
  call void @llvm.lifetime.end(i64 136, i8* nonnull %6) #4
  ret void

; <label>:178:                                    ; preds = %153, %155, %149, %151, %147
  %179 = phi { i8*, i32 } [ %154, %153 ], [ %156, %155 ], [ %150, %149 ], [ %152, %151 ], [ %148, %147 ]
  call void @llvm.lifetime.end(i64 136, i8* nonnull %6) #4
  resume { i8*, i32 } %179
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESG_EEEESG_EENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.90"*, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %0, i64 0, i32 0, i32 0, i32 0
  %5 = tail call i32 @cudaSetupArgument(i8* %4, i64 136, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 136)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator.90"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS0_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS0_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESG_EEEESG_EENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
  ret void
}

attributes #0 = { ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
!5 = !{!6, !8}
!6 = distinct !{!6, !7, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EE10binaryExprINS_8internal20scalar_difference_opIS3_S3_EENS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISF_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS9_10MaxReducerIfEEKNSD_IiLi1EEEKS6_S5_EEEEEEEEEEKNS_19TensorCwiseBinaryOpIT_SN_KT0_EERSY_RKSW_: argument 0"}
!7 = distinct !{!7, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EE10binaryExprINS_8internal20scalar_difference_opIS3_S3_EENS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISF_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS9_10MaxReducerIfEEKNSD_IiLi1EEEKS6_S5_EEEEEEEEEEKNS_19TensorCwiseBinaryOpIT_SN_KT0_EERSY_RKSW_"}
!8 = distinct !{!8, !9, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EEmiINS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISC_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNSA_IiLi1EEEKS6_S5_EEEEEEEEEEKNS_19TensorCwiseBinaryOpINSG_20scalar_difference_opIS3_S3_EESL_KT_EERSX_: argument 0"}
!9 = distinct !{!9, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EEmiINS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISC_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNSA_IiLi1EEEKS6_S5_EEEEEEEEEEKNS_19TensorCwiseBinaryOpINSG_20scalar_difference_opIS3_S3_EESL_KT_EERSX_"}
!10 = !{!11, !13}
!11 = distinct !{!11, !12, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EE10binaryExprINS_8internal20scalar_difference_opIffEENS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS8_13scalar_log_opIfEEKNS_17TensorReshapingOpISE_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS8_10SumReducerIfEEKNSC_IiLi1EEEKNSF_INS8_13scalar_exp_opIfEEKS5_EES4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpIT_SR_KT0_EERS16_RKS14_: argument 0"}
!12 = distinct !{!12, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EE10binaryExprINS_8internal20scalar_difference_opIffEENS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS8_13scalar_log_opIfEEKNS_17TensorReshapingOpISE_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS8_10SumReducerIfEEKNSC_IiLi1EEEKNSF_INS8_13scalar_exp_opIfEEKS5_EES4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpIT_SR_KT0_EERS16_RKS14_"}
!13 = distinct !{!13, !14, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EEmiINS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS_8internal13scalar_log_opIfEEKNS_17TensorReshapingOpISB_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINSD_10SumReducerIfEEKNS9_IiLi1EEEKNSC_INSD_13scalar_exp_opIfEEKS5_EES4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpINSD_20scalar_difference_opIffEESP_KT_EERS15_: argument 0"}
!14 = distinct !{!14, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EEmiINS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_18TensorCwiseUnaryOpINS_8internal13scalar_log_opIfEEKNS_17TensorReshapingOpISB_KNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINSD_10SumReducerIfEEKNS9_IiLi1EEEKNSC_INSD_13scalar_exp_opIfEEKS5_EES4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpINSD_20scalar_difference_opIffEESP_KT_EERS15_"}
!15 = !{!16, !18}
!16 = distinct !{!16, !17, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EE10binaryExprINS_8internal17scalar_product_opIffEENS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISE_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS8_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS8_10SumReducerIfEEKNSC_IiLi1EEEKS5_S4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpIT_SP_KT0_EERS12_RKS10_: argument 0"}
!17 = distinct !{!17, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EE10binaryExprINS_8internal17scalar_product_opIffEENS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISE_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS8_17scalar_inverse_opIfEEKNS_17TensorReductionOpINS8_10SumReducerIfEEKNSC_IiLi1EEEKS5_S4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpIT_SP_KT0_EERS12_RKS10_"}
!18 = distinct !{!18, !19, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EEmlINS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISB_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINSF_10SumReducerIfEEKNS9_IiLi1EEEKS5_S4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpINSF_17scalar_product_opIffEESN_KT_EERS11_: argument 0"}
!19 = distinct !{!19, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEELi0EEmlINS_20TensorBroadcastingOpIKNS_6DSizesIiLi2EEEKNS_17TensorReshapingOpISB_KNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINSF_10SumReducerIfEEKNS9_IiLi1EEEKS5_S4_EEEEEEEEEEEEKNS_19TensorCwiseBinaryOpINSF_17scalar_product_opIffEESN_KT_EERS11_"}
!20 = !{!21, !22, i64 0}
!21 = !{!"_ZTSN5Eigen9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEE", !22, i64 0, !23, i64 8}
!22 = !{!"any pointer", !3, i64 0}
!23 = !{!"_ZTSN5Eigen6DSizesIiLi2EEE"}
!24 = !{!25, !22, i64 0}
!25 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !22, i64 0, !23, i64 8, !3, i64 16, !3, i64 24}
!26 = !{!27, !27, i64 0}
!27 = !{!"int", !3, i64 0}
!28 = !{!29, !22, i64 64}
!29 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EENS_9GpuDeviceEEE", !30, i64 0, !31, i64 4, !32, i64 8, !32, i64 12, !32, i64 16, !32, i64 20, !25, i64 24, !33, i64 56, !22, i64 64, !3, i64 72}
!30 = !{!"_ZTSN5Eigen5arrayIbLm2EEE", !3, i64 0}
!31 = !{!"_ZTSN5Eigen6DSizesIiLi1EEE"}
!32 = !{!"_ZTSN5Eigen5arrayIiLm1EEE", !3, i64 0}
!33 = !{!"_ZTSN5Eigen8internal10MaxReducerIfEE"}
!34 = !{!35, !35, i64 0}
!35 = !{!"bool", !3, i64 0}
!36 = !{i8 0, i8 2}
!37 = !{!38, !22, i64 104}
!38 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EEEENS_9GpuDeviceEEE", !29, i64 0, !39, i64 80, !3, i64 96, !22, i64 104}
!39 = !{!"_ZTSN5Eigen17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESB_EE", !3, i64 0, !31, i64 8, !33, i64 12}
!40 = !{!41, !22, i64 0}
!41 = !{!"_ZTSN5Eigen9GpuDeviceE", !22, i64 0, !27, i64 8}
!42 = !{!43, !43, i64 0}
!43 = !{!"vtable pointer", !4, i64 0}
!44 = !{!45, !22, i64 16}
!45 = !{!"_ZTSN5Eigen14TensorEvalToOpIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESC_EESC_EE", !39, i64 0, !22, i64 16}
!46 = !{!47, !27, i64 32}
!47 = !{!"_ZTS14cudaDeviceProp", !48, i64 0, !48, i64 8, !48, i64 16, !27, i64 24, !27, i64 28, !27, i64 32, !3, i64 36, !3, i64 48, !27, i64 60, !27, i64 64, !27, i64 68, !27, i64 72, !27, i64 76, !27, i64 80, !27, i64 84, !27, i64 88, !3, i64 92}
!48 = !{!"long", !3, i64 0}
!49 = !{!47, !27, i64 68}
!50 = !{!47, !27, i64 60}
!51 = !{!22, !22, i64 0}
!52 = !{!"branch_weights", i32 2000, i32 1}
!53 = !{!54, !22, i64 88}
!54 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS_8internal10MaxReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EESD_EENS_9GpuDeviceEEE", !29, i64 0, !3, i64 80, !22, i64 88, !3, i64 96, !39, i64 104}
!55 = !{!56, !22, i64 0}
!56 = !{!"_ZTSN5Eigen9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEE", !22, i64 0, !23, i64 8}
!57 = !{!58, !22, i64 0}
!58 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !22, i64 0, !23, i64 8, !3, i64 16, !3, i64 24}
!59 = !{!60, !22, i64 72}
!60 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS2_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESE_EENS_9GpuDeviceEEE", !30, i64 0, !31, i64 4, !32, i64 8, !32, i64 12, !32, i64 16, !32, i64 20, !61, i64 24, !63, i64 64, !22, i64 72, !3, i64 80}
!61 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEEE", !62, i64 0, !58, i64 8}
!62 = !{!"_ZTSN5Eigen8internal13scalar_exp_opIfEE"}
!63 = !{!"_ZTSN5Eigen8internal10SumReducerIfEE"}
!64 = !{!65, !22, i64 120}
!65 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS3_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EEEENS_9GpuDeviceEEE", !60, i64 0, !66, i64 88, !3, i64 112, !22, i64 120}
!66 = !{!"_ZTSN5Eigen17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS1_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESD_EE", !67, i64 0, !31, i64 16, !63, i64 20}
!67 = !{!"_ZTSN5Eigen18TensorCwiseUnaryOpINS_8internal13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEE", !3, i64 0, !62, i64 8}
!68 = !{!69, !22, i64 24}
!69 = !{!"_ZTSN5Eigen14TensorEvalToOpIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS2_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESE_EESE_EE", !66, i64 0, !22, i64 24}
!70 = !{!71, !22, i64 96}
!71 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_18TensorCwiseUnaryOpINS3_13scalar_exp_opIfEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEEEESF_EESF_EENS_9GpuDeviceEEE", !60, i64 0, !3, i64 88, !22, i64 96, !3, i64 104, !66, i64 112}
!72 = !{!73, !22, i64 64}
!73 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESB_EENS_9GpuDeviceEEE", !30, i64 0, !31, i64 4, !32, i64 8, !32, i64 12, !32, i64 16, !32, i64 20, !58, i64 24, !63, i64 56, !22, i64 64, !3, i64 72}
!74 = !{!75, !22, i64 120}
!75 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorForcedEvalOpIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS3_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESF_EEEEEENS_9GpuDeviceEEE", !76, i64 0, !78, i64 88, !3, i64 112, !22, i64 120}
!76 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS2_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EEEENS_9GpuDeviceEEE", !77, i64 0, !73, i64 8}
!77 = !{!"_ZTSN5Eigen8internal17scalar_inverse_opIfEE"}
!78 = !{!"_ZTSN5Eigen18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS1_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESD_EEEE", !79, i64 0, !77, i64 16}
!79 = !{!"_ZTSN5Eigen17TensorReductionOpINS_8internal10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESA_EE", !3, i64 0, !31, i64 8, !63, i64 12}
!80 = !{!81, !22, i64 24}
!81 = !{!"_ZTSN5Eigen14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS2_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESE_EEEESE_EE", !78, i64 0, !22, i64 24}
!82 = !{!83, !22, i64 96}
!83 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_18TensorCwiseUnaryOpINS_8internal17scalar_inverse_opIfEEKNS_17TensorReductionOpINS3_10SumReducerIfEEKNS_6DSizesIiLi1EEEKNS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16ENS_11MakePointerEEESF_EEEESF_EENS_9GpuDeviceEEE", !76, i64 0, !3, i64 88, !22, i64 96, !3, i64 104, !78, i64 112}
