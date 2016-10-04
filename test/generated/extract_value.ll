; ModuleID = 'test/extract_value.cu'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.float4 = type { float, float, float, float }

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)) #3
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #1

; Function Attrs: nounwind
define void @_Z13extract_valueP6float4Pf(%struct.float4* %in, float* %out) #0 {
  %1 = alloca %struct.float4*, align 8
  %2 = alloca float*, align 8
  %myfloat4 = alloca %struct.float4, align 16
  store %struct.float4* %in, %struct.float4** %1, align 8
  store float* %out, float** %2, align 8
  %3 = load %struct.float4*, %struct.float4** %1, align 8
  %4 = getelementptr inbounds %struct.float4, %struct.float4* %3, i64 0
  %5 = bitcast %struct.float4* %myfloat4 to i8*
  %6 = bitcast %struct.float4* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 16, i32 16, i1 false)
  %7 = getelementptr inbounds %struct.float4, %struct.float4* %myfloat4, i32 0, i32 0
  %8 = load float, float* %7, align 16
  %9 = load float*, float** %2, align 8
  %10 = getelementptr inbounds float, float* %9, i64 1
  store float %8, float* %10, align 4
  %11 = getelementptr inbounds %struct.float4, %struct.float4* %myfloat4, i32 0, i32 2
  %12 = load float, float* %11, align 8
  %13 = load float*, float** %2, align 8
  %14 = getelementptr inbounds float, float* %13, i64 0
  store float %12, float* %14, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_20" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readnone }

!nvvm.annotations = !{!0, !1, !2, !1, !3, !3, !3, !3, !4, !4, !3}
!llvm.ident = !{!5}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!6}

!0 = !{void (%struct.float4*, float*)* @_Z13extract_valueP6float4Pf, !"kernel", i32 1}
!1 = !{null, !"align", i32 8}
!2 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!3 = !{null, !"align", i32 16}
!4 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!5 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!6 = !{i32 1, i32 2}
