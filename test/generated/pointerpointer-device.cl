struct MyStruct {
    float f0;
    int f1;
};



float _Z9sumStructPP8MyStructi(struct MyStruct** p_structs, int N);

float _Z9sumStructPP8MyStructi(struct MyStruct** p_structs, int N) {
float v_lcssa_unr;
float sum_02_unr;
int i_01_unr;
float v_lcssa3;
float v_lcssa;
float sum_0_lcssa;
float sum_02;
int i_01;
    label0:;
    bool v0 = N > 0;
    if(v0) {
        goto label1;
    } else {
        sum_0_lcssa = 0.0f;
        goto label7;
    }
    label1:;
    int xtraiter = N & 1;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        sum_02_unr = 0.0f;
i_01_unr = 0;
        goto label3;
    } else {
        goto label2;
    }
    label2:;
    struct MyStruct* v3 = p_structs[0];
    float* v4 = (&v3[0].f0);
    float v5 = v4[0];
    int* v6 = (&v3[0].f1);
    int v7 = v6[0];
    float v8 = v7;
    float v9 = v8 * 3.5f;
    float v10 = v5 + v9;
    float v11 = v10 + 0.0f;
        v_lcssa_unr = v11;
sum_02_unr = v11;
i_01_unr = 1;
    goto label3;
    label3:;
    bool v13 = N == 1;
    if(v13) {
        v_lcssa = v_lcssa_unr;
        goto label6;
    } else {
        goto label4;
    }
    label4:;
        sum_02 = sum_02_unr;
i_01 = i_01_unr;
    goto label8;
    label5:;
        v_lcssa = v_lcssa3;
    goto label6;
    label6:;
        sum_0_lcssa = v_lcssa;
    goto label7;
    label7:;
    return sum_0_lcssa;
    label8:;
    long v19 = i_01;
    struct MyStruct** v20 = (&p_structs[v19]);
    struct MyStruct* v21 = v20[0];
    float* v22 = (&v21[0].f0);
    float v23 = v22[0];
    int* v24 = (&v21[0].f1);
    int v25 = v24[0];
    float v26 = v25;
    float v27 = v26 * 3.5f;
    float v28 = v23 + v27;
    float v29 = sum_02 + v28;
    int v30 = i_01 + 1;
    long v31 = v30;
    struct MyStruct** v32 = (&p_structs[v31]);
    struct MyStruct* v33 = v32[0];
    float* v34 = (&v33[0].f0);
    float v35 = v34[0];
    int* v36 = (&v33[0].f1);
    int v37 = v36[0];
    float v38 = v37;
    float v39 = v38 * 3.5f;
    float v40 = v35 + v39;
    float v41 = v29 + v40;
    int v42 = i_01 + 2;
    bool exitcond_1 = v42 == N;
    if(exitcond_1) {
        v_lcssa3 = v41;
        goto label5;
    } else {
        sum_02 = v41;
i_01 = v42;
        goto label8;
    }
}

kernel void _Z8mykernelPfP8MyStructi(global float* data, global struct MyStruct* structs, int N) {
float sum_02_i_prol;
int i_01_i_prol;
int prol_iter;
int v_lcssa28;
float v_lcssa27;
float v_lcssa24_unr;
float sum_02_i_unr;
int i_01_i_unr;
float sum_02_i;
int i_01_i;
float v_lcssa26;
float v_lcssa24;
int* v_pre_phi18;
float sum_0_lcssa_i;
float sum_02_i8;
int i_01_i9;
float v_lcssa25;
float sum_02_i2;
int i_01_i3;
float v_lcssa;
    label0:;
    bool v0 = N > 0;
    global float* v1 = (&structs[0].f0);
    if(v0) {
        goto label2;
    } else {
        goto label1;
    }
    label1:;
    global int* v_pre17 = (&structs[0].f1);
        v_pre_phi18 = v_pre17;
sum_0_lcssa_i = 0.0f;
    goto label11;
    label2:;
    float v4 = v1[0];
    global int* v5 = (&structs[0].f1);
    int v6 = v5[0];
    float v7 = v6;
    float v8 = v7 * 3.5f;
    float v9 = v4 + v8;
    int v10 = N + -1;
    int xtraiter = N & 7;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        sum_02_i_unr = 0.0f;
i_01_i_unr = 0;
        goto label6;
    } else {
        goto label3;
    }
    label3:;
        sum_02_i_prol = 0.0f;
i_01_i_prol = 0;
prol_iter = xtraiter;
    goto label4;
    label4:;
    float v13 = sum_02_i_prol + v9;
    int v14 = i_01_i_prol + 1;
    int prol_iter_sub = prol_iter + -1;
    bool prol_iter_cmp = prol_iter_sub == 0;
    if(prol_iter_cmp) {
        v_lcssa28 = v14;
v_lcssa27 = v13;
        goto label5;
    } else {
        sum_02_i_prol = v13;
i_01_i_prol = v14;
prol_iter = prol_iter_sub;
        goto label4;
    }
    label5:;
        v_lcssa24_unr = v_lcssa27;
sum_02_i_unr = v_lcssa27;
i_01_i_unr = v_lcssa28;
    goto label6;
    label6:;
    bool v17 = v10 < 7;
    if(v17) {
        v_lcssa24 = v_lcssa24_unr;
        goto label10;
    } else {
        goto label7;
    }
    label7:;
        sum_02_i = sum_02_i_unr;
i_01_i = i_01_i_unr;
    goto label8;
    label8:;
    float v20 = sum_02_i + v9;
    float v21 = v20 + v9;
    float v22 = v21 + v9;
    float v23 = v22 + v9;
    float v24 = v23 + v9;
    float v25 = v24 + v9;
    float v26 = v25 + v9;
    float v27 = v26 + v9;
    int v28 = i_01_i + 8;
    bool exitcond_i_7 = v28 == N;
    if(exitcond_i_7) {
        v_lcssa26 = v27;
        goto label9;
    } else {
        sum_02_i = v27;
i_01_i = v28;
        goto label8;
    }
    label9:;
        v_lcssa24 = v_lcssa26;
    goto label10;
    label10:;
        v_pre_phi18 = v5;
sum_0_lcssa_i = v_lcssa24;
    goto label11;
    label11:;
    data[0] = sum_0_lcssa_i;
    float v33 = v1[0];
    int v34 = v_pre_phi18[0];
    float v35 = v34;
    float v36 = v35 * 3.5f;
    float v37 = v33 + v36;
        sum_02_i8 = 0.0f;
i_01_i9 = 0;
    goto label12;
    label12:;
    float v39 = sum_02_i8 + v37;
    float v40 = v39 + v37;
    float v41 = v40 + v37;
    int v42 = i_01_i9 + 3;
    bool exitcond_i10_2 = v42 == 123;
    if(exitcond_i10_2) {
        v_lcssa25 = v41;
        goto label13;
    } else {
        sum_02_i8 = v41;
i_01_i9 = v42;
        goto label12;
    }
    label13:;
    global float* v44 = (&data[3]);
    v44[0] = v_lcssa25;
    float v46 = v1[0];
    int v47 = v_pre_phi18[0];
    float v48 = v47;
    float v49 = v48 * 3.5f;
    float v50 = v46 + v49;
        sum_02_i2 = 0.0f;
i_01_i3 = 0;
    goto label14;
    label14:;
    float v52 = sum_02_i2 + v50;
    float v53 = v52 + v50;
    float v54 = v53 + v50;
    float v55 = v54 + v50;
    float v56 = v55 + v50;
    float v57 = v56 + v50;
    float v58 = v57 + v50;
    float v59 = v58 + v50;
    float v60 = v59 + v50;
    float v61 = v60 + v50;
    float v62 = v61 + v50;
    float v63 = v62 + v50;
    float v64 = v63 + v50;
    float v65 = v64 + v50;
    float v66 = v65 + v50;
    int v67 = i_01_i3 + 15;
    bool exitcond_i4_14 = v67 == 12300;
    if(exitcond_i4_14) {
        v_lcssa = v66;
        goto label15;
    } else {
        sum_02_i2 = v66;
i_01_i3 = v67;
        goto label14;
    }
    label15:;
    global float* v69 = (&data[4]);
    v69[0] = v_lcssa;
}
