define float @someFunc(float * %d1, float * %v1) {
    ret float 3.0
}

define void @someKernel(float * %d1, float * %d2) {
    %1 = alloca float *, i32 1
    %2 = load float *, float **%1
    %3 = call float @someFunc(float *%d1, float *%2)
    ret void
}

define i32 @someFuncInts(i32 * %d1, i32 * %v1) {
    ret i32 3
}

define void @someKernelInts(i32 * %d1, i32 * %d2) {
    %1 = alloca i32 *, i32 1
    %2 = load i32 *, i32 **%1
    %3 = call i32 @someFuncInts(i32 *%d1, i32 *%2)
    ret void
}

@mysharedmem = internal addrspace(3) global [8 x float] zeroinitializer, align 4
@anothershared = internal addrspace(3) global [12 x i32] zeroinitializer, align 4

define void @usesShared(float addrspace(1) *%d1) {
    %1 = getelementptr inbounds [8 x float], [8 x float]* addrspacecast ([8 x float] addrspace(3) *@mysharedmem to [8 x float]*), i32 0, i32 3
    %2 = alloca float, i32 1
    %3 = load float, float* %2
    store float %3, float * %1
    ret void
}

define void @usesShared2(float addrspace(1) *%d1) {
    %1 = getelementptr inbounds [8 x float], [8 x float]* addrspacecast ([8 x float] addrspace(3) *@mysharedmem to [8 x float]*), i32 0, i32 3
    %2 = getelementptr inbounds [12 x i32], [12 x i32]* addrspacecast ([12 x i32] addrspace(3) *@anothershared to [12 x i32]*), i32 0, i32 7
    %3 = alloca float, i32 1
    %4 = alloca i32, i32 1
    %5 = load float, float *%3
    %6 = load i32, i32 *%4
    store float %5, float *%1
    store i32 %6, i32 *%2
    ret void
}

define float *@returnsPointer(float *%in) {
    ret float * %in
}

define void @usesPointerFunction(float *%in) {
    call float *@returnsPointer(float *%in)
    ret void
}

define float @returnsFloatConstant(float *%in) {
    ret float 4.5
}

define void @testBranches_nophi(float *%d1) {
label1:
    %0 = fadd float 3.0, 4.0
    %1 = alloca float, i32 1
    store float %0, float *%1
    br label %label2

label2:
    %2 = fadd float 5.0, 7.0
    %3 = fcmp ogt float %2, 6.0
    br i1 %3, label %label1, label %label2
}

define void @testBranches_onephi(float *%d1) {
label1:
    %0 = fadd float 3.0, 4.0
    br label %label2

label2:
    %1 = phi float [%0, %label1], [%2, %label2]
    %2 = fadd float %1, 7.0
    %3 = fcmp ogt float %2, 6.0
    br i1 %3, label %label1, label %label2
}

define void @testBranches_phifromfuture(float *%d1) {
label1:
    %0 = fadd float 3.0, 4.0
    br label %label2

label2:
    %1 = phi float [%0, %label1], [%2, %label2], [%4, %label3]
    %2 = fadd float %1, 7.0
    %3 = fcmp ogt float %2, 6.0
    br i1 %3, label %label1, label %label2

label3:
    %4 = fadd float 8.0, 2.0
    br label %label2
}

define void @testBranches_phifromfloat(float *%d1) {
label1:
    %0 = fadd float 3.0, 4.0
    br label %label2

label2:
    %1 = phi float [123.0, %label1], [%2, %label2], [%4, %label3]
    %2 = fadd float %1, 7.0
    %3 = fcmp ogt float %2, 6.0
    br i1 %3, label %label1, label %label2

label3:
    %4 = fadd float 8.0, 2.0
    br label %label2
}

; from test/cocl/multigpu.cu
define void @multigpu_Z8getValuePf(float* nocapture %outdata) {
  br label %2

; <label>:1                                       ; preds = %2
  %.lcssa = phi float [ %16, %2 ]
  store float %.lcssa, float* %outdata
  ret void

; <label>:2                                       ; preds = %2, %0
  %i.02 = phi i32 [ 1, %0 ], [ %17, %2 ]
  %sum.01 = phi float [ 0.000000e+00, %0 ], [ %16, %2 ]
  %3 = sext i32 %i.02 to i64
  %4 = getelementptr inbounds float, float* %outdata, i64 %3
  %5 = load float, float* %4
  %6 = fadd float %sum.01, %5
  %7 = add nuw nsw i32 %i.02, 1
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, float* %outdata, i64 %8
  %10 = load float, float* %9
  %11 = fadd float %6, %10
  %12 = add nsw i32 %i.02, 2
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float* %outdata, i64 %13
  %15 = load float, float* %14
  %16 = fadd float %11, %15
  %17 = add nsw i32 %i.02, 3
  %exitcond.2 = icmp eq i32 %17, 1024
  br i1 %exitcond.2, label %1, label %2
}
