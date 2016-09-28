; ModuleID = 'data/testcudakernel1.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #4
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
  %1 = load float, float* %a, align 4, !tbaa !12
  %2 = fadd float %1, 3.000000e+00
  store float %2, float* %a, align 4, !tbaa !12
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11somekernel1Pf(float* nocapture %a) #2 {
  %1 = getelementptr inbounds float, float* %a, i64 1
  %2 = bitcast float* %1 to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !12
  %4 = bitcast float* %a to i32*
  store i32 %3, i32* %4, align 4, !tbaa !12
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z3fooPf(float* nocapture %data) #2 {
  store float 1.230000e+02, float* %data, align 4, !tbaa !12
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z7use_tidPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #5
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !12
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z13use_template1PfPi(float* nocapture %data, i32* nocapture %intdata) #2 {
  %1 = getelementptr inbounds float, float* %data, i64 1
  %2 = load float, float* %1, align 4, !tbaa !12
  %3 = getelementptr inbounds float, float* %data, i64 2
  %4 = load float, float* %3, align 4, !tbaa !12
  %5 = fadd float %2, %4
  store float %5, float* %data, align 4, !tbaa !12
  %6 = getelementptr inbounds i32, i32* %intdata, i64 1
  %7 = load i32, i32* %6, align 4, !tbaa !16
  %8 = getelementptr inbounds i32, i32* %intdata, i64 2
  %9 = load i32, i32* %8, align 4, !tbaa !16
  %10 = add nsw i32 %9, %7
  store i32 %10, i32* %intdata, align 4, !tbaa !16
  ret void
}

; Function Attrs: nounwind
define void @_Z13someops_floatPf(float* nocapture %data) #3 {
  %1 = getelementptr inbounds float, float* %data, i64 1
  %2 = load float, float* %1, align 4, !tbaa !12
  %3 = getelementptr inbounds float, float* %data, i64 2
  %4 = load float, float* %3, align 4, !tbaa !12
  %5 = fsub float %2, %4
  %6 = fdiv float %2, %4
  %7 = fadd float %5, %6
  %8 = fmul float %4, %2
  %9 = fadd float %7, %8
  store float %9, float* %data, align 4, !tbaa !12
  %10 = fpext float %2 to double
  %11 = tail call i32 @llvm.nvvm.d2i.hi(double %10) #5
  %12 = and i32 %11, 2147483647
  %13 = tail call i32 @llvm.nvvm.d2i.lo(double %10) #5
  %14 = tail call double @llvm.nvvm.lohi.i2d(i32 %13, i32 %12) #5
  %15 = fcmp ult double %14, 5.556200e-01
  br i1 %15, label %48, label %16

; <label>:16                                      ; preds = %0
  %17 = fmul double %14, 2.000000e+00
  %18 = tail call double @llvm.nvvm.fma.rn.d(double %17, double 0x3FF71547652B82FE, double 0x4338000000000000) #5
  %19 = tail call i32 @llvm.nvvm.d2i.lo(double %18) #5
  %20 = tail call double @llvm.nvvm.add.rn.d(double %18, double 0xC338000000000000) #5
  %21 = tail call double @llvm.nvvm.fma.rn.d(double %20, double 0xBFE62E42FEFA39EF, double %17) #5
  %22 = tail call double @llvm.nvvm.fma.rn.d(double %20, double 0xBC7ABC9E3B39803F, double %21) #5
  %23 = tail call double @llvm.nvvm.fma.rn.d(double 0x3E21F4076ACD15B6, double %22, double 0x3E5AF86D8EBD13CD) #5
  %24 = tail call double @llvm.nvvm.fma.rn.d(double %23, double %22, double 0x3E927E5092BA033D) #5
  %25 = tail call double @llvm.nvvm.fma.rn.d(double %24, double %22, double 0x3EC71DDE6C5F9DA1) #5
  %26 = tail call double @llvm.nvvm.fma.rn.d(double %25, double %22, double 0x3EFA01A018D034E6) #5
  %27 = tail call double @llvm.nvvm.fma.rn.d(double %26, double %22, double 0x3F2A01A01B3B6940) #5
  %28 = tail call double @llvm.nvvm.fma.rn.d(double %27, double %22, double 0x3F56C16C16C1B5DD) #5
  %29 = tail call double @llvm.nvvm.fma.rn.d(double %28, double %22, double 0x3F8111111110F74D) #5
  %30 = tail call double @llvm.nvvm.fma.rn.d(double %29, double %22, double 0x3FA555555555554D) #5
  %31 = tail call double @llvm.nvvm.fma.rn.d(double %30, double %22, double 0x3FC5555555555557) #5
  %32 = tail call double @llvm.nvvm.fma.rn.d(double %31, double %22, double 5.000000e-01) #5
  %33 = fmul double %22, %32
  %34 = tail call double @llvm.nvvm.fma.rn.d(double %33, double %22, double %22) #5
  %35 = shl i32 %19, 20
  %36 = add nsw i32 %35, 1072693248
  %37 = tail call double @llvm.nvvm.lohi.i2d(i32 0, i32 %36) #5
  %38 = tail call double @llvm.nvvm.fma.rn.d(double %34, double %37, double %37) #5
  %39 = fadd double %38, 1.000000e+00
  %40 = tail call double asm "rcp.approx.ftz.f64 $0,$1;", "=d,d"(double %39) #5
  %41 = fsub double -0.000000e+00, %39
  %42 = tail call double @llvm.nvvm.fma.rn.d(double %41, double %40, double 1.000000e+00) #5
  %43 = tail call double @llvm.nvvm.fma.rn.d(double %42, double %42, double %42) #5
  %44 = tail call double @llvm.nvvm.fma.rn.d(double %43, double %40, double %40) #5
  %45 = fsub double -0.000000e+00, %44
  %46 = tail call double @llvm.nvvm.fma.rn.d(double 2.000000e+00, double %45, double 1.000000e+00) #5
  %47 = icmp ugt i32 %12, 1077936127
  %..i.i = select i1 %47, double 1.000000e+00, double %46
  %.pre = load float, float* %data, align 4, !tbaa !12
  %.pre1 = load float, float* %1, align 4, !tbaa !12
  br label %_ZL4tanhd.exit

; <label>:48                                      ; preds = %0
  %49 = fmul double %10, %10
  %50 = tail call double @llvm.nvvm.fma.rn.d(double 0x3F0ABFFC9B5786C4, double %49, double 0xBF2B9093D89F0E23) #5
  %51 = tail call double @llvm.nvvm.fma.rn.d(double %50, double %49, double 0x3F42FA2744C30B61) #5
  %52 = tail call double @llvm.nvvm.fma.rn.d(double %51, double %49, double 0xBF57CF3B9C1E491D) #5
  %53 = tail call double @llvm.nvvm.fma.rn.d(double %52, double %49, double 0x3F6D6C61D450119A) #5
  %54 = tail call double @llvm.nvvm.fma.rn.d(double %53, double %49, double 0xBF8226DDD44294F5) #5
  %55 = tail call double @llvm.nvvm.fma.rn.d(double %54, double %49, double 0x3F9664F45C2B04A6) #5
  %56 = tail call double @llvm.nvvm.fma.rn.d(double %55, double %49, double 0xBFABA1BA1AD70754) #5
  %57 = tail call double @llvm.nvvm.fma.rn.d(double %56, double %49, double 0x3FC111111110295E) #5
  %58 = tail call double @llvm.nvvm.fma.rn.d(double %57, double %49, double 0xBFD555555555549F) #5
  %59 = fmul double %49, %58
  %60 = tail call double @llvm.nvvm.fma.rn.d(double %59, double %10, double %10) #5
  br label %_ZL4tanhd.exit

_ZL4tanhd.exit:                                   ; preds = %16, %48
  %61 = phi float [ %.pre1, %16 ], [ %2, %48 ]
  %62 = phi float [ %.pre, %16 ], [ %9, %48 ]
  %r.1.i.i = phi double [ %..i.i, %16 ], [ %60, %48 ]
  %63 = tail call i32 @llvm.nvvm.d2i.lo(double %r.1.i.i) #5
  %64 = tail call i32 @llvm.nvvm.d2i.hi(double %r.1.i.i) #5
  %65 = and i32 %11, -2147483648
  %66 = or i32 %64, %65
  %67 = tail call double @llvm.nvvm.lohi.i2d(i32 %63, i32 %66) #5
  %68 = fpext float %62 to double
  %69 = fadd double %67, %68
  %70 = fptrunc double %69 to float
  %71 = fpext float %61 to double
  %72 = tail call double @llvm.nvvm.sqrt.rn.d(double %71) #5
  %73 = fpext float %70 to double
  %74 = fsub double %73, %72
  %75 = fptrunc double %74 to float
  store float %75, float* %data, align 4, !tbaa !12
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11someops_intPi(i32* nocapture %data) #2 {
  %1 = getelementptr inbounds i32, i32* %data, i64 1
  %2 = load i32, i32* %1, align 4, !tbaa !16
  %3 = getelementptr inbounds i32, i32* %data, i64 2
  %4 = load i32, i32* %3, align 4, !tbaa !16
  %5 = sdiv i32 %2, %4
  %6 = add i32 %2, %5
  %7 = add i32 %6, %2
  %8 = mul nsw i32 %4, %2
  %9 = add nsw i32 %8, %7
  store i32 %9, i32* %data, align 4, !tbaa !16
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #4

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.sqrt.rn.d(double) #4

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.d2i.hi(double) #4

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.d2i.lo(double) #4

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.lohi.i2d(i32, i32) #4

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.fma.rn.d(double, double, double) #4

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.add.rn.d(double, double) #4

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8}
!llvm.ident = !{!10}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!11}

!0 = !{void (float*)* @_Z11somekernel1Pf, !"kernel", i32 1}
!1 = !{void (float*)* @_Z3fooPf, !"kernel", i32 1}
!2 = !{void (float*)* @_Z7use_tidPf, !"kernel", i32 1}
!3 = !{void (float*, i32*)* @_Z13use_template1PfPi, !"kernel", i32 1}
!4 = !{void (float*)* @_Z13someops_floatPf, !"kernel", i32 1}
!5 = !{void (i32*)* @_Z11someops_intPi, !"kernel", i32 1}
!6 = !{null, !"align", i32 8}
!7 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!8 = !{null, !"align", i32 16}
!9 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!10 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!11 = !{i32 1, i32 2}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !14, i64 0}
