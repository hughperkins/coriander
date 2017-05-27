define void @kernel_float_constants(float* nocapture %data) #1 {
  store float 0x3E7AD7F2A0000000, float* %data
  ; %1 = getelementptr inbounds float, float* %data, i64 1
  ; store float 0x43DFFC0000000000, float* %1
  ; %2 = getelementptr inbounds float, float* %data, i64 2
  ; store float 0xFFF0000000000000, float* %2
  ; %3 = getelementptr inbounds float, float* %data, i64 3
  ; store float 0x7FF0000000000000, float* %3
  ; %4 = getelementptr inbounds float, float* %data, i64 4
  ; store float 0xFFEFFFFFFFFFFFFF, float* %4
  ret void
}
