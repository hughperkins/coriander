; couldnt figure out how to convince cuda to compile into extractvalue ll, so just
; writing extractvalue into raw ll


%struct.float4 = type { float, float, float, float }

; Function Attrs: norecurse nounwind readnone
define void @_Z11test_floatsPf(float* %data) #1 {
    %1 = getelementptr inbounds float, float * %data, i64 1
    %2 = load float, float* %1, align 4
    store float %2, float *%data, align 4
    ret void
}

; Function Attrs: norecurse nounwind readnone
define void @_Z19test_float4P6float4Pf(%struct.float4 * nocapture %data, float* nocapture %data2) #1 {
    %1 = load %struct.float4, %struct.float4* %data, align 16
    %2 = extractvalue %struct.float4 %1, 1
    store float %2, float *%data2, align 4

;    %privateFloats = alloca %struct.float4, align 16
;    %1 = getelementptr inbounds %struct.float4, %struct.float4* %privateFloats, i64 0
;    %2 = getelementptr inbounds %struct.float4, %struct.float4* %data, i64 0
;    %3 = bitcast %struct.float4* %1 to i8*
;    %4 = bitcast %struct.float4* %2 to i8*
;    call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 16, i32 16, i1 false)
;    %5 = getelementptr %struct.float4, %struct.float4* %privateFloats, i64 0
;    %6 = extractvalue %struct.float4 %5, 1
;    store float %5, float *%data2, align 4
    ret void
}

!nvvm.annotations = !{!0, !1}

!0 = !{void (float*)* @_Z11test_floatsPf, !"kernel", i32 1}
!1 = !{void (%struct.float4*, float*)* @_Z19test_float4P6float4Pf, !"kernel", i32 1}
