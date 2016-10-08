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
%struct.CUstream_st = type opaque

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [15 x i8] c"hostFloats[2] \00", align 1
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
  br i1 %11, label %12, label %29

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
  %19 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 0)
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %_Z8setValuePfif.exit

; <label>:21                                      ; preds = %12
  %22 = call i32 @cudaSetupArgument(i8* %16, i64 4, i64 8)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %_Z8setValuePfif.exit

; <label>:24                                      ; preds = %21
  %25 = call i32 @cudaSetupArgument(i8* %17, i64 4, i64 12)
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %_Z8setValuePfif.exit

; <label>:27                                      ; preds = %24
  %28 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32, float)* @_Z8setValuePfif to i8*))
  br label %_Z8setValuePfif.exit

_Z8setValuePfif.exit:                             ; preds = %12, %21, %24, %27
  call void @llvm.lifetime.end(i64 8, i8* %15)
  call void @llvm.lifetime.end(i64 4, i8* %16)
  call void @llvm.lifetime.end(i64 4, i8* %17)
  br label %29

; <label>:29                                      ; preds = %0, %_Z8setValuePfif.exit
  %30 = bitcast [4 x float]* %hostFloats to i8*
  call void @llvm.lifetime.start(i64 16, i8* %30) #1
  %31 = load i8*, i8** %8, align 8, !tbaa !1
  %32 = call i32 @cudaMemcpy(i8* %30, i8* %31, i64 16, i32 2)
  %33 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 14)
  %34 = getelementptr inbounds [4 x float], [4 x float]* %hostFloats, i64 0, i64 2
  %35 = load float, float* %34, align 8, !tbaa !7
  %36 = fpext float %35 to double
  %37 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %36)
  %38 = bitcast %"class.std::basic_ostream"* %37 to i8**
  %39 = load i8*, i8** %38, align 8, !tbaa !9
  %40 = getelementptr i8, i8* %39, i64 -24
  %41 = bitcast i8* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = bitcast %"class.std::basic_ostream"* %37 to i8*
  %44 = getelementptr inbounds i8, i8* %43, i64 %42
  %45 = getelementptr inbounds i8, i8* %44, i64 240
  %46 = bitcast i8* %45 to %"class.std::ctype"**
  %47 = load %"class.std::ctype"*, %"class.std::ctype"** %46, align 8, !tbaa !11
  %48 = icmp eq %"class.std::ctype"* %47, null
  br i1 %48, label %49, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:49                                      ; preds = %29
  call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %29
  %50 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %47, i64 0, i32 8
  %51 = load i8, i8* %50, align 8, !tbaa !14
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %56, label %53

; <label>:53                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %54 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %47, i64 0, i32 9, i64 10
  %55 = load i8, i8* %54, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:56                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %47)
  %57 = bitcast %"class.std::ctype"* %47 to i8 (%"class.std::ctype"*, i8)***
  %58 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %57, align 8, !tbaa !9
  %59 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %58, i64 6
  %60 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %59, align 8
  %61 = call signext i8 %60(%"class.std::ctype"* nonnull %47, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %53, %56
  %.0.i = phi i8 [ %55, %53 ], [ %61, %56 ]
  %62 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %37, i8 signext %.0.i)
  %63 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %62)
  %64 = call i32 @cudaConfigureCall(i64 4294967328, i32 1, i64 4294967328, i32 1, i64 0, %struct.CUstream_st* null)
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %83

; <label>:66                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit
  %67 = bitcast float** %gpuFloats to i64*
  %68 = load i64, i64* %67, align 8, !tbaa !1
  %69 = bitcast float** %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %69)
  %70 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %70)
  %71 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %71)
  %72 = bitcast float** %1 to i64*
  store i64 %68, i64* %72, align 8, !tbaa !1
  store i32 2, i32* %2, align 4, !tbaa !5
  store float 2.220000e+02, float* %3, align 4, !tbaa !7
  %73 = call i32 @cudaSetupArgument(i8* %69, i64 8, i64 0)
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %_Z8setValuePfif.exit7

; <label>:75                                      ; preds = %66
  %76 = call i32 @cudaSetupArgument(i8* %70, i64 4, i64 8)
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %_Z8setValuePfif.exit7

; <label>:78                                      ; preds = %75
  %79 = call i32 @cudaSetupArgument(i8* %71, i64 4, i64 12)
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %_Z8setValuePfif.exit7

; <label>:81                                      ; preds = %78
  %82 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32, float)* @_Z8setValuePfif to i8*))
  br label %_Z8setValuePfif.exit7

_Z8setValuePfif.exit7:                            ; preds = %66, %75, %78, %81
  call void @llvm.lifetime.end(i64 8, i8* %69)
  call void @llvm.lifetime.end(i64 4, i8* %70)
  call void @llvm.lifetime.end(i64 4, i8* %71)
  br label %83

; <label>:83                                      ; preds = %_ZNKSt5ctypeIcE5widenEc.exit, %_Z8setValuePfif.exit7
  %84 = load i8*, i8** %8, align 8, !tbaa !1
  %85 = call i32 @cudaMemcpy(i8* %30, i8* %84, i64 16, i32 2)
  %86 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i64 14)
  %87 = load float, float* %34, align 8, !tbaa !7
  %88 = fpext float %87 to double
  %89 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %88)
  %90 = bitcast %"class.std::basic_ostream"* %89 to i8**
  %91 = load i8*, i8** %90, align 8, !tbaa !9
  %92 = getelementptr i8, i8* %91, i64 -24
  %93 = bitcast i8* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = bitcast %"class.std::basic_ostream"* %89 to i8*
  %96 = getelementptr inbounds i8, i8* %95, i64 %94
  %97 = getelementptr inbounds i8, i8* %96, i64 240
  %98 = bitcast i8* %97 to %"class.std::ctype"**
  %99 = load %"class.std::ctype"*, %"class.std::ctype"** %98, align 8, !tbaa !11
  %100 = icmp eq %"class.std::ctype"* %99, null
  br i1 %100, label %101, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10

; <label>:101                                     ; preds = %83
  call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10:  ; preds = %83
  %102 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %99, i64 0, i32 8
  %103 = load i8, i8* %102, align 8, !tbaa !14
  %104 = icmp eq i8 %103, 0
  br i1 %104, label %108, label %105

; <label>:105                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10
  %106 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %99, i64 0, i32 9, i64 10
  %107 = load i8, i8* %106, align 1, !tbaa !16
  br label %_ZNKSt5ctypeIcE5widenEc.exit9

; <label>:108                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit10
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %99)
  %109 = bitcast %"class.std::ctype"* %99 to i8 (%"class.std::ctype"*, i8)***
  %110 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %109, align 8, !tbaa !9
  %111 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %110, i64 6
  %112 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %111, align 8
  %113 = call signext i8 %112(%"class.std::ctype"* nonnull %99, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit9

_ZNKSt5ctypeIcE5widenEc.exit9:                    ; preds = %105, %108
  %.0.i8 = phi i8 [ %107, %105 ], [ %113, %108 ]
  %114 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %89, i8 signext %.0.i8)
  %115 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %114)
  %116 = load i8*, i8** %8, align 8, !tbaa !1
  %117 = call i32 @cudaFree(i8* %116)
  call void @llvm.lifetime.end(i64 16, i8* nonnull %30) #1
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
