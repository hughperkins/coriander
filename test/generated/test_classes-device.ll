; ModuleID = 'test/test_classes.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"class.mynamespace::Bar" = type { %"class.mynamespace::subnamespace::Foo", %"class.mynamespace::subnamespace::Foo", i32 }
%"class.mynamespace::subnamespace::Foo" = type { i32 }
%"class.mynamespace::Templated" = type { %"class.mynamespace::subnamespace::Foo", float }

$_Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi = comdat any

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
define weak_odr void @_Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(%"class.mynamespace::Bar"* byval nocapture align 4 %bar, %"class.mynamespace::Templated"* byval nocapture readonly align 4 %t, float* nocapture %data, i32* nocapture %int_data) #1 comdat {
  %1 = getelementptr inbounds %"class.mynamespace::Bar", %"class.mynamespace::Bar"* %bar, i64 0, i32 0, i32 0
  store i32 123, i32* %1, align 4, !tbaa !7
  %2 = getelementptr inbounds %"class.mynamespace::Templated", %"class.mynamespace::Templated"* %t, i64 0, i32 1
  %3 = bitcast float* %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !12
  %5 = bitcast float* %data to i32*
  store i32 %4, i32* %5, align 4, !tbaa !15
  %6 = getelementptr inbounds %"class.mynamespace::Bar", %"class.mynamespace::Bar"* %bar, i64 0, i32 2
  %7 = load i32, i32* %6, align 4, !tbaa !16
  store i32 %7, i32* %int_data, align 4, !tbaa !18
  ret void
}

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !1, !3, !3, !3, !3, !4, !4, !3}
!llvm.ident = !{!5}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!6}

!0 = !{void (%"class.mynamespace::Bar"*, %"class.mynamespace::Templated"*, float*, i32*)* @_Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi, !"kernel", i32 1}
!1 = !{null, !"align", i32 8}
!2 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!3 = !{null, !"align", i32 16}
!4 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!5 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!6 = !{i32 1, i32 2}
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTSN11mynamespace12subnamespace3FooE", !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !14, i64 4}
!13 = !{!"_ZTSN11mynamespace9TemplatedIfEE", !14, i64 4}
!14 = !{!"float", !10, i64 0}
!15 = !{!14, !14, i64 0}
!16 = !{!17, !9, i64 8}
!17 = !{!"_ZTSN11mynamespace3BarE", !8, i64 4, !9, i64 8}
!18 = !{!9, !9, i64 0}
