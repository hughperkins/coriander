; ModuleID = 'test/struct_initializer.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%class.SomeClass = type { %struct.Foo }
%struct.Foo = type { float }

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@myg1 = addrspace(4) externally_initialized global %class.SomeClass zeroinitializer, align 4
@myg2 = addrspace(4) externally_initialized global %class.SomeClass zeroinitializer, align 4
@foo = addrspace(4) externally_initialized global %struct.Foo { float 1.100000e+01 }, align 4
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_struct_initializer.cu, i8* null }]
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #3
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #0

; Function Attrs: norecurse nounwind readonly
define float @_Z11getFooValue3Foo(%struct.Foo* byval nocapture readonly align 4 %foo) #1 {
  %1 = getelementptr inbounds %struct.Foo, %struct.Foo* %foo, i64 0, i32 0
  %2 = load float, float* %1, align 4, !tbaa !9
  ret float %2
}

; Function Attrs: norecurse nounwind readonly
define float @_Z17getSomeClassValue9SomeClassS_(%class.SomeClass* byval nocapture readonly align 4 %someclass, %class.SomeClass* byval nocapture readonly align 4 %c2) #1 {
  %1 = getelementptr inbounds %class.SomeClass, %class.SomeClass* %someclass, i64 0, i32 0, i32 0
  %2 = load float, float* %1, align 4, !tbaa !14
  %3 = getelementptr inbounds %class.SomeClass, %class.SomeClass* %c2, i64 0, i32 0, i32 0
  %4 = load float, float* %3, align 4, !tbaa !14
  %5 = fadd float %2, %4
  ret float %5
}

; Function Attrs: norecurse nounwind
define void @_Z10somekernelPf(float* nocapture %data) #2 {
  store float 0x4037666660000000, float* %data, align 4, !tbaa !16
  %1 = getelementptr inbounds float, float* %data, i64 1
  store float 0x4037666660000000, float* %1, align 4, !tbaa !16
  %2 = getelementptr inbounds float, float* %data, i64 2
  %3 = bitcast float* %2 to i32*
  store i32 1067282596, i32* %3, align 4, !tbaa !16
  %4 = getelementptr inbounds float, float* %data, i64 3
  store float 0x4012B85200000000, float* %4, align 4, !tbaa !16
  %5 = getelementptr inbounds float, float* %data, i64 4
  store float 0x400B9999A0000000, float* %5, align 4, !tbaa !16
  %6 = getelementptr inbounds float, float* %data, i64 5
  store float 3.470000e+02, float* %6, align 4, !tbaa !16
  %7 = getelementptr inbounds float, float* %data, i64 7
  %8 = load float, float* %7, align 4, !tbaa !16
  %9 = fmul float %8, 3.450000e+02
  %10 = fadd float %9, 2.000000e+00
  %11 = getelementptr inbounds float, float* %data, i64 6
  store float %10, float* %11, align 4, !tbaa !16
  br label %27

; <label>:12                                      ; preds = %27
  %13 = getelementptr inbounds float, float* %data, i64 9
  %14 = load float, float* %13, align 4, !tbaa !16
  %15 = load float, float* getelementptr (%class.SomeClass, %class.SomeClass* addrspacecast (%class.SomeClass addrspace(4)* @myg1 to %class.SomeClass*), i64 0, i32 0, i32 0), align 4, !tbaa !14
  %16 = fmul float %15, 1.000000e+02
  %17 = fmul float %14, %16
  %18 = fadd float %17, 2.000000e+00
  %19 = getelementptr inbounds float, float* %data, i64 8
  store float %18, float* %19, align 4, !tbaa !16
  %20 = getelementptr inbounds float, float* %data, i64 11
  %21 = load float, float* %20, align 4, !tbaa !16
  %22 = load float, float* getelementptr (%class.SomeClass, %class.SomeClass* addrspacecast (%class.SomeClass addrspace(4)* @myg2 to %class.SomeClass*), i64 0, i32 0, i32 0), align 4, !tbaa !14
  %23 = fmul float %22, 1.000000e+02
  %24 = fmul float %21, %23
  %25 = fadd float %24, 2.000000e+00
  %26 = getelementptr inbounds float, float* %data, i64 10
  store float %25, float* %26, align 4, !tbaa !16
  ret void

; <label>:27                                      ; preds = %27, %0
  %i.03 = phi i32 [ 0, %0 ], [ %46, %27 ]
  %28 = add nuw nsw i32 %i.03, 10100
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float* %data, i64 %29
  %31 = load float, float* %30, align 4, !tbaa !16
  %32 = fmul float %31, 3.450000e+02
  %33 = fadd float %32, 2.000000e+00
  %34 = add nuw nsw i32 %i.03, 100
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float* %data, i64 %35
  store float %33, float* %36, align 4, !tbaa !16
  %37 = add nsw i32 %i.03, 10101
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float* %data, i64 %38
  %40 = load float, float* %39, align 4, !tbaa !16
  %41 = fmul float %40, 3.450000e+02
  %42 = fadd float %41, 2.000000e+00
  %43 = add nsw i32 %i.03, 101
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float* %data, i64 %44
  store float %42, float* %45, align 4, !tbaa !16
  %46 = add nsw i32 %i.03, 2
  %exitcond.1 = icmp eq i32 %46, 10000
  br i1 %exitcond.1, label %12, label %27
}

; Function Attrs: norecurse nounwind
define void @_Z11somekernel2Pf(float* nocapture %data) #2 {
  %1 = load float, float* addrspacecast (float addrspace(4)* getelementptr inbounds (%class.SomeClass, %class.SomeClass addrspace(4)* @myg1, i64 0, i32 0, i32 0) to float*), align 4, !tbaa !16
  %2 = load float, float* addrspacecast (float addrspace(4)* getelementptr inbounds (%class.SomeClass, %class.SomeClass addrspace(4)* @myg2, i64 0, i32 0, i32 0) to float*), align 4, !tbaa !16
  %3 = fadd float %1, %2
  store float %3, float* %data, align 4, !tbaa !16
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11getFooValuePf(float* nocapture %data) #2 {
  %1 = load i32, i32* addrspacecast (i32 addrspace(4)* bitcast (%struct.Foo addrspace(4)* @foo to i32 addrspace(4)*) to i32*), align 4, !tbaa !9
  %2 = bitcast float* %data to i32*
  store i32 %1, i32* %2, align 4, !tbaa !16
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @_GLOBAL__sub_I_struct_initializer.cu() #2 {
  store float 0x3FF3AE1480000000, float* getelementptr (%class.SomeClass, %class.SomeClass* addrspacecast (%class.SomeClass addrspace(4)* @myg1 to %class.SomeClass*), i64 0, i32 0, i32 0), align 4, !tbaa !9
  store float 0x401F8F5C20000000, float* getelementptr (%class.SomeClass, %class.SomeClass* addrspacecast (%class.SomeClass addrspace(4)* @myg2 to %class.SomeClass*), i64 0, i32 0, i32 0), align 4, !tbaa !14
  ret void
}

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !3, !5, !5, !5, !5, !6, !6, !5}
!llvm.ident = !{!7}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!8}

!0 = !{void (float*)* @_Z10somekernelPf, !"kernel", i32 1}
!1 = !{void (float*)* @_Z11somekernel2Pf, !"kernel", i32 1}
!2 = !{void (float*)* @_Z11getFooValuePf, !"kernel", i32 1}
!3 = !{null, !"align", i32 8}
!4 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!5 = !{null, !"align", i32 16}
!6 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!7 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!8 = !{i32 1, i32 2}
!9 = !{!10, !11, i64 0}
!10 = !{!"_ZTS3Foo", !11, i64 0}
!11 = !{!"float", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!15, !11, i64 0}
!15 = !{!"_ZTS9SomeClass", !10, i64 0}
!16 = !{!11, !11, i64 0}
