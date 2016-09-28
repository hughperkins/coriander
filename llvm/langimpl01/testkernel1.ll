; ModuleID = 'testkernel1.cl'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-nvcl"

; Function Attrs: noinline nounwind
define void @foo(float addrspace(1)* nocapture %data, i32 %N) #0 {
  %1 = tail call i64 @get_global_id(i32 0) #2
  %2 = trunc i64 %1 to i32
  %3 = icmp slt i32 %2, %N
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %sext = shl i64 %1, 32
  %5 = ashr exact i64 %sext, 32
  %6 = getelementptr inbounds float, float addrspace(1)* %data, i64 %5
  %7 = load float, float addrspace(1)* %6, align 4, !tbaa !8
  %8 = fadd float %7, 3.000000e+00
  store float %8, float addrspace(1)* %6, align 4, !tbaa !8
  br label %9

; <label>:9                                       ; preds = %4, %0
  ret void
}

declare i64 @get_global_id(i32) #1

attributes #0 = { noinline nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!opencl.kernels = !{!0}
!nvvm.annotations = !{!6}
!llvm.ident = !{!7}

!0 = !{void (float addrspace(1)*, i32)* @foo, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"float*", !"int"}
!4 = !{!"kernel_arg_base_type", !"float*", !"int"}
!5 = !{!"kernel_arg_type_qual", !"", !""}
!6 = !{void (float addrspace(1)*, i32)* @foo, !"kernel", i32 1}
!7 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
