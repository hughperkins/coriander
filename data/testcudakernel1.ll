; ModuleID = 'data/testcudakernel1.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #3
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #0

; Function Attrs: norecurse nounwind readnone
define float @_Z3barff(float %a, float %b) #1 {
  %1 = fadd float %a, %b
  ret float %1
}

; Function Attrs: norecurse nounwind
define void @_Z7incrvalPf(float* nocapture %a) #2 {
  %1 = load float, float* %a, align 4, !tbaa !10
  %2 = fadd float %1, 3.000000e+00
  store float %2, float* %a, align 4, !tbaa !10
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11somekernel1Pf(float* nocapture %a) #2 {
  %1 = getelementptr inbounds float, float* %a, i64 1
  %2 = bitcast float* %1 to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !10
  %4 = bitcast float* %a to i32*
  store i32 %3, i32* %4, align 4, !tbaa !10
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z3fooPf(float* nocapture %data) #2 {
  store float 1.230000e+02, float* %data, align 4, !tbaa !10
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z7use_tidPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #4
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !10
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z13use_template1PfPi(float* nocapture %data, i32* nocapture %intdata) #2 {
  %1 = getelementptr inbounds float, float* %data, i64 1
  %2 = load float, float* %1, align 4, !tbaa !10
  %3 = getelementptr inbounds float, float* %data, i64 2
  %4 = load float, float* %3, align 4, !tbaa !10
  %5 = fadd float %2, %4
  store float %5, float* %data, align 4, !tbaa !10
  %6 = getelementptr inbounds i32, i32* %intdata, i64 1
  %7 = load i32, i32* %6, align 4, !tbaa !14
  %8 = getelementptr inbounds i32, i32* %intdata, i64 2
  %9 = load i32, i32* %8, align 4, !tbaa !14
  %10 = add nsw i32 %9, %7
  store i32 %10, i32* %intdata, align 4, !tbaa !14
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #3

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !4, !6, !6, !6, !6, !7, !7, !6}
!llvm.ident = !{!8}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!9}

!0 = !{void (float*)* @_Z11somekernel1Pf, !"kernel", i32 1}
!1 = !{void (float*)* @_Z3fooPf, !"kernel", i32 1}
!2 = !{void (float*)* @_Z7use_tidPf, !"kernel", i32 1}
!3 = !{void (float*, i32*)* @_Z13use_template1PfPi, !"kernel", i32 1}
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
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !12, i64 0}
