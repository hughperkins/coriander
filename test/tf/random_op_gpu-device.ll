; ModuleID = 'bazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device-noopt.ll'
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
  %13 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 1
  %14 = bitcast %"class.tensorflow::random::Array.0"* %13 to i64*
  %15 = load i64, i64* %14, align 4
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !9
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !10
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !11
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !12
  %22 = mul i32 %21, %17
  %23 = shl nsw i32 %20, 2
  %24 = sext i32 %20 to i64
  %25 = lshr i64 %24, 32
  %26 = trunc i64 %25 to i32
  %27 = add i32 %20, %8
  %28 = icmp ult i32 %27, %20
  %29 = zext i1 %28 to i32
  %30 = add i32 %29, %26
  %31 = add i32 %30, %10
  %32 = icmp ult i32 %31, %30
  %33 = add i32 %12, 1
  %34 = sext i32 %23 to i64
  %35 = icmp slt i64 %34, %2
  br i1 %35, label %36, label %.loopexit

; <label>:36:                                     ; preds = %4
  %37 = icmp eq i32 %33, 0
  %38 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 3
  %39 = load i32, i32* %38, align 4
  %narrow = and i1 %37, %32
  %40 = zext i1 %narrow to i32
  %.1 = add i32 %39, %40
  %. = select i1 %32, i32 %33, i32 %12
  %41 = add nsw i32 %22, -1
  %42 = shl i32 %41, 2
  %43 = sext i32 %41 to i64
  %44 = lshr i64 %43, 32
  %45 = trunc i64 %44 to i32
  %46 = trunc i64 %15 to i32
  %47 = lshr i64 %15, 32
  %48 = trunc i64 %47 to i32
  %49 = add i32 %46, -1640531527
  %50 = add i32 %48, -1150833019
  %51 = add i32 %46, 1013904242
  %52 = add i32 %48, 1993301258
  %53 = add i32 %46, -626627285
  %54 = add i32 %48, 842468239
  %55 = add i32 %46, 2027808484
  %56 = add i32 %48, -308364780
  %57 = add i32 %46, 387276957
  %58 = add i32 %48, -1459197799
  %59 = add i32 %46, -1253254570
  %60 = add i32 %48, 1684936478
  %61 = add i32 %46, 1401181199
  %62 = add i32 %48, 534103459
  %63 = add i32 %46, -239350328
  %64 = add i32 %48, -616729560
  %65 = add i32 %46, 7554945
  %66 = add i32 %48, 2433709
  %67 = bitcast i32* %5 to i8*
  %68 = bitcast float* %6 to i8*
  %69 = add i32 %42, 4
  br label %70

; <label>:70:                                     ; preds = %201, %36
  %71 = phi i32 [ %31, %36 ], [ %208, %201 ]
  %72 = phi i32 [ %27, %36 ], [ %204, %201 ]
  %73 = phi i32 [ %., %36 ], [ %212, %201 ]
  %74 = phi i32 [ %.1, %36 ], [ %214, %201 ]
  %75 = phi i32 [ %23, %36 ], [ %203, %201 ]
  %76 = mul i32 %72, -766435501
  %77 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %72) #6
  %78 = mul i32 %73, -845247145
  %79 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %73) #6
  %80 = xor i32 %71, %46
  %81 = xor i32 %80, %79
  %82 = xor i32 %74, %48
  %83 = xor i32 %82, %77
  %84 = mul i32 %81, -766435501
  %85 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %81) #6
  %86 = mul i32 %83, -845247145
  %87 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %83) #6
  %88 = xor i32 %78, %49
  %89 = xor i32 %88, %87
  %90 = xor i32 %76, %50
  %91 = xor i32 %90, %85
  %92 = mul i32 %89, -766435501
  %93 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %89) #6
  %94 = mul i32 %91, -845247145
  %95 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %91) #6
  %96 = xor i32 %86, %51
  %97 = xor i32 %96, %95
  %98 = xor i32 %84, %52
  %99 = xor i32 %98, %93
  %100 = mul i32 %97, -766435501
  %101 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %97) #6
  %102 = mul i32 %99, -845247145
  %103 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %99) #6
  %104 = xor i32 %94, %53
  %105 = xor i32 %104, %103
  %106 = xor i32 %92, %54
  %107 = xor i32 %106, %101
  %108 = mul i32 %105, -766435501
  %109 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %105) #6
  %110 = mul i32 %107, -845247145
  %111 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %107) #6
  %112 = xor i32 %102, %55
  %113 = xor i32 %112, %111
  %114 = xor i32 %100, %56
  %115 = xor i32 %114, %109
  %116 = mul i32 %113, -766435501
  %117 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %113) #6
  %118 = mul i32 %115, -845247145
  %119 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %115) #6
  %120 = xor i32 %110, %57
  %121 = xor i32 %120, %119
  %122 = xor i32 %108, %58
  %123 = xor i32 %122, %117
  %124 = mul i32 %121, -766435501
  %125 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %121) #6
  %126 = mul i32 %123, -845247145
  %127 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %123) #6
  %128 = xor i32 %118, %59
  %129 = xor i32 %128, %127
  %130 = xor i32 %116, %60
  %131 = xor i32 %130, %125
  %132 = mul i32 %129, -766435501
  %133 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %129) #6
  %134 = mul i32 %131, -845247145
  %135 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %131) #6
  %136 = xor i32 %126, %61
  %137 = xor i32 %136, %135
  %138 = xor i32 %124, %62
  %139 = xor i32 %138, %133
  %140 = mul i32 %137, -766435501
  %141 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %137) #6
  %142 = mul i32 %139, -845247145
  %143 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %139) #6
  %144 = xor i32 %134, %63
  %145 = xor i32 %144, %143
  %146 = xor i32 %132, %64
  %147 = xor i32 %146, %141
  %148 = mul i32 %145, -766435501
  %149 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %145) #6
  %150 = mul i32 %147, -845247145
  %151 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %147) #6
  %152 = xor i32 %142, %65
  %153 = xor i32 %152, %151
  %154 = xor i32 %140, %66
  %155 = xor i32 %154, %149
  %156 = icmp eq i32 %72, -1
  br i1 %156, label %157, label %164

; <label>:157:                                    ; preds = %70
  %158 = add i32 %71, 1
  %159 = icmp eq i32 %158, 0
  %160 = add i32 %73, 1
  %.3 = select i1 %159, i32 %160, i32 %73
  %161 = or i32 %160, %158
  %162 = icmp eq i32 %161, 0
  %163 = zext i1 %162 to i32
  %.4 = add i32 %163, %74
  br label %164

; <label>:164:                                    ; preds = %157, %70
  %165 = phi i32 [ %71, %70 ], [ %158, %157 ]
  %166 = phi i32 [ %73, %70 ], [ %.3, %157 ]
  %167 = phi i32 [ %74, %70 ], [ %.4, %157 ]
  %168 = and i32 %153, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5
  %169 = or i32 %168, 1065353216
  store i32 %169, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6
  %170 = load float, float* %6, align 4, !tbaa !17
  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5
  %171 = and i32 %150, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5
  %172 = or i32 %171, 1065353216
  store i32 %172, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6
  %173 = load float, float* %6, align 4, !tbaa !17
  %174 = fadd float %173, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5
  %175 = and i32 %155, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5
  %176 = or i32 %175, 1065353216
  store i32 %176, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6
  %177 = load float, float* %6, align 4, !tbaa !17
  %178 = fadd float %177, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5
  %179 = and i32 %148, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5
  %180 = or i32 %179, 1065353216
  store i32 %180, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6
  %181 = load float, float* %6, align 4, !tbaa !17
  %182 = fadd float %181, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5
  %183 = sext i32 %75 to i64
  %184 = icmp slt i64 %183, %2
  br i1 %184, label %185, label %.loopexit.loopexit

; <label>:185:                                    ; preds = %164
  %186 = fadd float %170, -1.000000e+00
  %187 = getelementptr inbounds float, float* %1, i64 %183
  store float %186, float* %187, align 4, !tbaa !17
  %188 = or i32 %75, 1
  %189 = sext i32 %188 to i64
  %190 = icmp slt i64 %189, %2
  br i1 %190, label %191, label %.loopexit.loopexit

; <label>:191:                                    ; preds = %185
  %192 = getelementptr inbounds float, float* %1, i64 %189
  store float %174, float* %192, align 4, !tbaa !17
  %193 = or i32 %75, 2
  %194 = sext i32 %193 to i64
  %195 = icmp slt i64 %194, %2
  br i1 %195, label %196, label %.loopexit.loopexit

; <label>:196:                                    ; preds = %191
  %197 = getelementptr inbounds float, float* %1, i64 %194
  store float %178, float* %197, align 4, !tbaa !17
  %198 = or i32 %75, 3
  %199 = sext i32 %198 to i64
  %200 = icmp slt i64 %199, %2
  br i1 %200, label %201, label %.loopexit.loopexit

; <label>:201:                                    ; preds = %196
  %202 = getelementptr inbounds float, float* %1, i64 %199
  store float %182, float* %202, align 4, !tbaa !17
  %203 = add i32 %69, %75
  %204 = add i32 %72, %22
  %205 = icmp ult i32 %204, %41
  %206 = zext i1 %205 to i32
  %207 = add i32 %206, %45
  %208 = add i32 %165, %207
  %209 = icmp ult i32 %208, %207
  %210 = add i32 %166, 1
  %211 = icmp eq i32 %210, 0
  %212 = select i1 %209, i32 %210, i32 %166
  %narrow5 = and i1 %209, %211
  %213 = zext i1 %narrow5 to i32
  %214 = add i32 %213, %167
  %215 = sext i32 %203 to i64
  %216 = icmp slt i64 %215, %2
  br i1 %216, label %70, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %196, %191, %201, %185, %164
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
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
  %29 = add i32 %22, %10
  %30 = icmp ult i32 %29, %22
  %31 = zext i1 %30 to i32
  %32 = add i32 %31, %28
  %33 = add i32 %32, %12
  %34 = icmp ult i32 %33, %32
  %35 = add i32 %14, 1
  %36 = sext i32 %25 to i64
  %37 = icmp slt i64 %36, %2
  br i1 %37, label %38, label %.loopexit

; <label>:38:                                     ; preds = %4
  %39 = icmp eq i32 %35, 0
  %40 = getelementptr inbounds %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0, i64 0, i32 0, i32 0, i64 3
  %41 = load i32, i32* %40, align 4
  %narrow = and i1 %39, %34
  %42 = zext i1 %narrow to i32
  %.1 = add i32 %41, %42
  %. = select i1 %34, i32 %35, i32 %14
  %43 = bitcast i32* %7 to i8*
  %44 = bitcast float* %8 to i8*
  %45 = bitcast i32* %5 to i8*
  %46 = bitcast float* %6 to i8*
  %47 = add nsw i32 %24, -1
  %48 = shl i32 %47, 2
  %49 = sext i32 %47 to i64
  %50 = lshr i64 %49, 32
  %51 = trunc i64 %50 to i32
  %52 = trunc i64 %17 to i32
  %53 = lshr i64 %17, 32
  %54 = trunc i64 %53 to i32
  %55 = add i32 %52, -1640531527
  %56 = add i32 %54, -1150833019
  %57 = add i32 %52, 1013904242
  %58 = add i32 %54, 1993301258
  %59 = add i32 %52, -626627285
  %60 = add i32 %54, 842468239
  %61 = add i32 %52, 2027808484
  %62 = add i32 %54, -308364780
  %63 = add i32 %52, 387276957
  %64 = add i32 %54, -1459197799
  %65 = add i32 %52, -1253254570
  %66 = add i32 %54, 1684936478
  %67 = add i32 %52, 1401181199
  %68 = add i32 %54, 534103459
  %69 = add i32 %52, -239350328
  %70 = add i32 %54, -616729560
  %71 = add i32 %52, 7554945
  %72 = add i32 %54, 2433709
  %73 = add i32 %48, 4
  br label %74

; <label>:74:                                     ; preds = %229, %38
  %75 = phi i32 [ %33, %38 ], [ %236, %229 ]
  %76 = phi i32 [ %29, %38 ], [ %232, %229 ]
  %77 = phi i32 [ %., %38 ], [ %240, %229 ]
  %78 = phi i32 [ %.1, %38 ], [ %242, %229 ]
  %79 = phi i32 [ %25, %38 ], [ %231, %229 ]
  %80 = mul i32 %76, -766435501
  %81 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %76) #6
  %82 = mul i32 %77, -845247145
  %83 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %77) #6
  %84 = xor i32 %75, %52
  %85 = xor i32 %84, %83
  %86 = xor i32 %78, %54
  %87 = xor i32 %86, %81
  %88 = mul i32 %85, -766435501
  %89 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %85) #6
  %90 = mul i32 %87, -845247145
  %91 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %87) #6
  %92 = xor i32 %82, %55
  %93 = xor i32 %92, %91
  %94 = xor i32 %80, %56
  %95 = xor i32 %94, %89
  %96 = mul i32 %93, -766435501
  %97 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %93) #6
  %98 = mul i32 %95, -845247145
  %99 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %95) #6
  %100 = xor i32 %90, %57
  %101 = xor i32 %100, %99
  %102 = xor i32 %88, %58
  %103 = xor i32 %102, %97
  %104 = mul i32 %101, -766435501
  %105 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %101) #6
  %106 = mul i32 %103, -845247145
  %107 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %103) #6
  %108 = xor i32 %98, %59
  %109 = xor i32 %108, %107
  %110 = xor i32 %96, %60
  %111 = xor i32 %110, %105
  %112 = mul i32 %109, -766435501
  %113 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %109) #6
  %114 = mul i32 %111, -845247145
  %115 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %111) #6
  %116 = xor i32 %106, %61
  %117 = xor i32 %116, %115
  %118 = xor i32 %104, %62
  %119 = xor i32 %118, %113
  %120 = mul i32 %117, -766435501
  %121 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %117) #6
  %122 = mul i32 %119, -845247145
  %123 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %119) #6
  %124 = xor i32 %114, %63
  %125 = xor i32 %124, %123
  %126 = xor i32 %112, %64
  %127 = xor i32 %126, %121
  %128 = mul i32 %125, -766435501
  %129 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %125) #6
  %130 = mul i32 %127, -845247145
  %131 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %127) #6
  %132 = xor i32 %122, %65
  %133 = xor i32 %132, %131
  %134 = xor i32 %120, %66
  %135 = xor i32 %134, %129
  %136 = mul i32 %133, -766435501
  %137 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %133) #6
  %138 = mul i32 %135, -845247145
  %139 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %135) #6
  %140 = xor i32 %130, %67
  %141 = xor i32 %140, %139
  %142 = xor i32 %128, %68
  %143 = xor i32 %142, %137
  %144 = mul i32 %141, -766435501
  %145 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %141) #6
  %146 = mul i32 %143, -845247145
  %147 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %143) #6
  %148 = xor i32 %138, %69
  %149 = xor i32 %148, %147
  %150 = xor i32 %136, %70
  %151 = xor i32 %150, %145
  %152 = mul i32 %149, -766435501
  %153 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %149) #6
  %154 = mul i32 %151, -845247145
  %155 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %151) #6
  %156 = xor i32 %146, %71
  %157 = xor i32 %156, %155
  %158 = xor i32 %144, %72
  %159 = xor i32 %158, %153
  %160 = icmp eq i32 %76, -1
  br i1 %160, label %161, label %168

; <label>:161:                                    ; preds = %74
  %162 = add i32 %75, 1
  %163 = icmp eq i32 %162, 0
  %164 = add i32 %77, 1
  %.3 = select i1 %163, i32 %164, i32 %77
  %165 = or i32 %164, %162
  %166 = icmp eq i32 %165, 0
  %167 = zext i1 %166 to i32
  %.4 = add i32 %167, %78
  br label %168

; <label>:168:                                    ; preds = %161, %74
  %169 = phi i32 [ %75, %74 ], [ %162, %161 ]
  %170 = phi i32 [ %77, %74 ], [ %.3, %161 ]
  %171 = phi i32 [ %78, %74 ], [ %.4, %161 ]
  %172 = and i32 %157, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %43) #5
  %173 = or i32 %172, 1065353216
  store i32 %173, i32* %7, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %44) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %44, i8* nonnull %43, i64 4) #6
  %174 = load float, float* %8, align 4, !tbaa !17
  %175 = fadd float %174, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %44) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %43) #5
  %176 = fcmp olt float %175, 0x3E7AD7F2A0000000
  %177 = select i1 %176, float 0x3E7AD7F2A0000000, float %175
  %178 = and i32 %154, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %45) #5
  %179 = or i32 %178, 1065353216
  store i32 %179, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %46) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %46, i8* nonnull %45, i64 4) #6
  %180 = load float, float* %6, align 4, !tbaa !17
  %181 = fadd float %180, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %46) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %45) #5
  %182 = fpext float %181 to double
  %183 = fmul double %182, 0x401921FB54442D18
  %184 = fptrunc double %183 to float
  %185 = call float @_Z3logf(float %177) #6
  %186 = fmul float %185, -2.000000e+00
  %187 = call float @_Z4sqrtf(float %186) #6
  %188 = call float @_Z4sinff(float %184) #6
  %189 = call float @_Z4cosff(float %184) #6
  %190 = fmul float %187, %189
  %191 = and i32 %159, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %43) #5
  %192 = or i32 %191, 1065353216
  store i32 %192, i32* %7, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %44) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %44, i8* nonnull %43, i64 4) #6
  %193 = load float, float* %8, align 4, !tbaa !17
  %194 = fadd float %193, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %44) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %43) #5
  %195 = fcmp olt float %194, 0x3E7AD7F2A0000000
  %196 = select i1 %195, float 0x3E7AD7F2A0000000, float %194
  %197 = and i32 %152, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %45) #5
  %198 = or i32 %197, 1065353216
  store i32 %198, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %46) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %46, i8* nonnull %45, i64 4) #6
  %199 = load float, float* %6, align 4, !tbaa !17
  %200 = fadd float %199, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %46) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %45) #5
  %201 = fpext float %200 to double
  %202 = fmul double %201, 0x401921FB54442D18
  %203 = fptrunc double %202 to float
  %204 = call float @_Z3logf(float %196) #6
  %205 = fmul float %204, -2.000000e+00
  %206 = call float @_Z4sqrtf(float %205) #6
  %207 = call float @_Z4sinff(float %203) #6
  %208 = call float @_Z4cosff(float %203) #6
  %209 = fmul float %206, %207
  %210 = fmul float %206, %208
  %211 = sext i32 %79 to i64
  %212 = icmp slt i64 %211, %2
  br i1 %212, label %213, label %.loopexit.loopexit

; <label>:213:                                    ; preds = %168
  %214 = fmul float %187, %188
  %215 = getelementptr inbounds float, float* %1, i64 %211
  store float %214, float* %215, align 4, !tbaa !17
  %216 = or i32 %79, 1
  %217 = sext i32 %216 to i64
  %218 = icmp slt i64 %217, %2
  br i1 %218, label %219, label %.loopexit.loopexit

; <label>:219:                                    ; preds = %213
  %220 = getelementptr inbounds float, float* %1, i64 %217
  store float %190, float* %220, align 4, !tbaa !17
  %221 = or i32 %79, 2
  %222 = sext i32 %221 to i64
  %223 = icmp slt i64 %222, %2
  br i1 %223, label %224, label %.loopexit.loopexit

; <label>:224:                                    ; preds = %219
  %225 = getelementptr inbounds float, float* %1, i64 %222
  store float %209, float* %225, align 4, !tbaa !17
  %226 = or i32 %79, 3
  %227 = sext i32 %226 to i64
  %228 = icmp slt i64 %227, %2
  br i1 %228, label %229, label %.loopexit.loopexit

; <label>:229:                                    ; preds = %224
  %230 = getelementptr inbounds float, float* %1, i64 %227
  store float %210, float* %230, align 4, !tbaa !17
  %231 = add i32 %73, %79
  %232 = add i32 %76, %24
  %233 = icmp ult i32 %232, %47
  %234 = zext i1 %233 to i32
  %235 = add i32 %234, %51
  %236 = add i32 %169, %235
  %237 = icmp ult i32 %236, %235
  %238 = add i32 %170, 1
  %239 = icmp eq i32 %238, 0
  %240 = select i1 %237, i32 %238, i32 %170
  %narrow5 = and i1 %237, %239
  %241 = zext i1 %narrow5 to i32
  %242 = add i32 %241, %171
  %243 = sext i32 %231 to i64
  %244 = icmp slt i64 %243, %2
  br i1 %244, label %74, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %224, %219, %229, %213, %168
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
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
  br i1 %21, label %22, label %.loopexit

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

; <label>:58:                                     ; preds = %402, %22
  %59 = phi i64 [ %20, %22 ], [ %405, %402 ]
  %60 = phi i64 [ %19, %22 ], [ %406, %402 ]
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
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %80
  %81 = phi i32 [ 4, %80 ], [ %342, %.backedge.backedge ]
  %82 = phi i32 [ 0, %80 ], [ %.be, %.backedge.backedge ]
  %83 = icmp eq i32 %81, 4
  br i1 %83, label %84, label %205

; <label>:84:                                     ; preds = %.backedge
  %85 = load i32, i32* %27, align 4
  %86 = load i32, i32* %28, align 4
  %87 = load i32, i32* %29, align 4
  %88 = load i32, i32* %30, align 4
  %89 = load i64, i64* %57, align 4
  %90 = trunc i64 %89 to i32
  %91 = lshr i64 %89, 32
  %92 = trunc i64 %91 to i32
  %93 = mul i32 %85, -766435501
  %94 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %85) #6
  %95 = mul i32 %87, -845247145
  %96 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %87) #6
  %97 = xor i32 %90, %86
  %98 = xor i32 %97, %96
  %99 = xor i32 %94, %88
  %100 = xor i32 %99, %92
  %101 = add i32 %90, -1640531527
  %102 = add i32 %92, -1150833019
  %103 = mul i32 %98, -766435501
  %104 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %98) #6
  %105 = mul i32 %100, -845247145
  %106 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %100) #6
  %107 = xor i32 %101, %95
  %108 = xor i32 %107, %106
  %109 = xor i32 %104, %93
  %110 = xor i32 %109, %102
  %111 = add i32 %90, 1013904242
  %112 = add i32 %92, 1993301258
  %113 = mul i32 %108, -766435501
  %114 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %108) #6
  %115 = mul i32 %110, -845247145
  %116 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %110) #6
  %117 = xor i32 %105, %111
  %118 = xor i32 %117, %116
  %119 = xor i32 %103, %112
  %120 = xor i32 %119, %114
  %121 = add i32 %90, -626627285
  %122 = add i32 %92, 842468239
  %123 = mul i32 %118, -766435501
  %124 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %118) #6
  %125 = mul i32 %120, -845247145
  %126 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %120) #6
  %127 = xor i32 %115, %121
  %128 = xor i32 %127, %126
  %129 = xor i32 %113, %122
  %130 = xor i32 %129, %124
  %131 = add i32 %90, 2027808484
  %132 = add i32 %92, -308364780
  %133 = mul i32 %128, -766435501
  %134 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %128) #6
  %135 = mul i32 %130, -845247145
  %136 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %130) #6
  %137 = xor i32 %125, %131
  %138 = xor i32 %137, %136
  %139 = xor i32 %123, %132
  %140 = xor i32 %139, %134
  %141 = add i32 %90, 387276957
  %142 = add i32 %92, -1459197799
  %143 = mul i32 %138, -766435501
  %144 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %138) #6
  %145 = mul i32 %140, -845247145
  %146 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %140) #6
  %147 = xor i32 %135, %141
  %148 = xor i32 %147, %146
  %149 = xor i32 %133, %142
  %150 = xor i32 %149, %144
  %151 = add i32 %90, -1253254570
  %152 = add i32 %92, 1684936478
  %153 = mul i32 %148, -766435501
  %154 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %148) #6
  %155 = mul i32 %150, -845247145
  %156 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %150) #6
  %157 = xor i32 %145, %151
  %158 = xor i32 %157, %156
  %159 = xor i32 %143, %152
  %160 = xor i32 %159, %154
  %161 = add i32 %90, 1401181199
  %162 = add i32 %92, 534103459
  %163 = mul i32 %158, -766435501
  %164 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %158) #6
  %165 = mul i32 %160, -845247145
  %166 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %160) #6
  %167 = xor i32 %155, %161
  %168 = xor i32 %167, %166
  %169 = xor i32 %153, %162
  %170 = xor i32 %169, %164
  %171 = add i32 %90, -239350328
  %172 = add i32 %92, -616729560
  %173 = mul i32 %168, -766435501
  %174 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %168) #6
  %175 = mul i32 %170, -845247145
  %176 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %170) #6
  %177 = xor i32 %165, %171
  %178 = xor i32 %177, %176
  %179 = xor i32 %163, %172
  %180 = xor i32 %179, %174
  %181 = add i32 %90, -1879881855
  %182 = add i32 %92, -1767562579
  %183 = mul i32 %178, -766435501
  %184 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %178) #6
  %185 = mul i32 %180, -845247145
  %186 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %180) #6
  %187 = xor i32 %175, %181
  %188 = xor i32 %187, %186
  %189 = xor i32 %173, %182
  %190 = xor i32 %189, %184
  %191 = load i32, i32* %27, align 4, !tbaa !13
  %192 = add i32 %191, 1
  store i32 %192, i32* %27, align 4, !tbaa !13
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %332

; <label>:194:                                    ; preds = %84
  %195 = load i32, i32* %28, align 4, !tbaa !13
  %196 = add i32 %195, 1
  store i32 %196, i32* %28, align 4, !tbaa !13
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %332

; <label>:198:                                    ; preds = %194
  %199 = load i32, i32* %29, align 4, !tbaa !13
  %200 = add i32 %199, 1
  store i32 %200, i32* %29, align 4, !tbaa !13
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %202, label %332

; <label>:202:                                    ; preds = %198
  %203 = load i32, i32* %30, align 4, !tbaa !13
  %204 = add i32 %203, 1
  store i32 %204, i32* %30, align 4, !tbaa !13
  br label %332

; <label>:205:                                    ; preds = %.backedge
  %206 = add nsw i32 %81, 1
  store i32 %206, i32* %37, align 8, !tbaa !25
  %207 = sext i32 %81 to i64
  %208 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 %207
  %209 = load i32, i32* %208, align 4, !tbaa !13
  %210 = icmp eq i32 %206, 4
  br i1 %210, label %211, label %339

; <label>:211:                                    ; preds = %205
  %212 = load i32, i32* %27, align 4
  %213 = load i32, i32* %28, align 4
  %214 = load i32, i32* %29, align 4
  %215 = load i32, i32* %30, align 4
  %216 = load i64, i64* %57, align 4
  %217 = trunc i64 %216 to i32
  %218 = lshr i64 %216, 32
  %219 = trunc i64 %218 to i32
  %220 = mul i32 %212, -766435501
  %221 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %212) #6
  %222 = mul i32 %214, -845247145
  %223 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %214) #6
  %224 = xor i32 %217, %213
  %225 = xor i32 %224, %223
  %226 = xor i32 %221, %215
  %227 = xor i32 %226, %219
  %228 = add i32 %217, -1640531527
  %229 = add i32 %219, -1150833019
  %230 = mul i32 %225, -766435501
  %231 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %225) #6
  %232 = mul i32 %227, -845247145
  %233 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %227) #6
  %234 = xor i32 %228, %222
  %235 = xor i32 %234, %233
  %236 = xor i32 %231, %220
  %237 = xor i32 %236, %229
  %238 = add i32 %217, 1013904242
  %239 = add i32 %219, 1993301258
  %240 = mul i32 %235, -766435501
  %241 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %235) #6
  %242 = mul i32 %237, -845247145
  %243 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %237) #6
  %244 = xor i32 %232, %238
  %245 = xor i32 %244, %243
  %246 = xor i32 %230, %239
  %247 = xor i32 %246, %241
  %248 = add i32 %217, -626627285
  %249 = add i32 %219, 842468239
  %250 = mul i32 %245, -766435501
  %251 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %245) #6
  %252 = mul i32 %247, -845247145
  %253 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %247) #6
  %254 = xor i32 %242, %248
  %255 = xor i32 %254, %253
  %256 = xor i32 %240, %249
  %257 = xor i32 %256, %251
  %258 = add i32 %217, 2027808484
  %259 = add i32 %219, -308364780
  %260 = mul i32 %255, -766435501
  %261 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %255) #6
  %262 = mul i32 %257, -845247145
  %263 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %257) #6
  %264 = xor i32 %252, %258
  %265 = xor i32 %264, %263
  %266 = xor i32 %250, %259
  %267 = xor i32 %266, %261
  %268 = add i32 %217, 387276957
  %269 = add i32 %219, -1459197799
  %270 = mul i32 %265, -766435501
  %271 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %265) #6
  %272 = mul i32 %267, -845247145
  %273 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %267) #6
  %274 = xor i32 %262, %268
  %275 = xor i32 %274, %273
  %276 = xor i32 %260, %269
  %277 = xor i32 %276, %271
  %278 = add i32 %217, -1253254570
  %279 = add i32 %219, 1684936478
  %280 = mul i32 %275, -766435501
  %281 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %275) #6
  %282 = mul i32 %277, -845247145
  %283 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %277) #6
  %284 = xor i32 %272, %278
  %285 = xor i32 %284, %283
  %286 = xor i32 %270, %279
  %287 = xor i32 %286, %281
  %288 = add i32 %217, 1401181199
  %289 = add i32 %219, 534103459
  %290 = mul i32 %285, -766435501
  %291 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %285) #6
  %292 = mul i32 %287, -845247145
  %293 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %287) #6
  %294 = xor i32 %282, %288
  %295 = xor i32 %294, %293
  %296 = xor i32 %280, %289
  %297 = xor i32 %296, %291
  %298 = add i32 %217, -239350328
  %299 = add i32 %219, -616729560
  %300 = mul i32 %295, -766435501
  %301 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %295) #6
  %302 = mul i32 %297, -845247145
  %303 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %297) #6
  %304 = xor i32 %292, %298
  %305 = xor i32 %304, %303
  %306 = xor i32 %290, %299
  %307 = xor i32 %306, %301
  %308 = add i32 %217, -1879881855
  %309 = add i32 %219, -1767562579
  %310 = mul i32 %305, -766435501
  %311 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %305) #6
  %312 = mul i32 %307, -845247145
  %313 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %307) #6
  %314 = xor i32 %302, %308
  %315 = xor i32 %314, %313
  %316 = xor i32 %300, %309
  %317 = xor i32 %316, %311
  %318 = load i32, i32* %27, align 4, !tbaa !13
  %319 = add i32 %318, 1
  store i32 %319, i32* %27, align 4, !tbaa !13
  %320 = icmp eq i32 %319, 0
  br i1 %320, label %321, label %332

; <label>:321:                                    ; preds = %211
  %322 = load i32, i32* %28, align 4, !tbaa !13
  %323 = add i32 %322, 1
  store i32 %323, i32* %28, align 4, !tbaa !13
  %324 = icmp eq i32 %323, 0
  br i1 %324, label %325, label %332

; <label>:325:                                    ; preds = %321
  %326 = load i32, i32* %29, align 4, !tbaa !13
  %327 = add i32 %326, 1
  store i32 %327, i32* %29, align 4, !tbaa !13
  %328 = icmp eq i32 %327, 0
  br i1 %328, label %329, label %332

; <label>:329:                                    ; preds = %325
  %330 = load i32, i32* %30, align 4, !tbaa !13
  %331 = add i32 %330, 1
  store i32 %331, i32* %30, align 4, !tbaa !13
  br label %332

; <label>:332:                                    ; preds = %329, %325, %321, %211, %202, %198, %194, %84
  %333 = phi i32 [ %315, %329 ], [ %315, %325 ], [ %315, %321 ], [ %315, %211 ], [ %188, %84 ], [ %188, %194 ], [ %188, %198 ], [ %188, %202 ]
  %334 = phi i32 [ %312, %329 ], [ %312, %325 ], [ %312, %321 ], [ %312, %211 ], [ %185, %84 ], [ %185, %194 ], [ %185, %198 ], [ %185, %202 ]
  %335 = phi i32 [ %317, %329 ], [ %317, %325 ], [ %317, %321 ], [ %317, %211 ], [ %190, %84 ], [ %190, %194 ], [ %190, %198 ], [ %190, %202 ]
  %336 = phi i32 [ %310, %329 ], [ %310, %325 ], [ %310, %321 ], [ %310, %211 ], [ %183, %84 ], [ %183, %194 ], [ %183, %198 ], [ %183, %202 ]
  %337 = phi i32 [ 0, %329 ], [ 0, %325 ], [ 0, %321 ], [ 0, %211 ], [ 1, %84 ], [ 1, %194 ], [ 1, %198 ], [ 1, %202 ]
  %338 = phi i32 [ %209, %329 ], [ %209, %325 ], [ %209, %321 ], [ %209, %211 ], [ %188, %84 ], [ %188, %194 ], [ %188, %198 ], [ %188, %202 ]
  store i32 %333, i32* %33, align 8
  store i32 %334, i32* %34, align 4
  store i32 %335, i32* %35, align 8
  store i32 %336, i32* %36, align 4
  store i32 %337, i32* %37, align 8, !tbaa !25
  br label %339

; <label>:339:                                    ; preds = %332, %205
  %340 = phi i32 [ %209, %205 ], [ %338, %332 ]
  %341 = phi i32 [ %206, %205 ], [ %337, %332 ]
  %342 = add nsw i32 %341, 1
  store i32 %342, i32* %37, align 8, !tbaa !25
  %343 = sext i32 %341 to i64
  %344 = getelementptr inbounds %"class.tensorflow::random::SingleSampleAdapter", %"class.tensorflow::random::SingleSampleAdapter"* %11, i64 0, i32 1, i32 0, i64 %343
  %345 = load i32, i32* %344, align 4, !tbaa !13
  %346 = and i32 %340, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %43) #5
  %347 = or i32 %346, 1065353216
  store i32 %347, i32* %7, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %44) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %44, i8* nonnull %43, i64 4) #6
  %348 = load float, float* %8, align 4, !tbaa !17
  %349 = fadd float %348, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %44) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %43) #5
  %350 = fcmp olt float %349, 0x3E7AD7F2A0000000
  %351 = select i1 %350, float 0x3E7AD7F2A0000000, float %349
  %352 = and i32 %345, 8388607
  call void @llvm.lifetime.start(i64 4, i8* nonnull %45) #5
  %353 = or i32 %352, 1065353216
  store i32 %353, i32* %5, align 4, !tbaa !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %46) #5
  call void @_Z6memcpyPvPKvm(i8* nonnull %46, i8* nonnull %45, i64 4) #6
  %354 = load float, float* %6, align 4, !tbaa !17
  %355 = fadd float %354, -1.000000e+00
  call void @llvm.lifetime.end(i64 4, i8* nonnull %46) #5
  call void @llvm.lifetime.end(i64 4, i8* nonnull %45) #5
  %356 = fpext float %355 to double
  %357 = fmul double %356, 0x401921FB54442D18
  %358 = fptrunc double %357 to float
  %359 = call float @_Z3logf(float %351) #6
  %360 = fmul float %359, -2.000000e+00
  %361 = call float @_Z4sqrtf(float %360) #6
  %362 = call float @_Z4sinff(float %358) #6
  %363 = call float @_Z4cosff(float %358) #6
  %364 = fmul float %361, %362
  %365 = fmul float %361, %363
  %366 = call float @_Z4fabsf(float %364) #6
  %367 = fcmp olt float %366, %24
  br i1 %367, label %368, label %373

; <label>:368:                                    ; preds = %339
  %369 = add nsw i32 %82, 1
  %370 = sext i32 %82 to i64
  %371 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 %370
  store float %364, float* %371, align 4, !tbaa !17
  %372 = icmp sgt i32 %82, 2
  br i1 %372, label %382, label %373

; <label>:373:                                    ; preds = %368, %339
  %374 = phi i32 [ %369, %368 ], [ %82, %339 ]
  %375 = call float @_Z4fabsf(float %365) #6
  %376 = fcmp olt float %375, %24
  br i1 %376, label %377, label %.backedge.backedge

; <label>:377:                                    ; preds = %373
  %378 = add nsw i32 %374, 1
  %379 = sext i32 %374 to i64
  %380 = getelementptr inbounds %"class.tensorflow::random::Array.1", %"class.tensorflow::random::Array.1"* %9, i64 0, i32 0, i64 %379
  store float %365, float* %380, align 4, !tbaa !17
  %381 = icmp sgt i32 %374, 2
  br i1 %381, label %382, label %.backedge.backedge

.backedge.backedge:                               ; preds = %377, %373
  %.be = phi i32 [ %378, %377 ], [ %374, %373 ]
  br label %.backedge

; <label>:382:                                    ; preds = %377, %368
  %383 = load i32, i32* %47, align 4
  %384 = load i32, i32* %48, align 4
  %385 = load i32, i32* %49, align 4
  %386 = load i32, i32* %50, align 4
  call void @llvm.lifetime.end(i64 16, i8* nonnull %38) #5
  %387 = getelementptr inbounds float, float* %1, i64 %59
  %388 = bitcast float* %387 to i32*
  store i32 %383, i32* %388, align 4, !tbaa !17
  %389 = or i64 %59, 1
  %390 = icmp slt i64 %389, %2
  br i1 %390, label %392, label %391

; <label>:391:                                    ; preds = %397, %392, %382
  call void @llvm.lifetime.end(i64 32, i8* nonnull %31) #5
  call void @llvm.lifetime.end(i64 24, i8* nonnull %25) #5
  br label %.loopexit

; <label>:392:                                    ; preds = %382
  %393 = getelementptr inbounds float, float* %1, i64 %389
  %394 = bitcast float* %393 to i32*
  store i32 %384, i32* %394, align 4, !tbaa !17
  %395 = or i64 %59, 2
  %396 = icmp slt i64 %395, %2
  br i1 %396, label %397, label %391

; <label>:397:                                    ; preds = %392
  %398 = getelementptr inbounds float, float* %1, i64 %395
  %399 = bitcast float* %398 to i32*
  store i32 %385, i32* %399, align 4, !tbaa !17
  %400 = or i64 %59, 3
  %401 = icmp slt i64 %400, %2
  br i1 %401, label %402, label %391

; <label>:402:                                    ; preds = %397
  %403 = getelementptr inbounds float, float* %1, i64 %400
  %404 = bitcast float* %403 to i32*
  store i32 %386, i32* %404, align 4, !tbaa !17
  %405 = add i64 %55, %59
  %406 = add nsw i64 %60, %54
  call void @llvm.lifetime.end(i64 32, i8* nonnull %31) #5
  call void @llvm.lifetime.end(i64 24, i8* nonnull %25) #5
  %407 = icmp slt i64 %405, %2
  br i1 %407, label %58, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %402
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %391, %4
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
