; ModuleID = 'examples/testcudakernel1.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.MyStruct = type { i32, float }
%struct.float4 = type { float, float, float, float }

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@_ZZ9testLocalPfE8myshared = internal unnamed_addr addrspace(3) global [32 x float] zeroinitializer, align 4
@_ZZ10testLocal2PfE8myshared = internal unnamed_addr addrspace(3) global [64 x float] zeroinitializer, align 4
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #6
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
  %1 = load float, float* %a, align 4, !tbaa !32
  %2 = fadd float %1, 3.000000e+00
  store float %2, float* %a, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z3fooPf(float* nocapture %data) #2 {
  store float 1.230000e+02, float* %data, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z7use_tidPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !32
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: norecurse nounwind
define void @_Z8use_tid2Pi(i32* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds i32, i32* %data, i64 %2
  %4 = load i32, i32* %3, align 4, !tbaa !36
  %5 = add nsw i32 %4, %1
  store i32 %5, i32* %3, align 4, !tbaa !36
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z10copy_floatPf(float* nocapture %a) #2 {
  %1 = getelementptr inbounds float, float* %a, i64 1
  %2 = bitcast float* %1 to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !32
  %4 = bitcast float* %a to i32*
  store i32 %3, i32* %4, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11use_blockidPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11use_griddimPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.nctaid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z12use_blockdimPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.ntid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  store float 1.230000e+02, float* %3, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z13use_template1PfPi(float* nocapture %data, i32* nocapture %intdata) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %14

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds float, float* %data, i64 1
  %5 = load float, float* %4, align 4, !tbaa !32
  %6 = getelementptr inbounds float, float* %data, i64 2
  %7 = load float, float* %6, align 4, !tbaa !32
  %8 = fadd float %5, %7
  store float %8, float* %data, align 4, !tbaa !32
  %9 = getelementptr inbounds i32, i32* %intdata, i64 1
  %10 = load i32, i32* %9, align 4, !tbaa !36
  %11 = getelementptr inbounds i32, i32* %intdata, i64 2
  %12 = load i32, i32* %11, align 4, !tbaa !36
  %13 = add nsw i32 %12, %10
  store i32 %13, i32* %intdata, align 4, !tbaa !36
  br label %14

; <label>:14                                      ; preds = %3, %0
  ret void
}

define void @_Z13someops_floatPf(float* nocapture %data) #4 {
  %1 = getelementptr inbounds float, float* %data, i64 1
  %2 = load float, float* %1, align 4, !tbaa !32
  %3 = getelementptr inbounds float, float* %data, i64 2
  %4 = load float, float* %3, align 4, !tbaa !32
  %5 = fsub float %2, %4
  %6 = fdiv float %2, %4
  %7 = fadd float %5, %6
  %8 = fmul float %4, %2
  %9 = fadd float %7, %8
  store float %9, float* %data, align 4, !tbaa !32
  %10 = tail call float @_Z15our_pretend_logf(float %2)
  %11 = load float, float* %data, align 4, !tbaa !32
  %12 = fadd float %10, %11
  store float %12, float* %data, align 4, !tbaa !32
  %13 = load float, float* %1, align 4, !tbaa !32
  %14 = tail call float @_Z15our_pretend_expf(float %13)
  %15 = load float, float* %data, align 4, !tbaa !32
  %16 = fadd float %14, %15
  store float %16, float* %data, align 4, !tbaa !32
  %17 = load float, float* %1, align 4, !tbaa !32
  %18 = tail call float @_Z16our_pretend_tanhf(float %17)
  %19 = load float, float* %data, align 4, !tbaa !32
  %20 = fadd float %18, %19
  store float %20, float* %data, align 4, !tbaa !32
  %21 = load float, float* %1, align 4, !tbaa !32
  %22 = tail call float @_ZSt4sqrtf(float %21)
  %23 = load float, float* %data, align 4, !tbaa !32
  %24 = fsub float %23, %22
  store float %24, float* %data, align 4, !tbaa !32
  ret void
}

declare float @_Z15our_pretend_logf(float) #4

declare float @_Z15our_pretend_expf(float) #4

declare float @_Z16our_pretend_tanhf(float) #4

declare float @_ZSt4sqrtf(float) #4

; Function Attrs: norecurse nounwind
define void @_Z11someops_intPi(i32* nocapture %data) #2 {
  %1 = getelementptr inbounds i32, i32* %data, i64 1
  %2 = load i32, i32* %1, align 4, !tbaa !36
  %3 = getelementptr inbounds i32, i32* %data, i64 2
  %4 = load i32, i32* %3, align 4, !tbaa !36
  %5 = sdiv i32 %2, %4
  %6 = add i32 %2, %5
  %7 = add i32 %6, %2
  %8 = mul nsw i32 %4, %2
  %9 = add nsw i32 %8, %7
  %10 = shl i32 %2, %4
  %11 = add nsw i32 %10, %9
  %12 = ashr i32 %2, %4
  %13 = add nsw i32 %12, %11
  store i32 %13, i32* %data, align 4, !tbaa !36
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z14testbooleanopsPi(i32* nocapture %data) #2 {
  %1 = load i32, i32* %data, align 4, !tbaa !36
  %2 = icmp sgt i32 %1, 0
  %3 = getelementptr inbounds i32, i32* %data, i64 1
  %4 = load i32, i32* %3, align 4, !tbaa !36
  %5 = icmp slt i32 %4, 0
  %6 = and i1 %2, %5
  %7 = zext i1 %6 to i32
  %8 = getelementptr inbounds i32, i32* %data, i64 2
  store i32 %7, i32* %8, align 4, !tbaa !36
  %9 = or i1 %2, %5
  %10 = zext i1 %9 to i32
  %11 = getelementptr inbounds i32, i32* %data, i64 3
  store i32 %10, i32* %11, align 4, !tbaa !36
  %12 = zext i1 %2 to i32
  %13 = xor i32 %12, 1
  %14 = getelementptr inbounds i32, i32* %data, i64 4
  store i32 %13, i32* %14, align 4, !tbaa !36
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z26testcomparisons_int_signedPi(i32* nocapture %data) #2 {
  %1 = load i32, i32* %data, align 4, !tbaa !36
  %2 = getelementptr inbounds i32, i32* %data, i64 1
  %3 = load i32, i32* %2, align 4, !tbaa !36
  %4 = icmp sge i32 %1, %3
  %5 = zext i1 %4 to i32
  %6 = getelementptr inbounds i32, i32* %data, i64 5
  store i32 %5, i32* %6, align 4, !tbaa !36
  %7 = icmp sle i32 %1, %3
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds i32, i32* %data, i64 6
  store i32 %8, i32* %9, align 4, !tbaa !36
  %10 = icmp sgt i32 %1, %3
  %11 = zext i1 %10 to i32
  %12 = getelementptr inbounds i32, i32* %data, i64 7
  store i32 %11, i32* %12, align 4, !tbaa !36
  %13 = icmp slt i32 %1, %3
  %14 = zext i1 %13 to i32
  %15 = getelementptr inbounds i32, i32* %data, i64 8
  store i32 %14, i32* %15, align 4, !tbaa !36
  %16 = icmp eq i32 %1, %3
  %17 = zext i1 %16 to i32
  %18 = getelementptr inbounds i32, i32* %data, i64 9
  store i32 %17, i32* %18, align 4, !tbaa !36
  %19 = icmp ne i32 %1, %3
  %20 = zext i1 %19 to i32
  %21 = getelementptr inbounds i32, i32* %data, i64 10
  store i32 %20, i32* %21, align 4, !tbaa !36
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z21testcomparisons_floatPf(float* nocapture %data) #2 {
  %1 = load float, float* %data, align 4, !tbaa !32
  %2 = getelementptr inbounds float, float* %data, i64 1
  %3 = load float, float* %2, align 4, !tbaa !32
  %4 = fcmp oge float %1, %3
  %5 = uitofp i1 %4 to float
  %6 = getelementptr inbounds float, float* %data, i64 5
  store float %5, float* %6, align 4, !tbaa !32
  %7 = fcmp ole float %1, %3
  %8 = uitofp i1 %7 to float
  %9 = getelementptr inbounds float, float* %data, i64 6
  store float %8, float* %9, align 4, !tbaa !32
  %10 = fcmp ogt float %1, %3
  %11 = uitofp i1 %10 to float
  %12 = getelementptr inbounds float, float* %data, i64 7
  store float %11, float* %12, align 4, !tbaa !32
  %13 = fcmp olt float %1, %3
  %14 = uitofp i1 %13 to float
  %15 = getelementptr inbounds float, float* %data, i64 8
  store float %14, float* %15, align 4, !tbaa !32
  %16 = fcmp oeq float %1, %3
  %17 = uitofp i1 %16 to float
  %18 = getelementptr inbounds float, float* %data, i64 9
  store float %17, float* %18, align 4, !tbaa !32
  %19 = fcmp une float %1, %3
  %20 = uitofp i1 %19 to float
  %21 = getelementptr inbounds float, float* %data, i64 10
  store float %20, float* %21, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z15testsyncthreadsPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  %4 = load float, float* %3, align 4, !tbaa !32
  %5 = fmul float %4, 2.000000e+00
  store float %5, float* %3, align 4, !tbaa !32
  tail call void @llvm.cuda.syncthreads() #8
  %6 = add nsw i32 %1, 1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds float, float* %data, i64 %7
  %9 = load float, float* %8, align 4, !tbaa !32
  %10 = fadd float %9, 2.000000e+00
  store float %10, float* %8, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind readonly
define void @_Z11testDoWhilePii(i32* nocapture %data, i32 %N) #5 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  br label %2

; <label>:2                                       ; preds = %2, %0
  %p.0 = phi i32 [ %1, %0 ], [ %3, %2 ]
  %3 = add nsw i32 %p.0, 1
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32* %data, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !36
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %2

; <label>:8                                       ; preds = %2
  ret void
}

; Function Attrs: norecurse nounwind readonly
define void @_Z9testWhilePii(i32* nocapture %data, i32 %N) #5 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  br label %2

; <label>:2                                       ; preds = %2, %0
  %p.0 = phi i32 [ %1, %0 ], [ %7, %2 ]
  %3 = sext i32 %p.0 to i64
  %4 = getelementptr inbounds i32, i32* %data, i64 %3
  %5 = load i32, i32* %4, align 4, !tbaa !36
  %6 = icmp eq i32 %5, 0
  %7 = add nsw i32 %p.0, 1
  br i1 %6, label %8, label %2

; <label>:8                                       ; preds = %2
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z6testIfPii(i32* nocapture %data, i32 %N) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = icmp slt i32 %1, %N
  br i1 %2, label %3, label %8

; <label>:3                                       ; preds = %0
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds i32, i32* %data, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !36
  %7 = shl nsw i32 %6, 1
  store i32 %7, i32* %5, align 4, !tbaa !36
  br label %8

; <label>:8                                       ; preds = %3, %0
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z10testIfElsePii(i32* nocapture %data, i32 %N) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = icmp slt i32 %1, %N
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds i32, i32* %data, i64 %3
  %5 = load i32, i32* %4, align 4, !tbaa !36
  br i1 %2, label %6, label %13

; <label>:6                                       ; preds = %0
  %7 = shl nsw i32 %5, 1
  store i32 %7, i32* %4, align 4, !tbaa !36
  %8 = add nsw i32 %1, 3
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32* %data, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !36
  %12 = shl nsw i32 %11, 1
  store i32 %12, i32* %10, align 4, !tbaa !36
  br label %20

; <label>:13                                      ; preds = %0
  %14 = add nsw i32 %5, -20
  store i32 %14, i32* %4, align 4, !tbaa !36
  %15 = add nsw i32 %1, 5
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %data, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !36
  %19 = add nsw i32 %18, -20
  store i32 %19, i32* %17, align 4, !tbaa !36
  br label %20

; <label>:20                                      ; preds = %13, %6
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11testTernaryPf(float* nocapture %data) #2 {
  %1 = getelementptr inbounds float, float* %data, i64 1
  %2 = load float, float* %1, align 4, !tbaa !32
  %3 = fcmp ogt float %2, 0.000000e+00
  %4 = getelementptr inbounds float, float* %data, i64 2
  %5 = getelementptr inbounds float, float* %data, i64 3
  %.in = select i1 %3, float* %4, float* %5
  %6 = bitcast float* %.in to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !32
  %8 = bitcast float* %data to i32*
  store i32 %7, i32* %8, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z7testForPfi(float* nocapture %data, i32 %N) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
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
  %7 = load float, float* %6, align 4, !tbaa !32
  %8 = fadd float %sum.01.prol, %7
  %9 = add nuw nsw i32 %i.02.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.preheader.split.loopexit, label %.lr.ph.prol, !llvm.loop !38

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
  store float %sum.0.lcssa, float* %data, align 4, !tbaa !32
  br label %31

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.split.split
  %i.02 = phi i32 [ %i.02.unr, %.lr.ph.preheader.split.split ], [ %30, %.lr.ph ]
  %sum.01 = phi float [ %sum.01.unr, %.lr.ph.preheader.split.split ], [ %29, %.lr.ph ]
  %11 = sext i32 %i.02 to i64
  %12 = getelementptr inbounds float, float* %data, i64 %11
  %13 = load float, float* %12, align 4, !tbaa !32
  %14 = fadd float %sum.01, %13
  %15 = add nuw nsw i32 %i.02, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float* %data, i64 %16
  %18 = load float, float* %17, align 4, !tbaa !32
  %19 = fadd float %14, %18
  %20 = add nsw i32 %i.02, 2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %data, i64 %21
  %23 = load float, float* %22, align 4, !tbaa !32
  %24 = fadd float %19, %23
  %25 = add nsw i32 %i.02, 3
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float* %data, i64 %26
  %28 = load float, float* %27, align 4, !tbaa !32
  %29 = fadd float %24, %28
  %30 = add nsw i32 %i.02, 4
  %exitcond.3 = icmp eq i32 %30, %N
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

; <label>:31                                      ; preds = %._crit_edge, %0
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z8setValuePfif(float* nocapture %data, i32 %idx, float %value) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %0
  %4 = sext i32 %idx to i64
  %5 = getelementptr inbounds float, float* %data, i64 %4
  store float %value, float* %5, align 4, !tbaa !32
  br label %6

; <label>:6                                       ; preds = %3, %0
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z11testStructsP8MyStructPfPi(%struct.MyStruct* nocapture readonly %structs, float* nocapture %float_data, i32* nocapture %int_data) #2 {
  %1 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %structs, i64 0, i32 0
  %2 = load i32, i32* %1, align 4, !tbaa !40
  store i32 %2, i32* %int_data, align 4, !tbaa !36
  %3 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %structs, i64 0, i32 1
  %4 = bitcast float* %3 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !42
  %6 = bitcast float* %float_data to i32*
  store i32 %5, i32* %6, align 4, !tbaa !32
  %7 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %structs, i64 1, i32 1
  %8 = bitcast float* %7 to i32*
  %9 = load i32, i32* %8, align 4, !tbaa !42
  %10 = getelementptr inbounds float, float* %float_data, i64 1
  %11 = bitcast float* %10 to i32*
  store i32 %9, i32* %11, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z10testFloat4P6float4(%struct.float4* nocapture %data) #2 {
  %1 = getelementptr inbounds %struct.float4, %struct.float4* %data, i64 1, i32 0
  %2 = bitcast float* %1 to i32*
  %3 = load i32, i32* %2, align 16
  %4 = getelementptr inbounds %struct.float4, %struct.float4* %data, i64 1, i32 2
  %5 = load float, float* %4, align 8
  %6 = getelementptr inbounds %struct.float4, %struct.float4* %data, i64 1, i32 3
  %7 = load float, float* %6, align 4
  %8 = fmul float %5, %7
  %9 = bitcast %struct.float4* %data to i32*
  store i32 %3, i32* %9, align 16
  %10 = getelementptr inbounds %struct.float4, %struct.float4* %data, i64 0, i32 1
  store float %8, float* %10, align 4
  %11 = getelementptr inbounds %struct.float4, %struct.float4* %data, i64 0, i32 2
  store float %5, float* %11, align 8
  %12 = getelementptr inbounds %struct.float4, %struct.float4* %data, i64 0, i32 3
  store float %7, float* %12, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z9testLocalPf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  %4 = bitcast float* %3 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !32
  %6 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9testLocalPfE8myshared, i64 0, i64 %2
  %7 = bitcast float addrspace(3)* %6 to i32 addrspace(3)*
  %8 = addrspacecast i32 addrspace(3)* %7 to i32*
  store i32 %5, i32* %8, align 4, !tbaa !32
  %9 = add nsw i32 %1, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9testLocalPfE8myshared, i64 0, i64 %10
  %12 = bitcast float addrspace(3)* %11 to i32 addrspace(3)*
  %13 = addrspacecast i32 addrspace(3)* %12 to i32*
  %14 = load i32, i32* %13, align 4, !tbaa !32
  %15 = bitcast float* %data to i32*
  store i32 %14, i32* %15, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z10testLocal2Pf(float* nocapture %data) #2 {
  %1 = tail call i32 @llvm.ptx.read.tid.x() #8
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds float, float* %data, i64 %2
  %4 = bitcast float* %3 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !32
  %6 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ10testLocal2PfE8myshared, i64 0, i64 %2
  %7 = bitcast float addrspace(3)* %6 to i32 addrspace(3)*
  %8 = addrspacecast i32 addrspace(3)* %7 to i32*
  store i32 %5, i32* %8, align 4, !tbaa !32
  %9 = add nsw i32 %1, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [64 x float], [64 x float] addrspace(3)* @_ZZ10testLocal2PfE8myshared, i64 0, i64 %10
  %12 = bitcast float addrspace(3)* %11 to i32 addrspace(3)*
  %13 = addrspacecast i32 addrspace(3)* %12 to i32*
  %14 = load i32, i32* %13, align 4, !tbaa !32
  %15 = bitcast float* %data to i32*
  store i32 %14, i32* %15, align 4, !tbaa !32
  %16 = load i32, i32* %4, align 4, !tbaa !32
  store i32 %16, i32* %13, align 4, !tbaa !32
  %17 = load i32, i32* %8, align 4, !tbaa !32
  %18 = getelementptr inbounds float, float* %data, i64 1
  %19 = bitcast float* %18 to i32*
  store i32 %17, i32* %19, align 4, !tbaa !32
  ret void
}

; Function Attrs: norecurse nounwind
define void @_Z9testArrayPf(float* nocapture %data) #2 {
  %privateFloats = alloca [32 x float], align 4
  %1 = bitcast [32 x float]* %privateFloats to i8*
  call void @llvm.lifetime.start(i64 128, i8* %1) #8
  br label %2

; <label>:2                                       ; preds = %2, %0
  %i.03 = phi i32 [ 0, %0 ], [ %38, %2 ]
  %3 = mul nuw nsw i32 %i.03, 3
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds float, float* %data, i64 %4
  %6 = bitcast float* %5 to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !32
  %8 = sext i32 %i.03 to i64
  %9 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 %8
  %10 = bitcast float* %9 to i32*
  store i32 %7, i32* %10, align 4, !tbaa !32
  %11 = or i32 %i.03, 1
  %12 = mul nuw nsw i32 %11, 3
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float* %data, i64 %13
  %15 = bitcast float* %14 to i32*
  %16 = load i32, i32* %15, align 4, !tbaa !32
  %17 = sext i32 %11 to i64
  %18 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 %17
  %19 = bitcast float* %18 to i32*
  store i32 %16, i32* %19, align 4, !tbaa !32
  %20 = or i32 %i.03, 2
  %21 = mul nuw nsw i32 %20, 3
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float* %data, i64 %22
  %24 = bitcast float* %23 to i32*
  %25 = load i32, i32* %24, align 4, !tbaa !32
  %26 = sext i32 %20 to i64
  %27 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 %26
  %28 = bitcast float* %27 to i32*
  store i32 %25, i32* %28, align 4, !tbaa !32
  %29 = or i32 %i.03, 3
  %30 = mul nuw nsw i32 %29, 3
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float* %data, i64 %31
  %33 = bitcast float* %32 to i32*
  %34 = load i32, i32* %33, align 4, !tbaa !32
  %35 = sext i32 %29 to i64
  %36 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 %35
  %37 = bitcast float* %36 to i32*
  store i32 %34, i32* %37, align 4, !tbaa !32
  %38 = add nsw i32 %i.03, 4
  %exitcond.3 = icmp eq i32 %38, 32
  br i1 %exitcond.3, label %.preheader.preheader, label %2

.preheader.preheader:                             ; preds = %2
  %39 = bitcast [32 x float]* %privateFloats to i32*
  %40 = load i32, i32* %39, align 4, !tbaa !32
  %41 = getelementptr inbounds float, float* %data, i64 1
  %42 = bitcast float* %41 to i32*
  store i32 %40, i32* %42, align 4, !tbaa !32
  %43 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 2
  %44 = bitcast float* %43 to i32*
  %45 = load i32, i32* %44, align 4, !tbaa !32
  %46 = getelementptr inbounds float, float* %data, i64 3
  %47 = bitcast float* %46 to i32*
  store i32 %45, i32* %47, align 4, !tbaa !32
  %48 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 4
  %49 = bitcast float* %48 to i32*
  %50 = load i32, i32* %49, align 4, !tbaa !32
  %51 = getelementptr inbounds float, float* %data, i64 5
  %52 = bitcast float* %51 to i32*
  store i32 %50, i32* %52, align 4, !tbaa !32
  %53 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 6
  %54 = bitcast float* %53 to i32*
  %55 = load i32, i32* %54, align 4, !tbaa !32
  %56 = getelementptr inbounds float, float* %data, i64 7
  %57 = bitcast float* %56 to i32*
  store i32 %55, i32* %57, align 4, !tbaa !32
  %58 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 8
  %59 = bitcast float* %58 to i32*
  %60 = load i32, i32* %59, align 4, !tbaa !32
  %61 = getelementptr inbounds float, float* %data, i64 9
  %62 = bitcast float* %61 to i32*
  store i32 %60, i32* %62, align 4, !tbaa !32
  %63 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 10
  %64 = bitcast float* %63 to i32*
  %65 = load i32, i32* %64, align 4, !tbaa !32
  %66 = getelementptr inbounds float, float* %data, i64 11
  %67 = bitcast float* %66 to i32*
  store i32 %65, i32* %67, align 4, !tbaa !32
  %68 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 12
  %69 = bitcast float* %68 to i32*
  %70 = load i32, i32* %69, align 4, !tbaa !32
  %71 = getelementptr inbounds float, float* %data, i64 13
  %72 = bitcast float* %71 to i32*
  store i32 %70, i32* %72, align 4, !tbaa !32
  %73 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 14
  %74 = bitcast float* %73 to i32*
  %75 = load i32, i32* %74, align 4, !tbaa !32
  %76 = getelementptr inbounds float, float* %data, i64 15
  %77 = bitcast float* %76 to i32*
  store i32 %75, i32* %77, align 4, !tbaa !32
  %78 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 16
  %79 = bitcast float* %78 to i32*
  %80 = load i32, i32* %79, align 4, !tbaa !32
  %81 = getelementptr inbounds float, float* %data, i64 17
  %82 = bitcast float* %81 to i32*
  store i32 %80, i32* %82, align 4, !tbaa !32
  %83 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 18
  %84 = bitcast float* %83 to i32*
  %85 = load i32, i32* %84, align 4, !tbaa !32
  %86 = getelementptr inbounds float, float* %data, i64 19
  %87 = bitcast float* %86 to i32*
  store i32 %85, i32* %87, align 4, !tbaa !32
  %88 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 20
  %89 = bitcast float* %88 to i32*
  %90 = load i32, i32* %89, align 4, !tbaa !32
  %91 = getelementptr inbounds float, float* %data, i64 21
  %92 = bitcast float* %91 to i32*
  store i32 %90, i32* %92, align 4, !tbaa !32
  %93 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 22
  %94 = bitcast float* %93 to i32*
  %95 = load i32, i32* %94, align 4, !tbaa !32
  %96 = getelementptr inbounds float, float* %data, i64 23
  %97 = bitcast float* %96 to i32*
  store i32 %95, i32* %97, align 4, !tbaa !32
  %98 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 24
  %99 = bitcast float* %98 to i32*
  %100 = load i32, i32* %99, align 4, !tbaa !32
  %101 = getelementptr inbounds float, float* %data, i64 25
  %102 = bitcast float* %101 to i32*
  store i32 %100, i32* %102, align 4, !tbaa !32
  %103 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 26
  %104 = bitcast float* %103 to i32*
  %105 = load i32, i32* %104, align 4, !tbaa !32
  %106 = getelementptr inbounds float, float* %data, i64 27
  %107 = bitcast float* %106 to i32*
  store i32 %105, i32* %107, align 4, !tbaa !32
  %108 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 28
  %109 = bitcast float* %108 to i32*
  %110 = load i32, i32* %109, align 4, !tbaa !32
  %111 = getelementptr inbounds float, float* %data, i64 29
  %112 = bitcast float* %111 to i32*
  store i32 %110, i32* %112, align 4, !tbaa !32
  %113 = getelementptr inbounds [32 x float], [32 x float]* %privateFloats, i64 0, i64 30
  %114 = bitcast float* %113 to i32*
  %115 = load i32, i32* %114, align 4, !tbaa !32
  %116 = getelementptr inbounds float, float* %data, i64 31
  %117 = bitcast float* %116 to i32*
  store i32 %115, i32* %117, align 4, !tbaa !32
  call void @llvm.lifetime.end(i64 128, i8* nonnull %1) #8
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #6

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ctaid.x() #6

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.nctaid.x() #6

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ntid.x() #6

; Function Attrs: noduplicate nounwind
declare void @llvm.cuda.syncthreads() #7

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { noduplicate nounwind }
attributes #8 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !26, !28, !28, !28, !28, !29, !29, !28}
!llvm.ident = !{!30}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!31}

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
!20 = !{void (float*, i32, float)* @_Z8setValuePfif, !"kernel", i32 1}
!21 = !{void (%struct.MyStruct*, float*, i32*)* @_Z11testStructsP8MyStructPfPi, !"kernel", i32 1}
!22 = !{void (%struct.float4*)* @_Z10testFloat4P6float4, !"kernel", i32 1}
!23 = !{void (float*)* @_Z9testLocalPf, !"kernel", i32 1}
!24 = !{void (float*)* @_Z10testLocal2Pf, !"kernel", i32 1}
!25 = !{void (float*)* @_Z9testArrayPf, !"kernel", i32 1}
!26 = !{null, !"align", i32 8}
!27 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!28 = !{null, !"align", i32 16}
!29 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!30 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!31 = !{i32 1, i32 2}
!32 = !{!33, !33, i64 0}
!33 = !{!"float", !34, i64 0}
!34 = !{!"omnipotent char", !35, i64 0}
!35 = !{!"Simple C/C++ TBAA"}
!36 = !{!37, !37, i64 0}
!37 = !{!"int", !34, i64 0}
!38 = distinct !{!38, !39}
!39 = !{!"llvm.loop.unroll.disable"}
!40 = !{!41, !37, i64 0}
!41 = !{!"_ZTS8MyStruct", !37, i64 0, !33, i64 4}
!42 = !{!41, !33, i64 4}
