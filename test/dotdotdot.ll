%"class.Eigen::StreamInterface" = type { i32 (...)** }

define void @_Z7test_siPf(%"class.Eigen::StreamInterface"* %data) #1 {
    ret void
}

; so we have a kernel function
define void @_Z11test_floatsPf(float* %data) #1 {
    %1 = getelementptr inbounds float, float * %data, i64 1
    %2 = load float, float* %1, align 4
    store float %2, float *%data, align 4
    ret void
}

!nvvm.annotations = !{!0}

!0 = !{void (float*)* @_Z11test_floatsPf, !"kernel", i32 1}
