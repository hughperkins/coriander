struct MyStruct {
    int f0;
    float f1;
};

struct hasArray {
    int f0[4];
};


float _Z3barff(float a, float b) {
    label0:;
    float v0 = a + b;
    return v0;
}

void _Z7incrvalPf(global float* a) {
    label0:;
    float v0 = a[0];
    float v1 = v0 + 3.0f;
    a[0] = v1;
}

kernel void _Z3fooPf(global float* data) {
    label0:;
    data[0] = 123.0f;
}

kernel void _Z7use_tidPf(global float* data) {
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    v2[0] = 123.0f;
}

kernel void _Z8use_tid2Pi(global int* data) {
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global int* v2 = &data[v1];
    int v3 = v2[0];
    int v4 = v3 + v0;
    v2[0] = v4;
}

kernel void _Z10copy_floatPf(global float* a) {
    label0:;
    global float* v0 = &a[1];
    global int*v1 = (global int*)v0;
    int v2 = v1[0];
    global int*v3 = (global int*)a;
    v3[0] = v2;
}

kernel void _Z11use_blockidPf(global float* data) {
    label0:;
    int v0 = get_group_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    v2[0] = 123.0f;
}

kernel void _Z11use_griddimPf(global float* data) {
    label0:;
    int v0 = get_num_groups(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    v2[0] = 123.0f;
}

kernel void _Z12use_blockdimPf(global float* data) {
    label0:;
    int v0 = get_local_size(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    v2[0] = 123.0f;
}

kernel void _Z13use_template1PfPi(global float* data, global int* intdata) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 == 0;
    if(v1) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    global float* v3 = &data[1];
    float v4 = v3[0];
    global float* v5 = &data[2];
    float v6 = v5[0];
    float v7 = v4 + v6;
    data[0] = v7;
    global int* v9 = &intdata[1];
    int v10 = v9[0];
    global int* v11 = &intdata[2];
    int v12 = v11[0];
    int v13 = v12 + v10;
    intdata[0] = v13;
        goto label2;
    label2:;
}

kernel void _Z13someops_floatPf(global float* data) {
    label0:;
    global float* v0 = &data[1];
    float v1 = v0[0];
    global float* v2 = &data[2];
    float v3 = v2[0];
    float v4 = v1 - v3;
    float v5 = v1 / v3;
    float v6 = v4 + v5;
    float v7 = v3 * v1;
    float v8 = v6 + v7;
    data[0] = v8;
    float v10 = log(v1);
    float v11 = data[0];
    float v12 = v10 + v11;
    data[0] = v12;
    float v14 = v0[0];
    float v15 = exp(v14);
    float v16 = data[0];
    float v17 = v15 + v16;
    data[0] = v17;
    float v19 = v0[0];
    float v20 = tanh(v19);
    float v21 = data[0];
    float v22 = v20 + v21;
    data[0] = v22;
    float v24 = v0[0];
    float v25 = sqrt(v24);
    float v26 = data[0];
    float v27 = v26 - v25;
    data[0] = v27;
}

kernel void _Z11someops_intPi(global int* data) {
    label0:;
    global int* v0 = &data[1];
    int v1 = v0[0];
    global int* v2 = &data[2];
    int v3 = v2[0];
    int v4 = v1 / v3;
    int v5 = v1 + v4;
    int v6 = v5 + v1;
    int v7 = v3 * v1;
    int v8 = v7 + v6;
    int v9 = v1 << v3;
    int v10 = v9 + v8;
    int v11 = v1 >> v3;
    int v12 = v11 + v10;
    data[0] = v12;
}

kernel void _Z14testbooleanopsPi(global int* data) {
    label0:;
    int v0 = data[0];
    bool v1 = v0 > 0;
    global int* v2 = &data[1];
    int v3 = v2[0];
    bool v4 = v3 < 0;
    bool v5 = v1 & v4;
    int v6 = v5;
    global int* v7 = &data[2];
    v7[0] = v6;
    bool v9 = v1 | v4;
    int v10 = v9;
    global int* v11 = &data[3];
    v11[0] = v10;
    int v13 = v1;
    int v14 = v13 ^ 1;
    global int* v15 = &data[4];
    v15[0] = v14;
}

kernel void _Z26testcomparisons_int_signedPi(global int* data) {
    label0:;
    int v0 = data[0];
    global int* v1 = &data[1];
    int v2 = v1[0];
    bool v3 = v0 >= v2;
    int v4 = v3;
    global int* v5 = &data[5];
    v5[0] = v4;
    bool v7 = v0 <= v2;
    int v8 = v7;
    global int* v9 = &data[6];
    v9[0] = v8;
    bool v11 = v0 > v2;
    int v12 = v11;
    global int* v13 = &data[7];
    v13[0] = v12;
    bool v15 = v0 < v2;
    int v16 = v15;
    global int* v17 = &data[8];
    v17[0] = v16;
    bool v19 = v0 == v2;
    int v20 = v19;
    global int* v21 = &data[9];
    v21[0] = v20;
    bool v23 = v0 != v2;
    int v24 = v23;
    global int* v25 = &data[10];
    v25[0] = v24;
}

kernel void _Z21testcomparisons_floatPf(global float* data) {
    label0:;
    float v0 = data[0];
    global float* v1 = &data[1];
    float v2 = v1[0];
    bool v3 = v0 >= v2;
    float v4 = v3;
    global float* v5 = &data[5];
    v5[0] = v4;
    bool v7 = v0 <= v2;
    float v8 = v7;
    global float* v9 = &data[6];
    v9[0] = v8;
    bool v11 = v0 > v2;
    float v12 = v11;
    global float* v13 = &data[7];
    v13[0] = v12;
    bool v15 = v0 < v2;
    float v16 = v15;
    global float* v17 = &data[8];
    v17[0] = v16;
    bool v19 = v0 == v2;
    float v20 = v19;
    global float* v21 = &data[9];
    v21[0] = v20;
    bool v23 = v0 != v2;
    float v24 = v23;
    global float* v25 = &data[10];
    v25[0] = v24;
}

kernel void _Z15testsyncthreadsPf(global float* data) {
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    float v3 = v2[0];
    float v4 = v3 * 2.0f;
    v2[0] = v4;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v7 = v0 + 1;
    long v8 = v7;
    global float* v9 = &data[v8];
    float v10 = v9[0];
    float v11 = v10 + 2.0f;
    v9[0] = v11;
}

kernel void _Z11testDoWhilePii(global int* data, int N) {
int p_0;
    label0:;
    int v0 = get_global_id(0);
        p_0 = v0;
    goto label1;
    label1:;
    int v2 = p_0 + 1;
    long v3 = v2;
    global int* v4 = &data[v3];
    int v5 = v4[0];
    bool v6 = v5 == 0;
    if(v6) {
        goto label2;
    } else {
        p_0 = v2;
        goto label1;
    }
    label2:;
}

kernel void _Z9testWhilePii(global int* data, int N) {
int p_0;
    label0:;
    int v0 = get_global_id(0);
        p_0 = v0;
    goto label1;
    label1:;
    long v2 = p_0;
    global int* v3 = &data[v2];
    int v4 = v3[0];
    bool v5 = v4 == 0;
    int v6 = p_0 + 1;
    if(v5) {
        goto label2;
    } else {
        p_0 = v6;
        goto label1;
    }
    label2:;
}

kernel void _Z6testIfPii(global int* data, int N) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 < N;
    if(v1) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    long v3 = v0;
    global int* v4 = &data[v3];
    int v5 = v4[0];
    int v6 = v5 << 1;
    v4[0] = v6;
        goto label2;
    label2:;
}

kernel void _Z10testIfElsePii(global int* data, int N) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 < N;
    long v2 = v0;
    global int* v3 = &data[v2];
    int v4 = v3[0];
    if(v1) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v6 = v4 << 1;
    v3[0] = v6;
    int v8 = v0 + 3;
    long v9 = v8;
    global int* v10 = &data[v9];
    int v11 = v10[0];
    int v12 = v11 << 1;
    v10[0] = v12;
        goto label3;
    label2:;
    int v15 = v4 + -20;
    v3[0] = v15;
    int v17 = v0 + 5;
    long v18 = v17;
    global int* v19 = &data[v18];
    int v20 = v19[0];
    int v21 = v20 + -20;
    v19[0] = v21;
        goto label3;
    label3:;
}

kernel void _Z11testTernaryPf(global float* data) {
    label0:;
    global float* v0 = &data[1];
    float v1 = v0[0];
    bool v2 = v1 > 0.0f;
    global float* v3 = &data[2];
    global float* v4 = &data[3];
    global float* v_in = v2 ? v3 : v4;
    global int*v5 = (global int*)v_in;
    int v6 = v5[0];
    global int*v7 = (global int*)data;
    v7[0] = v6;
}

kernel void _Z7testForPfi(global float* data, int N) {
int i_02_prol;
float sum_01_prol;
int prol_iter;
int v_lcssa5;
float v_lcssa4;
float v_lcssa_unr;
int i_02_unr;
float sum_01_unr;
float v_lcssa3;
float v_lcssa;
float sum_0_lcssa;
int i_02;
float sum_01;
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 == 0;
    if(v1) {
        goto label1;
    } else {
        goto label12;
    }
    label1:;
    bool v3 = N > 0;
    if(v3) {
        goto label2;
    } else {
        sum_0_lcssa = 0.0f;
        goto label10;
    }
    label2:;
    int v5 = N + -1;
    int xtraiter = N & 3;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        i_02_unr = 0;
sum_01_unr = 0.0f;
        goto label6;
    } else {
        goto label3;
    }
    label3:;
        i_02_prol = 0;
sum_01_prol = 0.0f;
prol_iter = xtraiter;
    goto label4;
    label4:;
    long v8 = i_02_prol;
    global float* v9 = &data[v8];
    float v10 = v9[0];
    float v11 = sum_01_prol + v10;
    int v12 = i_02_prol + 1;
    int prol_iter_sub = prol_iter + -1;
    bool prol_iter_cmp = prol_iter_sub == 0;
    if(prol_iter_cmp) {
        v_lcssa5 = v12;
v_lcssa4 = v11;
        goto label5;
    } else {
        i_02_prol = v12;
sum_01_prol = v11;
prol_iter = prol_iter_sub;
        goto label4;
    }
    label5:;
        v_lcssa_unr = v_lcssa4;
i_02_unr = v_lcssa5;
sum_01_unr = v_lcssa4;
    goto label6;
    label6:;
    bool v15 = v5 < 3;
    if(v15) {
        v_lcssa = v_lcssa_unr;
        goto label9;
    } else {
        goto label7;
    }
    label7:;
        i_02 = i_02_unr;
sum_01 = sum_01_unr;
    goto label11;
    label8:;
        v_lcssa = v_lcssa3;
    goto label9;
    label9:;
        sum_0_lcssa = v_lcssa;
    goto label10;
    label10:;
    data[0] = sum_0_lcssa;
        goto label12;
    label11:;
    long v22 = i_02;
    global float* v23 = &data[v22];
    float v24 = v23[0];
    float v25 = sum_01 + v24;
    int v26 = i_02 + 1;
    long v27 = v26;
    global float* v28 = &data[v27];
    float v29 = v28[0];
    float v30 = v25 + v29;
    int v31 = i_02 + 2;
    long v32 = v31;
    global float* v33 = &data[v32];
    float v34 = v33[0];
    float v35 = v30 + v34;
    int v36 = i_02 + 3;
    long v37 = v36;
    global float* v38 = &data[v37];
    float v39 = v38[0];
    float v40 = v35 + v39;
    int v41 = i_02 + 4;
    bool exitcond_3 = v41 == N;
    if(exitcond_3) {
        v_lcssa3 = v40;
        goto label8;
    } else {
        i_02 = v41;
sum_01 = v40;
        goto label11;
    }
    label12:;
}

kernel void _Z8setValuePfif(global float* data, int idx, float value) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 == 0;
    if(v1) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    long v3 = idx;
    global float* v4 = &data[v3];
    v4[0] = value;
        goto label2;
    label2:;
}

kernel void _Z11testStructsP8MyStructPfPi(global struct MyStruct* structs, global float* float_data, global int* int_data) {
    label0:;
    global int* v0 = &structs[0].f0;
    int v1 = v0[0];
    int_data[0] = v1;
    global float* v3 = &structs[0].f1;
    global int*v4 = (global int*)v3;
    int v5 = v4[0];
    global int*v6 = (global int*)float_data;
    v6[0] = v5;
    global float* v8 = &structs[1].f1;
    global int*v9 = (global int*)v8;
    int v10 = v9[0];
    global float* v11 = &float_data[1];
    global int*v12 = (global int*)v11;
    v12[0] = v10;
}

kernel void _Z10testFloat4P6float4(global float4* data) {
    label0:;
    global float* v0 = &((global float*)&data[1])[0];
    global int*v1 = (global int*)v0;
    int v2 = v1[0];
    global float* v3 = &((global float*)&data[1])[2];
    float v4 = v3[0];
    global float* v5 = &((global float*)&data[1])[3];
    float v6 = v5[0];
    float v7 = v4 * v6;
    global int*v8 = (global int*)data;
    v8[0] = v2;
    global float* v10 = &((global float*)&data[0])[1];
    v10[0] = v7;
    global float* v12 = &((global float*)&data[0])[2];
    v12[0] = v4;
    global float* v14 = &((global float*)&data[0])[3];
    v14[0] = v6;
}

kernel void _Z16testFloat4_test2P6float4(global float4* data) {
    label0:;
    global float4* v0 = &data[1];
    global char*v1 = (global char*)data;
    global char*v2 = (global char*)v0;
    ((global int4 *)v1)[0] = ((global int4 *)v2)[0];
}

kernel void _Z16testFloat4_test3P6float4(global float4* data) {
int i_03;
int i1_02;
    label0:;
    float4 privateFloats[32];
    char*v0 = (char*)privateFloats;
        i_03 = 0;
    goto label1;
    label1:;
    long v3 = i_03;
    float4* v4 = &(&privateFloats)[0][v3];
    global float4* v5 = &data[v3];
    char*v6 = (char*)v4;
    global char*v7 = (global char*)v5;
    (( int4 *)v6)[0] = ((global int4 *)v7)[0];
    int v9 = i_03 | 1;
    long v10 = v9;
    float4* v11 = &(&privateFloats)[0][v10];
    global float4* v12 = &data[v10];
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    (( int4 *)v13)[0] = ((global int4 *)v14)[0];
    int v16 = i_03 | 2;
    long v17 = v16;
    float4* v18 = &(&privateFloats)[0][v17];
    global float4* v19 = &data[v17];
    char*v20 = (char*)v18;
    global char*v21 = (global char*)v19;
    (( int4 *)v20)[0] = ((global int4 *)v21)[0];
    int v23 = i_03 | 3;
    long v24 = v23;
    float4* v25 = &(&privateFloats)[0][v24];
    global float4* v26 = &data[v24];
    char*v27 = (char*)v25;
    global char*v28 = (global char*)v26;
    (( int4 *)v27)[0] = ((global int4 *)v28)[0];
    int v30 = i_03 + 4;
    bool exitcond4_3 = v30 == 32;
    if(exitcond4_3) {
        goto label2;
    } else {
        i_03 = v30;
        goto label1;
    }
    label2:;
        i1_02 = 0;
    goto label4;
    label3:;
    label4:;
    int v35 = i1_02 | 1;
    long v36 = v35;
    global float4* v37 = &data[v36];
    long v38 = i1_02;
    float4* v39 = &(&privateFloats)[0][v38];
    global char*v40 = (global char*)v37;
    char*v41 = (char*)v39;
    ((global int4 *)v40)[0] = (( int4 *)v41)[0];
    int v43 = i1_02 | 2;
    long v44 = v43;
    global float4* v45 = &data[v44];
    long v46 = v35;
    float4* v47 = &(&privateFloats)[0][v46];
    global char*v48 = (global char*)v45;
    char*v49 = (char*)v47;
    ((global int4 *)v48)[0] = (( int4 *)v49)[0];
    int v51 = i1_02 | 3;
    long v52 = v51;
    global float4* v53 = &data[v52];
    long v54 = v43;
    float4* v55 = &(&privateFloats)[0][v54];
    global char*v56 = (global char*)v53;
    char*v57 = (char*)v55;
    ((global int4 *)v56)[0] = (( int4 *)v57)[0];
    int v59 = i1_02 + 4;
    long v60 = v59;
    global float4* v61 = &data[v60];
    long v62 = v51;
    float4* v63 = &(&privateFloats)[0][v62];
    global char*v64 = (global char*)v61;
    char*v65 = (char*)v63;
    ((global int4 *)v64)[0] = (( int4 *)v65)[0];
    bool exitcond_3 = v59 == 32;
    if(exitcond_3) {
        goto label3;
    } else {
        i1_02 = v59;
        goto label4;
    }
}

kernel void _Z9testLocalPf(global float* data) {
    local float _ZZ9testLocalPfE8myshared[32];
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    global int*v3 = (global int*)v2;
    int v4 = v3[0];
    local float* v5 = &(&_ZZ9testLocalPfE8myshared)[0][v1];
    local int*v6 = (local int*)v5;
    local int* v7 = (local int*)v6;
    v7[0] = v4;
    int v9 = v0 + 1;
    long v10 = v9;
    local float* v11 = &(&_ZZ9testLocalPfE8myshared)[0][v10];
    local int*v12 = (local int*)v11;
    local int* v13 = (local int*)v12;
    int v14 = v13[0];
    global int*v15 = (global int*)data;
    v15[0] = v14;
}

kernel void _Z10testLocal2Pf(global float* data) {
    local float _ZZ10testLocal2PfE8myshared[64];
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    global int*v3 = (global int*)v2;
    int v4 = v3[0];
    local float* v5 = &(&_ZZ10testLocal2PfE8myshared)[0][v1];
    local int*v6 = (local int*)v5;
    local int* v7 = (local int*)v6;
    v7[0] = v4;
    int v9 = v0 + 1;
    long v10 = v9;
    local float* v11 = &(&_ZZ10testLocal2PfE8myshared)[0][v10];
    local int*v12 = (local int*)v11;
    local int* v13 = (local int*)v12;
    int v14 = v13[0];
    global int*v15 = (global int*)data;
    v15[0] = v14;
    int v17 = v3[0];
    v13[0] = v17;
    int v19 = v7[0];
    global float* v20 = &data[1];
    global int*v21 = (global int*)v20;
    v21[0] = v19;
}

kernel void _Z9testArrayPf(global float* data) {
int i_03;
    label0:;
    float privateFloats[32];
    char*v0 = (char*)privateFloats;
        i_03 = 0;
    goto label1;
    label1:;
    int v3 = i_03 * 3;
    long v4 = v3;
    global float* v5 = &data[v4];
    global int*v6 = (global int*)v5;
    int v7 = v6[0];
    long v8 = i_03;
    float* v9 = &(&privateFloats)[0][v8];
    int*v10 = (int*)v9;
    v10[0] = v7;
    int v12 = i_03 | 1;
    int v13 = v12 * 3;
    long v14 = v13;
    global float* v15 = &data[v14];
    global int*v16 = (global int*)v15;
    int v17 = v16[0];
    long v18 = v12;
    float* v19 = &(&privateFloats)[0][v18];
    int*v20 = (int*)v19;
    v20[0] = v17;
    int v22 = i_03 | 2;
    int v23 = v22 * 3;
    long v24 = v23;
    global float* v25 = &data[v24];
    global int*v26 = (global int*)v25;
    int v27 = v26[0];
    long v28 = v22;
    float* v29 = &(&privateFloats)[0][v28];
    int*v30 = (int*)v29;
    v30[0] = v27;
    int v32 = i_03 | 3;
    int v33 = v32 * 3;
    long v34 = v33;
    global float* v35 = &data[v34];
    global int*v36 = (global int*)v35;
    int v37 = v36[0];
    long v38 = v32;
    float* v39 = &(&privateFloats)[0][v38];
    int*v40 = (int*)v39;
    v40[0] = v37;
    int v42 = i_03 + 4;
    bool exitcond_3 = v42 == 32;
    if(exitcond_3) {
        goto label2;
    } else {
        i_03 = v42;
        goto label1;
    }
    label2:;
    int*v44 = (int*)privateFloats;
    int v45 = v44[0];
    global float* v46 = &data[1];
    global int*v47 = (global int*)v46;
    v47[0] = v45;
    float* v49 = &(&privateFloats)[0][2];
    int*v50 = (int*)v49;
    int v51 = v50[0];
    global float* v52 = &data[3];
    global int*v53 = (global int*)v52;
    v53[0] = v51;
    float* v55 = &(&privateFloats)[0][4];
    int*v56 = (int*)v55;
    int v57 = v56[0];
    global float* v58 = &data[5];
    global int*v59 = (global int*)v58;
    v59[0] = v57;
    float* v61 = &(&privateFloats)[0][6];
    int*v62 = (int*)v61;
    int v63 = v62[0];
    global float* v64 = &data[7];
    global int*v65 = (global int*)v64;
    v65[0] = v63;
    float* v67 = &(&privateFloats)[0][8];
    int*v68 = (int*)v67;
    int v69 = v68[0];
    global float* v70 = &data[9];
    global int*v71 = (global int*)v70;
    v71[0] = v69;
    float* v73 = &(&privateFloats)[0][10];
    int*v74 = (int*)v73;
    int v75 = v74[0];
    global float* v76 = &data[11];
    global int*v77 = (global int*)v76;
    v77[0] = v75;
    float* v79 = &(&privateFloats)[0][12];
    int*v80 = (int*)v79;
    int v81 = v80[0];
    global float* v82 = &data[13];
    global int*v83 = (global int*)v82;
    v83[0] = v81;
    float* v85 = &(&privateFloats)[0][14];
    int*v86 = (int*)v85;
    int v87 = v86[0];
    global float* v88 = &data[15];
    global int*v89 = (global int*)v88;
    v89[0] = v87;
    float* v91 = &(&privateFloats)[0][16];
    int*v92 = (int*)v91;
    int v93 = v92[0];
    global float* v94 = &data[17];
    global int*v95 = (global int*)v94;
    v95[0] = v93;
    float* v97 = &(&privateFloats)[0][18];
    int*v98 = (int*)v97;
    int v99 = v98[0];
    global float* v100 = &data[19];
    global int*v101 = (global int*)v100;
    v101[0] = v99;
    float* v103 = &(&privateFloats)[0][20];
    int*v104 = (int*)v103;
    int v105 = v104[0];
    global float* v106 = &data[21];
    global int*v107 = (global int*)v106;
    v107[0] = v105;
    float* v109 = &(&privateFloats)[0][22];
    int*v110 = (int*)v109;
    int v111 = v110[0];
    global float* v112 = &data[23];
    global int*v113 = (global int*)v112;
    v113[0] = v111;
    float* v115 = &(&privateFloats)[0][24];
    int*v116 = (int*)v115;
    int v117 = v116[0];
    global float* v118 = &data[25];
    global int*v119 = (global int*)v118;
    v119[0] = v117;
    float* v121 = &(&privateFloats)[0][26];
    int*v122 = (int*)v121;
    int v123 = v122[0];
    global float* v124 = &data[27];
    global int*v125 = (global int*)v124;
    v125[0] = v123;
    float* v127 = &(&privateFloats)[0][28];
    int*v128 = (int*)v127;
    int v129 = v128[0];
    global float* v130 = &data[29];
    global int*v131 = (global int*)v130;
    v131[0] = v129;
    float* v133 = &(&privateFloats)[0][30];
    int*v134 = (int*)v133;
    int v135 = v134[0];
    global float* v136 = &data[31];
    global int*v137 = (global int*)v136;
    v137[0] = v135;
}

kernel void _Z10testmemcpyPf(global float* data) {
    label0:;
    global char*data4 = (global char*)data;
    float privateFloats[32];
    char*v0 = (char*)privateFloats;
    #pragma unroll
    for(int __i=0; __i < 32; __i++) {
        (( int *)v0)[__i] = ((global int *)data4)[__i];
    }
    int*v3 = (int*)privateFloats;
    int v4 = v3[0];
    global int*v5 = (global int*)data;
    v5[0] = v4;
    float* v7 = &(&privateFloats)[0][2];
    int*v8 = (int*)v7;
    int v9 = v8[0];
    global float* v10 = &data[2];
    global int*v11 = (global int*)v10;
    v11[0] = v9;
    float* v13 = &(&privateFloats)[0][4];
    int*v14 = (int*)v13;
    int v15 = v14[0];
    global float* v16 = &data[4];
    global int*v17 = (global int*)v16;
    v17[0] = v15;
    float* v19 = &(&privateFloats)[0][6];
    int*v20 = (int*)v19;
    int v21 = v20[0];
    global float* v22 = &data[6];
    global int*v23 = (global int*)v22;
    v23[0] = v21;
    float* v25 = &(&privateFloats)[0][8];
    int*v26 = (int*)v25;
    int v27 = v26[0];
    global float* v28 = &data[8];
    global int*v29 = (global int*)v28;
    v29[0] = v27;
    float* v31 = &(&privateFloats)[0][10];
    int*v32 = (int*)v31;
    int v33 = v32[0];
    global float* v34 = &data[10];
    global int*v35 = (global int*)v34;
    v35[0] = v33;
    float* v37 = &(&privateFloats)[0][12];
    int*v38 = (int*)v37;
    int v39 = v38[0];
    global float* v40 = &data[12];
    global int*v41 = (global int*)v40;
    v41[0] = v39;
    float* v43 = &(&privateFloats)[0][14];
    int*v44 = (int*)v43;
    int v45 = v44[0];
    global float* v46 = &data[14];
    global int*v47 = (global int*)v46;
    v47[0] = v45;
    float* v49 = &(&privateFloats)[0][16];
    int*v50 = (int*)v49;
    int v51 = v50[0];
    global float* v52 = &data[16];
    global int*v53 = (global int*)v52;
    v53[0] = v51;
    float* v55 = &(&privateFloats)[0][18];
    int*v56 = (int*)v55;
    int v57 = v56[0];
    global float* v58 = &data[18];
    global int*v59 = (global int*)v58;
    v59[0] = v57;
    float* v61 = &(&privateFloats)[0][20];
    int*v62 = (int*)v61;
    int v63 = v62[0];
    global float* v64 = &data[20];
    global int*v65 = (global int*)v64;
    v65[0] = v63;
    float* v67 = &(&privateFloats)[0][22];
    int*v68 = (int*)v67;
    int v69 = v68[0];
    global float* v70 = &data[22];
    global int*v71 = (global int*)v70;
    v71[0] = v69;
    float* v73 = &(&privateFloats)[0][24];
    int*v74 = (int*)v73;
    int v75 = v74[0];
    global float* v76 = &data[24];
    global int*v77 = (global int*)v76;
    v77[0] = v75;
    float* v79 = &(&privateFloats)[0][26];
    int*v80 = (int*)v79;
    int v81 = v80[0];
    global float* v82 = &data[26];
    global int*v83 = (global int*)v82;
    v83[0] = v81;
    float* v85 = &(&privateFloats)[0][28];
    int*v86 = (int*)v85;
    int v87 = v86[0];
    global float* v88 = &data[28];
    global int*v89 = (global int*)v88;
    v89[0] = v87;
    float* v91 = &(&privateFloats)[0][30];
    int*v92 = (int*)v91;
    int v93 = v92[0];
    global float* v94 = &data[30];
    global int*v95 = (global int*)v94;
    v95[0] = v93;
}

float4 _Z9getfloat4f(float a) {
    label0:;
    float v0 = a + 1.0f;
    float v1 = a + 2.5f;
    float4 v2;
    ((float*)&v2)[0] = a;
    ((float*)&v2)[1] = v0;
    float4 v3 = v2;
    ((float*)&v3)[2] = v1;
    float4 v4 = v3;
    return v4;
}

float _Z19getfloat4ElementSumfii(float a, int e0, int e1) {
    label0:;
    float4 res[1];
    char*v0 = (char*)res;
    float v2 = a + 1.0f;
    float v3 = a + 2.5f;
    float* v4 = &((float*)&res[0])[0];
    v4[0] = a;
    float* v6 = &((float*)&res[0])[1];
    v6[0] = v2;
    float* v8 = &((float*)&res[0])[2];
    v8[0] = v3;
    long v10 = e0;
    float* v11 = &v4[v10];
    float v12 = v11[0];
    float v13 = v12 + 0.0f;
    long v14 = e1;
    float* v15 = &v4[v14];
    float v16 = v15[0];
    float v17 = v13 + v16;
    return v17;
}

kernel void _Z22testFloat4_insertvalueP6float4Pfi(global float4* data, global float* data2, int N) {
    label0:;
    float v0 = data2[0];
    float v1 = v0 + 1.0f;
    float v2 = v0 + 2.5f;
    global float* v3 = &((global float*)&data[0])[0];
    v3[0] = v0;
    global float* v5 = &((global float*)&data[0])[1];
    v5[0] = v1;
    global float* v7 = &((global float*)&data[0])[2];
    v7[0] = v2;
}

kernel void _Z11useHasArrayP8hasArray(global struct hasArray* data) {
    label0:;
    global int* v0 = &data[1].f0[2];
    int v1 = v0[0];
    global int* v2 = &data[0].f0[0];
    v2[0] = v1;
}
