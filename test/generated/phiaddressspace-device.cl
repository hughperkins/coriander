struct MyStruct {
    float f0;
    int f1;
};



float _Z9sumStructPP8MyStructi(struct MyStruct** p_structs, int N);

float _Z9sumStructPP8MyStructi(struct MyStruct** p_structs, int N) {
    int i_01;
    int i_01_unr;
    float sum_02;
    float sum_02_unr;
    float sum_0_lcssa;
    float v_lcssa;
    float v_lcssa3;
    float v_lcssa_unr;
    label0:;
    bool v1 = N > 0;
    if(v1) {
        goto v_lr_ph_preheader;
    } else {
        sum_0_lcssa = 0.0f;
        goto v__crit_edge;
    }
    v_lr_ph_preheader:;
    int xtraiter = N & 1;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        sum_02_unr = 0.0f;
i_01_unr = 0;
        goto v_lr_ph_preheader_split;
    } else {
        goto v_lr_ph_prol;
    }
    v_lr_ph_prol:;
    struct MyStruct* v4 = p_structs[0];
    float* v5 = (&v4[0].f0);
    float v6 = v5[0];
    int* v7 = (&v4[0].f1);
    int v8 = v7[0];
    float v9 = v8;
    float v10 = v9 * 3.5f;
    float v11 = v6 + v10;
    float v12 = v11 + 0.0f;
        v_lcssa_unr = v12;
sum_02_unr = v12;
i_01_unr = 1;
    goto v_lr_ph_preheader_split;
    v_lr_ph_preheader_split:;
    bool v14 = N == 1;
    if(v14) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge_loopexit;
    } else {
        goto v_lr_ph_preheader_split_split;
    }
    v_lr_ph_preheader_split_split:;
        sum_02 = sum_02_unr;
i_01 = i_01_unr;
    goto v_lr_ph;
    label17:;
        v_lcssa = v_lcssa3;
    goto v__crit_edge_loopexit;
    v__crit_edge_loopexit:;
        sum_0_lcssa = v_lcssa;
    goto v__crit_edge;
    v__crit_edge:;
    return sum_0_lcssa;
    v_lr_ph:;
    long v21 = i_01;
    struct MyStruct** v22 = (&p_structs[v21]);
    struct MyStruct* v23 = v22[0];
    float* v24 = (&v23[0].f0);
    float v25 = v24[0];
    int* v26 = (&v23[0].f1);
    int v27 = v26[0];
    float v28 = v27;
    float v29 = v28 * 3.5f;
    float v30 = v25 + v29;
    float v31 = sum_02 + v30;
    int v32 = i_01 + 1;
    long v33 = v32;
    struct MyStruct** v34 = (&p_structs[v33]);
    struct MyStruct* v35 = v34[0];
    float* v36 = (&v35[0].f0);
    float v37 = v36[0];
    int* v38 = (&v35[0].f1);
    int v39 = v38[0];
    float v40 = v39;
    float v41 = v40 * 3.5f;
    float v42 = v37 + v41;
    float v43 = v31 + v42;
    int v44 = i_01 + 2;
    bool exitcond_1 = v44 == N;
    if(exitcond_1) {
        v_lcssa3 = v43;
        goto label17;
    } else {
        sum_02 = v43;
i_01 = v44;
        goto v_lr_ph;
    }
}

kernel void _Z8mykernelPfP8MyStructi(global float* data, global struct MyStruct* structs, int N) {
    int i_01_i;
    int i_01_i3;
    int i_01_i9;
    int i_01_i_prol;
    int i_01_i_unr;
    int prol_iter;
    float sum_02_i;
    float sum_02_i2;
    float sum_02_i8;
    float sum_02_i_prol;
    float sum_02_i_unr;
    float sum_0_lcssa_i;
    float v_lcssa;
    float v_lcssa24;
    float v_lcssa24_unr;
    float v_lcssa25;
    float v_lcssa26;
    float v_lcssa27;
    int v_lcssa28;
    global int* v_pre_phi18;
    label0:;
    bool v1 = N > 0;
    global float* v2 = (&structs[0].f0);
    if(v1) {
        goto v_lr_ph_i_preheader;
    } else {
        goto v__Z9sumStructPP8MyStructi_exit_crit_edge;
    }
    v__Z9sumStructPP8MyStructi_exit_crit_edge:;
    global int* v_pre17 = (&structs[0].f1);
        v_pre_phi18 = v_pre17;
sum_0_lcssa_i = 0.0f;
    goto _Z9sumStructPP8MyStructi_exit;
    v_lr_ph_i_preheader:;
    float v5 = v2[0];
    global int* v6 = (&structs[0].f1);
    int v7 = v6[0];
    float v8 = v7;
    float v9 = v8 * 3.5f;
    float v10 = v5 + v9;
    int v11 = N + -1;
    int xtraiter = N & 7;
    bool lcmp_mod = xtraiter == 0;
    if(lcmp_mod) {
        sum_02_i_unr = 0.0f;
i_01_i_unr = 0;
        goto v_lr_ph_i_preheader_split;
    } else {
        goto v_lr_ph_i_prol_preheader;
    }
    v_lr_ph_i_prol_preheader:;
        sum_02_i_prol = 0.0f;
i_01_i_prol = 0;
prol_iter = xtraiter;
    goto v_lr_ph_i_prol;
    v_lr_ph_i_prol:;
    float v14 = sum_02_i_prol + v10;
    int v15 = i_01_i_prol + 1;
    int prol_iter_sub = prol_iter + -1;
    bool prol_iter_cmp = prol_iter_sub == 0;
    if(prol_iter_cmp) {
        v_lcssa28 = v15;
v_lcssa27 = v14;
        goto v_lr_ph_i_preheader_split_loopexit;
    } else {
        sum_02_i_prol = v14;
i_01_i_prol = v15;
prol_iter = prol_iter_sub;
        goto v_lr_ph_i_prol;
    }
    v_lr_ph_i_preheader_split_loopexit:;
        v_lcssa24_unr = v_lcssa27;
sum_02_i_unr = v_lcssa27;
i_01_i_unr = v_lcssa28;
    goto v_lr_ph_i_preheader_split;
    v_lr_ph_i_preheader_split:;
    bool v18 = v11 < 7;
    if(v18) {
        v_lcssa24 = v_lcssa24_unr;
        goto _Z9sumStructPP8MyStructi_exit_loopexit;
    } else {
        goto v_lr_ph_i_preheader_split_split;
    }
    v_lr_ph_i_preheader_split_split:;
        sum_02_i = sum_02_i_unr;
i_01_i = i_01_i_unr;
    goto v_lr_ph_i;
    v_lr_ph_i:;
    float v21 = sum_02_i + v10;
    float v22 = v21 + v10;
    float v23 = v22 + v10;
    float v24 = v23 + v10;
    float v25 = v24 + v10;
    float v26 = v25 + v10;
    float v27 = v26 + v10;
    float v28 = v27 + v10;
    int v29 = i_01_i + 8;
    bool exitcond_i_7 = v29 == N;
    if(exitcond_i_7) {
        v_lcssa26 = v28;
        goto _Z9sumStructPP8MyStructi_exit_loopexit_unr_lcssa;
    } else {
        sum_02_i = v28;
i_01_i = v29;
        goto v_lr_ph_i;
    }
    _Z9sumStructPP8MyStructi_exit_loopexit_unr_lcssa:;
        v_lcssa24 = v_lcssa26;
    goto _Z9sumStructPP8MyStructi_exit_loopexit;
    _Z9sumStructPP8MyStructi_exit_loopexit:;
        v_pre_phi18 = v6;
sum_0_lcssa_i = v_lcssa24;
    goto _Z9sumStructPP8MyStructi_exit;
    _Z9sumStructPP8MyStructi_exit:;
    data[0] = sum_0_lcssa_i;
    float v34 = v2[0];
    int v35 = v_pre_phi18[0];
    float v36 = v35;
    float v37 = v36 * 3.5f;
    float v38 = v34 + v37;
        sum_02_i8 = 0.0f;
i_01_i9 = 0;
    goto v_lr_ph_i11;
    v_lr_ph_i11:;
    float v40 = sum_02_i8 + v38;
    float v41 = v40 + v38;
    float v42 = v41 + v38;
    int v43 = i_01_i9 + 3;
    bool exitcond_i10_2 = v43 == 123;
    if(exitcond_i10_2) {
        v_lcssa25 = v42;
        goto _Z9sumStructPP8MyStructi_exit12;
    } else {
        sum_02_i8 = v42;
i_01_i9 = v43;
        goto v_lr_ph_i11;
    }
    _Z9sumStructPP8MyStructi_exit12:;
    global float* v45 = (&data[3]);
    v45[0] = v_lcssa25;
    float v47 = v2[0];
    int v48 = v_pre_phi18[0];
    float v49 = v48;
    float v50 = v49 * 3.5f;
    float v51 = v47 + v50;
        sum_02_i2 = 0.0f;
i_01_i3 = 0;
    goto v_lr_ph_i5;
    v_lr_ph_i5:;
    float v53 = sum_02_i2 + v51;
    float v54 = v53 + v51;
    float v55 = v54 + v51;
    float v56 = v55 + v51;
    float v57 = v56 + v51;
    float v58 = v57 + v51;
    float v59 = v58 + v51;
    float v60 = v59 + v51;
    float v61 = v60 + v51;
    float v62 = v61 + v51;
    float v63 = v62 + v51;
    float v64 = v63 + v51;
    float v65 = v64 + v51;
    float v66 = v65 + v51;
    float v67 = v66 + v51;
    int v68 = i_01_i3 + 15;
    bool exitcond_i4_14 = v68 == 12300;
    if(exitcond_i4_14) {
        v_lcssa = v67;
        goto _Z9sumStructPP8MyStructi_exit6;
    } else {
        sum_02_i2 = v67;
i_01_i3 = v68;
        goto v_lr_ph_i5;
    }
    _Z9sumStructPP8MyStructi_exit6:;
    global float* v70 = (&data[4]);
    v70[0] = v_lcssa;
}
