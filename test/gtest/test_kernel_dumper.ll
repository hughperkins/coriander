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
    %3 = call float @someFunc(float *%d1, float *%2)
    %4 = call float @someFunc(float *%2, float *%d1)
    %5 = call float @someFunc(float *%d1, float *%d1)
    ret void
}

;  %29 = getelementptr %struct.mystruct , %struct.mystruct *%24, i32 0, i32 0

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

define float *@returnsPointer(float *%in) {
    ret float * %in
}

define void @usesPointerFunction(float *%in) {
    call float *@returnsPointer(float *%in)
    %2 = alloca float, i32 1
    call float *@returnsPointer(float *%2)
    ret void
}

define void @returnsVoid(float *%in) {
    store float 3.0, float * %in
    ret void
}

define void @usesFunctionReturningVoid(float *%in) {
    call void @returnsVoid(float *%in)
    ret void
}

define void @mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamea(float *%d) {
    ret void
}

define void @mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnameb(float *%d) {
    ret void
}

define void @mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamec(float *%d) {
    call void @mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamea(float *%d)
    call void @mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnameb(float *%d)
    ret void
}

%"class.tensorflow::random::Array" = type { [4 x i32] }

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
