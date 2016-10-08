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
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
%struct.CUstream_st = type opaque

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@.str = private unnamed_addr constant [37 x i8] c"test/generated/cuda_sample-device.cl\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.1 = private unnamed_addr constant [15 x i8] c"hostFloats[2] \00", align 1
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
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #3 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
.noexc1.i:
  %0 = alloca float*, align 8
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %__dnew.i.i.i.i = alloca i64, align 8
  %6 = alloca %"class.std::__cxx11::basic_string", align 8
  %gpuFloats = alloca float*, align 8
  %hostFloats = alloca [4 x float], align 16
  %7 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 2
  %8 = bitcast %"class.std::__cxx11::basic_string"* %6 to %union.anon**
  store %union.anon* %7, %union.anon** %8, align 8, !tbaa !9
  %9 = bitcast %union.anon* %7 to i8*
  %10 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %10) #1
  store i64 36, i64* %__dnew.i.i.i.i, align 8, !tbaa !11
  %11 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %6, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
          to label %.noexc unwind label %40

.noexc:                                           ; preds = %.noexc1.i
  %12 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 0, i32 0
  store i8* %11, i8** %12, align 8, !tbaa !13
  %13 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !11
  %14 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 2, i32 0
  store i64 %13, i64* %14, align 8, !tbaa !11
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* nonnull getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), i64 36, i32 1, i1 false) #1
  %15 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %6, i64 0, i32 1
  store i64 %13, i64* %15, align 8, !tbaa !15
  %16 = getelementptr inbounds i8, i8* %11, i64 %13
  store i8 0, i8* %16, align 1, !tbaa !16
  call void @llvm.lifetime.end(i64 8, i8* %10) #1
  invoke void @_Z26hostside_opencl_funcs_initNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.std::__cxx11::basic_string"* nonnull %6)
          to label %17 unwind label %44

; <label>:17                                      ; preds = %.noexc
  %18 = load i8*, i8** %12, align 8, !tbaa !13
  %19 = icmp eq i8* %18, %9
  br i1 %19, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %20

; <label>:20                                      ; preds = %17
  call void @_ZdlPv(i8* %18) #1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %20, %17
  %21 = bitcast float** %gpuFloats to i8*
  call void @llvm.lifetime.start(i64 8, i8* %21) #1
  %22 = bitcast float** %gpuFloats to i8**
  %23 = call i32 @cudaMalloc(i8** %22, i64 4096)
  %24 = icmp eq i32 0, 0
  br i1 %24, label %25, label %53

; <label>:25                                      ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  %26 = bitcast float** %gpuFloats to i64*
  %27 = load i64, i64* %26, align 8, !tbaa !1
  %28 = bitcast float** %3 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %28)
  %29 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %29)
  %30 = bitcast float* %5 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %30)
  %31 = bitcast float** %3 to i64*
  store i64 %27, i64* %31, align 8, !tbaa !1
  store i32 2, i32* %4, align 4, !tbaa !5
  store float 1.230000e+02, float* %5, align 4, !tbaa !7
  %loadCudaArg = load float*, float** %3
  %32 = icmp eq i32 0, 0
  br i1 %32, label %33, label %_Z8setValuePfif.exit

; <label>:33                                      ; preds = %25
  %loadCudaArg1 = load i32, i32* %4
  %34 = icmp eq i32 0, 0
  br i1 %34, label %35, label %_Z8setValuePfif.exit

; <label>:35                                      ; preds = %33
  %loadCudaArg2 = load float, float* %5
  %36 = icmp eq i32 0, 0
  br i1 %36, label %37, label %_Z8setValuePfif.exit

; <label>:37                                      ; preds = %35
  %38 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %38, i8* %39, i32 32, i32 1, i32 1, i32 32, i32 1, i32 1)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z15setKernelArgInti(i32 %loadCudaArg1)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg2)
  call void @_Z8kernelGov()
  %39 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %_Z8setValuePfif.exit

_Z8setValuePfif.exit:                             ; preds = %37, %35, %33, %25
  call void @llvm.lifetime.end(i64 8, i8* %28)
  call void @llvm.lifetime.end(i64 4, i8* %29)
  call void @llvm.lifetime.end(i64 4, i8* %30)
  br label %53

; <label>:40                                      ; preds = %.noexc1.i
  %41 = landingpad { i8*, i32 }
          cleanup
  %42 = extractvalue { i8*, i32 } %41, 0
  %43 = extractvalue { i8*, i32 } %41, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8

; <label>:44                                      ; preds = %.noexc
  %45 = landingpad { i8*, i32 }
          cleanup
  %46 = extractvalue { i8*, i32 } %45, 0
  %47 = extractvalue { i8*, i32 } %45, 1
  %48 = load i8*, i8** %12, align 8, !tbaa !13
  %49 = icmp eq i8* %48, %9
  br i1 %49, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8, label %50

; <label>:50                                      ; preds = %44
  call void @_ZdlPv(i8* %48) #1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8: ; preds = %50, %44, %40
  %.07 = phi i32 [ %43, %40 ], [ %47, %44 ], [ %47, %50 ]
  %.0 = phi i8* [ %42, %40 ], [ %46, %44 ], [ %46, %50 ]
  %51 = insertvalue { i8*, i32 } undef, i8* %.0, 0
  %52 = insertvalue { i8*, i32 } %51, i32 %.07, 1
  resume { i8*, i32 } %52

; <label>:53                                      ; preds = %_Z8setValuePfif.exit, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  %54 = bitcast [4 x float]* %hostFloats to i8*
  call void @llvm.lifetime.start(i64 16, i8* %54) #1
  %55 = load i8*, i8** %22, align 8, !tbaa !1
  %56 = call i32 @cudaMemcpy(i8* %54, i8* %55, i64 16, i32 2)
  %57 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i64 14)
  %58 = getelementptr inbounds [4 x float], [4 x float]* %hostFloats, i64 0, i64 2
  %59 = load float, float* %58, align 8, !tbaa !7
  %60 = fpext float %59 to double
  %61 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %60)
  %62 = bitcast %"class.std::basic_ostream"* %61 to i8**
  %63 = load i8*, i8** %62, align 8, !tbaa !17
  %64 = getelementptr i8, i8* %63, i64 -24
  %65 = bitcast i8* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = bitcast %"class.std::basic_ostream"* %61 to i8*
  %68 = getelementptr inbounds i8, i8* %67, i64 %66
  %69 = getelementptr inbounds i8, i8* %68, i64 240
  %70 = bitcast i8* %69 to %"class.std::ctype"**
  %71 = load %"class.std::ctype"*, %"class.std::ctype"** %70, align 8, !tbaa !19
  %72 = icmp eq %"class.std::ctype"* %71, null
  br i1 %72, label %73, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12

; <label>:73                                      ; preds = %53
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12:  ; preds = %53
  %74 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %71, i64 0, i32 8
  %75 = load i8, i8* %74, align 8, !tbaa !22
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %80, label %77

; <label>:77                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12
  %78 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %71, i64 0, i32 9, i64 10
  %79 = load i8, i8* %78, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit10

; <label>:80                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %71)
  %81 = bitcast %"class.std::ctype"* %71 to i8 (%"class.std::ctype"*, i8)***
  %82 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %81, align 8, !tbaa !17
  %83 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %82, i64 6
  %84 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %83, align 8
  %85 = call signext i8 %84(%"class.std::ctype"* nonnull %71, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit10

_ZNKSt5ctypeIcE5widenEc.exit10:                   ; preds = %80, %77
  %.0.i9 = phi i8 [ %79, %77 ], [ %85, %80 ]
  %86 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %61, i8 signext %.0.i9)
  %87 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %86)
  %88 = icmp eq i32 0, 0
  br i1 %88, label %89, label %104

; <label>:89                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit10
  %90 = bitcast float** %gpuFloats to i64*
  %91 = load i64, i64* %90, align 8, !tbaa !1
  %92 = bitcast float** %0 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %92)
  %93 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %93)
  %94 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %94)
  %95 = bitcast float** %0 to i64*
  store i64 %91, i64* %95, align 8, !tbaa !1
  store i32 2, i32* %1, align 4, !tbaa !5
  store float 2.220000e+02, float* %2, align 4, !tbaa !7
  %loadCudaArg3 = load float*, float** %0
  %96 = icmp eq i32 0, 0
  br i1 %96, label %97, label %_Z8setValuePfif.exit11

; <label>:97                                      ; preds = %89
  %loadCudaArg4 = load i32, i32* %1
  %98 = icmp eq i32 0, 0
  br i1 %98, label %99, label %_Z8setValuePfif.exit11

; <label>:99                                      ; preds = %97
  %loadCudaArg5 = load float, float* %2
  %100 = icmp eq i32 0, 0
  br i1 %100, label %101, label %_Z8setValuePfif.exit11

; <label>:101                                     ; preds = %99
  %102 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %102, i8* %103, i32 32, i32 1, i32 1, i32 32, i32 1, i32 1)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg3)
  call void @_Z15setKernelArgInti(i32 %loadCudaArg4)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg5)
  call void @_Z8kernelGov()
  %103 = getelementptr inbounds [320 x i8], [320 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %_Z8setValuePfif.exit11

_Z8setValuePfif.exit11:                           ; preds = %101, %99, %97, %89
  call void @llvm.lifetime.end(i64 8, i8* %92)
  call void @llvm.lifetime.end(i64 4, i8* %93)
  call void @llvm.lifetime.end(i64 4, i8* %94)
  br label %104

; <label>:104                                     ; preds = %_Z8setValuePfif.exit11, %_ZNKSt5ctypeIcE5widenEc.exit10
  %105 = load i8*, i8** %22, align 8, !tbaa !1
  %106 = call i32 @cudaMemcpy(i8* %54, i8* %105, i64 16, i32 2)
  %107 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i64 14)
  %108 = load float, float* %58, align 8, !tbaa !7
  %109 = fpext float %108 to double
  %110 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %109)
  %111 = bitcast %"class.std::basic_ostream"* %110 to i8**
  %112 = load i8*, i8** %111, align 8, !tbaa !17
  %113 = getelementptr i8, i8* %112, i64 -24
  %114 = bitcast i8* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = bitcast %"class.std::basic_ostream"* %110 to i8*
  %117 = getelementptr inbounds i8, i8* %116, i64 %115
  %118 = getelementptr inbounds i8, i8* %117, i64 240
  %119 = bitcast i8* %118 to %"class.std::ctype"**
  %120 = load %"class.std::ctype"*, %"class.std::ctype"** %119, align 8, !tbaa !19
  %121 = icmp eq %"class.std::ctype"* %120, null
  br i1 %121, label %122, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:122                                     ; preds = %104
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %104
  %123 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %120, i64 0, i32 8
  %124 = load i8, i8* %123, align 8, !tbaa !22
  %125 = icmp eq i8 %124, 0
  br i1 %125, label %129, label %126

; <label>:126                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %127 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %120, i64 0, i32 9, i64 10
  %128 = load i8, i8* %127, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:129                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %120)
  %130 = bitcast %"class.std::ctype"* %120 to i8 (%"class.std::ctype"*, i8)***
  %131 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %130, align 8, !tbaa !17
  %132 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %131, i64 6
  %133 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %132, align 8
  %134 = call signext i8 %133(%"class.std::ctype"* nonnull %120, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %129, %126
  %.0.i = phi i8 [ %128, %126 ], [ %134, %129 ]
  %135 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %110, i8 signext %.0.i)
  %136 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %135)
  %137 = load i8*, i8** %22, align 8, !tbaa !1
  %138 = call i32 @cudaFree(i8* %137)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %54) #1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21) #1
  ret i32 0
}

declare void @_Z26hostside_opencl_funcs_initNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(%"class.std::__cxx11::basic_string"*) #0

declare i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

declare i32 @cudaMalloc(i8**, i64) #0

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #0

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #0

declare i32 @cudaFree(i8*) #0

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

declare i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"*, i64* dereferenceable(8), i64) #0

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #5

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"*, double) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() #6

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_cuda_sample.cu() #2 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #1
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_ctor(i8* nocapture) #7 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_dtor(i8* nocapture) #7 {
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
attributes #5 = { nobuiltin nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse nounwind readnone }
attributes #8 = { noreturn }

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
!9 = !{!10, !2, i64 0}
!10 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !2, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !3, i64 0}
!13 = !{!14, !2, i64 0}
!14 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !10, i64 0, !12, i64 8, !3, i64 16}
!15 = !{!14, !12, i64 8}
!16 = !{!3, !3, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"vtable pointer", !4, i64 0}
!19 = !{!20, !2, i64 240}
!20 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2, i64 216, !3, i64 224, !21, i64 225, !2, i64 232, !2, i64 240, !2, i64 248, !2, i64 256}
!21 = !{!"bool", !3, i64 0}
!22 = !{!23, !3, i64 56}
!23 = !{!"_ZTSSt5ctypeIcE", !2, i64 16, !21, i64 24, !2, i64 32, !2, i64 40, !2, i64 48, !3, i64 56, !3, i64 57, !3, i64 313, !3, i64 569}
