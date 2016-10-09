; ModuleID = 'test/generated/testcudakernel1-hostraw.ll'
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
%struct.MyStruct = type { i32, float }
%struct.float4 = type { float, float, float, float }
%struct.hasArray = type { [4 x i32] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [31 x i8] c"You called: someHostFunction()\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"myprintint \00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"myprintfloat \00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"myprintvoid* \00", align 1
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_testcudakernel1.cu, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_ctor to void ()*), i8* null }]
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* bitcast (void (i8*)* @__cuda_module_dtor to void ()*), i8* null }]
@__opencl_sourcecode = global [26397 x i8] c"struct MyStruct {\0A    int f0;\0A    float f1;\0A};\0A\0Astruct hasArray {\0A    int f0[4];\0A};\0A\0A\0A\0Afloat _Z3barff(float a, float b);\0Avoid _Z7incrvalPf(float* a);\0Afloat4 _Z9getfloat4f(float a);\0Afloat _Z19getfloat4ElementSumfii(float a, int e0, int e1);\0Afloat _Z16declaredAfterUseff(float val1, float val2);\0A\0Afloat _Z3barff(float a, float b) {\0A    label0:;\0A    float v1 = a + b;\0A    return v1;\0A}\0A\0Avoid _Z7incrvalPf(float* a) {\0A    label0:;\0A    float v1 = a[0];\0A    float v2 = v1 + 3.0f;\0A    a[0] = v2;\0A}\0A\0Akernel void _Z3fooPf(global float* data) {\0A    label0:;\0A    data[0] = 123.0f;\0A}\0A\0Akernel void _Z7use_tidPf(global float* data) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    long v2 = v1;\0A    global float* v3 = (&data[v2]);\0A    v3[0] = 123.0f;\0A}\0A\0Akernel void _Z8use_tid2Pi(global int* data) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    long v2 = v1;\0A    global int* v3 = (&data[v2]);\0A    int v4 = v3[0];\0A    int v5 = v4 + v1;\0A    v3[0] = v5;\0A}\0A\0Akernel void _Z10copy_floatPf(global float* a) {\0A    label0:;\0A    global float* v1 = (&a[1]);\0A    global int* v2 = ((global int*)v1);\0A    int v3 = v2[0];\0A    global int* v4 = ((global int*)a);\0A    v4[0] = v3;\0A}\0A\0Akernel void _Z11use_blockidPf(global float* data) {\0A    label0:;\0A    int v1 = get_group_id(0);\0A    long v2 = v1;\0A    global float* v3 = (&data[v2]);\0A    v3[0] = 123.0f;\0A}\0A\0Akernel void _Z11use_griddimPf(global float* data) {\0A    label0:;\0A    int v1 = get_num_groups(0);\0A    long v2 = v1;\0A    global float* v3 = (&data[v2]);\0A    v3[0] = 123.0f;\0A}\0A\0Akernel void _Z12use_blockdimPf(global float* data) {\0A    label0:;\0A    int v1 = get_local_size(0);\0A    long v2 = v1;\0A    global float* v3 = (&data[v2]);\0A    v3[0] = 123.0f;\0A}\0A\0Akernel void _Z13use_template1PfPi(global float* data, global int* intdata) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    bool v2 = v1 == 0;\0A    if(v2) {\0A        goto v4;\0A    } else {\0A        goto v5;\0A    }\0A    v4:;\0A    global float* v6 = (&data[1]);\0A    float v7 = v6[0];\0A    global float* v8 = (&data[2]);\0A    float v9 = v8[0];\0A    float v10 = v7 + v9;\0A    data[0] = v10;\0A    global int* v12 = (&intdata[1]);\0A    int v13 = v12[0];\0A    global int* v14 = (&intdata[2]);\0A    int v15 = v14[0];\0A    int v16 = v15 + v13;\0A    intdata[0] = v16;\0A        goto v5;\0A    v5:;\0A}\0A\0Akernel void _Z13someops_floatPf(global float* data) {\0A    label0:;\0A    global float* v1 = (&data[1]);\0A    float v2 = v1[0];\0A    global float* v3 = (&data[2]);\0A    float v4 = v3[0];\0A    float v5 = v2 - v4;\0A    float v6 = v2 / v4;\0A    float v7 = v5 + v6;\0A    float v8 = v4 * v2;\0A    float v9 = v7 + v8;\0A    data[0] = v9;\0A    float v11 = log(v2);\0A    float v12 = data[0];\0A    float v13 = v11 + v12;\0A    data[0] = v13;\0A    float v15 = v1[0];\0A    float v16 = exp(v15);\0A    float v17 = data[0];\0A    float v18 = v16 + v17;\0A    data[0] = v18;\0A    float v20 = v1[0];\0A    float v21 = tanh(v20);\0A    float v22 = data[0];\0A    float v23 = v21 + v22;\0A    data[0] = v23;\0A    float v25 = v1[0];\0A    float v26 = sqrt(v25);\0A    float v27 = data[0];\0A    float v28 = v27 - v26;\0A    data[0] = v28;\0A}\0A\0Akernel void _Z11someops_intPi(global int* data) {\0A    label0:;\0A    global int* v1 = (&data[1]);\0A    int v2 = v1[0];\0A    global int* v3 = (&data[2]);\0A    int v4 = v3[0];\0A    int v5 = v2 / v4;\0A    int v6 = v2 + v5;\0A    int v7 = v6 + v2;\0A    int v8 = v4 * v2;\0A    int v9 = v8 + v7;\0A    int v10 = v2 << v4;\0A    int v11 = v10 + v9;\0A    int v12 = v2 >> v4;\0A    int v13 = v12 + v11;\0A    data[0] = v13;\0A}\0A\0Akernel void _Z14testbooleanopsPi(global int* data) {\0A    label0:;\0A    int v1 = data[0];\0A    bool v2 = v1 > 0;\0A    global int* v3 = (&data[1]);\0A    int v4 = v3[0];\0A    bool v5 = v4 < 0;\0A    bool v6 = v2 & v5;\0A    int v7 = v6;\0A    global int* v8 = (&data[2]);\0A    v8[0] = v7;\0A    bool v10 = v2 | v5;\0A    int v11 = v10;\0A    global int* v12 = (&data[3]);\0A    v12[0] = v11;\0A    int v14 = v2;\0A    int v15 = v14 ^ 1;\0A    global int* v16 = (&data[4]);\0A    v16[0] = v15;\0A}\0A\0Akernel void _Z26testcomparisons_int_signedPi(global int* data) {\0A    label0:;\0A    int v1 = data[0];\0A    global int* v2 = (&data[1]);\0A    int v3 = v2[0];\0A    bool v4 = v1 >= v3;\0A    int v5 = v4;\0A    global int* v6 = (&data[5]);\0A    v6[0] = v5;\0A    bool v8 = v1 <= v3;\0A    int v9 = v8;\0A    global int* v10 = (&data[6]);\0A    v10[0] = v9;\0A    bool v12 = v1 > v3;\0A    int v13 = v12;\0A    global int* v14 = (&data[7]);\0A    v14[0] = v13;\0A    bool v16 = v1 < v3;\0A    int v17 = v16;\0A    global int* v18 = (&data[8]);\0A    v18[0] = v17;\0A    bool v20 = v1 == v3;\0A    int v21 = v20;\0A    global int* v22 = (&data[9]);\0A    v22[0] = v21;\0A    bool v24 = v1 != v3;\0A    int v25 = v24;\0A    global int* v26 = (&data[10]);\0A    v26[0] = v25;\0A}\0A\0Akernel void _Z21testcomparisons_floatPf(global float* data) {\0A    label0:;\0A    float v1 = data[0];\0A    global float* v2 = (&data[1]);\0A    float v3 = v2[0];\0A    bool v4 = v1 >= v3;\0A    float v5 = v4;\0A    global float* v6 = (&data[5]);\0A    v6[0] = v5;\0A    bool v8 = v1 <= v3;\0A    float v9 = v8;\0A    global float* v10 = (&data[6]);\0A    v10[0] = v9;\0A    bool v12 = v1 > v3;\0A    float v13 = v12;\0A    global float* v14 = (&data[7]);\0A    v14[0] = v13;\0A    bool v16 = v1 < v3;\0A    float v17 = v16;\0A    global float* v18 = (&data[8]);\0A    v18[0] = v17;\0A    bool v20 = v1 == v3;\0A    float v21 = v20;\0A    global float* v22 = (&data[9]);\0A    v22[0] = v21;\0A    bool v24 = v1 != v3;\0A    float v25 = v24;\0A    global float* v26 = (&data[10]);\0A    v26[0] = v25;\0A}\0A\0Akernel void _Z15testsyncthreadsPf(global float* data) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    long v2 = v1;\0A    global float* v3 = (&data[v2]);\0A    float v4 = v3[0];\0A    float v5 = v4 * 2.0f;\0A    v3[0] = v5;\0A    barrier(CLK_GLOBAL_MEM_FENCE);\0A    int v8 = v1 + 1;\0A    long v9 = v8;\0A    global float* v10 = (&data[v9]);\0A    float v11 = v10[0];\0A    float v12 = v11 + 2.0f;\0A    v10[0] = v12;\0A}\0A\0Akernel void _Z11testDoWhilePii(global int* data, int N) {\0A    int p_0;\0A    label0:;\0A    int v1 = get_global_id(0);\0A        p_0 = v1;\0A    goto v3;\0A    v3:;\0A    int v4 = p_0 + 1;\0A    long v5 = v4;\0A    global int* v6 = (&data[v5]);\0A    int v7 = v6[0];\0A    bool v8 = v7 == 0;\0A    if(v8) {\0A        goto v10;\0A    } else {\0A        p_0 = v4;\0A        goto v3;\0A    }\0A    v10:;\0A}\0A\0Akernel void _Z9testWhilePii(global int* data, int N) {\0A    int p_0;\0A    label0:;\0A    int v1 = get_global_id(0);\0A        p_0 = v1;\0A    goto v3;\0A    v3:;\0A    long v4 = p_0;\0A    global int* v5 = (&data[v4]);\0A    int v6 = v5[0];\0A    bool v7 = v6 == 0;\0A    int v8 = p_0 + 1;\0A    if(v7) {\0A        goto v10;\0A    } else {\0A        p_0 = v8;\0A        goto v3;\0A    }\0A    v10:;\0A}\0A\0Akernel void _Z6testIfPii(global int* data, int N) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    bool v2 = v1 < N;\0A    if(v2) {\0A        goto v4;\0A    } else {\0A        goto v5;\0A    }\0A    v4:;\0A    long v6 = v1;\0A    global int* v7 = (&data[v6]);\0A    int v8 = v7[0];\0A    int v9 = v8 << 1;\0A    v7[0] = v9;\0A        goto v5;\0A    v5:;\0A}\0A\0Akernel void _Z10testIfElsePii(global int* data, int N) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    bool v2 = v1 < N;\0A    long v3 = v1;\0A    global int* v4 = (&data[v3]);\0A    int v5 = v4[0];\0A    if(v2) {\0A        goto v7;\0A    } else {\0A        goto v8;\0A    }\0A    v7:;\0A    int v9 = v5 << 1;\0A    v4[0] = v9;\0A    int v11 = v1 + 3;\0A    long v12 = v11;\0A    global int* v13 = (&data[v12]);\0A    int v14 = v13[0];\0A    int v15 = v14 << 1;\0A    v13[0] = v15;\0A        goto v18;\0A    v8:;\0A    int v19 = v5 + -20;\0A    v4[0] = v19;\0A    int v21 = v1 + 5;\0A    long v22 = v21;\0A    global int* v23 = (&data[v22]);\0A    int v24 = v23[0];\0A    int v25 = v24 + -20;\0A    v23[0] = v25;\0A        goto v18;\0A    v18:;\0A}\0A\0Akernel void _Z11testTernaryPf(global float* data) {\0A    label0:;\0A    global float* v1 = (&data[1]);\0A    float v2 = v1[0];\0A    bool v3 = v2 > 0.0f;\0A    global float* v4 = (&data[2]);\0A    global float* v5 = (&data[3]);\0A    global float* v_in = v3 ? v4 : v5;\0A    global int* v6 = ((global int*)v_in);\0A    int v7 = v6[0];\0A    global int* v8 = ((global int*)data);\0A    v8[0] = v7;\0A}\0A\0Akernel void _Z7testForPfi(global float* data, int N) {\0A    int i_02;\0A    int i_02_prol;\0A    int i_02_unr;\0A    int prol_iter;\0A    float sum_01;\0A    float sum_01_prol;\0A    float sum_01_unr;\0A    float sum_0_lcssa;\0A    float v_lcssa;\0A    float v_lcssa3;\0A    float v_lcssa4;\0A    int v_lcssa5;\0A    float v_lcssa_unr;\0A    label0:;\0A    int v1 = get_global_id(0);\0A    bool v2 = v1 == 0;\0A    if(v2) {\0A        goto v_preheader;\0A    } else {\0A        goto v4;\0A    }\0A    v_preheader:;\0A    bool v5 = N > 0;\0A    if(v5) {\0A        goto v_lr_ph_preheader;\0A    } else {\0A        sum_0_lcssa = 0.0f;\0A        goto v__crit_edge;\0A    }\0A    v_lr_ph_preheader:;\0A    int v7 = N + -1;\0A    int xtraiter = N & 3;\0A    bool lcmp_mod = xtraiter == 0;\0A    if(lcmp_mod) {\0A        i_02_unr = 0;\0Asum_01_unr = 0.0f;\0A        goto v_lr_ph_preheader_split;\0A    } else {\0A        goto v_lr_ph_prol_preheader;\0A    }\0A    v_lr_ph_prol_preheader:;\0A        i_02_prol = 0;\0Asum_01_prol = 0.0f;\0Aprol_iter = xtraiter;\0A    goto v_lr_ph_prol;\0A    v_lr_ph_prol:;\0A    long v10 = i_02_prol;\0A    global float* v11 = (&data[v10]);\0A    float v12 = v11[0];\0A    float v13 = sum_01_prol + v12;\0A    int v14 = i_02_prol + 1;\0A    int prol_iter_sub = prol_iter + -1;\0A    bool prol_iter_cmp = prol_iter_sub == 0;\0A    if(prol_iter_cmp) {\0A        v_lcssa5 = v14;\0Av_lcssa4 = v13;\0A        goto v_lr_ph_preheader_split_loopexit;\0A    } else {\0A        i_02_prol = v14;\0Asum_01_prol = v13;\0Aprol_iter = prol_iter_sub;\0A        goto v_lr_ph_prol;\0A    }\0A    v_lr_ph_preheader_split_loopexit:;\0A        v_lcssa_unr = v_lcssa4;\0Ai_02_unr = v_lcssa5;\0Asum_01_unr = v_lcssa4;\0A    goto v_lr_ph_preheader_split;\0A    v_lr_ph_preheader_split:;\0A    bool v17 = v7 < 3;\0A    if(v17) {\0A        v_lcssa = v_lcssa_unr;\0A        goto v__crit_edge_loopexit;\0A    } else {\0A        goto v_lr_ph_preheader_split_split;\0A    }\0A    v_lr_ph_preheader_split_split:;\0A        i_02 = i_02_unr;\0Asum_01 = sum_01_unr;\0A    goto v_lr_ph;\0A    label20:;\0A        v_lcssa = v_lcssa3;\0A    goto v__crit_edge_loopexit;\0A    v__crit_edge_loopexit:;\0A        sum_0_lcssa = v_lcssa;\0A    goto v__crit_edge;\0A    v__crit_edge:;\0A    data[0] = sum_0_lcssa;\0A        goto v4;\0A    v_lr_ph:;\0A    long v25 = i_02;\0A    global float* v26 = (&data[v25]);\0A    float v27 = v26[0];\0A    float v28 = sum_01 + v27;\0A    int v29 = i_02 + 1;\0A    long v30 = v29;\0A    global float* v31 = (&data[v30]);\0A    float v32 = v31[0];\0A    float v33 = v28 + v32;\0A    int v34 = i_02 + 2;\0A    long v35 = v34;\0A    global float* v36 = (&data[v35]);\0A    float v37 = v36[0];\0A    float v38 = v33 + v37;\0A    int v39 = i_02 + 3;\0A    long v40 = v39;\0A    global float* v41 = (&data[v40]);\0A    float v42 = v41[0];\0A    float v43 = v38 + v42;\0A    int v44 = i_02 + 4;\0A    bool exitcond_3 = v44 == N;\0A    if(exitcond_3) {\0A        v_lcssa3 = v43;\0A        goto label20;\0A    } else {\0A        i_02 = v44;\0Asum_01 = v43;\0A        goto v_lr_ph;\0A    }\0A    v4:;\0A}\0A\0Akernel void _Z8setValuePfif(global float* data, int idx, float value) {\0A    label0:;\0A    int v1 = get_global_id(0);\0A    bool v2 = v1 == 0;\0A    if(v2) {\0A        goto v4;\0A    } else {\0A        goto v5;\0A    }\0A    v4:;\0A    long v6 = idx;\0A    global float* v7 = (&data[v6]);\0A    v7[0] = value;\0A        goto v5;\0A    v5:;\0A}\0A\0Akernel void _Z11testStructsP8MyStructPfPi(global struct MyStruct* structs, global float* float_data, global int* int_data) {\0A    label0:;\0A    global int* v1 = (&structs[0].f0);\0A    int v2 = v1[0];\0A    int_data[0] = v2;\0A    global float* v4 = (&structs[0].f1);\0A    global int* v5 = ((global int*)v4);\0A    int v6 = v5[0];\0A    global int* v7 = ((global int*)float_data);\0A    v7[0] = v6;\0A    global float* v9 = (&structs[1].f1);\0A    global int* v10 = ((global int*)v9);\0A    int v11 = v10[0];\0A    global float* v12 = (&float_data[1]);\0A    global int* v13 = ((global int*)v12);\0A    v13[0] = v11;\0A}\0A\0Akernel void _Z10testFloat4P6float4(global float4* data) {\0A    label0:;\0A    global float* v1 = (&((global float*)&data[1])[0]);\0A    global int* v2 = ((global int*)v1);\0A    int v3 = v2[0];\0A    global float* v4 = (&((global float*)&data[1])[2]);\0A    float v5 = v4[0];\0A    global float* v6 = (&((global float*)&data[1])[3]);\0A    float v7 = v6[0];\0A    float v8 = v5 * v7;\0A    global int* v9 = ((global int*)data);\0A    v9[0] = v3;\0A    global float* v11 = (&((global float*)&data[0])[1]);\0A    v11[0] = v8;\0A    global float* v13 = (&((global float*)&data[0])[2]);\0A    v13[0] = v5;\0A    global float* v15 = (&((global float*)&data[0])[3]);\0A    v15[0] = v7;\0A}\0A\0Akernel void _Z16testFloat4_test2P6float4(global float4* data) {\0A    label0:;\0A    global float4* v1 = (&data[1]);\0A    global char* v2 = ((global char*)data);\0A    global char* v3 = ((global char*)v1);\0A    ((global int4 *)v2)[0] = ((global int4 *)v3)[0];\0A}\0A\0Akernel void _Z16testFloat4_test3P6float4(global float4* data) {\0A    int i1_02;\0A    int i_03;\0A    label0:;\0A    float4 privateFloats[32];\0A    char* v1 = ((char*)privateFloats);\0A        i_03 = 0;\0A    goto v4;\0A    v4:;\0A    long v5 = i_03;\0A    float4* v6 = (&(&privateFloats)[0][v5]);\0A    global float4* v7 = (&data[v5]);\0A    char* v8 = ((char*)v6);\0A    global char* v9 = ((global char*)v7);\0A    (( int4 *)v8)[0] = ((global int4 *)v9)[0];\0A    int v11 = i_03 | 1;\0A    long v12 = v11;\0A    float4* v13 = (&(&privateFloats)[0][v12]);\0A    global float4* v14 = (&data[v12]);\0A    char* v15 = ((char*)v13);\0A    global char* v16 = ((global char*)v14);\0A    (( int4 *)v15)[0] = ((global int4 *)v16)[0];\0A    int v18 = i_03 | 2;\0A    long v19 = v18;\0A    float4* v20 = (&(&privateFloats)[0][v19]);\0A    global float4* v21 = (&data[v19]);\0A    char* v22 = ((char*)v20);\0A    global char* v23 = ((global char*)v21);\0A    (( int4 *)v22)[0] = ((global int4 *)v23)[0];\0A    int v25 = i_03 | 3;\0A    long v26 = v25;\0A    float4* v27 = (&(&privateFloats)[0][v26]);\0A    global float4* v28 = (&data[v26]);\0A    char* v29 = ((char*)v27);\0A    global char* v30 = ((global char*)v28);\0A    (( int4 *)v29)[0] = ((global int4 *)v30)[0];\0A    int v32 = i_03 + 4;\0A    bool exitcond4_3 = v32 == 32;\0A    if(exitcond4_3) {\0A        goto v_preheader_preheader;\0A    } else {\0A        i_03 = v32;\0A        goto v4;\0A    }\0A    v_preheader_preheader:;\0A        i1_02 = 0;\0A    goto v_preheader;\0A    label35:;\0A    v_preheader:;\0A    int v38 = i1_02 | 1;\0A    long v39 = v38;\0A    global float4* v40 = (&data[v39]);\0A    long v41 = i1_02;\0A    float4* v42 = (&(&privateFloats)[0][v41]);\0A    global char* v43 = ((global char*)v40);\0A    char* v44 = ((char*)v42);\0A    ((global int4 *)v43)[0] = (( int4 *)v44)[0];\0A    int v46 = i1_02 | 2;\0A    long v47 = v46;\0A    global float4* v48 = (&data[v47]);\0A    long v49 = v38;\0A    float4* v50 = (&(&privateFloats)[0][v49]);\0A    global char* v51 = ((global char*)v48);\0A    char* v52 = ((char*)v50);\0A    ((global int4 *)v51)[0] = (( int4 *)v52)[0];\0A    int v54 = i1_02 | 3;\0A    long v55 = v54;\0A    global float4* v56 = (&data[v55]);\0A    long v57 = v46;\0A    float4* v58 = (&(&privateFloats)[0][v57]);\0A    global char* v59 = ((global char*)v56);\0A    char* v60 = ((char*)v58);\0A    ((global int4 *)v59)[0] = (( int4 *)v60)[0];\0A    int v62 = i1_02 + 4;\0A    long v63 = v62;\0A    global float4* v64 = (&data[v63]);\0A    long v65 = v54;\0A    float4* v66 = (&(&privateFloats)[0][v65]);\0A    global char* v67 = ((global char*)v64);\0A    char* v68 = ((char*)v66);\0A    ((global int4 *)v67)[0] = (( int4 *)v68)[0];\0A    bool exitcond_3 = v62 == 32;\0A    if(exitcond_3) {\0A        goto label35;\0A    } else {\0A        i1_02 = v62;\0A        goto v_preheader;\0A    }\0A}\0A\0Akernel void _Z9testLocalPf(global float* data) {\0A    local float _ZZ9testLocalPfE8myshared[32];\0A    label0:;\0A    int v1 = get_global_id(0);\0A    long v2 = v1;\0A    global float* v3 = (&data[v2]);\0A    global int* v4 = ((global int*)v3);\0A    int v5 = v4[0];\0A    local float* v6 = (&(&_ZZ9testLocalPfE8myshared)[0][v2]);\0A    local int* v7 = ((local int*)v6);\0A    local int* v8 = (v7);\0A    v8[0] = v5;\0A    int v10 = v1 + 1;\0A    long v11 = v10;\0A    local float* v12 = (&(&_ZZ9testLocalPfE8myshared)[0][v11]);\0A    local int* v13 = ((local int*)v12);\0A    local int* v14 = (v13);\0A    int v15 = v14[0];\0A    global int* v16 = ((global int*)data);\0A    v16[0] = v15;\0A}\0A\0Akernel void _Z10testLocal2Pf(global float* data) {\0A    local float _ZZ10testLocal2PfE8myshared[64];\0A    label0:;\0A    int v1 = get_global_id(0);\0A    long v2 = v1;\0A    global float* v3 = (&data[v2]);\0A    global int* v4 = ((global int*)v3);\0A    int v5 = v4[0];\0A    local float* v6 = (&(&_ZZ10testLocal2PfE8myshared)[0][v2]);\0A    local int* v7 = ((local int*)v6);\0A    local int* v8 = (v7);\0A    v8[0] = v5;\0A    int v10 = v1 + 1;\0A    long v11 = v10;\0A    local float* v12 = (&(&_ZZ10testLocal2PfE8myshared)[0][v11]);\0A    local int* v13 = ((local int*)v12);\0A    local int* v14 = (v13);\0A    int v15 = v14[0];\0A    global int* v16 = ((global int*)data);\0A    v16[0] = v15;\0A    int v18 = v4[0];\0A    v14[0] = v18;\0A    int v20 = v8[0];\0A    global float* v21 = (&data[1]);\0A    global int* v22 = ((global int*)v21);\0A    v22[0] = v20;\0A}\0A\0Akernel void _Z9testArrayPf(global float* data) {\0A    int i_03;\0A    label0:;\0A    float privateFloats[32];\0A    char* v1 = ((char*)privateFloats);\0A        i_03 = 0;\0A    goto v4;\0A    v4:;\0A    int v5 = i_03 * 3;\0A    long v6 = v5;\0A    global float* v7 = (&data[v6]);\0A    global int* v8 = ((global int*)v7);\0A    int v9 = v8[0];\0A    long v10 = i_03;\0A    float* v11 = (&(&privateFloats)[0][v10]);\0A    int* v12 = ((int*)v11);\0A    v12[0] = v9;\0A    int v14 = i_03 | 1;\0A    int v15 = v14 * 3;\0A    long v16 = v15;\0A    global float* v17 = (&data[v16]);\0A    global int* v18 = ((global int*)v17);\0A    int v19 = v18[0];\0A    long v20 = v14;\0A    float* v21 = (&(&privateFloats)[0][v20]);\0A    int* v22 = ((int*)v21);\0A    v22[0] = v19;\0A    int v24 = i_03 | 2;\0A    int v25 = v24 * 3;\0A    long v26 = v25;\0A    global float* v27 = (&data[v26]);\0A    global int* v28 = ((global int*)v27);\0A    int v29 = v28[0];\0A    long v30 = v24;\0A    float* v31 = (&(&privateFloats)[0][v30]);\0A    int* v32 = ((int*)v31);\0A    v32[0] = v29;\0A    int v34 = i_03 | 3;\0A    int v35 = v34 * 3;\0A    long v36 = v35;\0A    global float* v37 = (&data[v36]);\0A    global int* v38 = ((global int*)v37);\0A    int v39 = v38[0];\0A    long v40 = v34;\0A    float* v41 = (&(&privateFloats)[0][v40]);\0A    int* v42 = ((int*)v41);\0A    v42[0] = v39;\0A    int v44 = i_03 + 4;\0A    bool exitcond_3 = v44 == 32;\0A    if(exitcond_3) {\0A        goto v_preheader_preheader;\0A    } else {\0A        i_03 = v44;\0A        goto v4;\0A    }\0A    v_preheader_preheader:;\0A    int* v46 = ((int*)privateFloats);\0A    int v47 = v46[0];\0A    global float* v48 = (&data[1]);\0A    global int* v49 = ((global int*)v48);\0A    v49[0] = v47;\0A    float* v51 = (&(&privateFloats)[0][2]);\0A    int* v52 = ((int*)v51);\0A    int v53 = v52[0];\0A    global float* v54 = (&data[3]);\0A    global int* v55 = ((global int*)v54);\0A    v55[0] = v53;\0A    float* v57 = (&(&privateFloats)[0][4]);\0A    int* v58 = ((int*)v57);\0A    int v59 = v58[0];\0A    global float* v60 = (&data[5]);\0A    global int* v61 = ((global int*)v60);\0A    v61[0] = v59;\0A    float* v63 = (&(&privateFloats)[0][6]);\0A    int* v64 = ((int*)v63);\0A    int v65 = v64[0];\0A    global float* v66 = (&data[7]);\0A    global int* v67 = ((global int*)v66);\0A    v67[0] = v65;\0A    float* v69 = (&(&privateFloats)[0][8]);\0A    int* v70 = ((int*)v69);\0A    int v71 = v70[0];\0A    global float* v72 = (&data[9]);\0A    global int* v73 = ((global int*)v72);\0A    v73[0] = v71;\0A    float* v75 = (&(&privateFloats)[0][10]);\0A    int* v76 = ((int*)v75);\0A    int v77 = v76[0];\0A    global float* v78 = (&data[11]);\0A    global int* v79 = ((global int*)v78);\0A    v79[0] = v77;\0A    float* v81 = (&(&privateFloats)[0][12]);\0A    int* v82 = ((int*)v81);\0A    int v83 = v82[0];\0A    global float* v84 = (&data[13]);\0A    global int* v85 = ((global int*)v84);\0A    v85[0] = v83;\0A    float* v87 = (&(&privateFloats)[0][14]);\0A    int* v88 = ((int*)v87);\0A    int v89 = v88[0];\0A    global float* v90 = (&data[15]);\0A    global int* v91 = ((global int*)v90);\0A    v91[0] = v89;\0A    float* v93 = (&(&privateFloats)[0][16]);\0A    int* v94 = ((int*)v93);\0A    int v95 = v94[0];\0A    global float* v96 = (&data[17]);\0A    global int* v97 = ((global int*)v96);\0A    v97[0] = v95;\0A    float* v99 = (&(&privateFloats)[0][18]);\0A    int* v100 = ((int*)v99);\0A    int v101 = v100[0];\0A    global float* v102 = (&data[19]);\0A    global int* v103 = ((global int*)v102);\0A    v103[0] = v101;\0A    float* v105 = (&(&privateFloats)[0][20]);\0A    int* v106 = ((int*)v105);\0A    int v107 = v106[0];\0A    global float* v108 = (&data[21]);\0A    global int* v109 = ((global int*)v108);\0A    v109[0] = v107;\0A    float* v111 = (&(&privateFloats)[0][22]);\0A    int* v112 = ((int*)v111);\0A    int v113 = v112[0];\0A    global float* v114 = (&data[23]);\0A    global int* v115 = ((global int*)v114);\0A    v115[0] = v113;\0A    float* v117 = (&(&privateFloats)[0][24]);\0A    int* v118 = ((int*)v117);\0A    int v119 = v118[0];\0A    global float* v120 = (&data[25]);\0A    global int* v121 = ((global int*)v120);\0A    v121[0] = v119;\0A    float* v123 = (&(&privateFloats)[0][26]);\0A    int* v124 = ((int*)v123);\0A    int v125 = v124[0];\0A    global float* v126 = (&data[27]);\0A    global int* v127 = ((global int*)v126);\0A    v127[0] = v125;\0A    float* v129 = (&(&privateFloats)[0][28]);\0A    int* v130 = ((int*)v129);\0A    int v131 = v130[0];\0A    global float* v132 = (&data[29]);\0A    global int* v133 = ((global int*)v132);\0A    v133[0] = v131;\0A    float* v135 = (&(&privateFloats)[0][30]);\0A    int* v136 = ((int*)v135);\0A    int v137 = v136[0];\0A    global float* v138 = (&data[31]);\0A    global int* v139 = ((global int*)v138);\0A    v139[0] = v137;\0A}\0A\0Akernel void _Z10testmemcpyPf(global float* data) {\0A    label0:;\0A    global char* data4 = ((global char*)data);\0A    float privateFloats[32];\0A    char* v1 = ((char*)privateFloats);\0A    #pragma unroll\0A    for(int __i=0; __i < 32; __i++) {\0A        (( int *)v1)[__i] = ((global int *)data4)[__i];\0A    }\0A    int* v4 = ((int*)privateFloats);\0A    int v5 = v4[0];\0A    global int* v6 = ((global int*)data);\0A    v6[0] = v5;\0A    float* v8 = (&(&privateFloats)[0][2]);\0A    int* v9 = ((int*)v8);\0A    int v10 = v9[0];\0A    global float* v11 = (&data[2]);\0A    global int* v12 = ((global int*)v11);\0A    v12[0] = v10;\0A    float* v14 = (&(&privateFloats)[0][4]);\0A    int* v15 = ((int*)v14);\0A    int v16 = v15[0];\0A    global float* v17 = (&data[4]);\0A    global int* v18 = ((global int*)v17);\0A    v18[0] = v16;\0A    float* v20 = (&(&privateFloats)[0][6]);\0A    int* v21 = ((int*)v20);\0A    int v22 = v21[0];\0A    global float* v23 = (&data[6]);\0A    global int* v24 = ((global int*)v23);\0A    v24[0] = v22;\0A    float* v26 = (&(&privateFloats)[0][8]);\0A    int* v27 = ((int*)v26);\0A    int v28 = v27[0];\0A    global float* v29 = (&data[8]);\0A    global int* v30 = ((global int*)v29);\0A    v30[0] = v28;\0A    float* v32 = (&(&privateFloats)[0][10]);\0A    int* v33 = ((int*)v32);\0A    int v34 = v33[0];\0A    global float* v35 = (&data[10]);\0A    global int* v36 = ((global int*)v35);\0A    v36[0] = v34;\0A    float* v38 = (&(&privateFloats)[0][12]);\0A    int* v39 = ((int*)v38);\0A    int v40 = v39[0];\0A    global float* v41 = (&data[12]);\0A    global int* v42 = ((global int*)v41);\0A    v42[0] = v40;\0A    float* v44 = (&(&privateFloats)[0][14]);\0A    int* v45 = ((int*)v44);\0A    int v46 = v45[0];\0A    global float* v47 = (&data[14]);\0A    global int* v48 = ((global int*)v47);\0A    v48[0] = v46;\0A    float* v50 = (&(&privateFloats)[0][16]);\0A    int* v51 = ((int*)v50);\0A    int v52 = v51[0];\0A    global float* v53 = (&data[16]);\0A    global int* v54 = ((global int*)v53);\0A    v54[0] = v52;\0A    float* v56 = (&(&privateFloats)[0][18]);\0A    int* v57 = ((int*)v56);\0A    int v58 = v57[0];\0A    global float* v59 = (&data[18]);\0A    global int* v60 = ((global int*)v59);\0A    v60[0] = v58;\0A    float* v62 = (&(&privateFloats)[0][20]);\0A    int* v63 = ((int*)v62);\0A    int v64 = v63[0];\0A    global float* v65 = (&data[20]);\0A    global int* v66 = ((global int*)v65);\0A    v66[0] = v64;\0A    float* v68 = (&(&privateFloats)[0][22]);\0A    int* v69 = ((int*)v68);\0A    int v70 = v69[0];\0A    global float* v71 = (&data[22]);\0A    global int* v72 = ((global int*)v71);\0A    v72[0] = v70;\0A    float* v74 = (&(&privateFloats)[0][24]);\0A    int* v75 = ((int*)v74);\0A    int v76 = v75[0];\0A    global float* v77 = (&data[24]);\0A    global int* v78 = ((global int*)v77);\0A    v78[0] = v76;\0A    float* v80 = (&(&privateFloats)[0][26]);\0A    int* v81 = ((int*)v80);\0A    int v82 = v81[0];\0A    global float* v83 = (&data[26]);\0A    global int* v84 = ((global int*)v83);\0A    v84[0] = v82;\0A    float* v86 = (&(&privateFloats)[0][28]);\0A    int* v87 = ((int*)v86);\0A    int v88 = v87[0];\0A    global float* v89 = (&data[28]);\0A    global int* v90 = ((global int*)v89);\0A    v90[0] = v88;\0A    float* v92 = (&(&privateFloats)[0][30]);\0A    int* v93 = ((int*)v92);\0A    int v94 = v93[0];\0A    global float* v95 = (&data[30]);\0A    global int* v96 = ((global int*)v95);\0A    v96[0] = v94;\0A}\0A\0Afloat4 _Z9getfloat4f(float a) {\0A    label0:;\0A    float v1 = a + 1.0f;\0A    float v2 = a + 2.5f;\0A    float4 v3;\0A    ((float*)&v3)[0] = a;\0A    ((float*)&v3)[1] = v1;\0A    float4 v4 = v3;\0A    ((float*)&v4)[2] = v2;\0A    float4 v5 = v4;\0A    return v5;\0A}\0A\0Afloat _Z19getfloat4ElementSumfii(float a, int e0, int e1) {\0A    label0:;\0A    float4 res[1];\0A    char* v1 = ((char*)res);\0A    float v3 = a + 1.0f;\0A    float v4 = a + 2.5f;\0A    float* v5 = (&((float*)&res[0])[0]);\0A    v5[0] = a;\0A    float* v7 = (&((float*)&res[0])[1]);\0A    v7[0] = v3;\0A    float* v9 = (&((float*)&res[0])[2]);\0A    v9[0] = v4;\0A    long v11 = e0;\0A    float* v12 = (&v5[v11]);\0A    float v13 = v12[0];\0A    float v14 = v13 + 0.0f;\0A    long v15 = e1;\0A    float* v16 = (&v5[v15]);\0A    float v17 = v16[0];\0A    float v18 = v14 + v17;\0A    return v18;\0A}\0A\0Akernel void _Z22testFloat4_insertvalueP6float4Pfi(global float4* data, global float* data2, int N) {\0A    label0:;\0A    float v1 = data2[0];\0A    float v2 = v1 + 1.0f;\0A    float v3 = v1 + 2.5f;\0A    global float* v4 = (&((global float*)&data[0])[0]);\0A    v4[0] = v1;\0A    global float* v6 = (&((global float*)&data[0])[1]);\0A    v6[0] = v2;\0A    global float* v8 = (&((global float*)&data[0])[2]);\0A    v8[0] = v3;\0A}\0A\0Akernel void _Z11useHasArrayP8hasArray(global struct hasArray* data) {\0A    label0:;\0A    global int* v1 = (&data[1].f0[2]);\0A    int v2 = v1[0];\0A    global int* v3 = (&data[0].f0[0]);\0A    v3[0] = v2;\0A}\0A\0Akernel void _Z22usesForwardDeclarationPf(global float* data) {\0A    label0:;\0A    global float* v1 = (&data[1]);\0A    float v2 = v1[0];\0A    global float* v3 = (&data[2]);\0A    float v4 = v3[0];\0A    float v5 = v2 * v4;\0A    data[0] = v5;\0A}\0A\0Afloat _Z16declaredAfterUseff(float val1, float val2) {\0A    label0:;\0A    float v1 = val1 * val2;\0A    return v1;\0A}\0A\00"
@s._Z3fooPf = global [9 x i8] c"_Z3fooPf\00"
@s._Z7use_tidPf = global [13 x i8] c"_Z7use_tidPf\00"
@s._Z8use_tid2Pi = global [14 x i8] c"_Z8use_tid2Pi\00"
@s._Z10copy_floatPf = global [17 x i8] c"_Z10copy_floatPf\00"
@s._Z11use_blockidPf = global [18 x i8] c"_Z11use_blockidPf\00"
@s._Z11use_griddimPf = global [18 x i8] c"_Z11use_griddimPf\00"
@s._Z12use_blockdimPf = global [19 x i8] c"_Z12use_blockdimPf\00"
@s._Z13use_template1PfPi = global [22 x i8] c"_Z13use_template1PfPi\00"
@s._Z13someops_floatPf = global [20 x i8] c"_Z13someops_floatPf\00"
@s._Z11someops_intPi = global [18 x i8] c"_Z11someops_intPi\00"
@s._Z14testbooleanopsPi = global [21 x i8] c"_Z14testbooleanopsPi\00"
@s._Z26testcomparisons_int_signedPi = global [33 x i8] c"_Z26testcomparisons_int_signedPi\00"
@s._Z21testcomparisons_floatPf = global [28 x i8] c"_Z21testcomparisons_floatPf\00"
@s._Z15testsyncthreadsPf = global [22 x i8] c"_Z15testsyncthreadsPf\00"
@s._Z11testDoWhilePii = global [19 x i8] c"_Z11testDoWhilePii\00"
@s._Z9testWhilePii = global [16 x i8] c"_Z9testWhilePii\00"
@s._Z6testIfPii = global [13 x i8] c"_Z6testIfPii\00"
@s._Z10testIfElsePii = global [18 x i8] c"_Z10testIfElsePii\00"
@s._Z11testTernaryPf = global [18 x i8] c"_Z11testTernaryPf\00"
@s._Z7testForPfi = global [14 x i8] c"_Z7testForPfi\00"
@s._Z8setValuePfif = global [16 x i8] c"_Z8setValuePfif\00"
@s._Z11testStructsP8MyStructPfPi = global [30 x i8] c"_Z11testStructsP8MyStructPfPi\00"
@s._Z10testFloat4P6float4 = global [23 x i8] c"_Z10testFloat4P6float4\00"
@s._Z16testFloat4_test2P6float4 = global [29 x i8] c"_Z16testFloat4_test2P6float4\00"
@s._Z16testFloat4_test3P6float4 = global [29 x i8] c"_Z16testFloat4_test3P6float4\00"
@s._Z9testLocalPf = global [15 x i8] c"_Z9testLocalPf\00"
@s._Z10testLocal2Pf = global [17 x i8] c"_Z10testLocal2Pf\00"
@s._Z9testArrayPf = global [15 x i8] c"_Z9testArrayPf\00"
@s._Z10testmemcpyPf = global [17 x i8] c"_Z10testmemcpyPf\00"
@s._Z22testFloat4_insertvalueP6float4Pfi = global [38 x i8] c"_Z22testFloat4_insertvalueP6float4Pfi\00"
@s._Z11useHasArrayP8hasArray = global [26 x i8] c"_Z11useHasArrayP8hasArray\00"
@s._Z22usesForwardDeclarationPf = global [29 x i8] c"_Z22usesForwardDeclarationPf\00"

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: uwtable
define void @_Z3fooPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [9 x i8], [9 x i8]* @s._Z3fooPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z7use_tidPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [13 x i8], [13 x i8]* @s._Z7use_tidPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z8use_tid2Pi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [14 x i8], [14 x i8]* @s._Z8use_tid2Pi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10copy_floatPf(float* %a) #2 {
  %1 = alloca float*, align 8
  store float* %a, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [17 x i8], [17 x i8]* @s._Z10copy_floatPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11use_blockidPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [18 x i8], [18 x i8]* @s._Z11use_blockidPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11use_griddimPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [18 x i8], [18 x i8]* @s._Z11use_griddimPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z12use_blockdimPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [19 x i8], [19 x i8]* @s._Z12use_blockdimPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z13use_template1PfPi(float* %data, i32* %intdata) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  store i32* %intdata, i32** %2, align 8, !tbaa !1
  %3 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %4 = icmp eq i32 0, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32** %2 to i8*
  %loadCudaArg1 = load i32*, i32** %2
  %7 = icmp eq i32 0, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = getelementptr inbounds [22 x i8], [22 x i8]* @s._Z13use_template1PfPi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %9, i8* %10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %10 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %11

; <label>:11                                      ; preds = %8, %5, %0
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

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %18, %15
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
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* @s._Z13someops_floatPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11someops_intPi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [18 x i8], [18 x i8]* @s._Z11someops_intPi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z14testbooleanopsPi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [21 x i8], [21 x i8]* @s._Z14testbooleanopsPi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z26testcomparisons_int_signedPi(i32* %data) #2 {
  %1 = alloca i32*, align 8
  store i32* %data, i32** %1, align 8, !tbaa !1
  %2 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [33 x i8], [33 x i8]* @s._Z26testcomparisons_int_signedPi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z21testcomparisons_floatPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [28 x i8], [28 x i8]* @s._Z21testcomparisons_floatPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z15testsyncthreadsPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [22 x i8], [22 x i8]* @s._Z15testsyncthreadsPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11testDoWhilePii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %4 = icmp eq i32 0, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32* %2 to i8*
  %loadCudaArg1 = load i32, i32* %2
  %7 = icmp eq i32 0, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = getelementptr inbounds [19 x i8], [19 x i8]* @s._Z11testDoWhilePii, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %9, i8* %10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z8kernelGov()
  %10 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %11

; <label>:11                                      ; preds = %8, %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z9testWhilePii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %4 = icmp eq i32 0, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32* %2 to i8*
  %loadCudaArg1 = load i32, i32* %2
  %7 = icmp eq i32 0, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z9testWhilePii, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %9, i8* %10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z8kernelGov()
  %10 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %11

; <label>:11                                      ; preds = %8, %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z6testIfPii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %4 = icmp eq i32 0, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32* %2 to i8*
  %loadCudaArg1 = load i32, i32* %2
  %7 = icmp eq i32 0, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = getelementptr inbounds [13 x i8], [13 x i8]* @s._Z6testIfPii, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %9, i8* %10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z8kernelGov()
  %10 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %11

; <label>:11                                      ; preds = %8, %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10testIfElsePii(i32* %data, i32 %N) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %data, i32** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast i32** %1 to i8*
  %loadCudaArg = load i32*, i32** %1
  %4 = icmp eq i32 0, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32* %2 to i8*
  %loadCudaArg1 = load i32, i32* %2
  %7 = icmp eq i32 0, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = getelementptr inbounds [18 x i8], [18 x i8]* @s._Z10testIfElsePii, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %9, i8* %10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z8kernelGov()
  %10 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %11

; <label>:11                                      ; preds = %8, %5, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11testTernaryPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [18 x i8], [18 x i8]* @s._Z11testTernaryPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z7testForPfi(float* %data, i32 %N) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  store float* %data, float** %1, align 8, !tbaa !1
  store i32 %N, i32* %2, align 4, !tbaa !13
  %3 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %4 = icmp eq i32 0, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = bitcast i32* %2 to i8*
  %loadCudaArg1 = load i32, i32* %2
  %7 = icmp eq i32 0, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5
  %9 = getelementptr inbounds [14 x i8], [14 x i8]* @s._Z7testForPfi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %9, i8* %10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z8kernelGov()
  %10 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %11

; <label>:11                                      ; preds = %8, %5, %0
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

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %21, %18
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

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %22, %19
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

_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.exit: ; preds = %21, %18
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
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg2)
  call void @_Z8kernelGov()
  %14 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %15

; <label>:15                                      ; preds = %12, %9, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z14launchSetValuePfif(float* %data, i32 %idx, float %value) #2 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = icmp eq i32 0, 0
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %0
  %6 = bitcast float** %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %6)
  %7 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %7)
  %8 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %8)
  store float* %data, float** %1, align 8, !tbaa !1
  store i32 %idx, i32* %2, align 4, !tbaa !13
  store float %value, float* %3, align 4, !tbaa !15
  %loadCudaArg = load float*, float** %1
  %9 = icmp eq i32 0, 0
  br i1 %9, label %10, label %_Z8setValuePfif.exit

; <label>:10                                      ; preds = %5
  %loadCudaArg1 = load i32, i32* %2
  %11 = icmp eq i32 0, 0
  br i1 %11, label %12, label %_Z8setValuePfif.exit

; <label>:12                                      ; preds = %10
  %loadCudaArg2 = load float, float* %3
  %13 = icmp eq i32 0, 0
  br i1 %13, label %14, label %_Z8setValuePfif.exit

; <label>:14                                      ; preds = %12
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* @s._Z8setValuePfif, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %15, i8* %16, i32 32, i32 1, i32 1, i32 32, i32 1, i32 1)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg1)
  call void @_Z17setKernelArgFloatf(float %loadCudaArg2)
  call void @_Z8kernelGov()
  %16 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %_Z8setValuePfif.exit

_Z8setValuePfif.exit:                             ; preds = %14, %12, %10, %5
  call void @llvm.lifetime.end(i64 8, i8* %6)
  call void @llvm.lifetime.end(i64 4, i8* %7)
  call void @llvm.lifetime.end(i64 4, i8* %8)
  br label %17

; <label>:17                                      ; preds = %_Z8setValuePfif.exit, %0
  ret void
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #0

; Function Attrs: uwtable
define void @_Z11testStructsP8MyStructPfPi(%struct.MyStruct* %structs, float* %float_data, i32* %int_data) #2 {
  %1 = alloca %struct.MyStruct*, align 8
  %2 = alloca float*, align 8
  %3 = alloca i32*, align 8
  store %struct.MyStruct* %structs, %struct.MyStruct** %1, align 8, !tbaa !1
  store float* %float_data, float** %2, align 8, !tbaa !1
  store i32* %int_data, i32** %3, align 8, !tbaa !1
  %4 = bitcast %struct.MyStruct** %1 to i8*
  %loadCudaArg = load %struct.MyStruct*, %struct.MyStruct** %1
  %5 = icmp eq i32 0, 0
  br i1 %5, label %6, label %15

; <label>:6                                       ; preds = %0
  %7 = bitcast float** %2 to i8*
  %loadCudaArg1 = load float*, float** %2
  %8 = icmp eq i32 0, 0
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %6
  %10 = bitcast i32** %3 to i8*
  %loadCudaArg2 = load i32*, i32** %3
  %11 = icmp eq i32 0, 0
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9
  %13 = getelementptr inbounds [30 x i8], [30 x i8]* @s._Z11testStructsP8MyStructPfPi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %13, i8* %14, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg1)
  call void @_Z8kernelGov()
  %14 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %15

; <label>:15                                      ; preds = %12, %9, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10testFloat4P6float4(%struct.float4* %data) #2 {
  %1 = alloca %struct.float4*, align 8
  store %struct.float4* %data, %struct.float4** %1, align 8, !tbaa !1
  %2 = bitcast %struct.float4** %1 to i8*
  %loadCudaArg = load %struct.float4*, %struct.float4** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [23 x i8], [23 x i8]* @s._Z10testFloat4P6float4, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z16testFloat4_test2P6float4(%struct.float4* %data) #2 {
  %1 = alloca %struct.float4*, align 8
  store %struct.float4* %data, %struct.float4** %1, align 8, !tbaa !1
  %2 = bitcast %struct.float4** %1 to i8*
  %loadCudaArg = load %struct.float4*, %struct.float4** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [29 x i8], [29 x i8]* @s._Z16testFloat4_test2P6float4, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z16testFloat4_test3P6float4(%struct.float4* %data) #2 {
  %1 = alloca %struct.float4*, align 8
  store %struct.float4* %data, %struct.float4** %1, align 8, !tbaa !1
  %2 = bitcast %struct.float4** %1 to i8*
  %loadCudaArg = load %struct.float4*, %struct.float4** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [29 x i8], [29 x i8]* @s._Z16testFloat4_test3P6float4, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z9testLocalPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [15 x i8], [15 x i8]* @s._Z9testLocalPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10testLocal2Pf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [17 x i8], [17 x i8]* @s._Z10testLocal2Pf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z9testArrayPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [15 x i8], [15 x i8]* @s._Z9testArrayPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z10testmemcpyPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [17 x i8], [17 x i8]* @s._Z10testmemcpyPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z22testFloat4_insertvalueP6float4Pfi(%struct.float4* %data, float* %data2, i32 %N) #2 {
  %1 = alloca %struct.float4*, align 8
  %2 = alloca float*, align 8
  %3 = alloca i32, align 4
  store %struct.float4* %data, %struct.float4** %1, align 8, !tbaa !1
  store float* %data2, float** %2, align 8, !tbaa !1
  store i32 %N, i32* %3, align 4, !tbaa !13
  %4 = bitcast %struct.float4** %1 to i8*
  %loadCudaArg = load %struct.float4*, %struct.float4** %1
  %5 = icmp eq i32 0, 0
  br i1 %5, label %6, label %15

; <label>:6                                       ; preds = %0
  %7 = bitcast float** %2 to i8*
  %loadCudaArg1 = load float*, float** %2
  %8 = icmp eq i32 0, 0
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %6
  %10 = bitcast i32* %3 to i8*
  %loadCudaArg2 = load i32, i32* %3
  %11 = icmp eq i32 0, 0
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9
  %13 = getelementptr inbounds [38 x i8], [38 x i8]* @s._Z22testFloat4_insertvalueP6float4Pfi, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %13, i8* %14, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg1)
  call void @_Z17setKernelArgInt32i(i32 %loadCudaArg2)
  call void @_Z8kernelGov()
  %14 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %15

; <label>:15                                      ; preds = %12, %9, %6, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z11useHasArrayP8hasArray(%struct.hasArray* %data) #2 {
  %1 = alloca %struct.hasArray*, align 8
  store %struct.hasArray* %data, %struct.hasArray** %1, align 8, !tbaa !1
  %2 = bitcast %struct.hasArray** %1 to i8*
  %loadCudaArg = load %struct.hasArray*, %struct.hasArray** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [26 x i8], [26 x i8]* @s._Z11useHasArrayP8hasArray, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

; Function Attrs: uwtable
define void @_Z22usesForwardDeclarationPf(float* %data) #2 {
  %1 = alloca float*, align 8
  store float* %data, float** %1, align 8, !tbaa !1
  %2 = bitcast float** %1 to i8*
  %loadCudaArg = load float*, float** %1
  %3 = icmp eq i32 0, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [29 x i8], [29 x i8]* @s._Z22usesForwardDeclarationPf, i32 0, i32 0
  call void @_Z15configureKernelPKcS0_iiiiii(i8* %5, i8* %6, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  call void @_Z21setKernelArgFloatStarPf(float* %loadCudaArg)
  call void @_Z8kernelGov()
  %6 = getelementptr inbounds [26397 x i8], [26397 x i8]* @__opencl_sourcecode, i32 0, i32 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  ret void
}

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

declare void @_Z15configureKernelPKcS0_iiiiii(i8*, i8*, i32, i32, i32, i32, i32, i32)

declare void @_Z21setKernelArgFloatStarPf(float*)

declare void @_Z8kernelGov()

declare void @_Z17setKernelArgInt32i(i32)

declare void @_Z17setKernelArgFloatf(float)

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
