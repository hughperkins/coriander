; ModuleID = 'llvm-sample.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_threadIdx_t = type { i8 }

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)) #3
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #1

define void @_Z4axpyfPfS_(float %a, float* %x, float* %y) #2 {
  %1 = alloca float, align 4
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  store float %a, float* %1, align 4
  store float* %x, float** %2, align 8
  store float* %y, float** %3, align 8
  %4 = load float, float* %1, align 4
  %5 = call i32 @llvm.ptx.read.tid.x() #4
  %6 = zext i32 %5 to i64
  %7 = load float*, float** %2, align 8
  %8 = getelementptr inbounds float, float* %7, i64 %6
  %9 = load float, float* %8, align 4
  %10 = fmul float %4, %9
  %11 = call i32 @llvm.ptx.read.tid.x() #4
  %12 = zext i32 %11 to i64
  %13 = load float*, float** %3, align 8
  %14 = getelementptr inbounds float, float* %13, i64 %12
  store float %10, float* %14, align 4
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #3

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !1, !3, !3, !3, !3, !4, !4, !3}
!llvm.ident = !{!5}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!6}

!0 = !{void (float, float*, float*)* @_Z4axpyfPfS_, !"kernel", i32 1}
!1 = !{null, !"align", i32 8}
!2 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!3 = !{null, !"align", i32 16}
!4 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!5 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!6 = !{i32 1, i32 2}
