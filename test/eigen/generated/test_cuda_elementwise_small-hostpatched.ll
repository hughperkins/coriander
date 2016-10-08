; ModuleID = 'test/eigen/generated/test_cuda_elementwise_small-hostraw.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char> > >::_Vector_impl" }
%"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char> > >::_Vector_impl" = type { %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"* }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
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
%"class.std::__cxx11::basic_stringstream" = type { %"class.std::basic_iostream.base", %"class.std::__cxx11::basic_stringbuf", %"class.std::basic_ios" }
%"class.std::basic_iostream.base" = type { %"class.std::basic_istream.base", %"class.std::basic_ostream.base" }
%"class.std::basic_istream.base" = type { i32 (...)**, i64 }
%"class.std::basic_ostream.base" = type { i32 (...)** }
%"class.std::__cxx11::basic_stringbuf" = type { %"class.std::basic_streambuf", i32, %"class.std::__cxx11::basic_string" }

$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev = comdat any

$_Z22set_repeat_from_stringPKc = comdat any

$_Z20set_seed_from_stringPKc = comdat any

$_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_ = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZN5EigenL12g_test_stackB5cxx11E = internal global %"class.std::vector" zeroinitializer, align 8
@.str = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"double\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"long double\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"complex<float>\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"complex<double>\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"complex<long double>\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"complex<int>\00", align 1
@_ZN5EigenL16g_has_set_repeatE = internal unnamed_addr global i1 false
@_ZN5EigenL14g_has_set_seedE = internal unnamed_addr global i1 false
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.9 = private unnamed_addr constant [10 x i8] c"Argument \00", align 1
@.str.10 = private unnamed_addr constant [36 x i8] c" conflicting with a former argument\00", align 1
@.str.11 = private unnamed_addr constant [62 x i8] c"This test application takes the following optional arguments:\00", align 1
@.str.12 = private unnamed_addr constant [45 x i8] c"  rN     Repeat each test N times (default: \00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.14 = private unnamed_addr constant [75 x i8] c"  sN     Use N as seed for random numbers (default: based on current time)\00", align 1
@.str.15 = private unnamed_addr constant [66 x i8] c"If defined, the environment variables EIGEN_REPEAT and EIGEN_SEED\00", align 1
@.str.16 = private unnamed_addr constant [53 x i8] c"will be used as default values for these parameters.\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"EIGEN_REPEAT\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"EIGEN_SEED\00", align 1
@_ZN5EigenL6g_seedE = internal unnamed_addr global i32 0, align 4
@_ZN5EigenL8g_repeatE = internal unnamed_addr global i32 0, align 4
@.str.19 = private unnamed_addr constant [48 x i8] c"Initializing random number generator with seed \00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"Seed: \00", align 1
@.str.21 = private unnamed_addr constant [21 x i8] c"Repeating each test \00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c" times\00", align 1
@.str.23 = private unnamed_addr constant [23 x i8] c"cuda_elementwise_small\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"d_out \00", align 1
@.str.25 = private unnamed_addr constant [7 x i8] c"d_in2 \00", align 1
@.str.26 = private unnamed_addr constant [22 x i8] c"Invalid repeat value \00", align 1
@.str.27 = private unnamed_addr constant [20 x i8] c"Invalid seed value \00", align 1
@_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [10 x i8*]
@_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE = external unnamed_addr constant [16 x i8*]
@_ZTVSt15basic_streambufIcSt11char_traitsIcEE = external unnamed_addr constant [16 x i8*]
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_test_cuda_elementwise_small.cu, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_dtor to void ()*), i8* null }]
@__opencl_sourcecode = global [4 x i8] c"\0A\0A\0A\00"

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev(%"class.std::vector"* nocapture readonly %this) unnamed_addr #3 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 0
  %2 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %1, align 8, !tbaa !1
  %3 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 1
  %4 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %3, align 8, !tbaa !7
  %5 = icmp eq %"class.std::__cxx11::basic_string"* %2, %4
  br i1 %5, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit, label %.lr.ph.i.i.i.preheader

.lr.ph.i.i.i.preheader:                           ; preds = %0
  br label %.lr.ph.i.i.i

.lr.ph.i.i.i:                                     ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i, %.lr.ph.i.i.i.preheader
  %.01.i.i.i = phi %"class.std::__cxx11::basic_string"* [ %12, %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i ], [ %2, %.lr.ph.i.i.i.preheader ]
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i, i64 0, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8, !tbaa !8
  %8 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i, i64 0, i32 2
  %9 = bitcast %union.anon* %8 to i8*
  %10 = icmp eq i8* %7, %9
  br i1 %10, label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i, label %11

; <label>:11                                      ; preds = %.lr.ph.i.i.i
  tail call void @_ZdlPv(i8* %7) #2
  br label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i

_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i: ; preds = %11, %.lr.ph.i.i.i
  %12 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i, i64 1
  %13 = icmp eq %"class.std::__cxx11::basic_string"* %12, %4
  br i1 %13, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit, label %.lr.ph.i.i.i

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit: ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i
  %.pre = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %1, align 8, !tbaa !1
  br label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit: ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit, %0
  %14 = phi %"class.std::__cxx11::basic_string"* [ %.pre, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit.loopexit ], [ %2, %0 ]
  %15 = icmp eq %"class.std::__cxx11::basic_string"* %14, null
  br i1 %15, label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev.exit, label %16

; <label>:16                                      ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit
  %17 = bitcast %"class.std::__cxx11::basic_string"* %14 to i8*
  tail call void @_ZdlPv(i8* %17) #2
  br label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev.exit

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev.exit: ; preds = %16, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameIfENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 5, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 5, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i8, i8* %2, i64 5
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: uwtable
define void @_Z9type_nameIdENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64 6, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 6, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i8, i8* %2, i64 6
  store i8 0, i8* %4, align 2, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameIeENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i64 11, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 11, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 3
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameIiENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i64 3, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 3, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds i8, i8* %2, i64 3
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIfEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i64 14, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 14, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 6
  store i8 0, i8* %4, align 2, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIdEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0), i64 15, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 15, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 7
  store i8 0, i8* %4, align 1, !tbaa !14
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIeEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
.noexc1.i:
  %__dnew.i.i.i.i = alloca i64, align 8
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #2
  store i64 20, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %3 = call i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %agg.result, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 0, i32 0
  store i8* %3, i8** %4, align 8, !tbaa !8
  %5 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %6 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 0
  store i64 %5, i64* %6, align 8, !tbaa !15
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), i64 20, i32 1, i1 false) #2
  %7 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 %5, i64* %7, align 8, !tbaa !13
  %8 = load i8*, i8** %4, align 8, !tbaa !8
  %9 = getelementptr inbounds i8, i8* %8, i64 %5
  store i8 0, i8* %9, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %2) #2
  ret void
}

; Function Attrs: uwtable
define void @_Z9type_nameISt7complexIiEENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEv(%"class.std::__cxx11::basic_string"* noalias sret %agg.result) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
._crit_edge.i.i.i.i:
  %0 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2
  %1 = bitcast %"class.std::__cxx11::basic_string"* %agg.result to %union.anon**
  store %union.anon* %0, %union.anon** %1, align 8, !tbaa !12
  %2 = bitcast %union.anon* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i64 0, i64 0), i64 12, i32 1, i1 false) #2
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 1
  store i64 12, i64* %3, align 8, !tbaa !13
  %4 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %agg.result, i64 0, i32 2, i32 1, i64 4
  store i8 0, i8* %4, align 4, !tbaa !14
  ret void
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %__dnew.i.i.i.i = alloca i64, align 8
  %ss = alloca %"class.std::__cxx11::basic_stringstream", align 8
  %1 = alloca %"class.std::__cxx11::basic_string", align 8
  %2 = alloca %"class.std::__cxx11::basic_string", align 8
  store i1 false, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  store i1 false, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  %3 = icmp sgt i32 %argc, 1
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge.thread

.lr.ph.preheader:                                 ; preds = %0
  %4 = sext i32 %argc to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %100, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next, %100 ]
  %need_help.078 = phi i8 [ 0, %.lr.ph.preheader ], [ %need_help.1, %100 ]
  %5 = getelementptr inbounds i8*, i8** %argv, i64 %indvars.iv
  %6 = load i8*, i8** %5, align 8, !tbaa !16
  %7 = load i8, i8* %6, align 1, !tbaa !14
  switch i8 %7, label %100 [
    i8 114, label %8
    i8 115, label %54
  ]

; <label>:8                                       ; preds = %.lr.ph
  %.b1120 = load i1, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  br i1 %.b1120, label %9, label %52

; <label>:9                                       ; preds = %8
  %.lcssa94 = phi i8** [ %5, %8 ]
  %10 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i64 9)
  %11 = load i8*, i8** %.lcssa94, align 8, !tbaa !16
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %24

; <label>:13                                      ; preds = %9
  %14 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %15 = getelementptr i8, i8* %14, i64 -24
  %16 = bitcast i8* %15 to i64*
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %17
  %19 = bitcast i8* %18 to %"class.std::basic_ios"*
  %20 = getelementptr inbounds i8, i8* %18, i64 32
  %21 = bitcast i8* %20 to i32*
  %22 = load i32, i32* %21, align 8, !tbaa !19
  %23 = or i32 %22, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %19, i32 %23)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

; <label>:24                                      ; preds = %9
  %25 = tail call i64 @strlen(i8* nonnull %11) #2
  %26 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %11, i64 %25)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %24, %13
  %27 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.10, i64 0, i64 0), i64 35)
  %28 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %29 = getelementptr i8, i8* %28, i64 -24
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %31
  %33 = getelementptr inbounds i8, i8* %32, i64 240
  %34 = bitcast i8* %33 to %"class.std::ctype"**
  %35 = load %"class.std::ctype"*, %"class.std::ctype"** %34, align 8, !tbaa !26
  %36 = icmp eq %"class.std::ctype"* %35, null
  br i1 %36, label %37, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:37                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %38 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %35, i64 0, i32 8
  %39 = load i8, i8* %38, align 8, !tbaa !29
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %44, label %41

; <label>:41                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %42 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %35, i64 0, i32 9, i64 10
  %43 = load i8, i8* %42, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:44                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %35)
  %45 = bitcast %"class.std::ctype"* %35 to i8 (%"class.std::ctype"*, i8)***
  %46 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %45, align 8, !tbaa !17
  %47 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %46, i64 6
  %48 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %47, align 8
  %49 = tail call signext i8 %48(%"class.std::ctype"* nonnull %35, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %44, %41
  %.0.i = phi i8 [ %43, %41 ], [ %49, %44 ]
  %50 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i)
  %51 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %50)
  br label %.thread

; <label>:52                                      ; preds = %8
  %53 = getelementptr inbounds i8, i8* %6, i64 1
  tail call void @_Z22set_repeat_from_stringPKc(i8* %53)
  br label %100

; <label>:54                                      ; preds = %.lr.ph
  %.b1419 = load i1, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  br i1 %.b1419, label %55, label %98

; <label>:55                                      ; preds = %54
  %.lcssa = phi i8** [ %5, %54 ]
  %56 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i64 9)
  %57 = load i8*, i8** %.lcssa, align 8, !tbaa !16
  %58 = icmp eq i8* %57, null
  br i1 %58, label %59, label %70

; <label>:59                                      ; preds = %55
  %60 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %61 = getelementptr i8, i8* %60, i64 -24
  %62 = bitcast i8* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %63
  %65 = bitcast i8* %64 to %"class.std::basic_ios"*
  %66 = getelementptr inbounds i8, i8* %64, i64 32
  %67 = bitcast i8* %66 to i32*
  %68 = load i32, i32* %67, align 8, !tbaa !19
  %69 = or i32 %68, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %65, i32 %69)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21

; <label>:70                                      ; preds = %55
  %71 = tail call i64 @strlen(i8* nonnull %57) #2
  %72 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %57, i64 %71)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21: ; preds = %70, %59
  %73 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([36 x i8], [36 x i8]* @.str.10, i64 0, i64 0), i64 35)
  %74 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %75 = getelementptr i8, i8* %74, i64 -24
  %76 = bitcast i8* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %77
  %79 = getelementptr inbounds i8, i8* %78, i64 240
  %80 = bitcast i8* %79 to %"class.std::ctype"**
  %81 = load %"class.std::ctype"*, %"class.std::ctype"** %80, align 8, !tbaa !26
  %82 = icmp eq %"class.std::ctype"* %81, null
  br i1 %82, label %83, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64

; <label>:83                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64:  ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit21
  %84 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %81, i64 0, i32 8
  %85 = load i8, i8* %84, align 8, !tbaa !29
  %86 = icmp eq i8 %85, 0
  br i1 %86, label %90, label %87

; <label>:87                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64
  %88 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %81, i64 0, i32 9, i64 10
  %89 = load i8, i8* %88, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit43

; <label>:90                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit64
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %81)
  %91 = bitcast %"class.std::ctype"* %81 to i8 (%"class.std::ctype"*, i8)***
  %92 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %91, align 8, !tbaa !17
  %93 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %92, i64 6
  %94 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %93, align 8
  %95 = tail call signext i8 %94(%"class.std::ctype"* nonnull %81, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit43

_ZNKSt5ctypeIcE5widenEc.exit43:                   ; preds = %90, %87
  %.0.i42 = phi i8 [ %89, %87 ], [ %95, %90 ]
  %96 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i42)
  %97 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %96)
  br label %.thread

; <label>:98                                      ; preds = %54
  %99 = getelementptr inbounds i8, i8* %6, i64 1
  tail call void @_Z20set_seed_from_stringPKc(i8* %99)
  br label %100

; <label>:100                                     ; preds = %98, %52, %.lr.ph
  %need_help.1 = phi i8 [ %need_help.078, %52 ], [ %need_help.078, %98 ], [ 1, %.lr.ph ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %101 = icmp slt i64 %indvars.iv.next, %4
  br i1 %101, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %100
  %need_help.1.lcssa = phi i8 [ %need_help.1, %100 ]
  %102 = and i8 %need_help.1.lcssa, 1
  %103 = icmp eq i8 %102, 0
  br i1 %103, label %._crit_edge.thread, label %104

; <label>:104                                     ; preds = %._crit_edge
  %105 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([62 x i8], [62 x i8]* @.str.11, i64 0, i64 0), i64 61)
  %106 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %107 = getelementptr i8, i8* %106, i64 -24
  %108 = bitcast i8* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %109
  %111 = getelementptr inbounds i8, i8* %110, i64 240
  %112 = bitcast i8* %111 to %"class.std::ctype"**
  %113 = load %"class.std::ctype"*, %"class.std::ctype"** %112, align 8, !tbaa !26
  %114 = icmp eq %"class.std::ctype"* %113, null
  br i1 %114, label %115, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65

; <label>:115                                     ; preds = %104
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65:  ; preds = %104
  %116 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %113, i64 0, i32 8
  %117 = load i8, i8* %116, align 8, !tbaa !29
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %122, label %119

; <label>:119                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65
  %120 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %113, i64 0, i32 9, i64 10
  %121 = load i8, i8* %120, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit45

; <label>:122                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit65
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %113)
  %123 = bitcast %"class.std::ctype"* %113 to i8 (%"class.std::ctype"*, i8)***
  %124 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %123, align 8, !tbaa !17
  %125 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %124, i64 6
  %126 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %125, align 8
  %127 = tail call signext i8 %126(%"class.std::ctype"* nonnull %113, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit45

_ZNKSt5ctypeIcE5widenEc.exit45:                   ; preds = %122, %119
  %.0.i44 = phi i8 [ %121, %119 ], [ %127, %122 ]
  %128 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i44)
  %129 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %128)
  %130 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([45 x i8], [45 x i8]* @.str.12, i64 0, i64 0), i64 44)
  %131 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i32 10)
  %132 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %131, i8* nonnull getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0), i64 1)
  %133 = bitcast %"class.std::basic_ostream"* %131 to i8**
  %134 = load i8*, i8** %133, align 8, !tbaa !17
  %135 = getelementptr i8, i8* %134, i64 -24
  %136 = bitcast i8* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = bitcast %"class.std::basic_ostream"* %131 to i8*
  %139 = getelementptr inbounds i8, i8* %138, i64 %137
  %140 = getelementptr inbounds i8, i8* %139, i64 240
  %141 = bitcast i8* %140 to %"class.std::ctype"**
  %142 = load %"class.std::ctype"*, %"class.std::ctype"** %141, align 8, !tbaa !26
  %143 = icmp eq %"class.std::ctype"* %142, null
  br i1 %143, label %144, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66

; <label>:144                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit45
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit45
  %145 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %142, i64 0, i32 8
  %146 = load i8, i8* %145, align 8, !tbaa !29
  %147 = icmp eq i8 %146, 0
  br i1 %147, label %151, label %148

; <label>:148                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66
  %149 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %142, i64 0, i32 9, i64 10
  %150 = load i8, i8* %149, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit47

; <label>:151                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit66
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %142)
  %152 = bitcast %"class.std::ctype"* %142 to i8 (%"class.std::ctype"*, i8)***
  %153 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %152, align 8, !tbaa !17
  %154 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %153, i64 6
  %155 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %154, align 8
  %156 = tail call signext i8 %155(%"class.std::ctype"* nonnull %142, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit47

_ZNKSt5ctypeIcE5widenEc.exit47:                   ; preds = %151, %148
  %.0.i46 = phi i8 [ %150, %148 ], [ %156, %151 ]
  %157 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %131, i8 signext %.0.i46)
  %158 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %157)
  %159 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([75 x i8], [75 x i8]* @.str.14, i64 0, i64 0), i64 74)
  %160 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %161 = getelementptr i8, i8* %160, i64 -24
  %162 = bitcast i8* %161 to i64*
  %163 = load i64, i64* %162, align 8
  %164 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %163
  %165 = getelementptr inbounds i8, i8* %164, i64 240
  %166 = bitcast i8* %165 to %"class.std::ctype"**
  %167 = load %"class.std::ctype"*, %"class.std::ctype"** %166, align 8, !tbaa !26
  %168 = icmp eq %"class.std::ctype"* %167, null
  br i1 %168, label %169, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67

; <label>:169                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit47
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit47
  %170 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %167, i64 0, i32 8
  %171 = load i8, i8* %170, align 8, !tbaa !29
  %172 = icmp eq i8 %171, 0
  br i1 %172, label %176, label %173

; <label>:173                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67
  %174 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %167, i64 0, i32 9, i64 10
  %175 = load i8, i8* %174, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit49

; <label>:176                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit67
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %167)
  %177 = bitcast %"class.std::ctype"* %167 to i8 (%"class.std::ctype"*, i8)***
  %178 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %177, align 8, !tbaa !17
  %179 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %178, i64 6
  %180 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %179, align 8
  %181 = tail call signext i8 %180(%"class.std::ctype"* nonnull %167, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit49

_ZNKSt5ctypeIcE5widenEc.exit49:                   ; preds = %176, %173
  %.0.i48 = phi i8 [ %175, %173 ], [ %181, %176 ]
  %182 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i48)
  %183 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %182)
  %184 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %185 = getelementptr i8, i8* %184, i64 -24
  %186 = bitcast i8* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %187
  %189 = getelementptr inbounds i8, i8* %188, i64 240
  %190 = bitcast i8* %189 to %"class.std::ctype"**
  %191 = load %"class.std::ctype"*, %"class.std::ctype"** %190, align 8, !tbaa !26
  %192 = icmp eq %"class.std::ctype"* %191, null
  br i1 %192, label %193, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68

; <label>:193                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit49
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit49
  %194 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %191, i64 0, i32 8
  %195 = load i8, i8* %194, align 8, !tbaa !29
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %200, label %197

; <label>:197                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68
  %198 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %191, i64 0, i32 9, i64 10
  %199 = load i8, i8* %198, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit51

; <label>:200                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit68
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %191)
  %201 = bitcast %"class.std::ctype"* %191 to i8 (%"class.std::ctype"*, i8)***
  %202 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %201, align 8, !tbaa !17
  %203 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %202, i64 6
  %204 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %203, align 8
  %205 = tail call signext i8 %204(%"class.std::ctype"* nonnull %191, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit51

_ZNKSt5ctypeIcE5widenEc.exit51:                   ; preds = %200, %197
  %.0.i50 = phi i8 [ %199, %197 ], [ %205, %200 ]
  %206 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i50)
  %207 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %206)
  %208 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([66 x i8], [66 x i8]* @.str.15, i64 0, i64 0), i64 65)
  %209 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %210 = getelementptr i8, i8* %209, i64 -24
  %211 = bitcast i8* %210 to i64*
  %212 = load i64, i64* %211, align 8
  %213 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %212
  %214 = getelementptr inbounds i8, i8* %213, i64 240
  %215 = bitcast i8* %214 to %"class.std::ctype"**
  %216 = load %"class.std::ctype"*, %"class.std::ctype"** %215, align 8, !tbaa !26
  %217 = icmp eq %"class.std::ctype"* %216, null
  br i1 %217, label %218, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69

; <label>:218                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit51
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit51
  %219 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %216, i64 0, i32 8
  %220 = load i8, i8* %219, align 8, !tbaa !29
  %221 = icmp eq i8 %220, 0
  br i1 %221, label %225, label %222

; <label>:222                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69
  %223 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %216, i64 0, i32 9, i64 10
  %224 = load i8, i8* %223, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit53

; <label>:225                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit69
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %216)
  %226 = bitcast %"class.std::ctype"* %216 to i8 (%"class.std::ctype"*, i8)***
  %227 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %226, align 8, !tbaa !17
  %228 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %227, i64 6
  %229 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %228, align 8
  %230 = tail call signext i8 %229(%"class.std::ctype"* nonnull %216, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit53

_ZNKSt5ctypeIcE5widenEc.exit53:                   ; preds = %225, %222
  %.0.i52 = phi i8 [ %224, %222 ], [ %230, %225 ]
  %231 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i52)
  %232 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %231)
  %233 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([53 x i8], [53 x i8]* @.str.16, i64 0, i64 0), i64 52)
  %234 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %235 = getelementptr i8, i8* %234, i64 -24
  %236 = bitcast i8* %235 to i64*
  %237 = load i64, i64* %236, align 8
  %238 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %237
  %239 = getelementptr inbounds i8, i8* %238, i64 240
  %240 = bitcast i8* %239 to %"class.std::ctype"**
  %241 = load %"class.std::ctype"*, %"class.std::ctype"** %240, align 8, !tbaa !26
  %242 = icmp eq %"class.std::ctype"* %241, null
  br i1 %242, label %243, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70

; <label>:243                                     ; preds = %_ZNKSt5ctypeIcE5widenEc.exit53
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70:  ; preds = %_ZNKSt5ctypeIcE5widenEc.exit53
  %244 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %241, i64 0, i32 8
  %245 = load i8, i8* %244, align 8, !tbaa !29
  %246 = icmp eq i8 %245, 0
  br i1 %246, label %250, label %247

; <label>:247                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70
  %248 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %241, i64 0, i32 9, i64 10
  %249 = load i8, i8* %248, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit55

; <label>:250                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit70
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %241)
  %251 = bitcast %"class.std::ctype"* %241 to i8 (%"class.std::ctype"*, i8)***
  %252 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %251, align 8, !tbaa !17
  %253 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %252, i64 6
  %254 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %253, align 8
  %255 = tail call signext i8 %254(%"class.std::ctype"* nonnull %241, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit55

_ZNKSt5ctypeIcE5widenEc.exit55:                   ; preds = %250, %247
  %.0.i54 = phi i8 [ %249, %247 ], [ %255, %250 ]
  %256 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i54)
  %257 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %256)
  br label %.thread

._crit_edge.thread:                               ; preds = %._crit_edge, %0
  %258 = tail call i8* @getenv(i8* nonnull getelementptr inbounds ([13 x i8], [13 x i8]* @.str.17, i64 0, i64 0)) #2
  %.b1015 = load i1, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  %.not = xor i1 %.b1015, true
  %259 = icmp ne i8* %258, null
  %or.cond = and i1 %259, %.not
  br i1 %or.cond, label %260, label %261

; <label>:260                                     ; preds = %._crit_edge.thread
  tail call void @_Z22set_repeat_from_stringPKc(i8* %258)
  br label %261

; <label>:261                                     ; preds = %260, %._crit_edge.thread
  %262 = tail call i8* @getenv(i8* nonnull getelementptr inbounds ([11 x i8], [11 x i8]* @.str.18, i64 0, i64 0)) #2
  %.b1316 = load i1, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  %.not2 = xor i1 %.b1316, true
  %263 = icmp ne i8* %262, null
  %or.cond4 = and i1 %263, %.not2
  br i1 %or.cond4, label %264, label %265

; <label>:264                                     ; preds = %261
  tail call void @_Z20set_seed_from_stringPKc(i8* %262)
  %.b1217.pr = load i1, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  br i1 %.b1217.pr, label %269, label %266

; <label>:265                                     ; preds = %261
  br i1 %.b1316, label %269, label %266

; <label>:266                                     ; preds = %265, %264
  %267 = tail call i64 @time(i64* null) #2
  %268 = trunc i64 %267 to i32
  store i32 %268, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  br label %269

; <label>:269                                     ; preds = %266, %265, %264
  %.b18 = load i1, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  br i1 %.b18, label %271, label %270

; <label>:270                                     ; preds = %269
  store i32 10, i32* @_ZN5EigenL8g_repeatE, align 4, !tbaa !31
  br label %271

; <label>:271                                     ; preds = %270, %269
  %272 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([48 x i8], [48 x i8]* @.str.19, i64 0, i64 0), i64 47)
  %273 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  %274 = zext i32 %273 to i64
  %275 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i64 %274)
  %276 = bitcast %"class.std::basic_ostream"* %275 to i8**
  %277 = load i8*, i8** %276, align 8, !tbaa !17
  %278 = getelementptr i8, i8* %277, i64 -24
  %279 = bitcast i8* %278 to i64*
  %280 = load i64, i64* %279, align 8
  %281 = bitcast %"class.std::basic_ostream"* %275 to i8*
  %282 = getelementptr inbounds i8, i8* %281, i64 %280
  %283 = getelementptr inbounds i8, i8* %282, i64 240
  %284 = bitcast i8* %283 to %"class.std::ctype"**
  %285 = load %"class.std::ctype"*, %"class.std::ctype"** %284, align 8, !tbaa !26
  %286 = icmp eq %"class.std::ctype"* %285, null
  br i1 %286, label %287, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71

; <label>:287                                     ; preds = %271
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71:  ; preds = %271
  %288 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %285, i64 0, i32 8
  %289 = load i8, i8* %288, align 8, !tbaa !29
  %290 = icmp eq i8 %289, 0
  br i1 %290, label %294, label %291

; <label>:291                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71
  %292 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %285, i64 0, i32 9, i64 10
  %293 = load i8, i8* %292, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit57

; <label>:294                                     ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit71
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %285)
  %295 = bitcast %"class.std::ctype"* %285 to i8 (%"class.std::ctype"*, i8)***
  %296 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %295, align 8, !tbaa !17
  %297 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %296, i64 6
  %298 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %297, align 8
  %299 = tail call signext i8 %298(%"class.std::ctype"* nonnull %285, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit57

_ZNKSt5ctypeIcE5widenEc.exit57:                   ; preds = %294, %291
  %.0.i56 = phi i8 [ %293, %291 ], [ %299, %294 ]
  %300 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %275, i8 signext %.0.i56)
  %301 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %300)
  %302 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i8*
  call void @llvm.lifetime.start(i64 392, i8* %302) #2
  call void @_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::__cxx11::basic_stringstream"* nonnull %ss, i32 24)
  %303 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 1
  %304 = bitcast %"class.std::basic_ostream.base"* %303 to %"class.std::basic_ostream"*
  %305 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %304, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i64 0, i64 0), i64 6)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22 unwind label %429

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22: ; preds = %_ZNKSt5ctypeIcE5widenEc.exit57
  %306 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  %307 = zext i32 %306 to i64
  %308 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"* %304, i64 %307)
          to label %_ZNSolsEj.exit unwind label %429

_ZNSolsEj.exit:                                   ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22
  %309 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1
  invoke void @_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::__cxx11::basic_string"* nonnull sret %1, %"class.std::__cxx11::basic_stringbuf"* %309)
          to label %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit unwind label %429

_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit: ; preds = %_ZNSolsEj.exit
  %310 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  %311 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !32
  %312 = icmp eq %"class.std::__cxx11::basic_string"* %310, %311
  br i1 %312, label %334, label %313

; <label>:313                                     ; preds = %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit
  %314 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 2
  %315 = bitcast %"class.std::__cxx11::basic_string"* %310 to %union.anon**
  store %union.anon* %314, %union.anon** %315, align 8, !tbaa !12
  %316 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %317 = load i8*, i8** %316, align 8, !tbaa !8
  %318 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %319 = bitcast %union.anon* %318 to i8*
  %320 = icmp eq i8* %317, %319
  br i1 %320, label %321, label %323

; <label>:321                                     ; preds = %313
  %322 = bitcast %union.anon* %314 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %322, i8* %317, i64 16, i32 1, i1 false) #2
  %.pre = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread

; <label>:323                                     ; preds = %313
  %324 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 0, i32 0
  store i8* %317, i8** %324, align 8, !tbaa !8
  %325 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2, i32 0
  %326 = load i64, i64* %325, align 8, !tbaa !15
  %327 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 2, i32 0
  store i64 %326, i64* %327, align 8, !tbaa !15
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread: ; preds = %323, %321
  %328 = phi %"class.std::__cxx11::basic_string"* [ %310, %323 ], [ %.pre, %321 ]
  %329 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 1
  %330 = load i64, i64* %329, align 8, !tbaa !13
  %331 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %310, i64 0, i32 1
  store i64 %330, i64* %331, align 8, !tbaa !13
  %332 = bitcast %"class.std::__cxx11::basic_string"* %1 to %union.anon**
  store %union.anon* %318, %union.anon** %332, align 8, !tbaa !8
  store i64 0, i64* %329, align 8, !tbaa !13
  store i8 0, i8* %319, align 8, !tbaa !14
  %333 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %328, i64 1
  store %"class.std::__cxx11::basic_string"* %333, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

; <label>:334                                     ; preds = %_ZNKSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEE3strEv.exit
  invoke void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_(%"class.std::vector"* nonnull @_ZN5EigenL12g_test_stackB5cxx11E, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %1)
          to label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit unwind label %433

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit: ; preds = %334
  %.phi.trans.insert = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %.pre81 = load i8*, i8** %.phi.trans.insert, align 8, !tbaa !8
  %.pre84 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %.pre86 = bitcast %union.anon* %.pre84 to i8*
  %335 = icmp eq i8* %.pre81, %.pre86
  br i1 %335, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, label %336

; <label>:336                                     ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit
  call void @_ZdlPv(i8* %.pre81) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit: ; preds = %336, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit.thread
  %337 = load i32, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  call void @srand(i32 %337) #2
  %338 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([21 x i8], [21 x i8]* @.str.21, i64 0, i64 0), i64 20)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24 unwind label %429

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24: ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit
  %339 = load i32, i32* @_ZN5EigenL8g_repeatE, align 4, !tbaa !31
  %340 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i32 %339)
          to label %341 unwind label %429

; <label>:341                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24
  %342 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) %340, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0), i64 6)
          to label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26 unwind label %429

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26: ; preds = %341
  %343 = bitcast %"class.std::basic_ostream"* %340 to i8**
  %344 = load i8*, i8** %343, align 8, !tbaa !17
  %345 = getelementptr i8, i8* %344, i64 -24
  %346 = bitcast i8* %345 to i64*
  %347 = load i64, i64* %346, align 8
  %348 = bitcast %"class.std::basic_ostream"* %340 to i8*
  %349 = getelementptr inbounds i8, i8* %348, i64 %347
  %350 = getelementptr inbounds i8, i8* %349, i64 240
  %351 = bitcast i8* %350 to %"class.std::ctype"**
  %352 = load %"class.std::ctype"*, %"class.std::ctype"** %351, align 8, !tbaa !26
  %353 = icmp eq %"class.std::ctype"* %352, null
  br i1 %353, label %354, label %.noexc58

; <label>:354                                     ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %.noexc72 unwind label %429

.noexc72:                                         ; preds = %354
  unreachable

.noexc58:                                         ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit26
  %355 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %352, i64 0, i32 8
  %356 = load i8, i8* %355, align 8, !tbaa !29
  %357 = icmp eq i8 %356, 0
  br i1 %357, label %361, label %358

; <label>:358                                     ; preds = %.noexc58
  %359 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %352, i64 0, i32 9, i64 10
  %360 = load i8, i8* %359, align 1, !tbaa !14
  br label %.noexc28

; <label>:361                                     ; preds = %.noexc58
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %352)
          to label %.noexc61 unwind label %429

.noexc61:                                         ; preds = %361
  %362 = bitcast %"class.std::ctype"* %352 to i8 (%"class.std::ctype"*, i8)***
  %363 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %362, align 8, !tbaa !17
  %364 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %363, i64 6
  %365 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %364, align 8
  %366 = invoke signext i8 %365(%"class.std::ctype"* nonnull %352, i8 signext 10)
          to label %.noexc28 unwind label %429

.noexc28:                                         ; preds = %.noexc61, %358
  %.0.i60 = phi i8 [ %360, %358 ], [ %366, %.noexc61 ]
  %367 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %340, i8 signext %.0.i60)
          to label %.noexc29 unwind label %429

.noexc29:                                         ; preds = %.noexc28
  %368 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %367)
          to label %_ZNSolsEPFRSoS_E.exit unwind label %429

_ZNSolsEPFRSoS_E.exit:                            ; preds = %.noexc29
  %369 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 2
  %370 = bitcast %"class.std::__cxx11::basic_string"* %2 to %union.anon**
  store %union.anon* %369, %union.anon** %370, align 8, !tbaa !12
  %371 = bitcast %union.anon* %369 to i8*
  %372 = bitcast i64* %__dnew.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %372) #2
  store i64 22, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %373 = invoke i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"* nonnull %2, i64* nonnull dereferenceable(8) %__dnew.i.i.i.i, i64 0)
          to label %.noexc32 unwind label %443

.noexc32:                                         ; preds = %_ZNSolsEPFRSoS_E.exit
  %374 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 0, i32 0
  store i8* %373, i8** %374, align 8, !tbaa !8
  %375 = load i64, i64* %__dnew.i.i.i.i, align 8, !tbaa !15
  %376 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 2, i32 0
  store i64 %375, i64* %376, align 8, !tbaa !15
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %373, i8* nonnull getelementptr inbounds ([23 x i8], [23 x i8]* @.str.23, i64 0, i64 0), i64 22, i32 1, i1 false) #2
  %377 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %2, i64 0, i32 1
  store i64 %375, i64* %377, align 8, !tbaa !13
  %378 = load i8*, i8** %374, align 8, !tbaa !8
  %379 = getelementptr inbounds i8, i8* %378, i64 %375
  store i8 0, i8* %379, align 1, !tbaa !14
  call void @llvm.lifetime.end(i64 8, i8* %372) #2
  %380 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  %381 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 2), align 8, !tbaa !32
  %382 = icmp eq %"class.std::__cxx11::basic_string"* %380, %381
  br i1 %382, label %398, label %383

; <label>:383                                     ; preds = %.noexc32
  %384 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 2
  %385 = bitcast %"class.std::__cxx11::basic_string"* %380 to %union.anon**
  store %union.anon* %384, %union.anon** %385, align 8, !tbaa !12
  %386 = load i8*, i8** %374, align 8, !tbaa !8
  %387 = icmp eq i8* %386, %371
  br i1 %387, label %388, label %390

; <label>:388                                     ; preds = %383
  %389 = bitcast %union.anon* %384 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %389, i8* nonnull %371, i64 16, i32 1, i1 false) #2
  %.pre82 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread

; <label>:390                                     ; preds = %383
  %391 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 0, i32 0
  store i8* %386, i8** %391, align 8, !tbaa !8
  %392 = load i64, i64* %376, align 8, !tbaa !15
  %393 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 2, i32 0
  store i64 %392, i64* %393, align 8, !tbaa !15
  br label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread: ; preds = %390, %388
  %394 = phi %"class.std::__cxx11::basic_string"* [ %380, %390 ], [ %.pre82, %388 ]
  %395 = load i64, i64* %377, align 8, !tbaa !13
  %396 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %380, i64 0, i32 1
  store i64 %395, i64* %396, align 8, !tbaa !13
  store %union.anon* %369, %union.anon** %370, align 8, !tbaa !8
  store i64 0, i64* %377, align 8, !tbaa !13
  store i8 0, i8* %371, align 8, !tbaa !14
  %397 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %394, i64 1
  store %"class.std::__cxx11::basic_string"* %397, %"class.std::__cxx11::basic_string"** getelementptr inbounds (%"class.std::vector", %"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E, i64 0, i32 0, i32 0, i32 1), align 8, !tbaa !7
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36

; <label>:398                                     ; preds = %.noexc32
  invoke void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_(%"class.std::vector"* nonnull @_ZN5EigenL12g_test_stackB5cxx11E, %"class.std::__cxx11::basic_string"* nonnull dereferenceable(32) %2)
          to label %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35 unwind label %447

_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35: ; preds = %398
  %.pre83 = load i8*, i8** %374, align 8, !tbaa !8
  %399 = icmp eq i8* %.pre83, %371
  br i1 %399, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36, label %400

; <label>:400                                     ; preds = %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35
  call void @_ZdlPv(i8* %.pre83) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36: ; preds = %400, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35, %_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE9push_backEOS5_.exit35.thread
  invoke void @_Z27test_cuda_elementwise_smallv()
          to label %401 unwind label %429

; <label>:401                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36
  %402 = load i64, i64* bitcast ([10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE to i64*), align 8
  %403 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i64*
  store i64 %402, i64* %403, align 8, !tbaa !17
  %404 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 8) to i64*), align 8
  %.cast.i.i = inttoptr i64 %402 to i8*
  %405 = getelementptr i8, i8* %.cast.i.i, i64 -24
  %406 = bitcast i8* %405 to i64*
  %407 = load i64, i64* %406, align 8
  %408 = getelementptr inbounds i8, i8* %302, i64 %407
  %409 = bitcast i8* %408 to i64*
  store i64 %404, i64* %409, align 8, !tbaa !17
  %410 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 9) to i64*), align 8
  %411 = bitcast %"class.std::basic_ostream.base"* %303 to i64*
  store i64 %410, i64* %411, align 8, !tbaa !17
  %412 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %412, align 8, !tbaa !17
  %413 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 0, i32 0
  %414 = load i8*, i8** %413, align 8, !tbaa !8
  %415 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 2
  %416 = bitcast %union.anon* %415 to i8*
  %417 = icmp eq i8* %414, %416
  br i1 %417, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, label %418

; <label>:418                                     ; preds = %401
  call void @_ZdlPv(i8* %414) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit: ; preds = %418, %401
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %412, align 8, !tbaa !17
  %419 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* %419) #2
  %420 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i64*), align 8
  store i64 %420, i64* %403, align 8, !tbaa !17
  %421 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 3) to i64*), align 8
  %.cast.i.i.i.i = inttoptr i64 %420 to i8*
  %422 = getelementptr i8, i8* %.cast.i.i.i.i, i64 -24
  %423 = bitcast i8* %422 to i64*
  %424 = load i64, i64* %423, align 8
  %425 = getelementptr inbounds i8, i8* %302, i64 %424
  %426 = bitcast i8* %425 to i64*
  store i64 %421, i64* %426, align 8, !tbaa !17
  %427 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 0, i32 1
  store i64 0, i64* %427, align 8, !tbaa !33
  %428 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* %428) #2
  call void @llvm.lifetime.end(i64 392, i8* nonnull %302) #2
  br label %.thread

; <label>:429                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit36, %.noexc29, %.noexc28, %.noexc61, %361, %354, %341, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit24, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit, %_ZNSolsEj.exit, %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit22, %_ZNKSt5ctypeIcE5widenEc.exit57
  %430 = landingpad { i8*, i32 }
          cleanup
  %431 = extractvalue { i8*, i32 } %430, 0
  %432 = extractvalue { i8*, i32 } %430, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:433                                     ; preds = %334
  %434 = landingpad { i8*, i32 }
          cleanup
  %435 = extractvalue { i8*, i32 } %434, 0
  %436 = extractvalue { i8*, i32 } %434, 1
  %437 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 0, i32 0
  %438 = load i8*, i8** %437, align 8, !tbaa !8
  %439 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %1, i64 0, i32 2
  %440 = bitcast %union.anon* %439 to i8*
  %441 = icmp eq i8* %438, %440
  br i1 %441, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, label %442

; <label>:442                                     ; preds = %433
  call void @_ZdlPv(i8* %438) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:443                                     ; preds = %_ZNSolsEPFRSoS_E.exit
  %444 = landingpad { i8*, i32 }
          cleanup
  %445 = extractvalue { i8*, i32 } %444, 0
  %446 = extractvalue { i8*, i32 } %444, 1
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

; <label>:447                                     ; preds = %398
  %448 = landingpad { i8*, i32 }
          cleanup
  %449 = extractvalue { i8*, i32 } %448, 0
  %450 = extractvalue { i8*, i32 } %448, 1
  %451 = load i8*, i8** %374, align 8, !tbaa !8
  %452 = icmp eq i8* %451, %371
  br i1 %452, label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37, label %453

; <label>:453                                     ; preds = %447
  call void @_ZdlPv(i8* %451) #2
  br label %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37

_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37: ; preds = %453, %447, %443, %442, %433, %429
  %.16 = phi i8* [ %431, %429 ], [ %435, %433 ], [ %435, %442 ], [ %445, %443 ], [ %449, %447 ], [ %449, %453 ]
  %.1 = phi i32 [ %432, %429 ], [ %436, %433 ], [ %436, %442 ], [ %446, %443 ], [ %450, %447 ], [ %450, %453 ]
  %454 = load i64, i64* bitcast ([10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE to i64*), align 8
  %455 = bitcast %"class.std::__cxx11::basic_stringstream"* %ss to i64*
  store i64 %454, i64* %455, align 8, !tbaa !17
  %456 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 8) to i64*), align 8
  %.cast.i.i39 = inttoptr i64 %454 to i8*
  %457 = getelementptr i8, i8* %.cast.i.i39, i64 -24
  %458 = bitcast i8* %457 to i64*
  %459 = load i64, i64* %458, align 8
  %460 = getelementptr inbounds i8, i8* %302, i64 %459
  %461 = bitcast i8* %460 to i64*
  store i64 %456, i64* %461, align 8, !tbaa !17
  %462 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 9) to i64*), align 8
  %463 = bitcast %"class.std::basic_ostream.base"* %303 to i64*
  store i64 %462, i64* %463, align 8, !tbaa !17
  %464 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %464, align 8, !tbaa !17
  %465 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 0, i32 0
  %466 = load i8*, i8** %465, align 8, !tbaa !8
  %467 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 2, i32 2
  %468 = bitcast %union.anon* %467 to i8*
  %469 = icmp eq i8* %466, %468
  br i1 %469, label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41, label %470

; <label>:470                                     ; preds = %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37
  call void @_ZdlPv(i8* %466) #2
  br label %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41

_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit41: ; preds = %470, %_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev.exit37
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @_ZTVSt15basic_streambufIcSt11char_traitsIcEE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %464, align 8, !tbaa !17
  %471 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 1, i32 0, i32 7
  call void @_ZNSt6localeD1Ev(%"class.std::locale"* %471) #2
  %472 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 2) to i64*), align 8
  store i64 %472, i64* %455, align 8, !tbaa !17
  %473 = load i64, i64* bitcast (i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEE, i64 0, i64 3) to i64*), align 8
  %.cast.i.i.i.i40 = inttoptr i64 %472 to i8*
  %474 = getelementptr i8, i8* %.cast.i.i.i.i40, i64 -24
  %475 = bitcast i8* %474 to i64*
  %476 = load i64, i64* %475, align 8
  %477 = getelementptr inbounds i8, i8* %302, i64 %476
  %478 = bitcast i8* %477 to i64*
  store i64 %473, i64* %478, align 8, !tbaa !17
  %479 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 0, i32 0, i32 1
  store i64 0, i64* %479, align 8, !tbaa !33
  %480 = getelementptr inbounds %"class.std::__cxx11::basic_stringstream", %"class.std::__cxx11::basic_stringstream"* %ss, i64 0, i32 2, i32 0
  call void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"* %480) #2
  %481 = insertvalue { i8*, i32 } undef, i8* %.16, 0
  %482 = insertvalue { i8*, i32 } %481, i32 %.1, 1
  resume { i8*, i32 } %482

.thread:                                          ; preds = %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit, %_ZNKSt5ctypeIcE5widenEc.exit55, %_ZNKSt5ctypeIcE5widenEc.exit43, %_ZNKSt5ctypeIcE5widenEc.exit
  %.18 = phi i32 [ 1, %_ZNKSt5ctypeIcE5widenEc.exit55 ], [ 0, %_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEED1Ev.exit ], [ 1, %_ZNKSt5ctypeIcE5widenEc.exit ], [ 1, %_ZNKSt5ctypeIcE5widenEc.exit43 ]
  ret i32 %.18
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_Z22set_repeat_from_stringPKc(i8* %str) #7 comdat {
  %1 = tail call i32* @__errno_location() #16
  store i32 0, i32* %1, align 4, !tbaa !31
  %2 = tail call i64 @strtoul(i8* nocapture %str, i8** null, i32 10) #2
  %3 = trunc i64 %2 to i32
  store i32 %3, i32* @_ZN5EigenL8g_repeatE, align 4, !tbaa !31
  %4 = load i32, i32* %1, align 4, !tbaa !31
  %5 = icmp ne i32 %4, 0
  %6 = icmp slt i32 %3, 1
  %or.cond = or i1 %6, %5
  br i1 %or.cond, label %7, label %48

; <label>:7                                       ; preds = %0
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([22 x i8], [22 x i8]* @.str.26, i64 0, i64 0), i64 21)
  %9 = icmp eq i8* %str, null
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %7
  %11 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %12 = getelementptr i8, i8* %11, i64 -24
  %13 = bitcast i8* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %14
  %16 = bitcast i8* %15 to %"class.std::basic_ios"*
  %17 = getelementptr inbounds i8, i8* %15, i64 32
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 8, !tbaa !19
  %20 = or i32 %19, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %16, i32 %20)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

; <label>:21                                      ; preds = %7
  %22 = tail call i64 @strlen(i8* nonnull %str) #2
  %23 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %str, i64 %22)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %21, %10
  %24 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %25 = getelementptr i8, i8* %24, i64 -24
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %27
  %29 = getelementptr inbounds i8, i8* %28, i64 240
  %30 = bitcast i8* %29 to %"class.std::ctype"**
  %31 = load %"class.std::ctype"*, %"class.std::ctype"** %30, align 8, !tbaa !26
  %32 = icmp eq %"class.std::ctype"* %31, null
  br i1 %32, label %33, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:33                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %34 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 8
  %35 = load i8, i8* %34, align 8, !tbaa !29
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %40, label %37

; <label>:37                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %38 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 9, i64 10
  %39 = load i8, i8* %38, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:40                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %31)
  %41 = bitcast %"class.std::ctype"* %31 to i8 (%"class.std::ctype"*, i8)***
  %42 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %41, align 8, !tbaa !17
  %43 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %42, i64 6
  %44 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %43, align 8
  %45 = tail call signext i8 %44(%"class.std::ctype"* nonnull %31, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %40, %37
  %.0.i = phi i8 [ %39, %37 ], [ %45, %40 ]
  %46 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i)
  %47 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %46)
  tail call void @exit(i32 1) #17
  unreachable

; <label>:48                                      ; preds = %0
  store i1 true, i1* @_ZN5EigenL16g_has_set_repeatE, align 1
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_Z20set_seed_from_stringPKc(i8* %str) #7 comdat {
  %1 = tail call i32* @__errno_location() #16
  store i32 0, i32* %1, align 4, !tbaa !31
  %2 = tail call i64 @strtoul(i8* nocapture %str, i8** null, i32 10) #2
  %3 = trunc i64 %2 to i32
  store i32 %3, i32* @_ZN5EigenL6g_seedE, align 4, !tbaa !31
  %4 = load i32, i32* %1, align 4, !tbaa !31
  %5 = icmp ne i32 %4, 0
  %6 = icmp eq i32 %3, 0
  %or.cond = or i1 %6, %5
  br i1 %or.cond, label %7, label %48

; <label>:7                                       ; preds = %0
  %8 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([20 x i8], [20 x i8]* @.str.27, i64 0, i64 0), i64 19)
  %9 = icmp eq i8* %str, null
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %7
  %11 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %12 = getelementptr i8, i8* %11, i64 -24
  %13 = bitcast i8* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %14
  %16 = bitcast i8* %15 to %"class.std::basic_ios"*
  %17 = getelementptr inbounds i8, i8* %15, i64 32
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 8, !tbaa !19
  %20 = or i32 %19, 1
  tail call void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"* %16, i32 %20)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

; <label>:21                                      ; preds = %7
  %22 = tail call i64 @strlen(i8* nonnull %str) #2
  %23 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull %str, i64 %22)
  br label %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit

_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit: ; preds = %21, %10
  %24 = load i8*, i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 8, !tbaa !17
  %25 = getelementptr i8, i8* %24, i64 -24
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds i8, i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i64 %27
  %29 = getelementptr inbounds i8, i8* %28, i64 240
  %30 = bitcast i8* %29 to %"class.std::ctype"**
  %31 = load %"class.std::ctype"*, %"class.std::ctype"** %30, align 8, !tbaa !26
  %32 = icmp eq %"class.std::ctype"* %31, null
  br i1 %32, label %33, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

; <label>:33                                      ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.exit
  %34 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 8
  %35 = load i8, i8* %34, align 8, !tbaa !29
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %40, label %37

; <label>:37                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %38 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %31, i64 0, i32 9, i64 10
  %39 = load i8, i8* %38, align 1, !tbaa !14
  br label %_ZNKSt5ctypeIcE5widenEc.exit

; <label>:40                                      ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %31)
  %41 = bitcast %"class.std::ctype"* %31 to i8 (%"class.std::ctype"*, i8)***
  %42 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %41, align 8, !tbaa !17
  %43 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %42, i64 6
  %44 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %43, align 8
  %45 = tail call signext i8 %44(%"class.std::ctype"* nonnull %31, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %40, %37
  %.0.i = phi i8 [ %39, %37 ], [ %45, %40 ]
  %46 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8 signext %.0.i)
  %47 = tail call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %46)
  tail call void @exit(i32 1) #17
  unreachable

; <label>:48                                      ; preds = %0
  store i1 true, i1* @_ZN5EigenL14g_has_set_seedE, align 1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #0

; Function Attrs: nounwind readonly
declare i8* @getenv(i8* nocapture) #8

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: uwtable
declare void @_ZNSt7__cxx1118basic_stringstreamIcSt11char_traitsIcESaIcEEC1ESt13_Ios_Openmode(%"class.std::__cxx11::basic_stringstream"*, i32) unnamed_addr #4 align 2

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: uwtable
define void @_Z27test_cuda_elementwise_smallv() #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i:
  %d_in1 = alloca float*, align 8
  %d_in2 = alloca float*, align 8
  %d_out = alloca float*, align 8
  %0 = bitcast float** %d_in1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #2
  %1 = bitcast float** %d_in2 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1) #2
  %2 = bitcast float** %d_out to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #2
  %3 = bitcast float** %d_in1 to i8**
  %4 = call i32 @cudaMalloc(i8** %3, i64 8)
  %5 = bitcast float** %d_in2 to i8**
  %6 = call i32 @cudaMalloc(i8** %5, i64 8)
  %7 = bitcast float** %d_out to i8**
  %8 = call i32 @cudaMalloc(i8** %7, i64 8)
  %9 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i64 0, i64 0), i64 6)
  %10 = load i8*, i8** %7, align 8, !tbaa !16
  %11 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIPKvEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8* %10)
  %12 = bitcast %"class.std::basic_ostream"* %11 to i8**
  %13 = load i8*, i8** %12, align 8, !tbaa !17
  %14 = getelementptr i8, i8* %13, i64 -24
  %15 = bitcast i8* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = bitcast %"class.std::basic_ostream"* %11 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 %16
  %19 = getelementptr inbounds i8, i8* %18, i64 240
  %20 = bitcast i8* %19 to %"class.std::ctype"**
  %21 = load %"class.std::ctype"*, %"class.std::ctype"** %20, align 8, !tbaa !26
  %22 = icmp eq %"class.std::ctype"* %21, null
  br i1 %22, label %.noexc46, label %.noexc35

.noexc46:                                         ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  call void @_ZSt16__throw_bad_castv() #15
  unreachable

.noexc35:                                         ; preds = %_ZN5Eigen8internal23check_size_for_overflowIfEEvm.exit.i.i.i
  %23 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %21, i64 0, i32 8
  %24 = load i8, i8* %23, align 8, !tbaa !29
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %.noexc37, label %26

; <label>:26                                      ; preds = %.noexc35
  %27 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %21, i64 0, i32 9, i64 10
  %28 = load i8, i8* %27, align 1, !tbaa !14
  br label %.noexc19

.noexc37:                                         ; preds = %.noexc35
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %21)
  %29 = bitcast %"class.std::ctype"* %21 to i8 (%"class.std::ctype"*, i8)***
  %30 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %29, align 8, !tbaa !17
  %31 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %30, i64 6
  %32 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %31, align 8
  %33 = call signext i8 %32(%"class.std::ctype"* nonnull %21, i8 signext 10)
  br label %.noexc19

.noexc19:                                         ; preds = %.noexc37, %26
  %.0.i = phi i8 [ %28, %26 ], [ %33, %.noexc37 ]
  %34 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %11, i8 signext %.0.i)
  %35 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %34)
  %36 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* nonnull dereferenceable(272) @_ZSt4cout, i8* nonnull getelementptr inbounds ([7 x i8], [7 x i8]* @.str.25, i64 0, i64 0), i64 6)
  %37 = load i8*, i8** %5, align 8, !tbaa !16
  %38 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIPKvEERSoT_(%"class.std::basic_ostream"* nonnull @_ZSt4cout, i8* %37)
  %39 = bitcast %"class.std::basic_ostream"* %38 to i8**
  %40 = load i8*, i8** %39, align 8, !tbaa !17
  %41 = getelementptr i8, i8* %40, i64 -24
  %42 = bitcast i8* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = bitcast %"class.std::basic_ostream"* %38 to i8*
  %45 = getelementptr inbounds i8, i8* %44, i64 %43
  %46 = getelementptr inbounds i8, i8* %45, i64 240
  %47 = bitcast i8* %46 to %"class.std::ctype"**
  %48 = load %"class.std::ctype"*, %"class.std::ctype"** %47, align 8, !tbaa !26
  %49 = icmp eq %"class.std::ctype"* %48, null
  br i1 %49, label %.noexc47, label %.noexc39

.noexc47:                                         ; preds = %.noexc19
  call void @_ZSt16__throw_bad_castv() #15
  unreachable

.noexc39:                                         ; preds = %.noexc19
  %50 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %48, i64 0, i32 8
  %51 = load i8, i8* %50, align 8, !tbaa !29
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %.noexc43, label %53

; <label>:53                                      ; preds = %.noexc39
  %54 = getelementptr inbounds %"class.std::ctype", %"class.std::ctype"* %48, i64 0, i32 9, i64 10
  %55 = load i8, i8* %54, align 1, !tbaa !14
  br label %.noexc29

.noexc43:                                         ; preds = %.noexc39
  call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* nonnull %48)
  %56 = bitcast %"class.std::ctype"* %48 to i8 (%"class.std::ctype"*, i8)***
  %57 = load i8 (%"class.std::ctype"*, i8)**, i8 (%"class.std::ctype"*, i8)*** %56, align 8, !tbaa !17
  %58 = getelementptr inbounds i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %57, i64 6
  %59 = load i8 (%"class.std::ctype"*, i8)*, i8 (%"class.std::ctype"*, i8)** %58, align 8
  %60 = call signext i8 %59(%"class.std::ctype"* nonnull %48, i8 signext 10)
  br label %.noexc29

.noexc29:                                         ; preds = %.noexc43, %53
  %.0.i42 = phi i8 [ %55, %53 ], [ %60, %.noexc43 ]
  %61 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* nonnull %38, i8 signext %.0.i42)
  %62 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* nonnull %61)
  %63 = load i8*, i8** %3, align 8, !tbaa !16
  %64 = call i32 @cudaFree(i8* %63)
  %65 = load i8*, i8** %5, align 8, !tbaa !16
  %66 = call i32 @cudaFree(i8* %65)
  %67 = load i8*, i8** %7, align 8, !tbaa !16
  %68 = call i32 @cudaFree(i8* %67)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #2
  ret void
}

declare i32 @cudaMalloc(i8**, i64) #0

declare i32 @cudaFree(i8*) #0

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #9

; Function Attrs: nounwind
declare i64 @strtoul(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #10

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #11

declare i8* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(%"class.std::__cxx11::basic_string"*, i64* dereferenceable(8), i64) #0

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #8

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(%"class.std::basic_ostream"* dereferenceable(272), i8*, i64) #0

declare void @_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate(%"class.std::basic_ios"*, i32) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() #12

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertImEERSoT_(%"class.std::basic_ostream"*, i64) #0

; Function Attrs: nounwind
declare void @_ZNSt6localeD1Ev(%"class.std::locale"*) #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_baseD2Ev(%"class.std::ios_base"*) #1

; Function Attrs: uwtable
declare void @_ZNKSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEE3strEv(%"class.std::__cxx11::basic_string"* noalias sret, %"class.std::__cxx11::basic_stringbuf"*) #4 align 2

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_emplace_back_auxIJS5_EEEvDpOT_(%"class.std::vector"* nocapture %this, %"class.std::__cxx11::basic_string"* dereferenceable(32) %__args) #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit:
  %0 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 1
  %1 = bitcast %"class.std::__cxx11::basic_string"** %0 to i64*
  %2 = load i64, i64* %1, align 8, !tbaa !7
  %3 = bitcast %"class.std::vector"* %this to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !1
  %5 = sub i64 %2, %4
  %6 = ashr exact i64 %5, 5
  %7 = icmp eq i64 %6, 0
  %8 = select i1 %7, i64 1, i64 %6
  %9 = add nsw i64 %8, %6
  %10 = icmp ult i64 %9, %6
  %11 = icmp ugt i64 %9, 576460752303423487
  %or.cond.i = or i1 %10, %11
  %12 = select i1 %or.cond.i, i64 576460752303423487, i64 %9
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit, label %14

; <label>:14                                      ; preds = %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit
  %15 = icmp ugt i64 %12, 576460752303423487
  br i1 %15, label %16, label %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i

; <label>:16                                      ; preds = %14
  tail call void @_ZSt17__throw_bad_allocv() #15
  unreachable

_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i: ; preds = %14
  %17 = shl i64 %12, 5
  %18 = tail call noalias i8* @_Znwm(i64 %17)
  %19 = bitcast i8* %18 to %"class.std::__cxx11::basic_string"*
  %.pre = load i64, i64* %1, align 8, !tbaa !7
  %.pre6 = load i64, i64* %3, align 8, !tbaa !1
  br label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit: ; preds = %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit
  %20 = phi i64 [ %.pre6, %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i ], [ %4, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit ]
  %21 = phi i64 [ %.pre, %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i ], [ %2, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit ]
  %22 = phi %"class.std::__cxx11::basic_string"* [ %19, %_ZNSt16allocator_traitsISaINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE8allocateERS6_m.exit.i ], [ null, %_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_M_check_lenEmPKc.exit ]
  %23 = sub i64 %21, %20
  %24 = ashr exact i64 %23, 5
  %25 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24
  %26 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24, i32 2
  %27 = bitcast %"class.std::__cxx11::basic_string"* %25 to %union.anon**
  store %union.anon* %26, %union.anon** %27, align 8, !tbaa !12
  %28 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8, !tbaa !8
  %30 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 2
  %31 = bitcast %union.anon* %30 to i8*
  %32 = icmp eq i8* %29, %31
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit
  %34 = bitcast %union.anon* %26 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* %29, i64 16, i32 1, i1 false) #2
  br label %40

; <label>:35                                      ; preds = %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm.exit
  %36 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %25, i64 0, i32 0, i32 0
  store i8* %29, i8** %36, align 8, !tbaa !8
  %37 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 2, i32 0
  %38 = load i64, i64* %37, align 8, !tbaa !15
  %39 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24, i32 2, i32 0
  store i64 %38, i64* %39, align 8, !tbaa !15
  br label %40

; <label>:40                                      ; preds = %35, %33
  %41 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__args, i64 0, i32 1
  %42 = load i64, i64* %41, align 8, !tbaa !13
  %43 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %24, i32 1
  store i64 %42, i64* %43, align 8, !tbaa !13
  %44 = bitcast %"class.std::__cxx11::basic_string"* %__args to %union.anon**
  store %union.anon* %30, %union.anon** %44, align 8, !tbaa !8
  store i64 0, i64* %41, align 8, !tbaa !13
  store i8 0, i8* %31, align 1, !tbaa !14
  %45 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 0
  %46 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  %47 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %0, align 8, !tbaa !7
  %48 = icmp eq %"class.std::__cxx11::basic_string"* %46, %47
  br i1 %48, label %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread, label %.lr.ph.preheader.i.i.i.i

_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread: ; preds = %40
  %49 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 1
  br label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5

.lr.ph.preheader.i.i.i.i:                         ; preds = %40
  %scevgep.i.i.i.i = getelementptr %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %47, i64 -1, i32 0, i32 0
  br label %.lr.ph.i.i.i.i

.lr.ph.i.i.i.i:                                   ; preds = %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i, %.lr.ph.preheader.i.i.i.i
  %__cur.02.i.i.i.i = phi %"class.std::__cxx11::basic_string"* [ %69, %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i ], [ %22, %.lr.ph.preheader.i.i.i.i ]
  %__first.sroa.0.01.i.i.i.i = phi %"class.std::__cxx11::basic_string"* [ %68, %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i ], [ %46, %.lr.ph.preheader.i.i.i.i ]
  %50 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 2
  %51 = bitcast %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i to %union.anon**
  store %union.anon* %50, %union.anon** %51, align 8, !tbaa !12
  %52 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 0, i32 0
  %53 = load i8*, i8** %52, align 8, !tbaa !8
  %54 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 2
  %55 = bitcast %union.anon* %54 to i8*
  %56 = icmp eq i8* %53, %55
  br i1 %56, label %57, label %59

; <label>:57                                      ; preds = %.lr.ph.i.i.i.i
  %58 = bitcast %union.anon* %50 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %58, i8* %53, i64 16, i32 1, i1 false) #2
  br label %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i

; <label>:59                                      ; preds = %.lr.ph.i.i.i.i
  %60 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 0, i32 0
  store i8* %53, i8** %60, align 8, !tbaa !8
  %61 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 2, i32 0
  %62 = load i64, i64* %61, align 8, !tbaa !15
  %63 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 2, i32 0
  store i64 %62, i64* %63, align 8, !tbaa !15
  br label %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i

_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i: ; preds = %59, %57
  %64 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 0, i32 1
  %65 = load i64, i64* %64, align 8, !tbaa !13
  %66 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 0, i32 1
  store i64 %65, i64* %66, align 8, !tbaa !13
  %67 = bitcast %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i to %union.anon**
  store %union.anon* %54, %union.anon** %67, align 8, !tbaa !8
  store i64 0, i64* %64, align 8, !tbaa !13
  store i8 0, i8* %55, align 1, !tbaa !14
  %68 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__first.sroa.0.01.i.i.i.i, i64 1
  %69 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %__cur.02.i.i.i.i, i64 1
  %70 = icmp eq %"class.std::__cxx11::basic_string"* %68, %47
  br i1 %70, label %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit, label %.lr.ph.i.i.i.i

_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit: ; preds = %_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJS5_EEvPT_DpOT0_.exit.i.i.i.i
  %71 = ptrtoint i8** %scevgep.i.i.i.i to i64
  %__first.coerce4.i.i.i.i = ptrtoint %"class.std::__cxx11::basic_string"* %46 to i64
  %72 = sub i64 %71, %__first.coerce4.i.i.i.i
  %73 = lshr i64 %72, 5
  %74 = add nuw nsw i64 %73, 1
  %scevgep6.i.i.i.i = getelementptr %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %74
  %.pre7 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  %.pre8 = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %0, align 8, !tbaa !7
  %75 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %scevgep6.i.i.i.i, i64 1
  %76 = icmp eq %"class.std::__cxx11::basic_string"* %.pre7, %.pre8
  br i1 %76, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5, label %.lr.ph.i.i.i3.preheader

.lr.ph.i.i.i3.preheader:                          ; preds = %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit
  br label %.lr.ph.i.i.i3

.lr.ph.i.i.i3:                                    ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4, %.lr.ph.i.i.i3.preheader
  %.01.i.i.i2 = phi %"class.std::__cxx11::basic_string"* [ %83, %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4 ], [ %.pre7, %.lr.ph.i.i.i3.preheader ]
  %77 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i2, i64 0, i32 0, i32 0
  %78 = load i8*, i8** %77, align 8, !tbaa !8
  %79 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i2, i64 0, i32 2
  %80 = bitcast %union.anon* %79 to i8*
  %81 = icmp eq i8* %78, %80
  br i1 %81, label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4, label %82

; <label>:82                                      ; preds = %.lr.ph.i.i.i3
  tail call void @_ZdlPv(i8* %78) #2
  br label %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4

_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4: ; preds = %82, %.lr.ph.i.i.i3
  %83 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %.01.i.i.i2, i64 1
  %84 = icmp eq %"class.std::__cxx11::basic_string"* %83, %.pre8
  br i1 %84, label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split, label %.lr.ph.i.i.i3

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split: ; preds = %_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_.exit.i.i.i4
  %.pr = load %"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  br label %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5

_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5: ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread
  %85 = phi %"class.std::__cxx11::basic_string"* [ %75, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split ], [ %75, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit ], [ %49, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread ]
  %86 = phi %"class.std::__cxx11::basic_string"* [ %.pr, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5thread-pre-split ], [ %.pre8, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit ], [ %46, %_ZSt34__uninitialized_move_if_noexcept_aIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_SaIS5_EET0_T_S9_S8_RT1_.exit.thread ]
  %87 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 2
  %88 = icmp eq %"class.std::__cxx11::basic_string"* %86, null
  br i1 %88, label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1, label %89

; <label>:89                                      ; preds = %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5
  %90 = bitcast %"class.std::__cxx11::basic_string"* %86 to i8*
  tail call void @_ZdlPv(i8* %90) #2
  br label %_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1

_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m.exit1: ; preds = %89, %_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_EvT_S7_RSaIT0_E.exit5
  store %"class.std::__cxx11::basic_string"* %22, %"class.std::__cxx11::basic_string"** %45, align 8, !tbaa !1
  store %"class.std::__cxx11::basic_string"* %85, %"class.std::__cxx11::basic_string"** %0, align 8, !tbaa !7
  %91 = getelementptr inbounds %"class.std::__cxx11::basic_string", %"class.std::__cxx11::basic_string"* %22, i64 %12
  store %"class.std::__cxx11::basic_string"* %91, %"class.std::__cxx11::basic_string"** %87, align 8, !tbaa !32
  ret void
}

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() #12

; Function Attrs: nobuiltin
declare noalias nonnull i8* @_Znwm(i64) #13

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSo9_M_insertIPKvEERSoT_(%"class.std::basic_ostream"*, i8*) #0

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_test_cuda_elementwise_small.cu() #4 section ".text.startup" personality i32 (...)* @__gxx_personality_v0 {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #2
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E to i8*), i8 0, i64 24, i32 8, i1 false) #2
  %2 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::vector"*)* @_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev to void (i8*)*), i8* bitcast (%"class.std::vector"* @_ZN5EigenL12g_test_stackB5cxx11E to i8*), i8* nonnull @__dso_handle) #2
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_ctor(i8* nocapture) #14 {
entry:
  ret void
}

; Function Attrs: norecurse nounwind readnone
define internal void @__cuda_module_dtor(i8* nocapture) #14 {
entry:
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { inlinehint uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nobuiltin "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { norecurse nounwind readnone }
attributes #15 = { noreturn }
attributes #16 = { nounwind readnone }
attributes #17 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!1 = !{!2, !4, i64 0}
!2 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !3, i64 0}
!3 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !4, i64 0, !4, i64 8, !4, i64 16}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!2, !4, i64 8}
!8 = !{!9, !4, i64 0}
!9 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !10, i64 0, !11, i64 8, !5, i64 16}
!10 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !4, i64 0}
!11 = !{!"long", !5, i64 0}
!12 = !{!10, !4, i64 0}
!13 = !{!9, !11, i64 8}
!14 = !{!5, !5, i64 0}
!15 = !{!11, !11, i64 0}
!16 = !{!4, !4, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"vtable pointer", !6, i64 0}
!19 = !{!20, !22, i64 32}
!20 = !{!"_ZTSSt8ios_base", !11, i64 8, !11, i64 16, !21, i64 24, !22, i64 28, !22, i64 32, !4, i64 40, !23, i64 48, !5, i64 64, !24, i64 192, !4, i64 200, !25, i64 208}
!21 = !{!"_ZTSSt13_Ios_Fmtflags", !5, i64 0}
!22 = !{!"_ZTSSt12_Ios_Iostate", !5, i64 0}
!23 = !{!"_ZTSNSt8ios_base6_WordsE", !4, i64 0, !11, i64 8}
!24 = !{!"int", !5, i64 0}
!25 = !{!"_ZTSSt6locale", !4, i64 0}
!26 = !{!27, !4, i64 240}
!27 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !4, i64 216, !5, i64 224, !28, i64 225, !4, i64 232, !4, i64 240, !4, i64 248, !4, i64 256}
!28 = !{!"bool", !5, i64 0}
!29 = !{!30, !5, i64 56}
!30 = !{!"_ZTSSt5ctypeIcE", !4, i64 16, !28, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !5, i64 56, !5, i64 57, !5, i64 313, !5, i64 569}
!31 = !{!24, !24, i64 0}
!32 = !{!2, !4, i64 16}
!33 = !{!34, !11, i64 8}
!34 = !{!"_ZTSSi", !11, i64 8}
