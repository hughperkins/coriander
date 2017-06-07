; ModuleID = 'bazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device-noopt.ll'
source_filename = "tensorflow/core/kernels/split_lib_gpu.cu.cc"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::TensorEvaluator.0" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap"* }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [3 x i32] }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"class.Eigen::TensorMap" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%"struct.Eigen::TensorEvaluator.2" = type { %"class.Eigen::array", %"class.Eigen::array.3", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.4", %"struct.Eigen::GpuDevice"*, %"struct.Eigen::DSizes", %"struct.Eigen::DSizes" }
%"class.Eigen::array.3" = type { [3 x %"struct.Eigen::internal::TensorIntDivisor"] }
%"struct.Eigen::internal::TensorIntDivisor" = type { i32, i32, i32 }
%"struct.Eigen::TensorEvaluator.4" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.5"* }
%"class.Eigen::TensorMap.5" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%"struct.tensorflow::CudaDeviceArrayStruct" = type { i32, [8 x float*], float** }

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE = comdat any

@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: norecurse nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  ret i32 0
}

; Function Attrs: convergent nounwind
define void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8, i32) local_unnamed_addr #1 comdat {
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !6
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !7
  %5 = mul i32 %4, %3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !8
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !9
  %9 = mul i32 %8, %4
  %10 = icmp slt i32 %7, %1
  br i1 %10, label %11, label %.loopexit

; <label>:11:                                     ; preds = %2
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 0, i64 0, i32 0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 0, i64 0, i32 1
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 0, i64 0, i32 2
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 6, i32 0, i32 0, i64 0
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 2, i32 0, i64 0
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 0, i32 0, i64 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 0, i64 1, i32 0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 0, i64 1, i32 1
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 1, i32 0, i64 1, i32 2
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 6, i32 0, i32 0, i64 1
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 2, i32 0, i64 1
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 0, i32 0, i64 1
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 6, i32 0, i32 0, i64 2
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 1, i32 3, i32 0
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i64 0, i32 0, i32 0
  %27 = load float*, float** %26, align 8
  %28 = load i32, i32* %12, align 4, !tbaa !10
  %29 = load i32, i32* %13, align 4, !tbaa !15
  %30 = load i32, i32* %14, align 4, !tbaa !16
  %31 = load i32, i32* %15, align 4, !tbaa !17
  %32 = load i32, i32* %16, align 8, !tbaa !17
  %33 = load i32, i32* %17, align 8, !tbaa !17
  %34 = load i32, i32* %18, align 4, !tbaa !10
  %35 = load i32, i32* %19, align 4, !tbaa !15
  %36 = load i32, i32* %20, align 4, !tbaa !16
  %37 = load i32, i32* %21, align 4, !tbaa !17
  %38 = load i32, i32* %22, align 4, !tbaa !17
  %39 = load i32, i32* %23, align 4, !tbaa !17
  %40 = load i32, i32* %24, align 4, !tbaa !17
  %41 = load float*, float** %25, align 8, !tbaa !18
  br label %42

; <label>:42:                                     ; preds = %42, %11
  %43 = phi i32 [ %7, %11 ], [ %72, %42 ]
  %44 = tail call i32 @_Z8__umulhiii(i32 %28, i32 %43) #6
  %45 = sub i32 %43, %44
  %46 = lshr i32 %45, %29
  %47 = add i32 %46, %44
  %48 = lshr i32 %47, %30
  %49 = add nsw i32 %48, %31
  %50 = mul nsw i32 %49, %32
  %51 = mul nsw i32 %48, %33
  %52 = sub nsw i32 %43, %51
  %53 = tail call i32 @_Z8__umulhiii(i32 %34, i32 %52) #6
  %54 = sub i32 %52, %53
  %55 = lshr i32 %54, %35
  %56 = add i32 %55, %53
  %57 = lshr i32 %56, %36
  %58 = add nsw i32 %57, %37
  %59 = mul nsw i32 %58, %38
  %60 = mul nsw i32 %57, %39
  %61 = add i32 %50, %40
  %62 = add i32 %61, %52
  %63 = sub i32 %62, %60
  %64 = add i32 %63, %59
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %41, i64 %65
  %67 = bitcast float* %66 to i32*
  %68 = load i32, i32* %67, align 4, !tbaa !22
  %69 = sext i32 %43 to i64
  %70 = getelementptr inbounds float, float* %27, i64 %69
  %71 = bitcast float* %70 to i32*
  store i32 %68, i32* %71, align 4, !tbaa !22
  %72 = add nsw i32 %43, %9
  %73 = icmp slt i32 %72, %1
  br i1 %73, label %42, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %42
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #2

; Function Attrs: convergent nounwind
declare i32 @_Z8__umulhiii(i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
define void @_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE(float* nocapture readonly, i32, i32, i32, %"struct.tensorflow::CudaDeviceArrayStruct"* byval nocapture readonly align 8) local_unnamed_addr #4 comdat {
  %6 = getelementptr inbounds %"struct.tensorflow::CudaDeviceArrayStruct", %"struct.tensorflow::CudaDeviceArrayStruct"* %4, i64 0, i32 0
  %7 = load i32, i32* %6, align 8, !tbaa !24
  %8 = icmp slt i32 %7, 9
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %"struct.tensorflow::CudaDeviceArrayStruct", %"struct.tensorflow::CudaDeviceArrayStruct"* %4, i64 0, i32 1, i64 0
  br label %14

; <label>:11:                                     ; preds = %5
  %12 = getelementptr inbounds %"struct.tensorflow::CudaDeviceArrayStruct", %"struct.tensorflow::CudaDeviceArrayStruct"* %4, i64 0, i32 2
  %13 = load float**, float*** %12, align 8, !tbaa !26
  br label %14

; <label>:14:                                     ; preds = %11, %9
  %15 = phi float** [ %10, %9 ], [ %13, %11 ]
  %16 = mul nsw i32 %2, %1
  %17 = mul nsw i32 %16, %3
  %18 = sdiv i32 %2, %7
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !6
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !7
  %21 = mul i32 %20, %19
  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !8
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %17
  br i1 %24, label %25, label %.loopexit

; <label>:25:                                     ; preds = %14
  %26 = mul nsw i32 %3, %2
  %27 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !9
  %28 = mul i32 %27, %20
  br label %29

.loopexit.loopexit:                               ; preds = %29
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %14
  ret void

; <label>:29:                                     ; preds = %29, %25
  %30 = phi i32 [ %23, %25 ], [ %51, %29 ]
  %31 = sdiv i32 %30, %26
  %32 = srem i32 %30, %26
  %33 = sdiv i32 %32, %3
  %34 = srem i32 %30, %3
  %35 = sdiv i32 %33, %18
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float*, float** %15, i64 %36
  %38 = load float*, float** %37, align 8, !tbaa !27
  %39 = mul nsw i32 %31, %18
  %40 = srem i32 %33, %18
  %41 = add i32 %40, %39
  %42 = mul i32 %41, %3
  %43 = add nsw i32 %42, %34
  %44 = sext i32 %30 to i64
  %45 = getelementptr inbounds float, float* %0, i64 %44
  %46 = bitcast float* %45 to i32*
  %47 = load i32, i32* %46, align 4, !tbaa !22
  %48 = sext i32 %43 to i64
  %49 = getelementptr inbounds float, float* %38, i64 %48
  %50 = bitcast float* %49 to i32*
  store i32 %47, i32* %50, align 4, !tbaa !22
  %51 = add i32 %30, %28
  %52 = icmp slt i32 %51, %17
  br i1 %52, label %29, label %.loopexit.loopexit
}

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { convergent nounwind }

!nvvm.annotations = !{!0, !1, !2}
!llvm.module.flags = !{!3, !4}
!llvm.ident = !{!5}

!0 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!1 = !{void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!2 = !{void (float*, i32, i32, i32, %"struct.tensorflow::CudaDeviceArrayStruct"*)* @_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE, !"kernel", i32 1}
!3 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!4 = !{i32 1, !"PIC Level", i32 2}
!5 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!6 = !{i32 0, i32 2147483647}
!7 = !{i32 1, i32 1025}
!8 = !{i32 0, i32 1024}
!9 = !{i32 1, i32 -2147483648}
!10 = !{!11, !12, i64 0}
!11 = !{!"_ZTSN5Eigen8internal16TensorIntDivisorIiLb0EEE", !12, i64 0, !12, i64 4, !12, i64 8}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!11, !12, i64 4}
!16 = !{!11, !12, i64 8}
!17 = !{!12, !12, i64 0}
!18 = !{!19, !20, i64 0}
!19 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !20, i64 0, !21, i64 8, !13, i64 24, !13, i64 32}
!20 = !{!"any pointer", !13, i64 0}
!21 = !{!"_ZTSN5Eigen6DSizesIiLi3EEE"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !13, i64 0}
!24 = !{!25, !12, i64 0}
!25 = !{!"_ZTSN10tensorflow21CudaDeviceArrayStructIPfLi8EEE", !12, i64 0, !13, i64 8, !20, i64 72}
!26 = !{!25, !20, i64 72}
!27 = !{!20, !20, i64 0}
