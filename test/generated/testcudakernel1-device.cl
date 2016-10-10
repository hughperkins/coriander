struct MyStruct_nopointers {
    int f0;
    float f1;
};

struct MyStruct {
    int f0;
    float f1;
};

struct hasArray_nopointers {
    int f0[4];
};

struct hasArray {
    int f0[4];
};



float _Z3barff(float a, float b);
void _Z7incrvalPf(float* a);
float4 _Z9getfloat4f(float a);
float _Z19getfloat4ElementSumfii(float a, int e0, int e1);
float _Z16declaredAfterUseff(float val1, float val2);

float _Z3barff(float a, float b) {
    label0:;
    float v1 = a + b;
    return v1;
}

void _Z7incrvalPf(float* a) {
    label0:;
    float v1 = a[0];
    float v2 = v1 + 3.0f;
    a[0] = v2;
}

kernel void _Z3fooPf(global float* data) {
    label0:;
    data[0] = 123.0f;
}

kernel void _Z7use_tidPf(global float* data) {
    label0:;
    int v1 = get_global_id(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    v3[0] = 123.0f;
}

kernel void _Z8use_tid2Pi(global int* data) {
    label0:;
    int v1 = get_global_id(0);
    long v2 = v1;
    global int* v3 = (&data[v2]);
    int v4 = v3[0];
    int v5 = v4 + v1;
    v3[0] = v5;
}

kernel void _Z10copy_floatPf(global float* a) {
    label0:;
    global float* v1 = (&a[1]);
    global int* v2 = ((global int*)v1);
    int v3 = v2[0];
    global int* v4 = ((global int*)a);
    v4[0] = v3;
}

kernel void _Z11use_blockidPf(global float* data) {
    label0:;
    int v1 = get_group_id(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    v3[0] = 123.0f;
}

kernel void _Z11use_griddimPf(global float* data) {
    label0:;
    int v1 = get_num_groups(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    v3[0] = 123.0f;
}

kernel void _Z12use_blockdimPf(global float* data) {
    label0:;
    int v1 = get_local_size(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    v3[0] = 123.0f;
}

kernel void _Z13use_template1PfPi(global float* data, global int* intdata) {
    label0:;
    int v1 = get_global_id(0);
    bool v2 = v1 == 0;
    if(v2) {
        goto v4;
    } else {
        goto v5;
    }
    v4:;
    global float* v6 = (&data[1]);
    float v7 = v6[0];
    global float* v8 = (&data[2]);
    float v9 = v8[0];
    float v10 = v7 + v9;
    data[0] = v10;
    global int* v12 = (&intdata[1]);
    int v13 = v12[0];
    global int* v14 = (&intdata[2]);
    int v15 = v14[0];
    int v16 = v15 + v13;
    intdata[0] = v16;
        goto v5;
    v5:;
}

kernel void _Z13someops_floatPf(global float* data) {
    label0:;
    global float* v1 = (&data[1]);
    float v2 = v1[0];
    global float* v3 = (&data[2]);
    float v4 = v3[0];
    float v5 = v2 - v4;
    float v6 = v2 / v4;
    float v7 = v5 + v6;
    float v8 = v4 * v2;
    float v9 = v7 + v8;
    data[0] = v9;
    float v11 = log(v2);
    float v12 = data[0];
    float v13 = v11 + v12;
    data[0] = v13;
    float v15 = v1[0];
    float v16 = exp(v15);
    float v17 = data[0];
    float v18 = v16 + v17;
    data[0] = v18;
    float v20 = v1[0];
    float v21 = tanh(v20);
    float v22 = data[0];
    float v23 = v21 + v22;
    data[0] = v23;
    float v25 = v1[0];
    float v26 = sqrt(v25);
    float v27 = data[0];
    float v28 = v27 - v26;
    data[0] = v28;
}

kernel void _Z11someops_intPi(global int* data) {
    label0:;
    global int* v1 = (&data[1]);
    int v2 = v1[0];
    global int* v3 = (&data[2]);
    int v4 = v3[0];
    int v5 = v2 / v4;
    int v6 = v2 + v5;
    int v7 = v6 + v2;
    int v8 = v4 * v2;
    int v9 = v8 + v7;
    int v10 = v2 << v4;
    int v11 = v10 + v9;
    int v12 = v2 >> v4;
    int v13 = v12 + v11;
    data[0] = v13;
}

kernel void _Z14testbooleanopsPi(global int* data) {
    label0:;
    int v1 = data[0];
    bool v2 = v1 > 0;
    global int* v3 = (&data[1]);
    int v4 = v3[0];
    bool v5 = v4 < 0;
    bool v6 = v2 & v5;
    int v7 = v6;
    global int* v8 = (&data[2]);
    v8[0] = v7;
    bool v10 = v2 | v5;
    int v11 = v10;
    global int* v12 = (&data[3]);
    v12[0] = v11;
    int v14 = v2;
    int v15 = v14 ^ 1;
    global int* v16 = (&data[4]);
    v16[0] = v15;
}

kernel void _Z26testcomparisons_int_signedPi(global int* data) {
    label0:;
    int v1 = data[0];
    global int* v2 = (&data[1]);
    int v3 = v2[0];
    bool v4 = v1 >= v3;
    int v5 = v4;
    global int* v6 = (&data[5]);
    v6[0] = v5;
    bool v8 = v1 <= v3;
    int v9 = v8;
    global int* v10 = (&data[6]);
    v10[0] = v9;
    bool v12 = v1 > v3;
    int v13 = v12;
    global int* v14 = (&data[7]);
    v14[0] = v13;
    bool v16 = v1 < v3;
    int v17 = v16;
    global int* v18 = (&data[8]);
    v18[0] = v17;
    bool v20 = v1 == v3;
    int v21 = v20;
    global int* v22 = (&data[9]);
    v22[0] = v21;
    bool v24 = v1 != v3;
    int v25 = v24;
    global int* v26 = (&data[10]);
    v26[0] = v25;
}

kernel void _Z21testcomparisons_floatPf(global float* data) {
    label0:;
    float v1 = data[0];
    global float* v2 = (&data[1]);
    float v3 = v2[0];
    bool v4 = v1 >= v3;
    float v5 = v4;
    global float* v6 = (&data[5]);
    v6[0] = v5;
    bool v8 = v1 <= v3;
    float v9 = v8;
    global float* v10 = (&data[6]);
    v10[0] = v9;
    bool v12 = v1 > v3;
    float v13 = v12;
    global float* v14 = (&data[7]);
    v14[0] = v13;
    bool v16 = v1 < v3;
    float v17 = v16;
    global float* v18 = (&data[8]);
    v18[0] = v17;
    bool v20 = v1 == v3;
    float v21 = v20;
    global float* v22 = (&data[9]);
    v22[0] = v21;
    bool v24 = v1 != v3;
    float v25 = v24;
    global float* v26 = (&data[10]);
    v26[0] = v25;
}

kernel void _Z15testsyncthreadsPf(global float* data) {
    label0:;
    int v1 = get_global_id(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    float v4 = v3[0];
    float v5 = v4 * 2.0f;
    v3[0] = v5;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v8 = v1 + 1;
    long v9 = v8;
    global float* v10 = (&data[v9]);
    float v11 = v10[0];
    float v12 = v11 + 2.0f;
    v10[0] = v12;
}

kernel void _Z11testDoWhilePii(global int* data, int N) {
    int p_0;
    label0:;
    int v1 = get_global_id(0);
        p_0 = v1;
    goto v3;
    v3:;
    int v4 = p_0 + 1;
    long v5 = v4;
    global int* v6 = (&data[v5]);
    int v7 = v6[0];
    bool v8 = v7 == 0;
    if(v8) {
        goto v10;
    } else {
        p_0 = v4;
        goto v3;
    }
    v10:;
}

kernel void _Z9testWhilePii(global int* data, int N) {
    int p_0;
    label0:;
    int v1 = get_global_id(0);
        p_0 = v1;
    goto v3;
    v3:;
    long v4 = p_0;
    global int* v5 = (&data[v4]);
    int v6 = v5[0];
    bool v7 = v6 == 0;
    int v8 = p_0 + 1;
    if(v7) {
        goto v10;
    } else {
        p_0 = v8;
        goto v3;
    }
    v10:;
}

kernel void _Z6testIfPii(global int* data, int N) {
    label0:;
    int v1 = get_global_id(0);
    bool v2 = v1 < N;
    if(v2) {
        goto v4;
    } else {
        goto v5;
    }
    v4:;
    long v6 = v1;
    global int* v7 = (&data[v6]);
    int v8 = v7[0];
    int v9 = v8 << 1;
    v7[0] = v9;
        goto v5;
    v5:;
}

kernel void _Z10testIfElsePii(global int* data, int N) {
    label0:;
    int v1 = get_global_id(0);
    bool v2 = v1 < N;
    long v3 = v1;
    global int* v4 = (&data[v3]);
    int v5 = v4[0];
    if(v2) {
        goto v7;
    } else {
        goto v8;
    }
    v7:;
    int v9 = v5 << 1;
    v4[0] = v9;
    int v11 = v1 + 3;
    long v12 = v11;
    global int* v13 = (&data[v12]);
    int v14 = v13[0];
    int v15 = v14 << 1;
    v13[0] = v15;
        goto v18;
    v8:;
    int v19 = v5 + -20;
    v4[0] = v19;
    int v21 = v1 + 5;
    long v22 = v21;
    global int* v23 = (&data[v22]);
    int v24 = v23[0];
    int v25 = v24 + -20;
    v23[0] = v25;
        goto v18;
    v18:;
}

kernel void _Z11testTernaryPf(global float* data) {
    label0:;
    global float* v1 = (&data[1]);
    float v2 = v1[0];
    bool v3 = v2 > 0.0f;
    global float* v4 = (&data[2]);
    global float* v5 = (&data[3]);
    global float* v_in = v3 ? v4 : v5;
    global int* v6 = ((global int*)v_in);
    int v7 = v6[0];
    global int* v8 = ((global int*)data);
    v8[0] = v7;
}

kernel void _Z7testForPfi(global float* data, int N) {
    int i_02;
    int i_02_prol;
    int i_02_unr;
    int prol_iter;
    float sum_01;
    float sum_01_prol;
    float sum_01_unr;
    float sum_0_lcssa;
    float v_lcssa;
    float v_lcssa3;
    float v_lcssa4;
    int v_lcssa5;
    float v_lcssa_unr;
    label0:;
    int v1 = get_global_id(0);
    bool v2 = v1 == 0;
    if(v2) {
        goto v_preheader;
    } else {
        goto v4;
    }
    v_preheader:;
    bool v5 = N > 0;
    if(v5) {
        goto v_lr_ph_preheader;
    } else {
        sum_0_lcssa = 0.0f;
        goto v__crit_edge;
    }
    v_lr_ph_preheader:;
    int v7 = N + -1;
    int xtraiter = N & 3;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        i_02_unr = 0;
sum_01_unr = 0.0f;
        goto v_lr_ph_preheader_split;
    } else {
        goto v_lr_ph_prol_preheader;
    }
    v_lr_ph_prol_preheader:;
        i_02_prol = 0;
sum_01_prol = 0.0f;
prol_iter = xtraiter;
    goto v_lr_ph_prol;
    v_lr_ph_prol:;
    long v10 = i_02_prol;
    global float* v11 = (&data[v10]);
    float v12 = v11[0];
    float v13 = sum_01_prol + v12;
    int v14 = i_02_prol + 1;
    int prol_iter_sub = prol_iter + -1;
    bool prol_iter_cmp = prol_iter_sub == 0;
    if(prol_iter_cmp) {
        v_lcssa5 = v14;
v_lcssa4 = v13;
        goto v_lr_ph_preheader_split_loopexit;
    } else {
        i_02_prol = v14;
sum_01_prol = v13;
prol_iter = prol_iter_sub;
        goto v_lr_ph_prol;
    }
    v_lr_ph_preheader_split_loopexit:;
        v_lcssa_unr = v_lcssa4;
i_02_unr = v_lcssa5;
sum_01_unr = v_lcssa4;
    goto v_lr_ph_preheader_split;
    v_lr_ph_preheader_split:;
    bool v17 = v7 < 3;
    if(v17) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge_loopexit;
    } else {
        goto v_lr_ph_preheader_split_split;
    }
    v_lr_ph_preheader_split_split:;
        i_02 = i_02_unr;
sum_01 = sum_01_unr;
    goto v_lr_ph;
    label20:;
        v_lcssa = v_lcssa3;
    goto v__crit_edge_loopexit;
    v__crit_edge_loopexit:;
        sum_0_lcssa = v_lcssa;
    goto v__crit_edge;
    v__crit_edge:;
    data[0] = sum_0_lcssa;
        goto v4;
    v_lr_ph:;
    long v25 = i_02;
    global float* v26 = (&data[v25]);
    float v27 = v26[0];
    float v28 = sum_01 + v27;
    int v29 = i_02 + 1;
    long v30 = v29;
    global float* v31 = (&data[v30]);
    float v32 = v31[0];
    float v33 = v28 + v32;
    int v34 = i_02 + 2;
    long v35 = v34;
    global float* v36 = (&data[v35]);
    float v37 = v36[0];
    float v38 = v33 + v37;
    int v39 = i_02 + 3;
    long v40 = v39;
    global float* v41 = (&data[v40]);
    float v42 = v41[0];
    float v43 = v38 + v42;
    int v44 = i_02 + 4;
    bool exitcond_3 = v44 == N;
    if(exitcond_3) {
        v_lcssa3 = v43;
        goto label20;
    } else {
        i_02 = v44;
sum_01 = v43;
        goto v_lr_ph;
    }
    v4:;
}

kernel void _Z8setValuePfif(global float* data, int idx, float value) {
    label0:;
    int v1 = get_global_id(0);
    bool v2 = v1 == 0;
    if(v2) {
        goto v4;
    } else {
        goto v5;
    }
    v4:;
    long v6 = idx;
    global float* v7 = (&data[v6]);
    v7[0] = value;
        goto v5;
    v5:;
}

kernel void _Z11testStructsP8MyStructPfPi(global struct MyStruct_nopointers* structs_nopointers, global float* float_data, global int* int_data) {
struct MyStruct structs[1];
structs[0].f0 = structs_nopointers[0].f0;
structs[0].f1 = structs_nopointers[0].f1;

    label0:;
    int* v1 = (&structs[0].f0);
    int v2 = v1[0];
    int_data[0] = v2;
    float* v4 = (&structs[0].f1);
    int* v5 = ((int*)v4);
    int v6 = v5[0];
    global int* v7 = ((global int*)float_data);
    v7[0] = v6;
    float* v9 = (&structs[1].f1);
    int* v10 = ((int*)v9);
    int v11 = v10[0];
    global float* v12 = (&float_data[1]);
    global int* v13 = ((global int*)v12);
    v13[0] = v11;
}

kernel void _Z10testFloat4P6float4(global float4* data) {
    label0:;
    global float* v1 = (&((global float*)&data[1])[0]);
    global int* v2 = ((global int*)v1);
    int v3 = v2[0];
    global float* v4 = (&((global float*)&data[1])[2]);
    float v5 = v4[0];
    global float* v6 = (&((global float*)&data[1])[3]);
    float v7 = v6[0];
    float v8 = v5 * v7;
    global int* v9 = ((global int*)data);
    v9[0] = v3;
    global float* v11 = (&((global float*)&data[0])[1]);
    v11[0] = v8;
    global float* v13 = (&((global float*)&data[0])[2]);
    v13[0] = v5;
    global float* v15 = (&((global float*)&data[0])[3]);
    v15[0] = v7;
}

kernel void _Z16testFloat4_test2P6float4(global float4* data) {
    label0:;
    global float4* v1 = (&data[1]);
    global char* v2 = ((global char*)data);
    global char* v3 = ((global char*)v1);
    ((global int4 *)v2)[0] = ((global int4 *)v3)[0];
}

kernel void _Z16testFloat4_test3P6float4(global float4* data) {
    int i1_02;
    int i_03;
    label0:;
    float4 privateFloats[32];
    char* v1 = ((char*)privateFloats);
        i_03 = 0;
    goto v4;
    v4:;
    long v5 = i_03;
    float4* v6 = (&(&privateFloats)[0][v5]);
    global float4* v7 = (&data[v5]);
    char* v8 = ((char*)v6);
    global char* v9 = ((global char*)v7);
    (( int4 *)v8)[0] = ((global int4 *)v9)[0];
    int v11 = i_03 | 1;
    long v12 = v11;
    float4* v13 = (&(&privateFloats)[0][v12]);
    global float4* v14 = (&data[v12]);
    char* v15 = ((char*)v13);
    global char* v16 = ((global char*)v14);
    (( int4 *)v15)[0] = ((global int4 *)v16)[0];
    int v18 = i_03 | 2;
    long v19 = v18;
    float4* v20 = (&(&privateFloats)[0][v19]);
    global float4* v21 = (&data[v19]);
    char* v22 = ((char*)v20);
    global char* v23 = ((global char*)v21);
    (( int4 *)v22)[0] = ((global int4 *)v23)[0];
    int v25 = i_03 | 3;
    long v26 = v25;
    float4* v27 = (&(&privateFloats)[0][v26]);
    global float4* v28 = (&data[v26]);
    char* v29 = ((char*)v27);
    global char* v30 = ((global char*)v28);
    (( int4 *)v29)[0] = ((global int4 *)v30)[0];
    int v32 = i_03 + 4;
    bool exitcond4_3 = v32 == 32;
    if(exitcond4_3) {
        goto v_preheader_preheader;
    } else {
        i_03 = v32;
        goto v4;
    }
    v_preheader_preheader:;
        i1_02 = 0;
    goto v_preheader;
    label35:;
    v_preheader:;
    int v38 = i1_02 | 1;
    long v39 = v38;
    global float4* v40 = (&data[v39]);
    long v41 = i1_02;
    float4* v42 = (&(&privateFloats)[0][v41]);
    global char* v43 = ((global char*)v40);
    char* v44 = ((char*)v42);
    ((global int4 *)v43)[0] = (( int4 *)v44)[0];
    int v46 = i1_02 | 2;
    long v47 = v46;
    global float4* v48 = (&data[v47]);
    long v49 = v38;
    float4* v50 = (&(&privateFloats)[0][v49]);
    global char* v51 = ((global char*)v48);
    char* v52 = ((char*)v50);
    ((global int4 *)v51)[0] = (( int4 *)v52)[0];
    int v54 = i1_02 | 3;
    long v55 = v54;
    global float4* v56 = (&data[v55]);
    long v57 = v46;
    float4* v58 = (&(&privateFloats)[0][v57]);
    global char* v59 = ((global char*)v56);
    char* v60 = ((char*)v58);
    ((global int4 *)v59)[0] = (( int4 *)v60)[0];
    int v62 = i1_02 + 4;
    long v63 = v62;
    global float4* v64 = (&data[v63]);
    long v65 = v54;
    float4* v66 = (&(&privateFloats)[0][v65]);
    global char* v67 = ((global char*)v64);
    char* v68 = ((char*)v66);
    ((global int4 *)v67)[0] = (( int4 *)v68)[0];
    bool exitcond_3 = v62 == 32;
    if(exitcond_3) {
        goto label35;
    } else {
        i1_02 = v62;
        goto v_preheader;
    }
}

kernel void _Z9testLocalPf(global float* data) {
    local float _ZZ9testLocalPfE8myshared[32];
    label0:;
    int v1 = get_global_id(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    global int* v4 = ((global int*)v3);
    int v5 = v4[0];
    local float* v6 = (&(&_ZZ9testLocalPfE8myshared)[0][v2]);
    local int* v7 = ((local int*)v6);
    local int* v8 = (v7);
    v8[0] = v5;
    int v10 = v1 + 1;
    long v11 = v10;
    local float* v12 = (&(&_ZZ9testLocalPfE8myshared)[0][v11]);
    local int* v13 = ((local int*)v12);
    local int* v14 = (v13);
    int v15 = v14[0];
    global int* v16 = ((global int*)data);
    v16[0] = v15;
}

kernel void _Z10testLocal2Pf(global float* data) {
    local float _ZZ10testLocal2PfE8myshared[64];
    label0:;
    int v1 = get_global_id(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    global int* v4 = ((global int*)v3);
    int v5 = v4[0];
    local float* v6 = (&(&_ZZ10testLocal2PfE8myshared)[0][v2]);
    local int* v7 = ((local int*)v6);
    local int* v8 = (v7);
    v8[0] = v5;
    int v10 = v1 + 1;
    long v11 = v10;
    local float* v12 = (&(&_ZZ10testLocal2PfE8myshared)[0][v11]);
    local int* v13 = ((local int*)v12);
    local int* v14 = (v13);
    int v15 = v14[0];
    global int* v16 = ((global int*)data);
    v16[0] = v15;
    int v18 = v4[0];
    v14[0] = v18;
    int v20 = v8[0];
    global float* v21 = (&data[1]);
    global int* v22 = ((global int*)v21);
    v22[0] = v20;
}

kernel void _Z9testArrayPf(global float* data) {
    int i_03;
    label0:;
    float privateFloats[32];
    char* v1 = ((char*)privateFloats);
        i_03 = 0;
    goto v4;
    v4:;
    int v5 = i_03 * 3;
    long v6 = v5;
    global float* v7 = (&data[v6]);
    global int* v8 = ((global int*)v7);
    int v9 = v8[0];
    long v10 = i_03;
    float* v11 = (&(&privateFloats)[0][v10]);
    int* v12 = ((int*)v11);
    v12[0] = v9;
    int v14 = i_03 | 1;
    int v15 = v14 * 3;
    long v16 = v15;
    global float* v17 = (&data[v16]);
    global int* v18 = ((global int*)v17);
    int v19 = v18[0];
    long v20 = v14;
    float* v21 = (&(&privateFloats)[0][v20]);
    int* v22 = ((int*)v21);
    v22[0] = v19;
    int v24 = i_03 | 2;
    int v25 = v24 * 3;
    long v26 = v25;
    global float* v27 = (&data[v26]);
    global int* v28 = ((global int*)v27);
    int v29 = v28[0];
    long v30 = v24;
    float* v31 = (&(&privateFloats)[0][v30]);
    int* v32 = ((int*)v31);
    v32[0] = v29;
    int v34 = i_03 | 3;
    int v35 = v34 * 3;
    long v36 = v35;
    global float* v37 = (&data[v36]);
    global int* v38 = ((global int*)v37);
    int v39 = v38[0];
    long v40 = v34;
    float* v41 = (&(&privateFloats)[0][v40]);
    int* v42 = ((int*)v41);
    v42[0] = v39;
    int v44 = i_03 + 4;
    bool exitcond_3 = v44 == 32;
    if(exitcond_3) {
        goto v_preheader_preheader;
    } else {
        i_03 = v44;
        goto v4;
    }
    v_preheader_preheader:;
    int* v46 = ((int*)privateFloats);
    int v47 = v46[0];
    global float* v48 = (&data[1]);
    global int* v49 = ((global int*)v48);
    v49[0] = v47;
    float* v51 = (&(&privateFloats)[0][2]);
    int* v52 = ((int*)v51);
    int v53 = v52[0];
    global float* v54 = (&data[3]);
    global int* v55 = ((global int*)v54);
    v55[0] = v53;
    float* v57 = (&(&privateFloats)[0][4]);
    int* v58 = ((int*)v57);
    int v59 = v58[0];
    global float* v60 = (&data[5]);
    global int* v61 = ((global int*)v60);
    v61[0] = v59;
    float* v63 = (&(&privateFloats)[0][6]);
    int* v64 = ((int*)v63);
    int v65 = v64[0];
    global float* v66 = (&data[7]);
    global int* v67 = ((global int*)v66);
    v67[0] = v65;
    float* v69 = (&(&privateFloats)[0][8]);
    int* v70 = ((int*)v69);
    int v71 = v70[0];
    global float* v72 = (&data[9]);
    global int* v73 = ((global int*)v72);
    v73[0] = v71;
    float* v75 = (&(&privateFloats)[0][10]);
    int* v76 = ((int*)v75);
    int v77 = v76[0];
    global float* v78 = (&data[11]);
    global int* v79 = ((global int*)v78);
    v79[0] = v77;
    float* v81 = (&(&privateFloats)[0][12]);
    int* v82 = ((int*)v81);
    int v83 = v82[0];
    global float* v84 = (&data[13]);
    global int* v85 = ((global int*)v84);
    v85[0] = v83;
    float* v87 = (&(&privateFloats)[0][14]);
    int* v88 = ((int*)v87);
    int v89 = v88[0];
    global float* v90 = (&data[15]);
    global int* v91 = ((global int*)v90);
    v91[0] = v89;
    float* v93 = (&(&privateFloats)[0][16]);
    int* v94 = ((int*)v93);
    int v95 = v94[0];
    global float* v96 = (&data[17]);
    global int* v97 = ((global int*)v96);
    v97[0] = v95;
    float* v99 = (&(&privateFloats)[0][18]);
    int* v100 = ((int*)v99);
    int v101 = v100[0];
    global float* v102 = (&data[19]);
    global int* v103 = ((global int*)v102);
    v103[0] = v101;
    float* v105 = (&(&privateFloats)[0][20]);
    int* v106 = ((int*)v105);
    int v107 = v106[0];
    global float* v108 = (&data[21]);
    global int* v109 = ((global int*)v108);
    v109[0] = v107;
    float* v111 = (&(&privateFloats)[0][22]);
    int* v112 = ((int*)v111);
    int v113 = v112[0];
    global float* v114 = (&data[23]);
    global int* v115 = ((global int*)v114);
    v115[0] = v113;
    float* v117 = (&(&privateFloats)[0][24]);
    int* v118 = ((int*)v117);
    int v119 = v118[0];
    global float* v120 = (&data[25]);
    global int* v121 = ((global int*)v120);
    v121[0] = v119;
    float* v123 = (&(&privateFloats)[0][26]);
    int* v124 = ((int*)v123);
    int v125 = v124[0];
    global float* v126 = (&data[27]);
    global int* v127 = ((global int*)v126);
    v127[0] = v125;
    float* v129 = (&(&privateFloats)[0][28]);
    int* v130 = ((int*)v129);
    int v131 = v130[0];
    global float* v132 = (&data[29]);
    global int* v133 = ((global int*)v132);
    v133[0] = v131;
    float* v135 = (&(&privateFloats)[0][30]);
    int* v136 = ((int*)v135);
    int v137 = v136[0];
    global float* v138 = (&data[31]);
    global int* v139 = ((global int*)v138);
    v139[0] = v137;
}

kernel void _Z10testmemcpyPf(global float* data) {
    label0:;
    global char* data4 = ((global char*)data);
    float privateFloats[32];
    char* v1 = ((char*)privateFloats);
    #pragma unroll
    for(int __i=0; __i < 32; __i++) {
        (( int *)v1)[__i] = ((global int *)data4)[__i];
    }
    int* v4 = ((int*)privateFloats);
    int v5 = v4[0];
    global int* v6 = ((global int*)data);
    v6[0] = v5;
    float* v8 = (&(&privateFloats)[0][2]);
    int* v9 = ((int*)v8);
    int v10 = v9[0];
    global float* v11 = (&data[2]);
    global int* v12 = ((global int*)v11);
    v12[0] = v10;
    float* v14 = (&(&privateFloats)[0][4]);
    int* v15 = ((int*)v14);
    int v16 = v15[0];
    global float* v17 = (&data[4]);
    global int* v18 = ((global int*)v17);
    v18[0] = v16;
    float* v20 = (&(&privateFloats)[0][6]);
    int* v21 = ((int*)v20);
    int v22 = v21[0];
    global float* v23 = (&data[6]);
    global int* v24 = ((global int*)v23);
    v24[0] = v22;
    float* v26 = (&(&privateFloats)[0][8]);
    int* v27 = ((int*)v26);
    int v28 = v27[0];
    global float* v29 = (&data[8]);
    global int* v30 = ((global int*)v29);
    v30[0] = v28;
    float* v32 = (&(&privateFloats)[0][10]);
    int* v33 = ((int*)v32);
    int v34 = v33[0];
    global float* v35 = (&data[10]);
    global int* v36 = ((global int*)v35);
    v36[0] = v34;
    float* v38 = (&(&privateFloats)[0][12]);
    int* v39 = ((int*)v38);
    int v40 = v39[0];
    global float* v41 = (&data[12]);
    global int* v42 = ((global int*)v41);
    v42[0] = v40;
    float* v44 = (&(&privateFloats)[0][14]);
    int* v45 = ((int*)v44);
    int v46 = v45[0];
    global float* v47 = (&data[14]);
    global int* v48 = ((global int*)v47);
    v48[0] = v46;
    float* v50 = (&(&privateFloats)[0][16]);
    int* v51 = ((int*)v50);
    int v52 = v51[0];
    global float* v53 = (&data[16]);
    global int* v54 = ((global int*)v53);
    v54[0] = v52;
    float* v56 = (&(&privateFloats)[0][18]);
    int* v57 = ((int*)v56);
    int v58 = v57[0];
    global float* v59 = (&data[18]);
    global int* v60 = ((global int*)v59);
    v60[0] = v58;
    float* v62 = (&(&privateFloats)[0][20]);
    int* v63 = ((int*)v62);
    int v64 = v63[0];
    global float* v65 = (&data[20]);
    global int* v66 = ((global int*)v65);
    v66[0] = v64;
    float* v68 = (&(&privateFloats)[0][22]);
    int* v69 = ((int*)v68);
    int v70 = v69[0];
    global float* v71 = (&data[22]);
    global int* v72 = ((global int*)v71);
    v72[0] = v70;
    float* v74 = (&(&privateFloats)[0][24]);
    int* v75 = ((int*)v74);
    int v76 = v75[0];
    global float* v77 = (&data[24]);
    global int* v78 = ((global int*)v77);
    v78[0] = v76;
    float* v80 = (&(&privateFloats)[0][26]);
    int* v81 = ((int*)v80);
    int v82 = v81[0];
    global float* v83 = (&data[26]);
    global int* v84 = ((global int*)v83);
    v84[0] = v82;
    float* v86 = (&(&privateFloats)[0][28]);
    int* v87 = ((int*)v86);
    int v88 = v87[0];
    global float* v89 = (&data[28]);
    global int* v90 = ((global int*)v89);
    v90[0] = v88;
    float* v92 = (&(&privateFloats)[0][30]);
    int* v93 = ((int*)v92);
    int v94 = v93[0];
    global float* v95 = (&data[30]);
    global int* v96 = ((global int*)v95);
    v96[0] = v94;
}

float4 _Z9getfloat4f(float a) {
    label0:;
    float v1 = a + 1.0f;
    float v2 = a + 2.5f;
    float4 v3;
    ((float*)&v3)[0] = a;
    ((float*)&v3)[1] = v1;
    float4 v4 = v3;
    ((float*)&v4)[2] = v2;
    float4 v5 = v4;
    return v5;
}

float _Z19getfloat4ElementSumfii(float a, int e0, int e1) {
    label0:;
    float4 res[1];
    char* v1 = ((char*)res);
    float v3 = a + 1.0f;
    float v4 = a + 2.5f;
    float* v5 = (&((float*)&res[0])[0]);
    v5[0] = a;
    float* v7 = (&((float*)&res[0])[1]);
    v7[0] = v3;
    float* v9 = (&((float*)&res[0])[2]);
    v9[0] = v4;
    long v11 = e0;
    float* v12 = (&v5[v11]);
    float v13 = v12[0];
    float v14 = v13 + 0.0f;
    long v15 = e1;
    float* v16 = (&v5[v15]);
    float v17 = v16[0];
    float v18 = v14 + v17;
    return v18;
}

kernel void _Z22testFloat4_insertvalueP6float4Pfi(global float4* data, global float* data2, int N) {
    label0:;
    float v1 = data2[0];
    float v2 = v1 + 1.0f;
    float v3 = v1 + 2.5f;
    global float* v4 = (&((global float*)&data[0])[0]);
    v4[0] = v1;
    global float* v6 = (&((global float*)&data[0])[1]);
    v6[0] = v2;
    global float* v8 = (&((global float*)&data[0])[2]);
    v8[0] = v3;
}

kernel void _Z11useHasArrayP8hasArray(global struct hasArray_nopointers* data_nopointers) {
struct hasArray data[1];
data[0].f0[0] = data_nopointers[0].f0[0];
data[0].f0[1] = data_nopointers[0].f0[1];
data[0].f0[2] = data_nopointers[0].f0[2];
data[0].f0[3] = data_nopointers[0].f0[3];

    label0:;
    int* v1 = (&data[1].f0[2]);
    int v2 = v1[0];
    int* v3 = (&data[0].f0[0]);
    v3[0] = v2;
}

kernel void _Z22usesForwardDeclarationPf(global float* data) {
    label0:;
    global float* v1 = (&data[1]);
    float v2 = v1[0];
    global float* v3 = (&data[2]);
    float v4 = v3[0];
    float v5 = v2 * v4;
    data[0] = v5;
}

float _Z16declaredAfterUseff(float val1, float val2) {
    label0:;
    float v1 = val1 * val2;
    return v1;
}
