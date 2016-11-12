define float *@someFunc(float * %d1, float *%v1) {
    %1 = fadd float 3.0, 4.0
    %2 = load float, float *%d1

    ret float *%v1
}

define void @someKernel(float * %d1, float * %d2) {
    %1 = alloca float *, i32 1
    %2 = load float *, float **%1
    %3 = call float * @someFunc(float *%d1, float *%2)
    ret void
}
