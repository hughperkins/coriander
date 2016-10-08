; ModuleID = 'test/cuda_sample.cu'
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
  %5 = call i32 @cudaSetupArgument(i8* %4, i64 8, i64 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %17

; <label>:7                                       ; preds = %0
  %8 = bitcast i32* %2 to i8*
  %9 = call i32 @cudaSetupArgument(i8* %8, i64 4, i64 8)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %7
  %12 = bitcast float* %3 to i8*
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 12)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %11
  %16 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32, float)* @_Z8setValuePfif to i8*))
  br label %17

; <label>:17                                      ; preds = %15, %11, %7, %0
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
          to label %.noexc unwind label %43

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
          to label %17 unwind label %47

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
  %24 = call i32 @cudaConfigureCall(i64 4294967328, i32 1, i64 4294967328, i32 1, i64 0, %struct.CUstream_st* null)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %56

; <label>:26                                      ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  %27 = bitcast float** %gpuFloats to i64*
  %28 = load i64, i64* %27, align 8, !tbaa !1
  %29 = bitcast float** %3 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %29)
  %30 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %30)
  %31 = bitcast float* %5 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %31)
  %32 = bitcast float** %3 to i64*
  store i64 %28, i64* %32, align 8, !tbaa !1
  store i32 2, i32* %4, align 4, !tbaa !5
  store float 1.230000e+02, float* %5, align 4, !tbaa !7
  %33 = call i32 @cudaSetupArgument(i8* %29, i64 8, i64 0)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %_Z8setValuePfif.exit

; <label>:35                                      ; preds = %26
  %36 = call i32 @cudaSetupArgument(i8* %30, i64 4, i64 8)
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %_Z8setValuePfif.exit

; <label>:38                                      ; preds = %35
  %39 = call i32 @cudaSetupArgument(i8* %31, i64 4, i64 12)
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %_Z8setValuePfif.exit

; <label>:41                                      ; preds = %38
  %42 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32, float)* @_Z8setValuePfif to i8*))
  br label %_Z8setValuePfif.exit

_Z8setValuePfif.exit:                             ; preds = %26, %35, %38, %41
  call void @llvm.lifetime.end(i64 8, i8* %29)
  call void @llvm.lifetime.end(i64 4, i8* %30)
  call void @llvm.lifetime.end(i64 4, i8* %31)
  br label %56

; <label>:43                                      ; preds = %.noexc1.i
  %44 = landingpad { i8*, i32 }
          cleanup
  %45 = extractvalue { i8*, i32 } %44, 0
  %46 = extractvalue { i8*, i32 } %44, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8

; <label>:47                                      ; preds = %.noexc
  %48 = landingpad { i8*, i32 }
          cleanup
  %49 = extractvalue { i8*, i32 } %48, 0
  %50 = extractvalue { i8*, i32 } %48, 1
  %51 = load i8*, i8** %12, align 8, !tbaa !13
  %52 = icmp eq i8* %51, %9
  br i1 %52, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8, label %53

; <label>:53                                      ; preds = %47
  call void @_ZdlPv(i8* %51) #1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit8: ; preds = %53, %47, %43
  %.07 = phi i32 [ %46, %43 ], [ %50, %47 ], [ %50, %53 ]
  %.0 = phi i8* [ %45, %43 ], [ %49, %47 ], [ %49, %53 ]
  %54 = insertvalue { i8*, i32 } undef, i8* %.0, 0
  %55 = insertvalue { i8*, i32 } %54, i32 %.07, 1
  resume { i8*, i32 } %55

; <label>:56                                      ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %_Z8setValuePfif.exit
  %57 = bitcast [4 x float]* %hostFloats to i8*
  call void @llvm.lifetime.start(i64 16, i8* %57) #1
  %58 = load i8*, i8** %22, align 8, !tbaa !1
  %59 = call i32 @cudaMemcpy(i8* %57, i8* %58, i64 16, i32 2)
  %60 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i64 14)
  %61 = getelementptr inbounds [4 x float], [4 x float]* %hostFloats, i64 0, i64 2
  %62 = load float, float* %61, align 8, !tbaa !7
  %63 = fpext float %62 to double
  %64 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %63)
  %65 = bitcast %"class.std::basic_ostream"* %64 to i8**
  %66 = load i8*, i8** %65, align 8, !tbaa !17
  %67 = getelementptr i8, i8* %66, i64 -24
  %68 = bitcast i8* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = bitcast %"class.std::basic_ostream"* %64 to i8*
  %71 = getelementptr inbounds i8, i8* %70, i64 %69
  %72 = getelementptr inbounds i8, i8* %71, i64 240
  %73 = bitcast i8* %72 to %"class.std::ctype"**
  %74 = load %"class.std::ctype"*, %"class.std::ctype"** %73, align 8, !tbaa !19
  %75 = icmp eq %"class.std::ctype"* %74, null
  br i1 %75, label %76, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12

; <label>:76                                      ; preds = %56
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12:  ; preds = %56
  %77 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %74, i64 0, i32 8
  %78 = load i8, i8* %77, align 8, !tbaa !22
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %83, label %80

; <label>:80                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12
  %81 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %74, i64 0, i32 9, i64 10
  %82 = load i8, i8* %81, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit10

; <label>:83                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit12
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %74)
  %84 = bitcast %"class.std::ctype"* %74 to i8 (%"class.std::ctype"*, i8)***
  %85 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %84, align 8, !tbaa !17
  %86 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %85, i64 6
  %87 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %86, align 8
  %88 = call signext i8 %87(%"class.std::ctype"* nonnull %74, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit10

_ZNKSt5ctypeIcE5widenEc.exit10:                   ; preds = %80, %83
  %.0.i9 = phi i8 [ %82, %80 ], [ %88, %83 ]
  %89 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %64, i8 signext %.0.i9)
  %90 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %89)
  %91 = call i32 @cudaConfigureCall(i64 4294967328, i32 1, i64 4294967328, i32 1, i64 0, %struct.CUstream_st* null)
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %110

; <label>:93                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit10
  %94 = bitcast float** %gpuFloats to i64*
  %95 = load i64, i64* %94, align 8, !tbaa !1
  %96 = bitcast float** %0 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %96)
  %97 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %97)
  %98 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %98)
  %99 = bitcast float** %0 to i64*
  store i64 %95, i64* %99, align 8, !tbaa !1
  store i32 2, i32* %1, align 4, !tbaa !5
  store float 2.220000e+02, float* %2, align 4, !tbaa !7
  %100 = call i32 @cudaSetupArgument(i8* %96, i64 8, i64 0)
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %_Z8setValuePfif.exit11

; <label>:102                                     ; preds = %93
  %103 = call i32 @cudaSetupArgument(i8* %97, i64 4, i64 8)
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %_Z8setValuePfif.exit11

; <label>:105                                     ; preds = %102
  %106 = call i32 @cudaSetupArgument(i8* %98, i64 4, i64 12)
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %_Z8setValuePfif.exit11

; <label>:108                                     ; preds = %105
  %109 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32, float)* @_Z8setValuePfif to i8*))
  br label %_Z8setValuePfif.exit11

_Z8setValuePfif.exit11:                           ; preds = %93, %102, %105, %108
  call void @llvm.lifetime.end(i64 8, i8* %96)
  call void @llvm.lifetime.end(i64 4, i8* %97)
  call void @llvm.lifetime.end(i64 4, i8* %98)
  br label %110

; <label>:110                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit10, %_Z8setValuePfif.exit11
  %111 = load i8*, i8** %22, align 8, !tbaa !1
  %112 = call i32 @cudaMemcpy(i8* %57, i8* %111, i64 16, i32 2)
  %113 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i64 14)
  %114 = load float, float* %61, align 8, !tbaa !7
  %115 = fpext float %114 to double
  %116 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %115)
  %117 = bitcast %"class.std::basic_ostream"* %116 to i8**
  %118 = load i8*, i8** %117, align 8, !tbaa !17
  %119 = getelementptr i8, i8* %118, i64 -24
  %120 = bitcast i8* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = bitcast %"class.std::basic_ostream"* %116 to i8*
  %123 = getelementptr inbounds i8, i8* %122, i64 %121
  %124 = getelementptr inbounds i8, i8* %123, i64 240
  %125 = bitcast i8* %124 to %"class.std::ctype"**
  %126 = load %"class.std::ctype"*, %"class.std::ctype"** %125, align 8, !tbaa !19
  %127 = icmp eq %"class.std::ctype"* %126, null
  br i1 %127, label %128, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:128                                     ; preds = %110
  call void @_ZSt16__throw_bad_castv() #8
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %110
  %129 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %126, i64 0, i32 8
  %130 = load i8, i8* %129, align 8, !tbaa !22
  %131 = icmp eq i8 %130, 0
  br i1 %131, label %135, label %132

; <label>:132                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %133 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %126, i64 0, i32 9, i64 10
  %134 = load i8, i8* %133, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:135                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %126)
  %136 = bitcast %"class.std::ctype"* %126 to i8 (%"class.std::ctype"*, i8)***
  %137 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %136, align 8, !tbaa !17
  %138 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %137, i64 6
  %139 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %138, align 8
  %140 = call signext i8 %139(%"class.std::ctype"* nonnull %126, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %132, %135
  %.0.i = phi i8 [ %134, %132 ], [ %140, %135 ]
  %141 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %116, i8 signext %.0.i)
  %142 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %141)
  %143 = load i8*, i8** %22, align 8, !tbaa !1
  %144 = call i32 @cudaFree(i8* %143)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %57) #1
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
