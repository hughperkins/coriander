; ModuleID = 'test/pointerpointer.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.MyStruct = type { float, i32 }

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
  %2 = load %struct.MyStruct*, %struct.MyStruct** %p_structs, align 8, !tbaa !7
  %3 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %2, i64 0, i32 0
  %4 = load float, float* %3, align 4, !tbaa !11
  %5 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %2, i64 0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !15
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
  %14 = load %struct.MyStruct*, %struct.MyStruct** %13, align 8, !tbaa !7
  %15 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %14, i64 0, i32 0
  %16 = load float, float* %15, align 4, !tbaa !11
  %17 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %14, i64 0, i32 1
  %18 = load i32, i32* %17, align 4, !tbaa !15
  %19 = sitofp i32 %18 to float
  %20 = fmul float %19, 3.500000e+00
  %21 = fadd float %16, %20
  %22 = fadd float %sum.02, %21
  %23 = add nuw nsw i32 %i.01, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.MyStruct*, %struct.MyStruct** %p_structs, i64 %24
  %26 = load %struct.MyStruct*, %struct.MyStruct** %25, align 8, !tbaa !7
  %27 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %26, i64 0, i32 0
  %28 = load float, float* %27, align 4, !tbaa !11
  %29 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %26, i64 0, i32 1
  %30 = load i32, i32* %29, align 4, !tbaa !15
  %31 = sitofp i32 %30 to float
  %32 = fmul float %31, 3.500000e+00
  %33 = fadd float %28, %32
  %34 = fadd float %22, %33
  %35 = add nsw i32 %i.01, 2
  %exitcond.1 = icmp eq i32 %35, %N
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph
}

; Function Attrs: norecurse nounwind
define void @_Z8mykernelPfPP8MyStructi(float* nocapture %data, %struct.MyStruct** nocapture readonly %p_structs, i32 %N) #2 {
  %1 = icmp sgt i32 %N, 0
  br i1 %1, label %.lr.ph.i.preheader, label %_Z9sumStructPP8MyStructi.exit

.lr.ph.i.preheader:                               ; preds = %0
  %xtraiter = and i32 %N, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.i.preheader.split, label %.lr.ph.i.prol

.lr.ph.i.prol:                                    ; preds = %.lr.ph.i.preheader
  %2 = load %struct.MyStruct*, %struct.MyStruct** %p_structs, align 8, !tbaa !7
  %3 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %2, i64 0, i32 0
  %4 = load float, float* %3, align 4, !tbaa !11
  %5 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %2, i64 0, i32 1
  %6 = load i32, i32* %5, align 4, !tbaa !15
  %7 = sitofp i32 %6 to float
  %8 = fmul float %7, 3.500000e+00
  %9 = fadd float %4, %8
  %10 = fadd float %9, 0.000000e+00
  br label %.lr.ph.i.preheader.split

.lr.ph.i.preheader.split:                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i.prol
  %.lcssa.unr = phi float [ undef, %.lr.ph.i.preheader ], [ %10, %.lr.ph.i.prol ]
  %sum.02.i.unr = phi float [ 0.000000e+00, %.lr.ph.i.preheader ], [ %10, %.lr.ph.i.prol ]
  %i.01.i.unr = phi i32 [ 0, %.lr.ph.i.preheader ], [ 1, %.lr.ph.i.prol ]
  %11 = icmp eq i32 %N, 1
  br i1 %11, label %_Z9sumStructPP8MyStructi.exit.loopexit, label %.lr.ph.i.preheader.split.split

.lr.ph.i.preheader.split.split:                   ; preds = %.lr.ph.i.preheader.split
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.lr.ph.i.preheader.split.split
  %sum.02.i = phi float [ %sum.02.i.unr, %.lr.ph.i.preheader.split.split ], [ %34, %.lr.ph.i ]
  %i.01.i = phi i32 [ %i.01.i.unr, %.lr.ph.i.preheader.split.split ], [ %35, %.lr.ph.i ]
  %12 = sext i32 %i.01.i to i64
  %13 = getelementptr inbounds %struct.MyStruct*, %struct.MyStruct** %p_structs, i64 %12
  %14 = load %struct.MyStruct*, %struct.MyStruct** %13, align 8, !tbaa !7
  %15 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %14, i64 0, i32 0
  %16 = load float, float* %15, align 4, !tbaa !11
  %17 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %14, i64 0, i32 1
  %18 = load i32, i32* %17, align 4, !tbaa !15
  %19 = sitofp i32 %18 to float
  %20 = fmul float %19, 3.500000e+00
  %21 = fadd float %16, %20
  %22 = fadd float %sum.02.i, %21
  %23 = add nuw nsw i32 %i.01.i, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.MyStruct*, %struct.MyStruct** %p_structs, i64 %24
  %26 = load %struct.MyStruct*, %struct.MyStruct** %25, align 8, !tbaa !7
  %27 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %26, i64 0, i32 0
  %28 = load float, float* %27, align 4, !tbaa !11
  %29 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %26, i64 0, i32 1
  %30 = load i32, i32* %29, align 4, !tbaa !15
  %31 = sitofp i32 %30 to float
  %32 = fmul float %31, 3.500000e+00
  %33 = fadd float %28, %32
  %34 = fadd float %22, %33
  %35 = add nsw i32 %i.01.i, 2
  %exitcond.i.1 = icmp eq i32 %35, %N
  br i1 %exitcond.i.1, label %_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa, label %.lr.ph.i

_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa: ; preds = %.lr.ph.i
  %.lcssa1 = phi float [ %34, %.lr.ph.i ]
  br label %_Z9sumStructPP8MyStructi.exit.loopexit

_Z9sumStructPP8MyStructi.exit.loopexit:           ; preds = %.lr.ph.i.preheader.split, %_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph.i.preheader.split ], [ %.lcssa1, %_Z9sumStructPP8MyStructi.exit.loopexit.unr-lcssa ]
  br label %_Z9sumStructPP8MyStructi.exit

_Z9sumStructPP8MyStructi.exit:                    ; preds = %_Z9sumStructPP8MyStructi.exit.loopexit, %0
  %sum.0.lcssa.i = phi float [ 0.000000e+00, %0 ], [ %.lcssa, %_Z9sumStructPP8MyStructi.exit.loopexit ]
  store float %sum.0.lcssa.i, float* %data, align 4, !tbaa !16
  ret void
}

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !1, !3, !3, !3, !3, !4, !4, !3}
!llvm.ident = !{!5}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!6}

!0 = !{void (float*, %struct.MyStruct**, i32)* @_Z8mykernelPfPP8MyStructi, !"kernel", i32 1}
!1 = !{null, !"align", i32 8}
!2 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!3 = !{null, !"align", i32 16}
!4 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!5 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!6 = !{i32 1, i32 2}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !13, i64 0}
!12 = !{!"_ZTS8MyStruct", !13, i64 0, !14, i64 4}
!13 = !{!"float", !9, i64 0}
!14 = !{!"int", !9, i64 0}
!15 = !{!12, !14, i64 4}
!16 = !{!13, !13, i64 0}
