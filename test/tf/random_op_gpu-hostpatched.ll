; ModuleID = 'bazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-hostraw.ll'
source_filename = "tensorflow/core/kernels/random_op_gpu.cu.cc"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%"struct.tensorflow::functor::FillPhiloxRandom" = type { i8 }
%"class.tensorflow::OpKernelContext" = type opaque
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"class.tensorflow::random::PhiloxRandom" = type { %"class.tensorflow::random::Array", %"class.tensorflow::random::Array.1" }
%"class.tensorflow::random::Array" = type { [4 x i32] }
%"class.tensorflow::random::Array.1" = type { [2 x i32] }
%struct.cudaDeviceProp = type { i64, i64, i64, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }
%"struct.tensorflow::functor::FillPhiloxRandom.2" = type { i8 }
%"struct.tensorflow::functor::FillPhiloxRandom.3" = type { i8 }
%"class.tensorflow::random::TruncatedNormalDistribution" = type { float }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll" = global [54152 x i8] c"; ModuleID = 'bazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device-noopt.ll'\0Asource_filename = \22tensorflow/core/kernels/random_op_gpu.cu.cc\22\0Atarget datalayout = \22e-i64:64-v16:16-v32:32-n16:32:64\22\0Atarget triple = \22nvptx64-nvidia-cuda\22\0A\0A%\22class.tensorflow::random::PhiloxRandom\22 = type { %\22class.tensorflow::random::Array\22, %\22class.tensorflow::random::Array.0\22 }\0A%\22class.tensorflow::random::Array\22 = type { [4 x i32] }\0A%\22class.tensorflow::random::Array.0\22 = type { [2 x i32] }\0A%\22class.tensorflow::random::UniformDistribution\22 = type { i8 }\0A%\22class.tensorflow::random::NormalDistribution\22 = type { i8 }\0A%\22class.tensorflow::random::TruncatedNormalDistribution\22 = type { float }\0A%\22class.tensorflow::random::Array.1\22 = type { [4 x float] }\0A%\22class.tensorflow::random::SingleSampleAdapter\22 = type <{ %\22class.tensorflow::random::PhiloxRandom\22*, %\22class.tensorflow::random::Array\22, i32, [4 x i8] }>\0A\0A$_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ = comdat any\0A\0A$_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ = comdat any\0A\0A$_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_ = comdat any\0A\0A@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section \22llvm.metadata\22\0A\0A; Function Attrs: norecurse nounwind readnone\0Adefine internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {\0A  ret i32 0\0A}\0A\0A; Function Attrs: convergent nounwind\0Adefine void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_(%\22class.tensorflow::random::PhiloxRandom\22* byval nocapture readonly align 4, float* nocapture, i64, %\22class.tensorflow::random::UniformDistribution\22* byval nocapture readnone align 1) local_unnamed_addr #1 comdat {\0A  %5 = alloca i32, align 4\0A  %6 = alloca float, align 4\0A  %7 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 0\0A  %8 = load i32, i32* %7, align 4\0A  %9 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 1\0A  %10 = load i32, i32* %9, align 4\0A  %11 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 2\0A  %12 = load i32, i32* %11, align 4\0A  %13 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 1\0A  %14 = bitcast %\22class.tensorflow::random::Array.0\22* %13 to i64*\0A  %15 = load i64, i64* %14, align 4\0A  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !9\0A  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !10\0A  %18 = mul i32 %17, %16\0A  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !11\0A  %20 = add i32 %18, %19\0A  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !12\0A  %22 = mul i32 %21, %17\0A  %23 = shl nsw i32 %20, 2\0A  %24 = sext i32 %20 to i64\0A  %25 = lshr i64 %24, 32\0A  %26 = trunc i64 %25 to i32\0A  %27 = add i32 %20, %8\0A  %28 = icmp ult i32 %27, %20\0A  %29 = zext i1 %28 to i32\0A  %30 = add i32 %29, %26\0A  %31 = add i32 %30, %10\0A  %32 = icmp ult i32 %31, %30\0A  %33 = add i32 %12, 1\0A  %34 = sext i32 %23 to i64\0A  %35 = icmp slt i64 %34, %2\0A  br i1 %35, label %36, label %.loopexit\0A\0A; <label>:36:                                     ; preds = %4\0A  %37 = icmp eq i32 %33, 0\0A  %38 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 3\0A  %39 = load i32, i32* %38, align 4\0A  %narrow = and i1 %37, %32\0A  %40 = zext i1 %narrow to i32\0A  %.1 = add i32 %39, %40\0A  %. = select i1 %32, i32 %33, i32 %12\0A  %41 = add nsw i32 %22, -1\0A  %42 = shl i32 %41, 2\0A  %43 = sext i32 %41 to i64\0A  %44 = lshr i64 %43, 32\0A  %45 = trunc i64 %44 to i32\0A  %46 = trunc i64 %15 to i32\0A  %47 = lshr i64 %15, 32\0A  %48 = trunc i64 %47 to i32\0A  %49 = add i32 %46, -1640531527\0A  %50 = add i32 %48, -1150833019\0A  %51 = add i32 %46, 1013904242\0A  %52 = add i32 %48, 1993301258\0A  %53 = add i32 %46, -626627285\0A  %54 = add i32 %48, 842468239\0A  %55 = add i32 %46, 2027808484\0A  %56 = add i32 %48, -308364780\0A  %57 = add i32 %46, 387276957\0A  %58 = add i32 %48, -1459197799\0A  %59 = add i32 %46, -1253254570\0A  %60 = add i32 %48, 1684936478\0A  %61 = add i32 %46, 1401181199\0A  %62 = add i32 %48, 534103459\0A  %63 = add i32 %46, -239350328\0A  %64 = add i32 %48, -616729560\0A  %65 = add i32 %46, 7554945\0A  %66 = add i32 %48, 2433709\0A  %67 = bitcast i32* %5 to i8*\0A  %68 = bitcast float* %6 to i8*\0A  %69 = add i32 %42, 4\0A  br label %70\0A\0A; <label>:70:                                     ; preds = %201, %36\0A  %71 = phi i32 [ %31, %36 ], [ %208, %201 ]\0A  %72 = phi i32 [ %27, %36 ], [ %204, %201 ]\0A  %73 = phi i32 [ %., %36 ], [ %212, %201 ]\0A  %74 = phi i32 [ %.1, %36 ], [ %214, %201 ]\0A  %75 = phi i32 [ %23, %36 ], [ %203, %201 ]\0A  %76 = mul i32 %72, -766435501\0A  %77 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %72) #6\0A  %78 = mul i32 %73, -845247145\0A  %79 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %73) #6\0A  %80 = xor i32 %71, %46\0A  %81 = xor i32 %80, %79\0A  %82 = xor i32 %74, %48\0A  %83 = xor i32 %82, %77\0A  %84 = mul i32 %81, -766435501\0A  %85 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %81) #6\0A  %86 = mul i32 %83, -845247145\0A  %87 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %83) #6\0A  %88 = xor i32 %78, %49\0A  %89 = xor i32 %88, %87\0A  %90 = xor i32 %76, %50\0A  %91 = xor i32 %90, %85\0A  %92 = mul i32 %89, -766435501\0A  %93 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %89) #6\0A  %94 = mul i32 %91, -845247145\0A  %95 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %91) #6\0A  %96 = xor i32 %86, %51\0A  %97 = xor i32 %96, %95\0A  %98 = xor i32 %84, %52\0A  %99 = xor i32 %98, %93\0A  %100 = mul i32 %97, -766435501\0A  %101 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %97) #6\0A  %102 = mul i32 %99, -845247145\0A  %103 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %99) #6\0A  %104 = xor i32 %94, %53\0A  %105 = xor i32 %104, %103\0A  %106 = xor i32 %92, %54\0A  %107 = xor i32 %106, %101\0A  %108 = mul i32 %105, -766435501\0A  %109 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %105) #6\0A  %110 = mul i32 %107, -845247145\0A  %111 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %107) #6\0A  %112 = xor i32 %102, %55\0A  %113 = xor i32 %112, %111\0A  %114 = xor i32 %100, %56\0A  %115 = xor i32 %114, %109\0A  %116 = mul i32 %113, -766435501\0A  %117 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %113) #6\0A  %118 = mul i32 %115, -845247145\0A  %119 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %115) #6\0A  %120 = xor i32 %110, %57\0A  %121 = xor i32 %120, %119\0A  %122 = xor i32 %108, %58\0A  %123 = xor i32 %122, %117\0A  %124 = mul i32 %121, -766435501\0A  %125 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %121) #6\0A  %126 = mul i32 %123, -845247145\0A  %127 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %123) #6\0A  %128 = xor i32 %118, %59\0A  %129 = xor i32 %128, %127\0A  %130 = xor i32 %116, %60\0A  %131 = xor i32 %130, %125\0A  %132 = mul i32 %129, -766435501\0A  %133 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %129) #6\0A  %134 = mul i32 %131, -845247145\0A  %135 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %131) #6\0A  %136 = xor i32 %126, %61\0A  %137 = xor i32 %136, %135\0A  %138 = xor i32 %124, %62\0A  %139 = xor i32 %138, %133\0A  %140 = mul i32 %137, -766435501\0A  %141 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %137) #6\0A  %142 = mul i32 %139, -845247145\0A  %143 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %139) #6\0A  %144 = xor i32 %134, %63\0A  %145 = xor i32 %144, %143\0A  %146 = xor i32 %132, %64\0A  %147 = xor i32 %146, %141\0A  %148 = mul i32 %145, -766435501\0A  %149 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %145) #6\0A  %150 = mul i32 %147, -845247145\0A  %151 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %147) #6\0A  %152 = xor i32 %142, %65\0A  %153 = xor i32 %152, %151\0A  %154 = xor i32 %140, %66\0A  %155 = xor i32 %154, %149\0A  %156 = icmp eq i32 %72, -1\0A  br i1 %156, label %157, label %164\0A\0A; <label>:157:                                    ; preds = %70\0A  %158 = add i32 %71, 1\0A  %159 = icmp eq i32 %158, 0\0A  %160 = add i32 %73, 1\0A  %.3 = select i1 %159, i32 %160, i32 %73\0A  %161 = or i32 %160, %158\0A  %162 = icmp eq i32 %161, 0\0A  %163 = zext i1 %162 to i32\0A  %.4 = add i32 %163, %74\0A  br label %164\0A\0A; <label>:164:                                    ; preds = %157, %70\0A  %165 = phi i32 [ %71, %70 ], [ %158, %157 ]\0A  %166 = phi i32 [ %73, %70 ], [ %.3, %157 ]\0A  %167 = phi i32 [ %74, %70 ], [ %.4, %157 ]\0A  %168 = and i32 %153, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5\0A  %169 = or i32 %168, 1065353216\0A  store i32 %169, i32* %5, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6\0A  %170 = load float, float* %6, align 4, !tbaa !17\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5\0A  %171 = and i32 %150, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5\0A  %172 = or i32 %171, 1065353216\0A  store i32 %172, i32* %5, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6\0A  %173 = load float, float* %6, align 4, !tbaa !17\0A  %174 = fadd float %173, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5\0A  %175 = and i32 %155, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5\0A  %176 = or i32 %175, 1065353216\0A  store i32 %176, i32* %5, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6\0A  %177 = load float, float* %6, align 4, !tbaa !17\0A  %178 = fadd float %177, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5\0A  %179 = and i32 %148, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %67) #5\0A  %180 = or i32 %179, 1065353216\0A  store i32 %180, i32* %5, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %68) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %68, i8* nonnull %67, i64 4) #6\0A  %181 = load float, float* %6, align 4, !tbaa !17\0A  %182 = fadd float %181, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %68) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %67) #5\0A  %183 = sext i32 %75 to i64\0A  %184 = icmp slt i64 %183, %2\0A  br i1 %184, label %185, label %.loopexit.loopexit\0A\0A; <label>:185:                                    ; preds = %164\0A  %186 = fadd float %170, -1.000000e+00\0A  %187 = getelementptr inbounds float, float* %1, i64 %183\0A  store float %186, float* %187, align 4, !tbaa !17\0A  %188 = or i32 %75, 1\0A  %189 = sext i32 %188 to i64\0A  %190 = icmp slt i64 %189, %2\0A  br i1 %190, label %191, label %.loopexit.loopexit\0A\0A; <label>:191:                                    ; preds = %185\0A  %192 = getelementptr inbounds float, float* %1, i64 %189\0A  store float %174, float* %192, align 4, !tbaa !17\0A  %193 = or i32 %75, 2\0A  %194 = sext i32 %193 to i64\0A  %195 = icmp slt i64 %194, %2\0A  br i1 %195, label %196, label %.loopexit.loopexit\0A\0A; <label>:196:                                    ; preds = %191\0A  %197 = getelementptr inbounds float, float* %1, i64 %194\0A  store float %178, float* %197, align 4, !tbaa !17\0A  %198 = or i32 %75, 3\0A  %199 = sext i32 %198 to i64\0A  %200 = icmp slt i64 %199, %2\0A  br i1 %200, label %201, label %.loopexit.loopexit\0A\0A; <label>:201:                                    ; preds = %196\0A  %202 = getelementptr inbounds float, float* %1, i64 %199\0A  store float %182, float* %202, align 4, !tbaa !17\0A  %203 = add i32 %69, %75\0A  %204 = add i32 %72, %22\0A  %205 = icmp ult i32 %204, %41\0A  %206 = zext i1 %205 to i32\0A  %207 = add i32 %206, %45\0A  %208 = add i32 %165, %207\0A  %209 = icmp ult i32 %208, %207\0A  %210 = add i32 %166, 1\0A  %211 = icmp eq i32 %210, 0\0A  %212 = select i1 %209, i32 %210, i32 %166\0A  %narrow5 = and i1 %209, %211\0A  %213 = zext i1 %narrow5 to i32\0A  %214 = add i32 %213, %167\0A  %215 = sext i32 %203 to i64\0A  %216 = icmp slt i64 %215, %2\0A  br i1 %216, label %70, label %.loopexit.loopexit\0A\0A.loopexit.loopexit:                               ; preds = %196, %191, %201, %185, %164\0A  br label %.loopexit\0A\0A.loopexit:                                        ; preds = %.loopexit.loopexit, %4\0A  ret void\0A}\0A\0A; Function Attrs: argmemonly nounwind\0Adeclare void @llvm.lifetime.start(i64, i8* nocapture) #2\0A\0A; Function Attrs: argmemonly nounwind\0Adeclare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2\0A\0A; Function Attrs: argmemonly nounwind\0Adeclare void @llvm.lifetime.end(i64, i8* nocapture) #2\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #3\0A\0A; Function Attrs: convergent nounwind\0Adeclare i32 @_Z8__umulhiii(i32, i32) local_unnamed_addr #4\0A\0A; Function Attrs: convergent nounwind\0Adeclare void @_Z6memcpyPvPKvm(i8*, i8*, i64) local_unnamed_addr #4\0A\0A; Function Attrs: convergent nounwind\0Adefine void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_(%\22class.tensorflow::random::PhiloxRandom\22* byval nocapture readonly align 4, float* nocapture, i64, %\22class.tensorflow::random::NormalDistribution\22* byval nocapture readnone align 1) local_unnamed_addr #1 comdat {\0A  %5 = alloca i32, align 4\0A  %6 = alloca float, align 4\0A  %7 = alloca i32, align 4\0A  %8 = alloca float, align 4\0A  %9 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 0\0A  %10 = load i32, i32* %9, align 4\0A  %11 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 1\0A  %12 = load i32, i32* %11, align 4\0A  %13 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 2\0A  %14 = load i32, i32* %13, align 4\0A  %15 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 1\0A  %16 = bitcast %\22class.tensorflow::random::Array.0\22* %15 to i64*\0A  %17 = load i64, i64* %16, align 4\0A  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !9\0A  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !10\0A  %20 = mul i32 %19, %18\0A  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !11\0A  %22 = add i32 %20, %21\0A  %23 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !12\0A  %24 = mul i32 %23, %19\0A  %25 = shl nsw i32 %22, 2\0A  %26 = sext i32 %22 to i64\0A  %27 = lshr i64 %26, 32\0A  %28 = trunc i64 %27 to i32\0A  %29 = add i32 %22, %10\0A  %30 = icmp ult i32 %29, %22\0A  %31 = zext i1 %30 to i32\0A  %32 = add i32 %31, %28\0A  %33 = add i32 %32, %12\0A  %34 = icmp ult i32 %33, %32\0A  %35 = add i32 %14, 1\0A  %36 = sext i32 %25 to i64\0A  %37 = icmp slt i64 %36, %2\0A  br i1 %37, label %38, label %.loopexit\0A\0A; <label>:38:                                     ; preds = %4\0A  %39 = icmp eq i32 %35, 0\0A  %40 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %0, i64 0, i32 0, i32 0, i64 3\0A  %41 = load i32, i32* %40, align 4\0A  %narrow = and i1 %39, %34\0A  %42 = zext i1 %narrow to i32\0A  %.1 = add i32 %41, %42\0A  %. = select i1 %34, i32 %35, i32 %14\0A  %43 = bitcast i32* %7 to i8*\0A  %44 = bitcast float* %8 to i8*\0A  %45 = bitcast i32* %5 to i8*\0A  %46 = bitcast float* %6 to i8*\0A  %47 = add nsw i32 %24, -1\0A  %48 = shl i32 %47, 2\0A  %49 = sext i32 %47 to i64\0A  %50 = lshr i64 %49, 32\0A  %51 = trunc i64 %50 to i32\0A  %52 = trunc i64 %17 to i32\0A  %53 = lshr i64 %17, 32\0A  %54 = trunc i64 %53 to i32\0A  %55 = add i32 %52, -1640531527\0A  %56 = add i32 %54, -1150833019\0A  %57 = add i32 %52, 1013904242\0A  %58 = add i32 %54, 1993301258\0A  %59 = add i32 %52, -626627285\0A  %60 = add i32 %54, 842468239\0A  %61 = add i32 %52, 2027808484\0A  %62 = add i32 %54, -308364780\0A  %63 = add i32 %52, 387276957\0A  %64 = add i32 %54, -1459197799\0A  %65 = add i32 %52, -1253254570\0A  %66 = add i32 %54, 1684936478\0A  %67 = add i32 %52, 1401181199\0A  %68 = add i32 %54, 534103459\0A  %69 = add i32 %52, -239350328\0A  %70 = add i32 %54, -616729560\0A  %71 = add i32 %52, 7554945\0A  %72 = add i32 %54, 2433709\0A  %73 = add i32 %48, 4\0A  br label %74\0A\0A; <label>:74:                                     ; preds = %229, %38\0A  %75 = phi i32 [ %33, %38 ], [ %236, %229 ]\0A  %76 = phi i32 [ %29, %38 ], [ %232, %229 ]\0A  %77 = phi i32 [ %., %38 ], [ %240, %229 ]\0A  %78 = phi i32 [ %.1, %38 ], [ %242, %229 ]\0A  %79 = phi i32 [ %25, %38 ], [ %231, %229 ]\0A  %80 = mul i32 %76, -766435501\0A  %81 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %76) #6\0A  %82 = mul i32 %77, -845247145\0A  %83 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %77) #6\0A  %84 = xor i32 %75, %52\0A  %85 = xor i32 %84, %83\0A  %86 = xor i32 %78, %54\0A  %87 = xor i32 %86, %81\0A  %88 = mul i32 %85, -766435501\0A  %89 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %85) #6\0A  %90 = mul i32 %87, -845247145\0A  %91 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %87) #6\0A  %92 = xor i32 %82, %55\0A  %93 = xor i32 %92, %91\0A  %94 = xor i32 %80, %56\0A  %95 = xor i32 %94, %89\0A  %96 = mul i32 %93, -766435501\0A  %97 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %93) #6\0A  %98 = mul i32 %95, -845247145\0A  %99 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %95) #6\0A  %100 = xor i32 %90, %57\0A  %101 = xor i32 %100, %99\0A  %102 = xor i32 %88, %58\0A  %103 = xor i32 %102, %97\0A  %104 = mul i32 %101, -766435501\0A  %105 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %101) #6\0A  %106 = mul i32 %103, -845247145\0A  %107 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %103) #6\0A  %108 = xor i32 %98, %59\0A  %109 = xor i32 %108, %107\0A  %110 = xor i32 %96, %60\0A  %111 = xor i32 %110, %105\0A  %112 = mul i32 %109, -766435501\0A  %113 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %109) #6\0A  %114 = mul i32 %111, -845247145\0A  %115 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %111) #6\0A  %116 = xor i32 %106, %61\0A  %117 = xor i32 %116, %115\0A  %118 = xor i32 %104, %62\0A  %119 = xor i32 %118, %113\0A  %120 = mul i32 %117, -766435501\0A  %121 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %117) #6\0A  %122 = mul i32 %119, -845247145\0A  %123 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %119) #6\0A  %124 = xor i32 %114, %63\0A  %125 = xor i32 %124, %123\0A  %126 = xor i32 %112, %64\0A  %127 = xor i32 %126, %121\0A  %128 = mul i32 %125, -766435501\0A  %129 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %125) #6\0A  %130 = mul i32 %127, -845247145\0A  %131 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %127) #6\0A  %132 = xor i32 %122, %65\0A  %133 = xor i32 %132, %131\0A  %134 = xor i32 %120, %66\0A  %135 = xor i32 %134, %129\0A  %136 = mul i32 %133, -766435501\0A  %137 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %133) #6\0A  %138 = mul i32 %135, -845247145\0A  %139 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %135) #6\0A  %140 = xor i32 %130, %67\0A  %141 = xor i32 %140, %139\0A  %142 = xor i32 %128, %68\0A  %143 = xor i32 %142, %137\0A  %144 = mul i32 %141, -766435501\0A  %145 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %141) #6\0A  %146 = mul i32 %143, -845247145\0A  %147 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %143) #6\0A  %148 = xor i32 %138, %69\0A  %149 = xor i32 %148, %147\0A  %150 = xor i32 %136, %70\0A  %151 = xor i32 %150, %145\0A  %152 = mul i32 %149, -766435501\0A  %153 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %149) #6\0A  %154 = mul i32 %151, -845247145\0A  %155 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %151) #6\0A  %156 = xor i32 %146, %71\0A  %157 = xor i32 %156, %155\0A  %158 = xor i32 %144, %72\0A  %159 = xor i32 %158, %153\0A  %160 = icmp eq i32 %76, -1\0A  br i1 %160, label %161, label %168\0A\0A; <label>:161:                                    ; preds = %74\0A  %162 = add i32 %75, 1\0A  %163 = icmp eq i32 %162, 0\0A  %164 = add i32 %77, 1\0A  %.3 = select i1 %163, i32 %164, i32 %77\0A  %165 = or i32 %164, %162\0A  %166 = icmp eq i32 %165, 0\0A  %167 = zext i1 %166 to i32\0A  %.4 = add i32 %167, %78\0A  br label %168\0A\0A; <label>:168:                                    ; preds = %161, %74\0A  %169 = phi i32 [ %75, %74 ], [ %162, %161 ]\0A  %170 = phi i32 [ %77, %74 ], [ %.3, %161 ]\0A  %171 = phi i32 [ %78, %74 ], [ %.4, %161 ]\0A  %172 = and i32 %157, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %43) #5\0A  %173 = or i32 %172, 1065353216\0A  store i32 %173, i32* %7, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %44) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %44, i8* nonnull %43, i64 4) #6\0A  %174 = load float, float* %8, align 4, !tbaa !17\0A  %175 = fadd float %174, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %44) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %43) #5\0A  %176 = fcmp olt float %175, 0x3E7AD7F2A0000000\0A  %177 = select i1 %176, float 0x3E7AD7F2A0000000, float %175\0A  %178 = and i32 %154, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %45) #5\0A  %179 = or i32 %178, 1065353216\0A  store i32 %179, i32* %5, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %46) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %46, i8* nonnull %45, i64 4) #6\0A  %180 = load float, float* %6, align 4, !tbaa !17\0A  %181 = fadd float %180, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %46) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %45) #5\0A  %182 = fpext float %181 to double\0A  %183 = fmul double %182, 0x401921FB54442D18\0A  %184 = fptrunc double %183 to float\0A  %185 = call float @_Z3logf(float %177) #6\0A  %186 = fmul float %185, -2.000000e+00\0A  %187 = call float @_Z4sqrtf(float %186) #6\0A  %188 = call float @_Z4sinff(float %184) #6\0A  %189 = call float @_Z4cosff(float %184) #6\0A  %190 = fmul float %187, %189\0A  %191 = and i32 %159, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %43) #5\0A  %192 = or i32 %191, 1065353216\0A  store i32 %192, i32* %7, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %44) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %44, i8* nonnull %43, i64 4) #6\0A  %193 = load float, float* %8, align 4, !tbaa !17\0A  %194 = fadd float %193, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %44) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %43) #5\0A  %195 = fcmp olt float %194, 0x3E7AD7F2A0000000\0A  %196 = select i1 %195, float 0x3E7AD7F2A0000000, float %194\0A  %197 = and i32 %152, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %45) #5\0A  %198 = or i32 %197, 1065353216\0A  store i32 %198, i32* %5, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %46) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %46, i8* nonnull %45, i64 4) #6\0A  %199 = load float, float* %6, align 4, !tbaa !17\0A  %200 = fadd float %199, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %46) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %45) #5\0A  %201 = fpext float %200 to double\0A  %202 = fmul double %201, 0x401921FB54442D18\0A  %203 = fptrunc double %202 to float\0A  %204 = call float @_Z3logf(float %196) #6\0A  %205 = fmul float %204, -2.000000e+00\0A  %206 = call float @_Z4sqrtf(float %205) #6\0A  %207 = call float @_Z4sinff(float %203) #6\0A  %208 = call float @_Z4cosff(float %203) #6\0A  %209 = fmul float %206, %207\0A  %210 = fmul float %206, %208\0A  %211 = sext i32 %79 to i64\0A  %212 = icmp slt i64 %211, %2\0A  br i1 %212, label %213, label %.loopexit.loopexit\0A\0A; <label>:213:                                    ; preds = %168\0A  %214 = fmul float %187, %188\0A  %215 = getelementptr inbounds float, float* %1, i64 %211\0A  store float %214, float* %215, align 4, !tbaa !17\0A  %216 = or i32 %79, 1\0A  %217 = sext i32 %216 to i64\0A  %218 = icmp slt i64 %217, %2\0A  br i1 %218, label %219, label %.loopexit.loopexit\0A\0A; <label>:219:                                    ; preds = %213\0A  %220 = getelementptr inbounds float, float* %1, i64 %217\0A  store float %190, float* %220, align 4, !tbaa !17\0A  %221 = or i32 %79, 2\0A  %222 = sext i32 %221 to i64\0A  %223 = icmp slt i64 %222, %2\0A  br i1 %223, label %224, label %.loopexit.loopexit\0A\0A; <label>:224:                                    ; preds = %219\0A  %225 = getelementptr inbounds float, float* %1, i64 %222\0A  store float %209, float* %225, align 4, !tbaa !17\0A  %226 = or i32 %79, 3\0A  %227 = sext i32 %226 to i64\0A  %228 = icmp slt i64 %227, %2\0A  br i1 %228, label %229, label %.loopexit.loopexit\0A\0A; <label>:229:                                    ; preds = %224\0A  %230 = getelementptr inbounds float, float* %1, i64 %227\0A  store float %210, float* %230, align 4, !tbaa !17\0A  %231 = add i32 %73, %79\0A  %232 = add i32 %76, %24\0A  %233 = icmp ult i32 %232, %47\0A  %234 = zext i1 %233 to i32\0A  %235 = add i32 %234, %51\0A  %236 = add i32 %169, %235\0A  %237 = icmp ult i32 %236, %235\0A  %238 = add i32 %170, 1\0A  %239 = icmp eq i32 %238, 0\0A  %240 = select i1 %237, i32 %238, i32 %170\0A  %narrow5 = and i1 %237, %239\0A  %241 = zext i1 %narrow5 to i32\0A  %242 = add i32 %241, %171\0A  %243 = sext i32 %231 to i64\0A  %244 = icmp slt i64 %243, %2\0A  br i1 %244, label %74, label %.loopexit.loopexit\0A\0A.loopexit.loopexit:                               ; preds = %224, %219, %229, %213, %168\0A  br label %.loopexit\0A\0A.loopexit:                                        ; preds = %.loopexit.loopexit, %4\0A  ret void\0A}\0A\0A; Function Attrs: convergent nounwind\0Adeclare float @_Z4sqrtf(float) local_unnamed_addr #4\0A\0A; Function Attrs: convergent nounwind\0Adeclare float @_Z3logf(float) local_unnamed_addr #4\0A\0A; Function Attrs: convergent nounwind\0Adeclare float @_Z4sinff(float) local_unnamed_addr #4\0A\0A; Function Attrs: convergent nounwind\0Adeclare float @_Z4cosff(float) local_unnamed_addr #4\0A\0A; Function Attrs: convergent nounwind\0Adefine void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_(%\22class.tensorflow::random::PhiloxRandom\22* byval nocapture readonly align 4, float* nocapture, i64, %\22class.tensorflow::random::TruncatedNormalDistribution\22* byval nocapture readonly align 4) local_unnamed_addr #1 comdat {\0A  %5 = alloca i32, align 4\0A  %6 = alloca float, align 4\0A  %7 = alloca i32, align 4\0A  %8 = alloca float, align 4\0A  %9 = alloca %\22class.tensorflow::random::Array.1\22, align 4\0A  %10 = alloca %\22class.tensorflow::random::PhiloxRandom\22, align 4\0A  %11 = alloca %\22class.tensorflow::random::SingleSampleAdapter\22, align 8\0A  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !9\0A  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !10\0A  %14 = mul i32 %13, %12\0A  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !11\0A  %16 = add i32 %14, %15\0A  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !12\0A  %18 = mul i32 %17, %13\0A  %19 = sext i32 %16 to i64\0A  %20 = shl nsw i64 %19, 2\0A  %21 = icmp slt i64 %20, %2\0A  br i1 %21, label %22, label %.loopexit\0A\0A; <label>:22:                                     ; preds = %4\0A  %23 = getelementptr inbounds %\22class.tensorflow::random::TruncatedNormalDistribution\22, %\22class.tensorflow::random::TruncatedNormalDistribution\22* %3, i64 0, i32 0\0A  %24 = load float, float* %23, align 4, !tbaa !17\0A  %25 = bitcast %\22class.tensorflow::random::PhiloxRandom\22* %10 to i8*\0A  %26 = bitcast %\22class.tensorflow::random::PhiloxRandom\22* %0 to i8*\0A  %27 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %10, i64 0, i32 0, i32 0, i64 0\0A  %28 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %10, i64 0, i32 0, i32 0, i64 1\0A  %29 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %10, i64 0, i32 0, i32 0, i64 2\0A  %30 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %10, i64 0, i32 0, i32 0, i64 3\0A  %31 = bitcast %\22class.tensorflow::random::SingleSampleAdapter\22* %11 to i8*\0A  %32 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 0\0A  %33 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 1, i32 0, i64 0\0A  %34 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 1, i32 0, i64 1\0A  %35 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 1, i32 0, i64 2\0A  %36 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 1, i32 0, i64 3\0A  %37 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 2\0A  %38 = bitcast %\22class.tensorflow::random::Array.1\22* %9 to i8*\0A  %39 = getelementptr inbounds %\22class.tensorflow::random::Array.1\22, %\22class.tensorflow::random::Array.1\22* %9, i64 0, i32 0, i64 0\0A  %40 = getelementptr inbounds %\22class.tensorflow::random::Array.1\22, %\22class.tensorflow::random::Array.1\22* %9, i64 0, i32 0, i64 1\0A  %41 = getelementptr inbounds %\22class.tensorflow::random::Array.1\22, %\22class.tensorflow::random::Array.1\22* %9, i64 0, i32 0, i64 2\0A  %42 = getelementptr inbounds %\22class.tensorflow::random::Array.1\22, %\22class.tensorflow::random::Array.1\22* %9, i64 0, i32 0, i64 3\0A  %43 = bitcast i32* %7 to i8*\0A  %44 = bitcast float* %8 to i8*\0A  %45 = bitcast i32* %5 to i8*\0A  %46 = bitcast float* %6 to i8*\0A  %47 = bitcast %\22class.tensorflow::random::Array.1\22* %9 to i32*\0A  %48 = bitcast float* %40 to i32*\0A  %49 = bitcast float* %41 to i32*\0A  %50 = bitcast float* %42 to i32*\0A  %51 = shl i32 %18, 2\0A  %52 = add i32 %51, -4\0A  %53 = sext i32 %52 to i64\0A  %54 = sext i32 %18 to i64\0A  %55 = add nsw i64 %53, 4\0A  %56 = getelementptr inbounds %\22class.tensorflow::random::PhiloxRandom\22, %\22class.tensorflow::random::PhiloxRandom\22* %10, i64 0, i32 1\0A  %57 = bitcast %\22class.tensorflow::random::Array.0\22* %56 to i64*\0A  br label %58\0A\0A; <label>:58:                                     ; preds = %402, %22\0A  %59 = phi i64 [ %20, %22 ], [ %405, %402 ]\0A  %60 = phi i64 [ %19, %22 ], [ %406, %402 ]\0A  call void @llvm.lifetime.start(i64 24, i8* nonnull %25) #5\0A  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %25, i8* nonnull %26, i64 24, i32 4, i1 false) #5, !tbaa.struct !19\0A  %61 = trunc i64 %60 to i32\0A  %62 = shl i32 %61, 8\0A  %63 = lshr i64 %60, 24\0A  %64 = trunc i64 %63 to i32\0A  %65 = load i32, i32* %27, align 4, !tbaa !13\0A  %66 = add i32 %65, %62\0A  store i32 %66, i32* %27, align 4, !tbaa !13\0A  %67 = icmp ult i32 %66, %62\0A  %68 = zext i1 %67 to i32\0A  %69 = add i32 %68, %64\0A  %70 = load i32, i32* %28, align 4, !tbaa !13\0A  %71 = add i32 %69, %70\0A  store i32 %71, i32* %28, align 4, !tbaa !13\0A  %72 = icmp ult i32 %71, %69\0A  br i1 %72, label %73, label %80\0A\0A; <label>:73:                                     ; preds = %58\0A  %74 = load i32, i32* %29, align 4, !tbaa !13\0A  %75 = add i32 %74, 1\0A  store i32 %75, i32* %29, align 4, !tbaa !13\0A  %76 = icmp eq i32 %75, 0\0A  br i1 %76, label %77, label %80\0A\0A; <label>:77:                                     ; preds = %73\0A  %78 = load i32, i32* %30, align 4, !tbaa !13\0A  %79 = add i32 %78, 1\0A  store i32 %79, i32* %30, align 4, !tbaa !13\0A  br label %80\0A\0A; <label>:80:                                     ; preds = %77, %73, %58\0A  call void @llvm.lifetime.start(i64 32, i8* nonnull %31) #5\0A  store %\22class.tensorflow::random::PhiloxRandom\22* %10, %\22class.tensorflow::random::PhiloxRandom\22** %32, align 8, !tbaa !21\0A  store i32 0, i32* %33, align 8, !tbaa !13\0A  store i32 0, i32* %34, align 4, !tbaa !13\0A  store i32 0, i32* %35, align 8, !tbaa !13\0A  store i32 0, i32* %36, align 4, !tbaa !13\0A  store i32 4, i32* %37, align 8, !tbaa !25\0A  call void @llvm.lifetime.start(i64 16, i8* nonnull %38) #5\0A  store float 0.000000e+00, float* %39, align 4, !tbaa !17\0A  store float 0.000000e+00, float* %40, align 4, !tbaa !17\0A  store float 0.000000e+00, float* %41, align 4, !tbaa !17\0A  store float 0.000000e+00, float* %42, align 4, !tbaa !17\0A  br label %.backedge\0A\0A.backedge:                                        ; preds = %.backedge.backedge, %80\0A  %81 = phi i32 [ 4, %80 ], [ %342, %.backedge.backedge ]\0A  %82 = phi i32 [ 0, %80 ], [ %.be, %.backedge.backedge ]\0A  %83 = icmp eq i32 %81, 4\0A  br i1 %83, label %84, label %205\0A\0A; <label>:84:                                     ; preds = %.backedge\0A  %85 = load i32, i32* %27, align 4\0A  %86 = load i32, i32* %28, align 4\0A  %87 = load i32, i32* %29, align 4\0A  %88 = load i32, i32* %30, align 4\0A  %89 = load i64, i64* %57, align 4\0A  %90 = trunc i64 %89 to i32\0A  %91 = lshr i64 %89, 32\0A  %92 = trunc i64 %91 to i32\0A  %93 = mul i32 %85, -766435501\0A  %94 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %85) #6\0A  %95 = mul i32 %87, -845247145\0A  %96 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %87) #6\0A  %97 = xor i32 %90, %86\0A  %98 = xor i32 %97, %96\0A  %99 = xor i32 %94, %88\0A  %100 = xor i32 %99, %92\0A  %101 = add i32 %90, -1640531527\0A  %102 = add i32 %92, -1150833019\0A  %103 = mul i32 %98, -766435501\0A  %104 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %98) #6\0A  %105 = mul i32 %100, -845247145\0A  %106 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %100) #6\0A  %107 = xor i32 %101, %95\0A  %108 = xor i32 %107, %106\0A  %109 = xor i32 %104, %93\0A  %110 = xor i32 %109, %102\0A  %111 = add i32 %90, 1013904242\0A  %112 = add i32 %92, 1993301258\0A  %113 = mul i32 %108, -766435501\0A  %114 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %108) #6\0A  %115 = mul i32 %110, -845247145\0A  %116 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %110) #6\0A  %117 = xor i32 %105, %111\0A  %118 = xor i32 %117, %116\0A  %119 = xor i32 %103, %112\0A  %120 = xor i32 %119, %114\0A  %121 = add i32 %90, -626627285\0A  %122 = add i32 %92, 842468239\0A  %123 = mul i32 %118, -766435501\0A  %124 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %118) #6\0A  %125 = mul i32 %120, -845247145\0A  %126 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %120) #6\0A  %127 = xor i32 %115, %121\0A  %128 = xor i32 %127, %126\0A  %129 = xor i32 %113, %122\0A  %130 = xor i32 %129, %124\0A  %131 = add i32 %90, 2027808484\0A  %132 = add i32 %92, -308364780\0A  %133 = mul i32 %128, -766435501\0A  %134 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %128) #6\0A  %135 = mul i32 %130, -845247145\0A  %136 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %130) #6\0A  %137 = xor i32 %125, %131\0A  %138 = xor i32 %137, %136\0A  %139 = xor i32 %123, %132\0A  %140 = xor i32 %139, %134\0A  %141 = add i32 %90, 387276957\0A  %142 = add i32 %92, -1459197799\0A  %143 = mul i32 %138, -766435501\0A  %144 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %138) #6\0A  %145 = mul i32 %140, -845247145\0A  %146 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %140) #6\0A  %147 = xor i32 %135, %141\0A  %148 = xor i32 %147, %146\0A  %149 = xor i32 %133, %142\0A  %150 = xor i32 %149, %144\0A  %151 = add i32 %90, -1253254570\0A  %152 = add i32 %92, 1684936478\0A  %153 = mul i32 %148, -766435501\0A  %154 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %148) #6\0A  %155 = mul i32 %150, -845247145\0A  %156 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %150) #6\0A  %157 = xor i32 %145, %151\0A  %158 = xor i32 %157, %156\0A  %159 = xor i32 %143, %152\0A  %160 = xor i32 %159, %154\0A  %161 = add i32 %90, 1401181199\0A  %162 = add i32 %92, 534103459\0A  %163 = mul i32 %158, -766435501\0A  %164 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %158) #6\0A  %165 = mul i32 %160, -845247145\0A  %166 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %160) #6\0A  %167 = xor i32 %155, %161\0A  %168 = xor i32 %167, %166\0A  %169 = xor i32 %153, %162\0A  %170 = xor i32 %169, %164\0A  %171 = add i32 %90, -239350328\0A  %172 = add i32 %92, -616729560\0A  %173 = mul i32 %168, -766435501\0A  %174 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %168) #6\0A  %175 = mul i32 %170, -845247145\0A  %176 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %170) #6\0A  %177 = xor i32 %165, %171\0A  %178 = xor i32 %177, %176\0A  %179 = xor i32 %163, %172\0A  %180 = xor i32 %179, %174\0A  %181 = add i32 %90, -1879881855\0A  %182 = add i32 %92, -1767562579\0A  %183 = mul i32 %178, -766435501\0A  %184 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %178) #6\0A  %185 = mul i32 %180, -845247145\0A  %186 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %180) #6\0A  %187 = xor i32 %175, %181\0A  %188 = xor i32 %187, %186\0A  %189 = xor i32 %173, %182\0A  %190 = xor i32 %189, %184\0A  %191 = load i32, i32* %27, align 4, !tbaa !13\0A  %192 = add i32 %191, 1\0A  store i32 %192, i32* %27, align 4, !tbaa !13\0A  %193 = icmp eq i32 %192, 0\0A  br i1 %193, label %194, label %332\0A\0A; <label>:194:                                    ; preds = %84\0A  %195 = load i32, i32* %28, align 4, !tbaa !13\0A  %196 = add i32 %195, 1\0A  store i32 %196, i32* %28, align 4, !tbaa !13\0A  %197 = icmp eq i32 %196, 0\0A  br i1 %197, label %198, label %332\0A\0A; <label>:198:                                    ; preds = %194\0A  %199 = load i32, i32* %29, align 4, !tbaa !13\0A  %200 = add i32 %199, 1\0A  store i32 %200, i32* %29, align 4, !tbaa !13\0A  %201 = icmp eq i32 %200, 0\0A  br i1 %201, label %202, label %332\0A\0A; <label>:202:                                    ; preds = %198\0A  %203 = load i32, i32* %30, align 4, !tbaa !13\0A  %204 = add i32 %203, 1\0A  store i32 %204, i32* %30, align 4, !tbaa !13\0A  br label %332\0A\0A; <label>:205:                                    ; preds = %.backedge\0A  %206 = add nsw i32 %81, 1\0A  store i32 %206, i32* %37, align 8, !tbaa !25\0A  %207 = sext i32 %81 to i64\0A  %208 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 1, i32 0, i64 %207\0A  %209 = load i32, i32* %208, align 4, !tbaa !13\0A  %210 = icmp eq i32 %206, 4\0A  br i1 %210, label %211, label %339\0A\0A; <label>:211:                                    ; preds = %205\0A  %212 = load i32, i32* %27, align 4\0A  %213 = load i32, i32* %28, align 4\0A  %214 = load i32, i32* %29, align 4\0A  %215 = load i32, i32* %30, align 4\0A  %216 = load i64, i64* %57, align 4\0A  %217 = trunc i64 %216 to i32\0A  %218 = lshr i64 %216, 32\0A  %219 = trunc i64 %218 to i32\0A  %220 = mul i32 %212, -766435501\0A  %221 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %212) #6\0A  %222 = mul i32 %214, -845247145\0A  %223 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %214) #6\0A  %224 = xor i32 %217, %213\0A  %225 = xor i32 %224, %223\0A  %226 = xor i32 %221, %215\0A  %227 = xor i32 %226, %219\0A  %228 = add i32 %217, -1640531527\0A  %229 = add i32 %219, -1150833019\0A  %230 = mul i32 %225, -766435501\0A  %231 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %225) #6\0A  %232 = mul i32 %227, -845247145\0A  %233 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %227) #6\0A  %234 = xor i32 %228, %222\0A  %235 = xor i32 %234, %233\0A  %236 = xor i32 %231, %220\0A  %237 = xor i32 %236, %229\0A  %238 = add i32 %217, 1013904242\0A  %239 = add i32 %219, 1993301258\0A  %240 = mul i32 %235, -766435501\0A  %241 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %235) #6\0A  %242 = mul i32 %237, -845247145\0A  %243 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %237) #6\0A  %244 = xor i32 %232, %238\0A  %245 = xor i32 %244, %243\0A  %246 = xor i32 %230, %239\0A  %247 = xor i32 %246, %241\0A  %248 = add i32 %217, -626627285\0A  %249 = add i32 %219, 842468239\0A  %250 = mul i32 %245, -766435501\0A  %251 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %245) #6\0A  %252 = mul i32 %247, -845247145\0A  %253 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %247) #6\0A  %254 = xor i32 %242, %248\0A  %255 = xor i32 %254, %253\0A  %256 = xor i32 %240, %249\0A  %257 = xor i32 %256, %251\0A  %258 = add i32 %217, 2027808484\0A  %259 = add i32 %219, -308364780\0A  %260 = mul i32 %255, -766435501\0A  %261 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %255) #6\0A  %262 = mul i32 %257, -845247145\0A  %263 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %257) #6\0A  %264 = xor i32 %252, %258\0A  %265 = xor i32 %264, %263\0A  %266 = xor i32 %250, %259\0A  %267 = xor i32 %266, %261\0A  %268 = add i32 %217, 387276957\0A  %269 = add i32 %219, -1459197799\0A  %270 = mul i32 %265, -766435501\0A  %271 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %265) #6\0A  %272 = mul i32 %267, -845247145\0A  %273 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %267) #6\0A  %274 = xor i32 %262, %268\0A  %275 = xor i32 %274, %273\0A  %276 = xor i32 %260, %269\0A  %277 = xor i32 %276, %271\0A  %278 = add i32 %217, -1253254570\0A  %279 = add i32 %219, 1684936478\0A  %280 = mul i32 %275, -766435501\0A  %281 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %275) #6\0A  %282 = mul i32 %277, -845247145\0A  %283 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %277) #6\0A  %284 = xor i32 %272, %278\0A  %285 = xor i32 %284, %283\0A  %286 = xor i32 %270, %279\0A  %287 = xor i32 %286, %281\0A  %288 = add i32 %217, 1401181199\0A  %289 = add i32 %219, 534103459\0A  %290 = mul i32 %285, -766435501\0A  %291 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %285) #6\0A  %292 = mul i32 %287, -845247145\0A  %293 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %287) #6\0A  %294 = xor i32 %282, %288\0A  %295 = xor i32 %294, %293\0A  %296 = xor i32 %280, %289\0A  %297 = xor i32 %296, %291\0A  %298 = add i32 %217, -239350328\0A  %299 = add i32 %219, -616729560\0A  %300 = mul i32 %295, -766435501\0A  %301 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %295) #6\0A  %302 = mul i32 %297, -845247145\0A  %303 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %297) #6\0A  %304 = xor i32 %292, %298\0A  %305 = xor i32 %304, %303\0A  %306 = xor i32 %290, %299\0A  %307 = xor i32 %306, %301\0A  %308 = add i32 %217, -1879881855\0A  %309 = add i32 %219, -1767562579\0A  %310 = mul i32 %305, -766435501\0A  %311 = call i32 @_Z8__umulhiii(i32 -766435501, i32 %305) #6\0A  %312 = mul i32 %307, -845247145\0A  %313 = call i32 @_Z8__umulhiii(i32 -845247145, i32 %307) #6\0A  %314 = xor i32 %302, %308\0A  %315 = xor i32 %314, %313\0A  %316 = xor i32 %300, %309\0A  %317 = xor i32 %316, %311\0A  %318 = load i32, i32* %27, align 4, !tbaa !13\0A  %319 = add i32 %318, 1\0A  store i32 %319, i32* %27, align 4, !tbaa !13\0A  %320 = icmp eq i32 %319, 0\0A  br i1 %320, label %321, label %332\0A\0A; <label>:321:                                    ; preds = %211\0A  %322 = load i32, i32* %28, align 4, !tbaa !13\0A  %323 = add i32 %322, 1\0A  store i32 %323, i32* %28, align 4, !tbaa !13\0A  %324 = icmp eq i32 %323, 0\0A  br i1 %324, label %325, label %332\0A\0A; <label>:325:                                    ; preds = %321\0A  %326 = load i32, i32* %29, align 4, !tbaa !13\0A  %327 = add i32 %326, 1\0A  store i32 %327, i32* %29, align 4, !tbaa !13\0A  %328 = icmp eq i32 %327, 0\0A  br i1 %328, label %329, label %332\0A\0A; <label>:329:                                    ; preds = %325\0A  %330 = load i32, i32* %30, align 4, !tbaa !13\0A  %331 = add i32 %330, 1\0A  store i32 %331, i32* %30, align 4, !tbaa !13\0A  br label %332\0A\0A; <label>:332:                                    ; preds = %329, %325, %321, %211, %202, %198, %194, %84\0A  %333 = phi i32 [ %315, %329 ], [ %315, %325 ], [ %315, %321 ], [ %315, %211 ], [ %188, %84 ], [ %188, %194 ], [ %188, %198 ], [ %188, %202 ]\0A  %334 = phi i32 [ %312, %329 ], [ %312, %325 ], [ %312, %321 ], [ %312, %211 ], [ %185, %84 ], [ %185, %194 ], [ %185, %198 ], [ %185, %202 ]\0A  %335 = phi i32 [ %317, %329 ], [ %317, %325 ], [ %317, %321 ], [ %317, %211 ], [ %190, %84 ], [ %190, %194 ], [ %190, %198 ], [ %190, %202 ]\0A  %336 = phi i32 [ %310, %329 ], [ %310, %325 ], [ %310, %321 ], [ %310, %211 ], [ %183, %84 ], [ %183, %194 ], [ %183, %198 ], [ %183, %202 ]\0A  %337 = phi i32 [ 0, %329 ], [ 0, %325 ], [ 0, %321 ], [ 0, %211 ], [ 1, %84 ], [ 1, %194 ], [ 1, %198 ], [ 1, %202 ]\0A  %338 = phi i32 [ %209, %329 ], [ %209, %325 ], [ %209, %321 ], [ %209, %211 ], [ %188, %84 ], [ %188, %194 ], [ %188, %198 ], [ %188, %202 ]\0A  store i32 %333, i32* %33, align 8\0A  store i32 %334, i32* %34, align 4\0A  store i32 %335, i32* %35, align 8\0A  store i32 %336, i32* %36, align 4\0A  store i32 %337, i32* %37, align 8, !tbaa !25\0A  br label %339\0A\0A; <label>:339:                                    ; preds = %332, %205\0A  %340 = phi i32 [ %209, %205 ], [ %338, %332 ]\0A  %341 = phi i32 [ %206, %205 ], [ %337, %332 ]\0A  %342 = add nsw i32 %341, 1\0A  store i32 %342, i32* %37, align 8, !tbaa !25\0A  %343 = sext i32 %341 to i64\0A  %344 = getelementptr inbounds %\22class.tensorflow::random::SingleSampleAdapter\22, %\22class.tensorflow::random::SingleSampleAdapter\22* %11, i64 0, i32 1, i32 0, i64 %343\0A  %345 = load i32, i32* %344, align 4, !tbaa !13\0A  %346 = and i32 %340, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %43) #5\0A  %347 = or i32 %346, 1065353216\0A  store i32 %347, i32* %7, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %44) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %44, i8* nonnull %43, i64 4) #6\0A  %348 = load float, float* %8, align 4, !tbaa !17\0A  %349 = fadd float %348, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %44) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %43) #5\0A  %350 = fcmp olt float %349, 0x3E7AD7F2A0000000\0A  %351 = select i1 %350, float 0x3E7AD7F2A0000000, float %349\0A  %352 = and i32 %345, 8388607\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %45) #5\0A  %353 = or i32 %352, 1065353216\0A  store i32 %353, i32* %5, align 4, !tbaa !13\0A  call void @llvm.lifetime.start(i64 4, i8* nonnull %46) #5\0A  call void @_Z6memcpyPvPKvm(i8* nonnull %46, i8* nonnull %45, i64 4) #6\0A  %354 = load float, float* %6, align 4, !tbaa !17\0A  %355 = fadd float %354, -1.000000e+00\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %46) #5\0A  call void @llvm.lifetime.end(i64 4, i8* nonnull %45) #5\0A  %356 = fpext float %355 to double\0A  %357 = fmul double %356, 0x401921FB54442D18\0A  %358 = fptrunc double %357 to float\0A  %359 = call float @_Z3logf(float %351) #6\0A  %360 = fmul float %359, -2.000000e+00\0A  %361 = call float @_Z4sqrtf(float %360) #6\0A  %362 = call float @_Z4sinff(float %358) #6\0A  %363 = call float @_Z4cosff(float %358) #6\0A  %364 = fmul float %361, %362\0A  %365 = fmul float %361, %363\0A  %366 = call float @_Z4fabsf(float %364) #6\0A  %367 = fcmp olt float %366, %24\0A  br i1 %367, label %368, label %373\0A\0A; <label>:368:                                    ; preds = %339\0A  %369 = add nsw i32 %82, 1\0A  %370 = sext i32 %82 to i64\0A  %371 = getelementptr inbounds %\22class.tensorflow::random::Array.1\22, %\22class.tensorflow::random::Array.1\22* %9, i64 0, i32 0, i64 %370\0A  store float %364, float* %371, align 4, !tbaa !17\0A  %372 = icmp sgt i32 %82, 2\0A  br i1 %372, label %382, label %373\0A\0A; <label>:373:                                    ; preds = %368, %339\0A  %374 = phi i32 [ %369, %368 ], [ %82, %339 ]\0A  %375 = call float @_Z4fabsf(float %365) #6\0A  %376 = fcmp olt float %375, %24\0A  br i1 %376, label %377, label %.backedge.backedge\0A\0A; <label>:377:                                    ; preds = %373\0A  %378 = add nsw i32 %374, 1\0A  %379 = sext i32 %374 to i64\0A  %380 = getelementptr inbounds %\22class.tensorflow::random::Array.1\22, %\22class.tensorflow::random::Array.1\22* %9, i64 0, i32 0, i64 %379\0A  store float %365, float* %380, align 4, !tbaa !17\0A  %381 = icmp sgt i32 %374, 2\0A  br i1 %381, label %382, label %.backedge.backedge\0A\0A.backedge.backedge:                               ; preds = %377, %373\0A  %.be = phi i32 [ %378, %377 ], [ %374, %373 ]\0A  br label %.backedge\0A\0A; <label>:382:                                    ; preds = %377, %368\0A  %383 = load i32, i32* %47, align 4\0A  %384 = load i32, i32* %48, align 4\0A  %385 = load i32, i32* %49, align 4\0A  %386 = load i32, i32* %50, align 4\0A  call void @llvm.lifetime.end(i64 16, i8* nonnull %38) #5\0A  %387 = getelementptr inbounds float, float* %1, i64 %59\0A  %388 = bitcast float* %387 to i32*\0A  store i32 %383, i32* %388, align 4, !tbaa !17\0A  %389 = or i64 %59, 1\0A  %390 = icmp slt i64 %389, %2\0A  br i1 %390, label %392, label %391\0A\0A; <label>:391:                                    ; preds = %397, %392, %382\0A  call void @llvm.lifetime.end(i64 32, i8* nonnull %31) #5\0A  call void @llvm.lifetime.end(i64 24, i8* nonnull %25) #5\0A  br label %.loopexit\0A\0A; <label>:392:                                    ; preds = %382\0A  %393 = getelementptr inbounds float, float* %1, i64 %389\0A  %394 = bitcast float* %393 to i32*\0A  store i32 %384, i32* %394, align 4, !tbaa !17\0A  %395 = or i64 %59, 2\0A  %396 = icmp slt i64 %395, %2\0A  br i1 %396, label %397, label %391\0A\0A; <label>:397:                                    ; preds = %392\0A  %398 = getelementptr inbounds float, float* %1, i64 %395\0A  %399 = bitcast float* %398 to i32*\0A  store i32 %385, i32* %399, align 4, !tbaa !17\0A  %400 = or i64 %59, 3\0A  %401 = icmp slt i64 %400, %2\0A  br i1 %401, label %402, label %391\0A\0A; <label>:402:                                    ; preds = %397\0A  %403 = getelementptr inbounds float, float* %1, i64 %400\0A  %404 = bitcast float* %403 to i32*\0A  store i32 %386, i32* %404, align 4, !tbaa !17\0A  %405 = add i64 %55, %59\0A  %406 = add nsw i64 %60, %54\0A  call void @llvm.lifetime.end(i64 32, i8* nonnull %31) #5\0A  call void @llvm.lifetime.end(i64 24, i8* nonnull %25) #5\0A  %407 = icmp slt i64 %405, %2\0A  br i1 %407, label %58, label %.loopexit.loopexit\0A\0A.loopexit.loopexit:                               ; preds = %402\0A  br label %.loopexit\0A\0A.loopexit:                                        ; preds = %.loopexit.loopexit, %391, %4\0A  ret void\0A}\0A\0A; Function Attrs: convergent nounwind\0Adeclare hidden float @_Z4fabsf(float) local_unnamed_addr #4\0A\0Aattributes #0 = { norecurse nounwind readnone \22correctly-rounded-divide-sqrt-fp-math\22=\22false\22 \22disable-tail-calls\22=\22false\22 \22less-precise-fpmad\22=\22false\22 \22no-frame-pointer-elim\22=\22true\22 \22no-frame-pointer-elim-non-leaf\22 \22no-infs-fp-math\22=\22false\22 \22no-jump-tables\22=\22false\22 \22no-nans-fp-math\22=\22false\22 \22no-signed-zeros-fp-math\22=\22false\22 \22no-trapping-math\22=\22false\22 \22stack-protector-buffer-size\22=\228\22 \22target-cpu\22=\22sm_30\22 \22target-features\22=\22-satom\22 \22unsafe-fp-math\22=\22false\22 \22use-soft-float\22=\22false\22 }\0Aattributes #1 = { convergent nounwind \22correctly-rounded-divide-sqrt-fp-math\22=\22false\22 \22disable-tail-calls\22=\22false\22 \22less-precise-fpmad\22=\22false\22 \22no-frame-pointer-elim\22=\22true\22 \22no-frame-pointer-elim-non-leaf\22 \22no-infs-fp-math\22=\22false\22 \22no-jump-tables\22=\22false\22 \22no-nans-fp-math\22=\22false\22 \22no-signed-zeros-fp-math\22=\22false\22 \22no-trapping-math\22=\22false\22 \22stack-protector-buffer-size\22=\228\22 \22target-cpu\22=\22sm_30\22 \22target-features\22=\22-satom\22 \22unsafe-fp-math\22=\22false\22 \22use-soft-float\22=\22false\22 }\0Aattributes #2 = { argmemonly nounwind }\0Aattributes #3 = { nounwind readnone }\0Aattributes #4 = { convergent nounwind \22correctly-rounded-divide-sqrt-fp-math\22=\22false\22 \22disable-tail-calls\22=\22false\22 \22less-precise-fpmad\22=\22false\22 \22no-frame-pointer-elim\22=\22true\22 \22no-frame-pointer-elim-non-leaf\22 \22no-infs-fp-math\22=\22false\22 \22no-nans-fp-math\22=\22false\22 \22no-signed-zeros-fp-math\22=\22false\22 \22no-trapping-math\22=\22false\22 \22stack-protector-buffer-size\22=\228\22 \22target-cpu\22=\22sm_30\22 \22target-features\22=\22-satom\22 \22unsafe-fp-math\22=\22false\22 \22use-soft-float\22=\22false\22 }\0Aattributes #5 = { nounwind }\0Aattributes #6 = { convergent nounwind }\0A\0A!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}\0A!llvm.module.flags = !{!6, !7}\0A!llvm.ident = !{!8}\0A\0A!0 = !{void (%\22class.tensorflow::random::PhiloxRandom\22*, float*, i64, %\22class.tensorflow::random::UniformDistribution\22*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !\22kernel\22, i32 1}\0A!1 = !{void (%\22class.tensorflow::random::PhiloxRandom\22*, float*, i64, %\22class.tensorflow::random::UniformDistribution\22*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !\22maxntidx\22, i32 1024}\0A!2 = !{void (%\22class.tensorflow::random::PhiloxRandom\22*, float*, i64, %\22class.tensorflow::random::NormalDistribution\22*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !\22kernel\22, i32 1}\0A!3 = !{void (%\22class.tensorflow::random::PhiloxRandom\22*, float*, i64, %\22class.tensorflow::random::NormalDistribution\22*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_, !\22maxntidx\22, i32 1024}\0A!4 = !{void (%\22class.tensorflow::random::PhiloxRandom\22*, float*, i64, %\22class.tensorflow::random::TruncatedNormalDistribution\22*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_, !\22kernel\22, i32 1}\0A!5 = !{void (%\22class.tensorflow::random::PhiloxRandom\22*, float*, i64, %\22class.tensorflow::random::TruncatedNormalDistribution\22*)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_, !\22maxntidx\22, i32 1024}\0A!6 = !{i32 4, !\22nvvm-reflect-ftz\22, i32 0}\0A!7 = !{i32 1, !\22PIC Level\22, i32 2}\0A!8 = !{!\22clang version 4.0.0 (tags/RELEASE_400/final)\22}\0A!9 = !{i32 0, i32 2147483647}\0A!10 = !{i32 1, i32 1025}\0A!11 = !{i32 0, i32 1024}\0A!12 = !{i32 1, i32 -2147483648}\0A!13 = !{!14, !14, i64 0}\0A!14 = !{!\22int\22, !15, i64 0}\0A!15 = !{!\22omnipotent char\22, !16, i64 0}\0A!16 = !{!\22Simple C++ TBAA\22}\0A!17 = !{!18, !18, i64 0}\0A!18 = !{!\22float\22, !15, i64 0}\0A!19 = !{i64 0, i64 16, !20, i64 16, i64 8, !20}\0A!20 = !{!15, !15, i64 0}\0A!21 = !{!22, !23, i64 0}\0A!22 = !{!\22_ZTSN10tensorflow6random19SingleSampleAdapterINS0_12PhiloxRandomEEE\22, !23, i64 0, !24, i64 8, !14, i64 24}\0A!23 = !{!\22any pointer\22, !15, i64 0}\0A!24 = !{!\22_ZTSN10tensorflow6random5ArrayIjLi4EEE\22, !15, i64 0}\0A!25 = !{!22, !14, i64 24}\0A\00"
@"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_" = global [143 x i8] c"_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_\00"
@"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_" = global [142 x i8] c"_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_\00"
@"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_" = global [179 x i8] c"_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_\00"

; Function Attrs: ssp uwtable
define weak_odr void @_ZN10tensorflow7functor16FillPhiloxRandomIN5Eigen9GpuDeviceENS_6random19UniformDistributionINS4_12PhiloxRandomEfEEEclEPNS_15OpKernelContextERKS3_S6_PfxS7_(%"struct.tensorflow::functor::FillPhiloxRandom"*, %"class.tensorflow::OpKernelContext"*, %"struct.Eigen::GpuDevice"* dereferenceable(16), %"class.tensorflow::random::PhiloxRandom"* byval align 8, float*, i64) local_unnamed_addr #0 align 2 {
  %7 = alloca i8, align 1
  %8 = alloca float*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %"class.tensorflow::random::PhiloxRandom", align 8
  %11 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %2, i64 0, i32 0
  %12 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %13 = bitcast %"class.Eigen::StreamInterface"* %12 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %14 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %13, align 8, !tbaa !8
  %15 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %14, i64 3
  %16 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %15, align 8
  %17 = tail call dereferenceable(352) %struct.cudaDeviceProp* %16(%"class.Eigen::StreamInterface"* %12)
  %18 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %17, i64 0, i32 5
  %19 = load i32, i32* %18, align 8, !tbaa !10
  %20 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %21 = bitcast %"class.Eigen::StreamInterface"* %20 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %22 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %21, align 8, !tbaa !8
  %23 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %22, i64 3
  %24 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %23, align 8
  %25 = tail call dereferenceable(352) %struct.cudaDeviceProp* %24(%"class.Eigen::StreamInterface"* %20)
  %26 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %25, i64 0, i32 10
  %27 = load i32, i32* %26, align 4, !tbaa !13
  %28 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %29 = bitcast %"class.Eigen::StreamInterface"* %28 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %30 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %29, align 8, !tbaa !8
  %31 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %30, i64 3
  %32 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %31, align 8
  %33 = tail call dereferenceable(352) %struct.cudaDeviceProp* %32(%"class.Eigen::StreamInterface"* %28)
  %34 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %33, i64 0, i32 8
  %35 = load i32, i32* %34, align 4, !tbaa !14
  %36 = mul nsw i32 %35, %27
  %37 = sdiv i32 %36, %19
  %38 = zext i32 %37 to i64
  %39 = or i64 %38, 4294967296
  %40 = zext i32 %19 to i64
  %41 = or i64 %40, 4294967296
  %42 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %43 = bitcast %"class.Eigen::StreamInterface"* %42 to i8** (%"class.Eigen::StreamInterface"*)***
  %44 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %43, align 8, !tbaa !8
  %45 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %44, i64 2
  %46 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %45, align 8
  %47 = tail call dereferenceable(8) i8** %46(%"class.Eigen::StreamInterface"* %42)
  %48 = load i8*, i8** %47, align 8, !tbaa !15
  %49 = tail call i32 @cudaConfigureCall(i64 %39, i32 1, i64 %41, i32 1, i64 0, i8* %48)
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %69

; <label>:51:                                     ; preds = %6
  %52 = bitcast %"class.tensorflow::random::PhiloxRandom"* %3 to i8*
  %53 = bitcast %"class.tensorflow::random::PhiloxRandom"* %10 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %53)
  call void @llvm.lifetime.start(i64 1, i8* nonnull %7)
  %54 = bitcast float** %8 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %54)
  %55 = bitcast i64* %9 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %55)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %53, i8* nonnull %52, i64 24, i32 8, i1 false)
  store float* %4, float** %8, align 8, !tbaa !15
  store i64 %5, i64* %9, align 8, !tbaa !16
  %loadCudaArg = load %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %10
  %56 = icmp eq i32 0, 0
  br i1 %56, label %57, label %68

; <label>:57:                                     ; preds = %51
  %loadCudaArg1 = load float*, float** %8
  %58 = icmp eq i32 0, 0
  br i1 %58, label %59, label %68

; <label>:59:                                     ; preds = %57
  %loadCudaArg2 = load i64, i64* %9
  %60 = icmp eq i32 0, 0
  br i1 %60, label %61, label %68

; <label>:61:                                     ; preds = %59
  %loadCudaArg3 = load i8, i8* %7
  %62 = icmp eq i32 0, 0
  br i1 %62, label %63, label %68

; <label>:63:                                     ; preds = %61
  %64 = getelementptr inbounds [143 x i8], [143 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_", i32 0, i32 0
  %65 = getelementptr inbounds [54152 x i8], [54152 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %64, i8* %65)
  %66 = bitcast %"class.tensorflow::random::PhiloxRandom"* %10 to i8*
  call void @setKernelArgHostsideBuffer(i8* %66, i32 24)
  %67 = bitcast float* %loadCudaArg1 to i8*
  call void @setKernelArgGpuBuffer(i8* %67, i32 4)
  call void @setKernelArgInt64(i64 %loadCudaArg2)
  call void @setKernelArgInt8(i8 %loadCudaArg3)
  call void @kernelGo()
  br label %68

; <label>:68:                                     ; preds = %63, %61, %59, %57, %51
  call void @llvm.lifetime.end(i64 24, i8* nonnull %53)
  call void @llvm.lifetime.end(i64 1, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %54)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %55)
  br label %69

; <label>:69:                                     ; preds = %68, %6
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, i8*) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_(%"class.tensorflow::random::PhiloxRandom"* byval align 8, float*, i64) #0 {
  %4 = alloca i8, align 1
  %5 = alloca float*, align 8
  %6 = alloca i64, align 8
  store float* %1, float** %5, align 8, !tbaa !15
  store i64 %2, i64* %6, align 8, !tbaa !16
  %7 = bitcast %"class.tensorflow::random::PhiloxRandom"* %0 to i8*
  %loadCudaArg = load %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0
  %8 = icmp eq i32 0, 0
  br i1 %8, label %9, label %22

; <label>:9:                                      ; preds = %3
  %10 = bitcast float** %5 to i8*
  %loadCudaArg1 = load float*, float** %5
  %11 = icmp eq i32 0, 0
  br i1 %11, label %12, label %22

; <label>:12:                                     ; preds = %9
  %13 = bitcast i64* %6 to i8*
  %loadCudaArg2 = load i64, i64* %6
  %14 = icmp eq i32 0, 0
  br i1 %14, label %15, label %22

; <label>:15:                                     ; preds = %12
  %loadCudaArg3 = load i8, i8* %4
  %16 = icmp eq i32 0, 0
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds [143 x i8], [143 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_", i32 0, i32 0
  %19 = getelementptr inbounds [54152 x i8], [54152 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %18, i8* %19)
  %20 = bitcast %"class.tensorflow::random::PhiloxRandom"* %0 to i8*
  call void @setKernelArgHostsideBuffer(i8* %20, i32 24)
  %21 = bitcast float* %loadCudaArg1 to i8*
  call void @setKernelArgGpuBuffer(i8* %21, i32 4)
  call void @setKernelArgInt64(i64 %loadCudaArg2)
  call void @setKernelArgInt8(i8 %loadCudaArg3)
  call void @kernelGo()
  br label %22

; <label>:22:                                     ; preds = %17, %15, %12, %9, %3
  ret void
}

; Function Attrs: ssp uwtable
define weak_odr void @_ZN10tensorflow7functor16FillPhiloxRandomIN5Eigen9GpuDeviceENS_6random18NormalDistributionINS4_12PhiloxRandomEfEEEclEPNS_15OpKernelContextERKS3_S6_PfxS7_(%"struct.tensorflow::functor::FillPhiloxRandom.2"*, %"class.tensorflow::OpKernelContext"*, %"struct.Eigen::GpuDevice"* dereferenceable(16), %"class.tensorflow::random::PhiloxRandom"* byval align 8, float*, i64) local_unnamed_addr #0 align 2 {
  %7 = alloca i8, align 1
  %8 = alloca float*, align 8
  %9 = alloca i64, align 8
  %10 = alloca %"class.tensorflow::random::PhiloxRandom", align 8
  %11 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %2, i64 0, i32 0
  %12 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %13 = bitcast %"class.Eigen::StreamInterface"* %12 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %14 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %13, align 8, !tbaa !8
  %15 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %14, i64 3
  %16 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %15, align 8
  %17 = tail call dereferenceable(352) %struct.cudaDeviceProp* %16(%"class.Eigen::StreamInterface"* %12)
  %18 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %17, i64 0, i32 5
  %19 = load i32, i32* %18, align 8, !tbaa !10
  %20 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %21 = bitcast %"class.Eigen::StreamInterface"* %20 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %22 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %21, align 8, !tbaa !8
  %23 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %22, i64 3
  %24 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %23, align 8
  %25 = tail call dereferenceable(352) %struct.cudaDeviceProp* %24(%"class.Eigen::StreamInterface"* %20)
  %26 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %25, i64 0, i32 10
  %27 = load i32, i32* %26, align 4, !tbaa !13
  %28 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %29 = bitcast %"class.Eigen::StreamInterface"* %28 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %30 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %29, align 8, !tbaa !8
  %31 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %30, i64 3
  %32 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %31, align 8
  %33 = tail call dereferenceable(352) %struct.cudaDeviceProp* %32(%"class.Eigen::StreamInterface"* %28)
  %34 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %33, i64 0, i32 8
  %35 = load i32, i32* %34, align 4, !tbaa !14
  %36 = mul nsw i32 %35, %27
  %37 = sdiv i32 %36, %19
  %38 = zext i32 %37 to i64
  %39 = or i64 %38, 4294967296
  %40 = zext i32 %19 to i64
  %41 = or i64 %40, 4294967296
  %42 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %11, align 8, !tbaa !2
  %43 = bitcast %"class.Eigen::StreamInterface"* %42 to i8** (%"class.Eigen::StreamInterface"*)***
  %44 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %43, align 8, !tbaa !8
  %45 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %44, i64 2
  %46 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %45, align 8
  %47 = tail call dereferenceable(8) i8** %46(%"class.Eigen::StreamInterface"* %42)
  %48 = load i8*, i8** %47, align 8, !tbaa !15
  %49 = tail call i32 @cudaConfigureCall(i64 %39, i32 1, i64 %41, i32 1, i64 0, i8* %48)
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %69

; <label>:51:                                     ; preds = %6
  %52 = bitcast %"class.tensorflow::random::PhiloxRandom"* %3 to i8*
  %53 = bitcast %"class.tensorflow::random::PhiloxRandom"* %10 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %53)
  call void @llvm.lifetime.start(i64 1, i8* nonnull %7)
  %54 = bitcast float** %8 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %54)
  %55 = bitcast i64* %9 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %55)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %53, i8* nonnull %52, i64 24, i32 8, i1 false)
  store float* %4, float** %8, align 8, !tbaa !15
  store i64 %5, i64* %9, align 8, !tbaa !16
  %loadCudaArg = load %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %10
  %56 = icmp eq i32 0, 0
  br i1 %56, label %57, label %68

; <label>:57:                                     ; preds = %51
  %loadCudaArg1 = load float*, float** %8
  %58 = icmp eq i32 0, 0
  br i1 %58, label %59, label %68

; <label>:59:                                     ; preds = %57
  %loadCudaArg2 = load i64, i64* %9
  %60 = icmp eq i32 0, 0
  br i1 %60, label %61, label %68

; <label>:61:                                     ; preds = %59
  %loadCudaArg3 = load i8, i8* %7
  %62 = icmp eq i32 0, 0
  br i1 %62, label %63, label %68

; <label>:63:                                     ; preds = %61
  %64 = getelementptr inbounds [142 x i8], [142 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_", i32 0, i32 0
  %65 = getelementptr inbounds [54152 x i8], [54152 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %64, i8* %65)
  %66 = bitcast %"class.tensorflow::random::PhiloxRandom"* %10 to i8*
  call void @setKernelArgHostsideBuffer(i8* %66, i32 24)
  %67 = bitcast float* %loadCudaArg1 to i8*
  call void @setKernelArgGpuBuffer(i8* %67, i32 4)
  call void @setKernelArgInt64(i64 %loadCudaArg2)
  call void @setKernelArgInt8(i8 %loadCudaArg3)
  call void @kernelGo()
  br label %68

; <label>:68:                                     ; preds = %63, %61, %59, %57, %51
  call void @llvm.lifetime.end(i64 24, i8* nonnull %53)
  call void @llvm.lifetime.end(i64 1, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %54)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %55)
  br label %69

; <label>:69:                                     ; preds = %68, %6
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_(%"class.tensorflow::random::PhiloxRandom"* byval align 8, float*, i64) #0 {
  %4 = alloca i8, align 1
  %5 = alloca float*, align 8
  %6 = alloca i64, align 8
  store float* %1, float** %5, align 8, !tbaa !15
  store i64 %2, i64* %6, align 8, !tbaa !16
  %7 = bitcast %"class.tensorflow::random::PhiloxRandom"* %0 to i8*
  %loadCudaArg = load %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0
  %8 = icmp eq i32 0, 0
  br i1 %8, label %9, label %22

; <label>:9:                                      ; preds = %3
  %10 = bitcast float** %5 to i8*
  %loadCudaArg1 = load float*, float** %5
  %11 = icmp eq i32 0, 0
  br i1 %11, label %12, label %22

; <label>:12:                                     ; preds = %9
  %13 = bitcast i64* %6 to i8*
  %loadCudaArg2 = load i64, i64* %6
  %14 = icmp eq i32 0, 0
  br i1 %14, label %15, label %22

; <label>:15:                                     ; preds = %12
  %loadCudaArg3 = load i8, i8* %4
  %16 = icmp eq i32 0, 0
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds [142 x i8], [142 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_", i32 0, i32 0
  %19 = getelementptr inbounds [54152 x i8], [54152 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %18, i8* %19)
  %20 = bitcast %"class.tensorflow::random::PhiloxRandom"* %0 to i8*
  call void @setKernelArgHostsideBuffer(i8* %20, i32 24)
  %21 = bitcast float* %loadCudaArg1 to i8*
  call void @setKernelArgGpuBuffer(i8* %21, i32 4)
  call void @setKernelArgInt64(i64 %loadCudaArg2)
  call void @setKernelArgInt8(i8 %loadCudaArg3)
  call void @kernelGo()
  br label %22

; <label>:22:                                     ; preds = %17, %15, %12, %9, %3
  ret void
}

; Function Attrs: ssp uwtable
define weak_odr void @_ZN10tensorflow7functor16FillPhiloxRandomIN5Eigen9GpuDeviceENS_6random27TruncatedNormalDistributionINS4_19SingleSampleAdapterINS4_12PhiloxRandomEEEfEEEclEPNS_15OpKernelContextERKS3_S7_PfxS9_(%"struct.tensorflow::functor::FillPhiloxRandom.3"*, %"class.tensorflow::OpKernelContext"*, %"struct.Eigen::GpuDevice"* dereferenceable(16), %"class.tensorflow::random::PhiloxRandom"* byval align 8, float*, i64, float) local_unnamed_addr #0 align 2 {
  %8 = alloca %"class.tensorflow::random::TruncatedNormalDistribution", align 4
  %9 = alloca float*, align 8
  %10 = alloca i64, align 8
  %11 = alloca %"class.tensorflow::random::PhiloxRandom", align 8
  %12 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %2, i64 0, i32 0
  %13 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %12, align 8, !tbaa !2
  %14 = bitcast %"class.Eigen::StreamInterface"* %13 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %15 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %14, align 8, !tbaa !8
  %16 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %15, i64 3
  %17 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %16, align 8
  %18 = tail call dereferenceable(352) %struct.cudaDeviceProp* %17(%"class.Eigen::StreamInterface"* %13)
  %19 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %18, i64 0, i32 5
  %20 = load i32, i32* %19, align 8, !tbaa !10
  %21 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %12, align 8, !tbaa !2
  %22 = bitcast %"class.Eigen::StreamInterface"* %21 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %23 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %22, align 8, !tbaa !8
  %24 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %23, i64 3
  %25 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %24, align 8
  %26 = tail call dereferenceable(352) %struct.cudaDeviceProp* %25(%"class.Eigen::StreamInterface"* %21)
  %27 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %26, i64 0, i32 10
  %28 = load i32, i32* %27, align 4, !tbaa !13
  %29 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %12, align 8, !tbaa !2
  %30 = bitcast %"class.Eigen::StreamInterface"* %29 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %31 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %30, align 8, !tbaa !8
  %32 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %31, i64 3
  %33 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %32, align 8
  %34 = tail call dereferenceable(352) %struct.cudaDeviceProp* %33(%"class.Eigen::StreamInterface"* %29)
  %35 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %34, i64 0, i32 8
  %36 = load i32, i32* %35, align 4, !tbaa !14
  %37 = mul nsw i32 %36, %28
  %38 = sdiv i32 %37, %20
  %39 = zext i32 %38 to i64
  %40 = or i64 %39, 4294967296
  %41 = zext i32 %20 to i64
  %42 = or i64 %41, 4294967296
  %43 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %12, align 8, !tbaa !2
  %44 = bitcast %"class.Eigen::StreamInterface"* %43 to i8** (%"class.Eigen::StreamInterface"*)***
  %45 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %44, align 8, !tbaa !8
  %46 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %45, i64 2
  %47 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %46, align 8
  %48 = tail call dereferenceable(8) i8** %47(%"class.Eigen::StreamInterface"* %43)
  %49 = load i8*, i8** %48, align 8, !tbaa !15
  %50 = tail call i32 @cudaConfigureCall(i64 %40, i32 1, i64 %42, i32 1, i64 0, i8* %49)
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %73

; <label>:52:                                     ; preds = %7
  %53 = bitcast %"class.tensorflow::random::PhiloxRandom"* %3 to i8*
  %54 = bitcast %"class.tensorflow::random::PhiloxRandom"* %11 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %54)
  %55 = bitcast %"class.tensorflow::random::TruncatedNormalDistribution"* %8 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %55)
  %56 = bitcast float** %9 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %56)
  %57 = bitcast i64* %10 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %57)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %54, i8* nonnull %53, i64 24, i32 8, i1 false)
  %58 = getelementptr inbounds %"class.tensorflow::random::TruncatedNormalDistribution", %"class.tensorflow::random::TruncatedNormalDistribution"* %8, i64 0, i32 0
  store float %6, float* %58, align 4
  store float* %4, float** %9, align 8, !tbaa !15
  store i64 %5, i64* %10, align 8, !tbaa !16
  %loadCudaArg = load %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %11
  %59 = icmp eq i32 0, 0
  br i1 %59, label %60, label %72

; <label>:60:                                     ; preds = %52
  %loadCudaArg1 = load float*, float** %9
  %61 = icmp eq i32 0, 0
  br i1 %61, label %62, label %72

; <label>:62:                                     ; preds = %60
  %loadCudaArg2 = load i64, i64* %10
  %63 = icmp eq i32 0, 0
  br i1 %63, label %64, label %72

; <label>:64:                                     ; preds = %62
  %loadCudaArg3 = load %"class.tensorflow::random::TruncatedNormalDistribution", %"class.tensorflow::random::TruncatedNormalDistribution"* %8
  %65 = icmp eq i32 0, 0
  br i1 %65, label %66, label %72

; <label>:66:                                     ; preds = %64
  %67 = getelementptr inbounds [179 x i8], [179 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_", i32 0, i32 0
  %68 = getelementptr inbounds [54152 x i8], [54152 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %67, i8* %68)
  %69 = bitcast %"class.tensorflow::random::PhiloxRandom"* %11 to i8*
  call void @setKernelArgHostsideBuffer(i8* %69, i32 24)
  %70 = bitcast float* %loadCudaArg1 to i8*
  call void @setKernelArgGpuBuffer(i8* %70, i32 4)
  call void @setKernelArgInt64(i64 %loadCudaArg2)
  %71 = bitcast %"class.tensorflow::random::TruncatedNormalDistribution"* %8 to i8*
  call void @setKernelArgHostsideBuffer(i8* %71, i32 4)
  call void @kernelGo()
  br label %72

; <label>:72:                                     ; preds = %66, %64, %62, %60, %52
  call void @llvm.lifetime.end(i64 24, i8* nonnull %54)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %55)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %56)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %57)
  br label %73

; <label>:73:                                     ; preds = %72, %7
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_(%"class.tensorflow::random::PhiloxRandom"* byval align 8, float*, i64, float) #0 {
  %5 = alloca %"class.tensorflow::random::TruncatedNormalDistribution", align 4
  %6 = alloca float*, align 8
  %7 = alloca i64, align 8
  %8 = getelementptr inbounds %"class.tensorflow::random::TruncatedNormalDistribution", %"class.tensorflow::random::TruncatedNormalDistribution"* %5, i64 0, i32 0
  store float %3, float* %8, align 4
  store float* %1, float** %6, align 8, !tbaa !15
  store i64 %2, i64* %7, align 8, !tbaa !16
  %9 = bitcast %"class.tensorflow::random::PhiloxRandom"* %0 to i8*
  %loadCudaArg = load %"class.tensorflow::random::PhiloxRandom", %"class.tensorflow::random::PhiloxRandom"* %0
  %10 = icmp eq i32 0, 0
  br i1 %10, label %11, label %26

; <label>:11:                                     ; preds = %4
  %12 = bitcast float** %6 to i8*
  %loadCudaArg1 = load float*, float** %6
  %13 = icmp eq i32 0, 0
  br i1 %13, label %14, label %26

; <label>:14:                                     ; preds = %11
  %15 = bitcast i64* %7 to i8*
  %loadCudaArg2 = load i64, i64* %7
  %16 = icmp eq i32 0, 0
  br i1 %16, label %17, label %26

; <label>:17:                                     ; preds = %14
  %18 = bitcast %"class.tensorflow::random::TruncatedNormalDistribution"* %5 to i8*
  %loadCudaArg3 = load %"class.tensorflow::random::TruncatedNormalDistribution", %"class.tensorflow::random::TruncatedNormalDistribution"* %5
  %19 = icmp eq i32 0, 0
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %17
  %21 = getelementptr inbounds [179 x i8], [179 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll__ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_", i32 0, i32 0
  %22 = getelementptr inbounds [54152 x i8], [54152 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/random_op_gpu/tensorflow/core/kernels/random_op_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %21, i8* %22)
  %23 = bitcast %"class.tensorflow::random::PhiloxRandom"* %0 to i8*
  call void @setKernelArgHostsideBuffer(i8* %23, i32 24)
  %24 = bitcast float* %loadCudaArg1 to i8*
  call void @setKernelArgGpuBuffer(i8* %24, i32 4)
  call void @setKernelArgInt64(i64 %loadCudaArg2)
  %25 = bitcast %"class.tensorflow::random::TruncatedNormalDistribution"* %5 to i8*
  call void @setKernelArgHostsideBuffer(i8* %25, i32 4)
  call void @kernelGo()
  br label %26

; <label>:26:                                     ; preds = %20, %17, %14, %11, %4
  ret void
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

declare void @configureKernel(i8*, i8*)

declare void @setKernelArgHostsideBuffer(i8*, i32)

declare void @setKernelArgGpuBuffer(i8*, i32)

declare void @setKernelArgInt64(i64)

declare void @setKernelArgInt8(i8)

declare void @kernelGo()

attributes #0 = { ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!2 = !{!3, !4, i64 0}
!3 = !{!"_ZTSN5Eigen9GpuDeviceE", !4, i64 0, !7, i64 8}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"vtable pointer", !6, i64 0}
!10 = !{!11, !7, i64 32}
!11 = !{!"_ZTS14cudaDeviceProp", !12, i64 0, !12, i64 8, !12, i64 16, !7, i64 24, !7, i64 28, !7, i64 32, !5, i64 36, !5, i64 48, !7, i64 60, !7, i64 64, !7, i64 68, !7, i64 72, !7, i64 76, !7, i64 80, !7, i64 84, !7, i64 88, !5, i64 92}
!12 = !{!"long", !5, i64 0}
!13 = !{!11, !7, i64 68}
!14 = !{!11, !7, i64 60}
!15 = !{!4, !4, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"long long", !5, i64 0}
