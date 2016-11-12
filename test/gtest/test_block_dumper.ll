%"struct.mystruct" = type { i32, float, float*, float* }

define i32 @main() {
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

  ret i32 0
}
