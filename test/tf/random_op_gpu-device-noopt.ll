; ModuleID = 'tensorflow/core/kernels/random_op_gpu.cu.cc'
source_filename = "tensorflow/core/kernels/random_op_gpu.cu.cc"
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"class.tensorflow::random::PhiloxRandom" = type { %"class.tensorflow::random::Array", %"class.tensorflow::random::Array.0" }
%"class.tensorflow::random::Array" = type { [4 x i32] }
%"class.tensorflow::random::Array.0" = type { [2 x i32] }
%"class.tensorflow::random::UniformDistribution" = type { i8 }
%"class.tensorflow::random::NormalDistribution" = type { i8 }
%"class.tensorflow::random::TruncatedNormalDistribution" = type { float }
%"class.tensorflow::random::Array.1" = type { [4 x float] }
%"class.tensorflow::random::SingleSampleAdapter" = type <{ %"class.tensorflow::random::PhiloxRandom"*, %"class.tensorflow::random::Array", i32, [4 x i8] }>

$_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ = comdat any

$_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ = comdat any

$_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_ = comdat any

@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: norecurse nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  ret i32 0
}

; Function Attrs: convergent nounwind
define void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_(%"class.tensorflow::random::PhiloxRandom"* byval nocapture readonly align 4, float* nocapture, i64, %"class.tensorflow::random::UniformDistribution"* byval nocapture readnone align 1) local_unnamed_addr #1 comdat {
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 1
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 2
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 3
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 1
  %16 = bitcast %"class.tensorflow::random::Array.0"* %15 to i64*
  %17 = load i64, i64* %16, align 4
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !9
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !10
  %20 = mul i32 %19, %18
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !11
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !12
  %24 = mul i32 %23, %19
  %25 = shl nsw i32 %22, 2
  %26 = sext i32 %22 to i64
  %27 = lshr i64 %26, 32
  %28 = trunc i64 %27 to i32
  %29 = add i32 %22, %8
  %30 = icmp ult i32 %29, %22
  %31 = zext i1 %30 to i32
  %32 = add i32 %31, %28
  %33 = add i32 %32, %10
  %34 = icmp ult i32 %33, %32
  br i1 %34, label %35, label %40

; <label>:35:                                     ; preds = %4
  %36 = add i32 %12, 1
  %37 = icmp eq i32 %36, 0
  %38 = zext i1 %37 to i32
  %39 = add i32 %38, %14
  br label %40

; <label>:40:                                     ; preds = %35, %4
  %41 = phi i32 [ %12, %4 ], [ %36, %35 ]
  %42 = phi i32 [ %14, %4 ], [ %39, %35 ]
  %43 = sext i32 %25 to i64
  %44 = icmp slt i64 %43, %2
  br i1 %44, label %45, label %227

; <label>:45:                                     ; preds = %40
  %46 = add nsw i32 %24, -1
  %47 = shl i32 %46, 2
  %48 = sext i32 %46 to i64
  %49 = lshr i64 %48, 32
  %50 = trunc i64 %49 to i32
  %51 = trunc i64 %17 to i32
  %52 = lshr i64 %17, 32
  %53 = trunc i64 %52 to i32
  %54 = add i32 %51, -1640531527
  %55 = add i32 %53, -1150833019
  %56 = add i32 %51, 1013904242
  %57 = add i32 %53, 1993301258
  %58 = add i32 %51, -626627285
  %59 = add i32 %53, 842468239
  %60 = add i32 %51, 2027808484
  %61 = add i32 %53, -308364780
  %62 = add i32 %51, 387276957
  %63 = add i32 %53, -1459197799
  %64 = add i32 %51, -1253254570
  %65 = add i32 %53, 1684936478
  %66 = add i32 %51, 1401181199
  %67 = add i32 %53, 534103459
  %68 = add i32 %51, -239350328
  %69 = add i32 %53, -616729560
  %70 = add i32 %51, 7554945
  %71 = add i32 %53, 2433709
  %72 = bitcast i32* %5 to i8*
  %73 = bitcast float* %6 to i8*
  %74 = add i32 %47, 4
  br label %75

; <label>:75:                                     ; preds = %202, %45
  %76 = phi i32 [ %33, %45 ], [ %224, %202 ]
  %77 = phi i32 [ %29, %45 ], [ %220, %202 ]
  %78 = phi i32 [ %41, %45 ], [ %203, %202 ]
  %79 = phi i32 [ %42, %45 ], [ %204, %202 ]
  %80 = phi i32 [ %25, %45 ], [ %219, %202 ]
  %81 = mul i32 %77, -766435501
  %82 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %77) #6
  %83 = mul i32 %78, -845247145
  %84 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %78) #6
  %85 = xor i32 %76, %51
  %86 = xor i32 %85, %84
  %87 = xor i32 %79, %53
  %88 = xor i32 %87, %82
  %89 = mul i32 %86, -766435501
  %90 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %86) #6
  %91 = mul i32 %88, -845247145
  %92 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %88) #6
  %93 = xor i32 %83, %54
  %94 = xor i32 %93, %92
  %95 = xor i32 %81, %55
  %96 = xor i32 %95, %90
  %97 = mul i32 %94, -766435501
  %98 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %94) #6
  %99 = mul i32 %96, -845247145
  %100 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %96) #6
  %101 = xor i32 %91, %56
  %102 = xor i32 %101, %100
  %103 = xor i32 %89, %57
  %104 = xor i32 %103, %98
  %105 = mul i32 %102, -766435501
  %106 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %102) #6
  %107 = mul i32 %104, -845247145
  %108 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %104) #6
  %109 = xor i32 %99, %58
  %110 = xor i32 %109, %108
  %111 = xor i32 %97, %59
  %112 = xor i32 %111, %106
  %113 = mul i32 %110, -766435501
  %114 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %110) #6
  %115 = mul i32 %112, -845247145
  %116 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %112) #6
  %117 = xor i32 %107, %60
  %118 = xor i32 %117, %116
  %119 = xor i32 %105, %61
  %120 = xor i32 %119, %114
  %121 = mul i32 %118, -766435501
  %122 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %118) #6
  %123 = mul i32 %120, -845247145
  %124 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %120) #6
  %125 = xor i32 %115, %62
  %126 = xor i32 %125, %124
  %127 = xor i32 %113, %63
  %128 = xor i32 %127, %122
  %129 = mul i32 %126, -766435501
  %130 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %126) #6
  %131 = mul i32 %128, -845247145
  %132 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %128) #6
  %133 = xor i32 %123, %64
  %134 = xor i32 %133, %132
  %135 = xor i32 %121, %65
  %136 = xor i32 %135, %130
  %137 = mul i32 %134, -766435501
  %138 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %134) #6
  %139 = mul i32 %136, -845247145
  %140 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %136) #6
  %141 = xor i32 %131, %66
  %142 = xor i32 %141, %140
  %143 = xor i32 %129, %67
  %144 = xor i32 %143, %138
  %145 = mul i32 %142, -766435501
  %146 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %142) #6
  %147 = mul i32 %144, -845247145
  %148 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %144) #6
  %149 = xor i32 %139, %68
  %150 = xor i32 %149, %148
  %151 = xor i32 %137, %69
  %152 = xor i32 %151, %146
  %153 = mul i32 %150, -766435501
  %154 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %150) #6
  %155 = mul i32 %152, -845247145
  %156 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %152) #6
  %157 = xor i32 %147, %70
  %158 = xor i32 %157, %156
  %159 = xor i32 %145, %71
  %160 = xor i32 %159, %154
  %161 = icmp eq i32 %77, -1
  br i1 %161, label %162, label %170

; <label>:162:                                    ; preds = %75
  %163 = add i32 %76, 1
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %170

; <label>:165:                                    ; preds = %162
  %166 = add i32 %78, 1
  %167 = icmp eq i32 %166, 0
  %168 = zext i1 %167 to i32
  %169 = add i32 %168, %79
  br label %170

; <label>:170:                                    ; preds = %165, %75, %162
  %171 = phi i32 [ %163, %162 ], [ %76, %75 ], [ 0, %165 ]
  %172 = phi i32 [ %78, %162 ], [ %78, %75 ], [ %166, %165 ]
  %173 = phi i32 [ %79, %162 ], [ %79, %75 ], [ %169, %165 ]
  %174 = and i32 %158, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %72) #5
  %175 = or i32 %174, 1065353216
  store i32 %175, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %73) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %73, i8* nonnull %72, i64 4) #6
  %176 = load float, float* %6, align 4, !tbaa !17
  call void @llvm.lifetime.end(i64 4, i8* nonnull %73) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %72) #5
  %177 = and i32 %155, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %72) #5
  %178 = or i32 %177, 1065353216
  store i32 %178, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %73) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %73, i8* nonnull %72, i64 4) #6
  %179 = load float, float* %6, align 4, !tbaa !17
  %180 = fadd float %179, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %73) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %72) #5
  %181 = and i32 %160, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %72) #5
  %182 = or i32 %181, 1065353216
  store i32 %182, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %73) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %73, i8* nonnull %72, i64 4) #6
  %183 = load float, float* %6, align 4, !tbaa !17
  %184 = fadd float %183, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %73) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %72) #5
  %185 = and i32 %153, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %72) #5
  %186 = or i32 %185, 1065353216
  store i32 %186, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %73) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %73, i8* nonnull %72, i64 4) #6
  %187 = load float, float* %6, align 4, !tbaa !17
  %188 = fadd float %187, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %73) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %72) #5
  %189 = sext i32 %80 to i64
  %190 = icmp slt i64 %189, %2
  br i1 %190, label %191, label %226

; <label>:191:                                    ; preds = %170
  %192 = fadd float %176, -1.000000e+00
  %193 = getelementptr inbounds float, float* %1, i64 %189
  store float %192, float* %193, align 4, !tbaa !17
  %194 = or i32 %80, 1
  %195 = sext i32 %194 to i64
  %196 = icmp slt i64 %195, %2
  br i1 %196, label %207, label %226

; <label>:197:                                    ; preds = %217
  %198 = add i32 %172, 1
  %199 = icmp eq i32 %198, 0
  %200 = zext i1 %199 to i32
  %201 = add i32 %200, %173
  br label %202

; <label>:202:                                    ; preds = %197, %217
  %203 = phi i32 [ %172, %217 ], [ %198, %197 ]
  %204 = phi i32 [ %173, %217 ], [ %201, %197 ]
  %205 = sext i32 %219 to i64
  %206 = icmp slt i64 %205, %2
  br i1 %206, label %75, label %226

; <label>:207:                                    ; preds = %191
  %208 = getelementptr inbounds float, float* %1, i64 %195
  store float %180, float* %208, align 4, !tbaa !17
  %209 = or i32 %80, 2
  %210 = sext i32 %209 to i64
  %211 = icmp slt i64 %210, %2
  br i1 %211, label %212, label %226

; <label>:212:                                    ; preds = %207
  %213 = getelementptr inbounds float, float* %1, i64 %210
  store float %184, float* %213, align 4, !tbaa !17
  %214 = or i32 %80, 3
  %215 = sext i32 %214 to i64
  %216 = icmp slt i64 %215, %2
  br i1 %216, label %217, label %226

; <label>:217:                                    ; preds = %212
  %218 = getelementptr inbounds float, float* %1, i64 %215
  store float %188, float* %218, align 4, !tbaa !17
  %219 = add i32 %74, %80
  %220 = add i32 %77, %24
  %221 = icmp ult i32 %220, %46
  %222 = zext i1 %221 to i32
  %223 = add i32 %222, %50
  %224 = add i32 %171, %223
  %225 = icmp ult i32 %224, %223
  br i1 %225, label %197, label %202

; <label>:226:                                    ; preds = %212, %207, %202, %191, %170
  br label %227

; <label>:227:                                    ; preds = %226, %40
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3

; Function Attrs: convergent nounwind
declare i32 @_Z8__umulhiii(i32, i32) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare void @_Z6memcpyPvPKvm(i8*, i8*, i64) local_unnamed_addr #4

; Function Attrs: convergent nounwind
define void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_(%"class.tensorflow::random::PhiloxRandom"* byval nocapture readonly align 4, float* nocapture, i64, %"class.tensorflow::random::NormalDistribution"* byval nocapture readnone align 1) local_unnamed_addr #1 comdat {
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 0
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 1
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 2
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 3
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 1
  %18 = bitcast %"class.tensorflow::random::Array.0"* %17 to i64*
  %19 = load i64, i64* %18, align 4
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !9
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !10
  %22 = mul i32 %21, %20
  %23 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !11
  %24 = add i32 %22, %23
  %25 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !12
  %26 = mul i32 %25, %21
  %27 = shl nsw i32 %24, 2
  %28 = sext i32 %24 to i64
  %29 = lshr i64 %28, 32
  %30 = trunc i64 %29 to i32
  %31 = add i32 %24, %10
  %32 = icmp ult i32 %31, %24
  %33 = zext i1 %32 to i32
  %34 = add i32 %33, %30
  %35 = add i32 %34, %12
  %36 = icmp ult i32 %35, %34
  br i1 %36, label %37, label %42

; <label>:37:                                     ; preds = %4
  %38 = add i32 %14, 1
  %39 = icmp eq i32 %38, 0
  %40 = zext i1 %39 to i32
  %41 = add i32 %40, %16
  br label %42

; <label>:42:                                     ; preds = %37, %4
  %43 = phi i32 [ %14, %4 ], [ %38, %37 ]
  %44 = phi i32 [ %16, %4 ], [ %41, %37 ]
  %45 = sext i32 %27 to i64
  %46 = icmp slt i64 %45, %2
  br i1 %46, label %47, label %255

; <label>:47:                                     ; preds = %42
  %48 = bitcast i32* %7 to i8*
  %49 = bitcast float* %8 to i8*
  %50 = bitcast i32* %5 to i8*
  %51 = bitcast float* %6 to i8*
  %52 = add nsw i32 %26, -1
  %53 = shl i32 %52, 2
  %54 = sext i32 %52 to i64
  %55 = lshr i64 %54, 32
  %56 = trunc i64 %55 to i32
  %57 = trunc i64 %19 to i32
  %58 = lshr i64 %19, 32
  %59 = trunc i64 %58 to i32
  %60 = add i32 %57, -1640531527
  %61 = add i32 %59, -1150833019
  %62 = add i32 %57, 1013904242
  %63 = add i32 %59, 1993301258
  %64 = add i32 %57, -626627285
  %65 = add i32 %59, 842468239
  %66 = add i32 %57, 2027808484
  %67 = add i32 %59, -308364780
  %68 = add i32 %57, 387276957
  %69 = add i32 %59, -1459197799
  %70 = add i32 %57, -1253254570
  %71 = add i32 %59, 1684936478
  %72 = add i32 %57, 1401181199
  %73 = add i32 %59, 534103459
  %74 = add i32 %57, -239350328
  %75 = add i32 %59, -616729560
  %76 = add i32 %57, 7554945
  %77 = add i32 %59, 2433709
  %78 = add i32 %53, 4
  br label %79

; <label>:79:                                     ; preds = %230, %47
  %80 = phi i32 [ %35, %47 ], [ %252, %230 ]
  %81 = phi i32 [ %31, %47 ], [ %248, %230 ]
  %82 = phi i32 [ %43, %47 ], [ %231, %230 ]
  %83 = phi i32 [ %44, %47 ], [ %232, %230 ]
  %84 = phi i32 [ %27, %47 ], [ %247, %230 ]
  %85 = mul i32 %81, -766435501
  %86 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %81) #6
  %87 = mul i32 %82, -845247145
  %88 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %82) #6
  %89 = xor i32 %80, %57
  %90 = xor i32 %89, %88
  %91 = xor i32 %83, %59
  %92 = xor i32 %91, %86
  %93 = mul i32 %90, -766435501
  %94 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %90) #6
  %95 = mul i32 %92, -845247145
  %96 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %92) #6
  %97 = xor i32 %87, %60
  %98 = xor i32 %97, %96
  %99 = xor i32 %85, %61
  %100 = xor i32 %99, %94
  %101 = mul i32 %98, -766435501
  %102 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %98) #6
  %103 = mul i32 %100, -845247145
  %104 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %100) #6
  %105 = xor i32 %95, %62
  %106 = xor i32 %105, %104
  %107 = xor i32 %93, %63
  %108 = xor i32 %107, %102
  %109 = mul i32 %106, -766435501
  %110 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %106) #6
  %111 = mul i32 %108, -845247145
  %112 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %108) #6
  %113 = xor i32 %103, %64
  %114 = xor i32 %113, %112
  %115 = xor i32 %101, %65
  %116 = xor i32 %115, %110
  %117 = mul i32 %114, -766435501
  %118 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %114) #6
  %119 = mul i32 %116, -845247145
  %120 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %116) #6
  %121 = xor i32 %111, %66
  %122 = xor i32 %121, %120
  %123 = xor i32 %109, %67
  %124 = xor i32 %123, %118
  %125 = mul i32 %122, -766435501
  %126 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %122) #6
  %127 = mul i32 %124, -845247145
  %128 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %124) #6
  %129 = xor i32 %119, %68
  %130 = xor i32 %129, %128
  %131 = xor i32 %117, %69
  %132 = xor i32 %131, %126
  %133 = mul i32 %130, -766435501
  %134 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %130) #6
  %135 = mul i32 %132, -845247145
  %136 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %132) #6
  %137 = xor i32 %127, %70
  %138 = xor i32 %137, %136
  %139 = xor i32 %125, %71
  %140 = xor i32 %139, %134
  %141 = mul i32 %138, -766435501
  %142 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %138) #6
  %143 = mul i32 %140, -845247145
  %144 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %140) #6
  %145 = xor i32 %135, %72
  %146 = xor i32 %145, %144
  %147 = xor i32 %133, %73
  %148 = xor i32 %147, %142
  %149 = mul i32 %146, -766435501
  %150 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %146) #6
  %151 = mul i32 %148, -845247145
  %152 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %148) #6
  %153 = xor i32 %143, %74
  %154 = xor i32 %153, %152
  %155 = xor i32 %141, %75
  %156 = xor i32 %155, %150
  %157 = mul i32 %154, -766435501
  %158 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %154) #6
  %159 = mul i32 %156, -845247145
  %160 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %156) #6
  %161 = xor i32 %151, %76
  %162 = xor i32 %161, %160
  %163 = xor i32 %149, %77
  %164 = xor i32 %163, %158
  %165 = icmp eq i32 %81, -1
  br i1 %165, label %166, label %174

; <label>:166:                                    ; preds = %79
  %167 = add i32 %80, 1
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %169, label %174

; <label>:169:                                    ; preds = %166
  %170 = add i32 %82, 1
  %171 = icmp eq i32 %170, 0
  %172 = zext i1 %171 to i32
  %173 = add i32 %172, %83
  br label %174

; <label>:174:                                    ; preds = %169, %79, %166
  %175 = phi i32 [ %167, %166 ], [ %80, %79 ], [ 0, %169 ]
  %176 = phi i32 [ %82, %166 ], [ %82, %79 ], [ %170, %169 ]
  %177 = phi i32 [ %83, %166 ], [ %83, %79 ], [ %173, %169 ]
  %178 = and i32 %162, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %48) #5
  %179 = or i32 %178, 1065353216
  store i32 %179, i32* %7, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %49) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %49, i8* nonnull %48, i64 4) #6
  %180 = load float, float* %8, align 4, !tbaa !17
  %181 = fadd float %180, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %49) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %48) #5
  %182 = fcmp olt float %181, 0x3E7AD7F2A0000000
  %183 = select i1 %182, float 0x3E7AD7F2A0000000, float %181
  %184 = and i32 %159, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %50) #5
  %185 = or i32 %184, 1065353216
  store i32 %185, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %51) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %51, i8* nonnull %50, i64 4) #6
  %186 = load float, float* %6, align 4, !tbaa !17
  %187 = fadd float %186, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %51) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %50) #5
  %188 = fpext float %187 to double
  %189 = fmul double %188, 0x401921FB54442D18
  %190 = fptrunc double %189 to float
  %191 = call float @_Z3logf(float %183) #6
  %192 = fmul float %191, -2.000000e+00
  %193 = call float @_Z4sqrtf(float %192) #6
  %194 = call float @_Z4sinff(float %190) #6
  %195 = call float @_Z4cosff(float %190) #6
  %196 = fmul float %193, %195
  %197 = and i32 %164, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %48) #5
  %198 = or i32 %197, 1065353216
  store i32 %198, i32* %7, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %49) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %49, i8* nonnull %48, i64 4) #6
  %199 = load float, float* %8, align 4, !tbaa !17
  %200 = fadd float %199, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %49) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %48) #5
  %201 = fcmp olt float %200, 0x3E7AD7F2A0000000
  %202 = select i1 %201, float 0x3E7AD7F2A0000000, float %200
  %203 = and i32 %157, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %50) #5
  %204 = or i32 %203, 1065353216
  store i32 %204, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %51) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %51, i8* nonnull %50, i64 4) #6
  %205 = load float, float* %6, align 4, !tbaa !17
  %206 = fadd float %205, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %51) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %50) #5
  %207 = fpext float %206 to double
  %208 = fmul double %207, 0x401921FB54442D18
  %209 = fptrunc double %208 to float
  %210 = call float @_Z3logf(float %202) #6
  %211 = fmul float %210, -2.000000e+00
  %212 = call float @_Z4sqrtf(float %211) #6
  %213 = call float @_Z4sinff(float %209) #6
  %214 = call float @_Z4cosff(float %209) #6
  %215 = fmul float %212, %213
  %216 = fmul float %212, %214
  %217 = sext i32 %84 to i64
  %218 = icmp slt i64 %217, %2
  br i1 %218, label %219, label %254

; <label>:219:                                    ; preds = %174
  %220 = fmul float %193, %194
  %221 = getelementptr inbounds float, float* %1, i64 %217
  store float %220, float* %221, align 4, !tbaa !17
  %222 = or i32 %84, 1
  %223 = sext i32 %222 to i64
  %224 = icmp slt i64 %223, %2
  br i1 %224, label %235, label %254

; <label>:225:                                    ; preds = %245
  %226 = add i32 %176, 1
  %227 = icmp eq i32 %226, 0
  %228 = zext i1 %227 to i32
  %229 = add i32 %228, %177
  br label %230

; <label>:230:                                    ; preds = %225, %245
  %231 = phi i32 [ %176, %245 ], [ %226, %225 ]
  %232 = phi i32 [ %177, %245 ], [ %229, %225 ]
  %233 = sext i32 %247 to i64
  %234 = icmp slt i64 %233, %2
  br i1 %234, label %79, label %254

; <label>:235:                                    ; preds = %219
  %236 = getelementptr inbounds float, float* %1, i64 %223
  store float %196, float* %236, align 4, !tbaa !17
  %237 = or i32 %84, 2
  %238 = sext i32 %237 to i64
  %239 = icmp slt i64 %238, %2
  br i1 %239, label %240, label %254

; <label>:240:                                    ; preds = %235
  %241 = getelementptr inbounds float, float* %1, i64 %238
  store float %215, float* %241, align 4, !tbaa !17
  %242 = or i32 %84, 3
  %243 = sext i32 %242 to i64
  %244 = icmp slt i64 %243, %2
  br i1 %244, label %245, label %254

; <label>:245:                                    ; preds = %240
  %246 = getelementptr inbounds float, float* %1, i64 %243
  store float %216, float* %246, align 4, !tbaa !17
  %247 = add i32 %78, %84
  %248 = add i32 %81, %26
  %249 = icmp ult i32 %248, %52
  %250 = zext i1 %249 to i32
  %251 = add i32 %250, %56
  %252 = add i32 %175, %251
  %253 = icmp ult i32 %252, %251
  br i1 %253, label %225, label %230

; <label>:254:                                    ; preds = %240, %235, %230, %219, %174
  br label %255

; <label>:255:                                    ; preds = %254, %42
  ret void
}

; Function Attrs: convergent nounwind
declare float @_Z4sqrtf(float) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare float @_Z3logf(float) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare float @_Z4sinff(float) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare float @_Z4cosff(float) local_unnamed_addr #4

; Function Attrs: convergent nounwind
define void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_(%"class.tensorflow::random::PhiloxRandom"* byval nocapture readonly align 4, float* nocapture, i64, %"class.tensorflow::random::TruncatedNormalDistribution"* byval nocapture readonly align 4) local_unnamed_addr #1 comdat {
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca %"class.tensorflow::random::Array.1", align 4
  %10 = alloca %"class.tensorflow::random::PhiloxRandom", align 4
  %11 = alloca %"class.tensorflow::random::SingleSampleAdapter", align 8
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !9
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !10
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !11
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !12
  %18 = mul i32 %17, %13
  %19 = sext i32 %16 to i64
  %20 = shl nsw i64 %19, 2
  %21 = icmp slt i64 %20, %2
  br i1 %21, label %22, label %412

; <label>:22:                                     ; preds = %4
  %23 = getelementptr inbounds %"class.tensorflow::random::TruncatedNormalDistribution", %"class.tensorflow::random::TruncatedNormalDistribution"* %3, i64 0, i32 0
  %24 = load float, float* %23, align 4, !tbaa !17
  %25 = bitcast %"class.tensorflow::random::PhiloxRandom"* %10 to i8*
  %26 = bitcast %"class.tensorflow::random::PhiloxRandom"* %0 to i8*
  %27 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %10, i64 0, i32 0, i32 0, i64 0
  %28 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %10, i64 0, i32 0, i32 0, i64 1
  %29 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %10, i64 0, i32 0, i32 0, i64 2
  %30 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %10, i64 0, i32 0, i32 0, i64 3
  %31 = bitcast %"class.tensorflow::random::SingleSampleAdapter"* %11 to i8*
  %32 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 0
  %33 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 0
  %34 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 1
  %35 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 2
  %36 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 3
  %37 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 2
  %38 = bitcast %"class.tensorflow::random::Array.1"* %9 to i8*
  %39 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 0
  %40 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 1
  %41 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 2
  %42 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 3
  %43 = bitcast i32* %7 to i8*
  %44 = bitcast float* %8 to i8*
  %45 = bitcast i32* %5 to i8*
  %46 = bitcast float* %6 to i8*
  %47 = bitcast %"class.tensorflow::random::Array.1"* %9 to i32*
  %48 = bitcast float* %40 to i32*
  %49 = bitcast float* %41 to i32*
  %50 = bitcast float* %42 to i32*
  %51 = shl i32 %18, 2
  %52 = add i32 %51, -4
  %53 = sext i32 %52 to i64
  %54 = sext i32 %18 to i64
  %55 = add nsw i64 %53, 4
  %56 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %10, i64 0, i32 1
  %57 = bitcast %"class.tensorflow::random::Array.0"* %56 to i64*
  br label %58

; <label>:58:                                     ; preds = %405, %22
  %59 = phi i64 [ %20, %22 ], [ %408, %405 ]
  %60 = phi i64 [ %19, %22 ], [ %409, %405 ]
  call void @llvm.lifetime.start(i64 24, i8* nonnull %25) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %25, i8* nonnull %26, i64 24, i32 4, i1 false) #5, !tbaa.struct !19
  %61 = trunc i64 %60 to i32
  %62 = shl i32 %61, 8
  %63 = lshr i64 %60, 24
  %64 = trunc i64 %63 to i32
  %65 = load i32, i32* %27, align 4, !tbaa !13
  %66 = add i32 %65, %62
  store i32 %66, i32* %27, align 4, !tbaa !13
  %67 = icmp ult i32 %66, %62
  %68 = zext i1 %67 to i32
  %69 = add i32 %68, %64
  %70 = load i32, i32* %28, align 4, !tbaa !13
  %71 = add i32 %69, %70
  store i32 %71, i32* %28, align 4, !tbaa !13
  %72 = icmp ult i32 %71, %69
  br i1 %72, label %73, label %80

; <label>:73:                                     ; preds = %58
  %74 = load i32, i32* %29, align 4, !tbaa !13
  %75 = add i32 %74, 1
  store i32 %75, i32* %29, align 4, !tbaa !13
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %80

; <label>:77:                                     ; preds = %73
  %78 = load i32, i32* %30, align 4, !tbaa !13
  %79 = add i32 %78, 1
  store i32 %79, i32* %30, align 4, !tbaa !13
  br label %80

; <label>:80:                                     ; preds = %77, %73, %58
  call void @llvm.lifetime.start(i64 32, i8* nonnull %31) #5
  store %"class.tensorflow::random::PhiloxRandom"* %10, %"class.tensorflow::random::PhiloxRandom"** %32, align 8, !tbaa !21
  store i32 0, i32* %33, align 8, !tbaa !13
  store i32 0, i32* %34, align 4, !tbaa !13
  store i32 0, i32* %35, align 8, !tbaa !13
  store i32 0, i32* %36, align 4, !tbaa !13
  store i32 4, i32* %37, align 8, !tbaa !25
  call void @llvm.lifetime.start(i64 16, i8* nonnull %38) #5
  store float 0.000000e+00, float* %39, align 4, !tbaa !17
  store float 0.000000e+00, float* %40, align 4, !tbaa !17
  store float 0.000000e+00, float* %41, align 4, !tbaa !17
  store float 0.000000e+00, float* %42, align 4, !tbaa !17
  br label %81

; <label>:81:                                     ; preds = %378, %80
  %82 = phi i32 [ 4, %80 ], [ %343, %378 ]
  %83 = phi i32 [ 0, %80 ], [ %379, %378 ]
  %84 = icmp eq i32 %82, 4
  br i1 %84, label %85, label %206

; <label>:85:                                     ; preds = %81
  %86 = load i32, i32* %27, align 4
  %87 = load i32, i32* %28, align 4
  %88 = load i32, i32* %29, align 4
  %89 = load i32, i32* %30, align 4
  %90 = load i64, i64* %57, align 4
  %91 = trunc i64 %90 to i32
  %92 = lshr i64 %90, 32
  %93 = trunc i64 %92 to i32
  %94 = mul i32 %86, -766435501
  %95 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %86) #6
  %96 = mul i32 %88, -845247145
  %97 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %88) #6
  %98 = xor i32 %91, %87
  %99 = xor i32 %98, %97
  %100 = xor i32 %95, %89
  %101 = xor i32 %100, %93
  %102 = add i32 %91, -1640531527
  %103 = add i32 %93, -1150833019
  %104 = mul i32 %99, -766435501
  %105 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %99) #6
  %106 = mul i32 %101, -845247145
  %107 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %101) #6
  %108 = xor i32 %102, %96
  %109 = xor i32 %108, %107
  %110 = xor i32 %105, %94
  %111 = xor i32 %110, %103
  %112 = add i32 %91, 1013904242
  %113 = add i32 %93, 1993301258
  %114 = mul i32 %109, -766435501
  %115 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %109) #6
  %116 = mul i32 %111, -845247145
  %117 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %111) #6
  %118 = xor i32 %106, %112
  %119 = xor i32 %118, %117
  %120 = xor i32 %104, %113
  %121 = xor i32 %120, %115
  %122 = add i32 %91, -626627285
  %123 = add i32 %93, 842468239
  %124 = mul i32 %119, -766435501
  %125 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %119) #6
  %126 = mul i32 %121, -845247145
  %127 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %121) #6
  %128 = xor i32 %116, %122
  %129 = xor i32 %128, %127
  %130 = xor i32 %114, %123
  %131 = xor i32 %130, %125
  %132 = add i32 %91, 2027808484
  %133 = add i32 %93, -308364780
  %134 = mul i32 %129, -766435501
  %135 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %129) #6
  %136 = mul i32 %131, -845247145
  %137 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %131) #6
  %138 = xor i32 %126, %132
  %139 = xor i32 %138, %137
  %140 = xor i32 %124, %133
  %141 = xor i32 %140, %135
  %142 = add i32 %91, 387276957
  %143 = add i32 %93, -1459197799
  %144 = mul i32 %139, -766435501
  %145 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %139) #6
  %146 = mul i32 %141, -845247145
  %147 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %141) #6
  %148 = xor i32 %136, %142
  %149 = xor i32 %148, %147
  %150 = xor i32 %134, %143
  %151 = xor i32 %150, %145
  %152 = add i32 %91, -1253254570
  %153 = add i32 %93, 1684936478
  %154 = mul i32 %149, -766435501
  %155 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %149) #6
  %156 = mul i32 %151, -845247145
  %157 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %151) #6
  %158 = xor i32 %146, %152
  %159 = xor i32 %158, %157
  %160 = xor i32 %144, %153
  %161 = xor i32 %160, %155
  %162 = add i32 %91, 1401181199
  %163 = add i32 %93, 534103459
  %164 = mul i32 %159, -766435501
  %165 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %159) #6
  %166 = mul i32 %161, -845247145
  %167 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %161) #6
  %168 = xor i32 %156, %162
  %169 = xor i32 %168, %167
  %170 = xor i32 %154, %163
  %171 = xor i32 %170, %165
  %172 = add i32 %91, -239350328
  %173 = add i32 %93, -616729560
  %174 = mul i32 %169, -766435501
  %175 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %169) #6
  %176 = mul i32 %171, -845247145
  %177 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %171) #6
  %178 = xor i32 %166, %172
  %179 = xor i32 %178, %177
  %180 = xor i32 %164, %173
  %181 = xor i32 %180, %175
  %182 = add i32 %91, -1879881855
  %183 = add i32 %93, -1767562579
  %184 = mul i32 %179, -766435501
  %185 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %179) #6
  %186 = mul i32 %181, -845247145
  %187 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %181) #6
  %188 = xor i32 %176, %182
  %189 = xor i32 %188, %187
  %190 = xor i32 %174, %183
  %191 = xor i32 %190, %185
  %192 = load i32, i32* %27, align 4, !tbaa !13
  %193 = add i32 %192, 1
  store i32 %193, i32* %27, align 4, !tbaa !13
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %333

; <label>:195:                                    ; preds = %85
  %196 = load i32, i32* %28, align 4, !tbaa !13
  %197 = add i32 %196, 1
  store i32 %197, i32* %28, align 4, !tbaa !13
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %333

; <label>:199:                                    ; preds = %195
  %200 = load i32, i32* %29, align 4, !tbaa !13
  %201 = add i32 %200, 1
  store i32 %201, i32* %29, align 4, !tbaa !13
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %203, label %333

; <label>:203:                                    ; preds = %199
  %204 = load i32, i32* %30, align 4, !tbaa !13
  %205 = add i32 %204, 1
  store i32 %205, i32* %30, align 4, !tbaa !13
  br label %333

; <label>:206:                                    ; preds = %81
  %207 = add nsw i32 %82, 1
  store i32 %207, i32* %37, align 8, !tbaa !25
  %208 = sext i32 %82 to i64
  %209 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 %208
  %210 = load i32, i32* %209, align 4, !tbaa !13
  %211 = icmp eq i32 %207, 4
  br i1 %211, label %212, label %340

; <label>:212:                                    ; preds = %206
  %213 = load i32, i32* %27, align 4
  %214 = load i32, i32* %28, align 4
  %215 = load i32, i32* %29, align 4
  %216 = load i32, i32* %30, align 4
  %217 = load i64, i64* %57, align 4
  %218 = trunc i64 %217 to i32
  %219 = lshr i64 %217, 32
  %220 = trunc i64 %219 to i32
  %221 = mul i32 %213, -766435501
  %222 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %213) #6
  %223 = mul i32 %215, -845247145
  %224 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %215) #6
  %225 = xor i32 %218, %214
  %226 = xor i32 %225, %224
  %227 = xor i32 %222, %216
  %228 = xor i32 %227, %220
  %229 = add i32 %218, -1640531527
  %230 = add i32 %220, -1150833019
  %231 = mul i32 %226, -766435501
  %232 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %226) #6
  %233 = mul i32 %228, -845247145
  %234 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %228) #6
  %235 = xor i32 %229, %223
  %236 = xor i32 %235, %234
  %237 = xor i32 %232, %221
  %238 = xor i32 %237, %230
  %239 = add i32 %218, 1013904242
  %240 = add i32 %220, 1993301258
  %241 = mul i32 %236, -766435501
  %242 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %236) #6
  %243 = mul i32 %238, -845247145
  %244 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %238) #6
  %245 = xor i32 %233, %239
  %246 = xor i32 %245, %244
  %247 = xor i32 %231, %240
  %248 = xor i32 %247, %242
  %249 = add i32 %218, -626627285
  %250 = add i32 %220, 842468239
  %251 = mul i32 %246, -766435501
  %252 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %246) #6
  %253 = mul i32 %248, -845247145
  %254 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %248) #6
  %255 = xor i32 %243, %249
  %256 = xor i32 %255, %254
  %257 = xor i32 %241, %250
  %258 = xor i32 %257, %252
  %259 = add i32 %218, 2027808484
  %260 = add i32 %220, -308364780
  %261 = mul i32 %256, -766435501
  %262 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %256) #6
  %263 = mul i32 %258, -845247145
  %264 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %258) #6
  %265 = xor i32 %253, %259
  %266 = xor i32 %265, %264
  %267 = xor i32 %251, %260
  %268 = xor i32 %267, %262
  %269 = add i32 %218, 387276957
  %270 = add i32 %220, -1459197799
  %271 = mul i32 %266, -766435501
  %272 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %266) #6
  %273 = mul i32 %268, -845247145
  %274 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %268) #6
  %275 = xor i32 %263, %269
  %276 = xor i32 %275, %274
  %277 = xor i32 %261, %270
  %278 = xor i32 %277, %272
  %279 = add i32 %218, -1253254570
  %280 = add i32 %220, 1684936478
  %281 = mul i32 %276, -766435501
  %282 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %276) #6
  %283 = mul i32 %278, -845247145
  %284 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %278) #6
  %285 = xor i32 %273, %279
  %286 = xor i32 %285, %284
  %287 = xor i32 %271, %280
  %288 = xor i32 %287, %282
  %289 = add i32 %218, 1401181199
  %290 = add i32 %220, 534103459
  %291 = mul i32 %286, -766435501
  %292 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %286) #6
  %293 = mul i32 %288, -845247145
  %294 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %288) #6
  %295 = xor i32 %283, %289
  %296 = xor i32 %295, %294
  %297 = xor i32 %281, %290
  %298 = xor i32 %297, %292
  %299 = add i32 %218, -239350328
  %300 = add i32 %220, -616729560
  %301 = mul i32 %296, -766435501
  %302 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %296) #6
  %303 = mul i32 %298, -845247145
  %304 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %298) #6
  %305 = xor i32 %293, %299
  %306 = xor i32 %305, %304
  %307 = xor i32 %291, %300
  %308 = xor i32 %307, %302
  %309 = add i32 %218, -1879881855
  %310 = add i32 %220, -1767562579
  %311 = mul i32 %306, -766435501
  %312 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %306) #6
  %313 = mul i32 %308, -845247145
  %314 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %308) #6
  %315 = xor i32 %303, %309
  %316 = xor i32 %315, %314
  %317 = xor i32 %301, %310
  %318 = xor i32 %317, %312
  %319 = load i32, i32* %27, align 4, !tbaa !13
  %320 = add i32 %319, 1
  store i32 %320, i32* %27, align 4, !tbaa !13
  %321 = icmp eq i32 %320, 0
  br i1 %321, label %322, label %333

; <label>:322:                                    ; preds = %212
  %323 = load i32, i32* %28, align 4, !tbaa !13
  %324 = add i32 %323, 1
  store i32 %324, i32* %28, align 4, !tbaa !13
  %325 = icmp eq i32 %324, 0
  br i1 %325, label %326, label %333

; <label>:326:                                    ; preds = %322
  %327 = load i32, i32* %29, align 4, !tbaa !13
  %328 = add i32 %327, 1
  store i32 %328, i32* %29, align 4, !tbaa !13
  %329 = icmp eq i32 %328, 0
  br i1 %329, label %330, label %333

; <label>:330:                                    ; preds = %326
  %331 = load i32, i32* %30, align 4, !tbaa !13
  %332 = add i32 %331, 1
  store i32 %332, i32* %30, align 4, !tbaa !13
  br label %333

; <label>:333:                                    ; preds = %203, %199, %195, %85, %212, %322, %326, %330
  %334 = phi i32 [ %316, %330 ], [ %316, %326 ], [ %316, %322 ], [ %316, %212 ], [ %189, %85 ], [ %189, %195 ], [ %189, %199 ], [ %189, %203 ]
  %335 = phi i32 [ %313, %330 ], [ %313, %326 ], [ %313, %322 ], [ %313, %212 ], [ %186, %85 ], [ %186, %195 ], [ %186, %199 ], [ %186, %203 ]
  %336 = phi i32 [ %318, %330 ], [ %318, %326 ], [ %318, %322 ], [ %318, %212 ], [ %191, %85 ], [ %191, %195 ], [ %191, %199 ], [ %191, %203 ]
  %337 = phi i32 [ %311, %330 ], [ %311, %326 ], [ %311, %322 ], [ %311, %212 ], [ %184, %85 ], [ %184, %195 ], [ %184, %199 ], [ %184, %203 ]
  %338 = phi i32 [ 0, %330 ], [ 0, %326 ], [ 0, %322 ], [ 0, %212 ], [ 1, %85 ], [ 1, %195 ], [ 1, %199 ], [ 1, %203 ]
  %339 = phi i32 [ %210, %330 ], [ %210, %326 ], [ %210, %322 ], [ %210, %212 ], [ %189, %85 ], [ %189, %195 ], [ %189, %199 ], [ %189, %203 ]
  store i32 %334, i32* %33, align 8
  store i32 %335, i32* %34, align 4
  store i32 %336, i32* %35, align 8
  store i32 %337, i32* %36, align 4
  store i32 %338, i32* %37, align 8, !tbaa !25
  br label %340

; <label>:340:                                    ; preds = %333, %206
  %341 = phi i32 [ %210, %206 ], [ %339, %333 ]
  %342 = phi i32 [ %207, %206 ], [ %338, %333 ]
  %343 = add nsw i32 %342, 1
  store i32 %343, i32* %37, align 8, !tbaa !25
  %344 = sext i32 %342 to i64
  %345 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 %344
  %346 = load i32, i32* %345, align 4, !tbaa !13
  %347 = and i32 %341, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %43) #5
  %348 = or i32 %347, 1065353216
  store i32 %348, i32* %7, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %44) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %44, i8* nonnull %43, i64 4) #6
  %349 = load float, float* %8, align 4, !tbaa !17
  %350 = fadd float %349, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %44) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %43) #5
  %351 = fcmp olt float %350, 0x3E7AD7F2A0000000
  %352 = select i1 %351, float 0x3E7AD7F2A0000000, float %350
  %353 = and i32 %346, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %45) #5
  %354 = or i32 %353, 1065353216
  store i32 %354, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %46) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %46, i8* nonnull %45, i64 4) #6
  %355 = load float, float* %6, align 4, !tbaa !17
  %356 = fadd float %355, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %46) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %45) #5
  %357 = fpext float %356 to double
  %358 = fmul double %357, 0x401921FB54442D18
  %359 = fptrunc double %358 to float
  %360 = call float @_Z3logf(float %352) #6
  %361 = fmul float %360, -2.000000e+00
  %362 = call float @_Z4sqrtf(float %361) #6
  %363 = call float @_Z4sinff(float %359) #6
  %364 = call float @_Z4cosff(float %359) #6
  %365 = fmul float %362, %363
  %366 = fmul float %362, %364
  %367 = call float @_Z4fabsf(float %365) #6
  %368 = fcmp olt float %367, %24
  br i1 %368, label %369, label %374

; <label>:369:                                    ; preds = %340
  %370 = add nsw i32 %83, 1
  %371 = sext i32 %83 to i64
  %372 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 %371
  store float %365, float* %372, align 4, !tbaa !17
  %373 = icmp sgt i32 %83, 2
  br i1 %373, label %385, label %374

; <label>:374:                                    ; preds = %369, %340
  %375 = phi i32 [ %370, %369 ], [ %83, %340 ]
  %376 = call float @_Z4fabsf(float %366) #6
  %377 = fcmp olt float %376, %24
  br i1 %377, label %380, label %378

; <label>:378:                                    ; preds = %374, %380
  %379 = phi i32 [ %375, %374 ], [ %381, %380 ]
  br label %81

; <label>:380:                                    ; preds = %374
  %381 = add nsw i32 %375, 1
  %382 = sext i32 %375 to i64
  %383 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 %382
  store float %366, float* %383, align 4, !tbaa !17
  %384 = icmp sgt i32 %375, 2
  br i1 %384, label %385, label %378

; <label>:385:                                    ; preds = %380, %369
  %386 = load i32, i32* %47, align 4
  %387 = load i32, i32* %48, align 4
  %388 = load i32, i32* %49, align 4
  %389 = load i32, i32* %50, align 4
  call void @llvm.lifetime.end(i64 16, i8* nonnull %38) #5
  %390 = getelementptr inbounds float, float* %1, i64 %59
  %391 = bitcast float* %390 to i32*
  store i32 %386, i32* %391, align 4, !tbaa !17
  %392 = or i64 %59, 1
  %393 = icmp slt i64 %392, %2
  br i1 %393, label %395, label %394

; <label>:394:                                    ; preds = %400, %395, %385
  call void @llvm.lifetime.end(i64 32, i8* nonnull %31) #5
  call void @llvm.lifetime.end(i64 24, i8* nonnull %25) #5
  br label %412

; <label>:395:                                    ; preds = %385
  %396 = getelementptr inbounds float, float* %1, i64 %392
  %397 = bitcast float* %396 to i32*
  store i32 %387, i32* %397, align 4, !tbaa !17
  %398 = or i64 %59, 2
  %399 = icmp slt i64 %398, %2
  br i1 %399, label %400, label %394

; <label>:400:                                    ; preds = %395
  %401 = getelementptr inbounds float, float* %1, i64 %398
  %402 = bitcast float* %401 to i32*
  store i32 %388, i32* %402, align 4, !tbaa !17
  %403 = or i64 %59, 3
  %404 = icmp slt i64 %403, %2
  br i1 %404, label %405, label %394

; <label>:405:                                    ; preds = %400
  %406 = getelementptr inbounds float, float* %1, i64 %403
  %407 = bitcast float* %406 to i32*
  store i32 %389, i32* %407, align 4, !tbaa !17
  %408 = add i64 %55, %59
  %409 = add nsw i64 %60, %54
  call void @llvm.lifetime.end(i64 32, i8* nonnull %31) #5
  call void @llvm.lifetime.end(i64 24, i8* nonnull %25) #5
  %410 = icmp slt i64 %408, %2
  br i1 %410, label %58, label %411

; <label>:411:                                    ; preds = %405
  br label %412

; <label>:412:                                    ; preds = %411, %4, %394
  ret void
}

; Function Attrs: convergent nounwind
declare hidden float @_Z4fabsf(float) local_unnamed_addr #4

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="-satom" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { convergent nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = !{void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, %"class.tensorflow::random::UniformDistribution"*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !"kernel", i32 1}
!1 = !{void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, %"class.tensorflow::random::UniformDistribution"*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !"maxntidx", i32 1024}
!2 = !{void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, %"class.tensorflow::random::NormalDistribution"*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !"kernel", i32 1}
!3 = !{void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, %"class.tensorflow::random::NormalDistribution"*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !"maxntidx", i32 1024}
!4 = !{void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, %"class.tensorflow::random::TruncatedNormalDistribution"*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_, !"kernel", i32 1}
!5 = !{void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, %"class.tensorflow::random::TruncatedNormalDistribution"*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_, !"maxntidx", i32 1024}
!6 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!7 = !{i32 1, !"PIC Level", i32 2}
!8 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!9 = !{i32 0, i32 2147483647}
!10 = !{i32 1, i32 1025}
!11 = !{i32 0, i32 1024}
!12 = !{i32 1, i32 -2147483648}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C++ TBAA"}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !15, i64 0}
!19 = !{i64 0, i64 16, !20, i64 16, i64 8, !20}
!20 = !{!15, !15, i64 0}
!21 = !{!22, !23, i64 0}
!22 = !{!"_ZTSN10tensorflow6random19SingleSampleAdapterINS0_12PhiloxRandomEEE", !23, i64 0, !24, i64 8, !14, i64 24}
!23 = !{!"any pointer", !15, i64 0}
!24 = !{!"_ZTSN10tensorflow6random5ArrayIjLi4EEE", !15, i64 0}
!25 = !{!22, !14, i64 24}
