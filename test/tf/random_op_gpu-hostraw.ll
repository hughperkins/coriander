; ModuleID = 'tensorflow/core/kernels/random_op_gpu.cu.cc'
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
  br i1 %50, label %51, label %70

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
  %56 = call i32 @cudaSetupArgument(i8* nonnull %53, i64 24, i64 0)
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %69

; <label>:58:                                     ; preds = %51
  %59 = call i32 @cudaSetupArgument(i8* nonnull %54, i64 8, i64 24)
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %69

; <label>:61:                                     ; preds = %58
  %62 = call i32 @cudaSetupArgument(i8* nonnull %55, i64 8, i64 32)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %69

; <label>:64:                                     ; preds = %61
  %65 = call i32 @cudaSetupArgument(i8* nonnull %7, i64 1, i64 40)
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %64
  %68 = call i32 @cudaLaunch(i8* bitcast (void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ to i8*))
  br label %69

; <label>:69:                                     ; preds = %51, %58, %61, %64, %67
  call void @llvm.lifetime.end(i64 24, i8* nonnull %53)
  call void @llvm.lifetime.end(i64 1, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %54)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %55)
  br label %70

; <label>:70:                                     ; preds = %6, %69
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
  %8 = call i32 @cudaSetupArgument(i8* nonnull %7, i64 24, i64 0)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %23

; <label>:10:                                     ; preds = %3
  %11 = bitcast float** %5 to i8*
  %12 = call i32 @cudaSetupArgument(i8* nonnull %11, i64 8, i64 24)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %23

; <label>:14:                                     ; preds = %10
  %15 = bitcast i64* %6 to i8*
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 8, i64 32)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %14
  %19 = call i32 @cudaSetupArgument(i8* nonnull %4, i64 1, i64 40)
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = call i32 @cudaLaunch(i8* bitcast (void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random19UniformDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ to i8*))
  br label %23

; <label>:23:                                     ; preds = %21, %18, %14, %10, %3
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
  br i1 %50, label %51, label %70

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
  %56 = call i32 @cudaSetupArgument(i8* nonnull %53, i64 24, i64 0)
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %69

; <label>:58:                                     ; preds = %51
  %59 = call i32 @cudaSetupArgument(i8* nonnull %54, i64 8, i64 24)
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %69

; <label>:61:                                     ; preds = %58
  %62 = call i32 @cudaSetupArgument(i8* nonnull %55, i64 8, i64 32)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %69

; <label>:64:                                     ; preds = %61
  %65 = call i32 @cudaSetupArgument(i8* nonnull %7, i64 1, i64 40)
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %64
  %68 = call i32 @cudaLaunch(i8* bitcast (void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ to i8*))
  br label %69

; <label>:69:                                     ; preds = %51, %58, %61, %64, %67
  call void @llvm.lifetime.end(i64 24, i8* nonnull %53)
  call void @llvm.lifetime.end(i64 1, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %54)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %55)
  br label %70

; <label>:70:                                     ; preds = %6, %69
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
  %8 = call i32 @cudaSetupArgument(i8* nonnull %7, i64 24, i64 0)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %23

; <label>:10:                                     ; preds = %3
  %11 = bitcast float** %5 to i8*
  %12 = call i32 @cudaSetupArgument(i8* nonnull %11, i64 8, i64 24)
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %23

; <label>:14:                                     ; preds = %10
  %15 = bitcast i64* %6 to i8*
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 8, i64 32)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %14
  %19 = call i32 @cudaSetupArgument(i8* nonnull %4, i64 1, i64 40)
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = call i32 @cudaLaunch(i8* bitcast (void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random18NormalDistributionINS2_12PhiloxRandomEfEEEEvS4_PNT_17ResultElementTypeExS6_ to i8*))
  br label %23

; <label>:23:                                     ; preds = %21, %18, %14, %10, %3
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
  %59 = call i32 @cudaSetupArgument(i8* nonnull %54, i64 24, i64 0)
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %72

; <label>:61:                                     ; preds = %52
  %62 = call i32 @cudaSetupArgument(i8* nonnull %56, i64 8, i64 24)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %72

; <label>:64:                                     ; preds = %61
  %65 = call i32 @cudaSetupArgument(i8* nonnull %57, i64 8, i64 32)
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %72

; <label>:67:                                     ; preds = %64
  %68 = call i32 @cudaSetupArgument(i8* nonnull %55, i64 4, i64 40)
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %72

; <label>:70:                                     ; preds = %67
  %71 = call i32 @cudaLaunch(i8* bitcast (void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, float)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_ to i8*))
  br label %72

; <label>:72:                                     ; preds = %52, %61, %64, %67, %70
  call void @llvm.lifetime.end(i64 24, i8* nonnull %54)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %55)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %56)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %57)
  br label %73

; <label>:73:                                     ; preds = %7, %72
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
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 24, i64 0)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %26

; <label>:12:                                     ; preds = %4
  %13 = bitcast float** %6 to i8*
  %14 = call i32 @cudaSetupArgument(i8* nonnull %13, i64 8, i64 24)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %26

; <label>:16:                                     ; preds = %12
  %17 = bitcast i64* %7 to i8*
  %18 = call i32 @cudaSetupArgument(i8* nonnull %17, i64 8, i64 32)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %16
  %21 = bitcast %"class.tensorflow::random::TruncatedNormalDistribution"* %5 to i8*
  %22 = call i32 @cudaSetupArgument(i8* nonnull %21, i64 4, i64 40)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %20
  %25 = call i32 @cudaLaunch(i8* bitcast (void (%"class.tensorflow::random::PhiloxRandom"*, float*, i64, float)* @_ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_ to i8*))
  br label %26

; <label>:26:                                     ; preds = %24, %20, %16, %12, %4
  ret void
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

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
