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
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %13, i8* %14, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z15setKernelArgInti(i32 %loadCudaArg1)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg2)
  call void @_Z8kernelGov()
  %14 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
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
  %10 = icmp eq i32 0, 0
  br i1 %10, label %11, label %26

; <label>:11                                      ; preds = %0
  %12 = bitcast float** %gpuFloats to i64*
  %13 = load i64, i64* %12, align 8, !tbaa !1
  %14 = bitcast float** %4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %14)
  %15 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %15)
  %16 = bitcast float* %6 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %16)
  %17 = bitcast float** %4 to i64*
  store i64 %13, i64* %17, align 8, !tbaa !1
  store i32 2, i32* %5, align 4, !tbaa !5
  store float 1.230000e+02, float* %6, align 4, !tbaa !7
  %loadCudaArg = load float*, float** %4
  %18 = icmp eq i32 0, 0
  br i1 %18, label %19, label %_Z8setValuePfif.exit

; <label>:19                                      ; preds = %11
  %loadCudaArg1 = load i32, i32* %5
  %20 = icmp eq i32 0, 0
  br i1 %20, label %21, label %_Z8setValuePfif.exit

; <label>:21                                      ; preds = %19
  %loadCudaArg2 = load float, float* %6
  %22 = icmp eq i32 0, 0
  br i1 %22, label %23, label %_Z8setValuePfif.exit

; <label>:23                                      ; preds = %21
  %24 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %24, i8* %25, i32 32, i32 1, i32 1, i32 32, i32 1, i32 1)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z15setKernelArgInti(i32 %loadCudaArg1)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg2)
  call void @_Z8kernelGov()
  %25 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %_Z8setValuePfif.exit

_Z8setValuePfif.exit:                             ; preds = %23, %21, %19, %11
  call void @llvm.lifetime.end(i64 8, i8* %14)
  call void @llvm.lifetime.end(i64 4, i8* %15)
  call void @llvm.lifetime.end(i64 4, i8* %16)
  br label %26

; <label>:26                                      ; preds = %_Z8setValuePfif.exit, %0
  %27 = bitcast [4 x float]* %hostFloats to i8*
  call void @llvm.lifetime.start(i64 16, i8* %27) #1
  %28 = load i8*, i8** %8, align 8, !tbaa !1
  %29 = call i32 @cudaMemcpy(i8* %27, i8* %28, i64 16, i32 2)
  %30 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 14)
  %31 = getelementptr inbounds [4 x float], [4 x float]* %hostFloats, i64 0, i64 2
  %32 = load float, float* %31, align 8, !tbaa !7
  %33 = fpext float %32 to double
  %34 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %33)
  %35 = bitcast %"class.std::basic_ostream"* %34 to i8**
  %36 = load i8*, i8** %35, align 8, !tbaa !9
  %37 = getelementptr i8, i8* %36, i64 -24
  %38 = bitcast i8* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = bitcast %"class.std::basic_ostream"* %34 to i8*
  %41 = getelementptr inbounds i8, i8* %40, i64 %39
  %42 = getelementptr inbounds i8, i8* %41, i64 240
  %43 = bitcast i8* %42 to %"class.std::ctype"**
  %44 = load %"class.std::ctype"*, %"class.std::ctype"** %43, align 8, !tbaa !11
  %45 = icmp eq %"class.std::ctype"* %44, null
  br i1 %45, label %46, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:46                                      ; preds = %26
  call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %26
  %47 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %44, i64 0, i32 8
  %48 = load i8, i8* %47, align 8, !tbaa !14
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %53, label %50

; <label>:50                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %51 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %44, i64 0, i32 9, i64 10
  %52 = load i8, i8* %51, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:53                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %44)
  %54 = bitcast %"class.std::ctype"* %44 to i8 (%"class.std::ctype"*, i8)***
  %55 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %54, align 8, !tbaa !9
  %56 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %55, i64 6
  %57 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %56, align 8
  %58 = call signext i8 %57(%"class.std::ctype"* nonnull %44, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %53, %50
  %.0.i = phi i8 [ %52, %50 ], [ %58, %53 ]
  %59 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %34, i8 signext %.0.i)
  %60 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %59)
  %61 = icmp eq i32 0, 0
  br i1 %61, label %62, label %77

; <label>:62                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit
  %63 = bitcast float** %gpuFloats to i64*
  %64 = load i64, i64* %63, align 8, !tbaa !1
  %65 = bitcast float** %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %65)
  %66 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %66)
  %67 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %67)
  %68 = bitcast float** %1 to i64*
  store i64 %64, i64* %68, align 8, !tbaa !1
  store i32 2, i32* %2, align 4, !tbaa !5
  store float 2.220000e+02, float* %3, align 4, !tbaa !7
  %loadCudaArg3 = load float*, float** %1
  %69 = icmp eq i32 0, 0
  br i1 %69, label %70, label %_Z8setValuePfif.exit7

; <label>:70                                      ; preds = %62
  %loadCudaArg4 = load i32, i32* %2
  %71 = icmp eq i32 0, 0
  br i1 %71, label %72, label %_Z8setValuePfif.exit7

; <label>:72                                      ; preds = %70
  %loadCudaArg5 = load float, float* %3
  %73 = icmp eq i32 0, 0
  br i1 %73, label %74, label %_Z8setValuePfif.exit7

; <label>:74                                      ; preds = %72
  %75 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %75, i8* %76, i32 32, i32 1, i32 1, i32 32, i32 1, i32 1)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg3)
  call void @_Z15setKernelArgInti(i32 %loadCudaArg4)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg5)
  call void @_Z8kernelGov()
  %76 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %_Z8setValuePfif.exit7

_Z8setValuePfif.exit7:                            ; preds = %74, %72, %70, %62
  call void @llvm.lifetime.end(i64 8, i8* %65)
  call void @llvm.lifetime.end(i64 4, i8* %66)
  call void @llvm.lifetime.end(i64 4, i8* %67)
  br label %77

; <label>:77                                      ; preds = %_Z8setValuePfif.exit7, %_ZNKSt5ctypeIcE5widenEc.exit
  %78 = load i8*, i8** %8, align 8, !tbaa !1
  %79 = call i32 @cudaMemcpy(i8* %27, i8* %78, i64 16, i32 2)
  %80 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 14)
  %81 = load float, float* %31, align 8, !tbaa !7
  %82 = fpext float %81 to double
  %83 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %82)
  %84 = bitcast %"class.std::basic_ostream"* %83 to i8**
  %85 = load i8*, i8** %84, align 8, !tbaa !9
  %86 = getelementptr i8, i8* %85, i64 -24
  %87 = bitcast i8* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = bitcast %"class.std::basic_ostream"* %83 to i8*
  %90 = getelementptr inbounds i8, i8* %89, i64 %88
  %91 = getelementptr inbounds i8, i8* %90, i64 240
  %92 = bitcast i8* %91 to %"class.std::ctype"**
  %93 = load %"class.std::ctype"*, %"class.std::ctype"** %92, align 8, !tbaa !11
  %94 = icmp eq %"class.std::ctype"* %93, null
  br i1 %94, label %95, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10

; <label>:95                                      ; preds = %77
  call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10:  ; preds = %77
  %96 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %93, i64 0, i32 8
  %97 = load i8, i8* %96, align 8, !tbaa !14
  %98 = icmp eq i8 %97, 0
  br i1 %98, label %102, label %99

; <label>:99                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10
  %100 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %93, i64 0, i32 9, i64 10
  %101 = load i8, i8* %100, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit9

; <label>:102                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %93)
  %103 = bitcast %"class.std::ctype"* %93 to i8 (%"class.std::ctype"*, i8)***
  %104 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %103, align 8, !tbaa !9
  %105 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %104, i64 6
  %106 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %105, align 8
  %107 = call signext i8 %106(%"class.std::ctype"* nonnull %93, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit9

_ZNKSt5ctypeIcE5widenEc.exit9:                    ; preds = %102, %99
  %.0.i8 = phi i8 [ %101, %99 ], [ %107, %102 ]
  %108 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %83, i8 signext %.0.i8)
  %109 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %108)
  %110 = load i8*, i8** %8, align 8, !tbaa !1
  %111 = call i32 @cudaFree(i8* %110)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %27) #1
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

declare void @_Z15configureKernelPKcS0_iiiiii(i8*, i8*, i32, i32, i32, i32, i32, i32)

declare void @_Z21setKernelArgFloatStarPf(float*)

declare void @_Z15setKernelArgInti(i32)

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
