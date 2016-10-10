; ModuleID = 'test/eigen/test_cuda_nullary.cu'
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

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
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
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #3
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #3
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #3
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #3
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
  store i32 %24, i32* %40, align 4, !tbaa !10
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
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #3
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #3
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #3
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #3
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
  %.promoted = load i64, i64* %13, align 8, !tbaa !14
  br label %21

._crit_edge6.i.loopexit:                          ; preds = %21
  %.lcssa6 = phi i64 [ %62, %21 ]
  store i64 %.lcssa6, i64* %13, align 8, !tbaa !14
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %16 = add nsw i32 %5, %9
  %17 = icmp slt i32 %16, %size
  br i1 %17, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %eval, i64 0, i32 1, i32 0, i32 0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.3", %"struct.Eigen::TensorEvaluator.3"* %eval, i64 0, i32 0, i32 0
  %20 = load float*, float** %19, align 8
  %.promoted.i = load i64, i64* %18, align 8, !tbaa !14
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
  store i64 %.lcssa, i64* %18, align 8, !tbaa !14
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
  store float %94, float* %95, align 4, !tbaa !10
  %96 = add nsw i32 %i1.02.i, %7
  %97 = icmp slt i32 %96, %size
  br i1 %97, label %79, label %._crit_edge.i

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii.exit: ; preds = %._crit_edge6.i, %._crit_edge.i
  ret void
}

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!9}

!0 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!1 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!2 = !{void (%"struct.Eigen::TensorEvaluator.3"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!3 = !{void (%"struct.Eigen::TensorEvaluator.3"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!4 = !{null, !"align", i32 8}
!5 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!6 = !{null, !"align", i32 16}
!7 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!8 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!9 = !{i32 1, i32 2}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!15, !16, i64 0}
!15 = !{!"_ZTSN5Eigen8internal22UniformRandomGeneratorIfEE", !16, i64 0}
!16 = !{!"long", !12, i64 0}
