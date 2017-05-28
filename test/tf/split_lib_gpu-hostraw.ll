; ModuleID = 'tensorflow/core/kernels/split_lib_gpu.cu.cc'
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

@__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESB_KNS3_INS4_IKfLi3ELi1EiEELi16ES6_EEEEEENS_9GpuDeviceELb0EE3runERSJ_RKSK_ = private unnamed_addr constant [4 x i8] c"run\00", align 1
@.str = private unnamed_addr constant [75 x i8] c"external/eigen_archive/unsupported/Eigen/CXX11/src/Tensor/TensorExecutor.h\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"cudaGetLastError() == cudaSuccess\00", align 1
@__func__._ZNK5Eigen9GpuDevice6memcpyEPvPKvm = private unnamed_addr constant [7 x i8] c"memcpy\00", align 1
@.str.4 = private unnamed_addr constant [77 x i8] c"external/eigen_archive/unsupported/Eigen/CXX11/src/Tensor/TensorDeviceCuda.h\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"err == cudaSuccess\00", align 1
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

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
  br i1 %70, label %71, label %95

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
  %78 = call i32 @cudaSetupArgument(i8* nonnull %74, i64 8, i64 0)
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %94

; <label>:80:                                     ; preds = %71
  %81 = call i32 @cudaSetupArgument(i8* nonnull %75, i64 4, i64 8)
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %94

; <label>:83:                                     ; preds = %80
  %84 = call i32 @cudaSetupArgument(i8* nonnull %76, i64 4, i64 12)
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %94

; <label>:86:                                     ; preds = %83
  %87 = call i32 @cudaSetupArgument(i8* nonnull %77, i64 4, i64 16)
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %94

; <label>:89:                                     ; preds = %86
  %90 = call i32 @cudaSetupArgument(i8* nonnull %73, i64 80, i64 24)
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %94

; <label>:92:                                     ; preds = %89
  %93 = call i32 @cudaLaunch(i8* bitcast (void (
      float*,
      i32,
      i32,
      i32,
      %"struct.tensorflow::CudaDeviceArrayStruct"*
    )* @_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE to i8*))
  br label %94

; <label>:94:                                     ; preds = %71, %80, %83, %86, %89, %92
  call void @llvm.lifetime.end(i64 80, i8* nonnull %73)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %74)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %75)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %76)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %77)
  br label %95

; <label>:95:                                     ; preds = %7, %94
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
  %11 = call i32 @cudaSetupArgument(i8* nonnull %10, i64 8, i64 0)
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %31

; <label>:13:                                     ; preds = %5
  %14 = bitcast i32* %7 to i8*
  %15 = call i32 @cudaSetupArgument(i8* nonnull %14, i64 4, i64 8)
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %31

; <label>:17:                                     ; preds = %13
  %18 = bitcast i32* %8 to i8*
  %19 = call i32 @cudaSetupArgument(i8* nonnull %18, i64 4, i64 12)
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %31

; <label>:21:                                     ; preds = %17
  %22 = bitcast i32* %9 to i8*
  %23 = call i32 @cudaSetupArgument(i8* nonnull %22, i64 4, i64 16)
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %31

; <label>:25:                                     ; preds = %21
  %26 = bitcast %"struct.tensorflow::CudaDeviceArrayStruct"* %4 to i8*
  %27 = call i32 @cudaSetupArgument(i8* nonnull %26, i64 80, i64 24)
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %25
  %30 = call i32 @cudaLaunch(i8* bitcast (void (float*, i32, i32, i32, %"struct.tensorflow::CudaDeviceArrayStruct"*)* @_ZN10tensorflow12_GLOBAL__N_113SplitOpKernelIfEEvPKT_iiiNS_21CudaDeviceArrayStructIPS2_Li8EEE to i8*))
  br label %31

; <label>:31:                                     ; preds = %29, %25, %21, %17, %13, %5
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
  br i1 %102, label %103, label %175

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
  br i1 %159, label %160, label %171

; <label>:160:                                    ; preds = %103
  %161 = bitcast %"struct.Eigen::TensorEvaluator"* %4 to i8*
  call void @llvm.lifetime.start(i64 176, i8* nonnull %161)
  %162 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %162)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %161, i8* nonnull %6, i64 176, i32 8, i1 false)
  store i32 %139, i32* %3, align 4, !tbaa !26
  %163 = call i32 @cudaSetupArgument(i8* nonnull %161, i64 176, i64 0)
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %170

; <label>:165:                                    ; preds = %160
  %166 = call i32 @cudaSetupArgument(i8* nonnull %162, i64 4, i64 176)
  %167 = icmp eq i32 %166, 0
  br i1 %167, label %168, label %170

; <label>:168:                                    ; preds = %165
  %169 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %170

; <label>:170:                                    ; preds = %160, %165, %168
  call void @llvm.lifetime.end(i64 176, i8* nonnull %161)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %162)
  br label %171

; <label>:171:                                    ; preds = %103, %170
  %172 = call i64 @cudaGetLastError()
  %173 = icmp eq i64 %172, 0
  br i1 %173, label %175, label %174, !prof !36

; <label>:174:                                    ; preds = %171
  call void @__assert_rtn(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__func__._ZN5Eigen8internal14TensorExecutorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESB_KNS3_INS4_IKfLi3ELi1EiEELi16ES6_EEEEEENS_9GpuDeviceELb0EE3runERSJ_RKSK_, i64 0, i64 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i64 0, i64 0), i32 262, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0)) #7
  unreachable

; <label>:175:                                    ; preds = %171, %2
  call void @llvm.lifetime.end(i64 176, i8* nonnull %6) #6
  ret void
}

; Function Attrs: ssp uwtable
define linkonce_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval align 8, i32) #0 {
  %3 = alloca i32, align 4
  store i32 %1, i32* %3, align 4, !tbaa !26
  %4 = bitcast %"struct.Eigen::TensorEvaluator"* %0 to i8*
  %5 = call i32 @cudaSetupArgument(i8* nonnull %4, i64 176, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %8 = bitcast i32* %3 to i8*
  %9 = call i32 @cudaSetupArgument(i8* nonnull %8, i64 4, i64 176)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = call i32 @cudaLaunch(i8* bitcast (void (%"struct.Eigen::TensorEvaluator"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16ENS_11MakePointerEEEKNS_15TensorSlicingOpIKNS_6DSizesIiLi3EEESC_KNS4_INS5_IKfLi3ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ to i8*))
  br label %13

; <label>:13:                                     ; preds = %11, %7, %2
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

; <label>:61:                                     ; preds = %35, %51
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

; <label>:124:                                    ; preds = %123, %25, %2, %4, %21
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
