; ModuleID = 'test/generated/cuda_sample-hostraw.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct.CUstream_st = type opaque

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [15 x i8] c"hostFloats[2] \00", align 1
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_cuda_sample.cu, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_dtor to void ()*), i8* null }]
@__opencl_sourcecode = global [320 x i8] c"\0A\0A\0Akernel void _Z8setValuePfif(global float* data, int idx, float value) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    bool v2 = v1 == 0;\0A    if(v2) {\0A        goto v4;\0A    } else {\0A        goto v5;\0A    }\0A    v4:;\0A    long v6 = idx;\0A    global float* v7 = (&data[v6]);\0A    v7[0] = value;\0A        goto v5;\0A    v5:;\0A}\0A\00"
@s._Z8setValuePfif = global [16 x i8] c"_Z8setValuePfif\00"

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: uwtable
define void @_Z8setValuePfif(float* %data, i32 %idx, float %value) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store float* %data, float** %1, align 8, !tbaa !1
  store i32 %idx, i32* %2, align 4, !tbaa !5
  store float %value, float* %3, align 4, !tbaa !7
  %4 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %5 = icmp eq i32 0, 0
  br i1 %5, label %6, label %15

; <label>:6                                       ; preds = %0
  %7 = bitcast i32* %2 to i8*
  %loadCudaArg1 = load i32, i32* %2
  %8 = icmp eq i32 0, 0
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %6
  %10 = bitcast float* %3 to i8*
  %loadCudaArg2 = load float, float* %3
  %11 = icmp eq i32 0, 0
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9
  %13 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  %14 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
  call void @configureKernel(i8* %13, i8* %14)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg2)
  call void @_Z8kernelGov()
  br label %15

; <label>:15                                      ; preds = %12, %9, %6, %0
  ret void
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #3 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %gpuFloats = alloca float*, align 8
  %hostFloats = alloca [4 x float], align 16
  %7 = bitcast float** %gpuFloats to i8*
  call void @llvm.lifetime.start(i64 8, i8* %7) #1
  %8 = bitcast float** %gpuFloats to i8**
  %9 = call i32 @cudaMalloc(i8** %8, i64 4096)
  %10 = call i32 @cudaConfigureCall(i64 4294967328, i32 1, i64 4294967328, i32 1, i64 0, %struct.CUstream_st* null)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %27

; <label>:12                                      ; preds = %0
  %13 = bitcast float** %gpuFloats to i64*
  %14 = load i64, i64* %13, align 8, !tbaa !1
  %15 = bitcast float** %4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %15)
  %16 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %16)
  %17 = bitcast float* %6 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %17)
  %18 = bitcast float** %4 to i64*
  store i64 %14, i64* %18, align 8, !tbaa !1
  store i32 2, i32* %5, align 4, !tbaa !5
  store float 1.230000e+02, float* %6, align 4, !tbaa !7
  %loadCudaArg = load float*, float** %4
  %19 = icmp eq i32 0, 0
  br i1 %19, label %20, label %_Z8setValuePfif.exit

; <label>:20                                      ; preds = %12
  %loadCudaArg1 = load i32, i32* %5
  %21 = icmp eq i32 0, 0
  br i1 %21, label %22, label %_Z8setValuePfif.exit

; <label>:22                                      ; preds = %20
  %loadCudaArg2 = load float, float* %6
  %23 = icmp eq i32 0, 0
  br i1 %23, label %24, label %_Z8setValuePfif.exit

; <label>:24                                      ; preds = %22
  %25 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  %26 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
  call void @configureKernel(i8* %25, i8* %26)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg2)
  call void @_Z8kernelGov()
  br label %_Z8setValuePfif.exit

_Z8setValuePfif.exit:                             ; preds = %24, %22, %20, %12
  call void @llvm.lifetime.end(i64 8, i8* %15)
  call void @llvm.lifetime.end(i64 4, i8* %16)
  call void @llvm.lifetime.end(i64 4, i8* %17)
  br label %27

; <label>:27                                      ; preds = %_Z8setValuePfif.exit, %0
  %28 = bitcast [4 x float]* %hostFloats to i8*
  call void @llvm.lifetime.start(i64 16, i8* %28) #1
  %29 = load i8*, i8** %8, align 8, !tbaa !1
  %30 = call i32 @cudaMemcpy(i8* %28, i8* %29, i64 16, i32 2)
  %31 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 14)
  %32 = getelementptr inbounds [4 x float], [4 x float]* %hostFloats, i64 0, i64 2
  %33 = load float, float* %32, align 8, !tbaa !7
  %34 = fpext float %33 to double
  %35 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %34)
  %36 = bitcast %"class.std::basic_ostream"* %35 to i8**
  %37 = load i8*, i8** %36, align 8, !tbaa !9
  %38 = getelementptr i8, i8* %37, i64 -24
  %39 = bitcast i8* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = bitcast %"class.std::basic_ostream"* %35 to i8*
  %42 = getelementptr inbounds i8, i8* %41, i64 %40
  %43 = getelementptr inbounds i8, i8* %42, i64 240
  %44 = bitcast i8* %43 to %"class.std::ctype"**
  %45 = load %"class.std::ctype"*, %"class.std::ctype"** %44, align 8, !tbaa !11
  %46 = icmp eq %"class.std::ctype"* %45, null
  br i1 %46, label %47, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:47                                      ; preds = %27
  call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %27
  %48 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %45, i64 0, i32 8
  %49 = load i8, i8* %48, align 8, !tbaa !14
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %54, label %51

; <label>:51                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %52 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %45, i64 0, i32 9, i64 10
  %53 = load i8, i8* %52, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:54                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %45)
  %55 = bitcast %"class.std::ctype"* %45 to i8 (%"class.std::ctype"*, i8)***
  %56 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %55, align 8, !tbaa !9
  %57 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %56, i64 6
  %58 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %57, align 8
  %59 = call signext i8 %58(%"class.std::ctype"* nonnull %45, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %54, %51
  %.0.i = phi i8 [ %53, %51 ], [ %59, %54 ]
  %60 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %35, i8 signext %.0.i)
  %61 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %60)
  %62 = call i32 @cudaConfigureCall(i64 4294967328, i32 1, i64 4294967328, i32 1, i64 0, %struct.CUstream_st* null)
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %79

; <label>:64                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit
  %65 = bitcast float** %gpuFloats to i64*
  %66 = load i64, i64* %65, align 8, !tbaa !1
  %67 = bitcast float** %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %67)
  %68 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %68)
  %69 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %69)
  %70 = bitcast float** %1 to i64*
  store i64 %66, i64* %70, align 8, !tbaa !1
  store i32 2, i32* %2, align 4, !tbaa !5
  store float 2.220000e+02, float* %3, align 4, !tbaa !7
  %loadCudaArg3 = load float*, float** %1
  %71 = icmp eq i32 0, 0
  br i1 %71, label %72, label %_Z8setValuePfif.exit7

; <label>:72                                      ; preds = %64
  %loadCudaArg4 = load i32, i32* %2
  %73 = icmp eq i32 0, 0
  br i1 %73, label %74, label %_Z8setValuePfif.exit7

; <label>:74                                      ; preds = %72
  %loadCudaArg5 = load float, float* %3
  %75 = icmp eq i32 0, 0
  br i1 %75, label %76, label %_Z8setValuePfif.exit7

; <label>:76                                      ; preds = %74
  %77 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  %78 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
  call void @configureKernel(i8* %77, i8* %78)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg3)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg4)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg5)
  call void @_Z8kernelGov()
  br label %_Z8setValuePfif.exit7

_Z8setValuePfif.exit7:                            ; preds = %76, %74, %72, %64
  call void @llvm.lifetime.end(i64 8, i8* %67)
  call void @llvm.lifetime.end(i64 4, i8* %68)
  call void @llvm.lifetime.end(i64 4, i8* %69)
  br label %79

; <label>:79                                      ; preds = %_Z8setValuePfif.exit7, %_ZNKSt5ctypeIcE5widenEc.exit
  %80 = load i8*, i8** %8, align 8, !tbaa !1
  %81 = call i32 @cudaMemcpy(i8* %28, i8* %80, i64 16, i32 2)
  %82 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 14)
  %83 = load float, float* %32, align 8, !tbaa !7
  %84 = fpext float %83 to double
  %85 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %84)
  %86 = bitcast %"class.std::basic_ostream"* %85 to i8**
  %87 = load i8*, i8** %86, align 8, !tbaa !9
  %88 = getelementptr i8, i8* %87, i64 -24
  %89 = bitcast i8* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = bitcast %"class.std::basic_ostream"* %85 to i8*
  %92 = getelementptr inbounds i8, i8* %91, i64 %90
  %93 = getelementptr inbounds i8, i8* %92, i64 240
  %94 = bitcast i8* %93 to %"class.std::ctype"**
  %95 = load %"class.std::ctype"*, %"class.std::ctype"** %94, align 8, !tbaa !11
  %96 = icmp eq %"class.std::ctype"* %95, null
  br i1 %96, label %97, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit13

; <label>:97                                      ; preds = %79
  call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit13:  ; preds = %79
  %98 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %95, i64 0, i32 8
  %99 = load i8, i8* %98, align 8, !tbaa !14
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %104, label %101

; <label>:101                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit13
  %102 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %95, i64 0, i32 9, i64 10
  %103 = load i8, i8* %102, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit11

; <label>:104                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit13
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %95)
  %105 = bitcast %"class.std::ctype"* %95 to i8 (%"class.std::ctype"*, i8)***
  %106 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %105, align 8, !tbaa !9
  %107 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %106, i64 6
  %108 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %107, align 8
  %109 = call signext i8 %108(%"class.std::ctype"* nonnull %95, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit11

_ZNKSt5ctypeIcE5widenEc.exit11:                   ; preds = %104, %101
  %.0.i10 = phi i8 [ %103, %101 ], [ %109, %104 ]
  %110 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %85, i8 signext %.0.i10)
  %111 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %110)
  store float 4.440000e+02, float* %32, align 8, !tbaa !7
  %112 = load i8*, i8** %8, align 8, !tbaa !1
  %113 = call i32 @cudaMemcpy(i8* %112, i8* nonnull %28, i64 16, i32 1)
  store float 5.550000e+02, float* %32, align 8, !tbaa !7
  %114 = load i8*, i8** %8, align 8, !tbaa !1
  %115 = call i32 @cudaMemcpy(i8* nonnull %28, i8* %114, i64 16, i32 2)
  %116 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 14)
  %117 = load float, float* %32, align 8, !tbaa !7
  %118 = fpext float %117 to double
  %119 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %118)
  %120 = bitcast %"class.std::basic_ostream"* %119 to i8**
  %121 = load i8*, i8** %120, align 8, !tbaa !9
  %122 = getelementptr i8, i8* %121, i64 -24
  %123 = bitcast i8* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = bitcast %"class.std::basic_ostream"* %119 to i8*
  %126 = getelementptr inbounds i8, i8* %125, i64 %124
  %127 = getelementptr inbounds i8, i8* %126, i64 240
  %128 = bitcast i8* %127 to %"class.std::ctype"**
  %129 = load %"class.std::ctype"*, %"class.std::ctype"** %128, align 8, !tbaa !11
  %130 = icmp eq %"class.std::ctype"* %129, null
  br i1 %130, label %131, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12

; <label>:131                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit11
  call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit11
  %132 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %129, i64 0, i32 8
  %133 = load i8, i8* %132, align 8, !tbaa !14
  %134 = icmp eq i8 %133, 0
  br i1 %134, label %138, label %135

; <label>:135                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12
  %136 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %129, i64 0, i32 9, i64 10
  %137 = load i8, i8* %136, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit9

; <label>:138                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %129)
  %139 = bitcast %"class.std::ctype"* %129 to i8 (%"class.std::ctype"*, i8)***
  %140 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %139, align 8, !tbaa !9
  %141 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %140, i64 6
  %142 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %141, align 8
  %143 = call signext i8 %142(%"class.std::ctype"* nonnull %129, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit9

_ZNKSt5ctypeIcE5widenEc.exit9:                    ; preds = %138, %135
  %.0.i8 = phi i8 [ %137, %135 ], [ %143, %138 ]
  %144 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %119, i8 signext %.0.i8)
  %145 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %144)
  %146 = load i8*, i8** %8, align 8, !tbaa !1
  %147 = call i32 @cudaFree(i8* %146)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %28) #1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %7) #1
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

declare i32 @cudaMalloc(i8**, i64) #0

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #0

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #0

declare i32 @cudaFree(i8*) #0

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"*, double) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() #5

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_cuda_sample.cu() #2 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #1
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_ctor(i8* nocapture) #6 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_dtor(i8* nocapture) #6 {
entry:
  ret void
}

declare void @configureKernel(i8*, i8*)

declare void @_Z21setKernelArgFloatStarPf(float*)

declare void @_Z17setKernelArgInt32i(i32)

declare void @_Z17setKernelArgFloatf(float)

declare void @_Z8kernelGov()

attributes #0 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse nounwind readnone }
attributes #7 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !3, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"vtable pointer", !4, i64 0}
!11 = !{!12, !2, i64 240}
!12 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2, i64 216, !3, i64 224, !13, i64 225, !2, i64 232, !2, i64 240, !2, i64 248, !2, i64 256}
!13 = !{!"bool", !3, i64 0}
!14 = !{!15, !3, i64 56}
!15 = !{!"_ZTSSt5ctypeIcE", !2, i64 16, !13, i64 24, !2, i64 32, !2, i64 40, !2, i64 48, !3, i64 56, !3, i64 57, !3, i64 313, !3, i64 569}
!16 = !{!3, !3, i64 0}
