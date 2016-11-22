define float @someFunc(float * %d1, float * %v1) {
    ret float 3.0
}

define void @someKernel(float * %d1, float * %d2) {
    %1 = alloca float *, i32 1
    %2 = load float *, float **%1
    %3 = call float @someFunc(float *%d1, float *%2)
    ret void
}

@mysharedmem = internal addrspace(3) global [8 x float] zeroinitializer, align 4
@anothershared = internal addrspace(3) global [12 x i32] zeroinitializer, align 4

define void @usesShared(float addrspace(1) *%d1) {
    %1 = getelementptr inbounds [8 x float], [8 x float]* addrspacecast ([8 x float] addrspace(3) *@mysharedmem to [8 x float]*), i32 0
    ret void
}

define void @usesShared2(float addrspace(1) *%d1) {
    %1 = getelementptr inbounds [8 x float], [8 x float]* addrspacecast ([8 x float] addrspace(3) *@mysharedmem to [8 x float]*), i32 0
    %2 = getelementptr inbounds [12 x i32], [12 x i32]* addrspacecast ([12 x i32] addrspace(3) *@anothershared to [12 x i32]*), i32 0
    ret void
}

define float *@returnsPointer(float *%in) {
    ret float * %in
}

define void @usesPointerFunction(float *%in) {
    call float *@returnsPointer(float *%in)
    ret void
}
