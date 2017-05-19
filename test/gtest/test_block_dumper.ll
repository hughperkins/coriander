%"struct.mystruct" = type { i32, float, float*, float* }

define i32 @main(%"struct.mystruct" *%structs) {
  %1 = add i32 5, 3
  %2 = add i32 %1, 7
  %3 = fadd float 8.0, 3.0
  %4 = fadd float %3, 9.0
  %5 = fdiv float %4, %3
  %6 = alloca i32, i32 1
  %7 = load i32, i32 *%6
  %8 = alloca float, i32 1
  store float %5, float *%8
  %9 = fcmp olt float %3, 4.0
  %10 = icmp slt i32 %2, 4
  %11 = trunc i32 %7 to i8
  %12 = fadd double 8.0, 3.0
  %13 = fptrunc double %12 to float
  %14 = fpext float %13 to double
  %15 = zext i32 %7 to i64
  %16 = sext i32 %7 to i64
  %17 = fptoui float %4 to i32
  %18 = fptosi float %4 to i32
  %19 = uitofp i32 %2 to float
  %20 = sitofp i32 %2 to float
  %21 = bitcast float *%8 to i32*
  %22 = addrspacecast float* %8 to float addrspace(1) *
  %23 = bitcast float %3 to i32
  %24 = alloca %struct.mystruct, i32 1
  %25 = load %struct.mystruct, %struct.mystruct* %24
  %26 = extractvalue %struct.mystruct %25, 0
  %27 = insertvalue %struct.mystruct %25, i32 4, 0
  %28 = insertvalue %struct.mystruct %27, float 1.5, 1
  %29 = getelementptr %struct.mystruct , %struct.mystruct *%24, i32 0, i32 0
  %30 = getelementptr %struct.mystruct , %struct.mystruct *%24, i32 0, i32 1
  %31 = icmp slt i32 %2, 4
  %32 = select i1 %31, i32 21, i32 44

  %33 = alloca i64, i32 1

  store float %3, float *%8
  store float %4, float *%8

  store i64 %15, i64 *%33
  store i64 %16, i64 *%33
  store i32 %17, i32 *%6
  store i32 %18, i32 *%6
  store float %19, float *%8
  store float %20, float *%8
;  store i32 %21, i32 *%6
 ; store i32 %22, i32 *%6
  ;store i32 %24, i32 *%6

  store %struct.mystruct %28, %struct.mystruct *%structs

  store i32 %32, i32 *%6

  ret i32 0
}

define float addrspace(1) *@someFunc(float addrspace(1) * %d1, float addrspace(1) * %v1) {
    ret float addrspace(1) *%v1
}

define void @someKernel(float addrspace(1) * %d1, float addrspace(1) * %d2) {
    %1 = alloca float addrspace(1)*, i32 1
    %2 = load float addrspace(1) *, float addrspace(1) **%1
    %3 = call float addrspace(1) * @someFunc(float addrspace(1) *%d1, float addrspace(1) *%2)
    ret void
}

@mysharedmem = internal addrspace(3) global [8 x float] zeroinitializer, align 4

define void @usesShared(float addrspace(1) *%d1) {
    %1 = getelementptr inbounds [8 x float], [8 x float]* addrspacecast ([8 x float] addrspace(3) *@mysharedmem to [8 x float]*), i32 0
    %2 = getelementptr inbounds [8 x float], [8 x float]* addrspacecast ([8 x float] addrspace(3)* @mysharedmem to [8 x float]*), i64 0, i64 0
    %3 = getelementptr inbounds [8 x float], [8 x float]* addrspacecast ([8 x float] addrspace(3)* @mysharedmem to [8 x float]*), i64 0, i64 2
    store float 4.0, float *%2
    store float 3.0, float *%3
    ret void
}

define float *@returnsPointer(float *%in) {
    ret float * %in
}

define void @usesPointerFunction(float *%in) {
    call float *@returnsPointer(float *%in)
    ret void
}

define void @llvm.dbg.value(float *%foo, i64 %i1) {
    ret void
}

define void @containsLlvmDebug(float *%d1) {
    tail call void @llvm.dbg.value(float* %d1, i64 0)
    ret void
}

define i32 @usestructs(%"struct.mystruct" *%structs) {
  %1 = alloca %struct.mystruct, i32 1
  %2 = load %struct.mystruct, %struct.mystruct* %1
  %3 = getelementptr %struct.mystruct , %struct.mystruct *%1, i32 0, i32 1
  %4 = alloca float, i32 1
  %5 = load float, float *%4
  store float %5, float *%3

  %6 = insertvalue %struct.mystruct undef, i32 45, 0
  %7 = insertvalue %struct.mystruct %6, float 3.5, 1
  store %struct.mystruct %7, %struct.mystruct *%structs

  %8 = extractvalue %struct.mystruct %7, 1
  store float %8, float *%3

  ret i32 0
}

define void @storefloat(float *%data) {
  %1 = fadd float 5.0, 3.0
  store float %1, float *%data
  ret void
}

define void @test_bitcast(i32 *%data) {
  %1 = fadd float 5.0, 3.0
  %2 = bitcast float %1 to i32
  store i32 %2, i32* %data
  ret void
}

define void @test_ieee_doubles(double *%data) {
  store double 0x43EFFE0000000000, double* %data
  %1 = getelementptr inbounds double, double* %data, i64 0
  store double 0x43DFFC0000000000, double* %1
  %2 = getelementptr inbounds double, double* %data, i64 1
  store double 0xFFF0000000000000, double* %2   ; -INFINITY
  %3 = getelementptr inbounds double, double* %data, i64 2
  store double 0x7FF0000000000000, double* %3   ; INFINITY
  %4 = getelementptr inbounds double, double* %data, i64 3
  store double 0xFFEFFFFFFFFFFFFF, double* %4   ; -INFINITY
  ret void
}

%"class.tensorflow::random::Array" = type {
  [4 x i32],
  [4 x float]
}

define void @test_randomintarray(i32 *%data) {
  %1 = alloca %"class.tensorflow::random::Array", i32 1
  %2 = load %"class.tensorflow::random::Array", %"class.tensorflow::random::Array"* %1
  %3 = extractvalue %"class.tensorflow::random::Array" %2, 0
  %4 = extractvalue [4 x i32] %3, 0
  %5 = extractvalue [4 x i32] %3, 1
  %6 = extractvalue [4 x i32] %3, 2
  %7 = add i32 %4, %5
  %8 = add i32 %7, %6
  store i32 %8, i32* %data
  ret void
}
