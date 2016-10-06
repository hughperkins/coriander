; ModuleID = 'test/test_local.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@_ZZ9testLocalPfE8myshared = internal unnamed_addr addrspace(3) global [32 x float] zeroinitializer, align 4
@_ZZ10testLocal2PfE8myshared = internal unnamed_addr addrspace(3) global [64 x float] zeroinitializer, align 4
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #2
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #0

; Function Attrs: norecurse nounwind
define void @_Z9testLocalPf(float* nocapture %data) #1 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #3
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  %4 = bitcast float* %3 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !8
  %6 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9testLocalPfE8myshared, i64 0, i64 %2
  %7 = bitcast float addrspace(3)* %6 to i32 addrspace(3)*
  %8 = addrspacecast i32 addrspace(3)* %7 to i32*
  store i32 %5, i32* %8, align 4, !tbaa !8
  %9 = add nsw i32 %1, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9testLocalPfE8myshared, i64 0, i64 %10
  %12 = bitcast float addrspace(3)* %11 to i32 addrspace(3)*
  %13 = addrspacecast i32 addrspace(3)* %12 to i32*
  %14 = load i32, i32* %13, align 4, !tbaa !8
  %15 = bitcast float* %data to i32*
  store i32 %14, i32* %15, align 4, !tbaa !8
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z10testLocal2Pf(float* nocapture %data) #1 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #3
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  %4 = bitcast float* %3 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !8
  %6 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ10testLocal2PfE8myshared, i64 0, i64 %2
  %7 = bitcast float addrspace(3)* %6 to i32 addrspace(3)*
  %8 = addrspacecast i32 addrspace(3)* %7 to i32*
  store i32 %5, i32* %8, align 4, !tbaa !8
  %9 = add nsw i32 %1, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ10testLocal2PfE8myshared, i64 0, i64 %10
  %12 = bitcast float addrspace(3)* %11 to i32 addrspace(3)*
  %13 = addrspacecast i32 addrspace(3)* %12 to i32*
  %14 = load i32, i32* %13, align 4, !tbaa !8
  %15 = bitcast float* %data to i32*
  store i32 %14, i32* %15, align 4, !tbaa !8
  %16 = load i32, i32* %4, align 4, !tbaa !8
  store i32 %16, i32* %13, align 4, !tbaa !8
  %17 = load i32, i32* %8, align 4, !tbaa !8
  %18 = getelementptr inbounds float, float* %data, i64 1
  %19 = bitcast float* %18 to i32*
  store i32 %17, i32* %19, align 4, !tbaa !8
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #2

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !2, !4, !4, !4, !4, !5, !5, !4}
!llvm.ident = !{!6}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!7}

!0 = !{void (float*)* @_Z9testLocalPf, !"kernel", i32 1}
!1 = !{void (float*)* @_Z10testLocal2Pf, !"kernel", i32 1}
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
