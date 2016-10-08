struct class_Eigen__array {
    long f0[1];
};

struct Eigen__DSizes {
    struct class_Eigen__array f0;
};

struct class_Eigen__StreamInterface {
};

struct Eigen__GpuDevice {
    struct class_Eigen__StreamInterface* f0;
    int f1;
    char f2[4];
};

struct Eigen__TensorEvaluator_0 {
    float* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_sum_op {
    char f0;
};

struct Eigen__TensorEvaluator_2 {
    float* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_1 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_2 f1;
    struct Eigen__TensorEvaluator_2 f2;
};

struct Eigen__TensorEvaluator {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_1 f1;
};




kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator* eval, long size) {
    long i1_02_i;
    long i_03_i;
    label0:;
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    long v6 = v5;
    int v7 = get_num_groups(0);
    int v8 = v7 * v2;
    long v9 = v8;
    long v10 = size / 4;
    long v11 = v10 << 2;
    long v12 = v9 << 2;
    long v13 = v6 << 2;
    bool v14 = v13 < v11;
    if(v14) {
        goto v_lr_ph5_i;
    } else {
        goto v__crit_edge6_i;
    }
    v_lr_ph5_i:;
    float*global * v16 = (&eval[0].f1.f1.f0);
    float*global * v17 = (&eval[0].f1.f2.f0);
    float*global * v18 = (&eval[0].f0.f0);
    float* v19 = v16[0];
    float* v20 = v17[0];
    float* v21 = v18[0];
        i_03_i = v13;
    goto v23;
    label24:;
        goto v__crit_edge6_i;
    v__crit_edge6_i:;
    long v26 = v6 + v11;
    bool v27 = v26 < size;
    if(v27) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll_exit;
    }
    v_lr_ph_i:;
    float*global * v29 = (&eval[0].f1.f1.f0);
    float* v30 = v29[0];
    float*global * v31 = (&eval[0].f1.f2.f0);
    float* v32 = v31[0];
    float*global * v33 = (&eval[0].f0.f0);
    float* v34 = v33[0];
        i1_02_i = v26;
    goto v36;
    v23:;
    float* v37 = (&v19[i_03_i]);
    float v38 = v37[0];
    float* v39 = (&v37[1]);
    float v40 = v39[0];
    float* v41 = (&v37[2]);
    float v42 = v41[0];
    float* v43 = (&v37[3]);
    float v44 = v43[0];
    float* v45 = (&v20[i_03_i]);
    float v46 = v45[0];
    float* v47 = (&v45[1]);
    float v48 = v47[0];
    float* v49 = (&v45[2]);
    float v50 = v49[0];
    float* v51 = (&v45[3]);
    float v52 = v51[0];
    float v53 = v38 + v46;
    float v54 = v40 + v48;
    float v55 = v42 + v50;
    float v56 = v44 + v52;
    float* v57 = (&v21[i_03_i]);
    v57[0] = v53;
    float* v59 = (&v57[1]);
    v59[0] = v54;
    float* v61 = (&v57[2]);
    v61[0] = v55;
    float* v63 = (&v57[3]);
    v63[0] = v56;
    long v65 = i_03_i + v12;
    bool v66 = v65 < v11;
    if(v66) {
        i_03_i = v65;
        goto v23;
    } else {
        goto label24;
    }
    v36:;
    float* v68 = (&v30[i1_02_i]);
    float v_val_i_i_i_i = v68[0];
    float* v69 = (&v32[i1_02_i]);
    float v_val_i1_i_i_i = v69[0];
    float v70 = v_val_i_i_i_i + v_val_i1_i_i_i;
    float* v71 = (&v34[i1_02_i]);
    v71[0] = v70;
    long v73 = i1_02_i + v9;
    bool v74 = v73 < size;
    if(v74) {
        i1_02_i = v73;
        goto v36;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll_exit_loopexit;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElLb1EE3runERSH_lll_exit:;
}
