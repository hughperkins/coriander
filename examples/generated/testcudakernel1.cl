struct MyStruct {
    int f0;
    float f1;
};


float _Z3barff(float a, float b) {
    label0:;
    float v0 = a + b;
    return v0;
}

void _Z7incrvalPf(global float* a) {
    label0:;
    float v0 = a[0];
    float v1 = v0 + 3;
    a[0] = v1;
}

kernel void _Z3fooPf(global float* data) {
    label0:;
    data[0] = 123;
}

kernel void _Z7use_tidPf(global float* data) {
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    v2[0] = 123;
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
    v2[0] = 123;
}

kernel void _Z11use_griddimPf(global float* data) {
    label0:;
    int v0 = get_num_groups(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    v2[0] = 123;
}

kernel void _Z12use_blockdimPf(global float* data) {
    label0:;
    int v0 = get_local_size(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    v2[0] = 123;
}

kernel void _Z13use_template1PfPi(global float* data, global int* intdata) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 == 0;
    if(v1) {
                goto     label1;
    } else {
                goto     label2;
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
            goto     label2;
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
    float v4 = v3 * 2;
    v2[0] = v4;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v7 = v0 + 1;
    long v8 = v7;
    global float* v9 = &data[v8];
    float v10 = v9[0];
    float v11 = v10 + 2;
    v9[0] = v11;
}

kernel void _Z11testDoWhilePii(global int* data, int N) {
int p_0;
    label0:;
    int v0 = get_global_id(0);
        p_0 = v0;
    goto     label1;
    label1:;
    int v2 = p_0 + 1;
    long v3 = v2;
    global int* v4 = &data[v3];
    int v5 = v4[0];
    bool v6 = v5 == 0;
    if(v6) {
                goto     label2;
    } else {
        p_0 = v2;
        goto     label1;
    }
    label2:;
}

kernel void _Z9testWhilePii(global int* data, int N) {
int p_0;
    label0:;
    int v0 = get_global_id(0);
        p_0 = v0;
    goto     label1;
    label1:;
    long v2 = p_0;
    global int* v3 = &data[v2];
    int v4 = v3[0];
    bool v5 = v4 == 0;
    int v6 = p_0 + 1;
    if(v5) {
                goto     label2;
    } else {
        p_0 = v6;
        goto     label1;
    }
    label2:;
}

kernel void _Z6testIfPii(global int* data, int N) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 < N;
    if(v1) {
                goto     label1;
    } else {
                goto     label2;
    }
    label1:;
    long v3 = v0;
    global int* v4 = &data[v3];
    int v5 = v4[0];
    int v6 = v5 << 1;
    v4[0] = v6;
            goto     label2;
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
                goto     label1;
    } else {
                goto     label2;
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
            goto     label3;
    label2:;
    int v15 = v4 + -20;
    v3[0] = v15;
    int v17 = v0 + 5;
    long v18 = v17;
    global int* v19 = &data[v18];
    int v20 = v19[0];
    int v21 = v20 + -20;
    v19[0] = v21;
            goto     label3;
    label3:;
}

kernel void _Z11testTernaryPf(global float* data) {
    label0:;
    global float* v0 = &data[1];
    float v1 = v0[0];
    bool v2 = v1 > 0;
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
                goto     label1;
    } else {
                goto     label12;
    }
    label1:;
    bool v3 = N > 0;
    if(v3) {
                goto     label2;
    } else {
        sum_0_lcssa = 0;
        goto     label10;
    }
    label2:;
    int v5 = N + -1;
    int xtraiter = N & 3;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        i_02_unr = 0;
sum_01_unr = 0;
        goto     label6;
    } else {
                goto     label3;
    }
    label3:;
        i_02_prol = 0;
sum_01_prol = 0;
prol_iter = xtraiter;
    goto     label4;
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
        goto     label5;
    } else {
        i_02_prol = v12;
sum_01_prol = v11;
prol_iter = prol_iter_sub;
        goto     label4;
    }
    label5:;
        v_lcssa_unr = v_lcssa4;
i_02_unr = v_lcssa5;
sum_01_unr = v_lcssa4;
    goto     label6;
    label6:;
    bool v15 = v5 < 3;
    if(v15) {
        v_lcssa = v_lcssa_unr;
        goto     label9;
    } else {
                goto     label7;
    }
    label7:;
        i_02 = i_02_unr;
sum_01 = sum_01_unr;
    goto     label11;
    label8:;
        v_lcssa = v_lcssa3;
    goto     label9;
    label9:;
        sum_0_lcssa = v_lcssa;
    goto     label10;
    label10:;
    data[0] = sum_0_lcssa;
            goto     label12;
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
        goto     label8;
    } else {
        i_02 = v41;
sum_01 = v40;
        goto     label11;
    }
    label12:;
}

kernel void _Z8setValuePfif(global float* data, int idx, float value) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 == 0;
    if(v1) {
                goto     label1;
    } else {
                goto     label2;
    }
    label1:;
    long v3 = idx;
    global float* v4 = &data[v3];
    v4[0] = value;
            goto     label2;
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
