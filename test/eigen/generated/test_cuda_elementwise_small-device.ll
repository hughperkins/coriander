; ModuleID = 'test/eigen/test_cuda_elementwise_small.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.1" }
%"struct.Eigen::TensorEvaluator.0" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [1 x i64] }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::TensorEvaluator.1" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::internal::scalar_sum_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.2" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

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
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #3
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #3
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #3
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #3
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = sdiv i64 %size, 4
  %11 = shl nsw i64 %10, 2
  %12 = shl nuw nsw i64 %9, 2
  %13 = shl nuw nsw i64 %6, 2
  %14 = icmp slt i64 %13, %11
  br i1 %14, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 1, i32 0
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 2, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 0, i32 0
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
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 1, i32 0
  %24 = load float*, float** %23, align 8
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 2, i32 0
  %26 = load float*, float** %25, align 8
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 0, i32 0
  %28 = load float*, float** %27, align 8
  br label %56

; <label>:29                                      ; preds = %29, %.lr.ph5.i
  %i.03.i = phi i64 [ %13, %.lr.ph5.i ], [ %54, %29 ]
  %30 = getelementptr inbounds float, float* %18, i64 %i.03.i
  %31 = load float, float* %30, align 4, !tbaa !8
  %32 = getelementptr inbounds float, float* %30, i64 1
  %33 = load float, float* %32, align 4, !tbaa !8
  %34 = getelementptr inbounds float, float* %30, i64 2
  %35 = load float, float* %34, align 4, !tbaa !8
  %36 = getelementptr inbounds float, float* %30, i64 3
  %37 = load float, float* %36, align 4, !tbaa !8
  %38 = getelementptr inbounds float, float* %19, i64 %i.03.i
  %39 = load float, float* %38, align 4, !tbaa !8
  %40 = getelementptr inbounds float, float* %38, i64 1
  %41 = load float, float* %40, align 4, !tbaa !8
  %42 = getelementptr inbounds float, float* %38, i64 2
  %43 = load float, float* %42, align 4, !tbaa !8
  %44 = getelementptr inbounds float, float* %38, i64 3
  %45 = load float, float* %44, align 4, !tbaa !8
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
  %.val.i.i.i.i = load float, float* %57, align 4, !tbaa !8
  %58 = getelementptr inbounds float, float* %26, i64 %i1.02.i
  %.val.i1.i.i.i = load float, float* %58, align 4, !tbaa !8
  %59 = fadd float %.val.i.i.i.i, %.val.i1.i.i.i
  %60 = getelementptr inbounds float, float* %28, i64 %i1.02.i
  store float %59, float* %60, align 4, !tbaa !8
  %61 = add nsw i64 %i1.02.i, %9
  %62 = icmp slt i64 %61, %size
  br i1 %62, label %56, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit.loopexit: ; preds = %56
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll.exit.loopexit, %._crit_edge6.i
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

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !2, !4, !4, !4, !4, !5, !5, !4}
!llvm.ident = !{!6}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!7}

!0 = !{void (%"struct.Eigen::TensorEvaluator"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!1 = !{void (%"struct.Eigen::TensorEvaluator"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!2 = !{null, !"align", i32 8}
!3 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!4 = !{null, !"align", i32 16}
!5 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!6 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!7 = !{i32 1, i32 2}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
