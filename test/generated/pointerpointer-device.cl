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

kernel void _Z8mykernelPfPP8MyStructi(global float* data, global struct MyStruct** p_structs, int N) {
float v_lcssa_unr;
float sum_02_i_unr;
int i_01_i_unr;
float sum_02_i;
int i_01_i;
float v_lcssa1;
float v_lcssa;
float sum_0_lcssa_i;
    label0:;
    bool v0 = N > 0;
    if(v0) {
        goto label1;
    } else {
        sum_0_lcssa_i = 0.0f;
        goto label8;
    }
    label1:;
    int xtraiter = N & 1;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        sum_02_i_unr = 0.0f;
i_01_i_unr = 0;
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
sum_02_i_unr = v11;
i_01_i_unr = 1;
    goto label3;
    label3:;
    bool v13 = N == 1;
    if(v13) {
        v_lcssa = v_lcssa_unr;
        goto label7;
    } else {
        goto label4;
    }
    label4:;
        sum_02_i = sum_02_i_unr;
i_01_i = i_01_i_unr;
    goto label5;
    label5:;
    long v16 = i_01_i;
    global struct MyStruct** v17 = (&p_structs[v16]);
    struct MyStruct* v18 = v17[0];
    float* v19 = (&v18[0].f0);
    float v20 = v19[0];
    int* v21 = (&v18[0].f1);
    int v22 = v21[0];
    float v23 = v22;
    float v24 = v23 * 3.5f;
    float v25 = v20 + v24;
    float v26 = sum_02_i + v25;
    int v27 = i_01_i + 1;
    long v28 = v27;
    global struct MyStruct** v29 = (&p_structs[v28]);
    struct MyStruct* v30 = v29[0];
    float* v31 = (&v30[0].f0);
    float v32 = v31[0];
    int* v33 = (&v30[0].f1);
    int v34 = v33[0];
    float v35 = v34;
    float v36 = v35 * 3.5f;
    float v37 = v32 + v36;
    float v38 = v26 + v37;
    int v39 = i_01_i + 2;
    bool exitcond_i_1 = v39 == N;
    if(exitcond_i_1) {
        v_lcssa1 = v38;
        goto label6;
    } else {
        sum_02_i = v38;
i_01_i = v39;
        goto label5;
    }
    label6:;
        v_lcssa = v_lcssa1;
    goto label7;
    label7:;
        sum_0_lcssa_i = v_lcssa;
    goto label8;
    label8:;
    data[0] = sum_0_lcssa_i;
}
