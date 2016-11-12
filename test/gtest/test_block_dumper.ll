define i32 @main() {
  %1 = add i32 5, 3
  %2 = add i32 %1, 7
  %3 = fadd float 8.0, 3.0
  %4 = fadd float %3, 9.0
  %5 = fdiv float %4, %3
  ret i32 0
}
