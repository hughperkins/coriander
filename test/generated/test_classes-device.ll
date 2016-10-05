; ModuleID = 'test/test_classes.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"class.mynamespace::Bar" = type { %"class.mynamespace::subnamespace::Foo", %"class.mynamespace::subnamespace::Foo", i32 }
%"class.mynamespace::subnamespace::Foo" = type { i32 }
%"class.mynamespace::Templated" = type { %"class.mynamespace::subnamespace::Foo", float }
%"class.mynamespace::Templated.0" = type { %"class.mynamespace::subnamespace::Foo", i32 }
%"class.mynamespace::Templated.1" = type { %"class.mynamespace::subnamespace::Foo", double }

$_Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi = comdat any

$_Z11doSomethingIiEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi = comdat any

$_Z11doSomethingIdEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi = comdat any

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
  store i32 123, i32* %1, align 4, !tbaa !9
  %2 = getelementptr inbounds %"class.mynamespace::Templated", %"class.mynamespace::Templated"* %t, i64 0, i32 1
  %3 = bitcast float* %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !14
  %5 = bitcast float* %data to i32*
  store i32 %4, i32* %5, align 4, !tbaa !17
  %6 = getelementptr inbounds %"class.mynamespace::Bar", %"class.mynamespace::Bar"* %bar, i64 0, i32 2
  %7 = load i32, i32* %6, align 4, !tbaa !18
  store i32 %7, i32* %int_data, align 4, !tbaa !20
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_Z11doSomethingIiEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(%"class.mynamespace::Bar"* byval nocapture align 4 %bar, %"class.mynamespace::Templated.0"* byval nocapture readonly align 4 %t, i32* nocapture %data, i32* nocapture %int_data) #1 comdat {
  %1 = getelementptr inbounds %"class.mynamespace::Bar", %"class.mynamespace::Bar"* %bar, i64 0, i32 0, i32 0
  store i32 123, i32* %1, align 4, !tbaa !9
  %2 = getelementptr inbounds %"class.mynamespace::Templated.0", %"class.mynamespace::Templated.0"* %t, i64 0, i32 1
  %3 = load i32, i32* %2, align 4, !tbaa !21
  store i32 %3, i32* %data, align 4, !tbaa !20
  %4 = getelementptr inbounds %"class.mynamespace::Bar", %"class.mynamespace::Bar"* %bar, i64 0, i32 2
  %5 = load i32, i32* %4, align 4, !tbaa !18
  store i32 %5, i32* %int_data, align 4, !tbaa !20
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_Z11doSomethingIdEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(%"class.mynamespace::Bar"* byval nocapture align 4 %bar, %"class.mynamespace::Templated.1"* byval nocapture readonly align 8 %t, double* nocapture %data, i32* nocapture %int_data) #1 comdat {
  %1 = getelementptr inbounds %"class.mynamespace::Bar", %"class.mynamespace::Bar"* %bar, i64 0, i32 0, i32 0
  store i32 123, i32* %1, align 4, !tbaa !9
  %2 = getelementptr inbounds %"class.mynamespace::Templated.1", %"class.mynamespace::Templated.1"* %t, i64 0, i32 1
  %3 = bitcast double* %2 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !23
  %5 = bitcast double* %data to i64*
  store i64 %4, i64* %5, align 8, !tbaa !26
  %6 = getelementptr inbounds %"class.mynamespace::Bar", %"class.mynamespace::Bar"* %bar, i64 0, i32 2
  %7 = load i32, i32* %6, align 4, !tbaa !18
  store i32 %7, i32* %int_data, align 4, !tbaa !20
  ret void
}

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !3, !5, !5, !5, !5, !6, !6, !5}
!llvm.ident = !{!7}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!8}

!0 = !{void (%"class.mynamespace::Bar"*, %"class.mynamespace::Templated"*, float*, i32*)* @_Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi, !"kernel", i32 1}
!1 = !{void (%"class.mynamespace::Bar"*, %"class.mynamespace::Templated.0"*, i32*, i32*)* @_Z11doSomethingIiEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi, !"kernel", i32 1}
!2 = !{void (%"class.mynamespace::Bar"*, %"class.mynamespace::Templated.1"*, double*, i32*)* @_Z11doSomethingIdEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi, !"kernel", i32 1}
!3 = !{null, !"align", i32 8}
!4 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!5 = !{null, !"align", i32 16}
!6 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!7 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!8 = !{i32 1, i32 2}
!9 = !{!10, !11, i64 0}
!10 = !{!"_ZTSN11mynamespace12subnamespace3FooE", !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!15, !16, i64 4}
!15 = !{!"_ZTSN11mynamespace9TemplatedIfEE", !16, i64 4}
!16 = !{!"float", !12, i64 0}
!17 = !{!16, !16, i64 0}
!18 = !{!19, !11, i64 8}
!19 = !{!"_ZTSN11mynamespace3BarE", !10, i64 4, !11, i64 8}
!20 = !{!11, !11, i64 0}
!21 = !{!22, !11, i64 4}
!22 = !{!"_ZTSN11mynamespace9TemplatedIiEE", !11, i64 4}
!23 = !{!24, !25, i64 8}
!24 = !{!"_ZTSN11mynamespace9TemplatedIdEE", !25, i64 8}
!25 = !{!"double", !12, i64 0}
!26 = !{!25, !25, i64 0}
