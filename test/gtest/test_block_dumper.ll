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
  ret i32 0
}
