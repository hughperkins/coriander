; ModuleID = 'examples/testcudakernel1.cu'
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
@.str = private unnamed_addr constant [31 x i8] c"You called: someHostFunction()\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"myprintint \00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"myprintfloat \00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"myprintvoid* \00", align 1
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_testcudakernel1.cu, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_dtor to void ()*), i8* null }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: uwtable
define void @_Z3fooPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z3fooPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z7use_tidPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z7use_tidPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z8use_tid2Pi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*)* @_Z8use_tid2Pi to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10copy_floatPf(float* %a) #2 {
  %1 = alloca float*, align 8
  store float* %a, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z10copy_floatPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11use_blockidPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z11use_blockidPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11use_griddimPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z11use_griddimPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z12use_blockdimPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z12use_blockdimPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z13use_template1PfPi(float* %data, i32* %intdata) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  store i32* %intdata, i32** %2, align 8, !tbaa !1
  %3 = bitcast float** %1 to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = bitcast i32** %2 to i8*
  %8 = call i32 @cudaSetupArgument(i8* %7, i64 8, i64 8)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32*)* @_Z13use_template1PfPi to i8*))
  br label %12

; <label>:12                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: uwtable
define float @_Z16someHostFunctionf(float %input) #2 {
  %1 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0), i64 30)
  %2 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !5
  %3 = getelementptr i8, i8* %2, i64 -24
  %4 = bitcast i8* %3 to i64*
  %5 = load i64, i64* %4, align 8
  %6 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %5
  %7 = getelementptr inbounds i8, i8* %6, i64 240
  %8 = bitcast i8* %7 to %"class.std::ctype"**
  %9 = load %"class.std::ctype"*, %"class.std::ctype"** %8, align 8, !tbaa !7
  %10 = icmp eq %"class.std::ctype"* %9, null
  br i1 %10, label %11, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:11                                      ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %0
  %12 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %9, i64 0, i32 8
  %13 = load i8, i8* %12, align 8, !tbaa !10
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %16 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %9, i64 0, i32 9, i64 10
  %17 = load i8, i8* %16, align 1, !tbaa !12
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:18                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %9)
  %19 = bitcast %"class.std::ctype"* %9 to i8 (%"class.std::ctype"*, i8)***
  %20 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %19, align 8, !tbaa !5
  %21 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %20, i64 6
  %22 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %21, align 8
  %23 = tail call signext i8 %22(%"class.std::ctype"* nonnull %9, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %15, %18
  %.0.i = phi i8 [ %17, %15 ], [ %23, %18 ]
  %24 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i)
  %25 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %24)
  %26 = fmul float %input, 1.000000e+02
  ret float %26
}

; Function Attrs: uwtable
define void @_Z13someops_floatPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z13someops_floatPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11someops_intPi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*)* @_Z11someops_intPi to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z14testbooleanopsPi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*)* @_Z14testbooleanopsPi to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z26testcomparisons_int_signedPi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*)* @_Z26testcomparisons_int_signedPi to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z21testcomparisons_floatPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z21testcomparisons_floatPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z15testsyncthreadsPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z15testsyncthreadsPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11testDoWhilePii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = bitcast i32* %2 to i8*
  %8 = call i32 @cudaSetupArgument(i8* %7, i64 4, i64 8)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*, i32)* @_Z11testDoWhilePii to i8*))
  br label %12

; <label>:12                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z9testWhilePii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = bitcast i32* %2 to i8*
  %8 = call i32 @cudaSetupArgument(i8* %7, i64 4, i64 8)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*, i32)* @_Z9testWhilePii to i8*))
  br label %12

; <label>:12                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z6testIfPii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = bitcast i32* %2 to i8*
  %8 = call i32 @cudaSetupArgument(i8* %7, i64 4, i64 8)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*, i32)* @_Z6testIfPii to i8*))
  br label %12

; <label>:12                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10testIfElsePii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = bitcast i32* %2 to i8*
  %8 = call i32 @cudaSetupArgument(i8* %7, i64 4, i64 8)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = call i32 @cudaLaunch(i8* nonnull bitcast (void (i32*, i32)* @_Z10testIfElsePii to i8*))
  br label %12

; <label>:12                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11testTernaryPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %3 = call i32 @cudaSetupArgument(i8* %2, i64 8, i64 0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*)* @_Z11testTernaryPf to i8*))
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z7testForPfi(float* %data, i32 %N) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  store float* %data, float** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast float** %1 to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = bitcast i32* %2 to i8*
  %8 = call i32 @cudaSetupArgument(i8* %7, i64 4, i64 8)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32)* @_Z7testForPfi to i8*))
  br label %12

; <label>:12                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10myprintinti(i32 %value) #2 {
  %1 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i64 11)
  %2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i32 %value)
  %3 = bitcast %"class.std::basic_ostream"* %2 to i8**
  %4 = load i8*, i8** %3, align 8, !tbaa !5
  %5 = getelementptr i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = bitcast %"class.std::basic_ostream"* %2 to i8*
  %9 = getelementptr inbounds i8, i8* %8, i64 %7
  %10 = getelementptr inbounds i8, i8* %9, i64 240
  %11 = bitcast i8* %10 to %"class.std::ctype"**
  %12 = load %"class.std::ctype"*, %"class.std::ctype"** %11, align 8, !tbaa !7
  %13 = icmp eq %"class.std::ctype"* %12, null
  br i1 %13, label %14, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

; <label>:14                                      ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %0
  %15 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %12, i64 0, i32 8
  %16 = load i8, i8* %15, align 8, !tbaa !10
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %19 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %12, i64 0, i32 9, i64 10
  %20 = load i8, i8* %19, align 1, !tbaa !12
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

; <label>:21                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %12)
  %22 = bitcast %"class.std::ctype"* %12 to i8 (%"class.std::ctype"*, i8)***
  %23 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %22, align 8, !tbaa !5
  %24 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %23, i64 6
  %25 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %24, align 8
  %26 = tail call signext i8 %25(%"class.std::ctype"* nonnull %12, i8 signext 10)
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %18, %21
  %.0.i.i.i = phi i8 [ %20, %18 ], [ %26, %21 ]
  %27 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %2, i8 signext %.0.i.i.i)
  %28 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %27)
  ret void
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #0

; Function Attrs: uwtable
define void @_Z12myprintfloatf(float %value) #2 {
  %1 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), i64 13)
  %2 = fpext float %value to double
  %3 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, double %2)
  %4 = bitcast %"class.std::basic_ostream"* %3 to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !5
  %6 = getelementptr i8, i8* %5, i64 -24
  %7 = bitcast i8* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = bitcast %"class.std::basic_ostream"* %3 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 %8
  %11 = getelementptr inbounds i8, i8* %10, i64 240
  %12 = bitcast i8* %11 to %"class.std::ctype"**
  %13 = load %"class.std::ctype"*, %"class.std::ctype"** %12, align 8, !tbaa !7
  %14 = icmp eq %"class.std::ctype"* %13, null
  br i1 %14, label %15, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

; <label>:15                                      ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %0
  %16 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %13, i64 0, i32 8
  %17 = load i8, i8* %16, align 8, !tbaa !10
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %22, label %19

; <label>:19                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %20 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %13, i64 0, i32 9, i64 10
  %21 = load i8, i8* %20, align 1, !tbaa !12
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

; <label>:22                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %13)
  %23 = bitcast %"class.std::ctype"* %13 to i8 (%"class.std::ctype"*, i8)***
  %24 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %23, align 8, !tbaa !5
  %25 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %24, i64 6
  %26 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %25, align 8
  %27 = tail call signext i8 %26(%"class.std::ctype"* nonnull %13, i8 signext 10)
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %19, %22
  %.0.i.i.i = phi i8 [ %21, %19 ], [ %27, %22 ]
  %28 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %3, i8 signext %.0.i.i.i)
  %29 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %28)
  ret void
}

; Function Attrs: uwtable
define void @_Z15myprintvoidstarPv(i8* %value) #2 {
  %1 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i64 13)
  %2 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIPKvEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8* %value)
  %3 = bitcast %"class.std::basic_ostream"* %2 to i8**
  %4 = load i8*, i8** %3, align 8, !tbaa !5
  %5 = getelementptr i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = bitcast %"class.std::basic_ostream"* %2 to i8*
  %9 = getelementptr inbounds i8, i8* %8, i64 %7
  %10 = getelementptr inbounds i8, i8* %9, i64 240
  %11 = bitcast i8* %10 to %"class.std::ctype"**
  %12 = load %"class.std::ctype"*, %"class.std::ctype"** %11, align 8, !tbaa !7
  %13 = icmp eq %"class.std::ctype"* %12, null
  br i1 %13, label %14, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i

; <label>:14                                      ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #7
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i: ; preds = %0
  %15 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %12, i64 0, i32 8
  %16 = load i8, i8* %15, align 8, !tbaa !10
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  %19 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %12, i64 0, i32 9, i64 10
  %20 = load i8, i8* %19, align 1, !tbaa !12
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

; <label>:21                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit.i.i
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %12)
  %22 = bitcast %"class.std::ctype"* %12 to i8 (%"class.std::ctype"*, i8)***
  %23 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %22, align 8, !tbaa !5
  %24 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %23, i64 6
  %25 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %24, align 8
  %26 = tail call signext i8 %25(%"class.std::ctype"* nonnull %12, i8 signext 10)
  br label %_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %18, %21
  %.0.i.i.i = phi i8 [ %20, %18 ], [ %26, %21 ]
  %27 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %2, i8 signext %.0.i.i.i)
  %28 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %27)
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define void @_Z5mynopv() #3 {
  ret void
}

; Function Attrs: uwtable
define void @_Z8setValuePfif(float* %data, i32 %idx, float %value) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store float* %data, float** %1, align 8, !tbaa !1
  store i32 %idx, i32* %2, align 4, !tbaa !13
  store float %value, float* %3, align 4, !tbaa !15
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

; Function Attrs: uwtable
define void @_Z14launchSetValuePfif(float* %data, i32 %idx, float %value) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = tail call i32 @cudaConfigureCall(i64 4294967328, i32 1, i64 4294967328, i32 1, i64 0, %struct.CUstream_st* null)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %20

; <label>:6                                       ; preds = %0
  %7 = bitcast float** %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %7)
  %8 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %8)
  %9 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %9)
  store float* %data, float** %1, align 8, !tbaa !1
  store i32 %idx, i32* %2, align 4, !tbaa !13
  store float %value, float* %3, align 4, !tbaa !15
  %10 = call i32 @cudaSetupArgument(i8* %7, i64 8, i64 0)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %_Z8setValuePfif.exit

; <label>:12                                      ; preds = %6
  %13 = call i32 @cudaSetupArgument(i8* %8, i64 4, i64 8)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %_Z8setValuePfif.exit

; <label>:15                                      ; preds = %12
  %16 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 12)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %_Z8setValuePfif.exit

; <label>:18                                      ; preds = %15
  %19 = call i32 @cudaLaunch(i8* nonnull bitcast (void (float*, i32, float)* @_Z8setValuePfif to i8*))
  br label %_Z8setValuePfif.exit

_Z8setValuePfif.exit:                             ; preds = %6, %12, %15, %18
  call void @llvm.lifetime.end(i64 8, i8* %7)
  call void @llvm.lifetime.end(i64 4, i8* %8)
  call void @llvm.lifetime.end(i64 4, i8* %9)
  br label %20

; <label>:20                                      ; preds = %0, %_Z8setValuePfif.exit
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() #4

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"*, double) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIPKvEERSoT_(%"class.std::basic_ostream"*, i8*) #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_testcudakernel1.cu() #2 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #1
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_ctor(i8* nocapture) #5 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_dtor(i8* nocapture) #5 {
entry:
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

attributes #0 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind readnone }
attributes #6 = { argmemonly nounwind }
attributes #7 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"vtable pointer", !4, i64 0}
!7 = !{!8, !2, i64 240}
!8 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !2, i64 216, !3, i64 224, !9, i64 225, !2, i64 232, !2, i64 240, !2, i64 248, !2, i64 256}
!9 = !{!"bool", !3, i64 0}
!10 = !{!11, !3, i64 56}
!11 = !{!"_ZTSSt5ctypeIcE", !2, i64 16, !9, i64 24, !2, i64 32, !2, i64 40, !2, i64 48, !3, i64 56, !3, i64 57, !3, i64 313, !3, i64 569}
!12 = !{!3, !3, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !3, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !3, i64 0}
