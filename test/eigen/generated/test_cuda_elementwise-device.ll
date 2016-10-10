; ModuleID = 'test/eigen/test_cuda_elementwise.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.1" }
%"struct.Eigen::TensorEvaluator.0" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [3 x i64] }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::TensorEvaluator.1" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.3" }
%"struct.Eigen::internal::scalar_sum_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.2" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.3" = type { %"struct.Eigen::internal::scalar_product_op", %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::internal::scalar_product_op" = type { i8 }

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

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
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8 %eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #3
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #3
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #3
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #3
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %size
  br i1 %10, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

.lr.ph.i:                                         ; preds = %0
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 1, i32 0
  %12 = load float*, float** %11, align 8
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0
  %14 = load float*, float** %13, align 8
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0
  %16 = load float*, float** %15, align 8
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 0, i32 0
  %18 = load float*, float** %17, align 8
  br label %19

; <label>:19                                      ; preds = %19, %.lr.ph.i
  %i.01.i = phi i64 [ %6, %.lr.ph.i ], [ %26, %19 ]
  %20 = getelementptr inbounds float, float* %12, i64 %i.01.i
  %.val.i.i.i.i = load float, float* %20, align 4, !tbaa !8
  %21 = getelementptr inbounds float, float* %14, i64 %i.01.i
  %.val.i.i.i.i.i = load float, float* %21, align 4, !tbaa !8
  %22 = getelementptr inbounds float, float* %16, i64 %i.01.i
  %.val.i1.i.i.i.i = load float, float* %22, align 4, !tbaa !8
  %23 = fmul float %.val.i.i.i.i.i, %.val.i1.i.i.i.i
  %24 = fadd float %.val.i.i.i.i, %23
  %25 = getelementptr inbounds float, float* %18, i64 %i.01.i
  store float %24, float* %25, align 4, !tbaa !8
  %26 = add nuw nsw i64 %i.01.i, %9
  %27 = icmp slt i64 %26, %size
  br i1 %27, label %19, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit: ; preds = %19
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll.exit.loopexit, %0
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

!0 = !{void (%"struct.Eigen::TensorEvaluator"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!1 = !{void (%"struct.Eigen::TensorEvaluator"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
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
