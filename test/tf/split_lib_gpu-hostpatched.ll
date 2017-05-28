; ModuleID = 'bazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-hostraw.ll'
source_filename = "tensorflow/core/kernels/split_lib_gpu.cu.cc"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%"struct.tensorflow::functor::Split" = type { i8 }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"class.Eigen::TensorMap" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [3 x i32] }
%"class.Eigen::TensorMap.2" = type <{ float*, %"struct.Eigen::DSizes", [4 x i8] }>
%"class.Eigen::TensorAssignOp" = type { %"class.Eigen::TensorMap"*, %"class.Eigen::TensorSlicingOp"* }
%"class.Eigen::TensorSlicingOp" = type { %"class.Eigen::TensorMap.2"*, %"struct.Eigen::DSizes", %"struct.Eigen::DSizes" }
%"struct.tensorflow::SplitOpGPULaunch" = type { i8 }
%"struct.tensorflow::CudaDeviceArrayStruct" = type { i32, [8 x float*], float** }
%struct.cudaDeviceProp = type { i64, i64, i64, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }
%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.8" }
%"struct.Eigen::TensorEvaluator.7" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap"* }
%"struct.Eigen::TensorEvaluator.8" = type { %"class.Eigen::array", %"class.Eigen::array.9", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.10", %"struct.Eigen::GpuDevice"*, %"struct.Eigen::DSizes", %"struct.Eigen::DSizes" }
%"class.Eigen::array.9" = type { [3 x %"struct.Eigen::internal::TensorIntDivisor"] }
%"struct.Eigen::internal::TensorIntDivisor" = type { i32, i32, i32 }
%"struct.Eigen::TensorEvaluator.10" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"*, %"class.Eigen::TensorMap.2"* }
%"struct.Eigen::TensorEvaluator_nopointers" = type { %"struct.Eigen::TensorEvaluator.7_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers" }
%"struct.Eigen::TensorEvaluator.7_nopointers" = type { %"struct.Eigen::DSizes_nopointers" }
%"struct.Eigen::DSizes_nopointers" = type { %"class.Eigen::array_nopointers" }
%"class.Eigen::array_nopointers" = type { [3 x i32] }
%"struct.Eigen::TensorEvaluator.8_nopointers" = type { %"class.Eigen::array_nopointers", %"class.Eigen::array.9_nopointers", %"class.Eigen::array_nopointers", %"struct.Eigen::TensorEvaluator.10_nopointers", %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers" }
%"class.Eigen::array.9_nopointers" = type { [3 x %"struct.Eigen::internal::TensorIntDivisor"] }
%"struct.Eigen::TensorEvaluator.10_nopointers" = type { %"struct.Eigen::DSizes_nopointers" }

@__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESB_KNS3_INS4_IKfLi3ELi1EiEELi16ES6_EEEEEENS_9GpuDeviceELb0EE3runERSJ_RKSK_ = private unnamed_addr constant [4 x i8] c"run\00", align 1
@.str = private unnamed_addr constant [75 x i8] c"external/eigen_archive/unsupported/Eigen/CXX11/src/Tensor/TensorExecutor.h\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"cudaGetLastError() == cudaSuccess\00", align 1
@__func__._ZNK5Eigen9GpuDevice6memcpyEPvPKvm = private unnamed_addr constant [7 x i8] c"memcpy\00", align 1
@.str.4 = private unnamed_addr constant [77 x i8] c"external/eigen_archive/unsupported/Eigen/CXX11/src/Tensor/TensorDeviceCuda.h\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"err == cudaSuccess\00", align 1
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll" = global [14543 x i8] c"; ModuleID = 'bazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device-noopt.ll'\0Asource_filename = \22tensorflow/core/kernels/split_lib_gpu.cu.cc\22\0Atarget datalayout = \22e-i64:64-v16:16-v32:32-n16:32:64\22\0Atarget triple = \22nvptx64-nvidia-cuda\22\0A\0A%\22struct.Eigen::TensorEvaluator\22 = type { %\22struct.Eigen::TensorEvaluator.0\22, %\22struct.Eigen::TensorEvaluator.2\22 }\0A%\22struct.Eigen::TensorEvaluator.0\22 = type { float*, %\22struct.Eigen::DSizes\22, %\22struct.Eigen::GpuDevice\22*, %\22class.Eigen::TensorMap\22* }\0A%\22struct.Eigen::DSizes\22 = type { %\22class.Eigen::array\22 }\0A%\22class.Eigen::array\22 = type { [3 x i32] }\0A%\22struct.Eigen::GpuDevice\22 = type <{ %\22class.Eigen::StreamInterface\22*, i32, [4 x i8] }>\0A%\22class.Eigen::StreamInterface\22 = type { i32 (...)** }\0A%\22class.Eigen::TensorMap\22 = type <{ float*, %\22struct.Eigen::DSizes\22, [4 x i8] }>\0A%\22struct.Eigen::TensorEvaluator.2\22 = type { %\22class.Eigen::array\22, %\22class.Eigen::array.3\22, %\22class.Eigen::array\22, %\22struct.Eigen::TensorEvaluator.4\22, %\22struct.Eigen::GpuDevice\22*, %\22struct.Eigen::DSizes\22, %\22struct.Eigen::DSizes\22 }\0A%\22class.Eigen::array.3\22 = type { [3 x %\22struct.Eigen::internal::TensorIntDivisor\22] }\0A%\22struct.Eigen::internal::TensorIntDivisor\22 = type { i32, i32, i32 }\0A%\22struct.Eigen::TensorEvaluator.4\22 = type { float*, %\22struct.Eigen::DSizes\22, %\22struct.Eigen::GpuDevice\22*, %\22class.Eigen::TensorMap.5\22* }\0A%\22class.Eigen::TensorMap.5\22 = type <{ float*, %\22struct.Eigen::DSizes\22, [4 x i8] }>\0A%\22struct.tensorflow::CudaDeviceArrayStruct\22 = type { i32, [8 x float*], float** }\0A\0A$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any\0A\0A$_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE = comdat any\0A\0A@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section \22llvm.metadata\22\0A\0A; Function Attrs: norecurse nounwind readnone\0Adefine internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {\0A  ret i32 0\0A}\0A\0A; Function Attrs: convergent nounwind\0Adefine void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%\22struct.Eigen::TensorEvaluator\22* byval nocapture readonly align 8, i32) local_unnamed_addr #1 comdat {\0A  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !6\0A  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !7\0A  %5 = mul i32 %4, %3\0A  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !8\0A  %7 = add i32 %5, %6\0A  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !9\0A  %9 = mul i32 %8, %4\0A  %10 = icmp slt i32 %7, %1\0A  br i1 %10, label %11, label %.loopexit\0A\0A; <label>:11:                                     ; preds = %2\0A  %12 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 1, i32 0, i64 0, i32 0\0A  %13 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 1, i32 0, i64 0, i32 1\0A  %14 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 1, i32 0, i64 0, i32 2\0A  %15 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 6, i32 0, i32 0, i64 0\0A  %16 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 2, i32 0, i64 0\0A  %17 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 0, i32 0, i64 0\0A  %18 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 1, i32 0, i64 1, i32 0\0A  %19 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 1, i32 0, i64 1, i32 1\0A  %20 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 1, i32 0, i64 1, i32 2\0A  %21 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 6, i32 0, i32 0, i64 1\0A  %22 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 2, i32 0, i64 1\0A  %23 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 0, i32 0, i64 1\0A  %24 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 6, i32 0, i32 0, i64 2\0A  %25 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 1, i32 3, i32 0\0A  %26 = getelementptr inbounds %\22struct.Eigen::TensorEvaluator\22, %\22struct.Eigen::TensorEvaluator\22* %0, i64 0, i32 0, i32 0\0A  %27 = load float*, float** %26, align 8\0A  %28 = load i32, i32* %12, align 4, !tbaa !10\0A  %29 = load i32, i32* %13, align 4, !tbaa !15\0A  %30 = load i32, i32* %14, align 4, !tbaa !16\0A  %31 = load i32, i32* %15, align 4, !tbaa !17\0A  %32 = load i32, i32* %16, align 8, !tbaa !17\0A  %33 = load i32, i32* %17, align 8, !tbaa !17\0A  %34 = load i32, i32* %18, align 4, !tbaa !10\0A  %35 = load i32, i32* %19, align 4, !tbaa !15\0A  %36 = load i32, i32* %20, align 4, !tbaa !16\0A  %37 = load i32, i32* %21, align 4, !tbaa !17\0A  %38 = load i32, i32* %22, align 4, !tbaa !17\0A  %39 = load i32, i32* %23, align 4, !tbaa !17\0A  %40 = load i32, i32* %24, align 4, !tbaa !17\0A  %41 = load float*, float** %25, align 8, !tbaa !18\0A  br label %42\0A\0A; <label>:42:                                     ; preds = %42, %11\0A  %43 = phi i32 [ %7, %11 ], [ %72, %42 ]\0A  %44 = tail call i32 @_Z8__umulhiii(i32 %28, i32 %43) #6\0A  %45 = sub i32 %43, %44\0A  %46 = lshr i32 %45, %29\0A  %47 = add i32 %46, %44\0A  %48 = lshr i32 %47, %30\0A  %49 = add nsw i32 %48, %31\0A  %50 = mul nsw i32 %49, %32\0A  %51 = mul nsw i32 %48, %33\0A  %52 = sub nsw i32 %43, %51\0A  %53 = tail call i32 @_Z8__umulhiii(i32 %34, i32 %52) #6\0A  %54 = sub i32 %52, %53\0A  %55 = lshr i32 %54, %35\0A  %56 = add i32 %55, %53\0A  %57 = lshr i32 %56, %36\0A  %58 = add nsw i32 %57, %37\0A  %59 = mul nsw i32 %58, %38\0A  %60 = mul nsw i32 %57, %39\0A  %61 = add i32 %50, %40\0A  %62 = add i32 %61, %52\0A  %63 = sub i32 %62, %60\0A  %64 = add i32 %63, %59\0A  %65 = sext i32 %64 to i64\0A  %66 = getelementptr inbounds float, float* %41, i64 %65\0A  %67 = bitcast float* %66 to i32*\0A  %68 = load i32, i32* %67, align 4, !tbaa !22\0A  %69 = sext i32 %43 to i64\0A  %70 = getelementptr inbounds float, float* %27, i64 %69\0A  %71 = bitcast float* %70 to i32*\0A  store i32 %68, i32* %71, align 4, !tbaa !22\0A  %72 = add nsw i32 %43, %9\0A  %73 = icmp slt i32 %72, %1\0A  br i1 %73, label %42, label %.loopexit.loopexit\0A\0A.loopexit.loopexit:                               ; preds = %42\0A  br label %.loopexit\0A\0A.loopexit:                                        ; preds = %.loopexit.loopexit, %2\0A  ret void\0A}\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2\0A\0A; Function Attrs: nounwind readnone\0Adeclare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #2\0A\0A; Function Attrs: convergent nounwind\0Adeclare i32 @_Z8__umulhiii(i32, i32) local_unnamed_addr #3\0A\0A; Function Attrs: nounwind\0Adefine void @_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE(float* nocapture readonly, i32, i32, i32, %\22struct.tensorflow::CudaDeviceArrayStruct\22* byval nocapture readonly align 8) local_unnamed_addr #4 comdat {\0A  %6 = getelementptr inbounds %\22struct.tensorflow::CudaDeviceArrayStruct\22, %\22struct.tensorflow::CudaDeviceArrayStruct\22* %4, i64 0, i32 0\0A  %7 = load i32, i32* %6, align 8, !tbaa !24\0A  %8 = icmp slt i32 %7, 9\0A  br i1 %8, label %9, label %11\0A\0A; <label>:9:                                      ; preds = %5\0A  %10 = getelementptr inbounds %\22struct.tensorflow::CudaDeviceArrayStruct\22, %\22struct.tensorflow::CudaDeviceArrayStruct\22* %4, i64 0, i32 1, i64 0\0A  br label %14\0A\0A; <label>:11:                                     ; preds = %5\0A  %12 = getelementptr inbounds %\22struct.tensorflow::CudaDeviceArrayStruct\22, %\22struct.tensorflow::CudaDeviceArrayStruct\22* %4, i64 0, i32 2\0A  %13 = load float**, float*** %12, align 8, !tbaa !26\0A  br label %14\0A\0A; <label>:14:                                     ; preds = %11, %9\0A  %15 = phi float** [ %10, %9 ], [ %13, %11 ]\0A  %16 = mul nsw i32 %2, %1\0A  %17 = mul nsw i32 %16, %3\0A  %18 = sdiv i32 %2, %7\0A  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5, !range !6\0A  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5, !range !7\0A  %21 = mul i32 %20, %19\0A  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5, !range !8\0A  %23 = add i32 %21, %22\0A  %24 = icmp slt i32 %23, %17\0A  br i1 %24, label %25, label %.loopexit\0A\0A; <label>:25:                                     ; preds = %14\0A  %26 = mul nsw i32 %3, %2\0A  %27 = tail call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #5, !range !9\0A  %28 = mul i32 %27, %20\0A  br label %29\0A\0A.loopexit.loopexit:                               ; preds = %29\0A  br label %.loopexit\0A\0A.loopexit:                                        ; preds = %.loopexit.loopexit, %14\0A  ret void\0A\0A; <label>:29:                                     ; preds = %29, %25\0A  %30 = phi i32 [ %23, %25 ], [ %51, %29 ]\0A  %31 = sdiv i32 %30, %26\0A  %32 = srem i32 %30, %26\0A  %33 = sdiv i32 %32, %3\0A  %34 = srem i32 %30, %3\0A  %35 = sdiv i32 %33, %18\0A  %36 = sext i32 %35 to i64\0A  %37 = getelementptr inbounds float*, float** %15, i64 %36\0A  %38 = load float*, float** %37, align 8, !tbaa !27\0A  %39 = mul nsw i32 %31, %18\0A  %40 = srem i32 %33, %18\0A  %41 = add i32 %40, %39\0A  %42 = mul i32 %41, %3\0A  %43 = add nsw i32 %42, %34\0A  %44 = sext i32 %30 to i64\0A  %45 = getelementptr inbounds float, float* %0, i64 %44\0A  %46 = bitcast float* %45 to i32*\0A  %47 = load i32, i32* %46, align 4, !tbaa !22\0A  %48 = sext i32 %43 to i64\0A  %49 = getelementptr inbounds float, float* %38, i64 %48\0A  %50 = bitcast float* %49 to i32*\0A  store i32 %47, i32* %50, align 4, !tbaa !22\0A  %51 = add i32 %30, %28\0A  %52 = icmp slt i32 %51, %17\0A  br i1 %52, label %29, label %.loopexit.loopexit\0A}\0A\0Aattributes #0 = { norecurse nounwind readnone \22correctly-rounded-divide-sqrt-fp-math\22=\22false\22 \22disable-tail-calls\22=\22false\22 \22less-precise-fpmad\22=\22false\22 \22no-frame-pointer-elim\22=\22true\22 \22no-frame-pointer-elim-non-leaf\22 \22no-infs-fp-math\22=\22false\22 \22no-jump-tables\22=\22false\22 \22no-nans-fp-math\22=\22false\22 \22no-signed-zeros-fp-math\22=\22false\22 \22no-trapping-math\22=\22false\22 \22stack-protector-buffer-size\22=\228\22 \22target-cpu\22=\22sm_30\22 \22target-features\22=\22-satom\22 \22unsafe-fp-math\22=\22false\22 \22use-soft-float\22=\22false\22 }\0Aattributes #1 = { convergent nounwind \22correctly-rounded-divide-sqrt-fp-math\22=\22false\22 \22disable-tail-calls\22=\22false\22 \22less-precise-fpmad\22=\22false\22 \22no-frame-pointer-elim\22=\22true\22 \22no-frame-pointer-elim-non-leaf\22 \22no-infs-fp-math\22=\22false\22 \22no-jump-tables\22=\22false\22 \22no-nans-fp-math\22=\22false\22 \22no-signed-zeros-fp-math\22=\22false\22 \22no-trapping-math\22=\22false\22 \22stack-protector-buffer-size\22=\228\22 \22target-cpu\22=\22sm_30\22 \22target-features\22=\22-satom\22 \22unsafe-fp-math\22=\22false\22 \22use-soft-float\22=\22false\22 }\0Aattributes #2 = { nounwind readnone }\0Aattributes #3 = { convergent nounwind \22correctly-rounded-divide-sqrt-fp-math\22=\22false\22 \22disable-tail-calls\22=\22false\22 \22less-precise-fpmad\22=\22false\22 \22no-frame-pointer-elim\22=\22true\22 \22no-frame-pointer-elim-non-leaf\22 \22no-infs-fp-math\22=\22false\22 \22no-nans-fp-math\22=\22false\22 \22no-signed-zeros-fp-math\22=\22false\22 \22no-trapping-math\22=\22false\22 \22stack-protector-buffer-size\22=\228\22 \22target-cpu\22=\22sm_30\22 \22target-features\22=\22-satom\22 \22unsafe-fp-math\22=\22false\22 \22use-soft-float\22=\22false\22 }\0Aattributes #4 = { nounwind \22correctly-rounded-divide-sqrt-fp-math\22=\22false\22 \22disable-tail-calls\22=\22false\22 \22less-precise-fpmad\22=\22false\22 \22no-frame-pointer-elim\22=\22true\22 \22no-frame-pointer-elim-non-leaf\22 \22no-infs-fp-math\22=\22false\22 \22no-jump-tables\22=\22false\22 \22no-nans-fp-math\22=\22false\22 \22no-signed-zeros-fp-math\22=\22false\22 \22no-trapping-math\22=\22false\22 \22stack-protector-buffer-size\22=\228\22 \22target-cpu\22=\22sm_30\22 \22target-features\22=\22-satom\22 \22unsafe-fp-math\22=\22false\22 \22use-soft-float\22=\22false\22 }\0Aattributes #5 = { nounwind }\0Aattributes #6 = { convergent nounwind }\0A\0A!nvvm.annotations = !{!0, !1, !2}\0A!llvm.module.flags = !{!3, !4}\0A!llvm.ident = !{!5}\0A\0A!0 = !{void (%\22struct.Eigen::TensorEvaluator\22*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !\22kernel\22, i32 1}\0A!1 = !{void (%\22struct.Eigen::TensorEvaluator\22*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !\22maxntidx\22, i32 1024}\0A!2 = !{void (float*, i32, i32, i32, %\22struct.tensorflow::CudaDeviceArrayStruct\22*)* @_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE, !\22kernel\22, i32 1}\0A!3 = !{i32 4, !\22nvvm-reflect-ftz\22, i32 0}\0A!4 = !{i32 1, !\22PIC Level\22, i32 2}\0A!5 = !{!\22clang version 4.0.0 (tags/RELEASE_400/final)\22}\0A!6 = !{i32 0, i32 2147483647}\0A!7 = !{i32 1, i32 1025}\0A!8 = !{i32 0, i32 1024}\0A!9 = !{i32 1, i32 -2147483648}\0A!10 = !{!11, !12, i64 0}\0A!11 = !{!\22_ZTSN5Eigen8internal16TensorIntDivisorIiLb0EEE\22, !12, i64 0, !12, i64 4, !12, i64 8}\0A!12 = !{!\22int\22, !13, i64 0}\0A!13 = !{!\22omnipotent char\22, !14, i64 0}\0A!14 = !{!\22Simple C++ TBAA\22}\0A!15 = !{!11, !12, i64 4}\0A!16 = !{!11, !12, i64 8}\0A!17 = !{!12, !12, i64 0}\0A!18 = !{!19, !20, i64 0}\0A!19 = !{!\22_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE\22, !20, i64 0, !21, i64 8, !13, i64 24, !13, i64 32}\0A!20 = !{!\22any pointer\22, !13, i64 0}\0A!21 = !{!\22_ZTSN5Eigen6DSizesIiLi3EEE\22}\0A!22 = !{!23, !23, i64 0}\0A!23 = !{!\22float\22, !13, i64 0}\0A!24 = !{!25, !12, i64 0}\0A!25 = !{!\22_ZTSN10tensorflow21CudaDeviceArrayStructIPfLi8EEE\22, !12, i64 0, !13, i64 8, !20, i64 72}\0A!26 = !{!25, !20, i64 72}\0A!27 = !{!20, !20, i64 0}\0A\00"
@"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll__ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE" = global [94 x i8] c"_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE\00"
@"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll__ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_" = global [247 x i8] c"_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_\00"

; Function Attrs: ssp uwtable
define weak_odr void @_ZN10tensorflow7functor5SplitIN5Eigen9GpuDeviceEfEclERKS3_NS2_9TensorMapINS2_6TensorIfLi3ELi1EiEELi16ENS2_11MakePointerEEENS7_INS8_IKfLi3ELi1EiEELi16ESA_EERKNS2_6DSizesIiLi3EEESI_(%"struct.tensorflow::functor::Split"*, %"struct.Eigen::GpuDevice"* dereferenceable(16), %"class.Eigen::TensorMap"* byval align 8, %"class.Eigen::TensorMap.2"* byval align 8, %"struct.Eigen::DSizes"* dereferenceable(12), %"struct.Eigen::DSizes"* dereferenceable(12)) local_unnamed_addr #0 align 2 {
  %7 = alloca %"class.Eigen::TensorAssignOp", align 8
  %8 = alloca %"class.Eigen::TensorSlicingOp", align 8
  %9 = alloca %"class.Eigen::TensorMap.2", align 16
  %10 = alloca %"class.Eigen::TensorMap", align 16
  %11 = bitcast %"class.Eigen::TensorSlicingOp"* %8 to i8*
  call void @llvm.lifetime.start(i64 32, i8* nonnull %11) #6
  %12 = bitcast %"class.Eigen::TensorMap.2"* %9 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %12) #6
  %13 = bitcast %"class.Eigen::TensorMap.2"* %3 to <2 x i64>*
  %14 = load <2 x i64>, <2 x i64>* %13, align 8
  %15 = getelementptr inbounds %"class.Eigen::TensorMap.2", %"class.Eigen::TensorMap.2"* %3, i64 0, i32 1, i32 0, i32 0, i64 2
  %16 = load i32, i32* %15, align 8
  %17 = bitcast %"class.Eigen::TensorMap.2"* %9 to <2 x i64>*
  store <2 x i64> %14, <2 x i64>* %17, align 16, !alias.scope !2
  %18 = getelementptr inbounds %"class.Eigen::TensorMap.2", %"class.Eigen::TensorMap.2"* %9, i64 0, i32 1, i32 0, i32 0, i64 2
  store i32 %16, i32* %18, align 8, !alias.scope !2
  %19 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %8, i64 0, i32 0
  store %"class.Eigen::TensorMap.2"* %9, %"class.Eigen::TensorMap.2"** %19, align 8, !tbaa !5, !alias.scope !8
  %20 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %8, i64 0, i32 1
  %21 = bitcast %"struct.Eigen::DSizes"* %20 to i8*
  %22 = bitcast %"struct.Eigen::DSizes"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* nonnull %22, i64 12, i32 4, i1 false) #6
  %23 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %8, i64 0, i32 2
  %24 = bitcast %"struct.Eigen::DSizes"* %23 to i8*
  %25 = bitcast %"struct.Eigen::DSizes"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* nonnull %25, i64 12, i32 4, i1 false) #6
  %26 = bitcast %"class.Eigen::TensorMap"* %10 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %26) #6
  %27 = bitcast %"class.Eigen::TensorMap"* %2 to <2 x i64>*
  %28 = load <2 x i64>, <2 x i64>* %27, align 8
  %29 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %2, i64 0, i32 1, i32 0, i32 0, i64 2
  %30 = load i32, i32* %29, align 8
  %31 = bitcast %"class.Eigen::TensorMap"* %10 to <2 x i64>*
  store <2 x i64> %28, <2 x i64>* %31, align 16, !alias.scope !11
  %32 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %10, i64 0, i32 1, i32 0, i32 0, i64 2
  store i32 %30, i32* %32, align 8, !alias.scope !11
  %33 = ptrtoint %"class.Eigen::TensorMap"* %10 to i64
  %34 = bitcast %"class.Eigen::TensorAssignOp"* %7 to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %34) #6
  %35 = bitcast %"class.Eigen::TensorAssignOp"* %7 to i64*
  store i64 %33, i64* %35, align 8, !tbaa !5
  %36 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %7, i64 0, i32 1
  store %"class.Eigen::TensorSlicingOp"* %8, %"class.Eigen::TensorSlicingOp"** %36, align 8, !tbaa !5
  call void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESB_KNS3_INS4_IKfLi3ELi1EiEELi16ES6_EEEEEENS_9GpuDeviceELb0EE3runERSJ_RKSK_(%"class.Eigen::TensorAssignOp"* nonnull dereferenceable(16) %7, %"struct.Eigen::GpuDevice"* nonnull dereferenceable(16) %1)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %34) #6
  call void @llvm.lifetime.end(i64 24, i8* nonnull %26) #6
  call void @llvm.lifetime.end(i64 24, i8* nonnull %12) #6
  call void @llvm.lifetime.end(i64 32, i8* nonnull %11) #6
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: ssp uwtable
define weak_odr void @_ZN10tensorflow16SplitOpGPULaunchIfE3RunERKN5Eigen9GpuDeviceEPKfiiiRKNS_21CudaDeviceArrayStructIPfLi8EEE(%"struct.tensorflow::SplitOpGPULaunch"*, %"struct.Eigen::GpuDevice"* dereferenceable(16), float*, i32, i32, i32, %"struct.tensorflow::CudaDeviceArrayStruct"* dereferenceable(80)) local_unnamed_addr #0 align 2 {
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %"struct.tensorflow::CudaDeviceArrayStruct", align 8
  %13 = mul nsw i32 %4, %3
  %14 = mul nsw i32 %13, %5
  %15 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %16 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !14
  %17 = bitcast %"class.Eigen::StreamInterface"* %16 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %18 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %17, align 8, !tbaa !18
  %19 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %18, i64 3
  %20 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %19, align 8
  %21 = tail call dereferenceable(352) %struct.cudaDeviceProp* %20(%"class.Eigen::StreamInterface"* %16)
  %22 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %21, i64 0, i32 10
  %23 = load i32, i32* %22, align 4, !tbaa !20
  %24 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !14
  %25 = bitcast %"class.Eigen::StreamInterface"* %24 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %26 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %25, align 8, !tbaa !18
  %27 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %26, i64 3
  %28 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %27, align 8
  %29 = tail call dereferenceable(352) %struct.cudaDeviceProp* %28(%"class.Eigen::StreamInterface"* %24)
  %30 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %29, i64 0, i32 8
  %31 = load i32, i32* %30, align 4, !tbaa !23
  %32 = mul nsw i32 %31, %23
  %33 = icmp sgt i32 %32, %14
  %34 = select i1 %33, i32 %14, i32 %32
  %35 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !14
  %36 = bitcast %"class.Eigen::StreamInterface"* %35 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %37 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %36, align 8, !tbaa !18
  %38 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %37, i64 3
  %39 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %38, align 8
  %40 = tail call dereferenceable(352) %struct.cudaDeviceProp* %39(%"class.Eigen::StreamInterface"* %35)
  %41 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %40, i64 0, i32 5
  %42 = load i32, i32* %41, align 8, !tbaa !24
  %43 = icmp slt i32 %42, 1024
  %44 = select i1 %43, i32 %42, i32 1024
  %45 = add i32 %34, -1
  %46 = add i32 %45, %44
  %47 = sdiv i32 %46, %44
  %48 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !14
  %49 = bitcast %"class.Eigen::StreamInterface"* %48 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %50 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %49, align 8, !tbaa !18
  %51 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %50, i64 3
  %52 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %51, align 8
  %53 = tail call dereferenceable(352) %struct.cudaDeviceProp* %52(%"class.Eigen::StreamInterface"* %48)
  %54 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %53, i64 0, i32 10
  %55 = load i32, i32* %54, align 4, !tbaa !20
  %56 = icmp slt i32 %55, %47
  %57 = select i1 %56, i32 %55, i32 %47
  %58 = zext i32 %57 to i64
  %59 = or i64 %58, 4294967296
  %60 = zext i32 %44 to i64
  %61 = or i64 %60, 4294967296
  %62 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %15, align 8, !tbaa !14
  %63 = bitcast %"class.Eigen::StreamInterface"* %62 to i8** (%"class.Eigen::StreamInterface"*)***
  %64 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %63, align 8, !tbaa !18
  %65 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %64, i64 2
  %66 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %65, align 8
  %67 = tail call dereferenceable(8) i8** %66(%"class.Eigen::StreamInterface"* %62)
  %68 = load i8*, i8** %67, align 8, !tbaa !25
  %69 = tail call i32 @cudaConfigureCall(i64 %59, i32 1, i64 %61, i32 1, i64 0, i8* %68)
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %93

; <label>:71:                                     ; preds = %7
  %72 = bitcast %"struct.tensorflow::CudaDeviceArrayStruct"* %6 to i8*
  %73 = bitcast %"struct.tensorflow::CudaDeviceArrayStruct"* %12 to i8*
  call void @llvm.lifetime.start(i64 80, i8* nonnull %73)
  %74 = bitcast float** %8 to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %74)
  %75 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %75)
  %76 = bitcast i32* %10 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %76)
  %77 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %77)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %73, i8* nonnull %72, i64 80, i32 8, i1 false)
  store float* %2, float** %8, align 8, !tbaa !25
  store i32 %3, i32* %9, align 4, !tbaa !26
  store i32 %4, i32* %10, align 4, !tbaa !26
  store i32 %5, i32* %11, align 4, !tbaa !26
  %loadCudaArg = load float*, float** %8
  %78 = icmp eq i32 0, 0
  br i1 %78, label %79, label %92

; <label>:79:                                     ; preds = %71
  %loadCudaArg1 = load i32, i32* %9
  %80 = icmp eq i32 0, 0
  br i1 %80, label %81, label %92

; <label>:81:                                     ; preds = %79
  %loadCudaArg2 = load i32, i32* %10
  %82 = icmp eq i32 0, 0
  br i1 %82, label %83, label %92

; <label>:83:                                     ; preds = %81
  %loadCudaArg3 = load i32, i32* %11
  %84 = icmp eq i32 0, 0
  br i1 %84, label %85, label %92

; <label>:85:                                     ; preds = %83
  %loadCudaArg4 = load %"struct.tensorflow::CudaDeviceArrayStruct", %"struct.tensorflow::CudaDeviceArrayStruct"* %12
  %86 = icmp eq i32 0, 0
  br i1 %86, label %87, label %92

; <label>:87:                                     ; preds = %85
  %88 = getelementptr inbounds [94 x i8], [94 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll__ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE", i32 0, i32 0
  %89 = getelementptr inbounds [14543 x i8], [14543 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %88, i8* %89)
  %90 = bitcast float* %loadCudaArg to i8*
  call void @setKernelArgGpuBuffer(i8* %90, i32 4)
  call void @setKernelArgInt32(i32 %loadCudaArg1)
  call void @setKernelArgInt32(i32 %loadCudaArg2)
  call void @setKernelArgInt32(i32 %loadCudaArg3)
  %91 = bitcast %"struct.tensorflow::CudaDeviceArrayStruct"* %12 to i8*
  call void @setKernelArgHostsideBuffer(i8* %91, i32 72)
  call void @kernelGo()
  br label %92

; <label>:92:                                     ; preds = %87, %85, %83, %81, %79, %71
  call void @llvm.lifetime.end(i64 80, i8* nonnull %73)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %74)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %75)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %76)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %77)
  br label %93

; <label>:93:                                     ; preds = %92, %7
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, i8*) local_unnamed_addr #2

; Function Attrs: ssp uwtable
define internal void @_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE(float*, i32, i32, i32, %"struct.tensorflow::CudaDeviceArrayStruct"* byval align 8) #0 {
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store float* %0, float** %6, align 8, !tbaa !25
  store i32 %1, i32* %7, align 4, !tbaa !26
  store i32 %2, i32* %8, align 4, !tbaa !26
  store i32 %3, i32* %9, align 4, !tbaa !26
  %10 = bitcast float** %6 to i8*
  %loadCudaArg = load float*, float** %6
  %11 = icmp eq i32 0, 0
  br i1 %11, label %12, label %29

; <label>:12:                                     ; preds = %5
  %13 = bitcast i32* %7 to i8*
  %loadCudaArg1 = load i32, i32* %7
  %14 = icmp eq i32 0, 0
  br i1 %14, label %15, label %29

; <label>:15:                                     ; preds = %12
  %16 = bitcast i32* %8 to i8*
  %loadCudaArg2 = load i32, i32* %8
  %17 = icmp eq i32 0, 0
  br i1 %17, label %18, label %29

; <label>:18:                                     ; preds = %15
  %19 = bitcast i32* %9 to i8*
  %loadCudaArg3 = load i32, i32* %9
  %20 = icmp eq i32 0, 0
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %18
  %22 = bitcast %"struct.tensorflow::CudaDeviceArrayStruct"* %4 to i8*
  %loadCudaArg4 = load %"struct.tensorflow::CudaDeviceArrayStruct", %"struct.tensorflow::CudaDeviceArrayStruct"* %4
  %23 = icmp eq i32 0, 0
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %21
  %25 = getelementptr inbounds [94 x i8], [94 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll__ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE", i32 0, i32 0
  %26 = getelementptr inbounds [14543 x i8], [14543 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %25, i8* %26)
  %27 = bitcast float* %loadCudaArg to i8*
  call void @setKernelArgGpuBuffer(i8* %27, i32 4)
  call void @setKernelArgInt32(i32 %loadCudaArg1)
  call void @setKernelArgInt32(i32 %loadCudaArg2)
  call void @setKernelArgInt32(i32 %loadCudaArg3)
  %28 = bitcast %"struct.tensorflow::CudaDeviceArrayStruct"* %4 to i8*
  call void @setKernelArgHostsideBuffer(i8* %28, i32 72)
  call void @kernelGo()
  br label %29

; <label>:29:                                     ; preds = %24, %21, %18, %15, %12, %5
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr hidden void @_ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESB_KNS3_INS4_IKfLi3ELi1EiEELi16ES6_EEEEEENS_9GpuDeviceELb0EE3runERSJ_RKSK_(%"class.Eigen::TensorAssignOp"* dereferenceable(16), %"struct.Eigen::GpuDevice"* dereferenceable(16)) local_unnamed_addr #0 align 2 {
  %3 = alloca i32, align 4
  %4 = alloca %"struct.Eigen::TensorEvaluator", align 8
  %5 = alloca %"struct.Eigen::TensorEvaluator", align 8
  %6 = bitcast %"struct.Eigen::TensorEvaluator"* %5 to i8*
  call void @llvm.lifetime.start(i64 176, i8* nonnull %6) #6
  %7 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %0, i64 0, i32 0
  %8 = load %"class.Eigen::TensorMap"*, %"class.Eigen::TensorMap"** %7, align 8, !tbaa !5
  %9 = bitcast %"class.Eigen::TensorMap"* %8 to i64*
  %10 = load i64, i64* %9, align 8, !tbaa !27
  %11 = bitcast %"struct.Eigen::TensorEvaluator"* %5 to i64*
  store i64 %10, i64* %11, align 8, !tbaa !30
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 0, i32 1
  %13 = getelementptr inbounds %"class.Eigen::TensorMap", %"class.Eigen::TensorMap"* %8, i64 0, i32 1
  %14 = bitcast %"struct.Eigen::DSizes"* %12 to i8*
  %15 = bitcast %"struct.Eigen::DSizes"* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 12, i32 4, i1 false)
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 0, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %16, align 8, !tbaa !5
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 0, i32 3
  store %"class.Eigen::TensorMap"* %8, %"class.Eigen::TensorMap"** %17, align 8, !tbaa !5
  %18 = getelementptr inbounds %"class.Eigen::TensorAssignOp", %"class.Eigen::TensorAssignOp"* %0, i64 0, i32 1
  %19 = load %"class.Eigen::TensorSlicingOp"*, %"class.Eigen::TensorSlicingOp"** %18, align 8, !tbaa !5
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1
  %21 = bitcast %"class.Eigen::array.9"* %20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %21, i8 0, i64 36, i32 4, i1 false)
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 3
  %23 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %19, i64 0, i32 0
  %24 = load %"class.Eigen::TensorMap.2"*, %"class.Eigen::TensorMap.2"** %23, align 8, !tbaa !5
  %25 = bitcast %"class.Eigen::TensorMap.2"* %24 to i64*
  %26 = load i64, i64* %25, align 8, !tbaa !32
  %27 = bitcast %"struct.Eigen::TensorEvaluator.10"* %22 to i64*
  store i64 %26, i64* %27, align 8, !tbaa !34
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 3, i32 1
  %29 = getelementptr inbounds %"class.Eigen::TensorMap.2", %"class.Eigen::TensorMap.2"* %24, i64 0, i32 1
  %30 = bitcast %"struct.Eigen::DSizes"* %28 to i8*
  %31 = bitcast %"struct.Eigen::DSizes"* %29 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 12, i32 4, i1 false)
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 3, i32 2
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %32, align 8, !tbaa !5
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 3, i32 3
  store %"class.Eigen::TensorMap.2"* %24, %"class.Eigen::TensorMap.2"** %33, align 8, !tbaa !5
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 4
  store %"struct.Eigen::GpuDevice"* %1, %"struct.Eigen::GpuDevice"** %34, align 8, !tbaa !5
  %35 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 5
  %36 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %19, i64 0, i32 2
  %37 = bitcast %"struct.Eigen::DSizes"* %35 to i8*
  %38 = bitcast %"struct.Eigen::DSizes"* %36 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 12, i32 4, i1 false)
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 6
  %40 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %19, i64 0, i32 1
  %41 = bitcast %"struct.Eigen::DSizes"* %39 to i8*
  %42 = bitcast %"struct.Eigen::DSizes"* %40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 12, i32 4, i1 false)
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 0, i64 2
  store i32 1, i32* %43, align 8, !tbaa !26
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %45 = load i32, i32* %44, align 8, !tbaa !26
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 0, i64 1
  store i32 %45, i32* %46, align 4, !tbaa !26
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %48 = load i32, i32* %47, align 4, !tbaa !26
  %49 = mul nsw i32 %48, %45
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 2, i32 0, i64 0
  store i32 %49, i32* %50, align 8, !tbaa !26
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 0, i32 0, i64 2
  store i32 1, i32* %51, align 8, !tbaa !26
  %52 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %19, i64 0, i32 2, i32 0, i32 0, i64 2
  %53 = load i32, i32* %52, align 4, !tbaa !26
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 0, i32 0, i64 1
  store i32 %53, i32* %54, align 4, !tbaa !26
  %55 = tail call i32 @llvm.ctlz.i32(i32 %53, i1 true) #6
  %56 = sub nsw i32 32, %55
  %57 = add nsw i32 %56, -1
  %58 = shl i32 1, %57
  %59 = icmp eq i32 %58, %53
  %60 = select i1 %59, i32 %57, i32 %56
  %61 = add nsw i32 %60, 32
  %62 = zext i32 %61 to i64
  %63 = shl i64 1, %62
  %64 = sext i32 %53 to i64
  %65 = udiv i64 %63, %64
  %66 = add i64 %65, 1
  %67 = trunc i64 %66 to i32
  %68 = icmp sgt i32 %60, 1
  %69 = select i1 %68, i32 1, i32 %60
  %70 = add nsw i32 %60, -1
  %71 = select i1 %68, i32 %70, i32 0
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 0, i64 1, i32 0
  store i32 %67, i32* %72, align 4
  %73 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 0, i64 1, i32 1
  store i32 %69, i32* %73, align 4
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 0, i64 1, i32 2
  store i32 %71, i32* %74, align 4
  %75 = getelementptr inbounds %"class.Eigen::TensorSlicingOp", %"class.Eigen::TensorSlicingOp"* %19, i64 0, i32 2, i32 0, i32 0, i64 1
  %76 = load i32, i32* %75, align 4, !tbaa !26
  %77 = mul nsw i32 %76, %53
  %78 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 0, i32 0, i64 0
  store i32 %77, i32* %78, align 8, !tbaa !26
  %79 = tail call i32 @llvm.ctlz.i32(i32 %77, i1 true) #6
  %80 = sub nsw i32 32, %79
  %81 = add nsw i32 %80, -1
  %82 = shl i32 1, %81
  %83 = icmp eq i32 %82, %77
  %84 = select i1 %83, i32 %81, i32 %80
  %85 = add nsw i32 %84, 32
  %86 = zext i32 %85 to i64
  %87 = shl i64 1, %86
  %88 = sext i32 %77 to i64
  %89 = udiv i64 %87, %88
  %90 = add i64 %89, 1
  %91 = trunc i64 %90 to i32
  %92 = icmp sgt i32 %84, 1
  %93 = select i1 %92, i32 1, i32 %84
  %94 = add nsw i32 %84, -1
  %95 = select i1 %92, i32 %94, i32 0
  %96 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 0, i64 0, i32 0
  store i32 %91, i32* %96, align 4
  %97 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 0, i64 0, i32 1
  store i32 %93, i32* %97, align 4
  %98 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 1, i32 0, i64 0, i32 2
  store i32 %95, i32* %98, align 4
  %99 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1
  %100 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 0, i32 0
  %101 = load float*, float** %100, align 8, !tbaa !30
  %102 = call zeroext i1 @_ZN5Eigen15TensorEvaluatorIKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEES4_KNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE20evalSubExprsIfNeededEPf(%"struct.Eigen::TensorEvaluator.8"* %99, float* %101)
  br i1 %102, label %103, label %261

; <label>:103:                                    ; preds = %2
  %104 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %1, i64 0, i32 0
  %105 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %104, align 8, !tbaa !14
  %106 = bitcast %"class.Eigen::StreamInterface"* %105 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %107 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %106, align 8, !tbaa !18
  %108 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %107, i64 3
  %109 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %108, align 8
  %110 = call dereferenceable(352) %struct.cudaDeviceProp* %109(%"class.Eigen::StreamInterface"* %105)
  %111 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %110, i64 0, i32 5
  %112 = load i32, i32* %111, align 8, !tbaa !24
  %113 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %104, align 8, !tbaa !14
  %114 = bitcast %"class.Eigen::StreamInterface"* %113 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %115 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %114, align 8, !tbaa !18
  %116 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %115, i64 3
  %117 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %116, align 8
  %118 = call dereferenceable(352) %struct.cudaDeviceProp* %117(%"class.Eigen::StreamInterface"* %113)
  %119 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %118, i64 0, i32 10
  %120 = load i32, i32* %119, align 4, !tbaa !20
  %121 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %104, align 8, !tbaa !14
  %122 = bitcast %"class.Eigen::StreamInterface"* %121 to %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)***
  %123 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)**, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*** %122, align 8, !tbaa !18
  %124 = getelementptr inbounds %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %123, i64 3
  %125 = load %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)*, %struct.cudaDeviceProp* (%"class.Eigen::StreamInterface"*)** %124, align 8
  %126 = call dereferenceable(352) %struct.cudaDeviceProp* %125(%"class.Eigen::StreamInterface"* %121)
  %127 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %126, i64 0, i32 8
  %128 = load i32, i32* %127, align 4, !tbaa !23
  %129 = mul nsw i32 %128, %120
  %130 = sdiv i32 %129, %112
  %131 = bitcast %"struct.Eigen::DSizes"* %35 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %5, i64 0, i32 1, i32 5, i32 0, i32 0, i64 2
  %134 = load i32, i32* %133, align 8
  %135 = trunc i64 %132 to i32
  %136 = lshr i64 %132, 32
  %137 = trunc i64 %136 to i32
  %138 = mul i32 %135, %134
  %139 = mul i32 %138, %137
  %140 = add i32 %112, -1
  %141 = add i32 %140, %139
  %142 = sdiv i32 %141, %112
  %143 = icmp slt i32 %142, %130
  %144 = select i1 %143, i32 %142, i32 %130
  %145 = icmp sgt i32 %144, 1
  %146 = select i1 %145, i32 %144, i32 1
  %147 = zext i32 %146 to i64
  %148 = or i64 %147, 4294967296
  %149 = zext i32 %112 to i64
  %150 = or i64 %149, 4294967296
  %151 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %104, align 8, !tbaa !14
  %152 = bitcast %"class.Eigen::StreamInterface"* %151 to i8** (%"class.Eigen::StreamInterface"*)***
  %153 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %152, align 8, !tbaa !18
  %154 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %153, i64 2
  %155 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %154, align 8
  %156 = call dereferenceable(8) i8** %155(%"class.Eigen::StreamInterface"* %151)
  %157 = load i8*, i8** %156, align 8, !tbaa !25
  %158 = call i32 @cudaConfigureCall(i64 %148, i32 1, i64 %150, i32 1, i64 0, i8* %157)
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %160, label %257

; <label>:160:                                    ; preds = %103
  %161 = bitcast %"struct.Eigen::TensorEvaluator"* %4 to i8*
  call void @llvm.lifetime.start(i64 176, i8* nonnull %161)
  %162 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %162)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %161, i8* nonnull %6, i64 176, i32 8, i1 false)
  store i32 %139, i32* %3, align 4, !tbaa !26
  %loadCudaArg = load %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4
  %163 = icmp eq i32 0, 0
  br i1 %163, label %164, label %256

; <label>:164:                                    ; preds = %160
  %loadCudaArg1 = load i32, i32* %3
  %165 = icmp eq i32 0, 0
  br i1 %165, label %166, label %256

; <label>:166:                                    ; preds = %164
  %167 = getelementptr inbounds [247 x i8], [247 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll__ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_", i32 0, i32 0
  %168 = getelementptr inbounds [14543 x i8], [14543 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %167, i8* %168)
  %newalloca = alloca %"struct.Eigen::TensorEvaluator_nopointers"
  %169 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i32 0, i32 0
  %170 = getelementptr inbounds %"struct.Eigen::TensorEvaluator_nopointers", %"struct.Eigen::TensorEvaluator_nopointers"* %newalloca, i32 0, i32 0
  %171 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %169, i32 0, i32 1
  %172 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7_nopointers", %"struct.Eigen::TensorEvaluator.7_nopointers"* %170, i32 0, i32 0
  %173 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %171, i32 0, i32 0
  %174 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %172, i32 0, i32 0
  %175 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %173, i32 0, i32 0
  %176 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %174, i32 0, i32 0
  %177 = getelementptr inbounds [3 x i32], [3 x i32]* %175, i32 0, i32 0
  %178 = getelementptr inbounds [3 x i32], [3 x i32]* %176, i32 0, i32 0
  %loadarr = load i32, i32* %177
  store i32 %loadarr, i32* %178
  %179 = getelementptr inbounds [3 x i32], [3 x i32]* %175, i32 0, i32 1
  %180 = getelementptr inbounds [3 x i32], [3 x i32]* %176, i32 0, i32 1
  %loadarr2 = load i32, i32* %179
  store i32 %loadarr2, i32* %180
  %181 = getelementptr inbounds [3 x i32], [3 x i32]* %175, i32 0, i32 2
  %182 = getelementptr inbounds [3 x i32], [3 x i32]* %176, i32 0, i32 2
  %loadarr3 = load i32, i32* %181
  store i32 %loadarr3, i32* %182
  %183 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i32 0, i32 1
  %184 = getelementptr inbounds %"struct.Eigen::TensorEvaluator_nopointers", %"struct.Eigen::TensorEvaluator_nopointers"* %newalloca, i32 0, i32 1
  %185 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %183, i32 0, i32 0
  %186 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %184, i32 0, i32 0
  %187 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %185, i32 0, i32 0
  %188 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %186, i32 0, i32 0
  %189 = getelementptr inbounds [3 x i32], [3 x i32]* %187, i32 0, i32 0
  %190 = getelementptr inbounds [3 x i32], [3 x i32]* %188, i32 0, i32 0
  %loadarr4 = load i32, i32* %189
  store i32 %loadarr4, i32* %190
  %191 = getelementptr inbounds [3 x i32], [3 x i32]* %187, i32 0, i32 1
  %192 = getelementptr inbounds [3 x i32], [3 x i32]* %188, i32 0, i32 1
  %loadarr5 = load i32, i32* %191
  store i32 %loadarr5, i32* %192
  %193 = getelementptr inbounds [3 x i32], [3 x i32]* %187, i32 0, i32 2
  %194 = getelementptr inbounds [3 x i32], [3 x i32]* %188, i32 0, i32 2
  %loadarr6 = load i32, i32* %193
  store i32 %loadarr6, i32* %194
  %195 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %183, i32 0, i32 1
  %196 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %184, i32 0, i32 1
  %197 = getelementptr inbounds %"class.Eigen::array.9", %"class.Eigen::array.9"* %195, i32 0, i32 0
  %198 = getelementptr inbounds %"class.Eigen::array.9_nopointers", %"class.Eigen::array.9_nopointers"* %196, i32 0, i32 0
  %199 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %197, i32 0, i32 0
  %200 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %198, i32 0, i32 0
  %loadarr7 = load %"struct.Eigen::internal::TensorIntDivisor", %"struct.Eigen::internal::TensorIntDivisor"* %199
  store %"struct.Eigen::internal::TensorIntDivisor" %loadarr7, %"struct.Eigen::internal::TensorIntDivisor"* %200
  %201 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %197, i32 0, i32 1
  %202 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %198, i32 0, i32 1
  %loadarr8 = load %"struct.Eigen::internal::TensorIntDivisor", %"struct.Eigen::internal::TensorIntDivisor"* %201
  store %"struct.Eigen::internal::TensorIntDivisor" %loadarr8, %"struct.Eigen::internal::TensorIntDivisor"* %202
  %203 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %197, i32 0, i32 2
  %204 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %198, i32 0, i32 2
  %loadarr9 = load %"struct.Eigen::internal::TensorIntDivisor", %"struct.Eigen::internal::TensorIntDivisor"* %203
  store %"struct.Eigen::internal::TensorIntDivisor" %loadarr9, %"struct.Eigen::internal::TensorIntDivisor"* %204
  %205 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %183, i32 0, i32 2
  %206 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %184, i32 0, i32 2
  %207 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %205, i32 0, i32 0
  %208 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %206, i32 0, i32 0
  %209 = getelementptr inbounds [3 x i32], [3 x i32]* %207, i32 0, i32 0
  %210 = getelementptr inbounds [3 x i32], [3 x i32]* %208, i32 0, i32 0
  %loadarr10 = load i32, i32* %209
  store i32 %loadarr10, i32* %210
  %211 = getelementptr inbounds [3 x i32], [3 x i32]* %207, i32 0, i32 1
  %212 = getelementptr inbounds [3 x i32], [3 x i32]* %208, i32 0, i32 1
  %loadarr11 = load i32, i32* %211
  store i32 %loadarr11, i32* %212
  %213 = getelementptr inbounds [3 x i32], [3 x i32]* %207, i32 0, i32 2
  %214 = getelementptr inbounds [3 x i32], [3 x i32]* %208, i32 0, i32 2
  %loadarr12 = load i32, i32* %213
  store i32 %loadarr12, i32* %214
  %215 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %183, i32 0, i32 3
  %216 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %184, i32 0, i32 3
  %217 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10", %"struct.Eigen::TensorEvaluator.10"* %215, i32 0, i32 1
  %218 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10_nopointers", %"struct.Eigen::TensorEvaluator.10_nopointers"* %216, i32 0, i32 0
  %219 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %217, i32 0, i32 0
  %220 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %218, i32 0, i32 0
  %221 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %219, i32 0, i32 0
  %222 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %220, i32 0, i32 0
  %223 = getelementptr inbounds [3 x i32], [3 x i32]* %221, i32 0, i32 0
  %224 = getelementptr inbounds [3 x i32], [3 x i32]* %222, i32 0, i32 0
  %loadarr13 = load i32, i32* %223
  store i32 %loadarr13, i32* %224
  %225 = getelementptr inbounds [3 x i32], [3 x i32]* %221, i32 0, i32 1
  %226 = getelementptr inbounds [3 x i32], [3 x i32]* %222, i32 0, i32 1
  %loadarr14 = load i32, i32* %225
  store i32 %loadarr14, i32* %226
  %227 = getelementptr inbounds [3 x i32], [3 x i32]* %221, i32 0, i32 2
  %228 = getelementptr inbounds [3 x i32], [3 x i32]* %222, i32 0, i32 2
  %loadarr15 = load i32, i32* %227
  store i32 %loadarr15, i32* %228
  %229 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %183, i32 0, i32 5
  %230 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %184, i32 0, i32 4
  %231 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %229, i32 0, i32 0
  %232 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %230, i32 0, i32 0
  %233 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %231, i32 0, i32 0
  %234 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %232, i32 0, i32 0
  %235 = getelementptr inbounds [3 x i32], [3 x i32]* %233, i32 0, i32 0
  %236 = getelementptr inbounds [3 x i32], [3 x i32]* %234, i32 0, i32 0
  %loadarr16 = load i32, i32* %235
  store i32 %loadarr16, i32* %236
  %237 = getelementptr inbounds [3 x i32], [3 x i32]* %233, i32 0, i32 1
  %238 = getelementptr inbounds [3 x i32], [3 x i32]* %234, i32 0, i32 1
  %loadarr17 = load i32, i32* %237
  store i32 %loadarr17, i32* %238
  %239 = getelementptr inbounds [3 x i32], [3 x i32]* %233, i32 0, i32 2
  %240 = getelementptr inbounds [3 x i32], [3 x i32]* %234, i32 0, i32 2
  %loadarr18 = load i32, i32* %239
  store i32 %loadarr18, i32* %240
  %241 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %183, i32 0, i32 6
  %242 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %184, i32 0, i32 5
  %243 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %241, i32 0, i32 0
  %244 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %242, i32 0, i32 0
  %245 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %243, i32 0, i32 0
  %246 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %244, i32 0, i32 0
  %247 = getelementptr inbounds [3 x i32], [3 x i32]* %245, i32 0, i32 0
  %248 = getelementptr inbounds [3 x i32], [3 x i32]* %246, i32 0, i32 0
  %loadarr19 = load i32, i32* %247
  store i32 %loadarr19, i32* %248
  %249 = getelementptr inbounds [3 x i32], [3 x i32]* %245, i32 0, i32 1
  %250 = getelementptr inbounds [3 x i32], [3 x i32]* %246, i32 0, i32 1
  %loadarr20 = load i32, i32* %249
  store i32 %loadarr20, i32* %250
  %251 = getelementptr inbounds [3 x i32], [3 x i32]* %245, i32 0, i32 2
  %252 = getelementptr inbounds [3 x i32], [3 x i32]* %246, i32 0, i32 2
  %loadarr21 = load i32, i32* %251
  store i32 %loadarr21, i32* %252
  %253 = bitcast %"struct.Eigen::TensorEvaluator_nopointers"* %newalloca to i8*
  call void @setKernelArgHostsideBuffer(i8* %253, i32 108)
  %getfloatstaraddr = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i32 0, i32 0, i32 0
  %loadgep = load float*, float** %getfloatstaraddr
  %254 = bitcast float* %loadgep to i8*
  call void @setKernelArgGpuBuffer(i8* %254, i32 4)
  %getfloatstaraddr22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %4, i32 0, i32 1, i32 3, i32 0
  %loadgep23 = load float*, float** %getfloatstaraddr22
  %255 = bitcast float* %loadgep23 to i8*
  call void @setKernelArgGpuBuffer(i8* %255, i32 4)
  call void @setKernelArgInt32(i32 %loadCudaArg1)
  call void @kernelGo()
  br label %256

; <label>:256:                                    ; preds = %166, %164, %160
  call void @llvm.lifetime.end(i64 176, i8* nonnull %161)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %162)
  br label %257

; <label>:257:                                    ; preds = %256, %103
  %258 = call i64 @cudaGetLastError()
  %259 = icmp eq i64 %258, 0
  br i1 %259, label %261, label %260, !prof !36

; <label>:260:                                    ; preds = %257
  call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESB_KNS3_INS4_IKfLi3ELi1EiEELi16ES6_EEEEEENS_9GpuDeviceELb0EE3runERSJ_RKSK_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #7
  unreachable

; <label>:261:                                    ; preds = %257, %2
  call void @llvm.lifetime.end(i64 176, i8* nonnull %6) #6
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval align 8, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = bitcast %"struct.Eigen::TensorEvaluator"* %0 to i8*
  %loadCudaArg = load %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0
  %5 = icmp eq i32 0, 0
  br i1 %5, label %6, label %99

; <label>:6:                                      ; preds = %2
  %7 = bitcast i32* %3 to i8*
  %loadCudaArg1 = load i32, i32* %3
  %8 = icmp eq i32 0, 0
  br i1 %8, label %9, label %99

; <label>:9:                                      ; preds = %6
  %10 = getelementptr inbounds [247 x i8], [247 x i8]* @"s___devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll__ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_", i32 0, i32 0
  %11 = getelementptr inbounds [14543 x i8], [14543 x i8]* @"__devicell_sourcecodebazel-out/local_darwin-py3-dbg/bin/tensorflow/core/kernels/_objs/split_lib_gpu/tensorflow/core/kernels/split_lib_gpu-device.ll", i32 0, i32 0
  call void @configureKernel(i8* %10, i8* %11)
  %newalloca = alloca %"struct.Eigen::TensorEvaluator_nopointers"
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i32 0, i32 0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator_nopointers", %"struct.Eigen::TensorEvaluator_nopointers"* %newalloca, i32 0, i32 0
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7", %"struct.Eigen::TensorEvaluator.7"* %12, i32 0, i32 1
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.7_nopointers", %"struct.Eigen::TensorEvaluator.7_nopointers"* %13, i32 0, i32 0
  %16 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %14, i32 0, i32 0
  %17 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %15, i32 0, i32 0
  %18 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %16, i32 0, i32 0
  %19 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %17, i32 0, i32 0
  %20 = getelementptr inbounds [3 x i32], [3 x i32]* %18, i32 0, i32 0
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %19, i32 0, i32 0
  %loadarr = load i32, i32* %20
  store i32 %loadarr, i32* %21
  %22 = getelementptr inbounds [3 x i32], [3 x i32]* %18, i32 0, i32 1
  %23 = getelementptr inbounds [3 x i32], [3 x i32]* %19, i32 0, i32 1
  %loadarr2 = load i32, i32* %22
  store i32 %loadarr2, i32* %23
  %24 = getelementptr inbounds [3 x i32], [3 x i32]* %18, i32 0, i32 2
  %25 = getelementptr inbounds [3 x i32], [3 x i32]* %19, i32 0, i32 2
  %loadarr3 = load i32, i32* %24
  store i32 %loadarr3, i32* %25
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i32 0, i32 1
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator_nopointers", %"struct.Eigen::TensorEvaluator_nopointers"* %newalloca, i32 0, i32 1
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %26, i32 0, i32 0
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %27, i32 0, i32 0
  %30 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %28, i32 0, i32 0
  %31 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %29, i32 0, i32 0
  %32 = getelementptr inbounds [3 x i32], [3 x i32]* %30, i32 0, i32 0
  %33 = getelementptr inbounds [3 x i32], [3 x i32]* %31, i32 0, i32 0
  %loadarr4 = load i32, i32* %32
  store i32 %loadarr4, i32* %33
  %34 = getelementptr inbounds [3 x i32], [3 x i32]* %30, i32 0, i32 1
  %35 = getelementptr inbounds [3 x i32], [3 x i32]* %31, i32 0, i32 1
  %loadarr5 = load i32, i32* %34
  store i32 %loadarr5, i32* %35
  %36 = getelementptr inbounds [3 x i32], [3 x i32]* %30, i32 0, i32 2
  %37 = getelementptr inbounds [3 x i32], [3 x i32]* %31, i32 0, i32 2
  %loadarr6 = load i32, i32* %36
  store i32 %loadarr6, i32* %37
  %38 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %26, i32 0, i32 1
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %27, i32 0, i32 1
  %40 = getelementptr inbounds %"class.Eigen::array.9", %"class.Eigen::array.9"* %38, i32 0, i32 0
  %41 = getelementptr inbounds %"class.Eigen::array.9_nopointers", %"class.Eigen::array.9_nopointers"* %39, i32 0, i32 0
  %42 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %40, i32 0, i32 0
  %43 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %41, i32 0, i32 0
  %loadarr7 = load %"struct.Eigen::internal::TensorIntDivisor", %"struct.Eigen::internal::TensorIntDivisor"* %42
  store %"struct.Eigen::internal::TensorIntDivisor" %loadarr7, %"struct.Eigen::internal::TensorIntDivisor"* %43
  %44 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %40, i32 0, i32 1
  %45 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %41, i32 0, i32 1
  %loadarr8 = load %"struct.Eigen::internal::TensorIntDivisor", %"struct.Eigen::internal::TensorIntDivisor"* %44
  store %"struct.Eigen::internal::TensorIntDivisor" %loadarr8, %"struct.Eigen::internal::TensorIntDivisor"* %45
  %46 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %40, i32 0, i32 2
  %47 = getelementptr inbounds [3 x %"struct.Eigen::internal::TensorIntDivisor"], [3 x %"struct.Eigen::internal::TensorIntDivisor"]* %41, i32 0, i32 2
  %loadarr9 = load %"struct.Eigen::internal::TensorIntDivisor", %"struct.Eigen::internal::TensorIntDivisor"* %46
  store %"struct.Eigen::internal::TensorIntDivisor" %loadarr9, %"struct.Eigen::internal::TensorIntDivisor"* %47
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %26, i32 0, i32 2
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %27, i32 0, i32 2
  %50 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %48, i32 0, i32 0
  %51 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %49, i32 0, i32 0
  %52 = getelementptr inbounds [3 x i32], [3 x i32]* %50, i32 0, i32 0
  %53 = getelementptr inbounds [3 x i32], [3 x i32]* %51, i32 0, i32 0
  %loadarr10 = load i32, i32* %52
  store i32 %loadarr10, i32* %53
  %54 = getelementptr inbounds [3 x i32], [3 x i32]* %50, i32 0, i32 1
  %55 = getelementptr inbounds [3 x i32], [3 x i32]* %51, i32 0, i32 1
  %loadarr11 = load i32, i32* %54
  store i32 %loadarr11, i32* %55
  %56 = getelementptr inbounds [3 x i32], [3 x i32]* %50, i32 0, i32 2
  %57 = getelementptr inbounds [3 x i32], [3 x i32]* %51, i32 0, i32 2
  %loadarr12 = load i32, i32* %56
  store i32 %loadarr12, i32* %57
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %26, i32 0, i32 3
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %27, i32 0, i32 3
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10", %"struct.Eigen::TensorEvaluator.10"* %58, i32 0, i32 1
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10_nopointers", %"struct.Eigen::TensorEvaluator.10_nopointers"* %59, i32 0, i32 0
  %62 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %60, i32 0, i32 0
  %63 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %61, i32 0, i32 0
  %64 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %62, i32 0, i32 0
  %65 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %63, i32 0, i32 0
  %66 = getelementptr inbounds [3 x i32], [3 x i32]* %64, i32 0, i32 0
  %67 = getelementptr inbounds [3 x i32], [3 x i32]* %65, i32 0, i32 0
  %loadarr13 = load i32, i32* %66
  store i32 %loadarr13, i32* %67
  %68 = getelementptr inbounds [3 x i32], [3 x i32]* %64, i32 0, i32 1
  %69 = getelementptr inbounds [3 x i32], [3 x i32]* %65, i32 0, i32 1
  %loadarr14 = load i32, i32* %68
  store i32 %loadarr14, i32* %69
  %70 = getelementptr inbounds [3 x i32], [3 x i32]* %64, i32 0, i32 2
  %71 = getelementptr inbounds [3 x i32], [3 x i32]* %65, i32 0, i32 2
  %loadarr15 = load i32, i32* %70
  store i32 %loadarr15, i32* %71
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %26, i32 0, i32 5
  %73 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %27, i32 0, i32 4
  %74 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %72, i32 0, i32 0
  %75 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %73, i32 0, i32 0
  %76 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %74, i32 0, i32 0
  %77 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %75, i32 0, i32 0
  %78 = getelementptr inbounds [3 x i32], [3 x i32]* %76, i32 0, i32 0
  %79 = getelementptr inbounds [3 x i32], [3 x i32]* %77, i32 0, i32 0
  %loadarr16 = load i32, i32* %78
  store i32 %loadarr16, i32* %79
  %80 = getelementptr inbounds [3 x i32], [3 x i32]* %76, i32 0, i32 1
  %81 = getelementptr inbounds [3 x i32], [3 x i32]* %77, i32 0, i32 1
  %loadarr17 = load i32, i32* %80
  store i32 %loadarr17, i32* %81
  %82 = getelementptr inbounds [3 x i32], [3 x i32]* %76, i32 0, i32 2
  %83 = getelementptr inbounds [3 x i32], [3 x i32]* %77, i32 0, i32 2
  %loadarr18 = load i32, i32* %82
  store i32 %loadarr18, i32* %83
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %26, i32 0, i32 6
  %85 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8_nopointers", %"struct.Eigen::TensorEvaluator.8_nopointers"* %27, i32 0, i32 5
  %86 = getelementptr inbounds %"struct.Eigen::DSizes", %"struct.Eigen::DSizes"* %84, i32 0, i32 0
  %87 = getelementptr inbounds %"struct.Eigen::DSizes_nopointers", %"struct.Eigen::DSizes_nopointers"* %85, i32 0, i32 0
  %88 = getelementptr inbounds %"class.Eigen::array", %"class.Eigen::array"* %86, i32 0, i32 0
  %89 = getelementptr inbounds %"class.Eigen::array_nopointers", %"class.Eigen::array_nopointers"* %87, i32 0, i32 0
  %90 = getelementptr inbounds [3 x i32], [3 x i32]* %88, i32 0, i32 0
  %91 = getelementptr inbounds [3 x i32], [3 x i32]* %89, i32 0, i32 0
  %loadarr19 = load i32, i32* %90
  store i32 %loadarr19, i32* %91
  %92 = getelementptr inbounds [3 x i32], [3 x i32]* %88, i32 0, i32 1
  %93 = getelementptr inbounds [3 x i32], [3 x i32]* %89, i32 0, i32 1
  %loadarr20 = load i32, i32* %92
  store i32 %loadarr20, i32* %93
  %94 = getelementptr inbounds [3 x i32], [3 x i32]* %88, i32 0, i32 2
  %95 = getelementptr inbounds [3 x i32], [3 x i32]* %89, i32 0, i32 2
  %loadarr21 = load i32, i32* %94
  store i32 %loadarr21, i32* %95
  %96 = bitcast %"struct.Eigen::TensorEvaluator_nopointers"* %newalloca to i8*
  call void @setKernelArgHostsideBuffer(i8* %96, i32 108)
  %getfloatstaraddr = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i32 0, i32 0, i32 0
  %loadgep = load float*, float** %getfloatstaraddr
  %97 = bitcast float* %loadgep to i8*
  call void @setKernelArgGpuBuffer(i8* %97, i32 4)
  %getfloatstaraddr22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %0, i32 0, i32 1, i32 3, i32 0
  %loadgep23 = load float*, float** %getfloatstaraddr22
  %98 = bitcast float* %loadgep23 to i8*
  call void @setKernelArgGpuBuffer(i8* %98, i32 4)
  call void @setKernelArgInt32(i32 %loadCudaArg1)
  call void @kernelGo()
  br label %99

; <label>:99:                                     ; preds = %9, %6, %2
  ret void
}

declare i64 @cudaGetLastError() local_unnamed_addr #2

; Function Attrs: noreturn
declare void @__assert_rtn(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare i32 @llvm.ctlz.i32(i32, i1) #4

; Function Attrs: inlinehint ssp uwtable
define linkonce_odr hidden zeroext i1 @_ZN5Eigen15TensorEvaluatorIKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEES4_KNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEEEENS_9GpuDeviceEE20evalSubExprsIfNeededEPf(%"struct.Eigen::TensorEvaluator.8"*, float*) local_unnamed_addr #5 align 2 {
  %3 = icmp eq float* %1, null
  br i1 %3, label %124, label %4

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 3, i32 0
  %6 = load float*, float** %5, align 8, !tbaa !34
  %7 = icmp eq float* %6, null
  br i1 %7, label %124, label %8

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 5, i32 0, i32 0, i64 2
  %10 = load i32, i32* %9, align 4, !tbaa !26
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 3, i32 1, i32 0, i32 0, i64 2
  %12 = load i32, i32* %11, align 4, !tbaa !26
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %14, label %21

; <label>:14:                                     ; preds = %8
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 5, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !26
  %17 = mul nsw i32 %16, %10
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 3, i32 1, i32 0, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !26
  %20 = icmp eq i32 %16, %19
  br i1 %20, label %126, label %21

; <label>:21:                                     ; preds = %126, %14, %8
  %22 = phi i32 [ %10, %8 ], [ %17, %14 ], [ %129, %126 ]
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 4
  %24 = icmp sgt i32 %22, 4194304
  br i1 %24, label %25, label %124

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 5, i32 0
  %27 = bitcast %"class.Eigen::array"* %26 to i64*
  %28 = load i64, i64* %27, align 4
  %29 = trunc i64 %28 to i32
  %30 = lshr i64 %28, 32
  %31 = trunc i64 %30 to i32
  %32 = mul i32 %29, %10
  %33 = mul i32 %32, %31
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %124

; <label>:35:                                     ; preds = %25
  %36 = getelementptr %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 1, i32 0, i64 0, i32 0
  %37 = getelementptr %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 1, i32 0, i64 0, i32 1
  %38 = getelementptr %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 1, i32 0, i64 0, i32 2
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 6, i32 0, i32 0, i64 0
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 2, i32 0, i64 0
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 0, i32 0, i64 0
  %42 = getelementptr %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 1, i32 0, i64 1, i32 0
  %43 = getelementptr %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 1, i32 0, i64 1, i32 1
  %44 = getelementptr %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 1, i32 0, i64 1, i32 2
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 6, i32 0, i32 0, i64 1
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 2, i32 0, i64 1
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 0, i32 0, i64 1
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 6, i32 0, i32 0, i64 2
  %49 = sext i32 %22 to i64
  %50 = shl nsw i64 %49, 2
  br label %61

; <label>:51:                                     ; preds = %61
  %52 = load i64, i64* %27, align 4
  %53 = load i32, i32* %9, align 4
  %54 = trunc i64 %52 to i32
  %55 = lshr i64 %52, 32
  %56 = trunc i64 %55 to i32
  %57 = mul i32 %54, %53
  %58 = mul i32 %57, %56
  %59 = sext i32 %58 to i64
  %60 = icmp slt i64 %121, %59
  br i1 %60, label %61, label %123

; <label>:61:                                     ; preds = %51, %35
  %62 = phi i64 [ 0, %35 ], [ %121, %51 ]
  %63 = load i32, i32* %36, align 4, !tbaa !37
  %64 = load i32, i32* %37, align 4, !tbaa !39
  %65 = load i32, i32* %38, align 4, !tbaa !40
  %66 = zext i32 %63 to i64
  %67 = mul nsw i64 %66, %62
  %68 = lshr i64 %67, 32
  %69 = trunc i64 %68 to i32
  %70 = trunc i64 %62 to i32
  %71 = sub i32 %70, %69
  %72 = lshr i32 %71, %64
  %73 = add i32 %72, %69
  %74 = lshr i32 %73, %65
  %75 = load i32, i32* %39, align 4, !tbaa !26
  %76 = add nsw i32 %74, %75
  %77 = load i32, i32* %40, align 4, !tbaa !26
  %78 = mul nsw i32 %76, %77
  %79 = load i32, i32* %41, align 4, !tbaa !26
  %80 = mul nsw i32 %74, %79
  %81 = sub nsw i32 %70, %80
  %82 = load i32, i32* %42, align 4, !tbaa !37
  %83 = load i32, i32* %43, align 4, !tbaa !39
  %84 = load i32, i32* %44, align 4, !tbaa !40
  %85 = zext i32 %82 to i64
  %86 = sext i32 %81 to i64
  %87 = mul nsw i64 %86, %85
  %88 = lshr i64 %87, 32
  %89 = trunc i64 %88 to i32
  %90 = sub i32 %81, %89
  %91 = lshr i32 %90, %83
  %92 = add i32 %91, %89
  %93 = lshr i32 %92, %84
  %94 = load i32, i32* %45, align 4, !tbaa !26
  %95 = add nsw i32 %93, %94
  %96 = load i32, i32* %46, align 4, !tbaa !26
  %97 = mul nsw i32 %95, %96
  %98 = load i32, i32* %47, align 4, !tbaa !26
  %99 = mul nsw i32 %93, %98
  %100 = load i32, i32* %48, align 4, !tbaa !26
  %101 = add i32 %78, %81
  %102 = add i32 %101, %100
  %103 = sub i32 %102, %99
  %104 = add i32 %103, %97
  %105 = load %"struct.Eigen::GpuDevice"*, %"struct.Eigen::GpuDevice"** %23, align 8, !tbaa !5
  %106 = getelementptr inbounds float, float* %1, i64 %62
  %107 = bitcast float* %106 to i8*
  %108 = sext i32 %104 to i64
  %109 = getelementptr inbounds float, float* %6, i64 %108
  %110 = bitcast float* %109 to i8*
  %111 = getelementptr inbounds %"struct.Eigen::GpuDevice", %"struct.Eigen::GpuDevice"* %105, i64 0, i32 0
  %112 = load %"class.Eigen::StreamInterface"*, %"class.Eigen::StreamInterface"** %111, align 8, !tbaa !14
  %113 = bitcast %"class.Eigen::StreamInterface"* %112 to i8** (%"class.Eigen::StreamInterface"*)***
  %114 = load i8** (%"class.Eigen::StreamInterface"*)**, i8** (%"class.Eigen::StreamInterface"*)*** %113, align 8, !tbaa !18
  %115 = getelementptr inbounds i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %114, i64 2
  %116 = load i8** (%"class.Eigen::StreamInterface"*)*, i8** (%"class.Eigen::StreamInterface"*)** %115, align 8
  %117 = tail call dereferenceable(8) i8** %116(%"class.Eigen::StreamInterface"* %112)
  %118 = load i8*, i8** %117, align 8, !tbaa !25
  %119 = tail call i64 @cudaMemcpyAsync(i8* %107, i8* %110, i64 %50, i64 333, i8* %118)
  %120 = icmp eq i64 %119, 0
  %121 = add i64 %62, %49
  br i1 %120, label %51, label %122, !prof !36

; <label>:122:                                    ; preds = %61
  tail call void @__assert_rtn(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__func__._ZNK5Eigen9GpuDevice6memcpyEPvPKvm, i64 0, i64 0), i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.4, i64 0, i64 0), i32 218, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0)) #7
  unreachable

; <label>:123:                                    ; preds = %51
  br label %124

; <label>:124:                                    ; preds = %123, %25, %21, %4, %2
  %125 = phi i1 [ true, %21 ], [ true, %4 ], [ true, %2 ], [ false, %25 ], [ false, %123 ]
  ret i1 %125

; <label>:126:                                    ; preds = %14
  %127 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %0, i64 0, i32 5, i32 0, i32 0, i64 0
  %128 = load i32, i32* %127, align 4, !tbaa !26
  %129 = mul nsw i32 %128, %17
  br label %21
}

declare i64 @cudaMemcpyAsync(i8*, i8*, i64, i64, i8*) local_unnamed_addr #2

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @configureKernel(i8*, i8*)

declare void @setKernelArgGpuBuffer(i8*, i32)

declare void @setKernelArgInt32(i32)

declare void @setKernelArgHostsideBuffer(i8*, i32)

declare void @kernelGo()

attributes #0 = { ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { inlinehint ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!2 = !{!3}
!3 = distinct !{!3, !4, !"_ZN10tensorflow7To32BitIN5Eigen9TensorMapINS1_6TensorIKfLi3ELi1EiEELi16ENS1_11MakePointerEEEEENS_6TTypesINT_6ScalarEXsrS9_10NumIndicesEiE11Tensor32BitES9_: argument 0"}
!4 = distinct !{!4, !"_ZN10tensorflow7To32BitIN5Eigen9TensorMapINS1_6TensorIKfLi3ELi1EiEELi16ENS1_11MakePointerEEEEENS_6TTypesINT_6ScalarEXsrS9_10NumIndicesEiE11Tensor32BitES9_"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9}
!9 = distinct !{!9, !10, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEELi0EE5sliceINS_6DSizesIiLi3EEESA_EEKNS_15TensorSlicingOpIKT_KT0_KS6_EERSD_RSF_: argument 0"}
!10 = distinct !{!10, !"_ZNK5Eigen10TensorBaseINS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEELi0EE5sliceINS_6DSizesIiLi3EEESA_EEKNS_15TensorSlicingOpIKT_KT0_KS6_EERSD_RSF_"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"_ZN10tensorflow7To32BitIN5Eigen9TensorMapINS1_6TensorIfLi3ELi1EiEELi16ENS1_11MakePointerEEEEENS_6TTypesINT_6ScalarEXsrS8_10NumIndicesEiE11Tensor32BitES8_: argument 0"}
!13 = distinct !{!13, !"_ZN10tensorflow7To32BitIN5Eigen9TensorMapINS1_6TensorIfLi3ELi1EiEELi16ENS1_11MakePointerEEEEENS_6TTypesINT_6ScalarEXsrS8_10NumIndicesEiE11Tensor32BitES8_"}
!14 = !{!15, !16, i64 0}
!15 = !{!"_ZTSN5Eigen9GpuDeviceE", !16, i64 0, !17, i64 8}
!16 = !{!"any pointer", !6, i64 0}
!17 = !{!"int", !6, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"vtable pointer", !7, i64 0}
!20 = !{!21, !17, i64 68}
!21 = !{!"_ZTS14cudaDeviceProp", !22, i64 0, !22, i64 8, !22, i64 16, !17, i64 24, !17, i64 28, !17, i64 32, !6, i64 36, !6, i64 48, !17, i64 60, !17, i64 64, !17, i64 68, !17, i64 72, !17, i64 76, !17, i64 80, !17, i64 84, !17, i64 88, !6, i64 92}
!22 = !{!"long", !6, i64 0}
!23 = !{!21, !17, i64 60}
!24 = !{!21, !17, i64 32}
!25 = !{!16, !16, i64 0}
!26 = !{!17, !17, i64 0}
!27 = !{!28, !16, i64 0}
!28 = !{!"_ZTSN5Eigen9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEE", !16, i64 0, !29, i64 8}
!29 = !{!"_ZTSN5Eigen6DSizesIiLi3EEE"}
!30 = !{!31, !16, i64 0}
!31 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !16, i64 0, !29, i64 8, !6, i64 24, !6, i64 32}
!32 = !{!33, !16, i64 0}
!33 = !{!"_ZTSN5Eigen9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEE", !16, i64 0, !29, i64 8}
!34 = !{!35, !16, i64 0}
!35 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16ENS_11MakePointerEEENS_9GpuDeviceEEE", !16, i64 0, !29, i64 8, !6, i64 24, !6, i64 32}
!36 = !{!"branch_weights", i32 2000, i32 1}
!37 = !{!38, !17, i64 0}
!38 = !{!"_ZTSN5Eigen8internal16TensorIntDivisorIiLb0EEE", !17, i64 0, !17, i64 4, !17, i64 8}
!39 = !{!38, !17, i64 4}
!40 = !{!38, !17, i64 8}
