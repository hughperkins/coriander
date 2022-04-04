define float @someFunc(float * %d1, float *%v1) {
    %1 = fadd float 3.0, 4.0
    %2 = load float, float *%d1
    %3 = getelementptr float , float *%d1, i32 3
    store float %2, float *%3
    ret float 4.5
}

define void @someKernel(float * %d1, float * %d2) {
    %1 = alloca float *, i32 1
    %2 = load float *, float **%1
    %3 = load float *, float **%1
    %4 = call float @someFunc(float *%d1, float *%2)
    %5 = call float @someFunc(float *%2, float *%d1)
    %6 = call float @someFunc(float *%d1, float *%d1)
    %7 = call float @someFunc(float *%2, float *%3)
    ret void
}
