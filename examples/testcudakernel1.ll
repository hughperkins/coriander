; ModuleID = 'examples/testcudakernel1.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #5
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
  %1 = load float, float* %a, align 4, !tbaa !26
  %2 = fadd float %1, 3.000000e+00
  store float %2, float* %a, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z3fooPf(float* nocapture %data) #2 {
  store float 1.230000e+02, float* %data, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z7use_tidPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z8use_tid2Pi(i32* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds i32, i32* %data, i64 %2
  %4 = load i32, i32* %3, align 4, !tbaa !30
  %5 = add nsw i32 %4, %1
  store i32 %5, i32* %3, align 4, !tbaa !30
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z10copy_floatPf(float* nocapture %a) #2 {
  %1 = getelementptr inbounds float, float* %a, i64 1
  %2 = bitcast float* %1 to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !26
  %4 = bitcast float* %a to i32*
  store i32 %3, i32* %4, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11use_blockidPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #7
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11use_griddimPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.nctaid.x() #7
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z12use_blockdimPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.ntid.x() #7
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z13use_template1PfPi(float* nocapture %data, i32* nocapture %intdata) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %14

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds float, float* %data, i64 1
  %5 = load float, float* %4, align 4, !tbaa !26
  %6 = getelementptr inbounds float, float* %data, i64 2
  %7 = load float, float* %6, align 4, !tbaa !26
  %8 = fadd float %5, %7
  store float %8, float* %data, align 4, !tbaa !26
  %9 = getelementptr inbounds i32, i32* %intdata, i64 1
  %10 = load i32, i32* %9, align 4, !tbaa !30
  %11 = getelementptr inbounds i32, i32* %intdata, i64 2
  %12 = load i32, i32* %11, align 4, !tbaa !30
  %13 = add nsw i32 %12, %10
  store i32 %13, i32* %intdata, align 4, !tbaa !30
  br label %14

; <label>:14                                      ; preds = %3, %0
  ret void
}

define void @_Z13someops_floatPf(float* nocapture %data) #3 {
  %1 = getelementptr inbounds float, float* %data, i64 1
  %2 = load float, float* %1, align 4, !tbaa !26
  %3 = getelementptr inbounds float, float* %data, i64 2
  %4 = load float, float* %3, align 4, !tbaa !26
  %5 = fsub float %2, %4
  %6 = fdiv float %2, %4
  %7 = fadd float %5, %6
  %8 = fmul float %4, %2
  %9 = fadd float %7, %8
  store float %9, float* %data, align 4, !tbaa !26
  %10 = tail call float @_Z15our_pretend_logf(float %2)
  %11 = load float, float* %data, align 4, !tbaa !26
  %12 = fadd float %10, %11
  store float %12, float* %data, align 4, !tbaa !26
  %13 = load float, float* %1, align 4, !tbaa !26
  %14 = tail call float @_Z15our_pretend_expf(float %13)
  %15 = load float, float* %data, align 4, !tbaa !26
  %16 = fadd float %14, %15
  store float %16, float* %data, align 4, !tbaa !26
  %17 = load float, float* %1, align 4, !tbaa !26
  %18 = tail call float @_Z16our_pretend_tanhf(float %17)
  %19 = load float, float* %data, align 4, !tbaa !26
  %20 = fadd float %18, %19
  %21 = load float, float* %1, align 4, !tbaa !26
  %22 = fpext float %21 to double
  %23 = tail call double @llvm.nvvm.sqrt.rn.d(double %22) #7
  %24 = fpext float %20 to double
  %25 = fsub double %24, %23
  %26 = fptrunc double %25 to float
  store float %26, float* %data, align 4, !tbaa !26
  ret void
}

declare float @_Z15our_pretend_logf(float) #3

declare float @_Z15our_pretend_expf(float) #3

declare float @_Z16our_pretend_tanhf(float) #3

; Function Attrs: norecurse nounwind
define void @_Z11someops_intPi(i32* nocapture %data) #2 {
  %1 = getelementptr inbounds i32, i32* %data, i64 1
  %2 = load i32, i32* %1, align 4, !tbaa !30
  %3 = getelementptr inbounds i32, i32* %data, i64 2
  %4 = load i32, i32* %3, align 4, !tbaa !30
  %5 = sdiv i32 %2, %4
  %6 = add i32 %2, %5
  %7 = add i32 %6, %2
  %8 = mul nsw i32 %4, %2
  %9 = add nsw i32 %8, %7
  %10 = shl i32 %2, %4
  %11 = add nsw i32 %10, %9
  %12 = ashr i32 %2, %4
  %13 = add nsw i32 %12, %11
  store i32 %13, i32* %data, align 4, !tbaa !30
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z14testbooleanopsPi(i32* nocapture %data) #2 {
  %1 = load i32, i32* %data, align 4, !tbaa !30
  %2 = icmp sgt i32 %1, 0
  %3 = getelementptr inbounds i32, i32* %data, i64 1
  %4 = load i32, i32* %3, align 4, !tbaa !30
  %5 = icmp slt i32 %4, 0
  %6 = and i1 %2, %5
  %7 = zext i1 %6 to i32
  %8 = getelementptr inbounds i32, i32* %data, i64 2
  store i32 %7, i32* %8, align 4, !tbaa !30
  %9 = or i1 %2, %5
  %10 = zext i1 %9 to i32
  %11 = getelementptr inbounds i32, i32* %data, i64 3
  store i32 %10, i32* %11, align 4, !tbaa !30
  %12 = zext i1 %2 to i32
  %13 = xor i32 %12, 1
  %14 = getelementptr inbounds i32, i32* %data, i64 4
  store i32 %13, i32* %14, align 4, !tbaa !30
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z26testcomparisons_int_signedPi(i32* nocapture %data) #2 {
  %1 = load i32, i32* %data, align 4, !tbaa !30
  %2 = getelementptr inbounds i32, i32* %data, i64 1
  %3 = load i32, i32* %2, align 4, !tbaa !30
  %4 = icmp sge i32 %1, %3
  %5 = zext i1 %4 to i32
  %6 = getelementptr inbounds i32, i32* %data, i64 5
  store i32 %5, i32* %6, align 4, !tbaa !30
  %7 = icmp sle i32 %1, %3
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds i32, i32* %data, i64 6
  store i32 %8, i32* %9, align 4, !tbaa !30
  %10 = icmp sgt i32 %1, %3
  %11 = zext i1 %10 to i32
  %12 = getelementptr inbounds i32, i32* %data, i64 7
  store i32 %11, i32* %12, align 4, !tbaa !30
  %13 = icmp slt i32 %1, %3
  %14 = zext i1 %13 to i32
  %15 = getelementptr inbounds i32, i32* %data, i64 8
  store i32 %14, i32* %15, align 4, !tbaa !30
  %16 = icmp eq i32 %1, %3
  %17 = zext i1 %16 to i32
  %18 = getelementptr inbounds i32, i32* %data, i64 9
  store i32 %17, i32* %18, align 4, !tbaa !30
  %19 = icmp ne i32 %1, %3
  %20 = zext i1 %19 to i32
  %21 = getelementptr inbounds i32, i32* %data, i64 10
  store i32 %20, i32* %21, align 4, !tbaa !30
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z21testcomparisons_floatPf(float* nocapture %data) #2 {
  %1 = load float, float* %data, align 4, !tbaa !26
  %2 = getelementptr inbounds float, float* %data, i64 1
  %3 = load float, float* %2, align 4, !tbaa !26
  %4 = fcmp oge float %1, %3
  %5 = uitofp i1 %4 to float
  %6 = getelementptr inbounds float, float* %data, i64 5
  store float %5, float* %6, align 4, !tbaa !26
  %7 = fcmp ole float %1, %3
  %8 = uitofp i1 %7 to float
  %9 = getelementptr inbounds float, float* %data, i64 6
  store float %8, float* %9, align 4, !tbaa !26
  %10 = fcmp ogt float %1, %3
  %11 = uitofp i1 %10 to float
  %12 = getelementptr inbounds float, float* %data, i64 7
  store float %11, float* %12, align 4, !tbaa !26
  %13 = fcmp olt float %1, %3
  %14 = uitofp i1 %13 to float
  %15 = getelementptr inbounds float, float* %data, i64 8
  store float %14, float* %15, align 4, !tbaa !26
  %16 = fcmp oeq float %1, %3
  %17 = uitofp i1 %16 to float
  %18 = getelementptr inbounds float, float* %data, i64 9
  store float %17, float* %18, align 4, !tbaa !26
  %19 = fcmp une float %1, %3
  %20 = uitofp i1 %19 to float
  %21 = getelementptr inbounds float, float* %data, i64 10
  store float %20, float* %21, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z15testsyncthreadsPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  %4 = load float, float* %3, align 4, !tbaa !26
  %5 = fmul float %4, 2.000000e+00
  store float %5, float* %3, align 4, !tbaa !26
  tail call void @llvm.cuda.syncthreads() #7
  %6 = add nsw i32 %1, 1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds float, float* %data, i64 %7
  %9 = load float, float* %8, align 4, !tbaa !26
  %10 = fadd float %9, 2.000000e+00
  store float %10, float* %8, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind readonly
define void @_Z11testDoWhilePii(i32* nocapture %data, i32 %N) #4 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  br label %2

; <label>:2                                       ; preds = %2, %0
  %p.0 = phi i32 [ %1, %0 ], [ %3, %2 ]
  %3 = add nsw i32 %p.0, 1
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32* %data, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !30
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %2

; <label>:8                                       ; preds = %2
  ret void
}

; Function Attrs: norecurse nounwind readonly
define void @_Z9testWhilePii(i32* nocapture %data, i32 %N) #4 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  br label %2

; <label>:2                                       ; preds = %2, %0
  %p.0 = phi i32 [ %1, %0 ], [ %7, %2 ]
  %3 = sext i32 %p.0 to i64
  %4 = getelementptr inbounds i32, i32* %data, i64 %3
  %5 = load i32, i32* %4, align 4, !tbaa !30
  %6 = icmp eq i32 %5, 0
  %7 = add nsw i32 %p.0, 1
  br i1 %6, label %8, label %2

; <label>:8                                       ; preds = %2
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z6testIfPii(i32* nocapture %data, i32 %N) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  %2 = icmp slt i32 %1, %N
  br i1 %2, label %3, label %8

; <label>:3                                       ; preds = %0
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds i32, i32* %data, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !30
  %7 = shl nsw i32 %6, 1
  store i32 %7, i32* %5, align 4, !tbaa !30
  br label %8

; <label>:8                                       ; preds = %3, %0
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z10testIfElsePii(i32* nocapture %data, i32 %N) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  %2 = icmp slt i32 %1, %N
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds i32, i32* %data, i64 %3
  %5 = load i32, i32* %4, align 4, !tbaa !30
  br i1 %2, label %6, label %13

; <label>:6                                       ; preds = %0
  %7 = shl nsw i32 %5, 1
  store i32 %7, i32* %4, align 4, !tbaa !30
  %8 = add nsw i32 %1, 3
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32* %data, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !30
  %12 = shl nsw i32 %11, 1
  store i32 %12, i32* %10, align 4, !tbaa !30
  br label %20

; <label>:13                                      ; preds = %0
  %14 = add nsw i32 %5, -20
  store i32 %14, i32* %4, align 4, !tbaa !30
  %15 = add nsw i32 %1, 5
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %data, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !30
  %19 = add nsw i32 %18, -20
  store i32 %19, i32* %17, align 4, !tbaa !30
  br label %20

; <label>:20                                      ; preds = %13, %6
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11testTernaryPf(float* nocapture %data) #2 {
  %1 = getelementptr inbounds float, float* %data, i64 1
  %2 = load float, float* %1, align 4, !tbaa !26
  %3 = fcmp ogt float %2, 0.000000e+00
  %4 = getelementptr inbounds float, float* %data, i64 2
  %5 = getelementptr inbounds float, float* %data, i64 3
  %.in = select i1 %3, float* %4, float* %5
  %6 = bitcast float* %.in to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !26
  %8 = bitcast float* %data to i32*
  store i32 %7, i32* %8, align 4, !tbaa !26
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z7testForPfi(float* nocapture %data, i32 %N) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #7
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %.preheader, label %31

.preheader:                                       ; preds = %0
  %3 = icmp sgt i32 %N, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %4 = add i32 %N, -1
  %xtraiter = and i32 %N, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.preheader.split, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %i.02.prol = phi i32 [ %9, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %sum.01.prol = phi float [ %8, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %5 = sext i32 %i.02.prol to i64
  %6 = getelementptr inbounds float, float* %data, i64 %5
  %7 = load float, float* %6, align 4, !tbaa !26
  %8 = fadd float %sum.01.prol, %7
  %9 = add nuw nsw i32 %i.02.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.preheader.split.loopexit, label %.lr.ph.prol, !llvm.loop !32

.lr.ph.preheader.split.loopexit:                  ; preds = %.lr.ph.prol
  %.lcssa5 = phi i32 [ %9, %.lr.ph.prol ]
  %.lcssa4 = phi float [ %8, %.lr.ph.prol ]
  br label %.lr.ph.preheader.split

.lr.ph.preheader.split:                           ; preds = %.lr.ph.preheader.split.loopexit, %.lr.ph.preheader
  %.lcssa.unr = phi float [ undef, %.lr.ph.preheader ], [ %.lcssa4, %.lr.ph.preheader.split.loopexit ]
  %i.02.unr = phi i32 [ 0, %.lr.ph.preheader ], [ %.lcssa5, %.lr.ph.preheader.split.loopexit ]
  %sum.01.unr = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %.lcssa4, %.lr.ph.preheader.split.loopexit ]
  %10 = icmp ult i32 %4, 3
  br i1 %10, label %._crit_edge.loopexit, label %.lr.ph.preheader.split.split

.lr.ph.preheader.split.split:                     ; preds = %.lr.ph.preheader.split
  br label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %.lcssa3 = phi float [ %29, %.lr.ph ]
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.preheader.split, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi float [ %.lcssa.unr, %.lr.ph.preheader.split ], [ %.lcssa3, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %sum.0.lcssa = phi float [ 0.000000e+00, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  store float %sum.0.lcssa, float* %data, align 4, !tbaa !26
  br label %31

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.split.split
  %i.02 = phi i32 [ %i.02.unr, %.lr.ph.preheader.split.split ], [ %30, %.lr.ph ]
  %sum.01 = phi float [ %sum.01.unr, %.lr.ph.preheader.split.split ], [ %29, %.lr.ph ]
  %11 = sext i32 %i.02 to i64
  %12 = getelementptr inbounds float, float* %data, i64 %11
  %13 = load float, float* %12, align 4, !tbaa !26
  %14 = fadd float %sum.01, %13
  %15 = add nuw nsw i32 %i.02, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float* %data, i64 %16
  %18 = load float, float* %17, align 4, !tbaa !26
  %19 = fadd float %14, %18
  %20 = add nsw i32 %i.02, 2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %data, i64 %21
  %23 = load float, float* %22, align 4, !tbaa !26
  %24 = fadd float %19, %23
  %25 = add nsw i32 %i.02, 3
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float* %data, i64 %26
  %28 = load float, float* %27, align 4, !tbaa !26
  %29 = fadd float %24, %28
  %30 = add nsw i32 %i.02, 4
  %exitcond.3 = icmp eq i32 %30, %N
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

; <label>:31                                      ; preds = %._crit_edge, %0
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #5

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ctaid.x() #5

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.nctaid.x() #5

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ntid.x() #5

; Function Attrs: noduplicate nounwind
declare void @llvm.cuda.syncthreads() #6

; Function Attrs: nounwind readnone
declare double @llvm.nvvm.sqrt.rn.d(double) #5

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { noduplicate nounwind }
attributes #7 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !20, !22, !22, !22, !22, !23, !23, !22}
!llvm.ident = !{!24}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!25}

!0 = !{void (float*)* @_Z3fooPf, !"kernel", i32 1}
!1 = !{void (float*)* @_Z7use_tidPf, !"kernel", i32 1}
!2 = !{void (i32*)* @_Z8use_tid2Pi, !"kernel", i32 1}
!3 = !{void (float*)* @_Z10copy_floatPf, !"kernel", i32 1}
!4 = !{void (float*)* @_Z11use_blockidPf, !"kernel", i32 1}
!5 = !{void (float*)* @_Z11use_griddimPf, !"kernel", i32 1}
!6 = !{void (float*)* @_Z12use_blockdimPf, !"kernel", i32 1}
!7 = !{void (float*, i32*)* @_Z13use_template1PfPi, !"kernel", i32 1}
!8 = !{void (float*)* @_Z13someops_floatPf, !"kernel", i32 1}
!9 = !{void (i32*)* @_Z11someops_intPi, !"kernel", i32 1}
!10 = !{void (i32*)* @_Z14testbooleanopsPi, !"kernel", i32 1}
!11 = !{void (i32*)* @_Z26testcomparisons_int_signedPi, !"kernel", i32 1}
!12 = !{void (float*)* @_Z21testcomparisons_floatPf, !"kernel", i32 1}
!13 = !{void (float*)* @_Z15testsyncthreadsPf, !"kernel", i32 1}
!14 = !{void (i32*, i32)* @_Z11testDoWhilePii, !"kernel", i32 1}
!15 = !{void (i32*, i32)* @_Z9testWhilePii, !"kernel", i32 1}
!16 = !{void (i32*, i32)* @_Z6testIfPii, !"kernel", i32 1}
!17 = !{void (i32*, i32)* @_Z10testIfElsePii, !"kernel", i32 1}
!18 = !{void (float*)* @_Z11testTernaryPf, !"kernel", i32 1}
!19 = !{void (float*, i32)* @_Z7testForPfi, !"kernel", i32 1}
!20 = !{null, !"align", i32 8}
!21 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!22 = !{null, !"align", i32 16}
!23 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!24 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!25 = !{i32 1, i32 2}
!26 = !{!27, !27, i64 0}
!27 = !{!"float", !28, i64 0}
!28 = !{!"omnipotent char", !29, i64 0}
!29 = !{!"Simple C/C++ TBAA"}
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !28, i64 0}
!32 = distinct !{!32, !33}
!33 = !{!"llvm.loop.unroll.disable"}
