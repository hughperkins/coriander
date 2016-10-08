; ModuleID = 'test/pointerpointer.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.MyStruct = type { float, i32 }
%class.Half = type { %class.HalfBase }
%class.HalfBase = type { %class.HalfImpl }
%class.HalfImpl = type { i16 }
%class.TensorEvaluator6 = type { %class.TensorEvaluator0, %class.TensorEvaluator7 }
%class.TensorEvaluator0 = type { %class.Half*, %class.GpuDevice }
%class.GpuDevice = type { i32, %class.StreamInterface* }
%class.StreamInterface = type { i8 }
%class.TensorEvaluator7 = type { %class.Half*, %class.TensorEvaluator2 }
%class.TensorEvaluator2 = type { %class.Half*, %class.GpuDevice }

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #3
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #0

; Function Attrs: norecurse nounwind readonly
define float @_Z9sumStructPP8MyStructi(%struct.MyStruct** nocapture readonly %p_structs, i32 %N) #1 {
  %1 = icmp sgt i32 %N, 0
  br i1 %1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %0
  %xtraiter = and i32 %N, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.preheader.split, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %2 = load %struct.MyStruct*, %struct.MyStruct** %p_structs, align 8, !tbaa !8
  %3 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %2, i64 0, i32 0
  %4 = load float, float* %3, align 4, !tbaa !12
  %5 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %2, i64 0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !16
  %7 = sitofp i32 %6 to float
  %8 = fmul float %7, 3.500000e+00
  %9 = fadd float %4, %8
  %10 = fadd float %9, 0.000000e+00
  br label %.lr.ph.preheader.split

.lr.ph.preheader.split:                           ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr = phi float [ undef, %.lr.ph.preheader ], [ %10, %.lr.ph.prol ]
  %sum.02.unr = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %10, %.lr.ph.prol ]
  %i.01.unr = phi i32 [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %11 = icmp eq i32 %N, 1
  br i1 %11, label %._crit_edge.loopexit, label %.lr.ph.preheader.split.split

.lr.ph.preheader.split.split:                     ; preds = %.lr.ph.preheader.split
  br label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %.lcssa3 = phi float [ %34, %.lr.ph ]
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.preheader.split, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph.preheader.split ], [ %.lcssa3, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  %sum.0.lcssa = phi float [ 0.000000e+00, %0 ], [ %.lcssa, %._crit_edge.loopexit ]
  ret float %sum.0.lcssa

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.split.split
  %sum.02 = phi float [ %sum.02.unr, %.lr.ph.preheader.split.split ], [ %34, %.lr.ph ]
  %i.01 = phi i32 [ %i.01.unr, %.lr.ph.preheader.split.split ], [ %35, %.lr.ph ]
  %12 = sext i32 %i.01 to i64
  %13 = getelementptr inbounds %struct.MyStruct*, %struct.MyStruct** %p_structs, i64 %12
  %14 = load %struct.MyStruct*, %struct.MyStruct** %13, align 8, !tbaa !8
  %15 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %14, i64 0, i32 0
  %16 = load float, float* %15, align 4, !tbaa !12
  %17 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %14, i64 0, i32 1
  %18 = load i32, i32* %17, align 4, !tbaa !16
  %19 = sitofp i32 %18 to float
  %20 = fmul float %19, 3.500000e+00
  %21 = fadd float %16, %20
  %22 = fadd float %sum.02, %21
  %23 = add nuw nsw i32 %i.01, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.MyStruct*, %struct.MyStruct** %p_structs, i64 %24
  %26 = load %struct.MyStruct*, %struct.MyStruct** %25, align 8, !tbaa !8
  %27 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %26, i64 0, i32 0
  %28 = load float, float* %27, align 4, !tbaa !12
  %29 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %26, i64 0, i32 1
  %30 = load i32, i32* %29, align 4, !tbaa !16
  %31 = sitofp i32 %30 to float
  %32 = fmul float %31, 3.500000e+00
  %33 = fadd float %28, %32
  %34 = fadd float %22, %33
  %35 = add nsw i32 %i.01, 2
  %exitcond.1 = icmp eq i32 %35, %N
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph
}

; Function Attrs: norecurse nounwind
define void @_Z8mykernelPfP8MyStructi(float* nocapture %data, %struct.MyStruct* %structs, i32 %N) #2 {
  %1 = icmp sgt i32 %N, 0
  %2 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %structs, i64 0, i32 0
  br i1 %1, label %.lr.ph.i.preheader, label %._Z9sumStructPP8MyStructi.exit_crit_edge

._Z9sumStructPP8MyStructi.exit_crit_edge:         ; preds = %0
  %.pre17 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %structs, i64 0, i32 1
  br label %_Z9sumStructPP8MyStructi.exit

.lr.ph.i.preheader:                               ; preds = %0
  %3 = load float, float* %2, align 4
  %4 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %structs, i64 0, i32 1
  %5 = load i32, i32* %4, align 4
  %6 = sitofp i32 %5 to float
  %7 = fmul float %6, 3.500000e+00
  %8 = fadd float %3, %7
  %9 = add i32 %N, -1
  %xtraiter = and i32 %N, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.i.preheader.split, label %.lr.ph.i.prol.preheader

.lr.ph.i.prol.preheader:                          ; preds = %.lr.ph.i.preheader
  br label %.lr.ph.i.prol

.lr.ph.i.prol:                                    ; preds = %.lr.ph.i.prol.preheader, %.lr.ph.i.prol
  %sum.02.i.prol = phi float [ %10, %.lr.ph.i.prol ], [ 0.000000e+00, %.lr.ph.i.prol.preheader ]
  %i.01.i.prol = phi i32 [ %11, %.lr.ph.i.prol ], [ 0, %.lr.ph.i.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.i.prol ], [ %xtraiter, %.lr.ph.i.prol.preheader ]
  %10 = fadd float %sum.02.i.prol, %8
  %11 = add nuw nsw i32 %i.01.i.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.i.preheader.split.loopexit, label %.lr.ph.i.prol, !llvm.loop !17

.lr.ph.i.preheader.split.loopexit:                ; preds = %.lr.ph.i.prol
  %.lcssa28 = phi i32 [ %11, %.lr.ph.i.prol ]
  %.lcssa27 = phi float [ %10, %.lr.ph.i.prol ]
  br label %.lr.ph.i.preheader.split

.lr.ph.i.preheader.split:                         ; preds = %.lr.ph.i.preheader.split.loopexit, %.lr.ph.i.preheader
  %.lcssa24.unr = phi float [ undef, %.lr.ph.i.preheader ], [ %.lcssa27, %.lr.ph.i.preheader.split.loopexit ]
  %sum.02.i.unr = phi float [ 0.000000e+00, %.lr.ph.i.preheader ], [ %.lcssa27, %.lr.ph.i.preheader.split.loopexit ]
  %i.01.i.unr = phi i32 [ 0, %.lr.ph.i.preheader ], [ %.lcssa28, %.lr.ph.i.preheader.split.loopexit ]
  %12 = icmp ult i32 %9, 7
  br i1 %12, label %_Z9sumStructPP8MyStructi.exit.loopexit, label %.lr.ph.i.preheader.split.split

.lr.ph.i.preheader.split.split:                   ; preds = %.lr.ph.i.preheader.split
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.lr.ph.i.preheader.split.split
  %sum.02.i = phi float [ %sum.02.i.unr, %.lr.ph.i.preheader.split.split ], [ %20, %.lr.ph.i ]
  %i.01.i = phi i32 [ %i.01.i.unr, %.lr.ph.i.preheader.split.split ], [ %21, %.lr.ph.i ]
  %13 = fadd float %sum.02.i, %8
  %14 = fadd float %13, %8
  %15 = fadd float %14, %8
  %16 = fadd float %15, %8
  %17 = fadd float %16, %8
  %18 = fadd float %17, %8
  %19 = fadd float %18, %8
  %20 = fadd float %19, %8
  %21 = add nsw i32 %i.01.i, 8
  %exitcond.i.7 = icmp eq i32 %21, %N
  br i1 %exitcond.i.7, label %_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa, label %.lr.ph.i

_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa: ; preds = %.lr.ph.i
  %.lcssa26 = phi float [ %20, %.lr.ph.i ]
  br label %_Z9sumStructPP8MyStructi.exit.loopexit

_Z9sumStructPP8MyStructi.exit.loopexit:           ; preds = %.lr.ph.i.preheader.split, %_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa
  %.lcssa24 = phi float [ %.lcssa24.unr, %.lr.ph.i.preheader.split ], [ %.lcssa26, %_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa ]
  br label %_Z9sumStructPP8MyStructi.exit

_Z9sumStructPP8MyStructi.exit:                    ; preds = %_Z9sumStructPP8MyStructi.exit.loopexit, %._Z9sumStructPP8MyStructi.exit_crit_edge
  %.pre-phi18 = phi i32* [ %.pre17, %._Z9sumStructPP8MyStructi.exit_crit_edge ], [ %4, %_Z9sumStructPP8MyStructi.exit.loopexit ]
  %sum.0.lcssa.i = phi float [ 0.000000e+00, %._Z9sumStructPP8MyStructi.exit_crit_edge ], [ %.lcssa24, %_Z9sumStructPP8MyStructi.exit.loopexit ]
  store float %sum.0.lcssa.i, float* %data, align 4, !tbaa !19
  %22 = load float, float* %2, align 4
  %23 = load i32, i32* %.pre-phi18, align 4
  %24 = sitofp i32 %23 to float
  %25 = fmul float %24, 3.500000e+00
  %26 = fadd float %22, %25
  br label %.lr.ph.i11

.lr.ph.i11:                                       ; preds = %.lr.ph.i11, %_Z9sumStructPP8MyStructi.exit
  %sum.02.i8 = phi float [ 0.000000e+00, %_Z9sumStructPP8MyStructi.exit ], [ %29, %.lr.ph.i11 ]
  %i.01.i9 = phi i32 [ 0, %_Z9sumStructPP8MyStructi.exit ], [ %30, %.lr.ph.i11 ]
  %27 = fadd float %sum.02.i8, %26
  %28 = fadd float %27, %26
  %29 = fadd float %28, %26
  %30 = add nsw i32 %i.01.i9, 3
  %exitcond.i10.2 = icmp eq i32 %30, 123
  br i1 %exitcond.i10.2, label %_Z9sumStructPP8MyStructi.exit12, label %.lr.ph.i11

_Z9sumStructPP8MyStructi.exit12:                  ; preds = %.lr.ph.i11
  %.lcssa25 = phi float [ %29, %.lr.ph.i11 ]
  %31 = getelementptr inbounds float, float* %data, i64 3
  store float %.lcssa25, float* %31, align 4, !tbaa !19
  %32 = load float, float* %2, align 4
  %33 = load i32, i32* %.pre-phi18, align 4
  %34 = sitofp i32 %33 to float
  %35 = fmul float %34, 3.500000e+00
  %36 = fadd float %32, %35
  br label %.lr.ph.i5

.lr.ph.i5:                                        ; preds = %.lr.ph.i5, %_Z9sumStructPP8MyStructi.exit12
  %sum.02.i2 = phi float [ 0.000000e+00, %_Z9sumStructPP8MyStructi.exit12 ], [ %51, %.lr.ph.i5 ]
  %i.01.i3 = phi i32 [ 0, %_Z9sumStructPP8MyStructi.exit12 ], [ %52, %.lr.ph.i5 ]
  %37 = fadd float %sum.02.i2, %36
  %38 = fadd float %37, %36
  %39 = fadd float %38, %36
  %40 = fadd float %39, %36
  %41 = fadd float %40, %36
  %42 = fadd float %41, %36
  %43 = fadd float %42, %36
  %44 = fadd float %43, %36
  %45 = fadd float %44, %36
  %46 = fadd float %45, %36
  %47 = fadd float %46, %36
  %48 = fadd float %47, %36
  %49 = fadd float %48, %36
  %50 = fadd float %49, %36
  %51 = fadd float %50, %36
  %52 = add nsw i32 %i.01.i3, 15
  %exitcond.i4.14 = icmp eq i32 %52, 12300
  br i1 %exitcond.i4.14, label %_Z9sumStructPP8MyStructi.exit6, label %.lr.ph.i5

_Z9sumStructPP8MyStructi.exit6:                   ; preds = %.lr.ph.i5
  %.lcssa = phi float [ %51, %.lr.ph.i5 ]
  %53 = getelementptr inbounds float, float* %data, i64 4
  store float %.lcssa, float* %53, align 4, !tbaa !19
  ret void
}

; Function Attrs: norecurse nounwind readonly
define float @_Z12getHalfValueP4Halfi(%class.Half* nocapture readonly %half_, i32 %a) #1 {
  %1 = sext i32 %a to i64
  %2 = getelementptr inbounds %class.Half, %class.Half* %half_, i64 %1, i32 0, i32 0, i32 0
  %3 = load i16, i16* %2, align 2, !tbaa !20
  %4 = sext i16 %3 to i32
  %5 = add nsw i32 %4, 123
  %6 = sitofp i32 %5 to float
  ret float %6
}

; Function Attrs: norecurse nounwind
define void @_Z11myte6kernelP16TensorEvaluator6PfP9GpuDeviceiii(%class.TensorEvaluator6* nocapture readonly %structs, float* nocapture %data, %class.GpuDevice* nocapture readnone %gpudevices, i32 %a, i32 %b, i32 %c) #2 {
  %1 = sext i32 %a to i64
  %2 = getelementptr inbounds %class.TensorEvaluator6, %class.TensorEvaluator6* %structs, i64 %1, i32 0, i32 0
  %3 = load %class.Half*, %class.Half** %2, align 8, !tbaa !23
  %4 = getelementptr inbounds %class.Half, %class.Half* %3, i64 %1, i32 0, i32 0, i32 0
  %5 = load i16, i16* %4, align 2, !tbaa !20
  %6 = sext i16 %5 to i32
  %7 = add nsw i32 %6, 123
  %8 = sitofp i32 %7 to float
  store float %8, float* %data, align 4, !tbaa !19
  ret void
}

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !3, !2, !4, !4, !4, !4, !5, !5, !4}
!llvm.ident = !{!6}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!7}

!0 = !{void (float*, %struct.MyStruct*, i32)* @_Z8mykernelPfP8MyStructi, !"kernel", i32 1}
!1 = !{void (%class.TensorEvaluator6*, float*, %class.GpuDevice*, i32, i32, i32)* @_Z11myte6kernelP16TensorEvaluator6PfP9GpuDeviceiii, !"kernel", i32 1}
!2 = !{null, !"align", i32 8}
!3 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!4 = !{null, !"align", i32 16}
!5 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!6 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!7 = !{i32 1, i32 2}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !14, i64 0}
!13 = !{!"_ZTS8MyStruct", !14, i64 0, !15, i64 4}
!14 = !{!"float", !10, i64 0}
!15 = !{!"int", !10, i64 0}
!16 = !{!13, !15, i64 4}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{!14, !14, i64 0}
!20 = !{!21, !22, i64 0}
!21 = !{!"_ZTS8HalfImpl", !22, i64 0}
!22 = !{!"short", !10, i64 0}
!23 = !{!24, !9, i64 0}
!24 = !{!"_ZTS16TensorEvaluator6", !25, i64 0, !27, i64 24}
!25 = !{!"_ZTS16TensorEvaluator0", !9, i64 0, !26, i64 8}
!26 = !{!"_ZTS9GpuDevice", !15, i64 0, !9, i64 8}
!27 = !{!"_ZTS16TensorEvaluator7", !9, i64 0, !28, i64 8}
!28 = !{!"_ZTS16TensorEvaluator2", !9, i64 0, !26, i64 8}
