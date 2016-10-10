struct class_Eigen__array {
    int f0[1];
};

struct Eigen__DSizes {
    struct class_Eigen__array f0;
};

struct class_Eigen__StreamInterface {
};

struct Eigen__GpuDevice {
    global struct class_Eigen__StreamInterface* f0;
    int f1;
    char f2[4];
};

struct Eigen__TensorEvaluator_0 {
    global float* f0;
    struct Eigen__DSizes f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_constant_op {
    float f0;
};

struct Eigen__TensorEvaluator_2 {
    global float* f0;
    struct Eigen__DSizes f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__nullary_wrapper {
    char f0;
};

struct Eigen__TensorEvaluator_1 {
    struct Eigen__internal__scalar_constant_op f0;
    char f1[4];
    struct Eigen__TensorEvaluator_2 f2;
    struct Eigen__internal__nullary_wrapper f3;
    char f4[7];
};

struct Eigen__TensorEvaluator {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_1 f1;
};

struct class_Eigen__internal__UniformRandomGenerator {
    long f0;
};

struct Eigen__internal__nullary_wrapper_5 {
    char f0;
};

struct Eigen__TensorEvaluator_4 {
    struct class_Eigen__internal__UniformRandomGenerator f0;
    struct Eigen__TensorEvaluator_2 f1;
    struct Eigen__internal__nullary_wrapper_5 f2;
    char f3[7];
};

struct Eigen__TensorEvaluator_3 {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_4 f1;
};

struct class_Eigen__array_10 {
    long f0[1];
};

struct Eigen__DSizes_9 {
    struct class_Eigen__array_10 f0;
};

struct Eigen__TensorEvaluator_8 {
    global float* f0;
    struct Eigen__DSizes_9 f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_sum_op {
    char f0;
};

struct Eigen__TensorEvaluator_12 {
    global float* f0;
    struct Eigen__DSizes_9 f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_11 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_12 f1;
    struct Eigen__TensorEvaluator_12 f2;
};

struct Eigen__TensorEvaluator_7 {
    struct Eigen__TensorEvaluator_8 f0;
    struct Eigen__TensorEvaluator_11 f1;
};

struct class_Eigen__array_16 {
    long f0[3];
};

struct Eigen__DSizes_15 {
    struct class_Eigen__array_16 f0;
};

struct Eigen__TensorEvaluator_14 {
    global float* f0;
    struct Eigen__DSizes_15 f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_18 {
    global float* f0;
    struct Eigen__DSizes_15 f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_product_op {
    char f0;
};

struct Eigen__TensorEvaluator_19 {
    struct Eigen__internal__scalar_product_op f0;
    struct Eigen__TensorEvaluator_18 f1;
    struct Eigen__TensorEvaluator_18 f2;
};

struct Eigen__TensorEvaluator_17 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_18 f1;
    struct Eigen__TensorEvaluator_19 f2;
};

struct Eigen__TensorEvaluator_13 {
    struct Eigen__TensorEvaluator_14 f0;
    struct Eigen__TensorEvaluator_17 f1;
};

struct Eigen__TensorEvaluator_21 {
    global char* f0;
    struct Eigen__DSizes_9 f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_isnan_op {
    char f0;
};

struct Eigen__TensorEvaluator_22 {
    struct Eigen__internal__scalar_isnan_op f0;
    struct Eigen__TensorEvaluator_12 f1;
};

struct Eigen__TensorEvaluator_20 {
    struct Eigen__TensorEvaluator_21 f0;
    struct Eigen__TensorEvaluator_22 f1;
};

struct Eigen__TensorEvaluator_24 {
    global float* f0;
    struct Eigen__DSizes_9 f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_23 {
    struct Eigen__TensorEvaluator_24 f0;
    global struct Eigen__GpuDevice* f1;
    global float* f2;
};

struct class_Eigen__array_27 {
    long f0[4];
};

struct Eigen__DSizes_26 {
    struct class_Eigen__array_27 f0;
};

struct Eigen__TensorEvaluator_25 {
    global float* f0;
    struct Eigen__DSizes_26 f1;
    global struct Eigen__GpuDevice* f2;
};

struct class_Eigen__internal__IndexMapper {
    struct class_Eigen__array_27 f0;
    struct class_Eigen__array_27 f1;
    struct class_Eigen__array_27 f2;
    struct class_Eigen__array_27 f3;
};

struct class_Eigen__internal__IndexMapper_30 {
    struct class_Eigen__array_27 f0;
    struct class_Eigen__array_27 f1;
    struct class_Eigen__array_27 f2;
    struct class_Eigen__array_27 f3;
};

struct class_Eigen__internal__IndexMapper_31 {
    struct class_Eigen__array_27 f0;
    struct class_Eigen__array_27 f1;
    struct class_Eigen__array_27 f2;
    struct class_Eigen__array_27 f3;
};

struct Eigen__TensorEvaluator_33 {
    global float* f0;
    struct Eigen__DSizes_26 f1;
    global struct Eigen__GpuDevice* f2;
};

struct class_Eigen__TensorMap {
    global float* f0;
    struct Eigen__DSizes_9 f1;
};

struct Eigen__TensorEvaluator_34 {
    struct Eigen__TensorEvaluator_25 f0;
    struct Eigen__TensorEvaluator_24 f1;
    struct class_Eigen__TensorMap f2;
    struct class_Eigen__array_10 f3;
    struct Eigen__DSizes_26 f4;
    global float* f5;
    global float* f6;
    char f7;
    global struct Eigen__GpuDevice* f8;
};

struct Eigen__TensorEvaluator_32 {
    struct Eigen__TensorEvaluator_33 f0;
    struct Eigen__TensorEvaluator_34 f1;
};

struct Eigen__TensorEvaluator_37 {
    global float* f0;
    struct Eigen__DSizes_9 f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_36 {
    struct Eigen__TensorEvaluator_37 f0;
    global struct Eigen__GpuDevice* f1;
    global float* f2;
};

struct Eigen__TensorEvaluator_38 {
    global float* f0;
    struct Eigen__DSizes_26 f1;
    global struct Eigen__GpuDevice* f2;
};

struct class_Eigen__internal__IndexMapper_39 {
    struct class_Eigen__array_27 f0;
    struct class_Eigen__array_27 f1;
    struct class_Eigen__array_27 f2;
    struct class_Eigen__array_27 f3;
};

struct class_Eigen__internal__IndexMapper_40 {
    struct class_Eigen__array_27 f0;
    struct class_Eigen__array_27 f1;
    struct class_Eigen__array_27 f2;
    struct class_Eigen__array_27 f3;
};

struct class_Eigen__internal__IndexMapper_41 {
    struct class_Eigen__array_27 f0;
    struct class_Eigen__array_27 f1;
    struct class_Eigen__array_27 f2;
    struct class_Eigen__array_27 f3;
};

struct Eigen__TensorEvaluator_43 {
    global float* f0;
    struct Eigen__DSizes_26 f1;
    global struct Eigen__GpuDevice* f2;
};

struct class_Eigen__TensorMap_45 {
    global float* f0;
    struct Eigen__DSizes_9 f1;
};

struct Eigen__TensorEvaluator_44 {
    struct Eigen__TensorEvaluator_38 f0;
    struct Eigen__TensorEvaluator_37 f1;
    struct class_Eigen__TensorMap_45 f2;
    struct class_Eigen__array_10 f3;
    struct Eigen__DSizes_26 f4;
    global float* f5;
    global float* f6;
    char f7;
    global struct Eigen__GpuDevice* f8;
};

struct Eigen__TensorEvaluator_42 {
    struct Eigen__TensorEvaluator_43 f0;
    struct Eigen__TensorEvaluator_44 f1;
};




kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator* eval, global float* eval_ptr0, global float* eval_ptr1, int size) {
    int i1_02_i;
    int i_03_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f2.f0 = eval_ptr1;

    label0:;
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    int v8 = size / 4;
    int v9 = v8 << 2;
    int v10 = v7 << 2;
    int v11 = v5 << 2;
    bool v12 = v11 < v9;
    if(v12) {
        goto v_lr_ph5_i;
    } else {
        goto v__crit_edge6_i;
    }
    v_lr_ph5_i:;
    global float* v14 = (&eval[0].f1.f0.f0);
    global int* v15 = ((global int*)v14);
    global float*global * v16 = (&eval[0].f0.f0);
    int v17 = v15[0];
    global float* v18 = v16[0];
        i_03_i = v11;
    goto v20;
    label21:;
        goto v__crit_edge6_i;
    v__crit_edge6_i:;
    int v23 = v5 + v9;
    bool v24 = v23 < size;
    if(v24) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit;
    }
    v_lr_ph_i:;
    global float* v26 = (&eval[0].f1.f0.f0);
    global int* v27 = ((global int*)v26);
    global float*global * v28 = (&eval[0].f0.f0);
    global float* v29 = v28[0];
    int v30 = v27[0];
        i1_02_i = v23;
    goto v32;
    v20:;
    long v33 = i_03_i;
    global float* v34 = (&v18[v33]);
    global int* v35 = ((global int*)v34);
    v35[0] = v17;
    global float* v37 = (&v34[1]);
    global int* v38 = ((global int*)v37);
    v38[0] = v17;
    global float* v40 = (&v34[2]);
    global int* v41 = ((global int*)v40);
    v41[0] = v17;
    global float* v43 = (&v34[3]);
    global int* v44 = ((global int*)v43);
    v44[0] = v17;
    int v46 = i_03_i + v10;
    bool v47 = v46 < v9;
    if(v47) {
        i_03_i = v46;
        goto v20;
    } else {
        goto label21;
    }
    v32:;
    long v49 = i1_02_i;
    global float* v50 = (&v29[v49]);
    global int* v51 = ((global int*)v50);
    v51[0] = v30;
    int v53 = i1_02_i + v7;
    bool v54 = v53 < size;
    if(v54) {
        i1_02_i = v53;
        goto v32;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit_loopexit;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_3* eval, global float* eval_ptr0, global float* eval_ptr1, int size) {
    int i1_02_i;
    int i_03_i;
    long v18;
    long v30;
    long v_lcssa;
    long v_lcssa6;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f1.f0 = eval_ptr1;

    label0:;
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    int v8 = size / 4;
    int v9 = v8 << 2;
    int v10 = v7 << 2;
    int v11 = v5 << 2;
    bool v12 = v11 < v9;
    if(v12) {
        goto v_lr_ph5_i;
    } else {
        goto v__crit_edge6_i;
    }
    v_lr_ph5_i:;
    global long* v14 = (&eval[0].f1.f0.f0);
    global float*global * v15 = (&eval[0].f0.f0);
    global float* v16 = v15[0];
    long v_promoted = v14[0];
        v18 = v_promoted;
i_03_i = v11;
    goto v19;
    label20:;
    v14[0] = v_lcssa6;
        goto v__crit_edge6_i;
    v__crit_edge6_i:;
    int v23 = v5 + v9;
    bool v24 = v23 < size;
    if(v24) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit;
    }
    v_lr_ph_i:;
    global long* v26 = (&eval[0].f1.f0.f0);
    global float*global * v27 = (&eval[0].f0.f0);
    global float* v28 = v27[0];
    long v_promoted_i = v26[0];
        v30 = v_promoted_i;
i1_02_i = v23;
    goto v31;
    v19:;
    long v32 = i_03_i;
    long v33 = v18 + v32;
    long v34 = v33 * 6364136223846793005;
    long v35 = v34 + -2720673578348880933;
    long v36 = v33 >> 22;
    long v37 = v36 ^ v33;
    long v38 = v33 >> 61;
    long v39 = v38 + 22;
    long v40 = v37 >> v39;
    int v41 = (int)v40;
    int v42 = v41 & 8388607;
    int v43 = v42 | 1065353216;
    float v44 = ((float)v43);
    float v45 = v44 + -1.0f;
    long v46 = v35 * 6364136223846793005;
    long v47 = v46 + -2720673578348880933;
    long v48 = v35 >> 22;
    long v49 = v48 ^ v35;
    long v50 = v35 >> 61;
    long v51 = v50 + 22;
    long v52 = v49 >> v51;
    int v53 = (int)v52;
    int v54 = v53 & 8388607;
    int v55 = v54 | 1065353216;
    float v56 = ((float)v55);
    float v57 = v56 + -1.0f;
    long v58 = v47 * 6364136223846793005;
    long v59 = v58 + -2720673578348880933;
    long v60 = v47 >> 22;
    long v61 = v60 ^ v47;
    long v62 = v47 >> 61;
    long v63 = v62 + 22;
    long v64 = v61 >> v63;
    int v65 = (int)v64;
    int v66 = v65 & 8388607;
    int v67 = v66 | 1065353216;
    float v68 = ((float)v67);
    float v69 = v68 + -1.0f;
    long v70 = v59 * 6364136223846793005;
    long v71 = v70 + -2720673578348880933;
    long v72 = v59 >> 22;
    long v73 = v72 ^ v59;
    long v74 = v59 >> 61;
    long v75 = v74 + 22;
    long v76 = v73 >> v75;
    int v77 = (int)v76;
    int v78 = v77 & 8388607;
    int v79 = v78 | 1065353216;
    float v80 = ((float)v79);
    float v81 = v80 + -1.0f;
    global float* v82 = (&v16[v32]);
    v82[0] = v45;
    global float* v84 = (&v82[1]);
    v84[0] = v57;
    global float* v86 = (&v82[2]);
    v86[0] = v69;
    global float* v88 = (&v82[3]);
    v88[0] = v81;
    int v90 = i_03_i + v10;
    bool v91 = v90 < v9;
    if(v91) {
        v18 = v71;
i_03_i = v90;
        goto v19;
    } else {
        v_lcssa6 = v71;
        goto label20;
    }
    label93:;
    v26[0] = v_lcssa;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit;
    v31:;
    long v96 = i1_02_i;
    long v97 = v96 + v30;
    long v98 = v97 * 6364136223846793005;
    long v99 = v98 + -2720673578348880933;
    long v100 = v97 >> 22;
    long v101 = v100 ^ v97;
    long v102 = v97 >> 61;
    long v103 = v102 + 22;
    long v104 = v101 >> v103;
    int v105 = (int)v104;
    int v106 = v105 & 8388607;
    int v107 = v106 | 1065353216;
    float v108 = ((float)v107);
    float v109 = v108 + -1.0f;
    global float* v110 = (&v28[v96]);
    v110[0] = v109;
    int v112 = i1_02_i + v7;
    bool v113 = v112 < size;
    if(v113) {
        v30 = v99;
i1_02_i = v112;
        goto v31;
    } else {
        v_lcssa = v99;
        goto label93;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiLb1EE3runERSH_iii_exit:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0ElEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_SB_EEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_7* eval, global float* eval_ptr0, global float* eval_ptr1, global float* eval_ptr2, long size) {
    long i1_02_i;
    long i_03_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f1.f0 = eval_ptr1;
eval[0].f1.f2.f0 = eval_ptr2;

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
    global float*global * v16 = (&eval[0].f1.f1.f0);
    global float*global * v17 = (&eval[0].f1.f2.f0);
    global float*global * v18 = (&eval[0].f0.f0);
    global float* v19 = v16[0];
    global float* v20 = v17[0];
    global float* v21 = v18[0];
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
    global float*global * v29 = (&eval[0].f1.f1.f0);
    global float* v30 = v29[0];
    global float*global * v31 = (&eval[0].f1.f2.f0);
    global float* v32 = v31[0];
    global float*global * v33 = (&eval[0].f0.f0);
    global float* v34 = v33[0];
        i1_02_i = v26;
    goto v36;
    v23:;
    global float* v37 = (&v19[i_03_i]);
    float v38 = v37[0];
    global float* v39 = (&v37[1]);
    float v40 = v39[0];
    global float* v41 = (&v37[2]);
    float v42 = v41[0];
    global float* v43 = (&v37[3]);
    float v44 = v43[0];
    global float* v45 = (&v20[i_03_i]);
    float v46 = v45[0];
    global float* v47 = (&v45[1]);
    float v48 = v47[0];
    global float* v49 = (&v45[2]);
    float v50 = v49[0];
    global float* v51 = (&v45[3]);
    float v52 = v51[0];
    float v53 = v38 + v46;
    float v54 = v40 + v48;
    float v55 = v42 + v50;
    float v56 = v44 + v52;
    global float* v57 = (&v21[i_03_i]);
    v57[0] = v53;
    global float* v59 = (&v57[1]);
    v59[0] = v54;
    global float* v61 = (&v57[2]);
    v61[0] = v55;
    global float* v63 = (&v57[3]);
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
    global float* v68 = (&v30[i1_02_i]);
    float v_val_i_i_i_i = v68[0];
    global float* v69 = (&v32[i1_02_i]);
    float v_val_i1_i_i_i = v69[0];
    float v70 = v_val_i_i_i_i + v_val_i1_i_i_i;
    global float* v71 = (&v34[i1_02_i]);
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

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_13* eval, global float* eval_ptr0, global float* eval_ptr1, global float* eval_ptr2, global float* eval_ptr3, long size) {
    long i_01_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f1.f0 = eval_ptr1;
eval[0].f1.f2.f1.f0 = eval_ptr2;
eval[0].f1.f2.f2.f0 = eval_ptr3;

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
    bool v10 = v6 < size;
    if(v10) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;
    }
    v_lr_ph_i:;
    global float*global * v12 = (&eval[0].f1.f1.f0);
    global float* v13 = v12[0];
    global float*global * v14 = (&eval[0].f1.f2.f1.f0);
    global float* v15 = v14[0];
    global float*global * v16 = (&eval[0].f1.f2.f2.f0);
    global float* v17 = v16[0];
    global float*global * v18 = (&eval[0].f0.f0);
    global float* v19 = v18[0];
        i_01_i = v6;
    goto v21;
    v21:;
    global float* v22 = (&v13[i_01_i]);
    float v_val_i_i_i_i = v22[0];
    global float* v23 = (&v15[i_01_i]);
    float v_val_i_i_i_i_i = v23[0];
    global float* v24 = (&v17[i_01_i]);
    float v_val_i1_i_i_i_i = v24[0];
    float v25 = v_val_i_i_i_i_i * v_val_i1_i_i_i_i;
    float v26 = v_val_i_i_i_i + v25;
    global float* v27 = (&v19[i_01_i]);
    v27[0] = v26;
    long v29 = i_01_i + v9;
    bool v30 = v29 < size;
    if(v30) {
        i_01_i = v29;
        goto v21;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_20* eval, global char* eval_ptr0, global float* eval_ptr1, long size) {
    long i_01_i;
    long i_01_us_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f1.f0 = eval_ptr1;

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
    bool v10 = v6 < size;
    if(v10) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit;
    }
    v_lr_ph_i:;
    global float*global * v12 = (&eval[0].f1.f1.f0);
    global float* v13 = v12[0];
    int call_i_i_i_i_i_i_i_i_i_i =  0;
    bool v14 = call_i_i_i_i_i_i_i_i_i_i == 0;
    global char*global * v15 = (&eval[0].f0.f0);
    global char* v16 = v15[0];
    if(v14) {
        goto v_lr_ph_split_us_i_preheader;
    } else {
        goto v_lr_ph_split_i_preheader;
    }
    v_lr_ph_split_i_preheader:;
        i_01_i = v6;
    goto v_lr_ph_split_i;
    v_lr_ph_split_us_i_preheader:;
        i_01_us_i = v6;
    goto v_lr_ph_split_us_i;
    v_lr_ph_split_us_i:;
    global float* v20 = (&v13[i_01_us_i]);
    float v_val_i_i_i_us_i = v20[0];
    float v21 = fabs(v_val_i_i_i_us_i);
    bool v22 = v21 > INFINITY;
    global char* v23 = (&v16[i_01_us_i]);
    char v24 = v22;
    v23[0] = v24;
    long v26 = i_01_us_i + v9;
    bool v27 = v26 < size;
    if(v27) {
        i_01_us_i = v26;
        goto v_lr_ph_split_us_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit_loopexit;
    }
    v_lr_ph_split_i:;
    global float* v29 = (&v13[i_01_i]);
    float v_val_i_i_i_i = v29[0];
    float v30 = fabs(v_val_i_i_i_i);
    bool v31 = v30 > INFINITY;
    global char* v32 = (&v16[i_01_i]);
    char v33 = v31;
    v32[0] = v33;
    long v35 = i_01_i + v9;
    bool v36 = v35 < size;
    if(v36) {
        i_01_i = v35;
        goto v_lr_ph_split_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit_loopexit5;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit_loopexit5:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIbLi1ELi0ElEELi16EEEKNS_18TensorCwiseUnaryOpINS0_15scalar_isnan_opIfEEKNS4_INS5_IfLi1ELi0ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSJ_lll_exit:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_23* eval, global float* eval_ptr0, global float* eval_ptr1, long size) {
    long i_01_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f2 = eval_ptr1;

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
    bool v10 = v6 < size;
    if(v10) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit;
    }
    v_lr_ph_i:;
    global float*global * v12 = (&eval[0].f0.f0);
    global float* v13 = v12[0];
    global float*global * v14 = (&eval[0].f2);
    global float* v15 = v14[0];
        i_01_i = v6;
    goto v17;
    v17:;
    global float* v18 = (&v13[i_01_i]);
    global int* v19 = ((global int*)v18);
    int v_val_i1_i_i = v19[0];
    global float* v20 = (&v15[i_01_i]);
    global int* v21 = ((global int*)v20);
    v21[0] = v_val_i1_i_i;
    long v23 = i_01_i + v9;
    bool v24 = v23 < size;
    if(v24) {
        i_01_i = v23;
        goto v17;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit_loopexit;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi0ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit:;
}

kernel void _ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int kernelSize, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i1_010;
    int i_07;
    int p_014;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 4;
    int v8 = get_group_id(1);
    int v9 = get_local_size(1);
    int v10 = v9 * v8;
    int v11 = get_num_groups(1);
    int v12 = v11 * v9;
    int v13 = get_global_id(1);
    int v14 = v13 + v10;
    bool v15 = v14 < numPlanes;
    if(v15) {
        goto v_lr_ph16;
    } else {
        goto v__crit_edge17;
    }
    v_lr_ph16:;
    global long* v17 = (&indexMapper[0].f2.f0[3]);
    long v18 = v17[0];
    global long* v19 = (&indexMapper[0].f0.f0[3]);
    long v20 = v19[0];
    global long* v21 = (&indexMapper[0].f2.f0[2]);
    long v22 = v21[0];
    global long* v23 = (&indexMapper[0].f0.f0[2]);
    long v24 = v23[0];
    global long* v25 = (&indexMapper[0].f0.f0[1]);
    long v26 = v25[0];
    int v27 = v7 * v13;
    int v28 = get_global_id(0);
    bool v29 = v28 < v7;
    global long* v30 = (&indexMapper[0].f3.f0[3]);
    long v31 = v30[0];
    global long* v32 = (&indexMapper[0].f1.f0[3]);
    long v33 = v32[0];
    global long* v34 = (&indexMapper[0].f3.f0[2]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[2]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v28 > v6;
    global long* v41 = (&indexMapper[0].f1.f0[0]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f0.f0[0]);
    long v44 = v43[0];
    global float*global * v45 = (&eval[0].f0);
    global float* v46 = v45[0];
    global float* v_phi_trans_insert = (&_kernel[1]);
    global float* v_phi_trans_insert19 = (&_kernel[2]);
    global float* v_phi_trans_insert21 = (&_kernel[3]);
        p_014 = v14;
    goto v48;
    label49:;
        goto v__crit_edge17;
    v__crit_edge17:;
    v48:;
    long v52 = p_014;
    long v53 = v52 / v18;
    long v54 = v20 * v53;
    long v55 = v53 * v18;
    long v56 = v52 - v55;
    long v57 = v56 / v22;
    long v58 = v24 * v57;
    long v59 = v58 + v54;
    long v60 = v57 * v22;
    long v61 = v56 - v60;
    long v62 = v26 * v61;
    long v63 = v59 + v62;
    if(v29) {
        goto v_lr_ph;
    } else {
        goto v__crit_edge;
    }
    v_lr_ph:;
    int v65 = get_local_size(0);
        i_07 = v28;
    goto v67;
    label68:;
        goto v__crit_edge;
    v__crit_edge:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v71 = v52 / v31;
    long v72 = v33 * v71;
    long v73 = v71 * v31;
    long v74 = v52 - v73;
    long v75 = v74 / v35;
    long v76 = v37 * v75;
    long v77 = v76 + v72;
    long v78 = v75 * v35;
    long v79 = v74 - v78;
    long v80 = v39 * v79;
    long v81 = v77 + v80;
    if(v40) {
        goto v__crit_edge13;
    } else {
        goto v_lr_ph12;
    }
    v_lr_ph12:;
    int v83 = get_local_size(0);
    float v_pre = _kernel[0];
    float v_pre18 = v_phi_trans_insert[0];
    float v_pre20 = v_phi_trans_insert19[0];
    float v_pre22 = v_phi_trans_insert21[0];
        i1_010 = v28;
    goto v85;
    v67:;
    int v86 = i_07 + v2;
    long v87 = v86;
    long v88 = v44 * v87;
    long v89 = v63 + v88;
    long sext5 = v89 << 32;
    long v90 = sext5 >> 32;
    global float* v91 = (&v46[v90]);
    global int* v92 = ((global int*)v91);
    int v_val_i6 = v92[0];
    int v93 = i_07 + v27;
    long v94 = v93;
    local float* v95 = (&(&_ZN5Eigen1sE)[0][v94]);
    local int* v96 = ((local int*)v95);
    local int* v97 = (v96);
    v97[0] = v_val_i6;
    int v99 = v65 + i_07;
    bool v100 = v99 < v7;
    if(v100) {
        i_07 = v99;
        goto v67;
    } else {
        goto label68;
    }
    label102:;
        goto v__crit_edge13;
    v__crit_edge13:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v105 = p_014 + v12;
    bool v106 = v105 < numPlanes;
    if(v106) {
        p_014 = v105;
        goto v48;
    } else {
        goto label49;
    }
    v85:;
    int v108 = i1_010 + v27;
    long v109 = v108;
    local float* v110 = (&(&_ZN5Eigen1sE)[0][v109]);
    local float* v111 = (v110);
    float v112 = v111[0];
    float v113 = v112 * v_pre;
    float v114 = v113 + 0.0f;
    int v115 = v108 + 1;
    long v116 = v115;
    local float* v117 = (&(&_ZN5Eigen1sE)[0][v116]);
    local float* v118 = (v117);
    float v119 = v118[0];
    float v120 = v119 * v_pre18;
    float v121 = v114 + v120;
    int v122 = v108 + 2;
    long v123 = v122;
    local float* v124 = (&(&_ZN5Eigen1sE)[0][v123]);
    local float* v125 = (v124);
    float v126 = v125[0];
    float v127 = v126 * v_pre20;
    float v128 = v121 + v127;
    int v129 = v108 + 3;
    long v130 = v129;
    local float* v131 = (&(&_ZN5Eigen1sE)[0][v130]);
    local float* v132 = (v131);
    float v133 = v132[0];
    float v134 = v133 * v_pre22;
    float v135 = v128 + v134;
    int v136 = i1_010 + v2;
    long v137 = v136;
    long v138 = v42 * v137;
    long v139 = v81 + v138;
    long sext3 = v139 << 32;
    long v140 = sext3 >> 32;
    global float* v141 = (&buffer[v140]);
    v141[0] = v135;
    int v143 = v83 + i1_010;
    bool v144 = v143 > v6;
    if(v144) {
        goto label102;
    } else {
        i1_010 = v143;
        goto v85;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int kernelSize, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i1_010;
    int i_07;
    int p_014;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 7;
    int v8 = get_group_id(1);
    int v9 = get_local_size(1);
    int v10 = v9 * v8;
    int v11 = get_num_groups(1);
    int v12 = v11 * v9;
    int v13 = get_global_id(1);
    int v14 = v13 + v10;
    bool v15 = v14 < numPlanes;
    if(v15) {
        goto v_lr_ph16;
    } else {
        goto v__crit_edge17;
    }
    v_lr_ph16:;
    global long* v17 = (&indexMapper[0].f2.f0[3]);
    long v18 = v17[0];
    global long* v19 = (&indexMapper[0].f0.f0[3]);
    long v20 = v19[0];
    global long* v21 = (&indexMapper[0].f2.f0[2]);
    long v22 = v21[0];
    global long* v23 = (&indexMapper[0].f0.f0[2]);
    long v24 = v23[0];
    global long* v25 = (&indexMapper[0].f0.f0[1]);
    long v26 = v25[0];
    int v27 = v7 * v13;
    int v28 = get_global_id(0);
    bool v29 = v28 < v7;
    global long* v30 = (&indexMapper[0].f3.f0[3]);
    long v31 = v30[0];
    global long* v32 = (&indexMapper[0].f1.f0[3]);
    long v33 = v32[0];
    global long* v34 = (&indexMapper[0].f3.f0[2]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[2]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v28 > v6;
    global long* v41 = (&indexMapper[0].f1.f0[0]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f0.f0[0]);
    long v44 = v43[0];
    global float*global * v45 = (&eval[0].f0);
    global float* v46 = v45[0];
    global float* v_phi_trans_insert = (&_kernel[1]);
    global float* v_phi_trans_insert19 = (&_kernel[2]);
    global float* v_phi_trans_insert21 = (&_kernel[3]);
    global float* v_phi_trans_insert23 = (&_kernel[4]);
    global float* v_phi_trans_insert25 = (&_kernel[5]);
    global float* v_phi_trans_insert27 = (&_kernel[6]);
        p_014 = v14;
    goto v48;
    label49:;
        goto v__crit_edge17;
    v__crit_edge17:;
    v48:;
    long v52 = p_014;
    long v53 = v52 / v18;
    long v54 = v20 * v53;
    long v55 = v53 * v18;
    long v56 = v52 - v55;
    long v57 = v56 / v22;
    long v58 = v24 * v57;
    long v59 = v58 + v54;
    long v60 = v57 * v22;
    long v61 = v56 - v60;
    long v62 = v26 * v61;
    long v63 = v59 + v62;
    if(v29) {
        goto v_lr_ph;
    } else {
        goto v__crit_edge;
    }
    v_lr_ph:;
    int v65 = get_local_size(0);
        i_07 = v28;
    goto v67;
    label68:;
        goto v__crit_edge;
    v__crit_edge:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v71 = v52 / v31;
    long v72 = v33 * v71;
    long v73 = v71 * v31;
    long v74 = v52 - v73;
    long v75 = v74 / v35;
    long v76 = v37 * v75;
    long v77 = v76 + v72;
    long v78 = v75 * v35;
    long v79 = v74 - v78;
    long v80 = v39 * v79;
    long v81 = v77 + v80;
    if(v40) {
        goto v__crit_edge13;
    } else {
        goto v_lr_ph12;
    }
    v_lr_ph12:;
    int v83 = get_local_size(0);
    float v_pre = _kernel[0];
    float v_pre18 = v_phi_trans_insert[0];
    float v_pre20 = v_phi_trans_insert19[0];
    float v_pre22 = v_phi_trans_insert21[0];
    float v_pre24 = v_phi_trans_insert23[0];
    float v_pre26 = v_phi_trans_insert25[0];
    float v_pre28 = v_phi_trans_insert27[0];
        i1_010 = v28;
    goto v85;
    v67:;
    int v86 = i_07 + v2;
    long v87 = v86;
    long v88 = v44 * v87;
    long v89 = v63 + v88;
    long sext5 = v89 << 32;
    long v90 = sext5 >> 32;
    global float* v91 = (&v46[v90]);
    global int* v92 = ((global int*)v91);
    int v_val_i6 = v92[0];
    int v93 = i_07 + v27;
    long v94 = v93;
    local float* v95 = (&(&_ZN5Eigen1sE)[0][v94]);
    local int* v96 = ((local int*)v95);
    local int* v97 = (v96);
    v97[0] = v_val_i6;
    int v99 = v65 + i_07;
    bool v100 = v99 < v7;
    if(v100) {
        i_07 = v99;
        goto v67;
    } else {
        goto label68;
    }
    label102:;
        goto v__crit_edge13;
    v__crit_edge13:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v105 = p_014 + v12;
    bool v106 = v105 < numPlanes;
    if(v106) {
        p_014 = v105;
        goto v48;
    } else {
        goto label49;
    }
    v85:;
    int v108 = i1_010 + v27;
    long v109 = v108;
    local float* v110 = (&(&_ZN5Eigen1sE)[0][v109]);
    local float* v111 = (v110);
    float v112 = v111[0];
    float v113 = v112 * v_pre;
    float v114 = v113 + 0.0f;
    int v115 = v108 + 1;
    long v116 = v115;
    local float* v117 = (&(&_ZN5Eigen1sE)[0][v116]);
    local float* v118 = (v117);
    float v119 = v118[0];
    float v120 = v119 * v_pre18;
    float v121 = v114 + v120;
    int v122 = v108 + 2;
    long v123 = v122;
    local float* v124 = (&(&_ZN5Eigen1sE)[0][v123]);
    local float* v125 = (v124);
    float v126 = v125[0];
    float v127 = v126 * v_pre20;
    float v128 = v121 + v127;
    int v129 = v108 + 3;
    long v130 = v129;
    local float* v131 = (&(&_ZN5Eigen1sE)[0][v130]);
    local float* v132 = (v131);
    float v133 = v132[0];
    float v134 = v133 * v_pre22;
    float v135 = v128 + v134;
    int v136 = v108 + 4;
    long v137 = v136;
    local float* v138 = (&(&_ZN5Eigen1sE)[0][v137]);
    local float* v139 = (v138);
    float v140 = v139[0];
    float v141 = v140 * v_pre24;
    float v142 = v135 + v141;
    int v143 = v108 + 5;
    long v144 = v143;
    local float* v145 = (&(&_ZN5Eigen1sE)[0][v144]);
    local float* v146 = (v145);
    float v147 = v146[0];
    float v148 = v147 * v_pre26;
    float v149 = v142 + v148;
    int v150 = v108 + 6;
    long v151 = v150;
    local float* v152 = (&(&_ZN5Eigen1sE)[0][v151]);
    local float* v153 = (v152);
    float v154 = v153[0];
    float v155 = v154 * v_pre28;
    float v156 = v149 + v155;
    int v157 = i1_010 + v2;
    long v158 = v157;
    long v159 = v42 * v158;
    long v160 = v81 + v159;
    long sext3 = v160 << 32;
    long v161 = sext3 >> 32;
    global float* v162 = (&buffer[v161]);
    v162[0] = v156;
    int v164 = v83 + i1_010;
    bool v165 = v164 > v6;
    if(v165) {
        goto label102;
    } else {
        i1_010 = v164;
        goto v85;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int kernelSize, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i1_013;
    int i1_013_us;
    int i_07;
    int k_09_us;
    int k_09_us_unr;
    int p_017;
    float result_08_us;
    float result_08_us_unr;
    float v_lcssa;
    float v_lcssa28;
    float v_lcssa_unr;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + kernelSize;
    int v8 = get_group_id(1);
    int v9 = get_local_size(1);
    int v10 = v9 * v8;
    int v11 = get_num_groups(1);
    int v12 = v11 * v9;
    int v13 = get_global_id(1);
    int v14 = v13 + v10;
    bool v15 = v14 < numPlanes;
    if(v15) {
        goto v_lr_ph19;
    } else {
        goto v__crit_edge20;
    }
    v_lr_ph19:;
    global long* v17 = (&indexMapper[0].f2.f0[3]);
    long v18 = v17[0];
    global long* v19 = (&indexMapper[0].f0.f0[3]);
    long v20 = v19[0];
    global long* v21 = (&indexMapper[0].f2.f0[2]);
    long v22 = v21[0];
    global long* v23 = (&indexMapper[0].f0.f0[2]);
    long v24 = v23[0];
    global long* v25 = (&indexMapper[0].f0.f0[1]);
    long v26 = v25[0];
    int v27 = v7 * v13;
    int v28 = get_global_id(0);
    bool v29 = v28 < v7;
    global long* v30 = (&indexMapper[0].f3.f0[3]);
    long v31 = v30[0];
    global long* v32 = (&indexMapper[0].f1.f0[3]);
    long v33 = v32[0];
    global long* v34 = (&indexMapper[0].f3.f0[2]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[2]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v28 > v6;
    bool v41 = kernelSize > 0;
    global long* v42 = (&indexMapper[0].f1.f0[0]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f0.f0[0]);
    long v45 = v44[0];
    global float*global * v46 = (&eval[0].f0);
    global float* v47 = v46[0];
    int xtraiter = kernelSize & 1;
    bool lcmp_mod = xtraiter == 0;
    bool v48 = kernelSize == 1;
        p_017 = v14;
    goto v50;
    label51:;
        goto v__crit_edge20;
    v__crit_edge20:;
    v50:;
    long v54 = p_017;
    long v55 = v54 / v18;
    long v56 = v20 * v55;
    long v57 = v55 * v18;
    long v58 = v54 - v57;
    long v59 = v58 / v22;
    long v60 = v24 * v59;
    long v61 = v60 + v56;
    long v62 = v59 * v22;
    long v63 = v58 - v62;
    long v64 = v26 * v63;
    long v65 = v61 + v64;
    if(v29) {
        goto v_lr_ph;
    } else {
        goto v__crit_edge;
    }
    v_lr_ph:;
    int v67 = get_local_size(0);
        i_07 = v28;
    goto v69;
    label70:;
        goto v__crit_edge;
    v__crit_edge:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v73 = v54 / v31;
    long v74 = v33 * v73;
    long v75 = v73 * v31;
    long v76 = v54 - v75;
    long v77 = v76 / v35;
    long v78 = v37 * v77;
    long v79 = v78 + v74;
    long v80 = v77 * v35;
    long v81 = v76 - v80;
    long v82 = v39 * v81;
    long v83 = v79 + v82;
    if(v40) {
        goto v__crit_edge16;
    } else {
        goto v_lr_ph15;
    }
    v_lr_ph15:;
    int v85 = get_local_size(0);
    if(v41) {
        goto v_lr_ph15_split_us_preheader;
    } else {
        goto v_lr_ph15_split_preheader;
    }
    v_lr_ph15_split_preheader:;
        i1_013 = v28;
    goto v_lr_ph15_split;
    v_lr_ph15_split_us_preheader:;
        i1_013_us = v28;
    goto v_lr_ph15_split_us;
    v_lr_ph15_split_us:;
    int v89 = i1_013_us + v27;
    if(lcmp_mod) {
        k_09_us_unr = 0;
result_08_us_unr = 0.0f;
        goto v_lr_ph15_split_us_split;
    } else {
        goto v91;
    }
    v91:;
    long v92 = v89;
    local float* v93 = (&(&_ZN5Eigen1sE)[0][v92]);
    local float* v94 = (v93);
    float v95 = v94[0];
    float v96 = _kernel[0];
    float v97 = v95 * v96;
    float v98 = v97 + 0.0f;
        k_09_us_unr = 1;
result_08_us_unr = v98;
v_lcssa_unr = v98;
    goto v_lr_ph15_split_us_split;
    v_lr_ph15_split_us_split:;
    if(v48) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge12_us;
    } else {
        goto v_lr_ph15_split_us_split_split_preheader;
    }
    v_lr_ph15_split_us_split_split_preheader:;
        k_09_us = k_09_us_unr;
result_08_us = result_08_us_unr;
    goto v_lr_ph15_split_us_split_split;
    v_lr_ph15_split_us_split_split:;
    int v102 = v89 + k_09_us;
    long v103 = v102;
    local float* v104 = (&(&_ZN5Eigen1sE)[0][v103]);
    local float* v105 = (v104);
    float v106 = v105[0];
    long v107 = k_09_us;
    global float* v108 = (&_kernel[v107]);
    float v109 = v108[0];
    float v110 = v106 * v109;
    float v111 = result_08_us + v110;
    int v112 = k_09_us + 1;
    int v113 = v89 + v112;
    long v114 = v113;
    local float* v115 = (&(&_ZN5Eigen1sE)[0][v114]);
    local float* v116 = (v115);
    float v117 = v116[0];
    long v118 = v112;
    global float* v119 = (&_kernel[v118]);
    float v120 = v119[0];
    float v121 = v117 * v120;
    float v122 = v111 + v121;
    int v123 = k_09_us + 2;
    bool exitcond_1 = v123 == kernelSize;
    if(exitcond_1) {
        v_lcssa28 = v122;
        goto v__crit_edge12_us_loopexit;
    } else {
        k_09_us = v123;
result_08_us = v122;
        goto v_lr_ph15_split_us_split_split;
    }
    v__crit_edge12_us_loopexit:;
        v_lcssa = v_lcssa28;
    goto v__crit_edge12_us;
    v__crit_edge12_us:;
    int v126 = i1_013_us + v2;
    long v127 = v126;
    long v128 = v43 * v127;
    long v129 = v83 + v128;
    long sext3_us = v129 << 32;
    long v130 = sext3_us >> 32;
    global float* v131 = (&buffer[v130]);
    v131[0] = v_lcssa;
    int v133 = v85 + i1_013_us;
    bool v134 = v133 > v6;
    if(v134) {
        goto v__crit_edge16_loopexit;
    } else {
        i1_013_us = v133;
        goto v_lr_ph15_split_us;
    }
    v69:;
    int v136 = i_07 + v2;
    long v137 = v136;
    long v138 = v45 * v137;
    long v139 = v65 + v138;
    long sext5 = v139 << 32;
    long v140 = sext5 >> 32;
    global float* v141 = (&v47[v140]);
    global int* v142 = ((global int*)v141);
    int v_val_i6 = v142[0];
    int v143 = i_07 + v27;
    long v144 = v143;
    local float* v145 = (&(&_ZN5Eigen1sE)[0][v144]);
    local int* v146 = ((local int*)v145);
    local int* v147 = (v146);
    v147[0] = v_val_i6;
    int v149 = v67 + i_07;
    bool v150 = v149 < v7;
    if(v150) {
        i_07 = v149;
        goto v69;
    } else {
        goto label70;
    }
    v__crit_edge16_loopexit:;
        goto v__crit_edge16;
    label153:;
        goto v__crit_edge16;
    v__crit_edge16:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v156 = p_017 + v12;
    bool v157 = v156 < numPlanes;
    if(v157) {
        p_017 = v156;
        goto v50;
    } else {
        goto label51;
    }
    v_lr_ph15_split:;
    int v159 = i1_013 + v2;
    long v160 = v159;
    long v161 = v43 * v160;
    long v162 = v83 + v161;
    long sext3 = v162 << 32;
    long v163 = sext3 >> 32;
    global float* v164 = (&buffer[v163]);
    v164[0] = 0.0f;
    int v166 = v85 + i1_013;
    bool v167 = v166 > v6;
    if(v167) {
        goto label153;
    } else {
        i1_013 = v166;
        goto v_lr_ph15_split;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_30* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_020;
    int i_010_us;
    int j1_022;
    int j1_022_us;
    int j_011;
    int j_011_us;
    int p_027;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 4;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + 7;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph29;
    } else {
        goto v__crit_edge30;
    }
    v_lr_ph29:;
    global long* v25 = (&indexMapper[0].f2.f0[3]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[3]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[2]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[3]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[3]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    global long* v41 = (&indexMapper[0].f1.f0[0]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f1.f0[1]);
    long v44 = v43[0];
    global long* v45 = (&indexMapper[0].f0.f0[0]);
    long v46 = v45[0];
    global long* v47 = (&indexMapper[0].f0.f0[1]);
    long v48 = v47[0];
    global float*global * v49 = (&eval[0].f0);
    global float* v50 = v49[0];
    global float* v51 = (&_kernel[1]);
    global float* v52 = (&_kernel[2]);
    global float* v53 = (&_kernel[3]);
    long v54 = kernelSizeX;
    global float* v55 = (&_kernel[v54]);
    int v56 = kernelSizeX + 1;
    long v57 = v56;
    global float* v58 = (&_kernel[v57]);
    int v59 = kernelSizeX + 2;
    long v60 = v59;
    global float* v61 = (&_kernel[v60]);
    int v62 = kernelSizeX + 3;
    long v63 = v62;
    global float* v64 = (&_kernel[v63]);
    int v65 = kernelSizeX << 1;
    long v66 = v65;
    global float* v67 = (&_kernel[v66]);
    int v68 = v65 | 1;
    long v69 = v68;
    global float* v70 = (&_kernel[v69]);
    int v71 = v65 + 2;
    long v72 = v71;
    global float* v73 = (&_kernel[v72]);
    int v74 = v65 + 3;
    long v75 = v74;
    global float* v76 = (&_kernel[v75]);
    int v77 = kernelSizeX * 3;
    long v78 = v77;
    global float* v79 = (&_kernel[v78]);
    int v80 = v77 + 1;
    long v81 = v80;
    global float* v82 = (&_kernel[v81]);
    int v83 = v77 + 2;
    long v84 = v83;
    global float* v85 = (&_kernel[v84]);
    int v86 = v77 + 3;
    long v87 = v86;
    global float* v88 = (&_kernel[v87]);
    int v89 = kernelSizeX << 2;
    long v90 = v89;
    global float* v91 = (&_kernel[v90]);
    int v92 = v89 | 1;
    long v93 = v92;
    global float* v94 = (&_kernel[v93]);
    int v95 = v89 | 2;
    long v96 = v95;
    global float* v97 = (&_kernel[v96]);
    int v98 = v89 | 3;
    long v99 = v98;
    global float* v100 = (&_kernel[v99]);
    int v101 = kernelSizeX * 5;
    long v102 = v101;
    global float* v103 = (&_kernel[v102]);
    int v104 = v101 + 1;
    long v105 = v104;
    global float* v106 = (&_kernel[v105]);
    int v107 = v101 + 2;
    long v108 = v107;
    global float* v109 = (&_kernel[v108]);
    int v110 = v101 + 3;
    long v111 = v110;
    global float* v112 = (&_kernel[v111]);
    int v113 = kernelSizeX * 6;
    long v114 = v113;
    global float* v115 = (&_kernel[v114]);
    int v116 = v113 | 1;
    long v117 = v116;
    global float* v118 = (&_kernel[v117]);
    int v119 = v113 + 2;
    long v120 = v119;
    global float* v121 = (&_kernel[v120]);
    int v122 = v113 + 3;
    long v123 = v122;
    global float* v124 = (&_kernel[v123]);
        p_027 = v22;
    goto v126;
    label127:;
        goto v__crit_edge30;
    v__crit_edge30:;
    v126:;
    long v130 = p_027;
    long v131 = v130 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v133 = v131 * v26;
    long v134 = v130 - v133;
    long v135 = v30 * v134;
    long v136 = v28 * v131;
    int v137 = get_global_id(0);
    bool v138 = v137 < v7;
    int v139 = get_local_size(1);
    long v140 = v135 + v136;
    if(v138) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v143 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v145 = j_011_us + v31;
    int v146 = v145 * v7;
    int v147 = j_011_us + v9;
    long v148 = v147;
    long v149 = v48 * v148;
        i_010_us = v137;
    goto v151;
    v151:;
    int v152 = i_010_us + v2;
    long v153 = v152;
    long v154 = v46 * v153;
    long v155 = v140 + v154;
    long v156 = v155 + v149;
    long sext7_us = v156 << 32;
    long v157 = sext7_us >> 32;
    global float* v158 = (&v50[v157]);
    global int* v159 = ((global int*)v158);
    int v_val_i8_us = v159[0];
    int v160 = i_010_us + v146;
    long v161 = v160;
    local float* v162 = (&(&_ZN5Eigen1sE)[0][v161]);
    local int* v163 = ((local int*)v162);
    local int* v164 = (v163);
    v164[0] = v_val_i8_us;
    int v166 = v143 + i_010_us;
    bool v167 = v166 < v7;
    if(v167) {
        i_010_us = v166;
        goto v151;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v169 = v139 + j_011_us;
    bool v170 = v169 < v15;
    if(v170) {
        j_011_us = v169;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label173:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v176 = v130 / v35;
    if(v40) {
        goto v__crit_edge26;
    } else {
        goto v_lr_ph25;
    }
    v_lr_ph25:;
    long v178 = v176 * v35;
    long v179 = v130 - v178;
    long v180 = v39 * v179;
    long v181 = v37 * v176;
    int v182 = get_global_id(0);
    bool v183 = v182 > v6;
    int v184 = get_local_size(1);
    long v185 = v180 + v181;
    if(v183) {
        goto v_lr_ph25_split_us_preheader;
    } else {
        goto v_preheader_lr_ph_preheader;
    }
    v_lr_ph25_split_us_preheader:;
        j1_022_us = v32;
    goto v_lr_ph25_split_us;
    v_preheader_lr_ph_preheader:;
    int v188 = get_local_size(0);
    float v189 = _kernel[0];
    float v190 = v51[0];
    float v191 = v52[0];
    float v192 = v53[0];
    float v193 = v55[0];
    float v194 = v58[0];
    float v195 = v61[0];
    float v196 = v64[0];
    float v197 = v67[0];
    float v198 = v70[0];
    float v199 = v73[0];
    float v200 = v76[0];
    float v201 = v79[0];
    float v202 = v82[0];
    float v203 = v85[0];
    float v204 = v88[0];
    float v205 = v91[0];
    float v206 = v94[0];
    float v207 = v97[0];
    float v208 = v100[0];
    float v209 = v103[0];
    float v210 = v106[0];
    float v211 = v109[0];
    float v212 = v112[0];
    float v213 = v115[0];
    float v214 = v118[0];
    float v215 = v121[0];
    float v216 = v124[0];
        j1_022 = v32;
    goto v_preheader_lr_ph;
    v_lr_ph25_split_us:;
    int v218 = v184 + j1_022_us;
    bool v219 = v218 > v14;
    if(v219) {
        goto v__crit_edge26_loopexit;
    } else {
        j1_022_us = v218;
        goto v_lr_ph25_split_us;
    }
    v_lr_ph14_split:;
    int v221 = v139 + j_011;
    bool v222 = v221 < v15;
    if(v222) {
        j_011 = v221;
        goto v_lr_ph14_split;
    } else {
        goto label173;
    }
    v__crit_edge26_loopexit:;
        goto v__crit_edge26;
    label225:;
        goto v__crit_edge26;
    v__crit_edge26:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v228 = p_027 + v20;
    bool v229 = v228 < numPlanes;
    if(v229) {
        p_027 = v228;
        goto v126;
    } else {
        goto label127;
    }
    v_preheader_lr_ph:;
    int v231 = j1_022 + v31;
    int v232 = j1_022 + v9;
    long v233 = v232;
    long v234 = v44 * v233;
    int v235 = v231 + 6;
    int v236 = v235 * v7;
    int v237 = v231 * v7;
    int v238 = v231 + 1;
    int v239 = v238 * v7;
    int v240 = v231 + 2;
    int v241 = v240 * v7;
    int v242 = v231 + 3;
    int v243 = v242 * v7;
    int v244 = v231 + 4;
    int v245 = v244 * v7;
    int v246 = v231 + 5;
    int v247 = v246 * v7;
        i2_020 = v182;
    goto v_preheader;
    v_preheader:;
    int v249 = v237 + i2_020;
    long v250 = v249;
    local float* v251 = (&(&_ZN5Eigen1sE)[0][v250]);
    local float* v252 = (v251);
    float v253 = v252[0];
    float v254 = v253 * v189;
    float v255 = v254 + 0.0f;
    int v256 = v249 + 1;
    long v257 = v256;
    local float* v258 = (&(&_ZN5Eigen1sE)[0][v257]);
    local float* v259 = (v258);
    float v260 = v259[0];
    float v261 = v260 * v190;
    float v262 = v255 + v261;
    int v263 = v249 + 2;
    long v264 = v263;
    local float* v265 = (&(&_ZN5Eigen1sE)[0][v264]);
    local float* v266 = (v265);
    float v267 = v266[0];
    float v268 = v267 * v191;
    float v269 = v262 + v268;
    int v270 = v249 + 3;
    long v271 = v270;
    local float* v272 = (&(&_ZN5Eigen1sE)[0][v271]);
    local float* v273 = (v272);
    float v274 = v273[0];
    float v275 = v274 * v192;
    float v276 = v269 + v275;
    int v277 = v239 + i2_020;
    long v278 = v277;
    local float* v279 = (&(&_ZN5Eigen1sE)[0][v278]);
    local float* v280 = (v279);
    float v281 = v280[0];
    float v282 = v281 * v193;
    float v283 = v276 + v282;
    int v284 = v277 + 1;
    long v285 = v284;
    local float* v286 = (&(&_ZN5Eigen1sE)[0][v285]);
    local float* v287 = (v286);
    float v288 = v287[0];
    float v289 = v288 * v194;
    float v290 = v283 + v289;
    int v291 = v277 + 2;
    long v292 = v291;
    local float* v293 = (&(&_ZN5Eigen1sE)[0][v292]);
    local float* v294 = (v293);
    float v295 = v294[0];
    float v296 = v295 * v195;
    float v297 = v290 + v296;
    int v298 = v277 + 3;
    long v299 = v298;
    local float* v300 = (&(&_ZN5Eigen1sE)[0][v299]);
    local float* v301 = (v300);
    float v302 = v301[0];
    float v303 = v302 * v196;
    float v304 = v297 + v303;
    int v305 = v241 + i2_020;
    long v306 = v305;
    local float* v307 = (&(&_ZN5Eigen1sE)[0][v306]);
    local float* v308 = (v307);
    float v309 = v308[0];
    float v310 = v309 * v197;
    float v311 = v304 + v310;
    int v312 = v305 + 1;
    long v313 = v312;
    local float* v314 = (&(&_ZN5Eigen1sE)[0][v313]);
    local float* v315 = (v314);
    float v316 = v315[0];
    float v317 = v316 * v198;
    float v318 = v311 + v317;
    int v319 = v305 + 2;
    long v320 = v319;
    local float* v321 = (&(&_ZN5Eigen1sE)[0][v320]);
    local float* v322 = (v321);
    float v323 = v322[0];
    float v324 = v323 * v199;
    float v325 = v318 + v324;
    int v326 = v305 + 3;
    long v327 = v326;
    local float* v328 = (&(&_ZN5Eigen1sE)[0][v327]);
    local float* v329 = (v328);
    float v330 = v329[0];
    float v331 = v330 * v200;
    float v332 = v325 + v331;
    int v333 = v243 + i2_020;
    long v334 = v333;
    local float* v335 = (&(&_ZN5Eigen1sE)[0][v334]);
    local float* v336 = (v335);
    float v337 = v336[0];
    float v338 = v337 * v201;
    float v339 = v332 + v338;
    int v340 = v333 + 1;
    long v341 = v340;
    local float* v342 = (&(&_ZN5Eigen1sE)[0][v341]);
    local float* v343 = (v342);
    float v344 = v343[0];
    float v345 = v344 * v202;
    float v346 = v339 + v345;
    int v347 = v333 + 2;
    long v348 = v347;
    local float* v349 = (&(&_ZN5Eigen1sE)[0][v348]);
    local float* v350 = (v349);
    float v351 = v350[0];
    float v352 = v351 * v203;
    float v353 = v346 + v352;
    int v354 = v333 + 3;
    long v355 = v354;
    local float* v356 = (&(&_ZN5Eigen1sE)[0][v355]);
    local float* v357 = (v356);
    float v358 = v357[0];
    float v359 = v358 * v204;
    float v360 = v353 + v359;
    int v361 = v245 + i2_020;
    long v362 = v361;
    local float* v363 = (&(&_ZN5Eigen1sE)[0][v362]);
    local float* v364 = (v363);
    float v365 = v364[0];
    float v366 = v365 * v205;
    float v367 = v360 + v366;
    int v368 = v361 + 1;
    long v369 = v368;
    local float* v370 = (&(&_ZN5Eigen1sE)[0][v369]);
    local float* v371 = (v370);
    float v372 = v371[0];
    float v373 = v372 * v206;
    float v374 = v367 + v373;
    int v375 = v361 + 2;
    long v376 = v375;
    local float* v377 = (&(&_ZN5Eigen1sE)[0][v376]);
    local float* v378 = (v377);
    float v379 = v378[0];
    float v380 = v379 * v207;
    float v381 = v374 + v380;
    int v382 = v361 + 3;
    long v383 = v382;
    local float* v384 = (&(&_ZN5Eigen1sE)[0][v383]);
    local float* v385 = (v384);
    float v386 = v385[0];
    float v387 = v386 * v208;
    float v388 = v381 + v387;
    int v389 = v247 + i2_020;
    long v390 = v389;
    local float* v391 = (&(&_ZN5Eigen1sE)[0][v390]);
    local float* v392 = (v391);
    float v393 = v392[0];
    float v394 = v393 * v209;
    float v395 = v388 + v394;
    int v396 = v389 + 1;
    long v397 = v396;
    local float* v398 = (&(&_ZN5Eigen1sE)[0][v397]);
    local float* v399 = (v398);
    float v400 = v399[0];
    float v401 = v400 * v210;
    float v402 = v395 + v401;
    int v403 = v389 + 2;
    long v404 = v403;
    local float* v405 = (&(&_ZN5Eigen1sE)[0][v404]);
    local float* v406 = (v405);
    float v407 = v406[0];
    float v408 = v407 * v211;
    float v409 = v402 + v408;
    int v410 = v389 + 3;
    long v411 = v410;
    local float* v412 = (&(&_ZN5Eigen1sE)[0][v411]);
    local float* v413 = (v412);
    float v414 = v413[0];
    float v415 = v414 * v212;
    float v416 = v409 + v415;
    int v417 = v236 + i2_020;
    long v418 = v417;
    local float* v419 = (&(&_ZN5Eigen1sE)[0][v418]);
    local float* v420 = (v419);
    float v421 = v420[0];
    float v422 = v421 * v213;
    float v423 = v416 + v422;
    int v424 = v417 + 1;
    long v425 = v424;
    local float* v426 = (&(&_ZN5Eigen1sE)[0][v425]);
    local float* v427 = (v426);
    float v428 = v427[0];
    float v429 = v428 * v214;
    float v430 = v423 + v429;
    int v431 = v417 + 2;
    long v432 = v431;
    local float* v433 = (&(&_ZN5Eigen1sE)[0][v432]);
    local float* v434 = (v433);
    float v435 = v434[0];
    float v436 = v435 * v215;
    float v437 = v430 + v436;
    int v438 = v417 + 3;
    long v439 = v438;
    local float* v440 = (&(&_ZN5Eigen1sE)[0][v439]);
    local float* v441 = (v440);
    float v442 = v441[0];
    float v443 = v442 * v216;
    float v444 = v437 + v443;
    int v445 = i2_020 + v2;
    long v446 = v445;
    long v447 = v42 * v446;
    long v448 = v185 + v447;
    long v449 = v448 + v234;
    long sext5 = v449 << 32;
    long v450 = sext5 >> 32;
    global float* v451 = (&buffer[v450]);
    v451[0] = v444;
    int v453 = v188 + i2_020;
    bool v454 = v453 > v6;
    if(v454) {
        goto v__crit_edge21;
    } else {
        i2_020 = v453;
        goto v_preheader;
    }
    v__crit_edge21:;
    int v456 = v184 + j1_022;
    bool v457 = v456 > v14;
    if(v457) {
        goto label225;
    } else {
        j1_022 = v456;
        goto v_preheader_lr_ph;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_30* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_022;
    int i2_022_us;
    int i_010_us;
    int j1_025;
    int j_011;
    int j_011_us;
    int l_019_us;
    int p_030;
    float result_018_us;
    float v_lcssa;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 4;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + kernelSizeY;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph32;
    } else {
        goto v__crit_edge33;
    }
    v_lr_ph32:;
    global long* v25 = (&indexMapper[0].f2.f0[3]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[3]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[2]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[3]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[3]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    bool v41 = kernelSizeY > 0;
    global long* v42 = (&indexMapper[0].f1.f0[0]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f1.f0[1]);
    long v45 = v44[0];
    global long* v46 = (&indexMapper[0].f0.f0[0]);
    long v47 = v46[0];
    global long* v48 = (&indexMapper[0].f0.f0[1]);
    long v49 = v48[0];
    global float*global * v50 = (&eval[0].f0);
    global float* v51 = v50[0];
        p_030 = v22;
    goto v53;
    label54:;
        goto v__crit_edge33;
    v__crit_edge33:;
    v53:;
    long v57 = p_030;
    long v58 = v57 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v60 = v58 * v26;
    long v61 = v57 - v60;
    long v62 = v30 * v61;
    long v63 = v28 * v58;
    int v64 = get_global_id(0);
    bool v65 = v64 < v7;
    int v66 = get_local_size(1);
    long v67 = v62 + v63;
    if(v65) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v70 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v72 = j_011_us + v31;
    int v73 = v72 * v7;
    int v74 = j_011_us + v9;
    long v75 = v74;
    long v76 = v49 * v75;
        i_010_us = v64;
    goto v78;
    v78:;
    int v79 = i_010_us + v2;
    long v80 = v79;
    long v81 = v47 * v80;
    long v82 = v67 + v81;
    long v83 = v82 + v76;
    long sext7_us = v83 << 32;
    long v84 = sext7_us >> 32;
    global float* v85 = (&v51[v84]);
    global int* v86 = ((global int*)v85);
    int v_val_i8_us = v86[0];
    int v87 = i_010_us + v73;
    long v88 = v87;
    local float* v89 = (&(&_ZN5Eigen1sE)[0][v88]);
    local int* v90 = ((local int*)v89);
    local int* v91 = (v90);
    v91[0] = v_val_i8_us;
    int v93 = v70 + i_010_us;
    bool v94 = v93 < v7;
    if(v94) {
        i_010_us = v93;
        goto v78;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v96 = v66 + j_011_us;
    bool v97 = v96 < v15;
    if(v97) {
        j_011_us = v96;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label100:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v103 = v57 / v35;
    if(v40) {
        goto v__crit_edge29;
    } else {
        goto v_lr_ph28;
    }
    v_lr_ph28:;
    long v105 = v103 * v35;
    long v106 = v57 - v105;
    long v107 = v39 * v106;
    long v108 = v37 * v103;
    int v109 = get_global_id(0);
    bool v110 = v109 > v6;
    int v111 = get_local_size(1);
    long v112 = v107 + v108;
        j1_025 = v32;
    goto v114;
    v_lr_ph14_split:;
    int v115 = v66 + j_011;
    bool v116 = v115 < v15;
    if(v116) {
        j_011 = v115;
        goto v_lr_ph14_split;
    } else {
        goto label100;
    }
    label118:;
        goto v__crit_edge29;
    v__crit_edge29:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v121 = p_030 + v20;
    bool v122 = v121 < numPlanes;
    if(v122) {
        p_030 = v121;
        goto v53;
    } else {
        goto label54;
    }
    v114:;
    if(v110) {
        goto v__crit_edge24;
    } else {
        goto v_preheader_lr_ph;
    }
    v_preheader_lr_ph:;
    int v125 = j1_025 + v9;
    long v126 = v125;
    long v127 = v45 * v126;
    int v128 = get_local_size(0);
    int v129 = j1_025 + v31;
    if(v41) {
        goto v_lr_ph20_us_preheader;
    } else {
        goto v_preheader_preheader;
    }
    v_preheader_preheader:;
        i2_022 = v109;
    goto v_preheader;
    v_lr_ph20_us_preheader:;
        i2_022_us = v109;
    goto v_lr_ph20_us;
    label133:;
    int v134 = l_019_us * kernelSizeX;
    int v135 = v129 + l_019_us;
    int v136 = v135 * v7;
    int v137 = v136 + i2_022_us;
    long v138 = v137;
    local float* v139 = (&(&_ZN5Eigen1sE)[0][v138]);
    local float* v140 = (v139);
    float v141 = v140[0];
    long v142 = v134;
    global float* v143 = (&_kernel[v142]);
    float v144 = v143[0];
    float v145 = v141 * v144;
    float v146 = result_018_us + v145;
    int v147 = v137 + 1;
    long v148 = v147;
    local float* v149 = (&(&_ZN5Eigen1sE)[0][v148]);
    local float* v150 = (v149);
    float v151 = v150[0];
    int v152 = v134 + 1;
    long v153 = v152;
    global float* v154 = (&_kernel[v153]);
    float v155 = v154[0];
    float v156 = v151 * v155;
    float v157 = v146 + v156;
    int v158 = v137 + 2;
    long v159 = v158;
    local float* v160 = (&(&_ZN5Eigen1sE)[0][v159]);
    local float* v161 = (v160);
    float v162 = v161[0];
    int v163 = v134 + 2;
    long v164 = v163;
    global float* v165 = (&_kernel[v164]);
    float v166 = v165[0];
    float v167 = v162 * v166;
    float v168 = v157 + v167;
    int v169 = v137 + 3;
    long v170 = v169;
    local float* v171 = (&(&_ZN5Eigen1sE)[0][v170]);
    local float* v172 = (v171);
    float v173 = v172[0];
    int v174 = v134 + 3;
    long v175 = v174;
    global float* v176 = (&_kernel[v175]);
    float v177 = v176[0];
    float v178 = v173 * v177;
    float v179 = v168 + v178;
    int v180 = l_019_us + 1;
    bool exitcond36 = v180 == kernelSizeY;
    if(exitcond36) {
        v_lcssa = v179;
        goto v__crit_edge21_us;
    } else {
        l_019_us = v180;
result_018_us = v179;
        goto label133;
    }
    v_lr_ph20_us:;
        l_019_us = 0;
result_018_us = 0.0f;
    goto label133;
    v__crit_edge21_us:;
    int v183 = i2_022_us + v2;
    long v184 = v183;
    long v185 = v43 * v184;
    long v186 = v112 + v185;
    long v187 = v186 + v127;
    long sext5_us = v187 << 32;
    long v188 = sext5_us >> 32;
    global float* v189 = (&buffer[v188]);
    v189[0] = v_lcssa;
    int v191 = v128 + i2_022_us;
    bool v192 = v191 > v6;
    if(v192) {
        goto v__crit_edge24_loopexit;
    } else {
        i2_022_us = v191;
        goto v_lr_ph20_us;
    }
    v__crit_edge24_loopexit:;
        goto v__crit_edge24;
    label195:;
        goto v__crit_edge24;
    v__crit_edge24:;
    int v197 = v111 + j1_025;
    bool v198 = v197 > v14;
    if(v198) {
        goto label118;
    } else {
        j1_025 = v197;
        goto v114;
    }
    v_preheader:;
    int v200 = i2_022 + v2;
    long v201 = v200;
    long v202 = v43 * v201;
    long v203 = v112 + v202;
    long v204 = v203 + v127;
    long sext5 = v204 << 32;
    long v205 = sext5 >> 32;
    global float* v206 = (&buffer[v205]);
    v206[0] = 0.0f;
    int v208 = v128 + i2_022;
    bool v209 = v208 > v6;
    if(v209) {
        goto label195;
    } else {
        i2_022 = v208;
        goto v_preheader;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_30* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_020;
    int i_010_us;
    int j1_022;
    int j1_022_us;
    int j_011;
    int j_011_us;
    int p_027;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 7;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + 4;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph29;
    } else {
        goto v__crit_edge30;
    }
    v_lr_ph29:;
    global long* v25 = (&indexMapper[0].f2.f0[3]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[3]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[2]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[3]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[3]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    global long* v41 = (&indexMapper[0].f1.f0[0]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f1.f0[1]);
    long v44 = v43[0];
    global long* v45 = (&indexMapper[0].f0.f0[0]);
    long v46 = v45[0];
    global long* v47 = (&indexMapper[0].f0.f0[1]);
    long v48 = v47[0];
    global float*global * v49 = (&eval[0].f0);
    global float* v50 = v49[0];
    global float* v51 = (&_kernel[1]);
    global float* v52 = (&_kernel[2]);
    global float* v53 = (&_kernel[3]);
    global float* v54 = (&_kernel[4]);
    global float* v55 = (&_kernel[5]);
    global float* v56 = (&_kernel[6]);
    long v57 = kernelSizeX;
    global float* v58 = (&_kernel[v57]);
    int v59 = kernelSizeX + 1;
    long v60 = v59;
    global float* v61 = (&_kernel[v60]);
    int v62 = kernelSizeX + 2;
    long v63 = v62;
    global float* v64 = (&_kernel[v63]);
    int v65 = kernelSizeX + 3;
    long v66 = v65;
    global float* v67 = (&_kernel[v66]);
    int v68 = kernelSizeX + 4;
    long v69 = v68;
    global float* v70 = (&_kernel[v69]);
    int v71 = kernelSizeX + 5;
    long v72 = v71;
    global float* v73 = (&_kernel[v72]);
    int v74 = kernelSizeX + 6;
    long v75 = v74;
    global float* v76 = (&_kernel[v75]);
    int v77 = kernelSizeX << 1;
    long v78 = v77;
    global float* v79 = (&_kernel[v78]);
    int v80 = v77 | 1;
    long v81 = v80;
    global float* v82 = (&_kernel[v81]);
    int v83 = v77 + 2;
    long v84 = v83;
    global float* v85 = (&_kernel[v84]);
    int v86 = v77 + 3;
    long v87 = v86;
    global float* v88 = (&_kernel[v87]);
    int v89 = v77 + 4;
    long v90 = v89;
    global float* v91 = (&_kernel[v90]);
    int v92 = v77 + 5;
    long v93 = v92;
    global float* v94 = (&_kernel[v93]);
    int v95 = v77 + 6;
    long v96 = v95;
    global float* v97 = (&_kernel[v96]);
    int v98 = kernelSizeX * 3;
    long v99 = v98;
    global float* v100 = (&_kernel[v99]);
    int v101 = v98 + 1;
    long v102 = v101;
    global float* v103 = (&_kernel[v102]);
    int v104 = v98 + 2;
    long v105 = v104;
    global float* v106 = (&_kernel[v105]);
    int v107 = v98 + 3;
    long v108 = v107;
    global float* v109 = (&_kernel[v108]);
    int v110 = v98 + 4;
    long v111 = v110;
    global float* v112 = (&_kernel[v111]);
    int v113 = v98 + 5;
    long v114 = v113;
    global float* v115 = (&_kernel[v114]);
    int v116 = v98 + 6;
    long v117 = v116;
    global float* v118 = (&_kernel[v117]);
        p_027 = v22;
    goto v120;
    label121:;
        goto v__crit_edge30;
    v__crit_edge30:;
    v120:;
    long v124 = p_027;
    long v125 = v124 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v127 = v125 * v26;
    long v128 = v124 - v127;
    long v129 = v30 * v128;
    long v130 = v28 * v125;
    int v131 = get_global_id(0);
    bool v132 = v131 < v7;
    int v133 = get_local_size(1);
    long v134 = v129 + v130;
    if(v132) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v137 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v139 = j_011_us + v31;
    int v140 = v139 * v7;
    int v141 = j_011_us + v9;
    long v142 = v141;
    long v143 = v48 * v142;
        i_010_us = v131;
    goto v145;
    v145:;
    int v146 = i_010_us + v2;
    long v147 = v146;
    long v148 = v46 * v147;
    long v149 = v134 + v148;
    long v150 = v149 + v143;
    long sext7_us = v150 << 32;
    long v151 = sext7_us >> 32;
    global float* v152 = (&v50[v151]);
    global int* v153 = ((global int*)v152);
    int v_val_i8_us = v153[0];
    int v154 = i_010_us + v140;
    long v155 = v154;
    local float* v156 = (&(&_ZN5Eigen1sE)[0][v155]);
    local int* v157 = ((local int*)v156);
    local int* v158 = (v157);
    v158[0] = v_val_i8_us;
    int v160 = v137 + i_010_us;
    bool v161 = v160 < v7;
    if(v161) {
        i_010_us = v160;
        goto v145;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v163 = v133 + j_011_us;
    bool v164 = v163 < v15;
    if(v164) {
        j_011_us = v163;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label167:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v170 = v124 / v35;
    if(v40) {
        goto v__crit_edge26;
    } else {
        goto v_lr_ph25;
    }
    v_lr_ph25:;
    long v172 = v170 * v35;
    long v173 = v124 - v172;
    long v174 = v39 * v173;
    long v175 = v37 * v170;
    int v176 = get_global_id(0);
    bool v177 = v176 > v6;
    int v178 = get_local_size(1);
    long v179 = v174 + v175;
    if(v177) {
        goto v_lr_ph25_split_us_preheader;
    } else {
        goto v_preheader_lr_ph_preheader;
    }
    v_lr_ph25_split_us_preheader:;
        j1_022_us = v32;
    goto v_lr_ph25_split_us;
    v_preheader_lr_ph_preheader:;
    int v182 = get_local_size(0);
    float v183 = _kernel[0];
    float v184 = v51[0];
    float v185 = v52[0];
    float v186 = v53[0];
    float v187 = v54[0];
    float v188 = v55[0];
    float v189 = v56[0];
    float v190 = v58[0];
    float v191 = v61[0];
    float v192 = v64[0];
    float v193 = v67[0];
    float v194 = v70[0];
    float v195 = v73[0];
    float v196 = v76[0];
    float v197 = v79[0];
    float v198 = v82[0];
    float v199 = v85[0];
    float v200 = v88[0];
    float v201 = v91[0];
    float v202 = v94[0];
    float v203 = v97[0];
    float v204 = v100[0];
    float v205 = v103[0];
    float v206 = v106[0];
    float v207 = v109[0];
    float v208 = v112[0];
    float v209 = v115[0];
    float v210 = v118[0];
        j1_022 = v32;
    goto v_preheader_lr_ph;
    v_lr_ph25_split_us:;
    int v212 = v178 + j1_022_us;
    bool v213 = v212 > v14;
    if(v213) {
        goto v__crit_edge26_loopexit;
    } else {
        j1_022_us = v212;
        goto v_lr_ph25_split_us;
    }
    v_lr_ph14_split:;
    int v215 = v133 + j_011;
    bool v216 = v215 < v15;
    if(v216) {
        j_011 = v215;
        goto v_lr_ph14_split;
    } else {
        goto label167;
    }
    v__crit_edge26_loopexit:;
        goto v__crit_edge26;
    label219:;
        goto v__crit_edge26;
    v__crit_edge26:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v222 = p_027 + v20;
    bool v223 = v222 < numPlanes;
    if(v223) {
        p_027 = v222;
        goto v120;
    } else {
        goto label121;
    }
    v_preheader_lr_ph:;
    int v225 = j1_022 + v31;
    int v226 = j1_022 + v9;
    long v227 = v226;
    long v228 = v44 * v227;
    int v229 = v225 + 3;
    int v230 = v229 * v7;
    int v231 = v225 * v7;
    int v232 = v225 + 1;
    int v233 = v232 * v7;
    int v234 = v225 + 2;
    int v235 = v234 * v7;
        i2_020 = v176;
    goto v_preheader;
    v_preheader:;
    int v237 = v231 + i2_020;
    long v238 = v237;
    local float* v239 = (&(&_ZN5Eigen1sE)[0][v238]);
    local float* v240 = (v239);
    float v241 = v240[0];
    float v242 = v241 * v183;
    float v243 = v242 + 0.0f;
    int v244 = v237 + 1;
    long v245 = v244;
    local float* v246 = (&(&_ZN5Eigen1sE)[0][v245]);
    local float* v247 = (v246);
    float v248 = v247[0];
    float v249 = v248 * v184;
    float v250 = v243 + v249;
    int v251 = v237 + 2;
    long v252 = v251;
    local float* v253 = (&(&_ZN5Eigen1sE)[0][v252]);
    local float* v254 = (v253);
    float v255 = v254[0];
    float v256 = v255 * v185;
    float v257 = v250 + v256;
    int v258 = v237 + 3;
    long v259 = v258;
    local float* v260 = (&(&_ZN5Eigen1sE)[0][v259]);
    local float* v261 = (v260);
    float v262 = v261[0];
    float v263 = v262 * v186;
    float v264 = v257 + v263;
    int v265 = v237 + 4;
    long v266 = v265;
    local float* v267 = (&(&_ZN5Eigen1sE)[0][v266]);
    local float* v268 = (v267);
    float v269 = v268[0];
    float v270 = v269 * v187;
    float v271 = v264 + v270;
    int v272 = v237 + 5;
    long v273 = v272;
    local float* v274 = (&(&_ZN5Eigen1sE)[0][v273]);
    local float* v275 = (v274);
    float v276 = v275[0];
    float v277 = v276 * v188;
    float v278 = v271 + v277;
    int v279 = v237 + 6;
    long v280 = v279;
    local float* v281 = (&(&_ZN5Eigen1sE)[0][v280]);
    local float* v282 = (v281);
    float v283 = v282[0];
    float v284 = v283 * v189;
    float v285 = v278 + v284;
    int v286 = v233 + i2_020;
    long v287 = v286;
    local float* v288 = (&(&_ZN5Eigen1sE)[0][v287]);
    local float* v289 = (v288);
    float v290 = v289[0];
    float v291 = v290 * v190;
    float v292 = v285 + v291;
    int v293 = v286 + 1;
    long v294 = v293;
    local float* v295 = (&(&_ZN5Eigen1sE)[0][v294]);
    local float* v296 = (v295);
    float v297 = v296[0];
    float v298 = v297 * v191;
    float v299 = v292 + v298;
    int v300 = v286 + 2;
    long v301 = v300;
    local float* v302 = (&(&_ZN5Eigen1sE)[0][v301]);
    local float* v303 = (v302);
    float v304 = v303[0];
    float v305 = v304 * v192;
    float v306 = v299 + v305;
    int v307 = v286 + 3;
    long v308 = v307;
    local float* v309 = (&(&_ZN5Eigen1sE)[0][v308]);
    local float* v310 = (v309);
    float v311 = v310[0];
    float v312 = v311 * v193;
    float v313 = v306 + v312;
    int v314 = v286 + 4;
    long v315 = v314;
    local float* v316 = (&(&_ZN5Eigen1sE)[0][v315]);
    local float* v317 = (v316);
    float v318 = v317[0];
    float v319 = v318 * v194;
    float v320 = v313 + v319;
    int v321 = v286 + 5;
    long v322 = v321;
    local float* v323 = (&(&_ZN5Eigen1sE)[0][v322]);
    local float* v324 = (v323);
    float v325 = v324[0];
    float v326 = v325 * v195;
    float v327 = v320 + v326;
    int v328 = v286 + 6;
    long v329 = v328;
    local float* v330 = (&(&_ZN5Eigen1sE)[0][v329]);
    local float* v331 = (v330);
    float v332 = v331[0];
    float v333 = v332 * v196;
    float v334 = v327 + v333;
    int v335 = v235 + i2_020;
    long v336 = v335;
    local float* v337 = (&(&_ZN5Eigen1sE)[0][v336]);
    local float* v338 = (v337);
    float v339 = v338[0];
    float v340 = v339 * v197;
    float v341 = v334 + v340;
    int v342 = v335 + 1;
    long v343 = v342;
    local float* v344 = (&(&_ZN5Eigen1sE)[0][v343]);
    local float* v345 = (v344);
    float v346 = v345[0];
    float v347 = v346 * v198;
    float v348 = v341 + v347;
    int v349 = v335 + 2;
    long v350 = v349;
    local float* v351 = (&(&_ZN5Eigen1sE)[0][v350]);
    local float* v352 = (v351);
    float v353 = v352[0];
    float v354 = v353 * v199;
    float v355 = v348 + v354;
    int v356 = v335 + 3;
    long v357 = v356;
    local float* v358 = (&(&_ZN5Eigen1sE)[0][v357]);
    local float* v359 = (v358);
    float v360 = v359[0];
    float v361 = v360 * v200;
    float v362 = v355 + v361;
    int v363 = v335 + 4;
    long v364 = v363;
    local float* v365 = (&(&_ZN5Eigen1sE)[0][v364]);
    local float* v366 = (v365);
    float v367 = v366[0];
    float v368 = v367 * v201;
    float v369 = v362 + v368;
    int v370 = v335 + 5;
    long v371 = v370;
    local float* v372 = (&(&_ZN5Eigen1sE)[0][v371]);
    local float* v373 = (v372);
    float v374 = v373[0];
    float v375 = v374 * v202;
    float v376 = v369 + v375;
    int v377 = v335 + 6;
    long v378 = v377;
    local float* v379 = (&(&_ZN5Eigen1sE)[0][v378]);
    local float* v380 = (v379);
    float v381 = v380[0];
    float v382 = v381 * v203;
    float v383 = v376 + v382;
    int v384 = v230 + i2_020;
    long v385 = v384;
    local float* v386 = (&(&_ZN5Eigen1sE)[0][v385]);
    local float* v387 = (v386);
    float v388 = v387[0];
    float v389 = v388 * v204;
    float v390 = v383 + v389;
    int v391 = v384 + 1;
    long v392 = v391;
    local float* v393 = (&(&_ZN5Eigen1sE)[0][v392]);
    local float* v394 = (v393);
    float v395 = v394[0];
    float v396 = v395 * v205;
    float v397 = v390 + v396;
    int v398 = v384 + 2;
    long v399 = v398;
    local float* v400 = (&(&_ZN5Eigen1sE)[0][v399]);
    local float* v401 = (v400);
    float v402 = v401[0];
    float v403 = v402 * v206;
    float v404 = v397 + v403;
    int v405 = v384 + 3;
    long v406 = v405;
    local float* v407 = (&(&_ZN5Eigen1sE)[0][v406]);
    local float* v408 = (v407);
    float v409 = v408[0];
    float v410 = v409 * v207;
    float v411 = v404 + v410;
    int v412 = v384 + 4;
    long v413 = v412;
    local float* v414 = (&(&_ZN5Eigen1sE)[0][v413]);
    local float* v415 = (v414);
    float v416 = v415[0];
    float v417 = v416 * v208;
    float v418 = v411 + v417;
    int v419 = v384 + 5;
    long v420 = v419;
    local float* v421 = (&(&_ZN5Eigen1sE)[0][v420]);
    local float* v422 = (v421);
    float v423 = v422[0];
    float v424 = v423 * v209;
    float v425 = v418 + v424;
    int v426 = v384 + 6;
    long v427 = v426;
    local float* v428 = (&(&_ZN5Eigen1sE)[0][v427]);
    local float* v429 = (v428);
    float v430 = v429[0];
    float v431 = v430 * v210;
    float v432 = v425 + v431;
    int v433 = i2_020 + v2;
    long v434 = v433;
    long v435 = v42 * v434;
    long v436 = v179 + v435;
    long v437 = v436 + v228;
    long sext5 = v437 << 32;
    long v438 = sext5 >> 32;
    global float* v439 = (&buffer[v438]);
    v439[0] = v432;
    int v441 = v182 + i2_020;
    bool v442 = v441 > v6;
    if(v442) {
        goto v__crit_edge21;
    } else {
        i2_020 = v441;
        goto v_preheader;
    }
    v__crit_edge21:;
    int v444 = v178 + j1_022;
    bool v445 = v444 > v14;
    if(v445) {
        goto label219;
    } else {
        j1_022 = v444;
        goto v_preheader_lr_ph;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_30* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_022;
    int i2_022_us;
    int i_010_us;
    int j1_025;
    int j_011;
    int j_011_us;
    int l_019_us;
    int p_030;
    float result_018_us;
    float v_lcssa;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 7;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + kernelSizeY;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph32;
    } else {
        goto v__crit_edge33;
    }
    v_lr_ph32:;
    global long* v25 = (&indexMapper[0].f2.f0[3]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[3]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[2]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[3]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[3]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    bool v41 = kernelSizeY > 0;
    global long* v42 = (&indexMapper[0].f1.f0[0]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f1.f0[1]);
    long v45 = v44[0];
    global long* v46 = (&indexMapper[0].f0.f0[0]);
    long v47 = v46[0];
    global long* v48 = (&indexMapper[0].f0.f0[1]);
    long v49 = v48[0];
    global float*global * v50 = (&eval[0].f0);
    global float* v51 = v50[0];
        p_030 = v22;
    goto v53;
    label54:;
        goto v__crit_edge33;
    v__crit_edge33:;
    v53:;
    long v57 = p_030;
    long v58 = v57 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v60 = v58 * v26;
    long v61 = v57 - v60;
    long v62 = v30 * v61;
    long v63 = v28 * v58;
    int v64 = get_global_id(0);
    bool v65 = v64 < v7;
    int v66 = get_local_size(1);
    long v67 = v62 + v63;
    if(v65) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v70 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v72 = j_011_us + v31;
    int v73 = v72 * v7;
    int v74 = j_011_us + v9;
    long v75 = v74;
    long v76 = v49 * v75;
        i_010_us = v64;
    goto v78;
    v78:;
    int v79 = i_010_us + v2;
    long v80 = v79;
    long v81 = v47 * v80;
    long v82 = v67 + v81;
    long v83 = v82 + v76;
    long sext7_us = v83 << 32;
    long v84 = sext7_us >> 32;
    global float* v85 = (&v51[v84]);
    global int* v86 = ((global int*)v85);
    int v_val_i8_us = v86[0];
    int v87 = i_010_us + v73;
    long v88 = v87;
    local float* v89 = (&(&_ZN5Eigen1sE)[0][v88]);
    local int* v90 = ((local int*)v89);
    local int* v91 = (v90);
    v91[0] = v_val_i8_us;
    int v93 = v70 + i_010_us;
    bool v94 = v93 < v7;
    if(v94) {
        i_010_us = v93;
        goto v78;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v96 = v66 + j_011_us;
    bool v97 = v96 < v15;
    if(v97) {
        j_011_us = v96;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label100:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v103 = v57 / v35;
    if(v40) {
        goto v__crit_edge29;
    } else {
        goto v_lr_ph28;
    }
    v_lr_ph28:;
    long v105 = v103 * v35;
    long v106 = v57 - v105;
    long v107 = v39 * v106;
    long v108 = v37 * v103;
    int v109 = get_global_id(0);
    bool v110 = v109 > v6;
    int v111 = get_local_size(1);
    long v112 = v107 + v108;
        j1_025 = v32;
    goto v114;
    v_lr_ph14_split:;
    int v115 = v66 + j_011;
    bool v116 = v115 < v15;
    if(v116) {
        j_011 = v115;
        goto v_lr_ph14_split;
    } else {
        goto label100;
    }
    label118:;
        goto v__crit_edge29;
    v__crit_edge29:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v121 = p_030 + v20;
    bool v122 = v121 < numPlanes;
    if(v122) {
        p_030 = v121;
        goto v53;
    } else {
        goto label54;
    }
    v114:;
    if(v110) {
        goto v__crit_edge24;
    } else {
        goto v_preheader_lr_ph;
    }
    v_preheader_lr_ph:;
    int v125 = j1_025 + v9;
    long v126 = v125;
    long v127 = v45 * v126;
    int v128 = get_local_size(0);
    int v129 = j1_025 + v31;
    if(v41) {
        goto v_lr_ph20_us_preheader;
    } else {
        goto v_preheader_preheader;
    }
    v_preheader_preheader:;
        i2_022 = v109;
    goto v_preheader;
    v_lr_ph20_us_preheader:;
        i2_022_us = v109;
    goto v_lr_ph20_us;
    label133:;
    int v134 = l_019_us * kernelSizeX;
    int v135 = v129 + l_019_us;
    int v136 = v135 * v7;
    int v137 = v136 + i2_022_us;
    long v138 = v137;
    local float* v139 = (&(&_ZN5Eigen1sE)[0][v138]);
    local float* v140 = (v139);
    float v141 = v140[0];
    long v142 = v134;
    global float* v143 = (&_kernel[v142]);
    float v144 = v143[0];
    float v145 = v141 * v144;
    float v146 = result_018_us + v145;
    int v147 = v137 + 1;
    long v148 = v147;
    local float* v149 = (&(&_ZN5Eigen1sE)[0][v148]);
    local float* v150 = (v149);
    float v151 = v150[0];
    int v152 = v134 + 1;
    long v153 = v152;
    global float* v154 = (&_kernel[v153]);
    float v155 = v154[0];
    float v156 = v151 * v155;
    float v157 = v146 + v156;
    int v158 = v137 + 2;
    long v159 = v158;
    local float* v160 = (&(&_ZN5Eigen1sE)[0][v159]);
    local float* v161 = (v160);
    float v162 = v161[0];
    int v163 = v134 + 2;
    long v164 = v163;
    global float* v165 = (&_kernel[v164]);
    float v166 = v165[0];
    float v167 = v162 * v166;
    float v168 = v157 + v167;
    int v169 = v137 + 3;
    long v170 = v169;
    local float* v171 = (&(&_ZN5Eigen1sE)[0][v170]);
    local float* v172 = (v171);
    float v173 = v172[0];
    int v174 = v134 + 3;
    long v175 = v174;
    global float* v176 = (&_kernel[v175]);
    float v177 = v176[0];
    float v178 = v173 * v177;
    float v179 = v168 + v178;
    int v180 = v137 + 4;
    long v181 = v180;
    local float* v182 = (&(&_ZN5Eigen1sE)[0][v181]);
    local float* v183 = (v182);
    float v184 = v183[0];
    int v185 = v134 + 4;
    long v186 = v185;
    global float* v187 = (&_kernel[v186]);
    float v188 = v187[0];
    float v189 = v184 * v188;
    float v190 = v179 + v189;
    int v191 = v137 + 5;
    long v192 = v191;
    local float* v193 = (&(&_ZN5Eigen1sE)[0][v192]);
    local float* v194 = (v193);
    float v195 = v194[0];
    int v196 = v134 + 5;
    long v197 = v196;
    global float* v198 = (&_kernel[v197]);
    float v199 = v198[0];
    float v200 = v195 * v199;
    float v201 = v190 + v200;
    int v202 = v137 + 6;
    long v203 = v202;
    local float* v204 = (&(&_ZN5Eigen1sE)[0][v203]);
    local float* v205 = (v204);
    float v206 = v205[0];
    int v207 = v134 + 6;
    long v208 = v207;
    global float* v209 = (&_kernel[v208]);
    float v210 = v209[0];
    float v211 = v206 * v210;
    float v212 = v201 + v211;
    int v213 = l_019_us + 1;
    bool exitcond36 = v213 == kernelSizeY;
    if(exitcond36) {
        v_lcssa = v212;
        goto v__crit_edge21_us;
    } else {
        l_019_us = v213;
result_018_us = v212;
        goto label133;
    }
    v_lr_ph20_us:;
        l_019_us = 0;
result_018_us = 0.0f;
    goto label133;
    v__crit_edge21_us:;
    int v216 = i2_022_us + v2;
    long v217 = v216;
    long v218 = v43 * v217;
    long v219 = v112 + v218;
    long v220 = v219 + v127;
    long sext5_us = v220 << 32;
    long v221 = sext5_us >> 32;
    global float* v222 = (&buffer[v221]);
    v222[0] = v_lcssa;
    int v224 = v128 + i2_022_us;
    bool v225 = v224 > v6;
    if(v225) {
        goto v__crit_edge24_loopexit;
    } else {
        i2_022_us = v224;
        goto v_lr_ph20_us;
    }
    v__crit_edge24_loopexit:;
        goto v__crit_edge24;
    label228:;
        goto v__crit_edge24;
    v__crit_edge24:;
    int v230 = v111 + j1_025;
    bool v231 = v230 > v14;
    if(v231) {
        goto label118;
    } else {
        j1_025 = v230;
        goto v114;
    }
    v_preheader:;
    int v233 = i2_022 + v2;
    long v234 = v233;
    long v235 = v43 * v234;
    long v236 = v112 + v235;
    long v237 = v236 + v127;
    long sext5 = v237 << 32;
    long v238 = sext5 >> 32;
    global float* v239 = (&buffer[v238]);
    v239[0] = 0.0f;
    int v241 = v128 + i2_022;
    bool v242 = v241 > v6;
    if(v242) {
        goto label228;
    } else {
        i2_022 = v241;
        goto v_preheader;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_30* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_026;
    int i2_026_us;
    int i_010_us;
    int j1_029;
    int j_011;
    int j_011_us;
    int k_017_us_us;
    int k_017_us_us_unr;
    int l_022_us_us;
    int p_034;
    float result_021_us_us;
    float result_116_us_us;
    float result_116_us_us_unr;
    float split25_us;
    float v_lcssa;
    float v_lcssa63;
    float v_lcssa_lcssa;
    float v_lcssa_unr;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + kernelSizeX;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + kernelSizeY;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph36;
    } else {
        goto v__crit_edge37;
    }
    v_lr_ph36:;
    global long* v25 = (&indexMapper[0].f2.f0[3]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[3]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[2]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[3]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[3]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    bool v41 = kernelSizeY > 0;
    global long* v42 = (&indexMapper[0].f1.f0[0]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f1.f0[1]);
    long v45 = v44[0];
    bool v46 = kernelSizeX > 0;
    global long* v47 = (&indexMapper[0].f0.f0[0]);
    long v48 = v47[0];
    global long* v49 = (&indexMapper[0].f0.f0[1]);
    long v50 = v49[0];
    global float*global * v51 = (&eval[0].f0);
    global float* v52 = v51[0];
    int xtraiter = kernelSizeX & 1;
    bool lcmp_mod = xtraiter == 0;
    bool v53 = kernelSizeX == 1;
        p_034 = v22;
    goto v55;
    label56:;
        goto v__crit_edge37;
    v__crit_edge37:;
    v55:;
    long v59 = p_034;
    long v60 = v59 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v62 = v60 * v26;
    long v63 = v59 - v62;
    long v64 = v30 * v63;
    long v65 = v28 * v60;
    int v66 = get_global_id(0);
    bool v67 = v66 < v7;
    int v68 = get_local_size(1);
    long v69 = v64 + v65;
    if(v67) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v72 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v74 = j_011_us + v31;
    int v75 = v74 * v7;
    int v76 = j_011_us + v9;
    long v77 = v76;
    long v78 = v50 * v77;
        i_010_us = v66;
    goto v80;
    v80:;
    int v81 = i_010_us + v2;
    long v82 = v81;
    long v83 = v48 * v82;
    long v84 = v69 + v83;
    long v85 = v84 + v78;
    long sext7_us = v85 << 32;
    long v86 = sext7_us >> 32;
    global float* v87 = (&v52[v86]);
    global int* v88 = ((global int*)v87);
    int v_val_i8_us = v88[0];
    int v89 = i_010_us + v75;
    long v90 = v89;
    local float* v91 = (&(&_ZN5Eigen1sE)[0][v90]);
    local int* v92 = ((local int*)v91);
    local int* v93 = (v92);
    v93[0] = v_val_i8_us;
    int v95 = v72 + i_010_us;
    bool v96 = v95 < v7;
    if(v96) {
        i_010_us = v95;
        goto v80;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v98 = v68 + j_011_us;
    bool v99 = v98 < v15;
    if(v99) {
        j_011_us = v98;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label102:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v105 = v59 / v35;
    if(v40) {
        goto v__crit_edge33;
    } else {
        goto v_lr_ph32;
    }
    v_lr_ph32:;
    long v107 = v105 * v35;
    long v108 = v59 - v107;
    long v109 = v39 * v108;
    long v110 = v37 * v105;
    int v111 = get_global_id(0);
    bool v112 = v111 > v6;
    int v113 = get_local_size(1);
    long v114 = v109 + v110;
        j1_029 = v32;
    goto v116;
    v_lr_ph14_split:;
    int v117 = v68 + j_011;
    bool v118 = v117 < v15;
    if(v118) {
        j_011 = v117;
        goto v_lr_ph14_split;
    } else {
        goto label102;
    }
    label120:;
        goto v__crit_edge33;
    v__crit_edge33:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v123 = p_034 + v20;
    bool v124 = v123 < numPlanes;
    if(v124) {
        p_034 = v123;
        goto v55;
    } else {
        goto label56;
    }
    v116:;
    if(v112) {
        goto v__crit_edge28;
    } else {
        goto v_preheader_lr_ph;
    }
    v_preheader_lr_ph:;
    int v127 = j1_029 + v9;
    long v128 = v127;
    long v129 = v45 * v128;
    int v130 = get_local_size(0);
    int v131 = j1_029 + v31;
    if(v41) {
        goto v_lr_ph23_us_preheader;
    } else {
        goto v_preheader_preheader;
    }
    v_preheader_preheader:;
        i2_026 = v111;
    goto v_preheader;
    v_lr_ph23_us_preheader:;
        i2_026_us = v111;
    goto v_lr_ph23_us;
    v_lr_ph23_us:;
    if(v46) {
        goto v_lr_ph19_us_us_preheader;
    } else {
        split25_us = 0.0f;
        goto v__crit_edge24_us;
    }
    v_lr_ph19_us_us_preheader:;
        l_022_us_us = 0;
result_021_us_us = 0.0f;
    goto v_lr_ph19_us_us;
    label137:;
        split25_us = v_lcssa_lcssa;
    goto v__crit_edge24_us;
    v__crit_edge24_us:;
    int v139 = i2_026_us + v2;
    long v140 = v139;
    long v141 = v43 * v140;
    long v142 = v114 + v141;
    long v143 = v142 + v129;
    long sext5_us = v143 << 32;
    long v144 = sext5_us >> 32;
    global float* v145 = (&buffer[v144]);
    v145[0] = split25_us;
    int v147 = v130 + i2_026_us;
    bool v148 = v147 > v6;
    if(v148) {
        goto v__crit_edge28_loopexit;
    } else {
        i2_026_us = v147;
        goto v_lr_ph23_us;
    }
    v_lr_ph19_us_us:;
    int v150 = l_022_us_us * kernelSizeX;
    int v151 = v131 + l_022_us_us;
    int v152 = v151 * v7;
    int v153 = v152 + i2_026_us;
    if(lcmp_mod) {
        k_017_us_us_unr = 0;
result_116_us_us_unr = result_021_us_us;
        goto v_lr_ph19_us_us_split;
    } else {
        goto v155;
    }
    v155:;
    long v156 = v153;
    local float* v157 = (&(&_ZN5Eigen1sE)[0][v156]);
    local float* v158 = (v157);
    float v159 = v158[0];
    long v160 = v150;
    global float* v161 = (&_kernel[v160]);
    float v162 = v161[0];
    float v163 = v159 * v162;
    float v164 = result_021_us_us + v163;
        k_017_us_us_unr = 1;
result_116_us_us_unr = v164;
v_lcssa_unr = v164;
    goto v_lr_ph19_us_us_split;
    v_lr_ph19_us_us_split:;
    if(v53) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge20_us_us;
    } else {
        goto v_lr_ph19_us_us_split_split_preheader;
    }
    v_lr_ph19_us_us_split_split_preheader:;
        k_017_us_us = k_017_us_us_unr;
result_116_us_us = result_116_us_us_unr;
    goto v_lr_ph19_us_us_split_split;
    label168:;
        v_lcssa = v_lcssa63;
    goto v__crit_edge20_us_us;
    v__crit_edge20_us_us:;
    int v170 = l_022_us_us + 1;
    bool exitcond53 = v170 == kernelSizeY;
    if(exitcond53) {
        v_lcssa_lcssa = v_lcssa;
        goto label137;
    } else {
        l_022_us_us = v170;
result_021_us_us = v_lcssa;
        goto v_lr_ph19_us_us;
    }
    v_lr_ph19_us_us_split_split:;
    int v172 = v153 + k_017_us_us;
    long v173 = v172;
    local float* v174 = (&(&_ZN5Eigen1sE)[0][v173]);
    local float* v175 = (v174);
    float v176 = v175[0];
    int v177 = k_017_us_us + v150;
    long v178 = v177;
    global float* v179 = (&_kernel[v178]);
    float v180 = v179[0];
    float v181 = v176 * v180;
    float v182 = result_116_us_us + v181;
    int v183 = k_017_us_us + 1;
    int v184 = v153 + v183;
    long v185 = v184;
    local float* v186 = (&(&_ZN5Eigen1sE)[0][v185]);
    local float* v187 = (v186);
    float v188 = v187[0];
    int v189 = v183 + v150;
    long v190 = v189;
    global float* v191 = (&_kernel[v190]);
    float v192 = v191[0];
    float v193 = v188 * v192;
    float v194 = v182 + v193;
    int v195 = k_017_us_us + 2;
    bool exitcond52_1 = v195 == kernelSizeX;
    if(exitcond52_1) {
        v_lcssa63 = v194;
        goto label168;
    } else {
        k_017_us_us = v195;
result_116_us_us = v194;
        goto v_lr_ph19_us_us_split_split;
    }
    v__crit_edge28_loopexit:;
        goto v__crit_edge28;
    label198:;
        goto v__crit_edge28;
    v__crit_edge28:;
    int v200 = v113 + j1_029;
    bool v201 = v200 > v14;
    if(v201) {
        goto label120;
    } else {
        j1_029 = v200;
        goto v116;
    }
    v_preheader:;
    int v203 = i2_026 + v2;
    long v204 = v203;
    long v205 = v43 * v204;
    long v206 = v114 + v205;
    long v207 = v206 + v129;
    long sext5 = v207 << 32;
    long v208 = sext5 >> 32;
    global float* v209 = (&buffer[v208]);
    v209[0] = 0.0f;
    int v211 = v130 + i2_026;
    bool v212 = v211 > v6;
    if(v212) {
        goto label198;
    } else {
        i2_026 = v211;
        goto v_preheader;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf(global struct Eigen__TensorEvaluator_25* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_31* indexMapper, global float* _kernel, long numPlanes, long numX, long maxX, long numY, long maxY, long numZ, long maxZ, long kernelSizeX, long kernelSizeY, long kernelSizeZ, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i3_039;
    int i_014_us_us;
    int j2_042;
    int j_015_us56;
    int j_015_us_us;
    int k1_047;
    int k_020;
    int k_020_us;
    int l_026_us_us;
    int l_026_us_us_unr;
    int m_030_us_us;
    int n_035_us;
    int p_052;
    float result_034_us;
    float result_0_lcssa;
    float result_129_us_us;
    float result_225_us_us;
    float result_225_us_us_unr;
    float split33_us;
    float split33_us_lcssa;
    long v175;
    long v182;
    long v208;
    long v69;
    float v_lcssa;
    float v_lcssa88;
    float v_lcssa_lcssa;
    float v_lcssa_unr;
    long v_unr;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    long v2 = v1;
    long v3 = v2 * maxX;
    int v4 = (int)v3;
    long sext = v3 << 32;
    long v5 = sext >> 32;
    long v6 = v5 + maxX;
    bool v7 = v6 < numX;
    long v_numX = v7 ? v6 : numX;
    long v8 = v_numX + 4294967295;
    int v9 = (int)v8;
    int v10 = v9 - v4;
    long v11 = v10;
    long v12 = v11 + kernelSizeX;
    int v13 = (int)v12;
    int v14 = get_group_id(1);
    long v15 = v14;
    long v16 = v15 * maxY;
    int v17 = (int)v16;
    long sext5 = v16 << 32;
    long v18 = sext5 >> 32;
    long v19 = v18 + maxY;
    bool v20 = v19 < numY;
    long v21 = v20 ? v19 : numY;
    long v22 = v21 + 4294967295;
    int v23 = (int)v22;
    int v24 = v23 - v17;
    long v25 = v24;
    long v26 = v25 + kernelSizeY;
    int v27 = (int)v26;
    int v28 = get_group_id(2);
    long v29 = v28;
    long v30 = v29 * maxZ;
    int v31 = (int)v30;
    long sext6 = v30 << 32;
    long v32 = sext6 >> 32;
    long v33 = v32 + maxZ;
    bool v34 = v33 < numZ;
    long v_numZ = v34 ? v33 : numZ;
    long v35 = v_numZ + 4294967295;
    int v36 = (int)v35;
    int v37 = v36 - v31;
    long v38 = v37;
    long v39 = v38 + kernelSizeZ;
    int v40 = (int)v39;
    bool v41 = numPlanes == 0;
    if(v41) {
        goto v__crit_edge55;
    } else {
        goto v_lr_ph54;
    }
    v_lr_ph54:;
    global long* v43 = (&indexMapper[0].f0.f0[3]);
    long v44 = v43[0];
    int v45 = get_global_id(2);
    bool v46 = v45 < v40;
    global long* v47 = (&indexMapper[0].f1.f0[3]);
    long v48 = v47[0];
    bool v49 = v45 > v37;
    bool v50 = kernelSizeZ == 0;
    global long* v51 = (&indexMapper[0].f1.f0[0]);
    long v52 = v51[0];
    global long* v53 = (&indexMapper[0].f1.f0[1]);
    long v54 = v53[0];
    global long* v55 = (&indexMapper[0].f1.f0[2]);
    long v56 = v55[0];
    bool v57 = kernelSizeY == 0;
    bool v58 = kernelSizeX == 0;
    global long* v59 = (&indexMapper[0].f0.f0[0]);
    long v60 = v59[0];
    global long* v61 = (&indexMapper[0].f0.f0[1]);
    long v62 = v61[0];
    global long* v63 = (&indexMapper[0].f0.f0[2]);
    long v64 = v63[0];
    global float*global * v65 = (&eval[0].f0);
    global float* v66 = v65[0];
    bool brmerge = v50 | v57;
    long xtraiter = kernelSizeX & 1;
    bool lcmp_mod = xtraiter == 0;
    bool v67 = kernelSizeX == 1;
        v69 = 0;
p_052 = 0;
    goto v70;
    label71:;
        goto v__crit_edge55;
    v__crit_edge55:;
    v70:;
    long v74 = v44 * v69;
    if(v46) {
        goto v_lr_ph23;
    } else {
        goto v__crit_edge24;
    }
    v_lr_ph23:;
    int v76 = get_global_id(1);
    bool v77 = v76 < v27;
    int v78 = get_local_size(2);
    if(v77) {
        goto v_lr_ph18_us_preheader;
    } else {
        goto v_lr_ph23_split_preheader;
    }
    v_lr_ph23_split_preheader:;
        k_020 = v45;
    goto v_lr_ph23_split;
    v_lr_ph18_us_preheader:;
    int v81 = get_global_id(0);
    bool v82 = v81 < v13;
    int v83 = get_local_size(1);
        k_020_us = v45;
    goto v_lr_ph18_us;
    label85:;
    int v86 = v83 + j_015_us56;
    bool v87 = v86 < v27;
    if(v87) {
        j_015_us56 = v86;
        goto label85;
    } else {
        goto v__crit_edge19_us_loopexit86;
    }
    v_lr_ph18_us:;
    int v89 = k_020_us + v31;
    long v90 = v89;
    long v91 = v64 * v90;
    int v92 = k_020_us * v27;
    if(v82) {
        goto v_lr_ph_us_us_preheader;
    } else {
        goto v_lr_ph18__lr_ph18_split_crit_edge_us_preheader;
    }
    v_lr_ph18__lr_ph18_split_crit_edge_us_preheader:;
        j_015_us56 = v76;
    goto label85;
    v_lr_ph_us_us_preheader:;
    int v95 = get_local_size(0);
        j_015_us_us = v76;
    goto v_lr_ph_us_us;
    label97:;
        goto v__crit_edge19_us;
    v__crit_edge19_us_loopexit86:;
        goto v__crit_edge19_us;
    v__crit_edge19_us:;
    int v100 = v78 + k_020_us;
    bool v101 = v100 < v40;
    if(v101) {
        k_020_us = v100;
        goto v_lr_ph18_us;
    } else {
        goto v__crit_edge24_loopexit;
    }
    v_lr_ph_us_us:;
    int v103 = j_015_us_us + v17;
    long v104 = v103;
    long v105 = v62 * v104;
    int v106 = j_015_us_us + v92;
    int v107 = v106 * v13;
        i_014_us_us = v81;
    goto v109;
    label110:;
    int v111 = v83 + j_015_us_us;
    bool v112 = v111 < v27;
    if(v112) {
        j_015_us_us = v111;
        goto v_lr_ph_us_us;
    } else {
        goto label97;
    }
    v109:;
    int v114 = i_014_us_us + v4;
    long v115 = v114;
    long v116 = v60 * v115;
    long v117 = v116 + v74;
    long v118 = v117 + v105;
    long v119 = v118 + v91;
    long sext10_us_us = v119 << 32;
    long v120 = sext10_us_us >> 32;
    global float* v121 = (&v66[v120]);
    global int* v122 = ((global int*)v121);
    int v_val_i11_us_us = v122[0];
    int v123 = i_014_us_us + v107;
    long v124 = v123;
    local float* v125 = (&(&_ZN5Eigen1sE)[0][v124]);
    local int* v126 = ((local int*)v125);
    local int* v127 = (v126);
    v127[0] = v_val_i11_us_us;
    int v129 = v95 + i_014_us_us;
    bool v130 = v129 < v13;
    if(v130) {
        i_014_us_us = v129;
        goto v109;
    } else {
        goto label110;
    }
    v__crit_edge24_loopexit:;
        goto v__crit_edge24;
    label133:;
        goto v__crit_edge24;
    v__crit_edge24:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v136 = v48 * v69;
    if(v49) {
        goto v__crit_edge51;
    } else {
        goto v_lr_ph50;
    }
    v_lr_ph50:;
    int v138 = get_global_id(1);
    bool v139 = v138 > v24;
    int v140 = get_local_size(2);
        k1_047 = v45;
    goto v142;
    v_lr_ph23_split:;
    int v143 = v78 + k_020;
    bool v144 = v143 < v40;
    if(v144) {
        k_020 = v143;
        goto v_lr_ph23_split;
    } else {
        goto label133;
    }
    label146:;
        goto v__crit_edge51;
    v__crit_edge51:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v149 = p_052 + 1;
    long v150 = v149;
    bool v151 = v150 < numPlanes;
    if(v151) {
        v69 = v150;
p_052 = v149;
        goto v70;
    } else {
        goto label71;
    }
    v142:;
    if(v139) {
        goto v__crit_edge46;
    } else {
        goto v_lr_ph45;
    }
    v_lr_ph45:;
    int v154 = get_global_id(0);
    bool v155 = v154 > v10;
    int v156 = get_local_size(1);
    int v157 = k1_047 + v31;
    long v158 = v157;
    long v159 = v56 * v158;
        j2_042 = v138;
    goto v161;
    label162:;
        goto v__crit_edge46;
    v__crit_edge46:;
    int v164 = v140 + k1_047;
    bool v165 = v164 > v37;
    if(v165) {
        goto label146;
    } else {
        k1_047 = v164;
        goto v142;
    }
    v161:;
    if(v155) {
        goto v__crit_edge41;
    } else {
        goto v_preheader13_lr_ph;
    }
    v_preheader13_lr_ph:;
    int v168 = j2_042 + v17;
    long v169 = v168;
    long v170 = v54 * v169;
    int v171 = get_local_size(0);
        i3_039 = v154;
    goto v_preheader13;
    v_preheader13:;
    if(brmerge) {
        result_0_lcssa = 0.0f;
        goto v__crit_edge37;
    } else {
        goto v_preheader_lr_ph_us_preheader;
    }
    v_preheader_lr_ph_us_preheader:;
        v175 = 0;
n_035_us = 0;
result_034_us = 0.0f;
    goto v_preheader_lr_ph_us;
    v_preheader_lr_ph_us:;
    int v176 = n_035_us + k1_047;
    int v177 = v176 * v27;
    int v178 = v177 + j2_042;
    long v179 = v175 * kernelSizeY;
    if(v58) {
        split33_us = result_034_us;
        goto v__crit_edge32_us;
    } else {
        goto v_lr_ph27_us_us_preheader;
    }
    v_lr_ph27_us_us_preheader:;
        v182 = 0;
m_030_us_us = 0;
result_129_us_us = result_034_us;
    goto v_lr_ph27_us_us;
    label183:;
        split33_us = v_lcssa_lcssa;
    goto v__crit_edge32_us;
    v__crit_edge32_us:;
    int v185 = n_035_us + 1;
    long v186 = v185;
    bool v187 = v186 < kernelSizeZ;
    if(v187) {
        v175 = v186;
n_035_us = v185;
result_034_us = split33_us;
        goto v_preheader_lr_ph_us;
    } else {
        split33_us_lcssa = split33_us;
        goto v__crit_edge37_loopexit;
    }
    v_lr_ph27_us_us:;
    int v189 = v178 + m_030_us_us;
    int v190 = v189 * v13;
    int v191 = v190 + i3_039;
    long v192 = v182 + v179;
    long v193 = v192 * kernelSizeX;
    if(lcmp_mod) {
        v_unr = 0;
l_026_us_us_unr = 0;
result_225_us_us_unr = result_129_us_us;
        goto v_lr_ph27_us_us_split;
    } else {
        goto v195;
    }
    v195:;
    int v196 = v190 + i3_039;
    long v197 = v196;
    local float* v198 = (&(&_ZN5Eigen1sE)[0][v197]);
    local float* v199 = (v198);
    float v200 = v199[0];
    global float* v201 = (&_kernel[v193]);
    float v202 = v201[0];
    float v203 = v200 * v202;
    float v204 = result_129_us_us + v203;
        v_unr = 1;
l_026_us_us_unr = 1;
result_225_us_us_unr = v204;
v_lcssa_unr = v204;
    goto v_lr_ph27_us_us_split;
    v_lr_ph27_us_us_split:;
    if(v67) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge28_us_us;
    } else {
        goto v_lr_ph27_us_us_split_split;
    }
    v_lr_ph27_us_us_split_split:;
        v208 = v_unr;
l_026_us_us = l_026_us_us_unr;
result_225_us_us = result_225_us_us_unr;
    goto v209;
    label210:;
        v_lcssa = v_lcssa88;
    goto v__crit_edge28_us_us;
    v__crit_edge28_us_us:;
    int v212 = m_030_us_us + 1;
    long v213 = v212;
    bool v214 = v213 < kernelSizeY;
    if(v214) {
        v182 = v213;
m_030_us_us = v212;
result_129_us_us = v_lcssa;
        goto v_lr_ph27_us_us;
    } else {
        v_lcssa_lcssa = v_lcssa;
        goto label183;
    }
    v209:;
    int v216 = v191 + l_026_us_us;
    long v217 = v216;
    local float* v218 = (&(&_ZN5Eigen1sE)[0][v217]);
    local float* v219 = (v218);
    float v220 = v219[0];
    long v221 = v208 + v193;
    global float* v222 = (&_kernel[v221]);
    float v223 = v222[0];
    float v224 = v220 * v223;
    float v225 = result_225_us_us + v224;
    int v226 = l_026_us_us + 1;
    long v227 = v226;
    int v228 = v191 + v226;
    long v229 = v228;
    local float* v230 = (&(&_ZN5Eigen1sE)[0][v229]);
    local float* v231 = (v230);
    float v232 = v231[0];
    long v233 = v227 + v193;
    global float* v234 = (&_kernel[v233]);
    float v235 = v234[0];
    float v236 = v232 * v235;
    float v237 = v225 + v236;
    int v238 = l_026_us_us + 2;
    long v239 = v238;
    bool v240 = v239 < kernelSizeX;
    if(v240) {
        v208 = v239;
l_026_us_us = v238;
result_225_us_us = v237;
        goto v209;
    } else {
        v_lcssa88 = v237;
        goto label210;
    }
    label242:;
        goto v__crit_edge41;
    v__crit_edge41:;
    int v244 = v156 + j2_042;
    bool v245 = v244 > v24;
    if(v245) {
        goto label162;
    } else {
        j2_042 = v244;
        goto v161;
    }
    v__crit_edge37_loopexit:;
        result_0_lcssa = split33_us_lcssa;
    goto v__crit_edge37;
    v__crit_edge37:;
    int v248 = i3_039 + v4;
    long v249 = v248;
    long v250 = v52 * v249;
    long v251 = v250 + v136;
    long v252 = v251 + v170;
    long v253 = v252 + v159;
    long sext8 = v253 << 32;
    long v254 = sext8 >> 32;
    global float* v255 = (&buffer[v254]);
    v255[0] = result_0_lcssa;
    int v257 = v171 + i3_039;
    bool v258 = v257 > v10;
    if(v258) {
        goto label242;
    } else {
        i3_039 = v257;
        goto v_preheader13;
    }
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_32* eval, global float* eval_ptr0, global float* eval_ptr1, global float* eval_ptr2, global float* eval_ptr3, global float* eval_ptr4, global float* eval_ptr5, long size) {
    long i_01_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f0.f0 = eval_ptr1;
eval[0].f1.f1.f0 = eval_ptr2;
eval[0].f1.f2.f0 = eval_ptr3;
eval[0].f1.f5 = eval_ptr4;
eval[0].f1.f6 = eval_ptr5;

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
    bool v10 = v6 < size;
    if(v10) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;
    }
    v_lr_ph_i:;
    global float*global * v12 = (&eval[0].f1.f5);
    global float* v13 = v12[0];
    global float*global * v14 = (&eval[0].f0.f0);
    global float* v15 = v14[0];
        i_01_i = v6;
    goto v17;
    v17:;
    global float* v18 = (&v13[i_01_i]);
    global int* v19 = ((global int*)v18);
    int v20 = v19[0];
    global float* v21 = (&v15[i_01_i]);
    global int* v22 = ((global int*)v21);
    v22[0] = v20;
    long v24 = i_01_i + v9;
    bool v25 = v24 < size;
    if(v25) {
        i_01_i = v24;
        goto v17;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi0ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi0ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_36* eval, global float* eval_ptr0, global float* eval_ptr1, long size) {
    long i_01_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f2 = eval_ptr1;

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
    bool v10 = v6 < size;
    if(v10) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit;
    }
    v_lr_ph_i:;
    global float*global * v12 = (&eval[0].f0.f0);
    global float* v13 = v12[0];
    global float*global * v14 = (&eval[0].f2);
    global float* v15 = v14[0];
        i_01_i = v6;
    goto v17;
    v17:;
    global float* v18 = (&v13[i_01_i]);
    global int* v19 = ((global int*)v18);
    int v_val_i1_i_i = v19[0];
    global float* v20 = (&v15[i_01_i]);
    global int* v21 = ((global int*)v20);
    v21[0] = v_val_i1_i_i;
    long v23 = i_01_i + v9;
    bool v24 = v23 < size;
    if(v24) {
        i_01_i = v23;
        goto v17;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit_loopexit;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorEvalToOpIKNS_9TensorMapINS_6TensorIfLi1ELi1ElEELi0EEEEENS_9GpuDeviceEEElLb0EE3runERSC_lll_exit:;
}

kernel void _ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_39* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int kernelSize, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i1_010;
    int i_07;
    int p_014;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 4;
    int v8 = get_group_id(1);
    int v9 = get_local_size(1);
    int v10 = v9 * v8;
    int v11 = get_num_groups(1);
    int v12 = v11 * v9;
    int v13 = get_global_id(1);
    int v14 = v13 + v10;
    bool v15 = v14 < numPlanes;
    if(v15) {
        goto v_lr_ph16;
    } else {
        goto v__crit_edge17;
    }
    v_lr_ph16:;
    global long* v17 = (&indexMapper[0].f2.f0[0]);
    long v18 = v17[0];
    global long* v19 = (&indexMapper[0].f0.f0[0]);
    long v20 = v19[0];
    global long* v21 = (&indexMapper[0].f2.f0[1]);
    long v22 = v21[0];
    global long* v23 = (&indexMapper[0].f0.f0[1]);
    long v24 = v23[0];
    global long* v25 = (&indexMapper[0].f0.f0[2]);
    long v26 = v25[0];
    int v27 = v7 * v13;
    int v28 = get_global_id(0);
    bool v29 = v28 < v7;
    global long* v30 = (&indexMapper[0].f3.f0[0]);
    long v31 = v30[0];
    global long* v32 = (&indexMapper[0].f1.f0[0]);
    long v33 = v32[0];
    global long* v34 = (&indexMapper[0].f3.f0[1]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[1]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v28 > v6;
    global long* v41 = (&indexMapper[0].f1.f0[3]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f0.f0[3]);
    long v44 = v43[0];
    global float*global * v45 = (&eval[0].f0);
    global float* v46 = v45[0];
    global float* v_phi_trans_insert = (&_kernel[1]);
    global float* v_phi_trans_insert19 = (&_kernel[2]);
    global float* v_phi_trans_insert21 = (&_kernel[3]);
        p_014 = v14;
    goto v48;
    label49:;
        goto v__crit_edge17;
    v__crit_edge17:;
    v48:;
    long v52 = p_014;
    long v53 = v52 / v18;
    long v54 = v20 * v53;
    long v55 = v53 * v18;
    long v56 = v52 - v55;
    long v57 = v56 / v22;
    long v58 = v24 * v57;
    long v59 = v58 + v54;
    long v60 = v57 * v22;
    long v61 = v56 - v60;
    long v62 = v26 * v61;
    long v63 = v59 + v62;
    if(v29) {
        goto v_lr_ph;
    } else {
        goto v__crit_edge;
    }
    v_lr_ph:;
    int v65 = get_local_size(0);
        i_07 = v28;
    goto v67;
    label68:;
        goto v__crit_edge;
    v__crit_edge:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v71 = v52 / v31;
    long v72 = v33 * v71;
    long v73 = v71 * v31;
    long v74 = v52 - v73;
    long v75 = v74 / v35;
    long v76 = v37 * v75;
    long v77 = v76 + v72;
    long v78 = v75 * v35;
    long v79 = v74 - v78;
    long v80 = v39 * v79;
    long v81 = v77 + v80;
    if(v40) {
        goto v__crit_edge13;
    } else {
        goto v_lr_ph12;
    }
    v_lr_ph12:;
    int v83 = get_local_size(0);
    float v_pre = _kernel[0];
    float v_pre18 = v_phi_trans_insert[0];
    float v_pre20 = v_phi_trans_insert19[0];
    float v_pre22 = v_phi_trans_insert21[0];
        i1_010 = v28;
    goto v85;
    v67:;
    int v86 = i_07 + v2;
    long v87 = v86;
    long v88 = v44 * v87;
    long v89 = v63 + v88;
    long sext5 = v89 << 32;
    long v90 = sext5 >> 32;
    global float* v91 = (&v46[v90]);
    global int* v92 = ((global int*)v91);
    int v_val_i6 = v92[0];
    int v93 = i_07 + v27;
    long v94 = v93;
    local float* v95 = (&(&_ZN5Eigen1sE)[0][v94]);
    local int* v96 = ((local int*)v95);
    local int* v97 = (v96);
    v97[0] = v_val_i6;
    int v99 = v65 + i_07;
    bool v100 = v99 < v7;
    if(v100) {
        i_07 = v99;
        goto v67;
    } else {
        goto label68;
    }
    label102:;
        goto v__crit_edge13;
    v__crit_edge13:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v105 = p_014 + v12;
    bool v106 = v105 < numPlanes;
    if(v106) {
        p_014 = v105;
        goto v48;
    } else {
        goto label49;
    }
    v85:;
    int v108 = i1_010 + v27;
    long v109 = v108;
    local float* v110 = (&(&_ZN5Eigen1sE)[0][v109]);
    local float* v111 = (v110);
    float v112 = v111[0];
    float v113 = v112 * v_pre;
    float v114 = v113 + 0.0f;
    int v115 = v108 + 1;
    long v116 = v115;
    local float* v117 = (&(&_ZN5Eigen1sE)[0][v116]);
    local float* v118 = (v117);
    float v119 = v118[0];
    float v120 = v119 * v_pre18;
    float v121 = v114 + v120;
    int v122 = v108 + 2;
    long v123 = v122;
    local float* v124 = (&(&_ZN5Eigen1sE)[0][v123]);
    local float* v125 = (v124);
    float v126 = v125[0];
    float v127 = v126 * v_pre20;
    float v128 = v121 + v127;
    int v129 = v108 + 3;
    long v130 = v129;
    local float* v131 = (&(&_ZN5Eigen1sE)[0][v130]);
    local float* v132 = (v131);
    float v133 = v132[0];
    float v134 = v133 * v_pre22;
    float v135 = v128 + v134;
    int v136 = i1_010 + v2;
    long v137 = v136;
    long v138 = v42 * v137;
    long v139 = v81 + v138;
    long sext3 = v139 << 32;
    long v140 = sext3 >> 32;
    global float* v141 = (&buffer[v140]);
    v141[0] = v135;
    int v143 = v83 + i1_010;
    bool v144 = v143 > v6;
    if(v144) {
        goto label102;
    } else {
        i1_010 = v143;
        goto v85;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_39* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int kernelSize, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i1_010;
    int i_07;
    int p_014;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 7;
    int v8 = get_group_id(1);
    int v9 = get_local_size(1);
    int v10 = v9 * v8;
    int v11 = get_num_groups(1);
    int v12 = v11 * v9;
    int v13 = get_global_id(1);
    int v14 = v13 + v10;
    bool v15 = v14 < numPlanes;
    if(v15) {
        goto v_lr_ph16;
    } else {
        goto v__crit_edge17;
    }
    v_lr_ph16:;
    global long* v17 = (&indexMapper[0].f2.f0[0]);
    long v18 = v17[0];
    global long* v19 = (&indexMapper[0].f0.f0[0]);
    long v20 = v19[0];
    global long* v21 = (&indexMapper[0].f2.f0[1]);
    long v22 = v21[0];
    global long* v23 = (&indexMapper[0].f0.f0[1]);
    long v24 = v23[0];
    global long* v25 = (&indexMapper[0].f0.f0[2]);
    long v26 = v25[0];
    int v27 = v7 * v13;
    int v28 = get_global_id(0);
    bool v29 = v28 < v7;
    global long* v30 = (&indexMapper[0].f3.f0[0]);
    long v31 = v30[0];
    global long* v32 = (&indexMapper[0].f1.f0[0]);
    long v33 = v32[0];
    global long* v34 = (&indexMapper[0].f3.f0[1]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[1]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v28 > v6;
    global long* v41 = (&indexMapper[0].f1.f0[3]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f0.f0[3]);
    long v44 = v43[0];
    global float*global * v45 = (&eval[0].f0);
    global float* v46 = v45[0];
    global float* v_phi_trans_insert = (&_kernel[1]);
    global float* v_phi_trans_insert19 = (&_kernel[2]);
    global float* v_phi_trans_insert21 = (&_kernel[3]);
    global float* v_phi_trans_insert23 = (&_kernel[4]);
    global float* v_phi_trans_insert25 = (&_kernel[5]);
    global float* v_phi_trans_insert27 = (&_kernel[6]);
        p_014 = v14;
    goto v48;
    label49:;
        goto v__crit_edge17;
    v__crit_edge17:;
    v48:;
    long v52 = p_014;
    long v53 = v52 / v18;
    long v54 = v20 * v53;
    long v55 = v53 * v18;
    long v56 = v52 - v55;
    long v57 = v56 / v22;
    long v58 = v24 * v57;
    long v59 = v58 + v54;
    long v60 = v57 * v22;
    long v61 = v56 - v60;
    long v62 = v26 * v61;
    long v63 = v59 + v62;
    if(v29) {
        goto v_lr_ph;
    } else {
        goto v__crit_edge;
    }
    v_lr_ph:;
    int v65 = get_local_size(0);
        i_07 = v28;
    goto v67;
    label68:;
        goto v__crit_edge;
    v__crit_edge:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v71 = v52 / v31;
    long v72 = v33 * v71;
    long v73 = v71 * v31;
    long v74 = v52 - v73;
    long v75 = v74 / v35;
    long v76 = v37 * v75;
    long v77 = v76 + v72;
    long v78 = v75 * v35;
    long v79 = v74 - v78;
    long v80 = v39 * v79;
    long v81 = v77 + v80;
    if(v40) {
        goto v__crit_edge13;
    } else {
        goto v_lr_ph12;
    }
    v_lr_ph12:;
    int v83 = get_local_size(0);
    float v_pre = _kernel[0];
    float v_pre18 = v_phi_trans_insert[0];
    float v_pre20 = v_phi_trans_insert19[0];
    float v_pre22 = v_phi_trans_insert21[0];
    float v_pre24 = v_phi_trans_insert23[0];
    float v_pre26 = v_phi_trans_insert25[0];
    float v_pre28 = v_phi_trans_insert27[0];
        i1_010 = v28;
    goto v85;
    v67:;
    int v86 = i_07 + v2;
    long v87 = v86;
    long v88 = v44 * v87;
    long v89 = v63 + v88;
    long sext5 = v89 << 32;
    long v90 = sext5 >> 32;
    global float* v91 = (&v46[v90]);
    global int* v92 = ((global int*)v91);
    int v_val_i6 = v92[0];
    int v93 = i_07 + v27;
    long v94 = v93;
    local float* v95 = (&(&_ZN5Eigen1sE)[0][v94]);
    local int* v96 = ((local int*)v95);
    local int* v97 = (v96);
    v97[0] = v_val_i6;
    int v99 = v65 + i_07;
    bool v100 = v99 < v7;
    if(v100) {
        i_07 = v99;
        goto v67;
    } else {
        goto label68;
    }
    label102:;
        goto v__crit_edge13;
    v__crit_edge13:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v105 = p_014 + v12;
    bool v106 = v105 < numPlanes;
    if(v106) {
        p_014 = v105;
        goto v48;
    } else {
        goto label49;
    }
    v85:;
    int v108 = i1_010 + v27;
    long v109 = v108;
    local float* v110 = (&(&_ZN5Eigen1sE)[0][v109]);
    local float* v111 = (v110);
    float v112 = v111[0];
    float v113 = v112 * v_pre;
    float v114 = v113 + 0.0f;
    int v115 = v108 + 1;
    long v116 = v115;
    local float* v117 = (&(&_ZN5Eigen1sE)[0][v116]);
    local float* v118 = (v117);
    float v119 = v118[0];
    float v120 = v119 * v_pre18;
    float v121 = v114 + v120;
    int v122 = v108 + 2;
    long v123 = v122;
    local float* v124 = (&(&_ZN5Eigen1sE)[0][v123]);
    local float* v125 = (v124);
    float v126 = v125[0];
    float v127 = v126 * v_pre20;
    float v128 = v121 + v127;
    int v129 = v108 + 3;
    long v130 = v129;
    local float* v131 = (&(&_ZN5Eigen1sE)[0][v130]);
    local float* v132 = (v131);
    float v133 = v132[0];
    float v134 = v133 * v_pre22;
    float v135 = v128 + v134;
    int v136 = v108 + 4;
    long v137 = v136;
    local float* v138 = (&(&_ZN5Eigen1sE)[0][v137]);
    local float* v139 = (v138);
    float v140 = v139[0];
    float v141 = v140 * v_pre24;
    float v142 = v135 + v141;
    int v143 = v108 + 5;
    long v144 = v143;
    local float* v145 = (&(&_ZN5Eigen1sE)[0][v144]);
    local float* v146 = (v145);
    float v147 = v146[0];
    float v148 = v147 * v_pre26;
    float v149 = v142 + v148;
    int v150 = v108 + 6;
    long v151 = v150;
    local float* v152 = (&(&_ZN5Eigen1sE)[0][v151]);
    local float* v153 = (v152);
    float v154 = v153[0];
    float v155 = v154 * v_pre28;
    float v156 = v149 + v155;
    int v157 = i1_010 + v2;
    long v158 = v157;
    long v159 = v42 * v158;
    long v160 = v81 + v159;
    long sext3 = v160 << 32;
    long v161 = sext3 >> 32;
    global float* v162 = (&buffer[v161]);
    v162[0] = v156;
    int v164 = v83 + i1_010;
    bool v165 = v164 > v6;
    if(v165) {
        goto label102;
    } else {
        i1_010 = v164;
        goto v85;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel1DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li1EXsrSB_6LayoutEEEPKfiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_39* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int kernelSize, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i1_013;
    int i1_013_us;
    int i_07;
    int k_09_us;
    int k_09_us_unr;
    int p_017;
    float result_08_us;
    float result_08_us_unr;
    float v_lcssa;
    float v_lcssa28;
    float v_lcssa_unr;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + kernelSize;
    int v8 = get_group_id(1);
    int v9 = get_local_size(1);
    int v10 = v9 * v8;
    int v11 = get_num_groups(1);
    int v12 = v11 * v9;
    int v13 = get_global_id(1);
    int v14 = v13 + v10;
    bool v15 = v14 < numPlanes;
    if(v15) {
        goto v_lr_ph19;
    } else {
        goto v__crit_edge20;
    }
    v_lr_ph19:;
    global long* v17 = (&indexMapper[0].f2.f0[0]);
    long v18 = v17[0];
    global long* v19 = (&indexMapper[0].f0.f0[0]);
    long v20 = v19[0];
    global long* v21 = (&indexMapper[0].f2.f0[1]);
    long v22 = v21[0];
    global long* v23 = (&indexMapper[0].f0.f0[1]);
    long v24 = v23[0];
    global long* v25 = (&indexMapper[0].f0.f0[2]);
    long v26 = v25[0];
    int v27 = v7 * v13;
    int v28 = get_global_id(0);
    bool v29 = v28 < v7;
    global long* v30 = (&indexMapper[0].f3.f0[0]);
    long v31 = v30[0];
    global long* v32 = (&indexMapper[0].f1.f0[0]);
    long v33 = v32[0];
    global long* v34 = (&indexMapper[0].f3.f0[1]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[1]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[2]);
    long v39 = v38[0];
    bool v40 = v28 > v6;
    bool v41 = kernelSize > 0;
    global long* v42 = (&indexMapper[0].f1.f0[3]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f0.f0[3]);
    long v45 = v44[0];
    global float*global * v46 = (&eval[0].f0);
    global float* v47 = v46[0];
    int xtraiter = kernelSize & 1;
    bool lcmp_mod = xtraiter == 0;
    bool v48 = kernelSize == 1;
        p_017 = v14;
    goto v50;
    label51:;
        goto v__crit_edge20;
    v__crit_edge20:;
    v50:;
    long v54 = p_017;
    long v55 = v54 / v18;
    long v56 = v20 * v55;
    long v57 = v55 * v18;
    long v58 = v54 - v57;
    long v59 = v58 / v22;
    long v60 = v24 * v59;
    long v61 = v60 + v56;
    long v62 = v59 * v22;
    long v63 = v58 - v62;
    long v64 = v26 * v63;
    long v65 = v61 + v64;
    if(v29) {
        goto v_lr_ph;
    } else {
        goto v__crit_edge;
    }
    v_lr_ph:;
    int v67 = get_local_size(0);
        i_07 = v28;
    goto v69;
    label70:;
        goto v__crit_edge;
    v__crit_edge:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v73 = v54 / v31;
    long v74 = v33 * v73;
    long v75 = v73 * v31;
    long v76 = v54 - v75;
    long v77 = v76 / v35;
    long v78 = v37 * v77;
    long v79 = v78 + v74;
    long v80 = v77 * v35;
    long v81 = v76 - v80;
    long v82 = v39 * v81;
    long v83 = v79 + v82;
    if(v40) {
        goto v__crit_edge16;
    } else {
        goto v_lr_ph15;
    }
    v_lr_ph15:;
    int v85 = get_local_size(0);
    if(v41) {
        goto v_lr_ph15_split_us_preheader;
    } else {
        goto v_lr_ph15_split_preheader;
    }
    v_lr_ph15_split_preheader:;
        i1_013 = v28;
    goto v_lr_ph15_split;
    v_lr_ph15_split_us_preheader:;
        i1_013_us = v28;
    goto v_lr_ph15_split_us;
    v_lr_ph15_split_us:;
    int v89 = i1_013_us + v27;
    if(lcmp_mod) {
        k_09_us_unr = 0;
result_08_us_unr = 0.0f;
        goto v_lr_ph15_split_us_split;
    } else {
        goto v91;
    }
    v91:;
    long v92 = v89;
    local float* v93 = (&(&_ZN5Eigen1sE)[0][v92]);
    local float* v94 = (v93);
    float v95 = v94[0];
    float v96 = _kernel[0];
    float v97 = v95 * v96;
    float v98 = v97 + 0.0f;
        k_09_us_unr = 1;
result_08_us_unr = v98;
v_lcssa_unr = v98;
    goto v_lr_ph15_split_us_split;
    v_lr_ph15_split_us_split:;
    if(v48) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge12_us;
    } else {
        goto v_lr_ph15_split_us_split_split_preheader;
    }
    v_lr_ph15_split_us_split_split_preheader:;
        k_09_us = k_09_us_unr;
result_08_us = result_08_us_unr;
    goto v_lr_ph15_split_us_split_split;
    v_lr_ph15_split_us_split_split:;
    int v102 = v89 + k_09_us;
    long v103 = v102;
    local float* v104 = (&(&_ZN5Eigen1sE)[0][v103]);
    local float* v105 = (v104);
    float v106 = v105[0];
    long v107 = k_09_us;
    global float* v108 = (&_kernel[v107]);
    float v109 = v108[0];
    float v110 = v106 * v109;
    float v111 = result_08_us + v110;
    int v112 = k_09_us + 1;
    int v113 = v89 + v112;
    long v114 = v113;
    local float* v115 = (&(&_ZN5Eigen1sE)[0][v114]);
    local float* v116 = (v115);
    float v117 = v116[0];
    long v118 = v112;
    global float* v119 = (&_kernel[v118]);
    float v120 = v119[0];
    float v121 = v117 * v120;
    float v122 = v111 + v121;
    int v123 = k_09_us + 2;
    bool exitcond_1 = v123 == kernelSize;
    if(exitcond_1) {
        v_lcssa28 = v122;
        goto v__crit_edge12_us_loopexit;
    } else {
        k_09_us = v123;
result_08_us = v122;
        goto v_lr_ph15_split_us_split_split;
    }
    v__crit_edge12_us_loopexit:;
        v_lcssa = v_lcssa28;
    goto v__crit_edge12_us;
    v__crit_edge12_us:;
    int v126 = i1_013_us + v2;
    long v127 = v126;
    long v128 = v43 * v127;
    long v129 = v83 + v128;
    long sext3_us = v129 << 32;
    long v130 = sext3_us >> 32;
    global float* v131 = (&buffer[v130]);
    v131[0] = v_lcssa;
    int v133 = v85 + i1_013_us;
    bool v134 = v133 > v6;
    if(v134) {
        goto v__crit_edge16_loopexit;
    } else {
        i1_013_us = v133;
        goto v_lr_ph15_split_us;
    }
    v69:;
    int v136 = i_07 + v2;
    long v137 = v136;
    long v138 = v45 * v137;
    long v139 = v65 + v138;
    long sext5 = v139 << 32;
    long v140 = sext5 >> 32;
    global float* v141 = (&v47[v140]);
    global int* v142 = ((global int*)v141);
    int v_val_i6 = v142[0];
    int v143 = i_07 + v27;
    long v144 = v143;
    local float* v145 = (&(&_ZN5Eigen1sE)[0][v144]);
    local int* v146 = ((local int*)v145);
    local int* v147 = (v146);
    v147[0] = v_val_i6;
    int v149 = v67 + i_07;
    bool v150 = v149 < v7;
    if(v150) {
        i_07 = v149;
        goto v69;
    } else {
        goto label70;
    }
    v__crit_edge16_loopexit:;
        goto v__crit_edge16;
    label153:;
        goto v__crit_edge16;
    v__crit_edge16:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v156 = p_017 + v12;
    bool v157 = v156 < numPlanes;
    if(v157) {
        p_017 = v156;
        goto v50;
    } else {
        goto label51;
    }
    v_lr_ph15_split:;
    int v159 = i1_013 + v2;
    long v160 = v159;
    long v161 = v43 * v160;
    long v162 = v83 + v161;
    long sext3 = v162 << 32;
    long v163 = sext3 >> 32;
    global float* v164 = (&buffer[v163]);
    v164[0] = 0.0f;
    int v166 = v85 + i1_013;
    bool v167 = v166 > v6;
    if(v167) {
        goto label153;
    } else {
        i1_013 = v166;
        goto v_lr_ph15_split;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELi7EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_40* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_020;
    int i_010_us;
    int j1_022;
    int j1_022_us;
    int j_011;
    int j_011_us;
    int p_027;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 4;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + 7;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph29;
    } else {
        goto v__crit_edge30;
    }
    v_lr_ph29:;
    global long* v25 = (&indexMapper[0].f2.f0[0]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[0]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[1]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[0]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[0]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    global long* v41 = (&indexMapper[0].f1.f0[2]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f1.f0[3]);
    long v44 = v43[0];
    global long* v45 = (&indexMapper[0].f0.f0[2]);
    long v46 = v45[0];
    global long* v47 = (&indexMapper[0].f0.f0[3]);
    long v48 = v47[0];
    global float*global * v49 = (&eval[0].f0);
    global float* v50 = v49[0];
    global float* v51 = (&_kernel[1]);
    global float* v52 = (&_kernel[2]);
    global float* v53 = (&_kernel[3]);
    long v54 = kernelSizeX;
    global float* v55 = (&_kernel[v54]);
    int v56 = kernelSizeX + 1;
    long v57 = v56;
    global float* v58 = (&_kernel[v57]);
    int v59 = kernelSizeX + 2;
    long v60 = v59;
    global float* v61 = (&_kernel[v60]);
    int v62 = kernelSizeX + 3;
    long v63 = v62;
    global float* v64 = (&_kernel[v63]);
    int v65 = kernelSizeX << 1;
    long v66 = v65;
    global float* v67 = (&_kernel[v66]);
    int v68 = v65 | 1;
    long v69 = v68;
    global float* v70 = (&_kernel[v69]);
    int v71 = v65 + 2;
    long v72 = v71;
    global float* v73 = (&_kernel[v72]);
    int v74 = v65 + 3;
    long v75 = v74;
    global float* v76 = (&_kernel[v75]);
    int v77 = kernelSizeX * 3;
    long v78 = v77;
    global float* v79 = (&_kernel[v78]);
    int v80 = v77 + 1;
    long v81 = v80;
    global float* v82 = (&_kernel[v81]);
    int v83 = v77 + 2;
    long v84 = v83;
    global float* v85 = (&_kernel[v84]);
    int v86 = v77 + 3;
    long v87 = v86;
    global float* v88 = (&_kernel[v87]);
    int v89 = kernelSizeX << 2;
    long v90 = v89;
    global float* v91 = (&_kernel[v90]);
    int v92 = v89 | 1;
    long v93 = v92;
    global float* v94 = (&_kernel[v93]);
    int v95 = v89 | 2;
    long v96 = v95;
    global float* v97 = (&_kernel[v96]);
    int v98 = v89 | 3;
    long v99 = v98;
    global float* v100 = (&_kernel[v99]);
    int v101 = kernelSizeX * 5;
    long v102 = v101;
    global float* v103 = (&_kernel[v102]);
    int v104 = v101 + 1;
    long v105 = v104;
    global float* v106 = (&_kernel[v105]);
    int v107 = v101 + 2;
    long v108 = v107;
    global float* v109 = (&_kernel[v108]);
    int v110 = v101 + 3;
    long v111 = v110;
    global float* v112 = (&_kernel[v111]);
    int v113 = kernelSizeX * 6;
    long v114 = v113;
    global float* v115 = (&_kernel[v114]);
    int v116 = v113 | 1;
    long v117 = v116;
    global float* v118 = (&_kernel[v117]);
    int v119 = v113 + 2;
    long v120 = v119;
    global float* v121 = (&_kernel[v120]);
    int v122 = v113 + 3;
    long v123 = v122;
    global float* v124 = (&_kernel[v123]);
        p_027 = v22;
    goto v126;
    label127:;
        goto v__crit_edge30;
    v__crit_edge30:;
    v126:;
    long v130 = p_027;
    long v131 = v130 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v133 = v131 * v26;
    long v134 = v130 - v133;
    long v135 = v30 * v134;
    long v136 = v28 * v131;
    int v137 = get_global_id(0);
    bool v138 = v137 < v7;
    int v139 = get_local_size(1);
    long v140 = v135 + v136;
    if(v138) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v143 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v145 = j_011_us + v31;
    int v146 = v145 * v7;
    int v147 = j_011_us + v9;
    long v148 = v147;
    long v149 = v48 * v148;
        i_010_us = v137;
    goto v151;
    v151:;
    int v152 = i_010_us + v2;
    long v153 = v152;
    long v154 = v46 * v153;
    long v155 = v140 + v154;
    long v156 = v155 + v149;
    long sext7_us = v156 << 32;
    long v157 = sext7_us >> 32;
    global float* v158 = (&v50[v157]);
    global int* v159 = ((global int*)v158);
    int v_val_i8_us = v159[0];
    int v160 = i_010_us + v146;
    long v161 = v160;
    local float* v162 = (&(&_ZN5Eigen1sE)[0][v161]);
    local int* v163 = ((local int*)v162);
    local int* v164 = (v163);
    v164[0] = v_val_i8_us;
    int v166 = v143 + i_010_us;
    bool v167 = v166 < v7;
    if(v167) {
        i_010_us = v166;
        goto v151;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v169 = v139 + j_011_us;
    bool v170 = v169 < v15;
    if(v170) {
        j_011_us = v169;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label173:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v176 = v130 / v35;
    if(v40) {
        goto v__crit_edge26;
    } else {
        goto v_lr_ph25;
    }
    v_lr_ph25:;
    long v178 = v176 * v35;
    long v179 = v130 - v178;
    long v180 = v39 * v179;
    long v181 = v37 * v176;
    int v182 = get_global_id(0);
    bool v183 = v182 > v6;
    int v184 = get_local_size(1);
    long v185 = v180 + v181;
    if(v183) {
        goto v_lr_ph25_split_us_preheader;
    } else {
        goto v_preheader_lr_ph_preheader;
    }
    v_lr_ph25_split_us_preheader:;
        j1_022_us = v32;
    goto v_lr_ph25_split_us;
    v_preheader_lr_ph_preheader:;
    int v188 = get_local_size(0);
    float v189 = _kernel[0];
    float v190 = v51[0];
    float v191 = v52[0];
    float v192 = v53[0];
    float v193 = v55[0];
    float v194 = v58[0];
    float v195 = v61[0];
    float v196 = v64[0];
    float v197 = v67[0];
    float v198 = v70[0];
    float v199 = v73[0];
    float v200 = v76[0];
    float v201 = v79[0];
    float v202 = v82[0];
    float v203 = v85[0];
    float v204 = v88[0];
    float v205 = v91[0];
    float v206 = v94[0];
    float v207 = v97[0];
    float v208 = v100[0];
    float v209 = v103[0];
    float v210 = v106[0];
    float v211 = v109[0];
    float v212 = v112[0];
    float v213 = v115[0];
    float v214 = v118[0];
    float v215 = v121[0];
    float v216 = v124[0];
        j1_022 = v32;
    goto v_preheader_lr_ph;
    v_lr_ph25_split_us:;
    int v218 = v184 + j1_022_us;
    bool v219 = v218 > v14;
    if(v219) {
        goto v__crit_edge26_loopexit;
    } else {
        j1_022_us = v218;
        goto v_lr_ph25_split_us;
    }
    v_lr_ph14_split:;
    int v221 = v139 + j_011;
    bool v222 = v221 < v15;
    if(v222) {
        j_011 = v221;
        goto v_lr_ph14_split;
    } else {
        goto label173;
    }
    v__crit_edge26_loopexit:;
        goto v__crit_edge26;
    label225:;
        goto v__crit_edge26;
    v__crit_edge26:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v228 = p_027 + v20;
    bool v229 = v228 < numPlanes;
    if(v229) {
        p_027 = v228;
        goto v126;
    } else {
        goto label127;
    }
    v_preheader_lr_ph:;
    int v231 = j1_022 + v31;
    int v232 = j1_022 + v9;
    long v233 = v232;
    long v234 = v44 * v233;
    int v235 = v231 + 6;
    int v236 = v235 * v7;
    int v237 = v231 * v7;
    int v238 = v231 + 1;
    int v239 = v238 * v7;
    int v240 = v231 + 2;
    int v241 = v240 * v7;
    int v242 = v231 + 3;
    int v243 = v242 * v7;
    int v244 = v231 + 4;
    int v245 = v244 * v7;
    int v246 = v231 + 5;
    int v247 = v246 * v7;
        i2_020 = v182;
    goto v_preheader;
    v_preheader:;
    int v249 = v237 + i2_020;
    long v250 = v249;
    local float* v251 = (&(&_ZN5Eigen1sE)[0][v250]);
    local float* v252 = (v251);
    float v253 = v252[0];
    float v254 = v253 * v189;
    float v255 = v254 + 0.0f;
    int v256 = v249 + 1;
    long v257 = v256;
    local float* v258 = (&(&_ZN5Eigen1sE)[0][v257]);
    local float* v259 = (v258);
    float v260 = v259[0];
    float v261 = v260 * v190;
    float v262 = v255 + v261;
    int v263 = v249 + 2;
    long v264 = v263;
    local float* v265 = (&(&_ZN5Eigen1sE)[0][v264]);
    local float* v266 = (v265);
    float v267 = v266[0];
    float v268 = v267 * v191;
    float v269 = v262 + v268;
    int v270 = v249 + 3;
    long v271 = v270;
    local float* v272 = (&(&_ZN5Eigen1sE)[0][v271]);
    local float* v273 = (v272);
    float v274 = v273[0];
    float v275 = v274 * v192;
    float v276 = v269 + v275;
    int v277 = v239 + i2_020;
    long v278 = v277;
    local float* v279 = (&(&_ZN5Eigen1sE)[0][v278]);
    local float* v280 = (v279);
    float v281 = v280[0];
    float v282 = v281 * v193;
    float v283 = v276 + v282;
    int v284 = v277 + 1;
    long v285 = v284;
    local float* v286 = (&(&_ZN5Eigen1sE)[0][v285]);
    local float* v287 = (v286);
    float v288 = v287[0];
    float v289 = v288 * v194;
    float v290 = v283 + v289;
    int v291 = v277 + 2;
    long v292 = v291;
    local float* v293 = (&(&_ZN5Eigen1sE)[0][v292]);
    local float* v294 = (v293);
    float v295 = v294[0];
    float v296 = v295 * v195;
    float v297 = v290 + v296;
    int v298 = v277 + 3;
    long v299 = v298;
    local float* v300 = (&(&_ZN5Eigen1sE)[0][v299]);
    local float* v301 = (v300);
    float v302 = v301[0];
    float v303 = v302 * v196;
    float v304 = v297 + v303;
    int v305 = v241 + i2_020;
    long v306 = v305;
    local float* v307 = (&(&_ZN5Eigen1sE)[0][v306]);
    local float* v308 = (v307);
    float v309 = v308[0];
    float v310 = v309 * v197;
    float v311 = v304 + v310;
    int v312 = v305 + 1;
    long v313 = v312;
    local float* v314 = (&(&_ZN5Eigen1sE)[0][v313]);
    local float* v315 = (v314);
    float v316 = v315[0];
    float v317 = v316 * v198;
    float v318 = v311 + v317;
    int v319 = v305 + 2;
    long v320 = v319;
    local float* v321 = (&(&_ZN5Eigen1sE)[0][v320]);
    local float* v322 = (v321);
    float v323 = v322[0];
    float v324 = v323 * v199;
    float v325 = v318 + v324;
    int v326 = v305 + 3;
    long v327 = v326;
    local float* v328 = (&(&_ZN5Eigen1sE)[0][v327]);
    local float* v329 = (v328);
    float v330 = v329[0];
    float v331 = v330 * v200;
    float v332 = v325 + v331;
    int v333 = v243 + i2_020;
    long v334 = v333;
    local float* v335 = (&(&_ZN5Eigen1sE)[0][v334]);
    local float* v336 = (v335);
    float v337 = v336[0];
    float v338 = v337 * v201;
    float v339 = v332 + v338;
    int v340 = v333 + 1;
    long v341 = v340;
    local float* v342 = (&(&_ZN5Eigen1sE)[0][v341]);
    local float* v343 = (v342);
    float v344 = v343[0];
    float v345 = v344 * v202;
    float v346 = v339 + v345;
    int v347 = v333 + 2;
    long v348 = v347;
    local float* v349 = (&(&_ZN5Eigen1sE)[0][v348]);
    local float* v350 = (v349);
    float v351 = v350[0];
    float v352 = v351 * v203;
    float v353 = v346 + v352;
    int v354 = v333 + 3;
    long v355 = v354;
    local float* v356 = (&(&_ZN5Eigen1sE)[0][v355]);
    local float* v357 = (v356);
    float v358 = v357[0];
    float v359 = v358 * v204;
    float v360 = v353 + v359;
    int v361 = v245 + i2_020;
    long v362 = v361;
    local float* v363 = (&(&_ZN5Eigen1sE)[0][v362]);
    local float* v364 = (v363);
    float v365 = v364[0];
    float v366 = v365 * v205;
    float v367 = v360 + v366;
    int v368 = v361 + 1;
    long v369 = v368;
    local float* v370 = (&(&_ZN5Eigen1sE)[0][v369]);
    local float* v371 = (v370);
    float v372 = v371[0];
    float v373 = v372 * v206;
    float v374 = v367 + v373;
    int v375 = v361 + 2;
    long v376 = v375;
    local float* v377 = (&(&_ZN5Eigen1sE)[0][v376]);
    local float* v378 = (v377);
    float v379 = v378[0];
    float v380 = v379 * v207;
    float v381 = v374 + v380;
    int v382 = v361 + 3;
    long v383 = v382;
    local float* v384 = (&(&_ZN5Eigen1sE)[0][v383]);
    local float* v385 = (v384);
    float v386 = v385[0];
    float v387 = v386 * v208;
    float v388 = v381 + v387;
    int v389 = v247 + i2_020;
    long v390 = v389;
    local float* v391 = (&(&_ZN5Eigen1sE)[0][v390]);
    local float* v392 = (v391);
    float v393 = v392[0];
    float v394 = v393 * v209;
    float v395 = v388 + v394;
    int v396 = v389 + 1;
    long v397 = v396;
    local float* v398 = (&(&_ZN5Eigen1sE)[0][v397]);
    local float* v399 = (v398);
    float v400 = v399[0];
    float v401 = v400 * v210;
    float v402 = v395 + v401;
    int v403 = v389 + 2;
    long v404 = v403;
    local float* v405 = (&(&_ZN5Eigen1sE)[0][v404]);
    local float* v406 = (v405);
    float v407 = v406[0];
    float v408 = v407 * v211;
    float v409 = v402 + v408;
    int v410 = v389 + 3;
    long v411 = v410;
    local float* v412 = (&(&_ZN5Eigen1sE)[0][v411]);
    local float* v413 = (v412);
    float v414 = v413[0];
    float v415 = v414 * v212;
    float v416 = v409 + v415;
    int v417 = v236 + i2_020;
    long v418 = v417;
    local float* v419 = (&(&_ZN5Eigen1sE)[0][v418]);
    local float* v420 = (v419);
    float v421 = v420[0];
    float v422 = v421 * v213;
    float v423 = v416 + v422;
    int v424 = v417 + 1;
    long v425 = v424;
    local float* v426 = (&(&_ZN5Eigen1sE)[0][v425]);
    local float* v427 = (v426);
    float v428 = v427[0];
    float v429 = v428 * v214;
    float v430 = v423 + v429;
    int v431 = v417 + 2;
    long v432 = v431;
    local float* v433 = (&(&_ZN5Eigen1sE)[0][v432]);
    local float* v434 = (v433);
    float v435 = v434[0];
    float v436 = v435 * v215;
    float v437 = v430 + v436;
    int v438 = v417 + 3;
    long v439 = v438;
    local float* v440 = (&(&_ZN5Eigen1sE)[0][v439]);
    local float* v441 = (v440);
    float v442 = v441[0];
    float v443 = v442 * v216;
    float v444 = v437 + v443;
    int v445 = i2_020 + v2;
    long v446 = v445;
    long v447 = v42 * v446;
    long v448 = v185 + v447;
    long v449 = v448 + v234;
    long sext5 = v449 << 32;
    long v450 = sext5 >> 32;
    global float* v451 = (&buffer[v450]);
    v451[0] = v444;
    int v453 = v188 + i2_020;
    bool v454 = v453 > v6;
    if(v454) {
        goto v__crit_edge21;
    } else {
        i2_020 = v453;
        goto v_preheader;
    }
    v__crit_edge21:;
    int v456 = v184 + j1_022;
    bool v457 = v456 > v14;
    if(v457) {
        goto label225;
    } else {
        j1_022 = v456;
        goto v_preheader_lr_ph;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi4ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_40* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_022;
    int i2_022_us;
    int i_010_us;
    int j1_025;
    int j_011;
    int j_011_us;
    int l_019_us;
    int p_030;
    float result_018_us;
    float v_lcssa;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 4;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + kernelSizeY;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph32;
    } else {
        goto v__crit_edge33;
    }
    v_lr_ph32:;
    global long* v25 = (&indexMapper[0].f2.f0[0]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[0]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[1]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[0]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[0]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    bool v41 = kernelSizeY > 0;
    global long* v42 = (&indexMapper[0].f1.f0[2]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f1.f0[3]);
    long v45 = v44[0];
    global long* v46 = (&indexMapper[0].f0.f0[2]);
    long v47 = v46[0];
    global long* v48 = (&indexMapper[0].f0.f0[3]);
    long v49 = v48[0];
    global float*global * v50 = (&eval[0].f0);
    global float* v51 = v50[0];
        p_030 = v22;
    goto v53;
    label54:;
        goto v__crit_edge33;
    v__crit_edge33:;
    v53:;
    long v57 = p_030;
    long v58 = v57 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v60 = v58 * v26;
    long v61 = v57 - v60;
    long v62 = v30 * v61;
    long v63 = v28 * v58;
    int v64 = get_global_id(0);
    bool v65 = v64 < v7;
    int v66 = get_local_size(1);
    long v67 = v62 + v63;
    if(v65) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v70 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v72 = j_011_us + v31;
    int v73 = v72 * v7;
    int v74 = j_011_us + v9;
    long v75 = v74;
    long v76 = v49 * v75;
        i_010_us = v64;
    goto v78;
    v78:;
    int v79 = i_010_us + v2;
    long v80 = v79;
    long v81 = v47 * v80;
    long v82 = v67 + v81;
    long v83 = v82 + v76;
    long sext7_us = v83 << 32;
    long v84 = sext7_us >> 32;
    global float* v85 = (&v51[v84]);
    global int* v86 = ((global int*)v85);
    int v_val_i8_us = v86[0];
    int v87 = i_010_us + v73;
    long v88 = v87;
    local float* v89 = (&(&_ZN5Eigen1sE)[0][v88]);
    local int* v90 = ((local int*)v89);
    local int* v91 = (v90);
    v91[0] = v_val_i8_us;
    int v93 = v70 + i_010_us;
    bool v94 = v93 < v7;
    if(v94) {
        i_010_us = v93;
        goto v78;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v96 = v66 + j_011_us;
    bool v97 = v96 < v15;
    if(v97) {
        j_011_us = v96;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label100:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v103 = v57 / v35;
    if(v40) {
        goto v__crit_edge29;
    } else {
        goto v_lr_ph28;
    }
    v_lr_ph28:;
    long v105 = v103 * v35;
    long v106 = v57 - v105;
    long v107 = v39 * v106;
    long v108 = v37 * v103;
    int v109 = get_global_id(0);
    bool v110 = v109 > v6;
    int v111 = get_local_size(1);
    long v112 = v107 + v108;
        j1_025 = v32;
    goto v114;
    v_lr_ph14_split:;
    int v115 = v66 + j_011;
    bool v116 = v115 < v15;
    if(v116) {
        j_011 = v115;
        goto v_lr_ph14_split;
    } else {
        goto label100;
    }
    label118:;
        goto v__crit_edge29;
    v__crit_edge29:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v121 = p_030 + v20;
    bool v122 = v121 < numPlanes;
    if(v122) {
        p_030 = v121;
        goto v53;
    } else {
        goto label54;
    }
    v114:;
    if(v110) {
        goto v__crit_edge24;
    } else {
        goto v_preheader_lr_ph;
    }
    v_preheader_lr_ph:;
    int v125 = j1_025 + v9;
    long v126 = v125;
    long v127 = v45 * v126;
    int v128 = get_local_size(0);
    int v129 = j1_025 + v31;
    if(v41) {
        goto v_lr_ph20_us_preheader;
    } else {
        goto v_preheader_preheader;
    }
    v_preheader_preheader:;
        i2_022 = v109;
    goto v_preheader;
    v_lr_ph20_us_preheader:;
        i2_022_us = v109;
    goto v_lr_ph20_us;
    label133:;
    int v134 = l_019_us * kernelSizeX;
    int v135 = v129 + l_019_us;
    int v136 = v135 * v7;
    int v137 = v136 + i2_022_us;
    long v138 = v137;
    local float* v139 = (&(&_ZN5Eigen1sE)[0][v138]);
    local float* v140 = (v139);
    float v141 = v140[0];
    long v142 = v134;
    global float* v143 = (&_kernel[v142]);
    float v144 = v143[0];
    float v145 = v141 * v144;
    float v146 = result_018_us + v145;
    int v147 = v137 + 1;
    long v148 = v147;
    local float* v149 = (&(&_ZN5Eigen1sE)[0][v148]);
    local float* v150 = (v149);
    float v151 = v150[0];
    int v152 = v134 + 1;
    long v153 = v152;
    global float* v154 = (&_kernel[v153]);
    float v155 = v154[0];
    float v156 = v151 * v155;
    float v157 = v146 + v156;
    int v158 = v137 + 2;
    long v159 = v158;
    local float* v160 = (&(&_ZN5Eigen1sE)[0][v159]);
    local float* v161 = (v160);
    float v162 = v161[0];
    int v163 = v134 + 2;
    long v164 = v163;
    global float* v165 = (&_kernel[v164]);
    float v166 = v165[0];
    float v167 = v162 * v166;
    float v168 = v157 + v167;
    int v169 = v137 + 3;
    long v170 = v169;
    local float* v171 = (&(&_ZN5Eigen1sE)[0][v170]);
    local float* v172 = (v171);
    float v173 = v172[0];
    int v174 = v134 + 3;
    long v175 = v174;
    global float* v176 = (&_kernel[v175]);
    float v177 = v176[0];
    float v178 = v173 * v177;
    float v179 = v168 + v178;
    int v180 = l_019_us + 1;
    bool exitcond36 = v180 == kernelSizeY;
    if(exitcond36) {
        v_lcssa = v179;
        goto v__crit_edge21_us;
    } else {
        l_019_us = v180;
result_018_us = v179;
        goto label133;
    }
    v_lr_ph20_us:;
        l_019_us = 0;
result_018_us = 0.0f;
    goto label133;
    v__crit_edge21_us:;
    int v183 = i2_022_us + v2;
    long v184 = v183;
    long v185 = v43 * v184;
    long v186 = v112 + v185;
    long v187 = v186 + v127;
    long sext5_us = v187 << 32;
    long v188 = sext5_us >> 32;
    global float* v189 = (&buffer[v188]);
    v189[0] = v_lcssa;
    int v191 = v128 + i2_022_us;
    bool v192 = v191 > v6;
    if(v192) {
        goto v__crit_edge24_loopexit;
    } else {
        i2_022_us = v191;
        goto v_lr_ph20_us;
    }
    v__crit_edge24_loopexit:;
        goto v__crit_edge24;
    label195:;
        goto v__crit_edge24;
    v__crit_edge24:;
    int v197 = v111 + j1_025;
    bool v198 = v197 > v14;
    if(v198) {
        goto label118;
    } else {
        j1_025 = v197;
        goto v114;
    }
    v_preheader:;
    int v200 = i2_022 + v2;
    long v201 = v200;
    long v202 = v43 * v201;
    long v203 = v112 + v202;
    long v204 = v203 + v127;
    long sext5 = v204 << 32;
    long v205 = sext5 >> 32;
    global float* v206 = (&buffer[v205]);
    v206[0] = 0.0f;
    int v208 = v128 + i2_022;
    bool v209 = v208 > v6;
    if(v209) {
        goto label195;
    } else {
        i2_022 = v208;
        goto v_preheader;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELi4EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_40* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_020;
    int i_010_us;
    int j1_022;
    int j1_022_us;
    int j_011;
    int j_011_us;
    int p_027;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 7;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + 4;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph29;
    } else {
        goto v__crit_edge30;
    }
    v_lr_ph29:;
    global long* v25 = (&indexMapper[0].f2.f0[0]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[0]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[1]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[0]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[0]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    global long* v41 = (&indexMapper[0].f1.f0[2]);
    long v42 = v41[0];
    global long* v43 = (&indexMapper[0].f1.f0[3]);
    long v44 = v43[0];
    global long* v45 = (&indexMapper[0].f0.f0[2]);
    long v46 = v45[0];
    global long* v47 = (&indexMapper[0].f0.f0[3]);
    long v48 = v47[0];
    global float*global * v49 = (&eval[0].f0);
    global float* v50 = v49[0];
    global float* v51 = (&_kernel[1]);
    global float* v52 = (&_kernel[2]);
    global float* v53 = (&_kernel[3]);
    global float* v54 = (&_kernel[4]);
    global float* v55 = (&_kernel[5]);
    global float* v56 = (&_kernel[6]);
    long v57 = kernelSizeX;
    global float* v58 = (&_kernel[v57]);
    int v59 = kernelSizeX + 1;
    long v60 = v59;
    global float* v61 = (&_kernel[v60]);
    int v62 = kernelSizeX + 2;
    long v63 = v62;
    global float* v64 = (&_kernel[v63]);
    int v65 = kernelSizeX + 3;
    long v66 = v65;
    global float* v67 = (&_kernel[v66]);
    int v68 = kernelSizeX + 4;
    long v69 = v68;
    global float* v70 = (&_kernel[v69]);
    int v71 = kernelSizeX + 5;
    long v72 = v71;
    global float* v73 = (&_kernel[v72]);
    int v74 = kernelSizeX + 6;
    long v75 = v74;
    global float* v76 = (&_kernel[v75]);
    int v77 = kernelSizeX << 1;
    long v78 = v77;
    global float* v79 = (&_kernel[v78]);
    int v80 = v77 | 1;
    long v81 = v80;
    global float* v82 = (&_kernel[v81]);
    int v83 = v77 + 2;
    long v84 = v83;
    global float* v85 = (&_kernel[v84]);
    int v86 = v77 + 3;
    long v87 = v86;
    global float* v88 = (&_kernel[v87]);
    int v89 = v77 + 4;
    long v90 = v89;
    global float* v91 = (&_kernel[v90]);
    int v92 = v77 + 5;
    long v93 = v92;
    global float* v94 = (&_kernel[v93]);
    int v95 = v77 + 6;
    long v96 = v95;
    global float* v97 = (&_kernel[v96]);
    int v98 = kernelSizeX * 3;
    long v99 = v98;
    global float* v100 = (&_kernel[v99]);
    int v101 = v98 + 1;
    long v102 = v101;
    global float* v103 = (&_kernel[v102]);
    int v104 = v98 + 2;
    long v105 = v104;
    global float* v106 = (&_kernel[v105]);
    int v107 = v98 + 3;
    long v108 = v107;
    global float* v109 = (&_kernel[v108]);
    int v110 = v98 + 4;
    long v111 = v110;
    global float* v112 = (&_kernel[v111]);
    int v113 = v98 + 5;
    long v114 = v113;
    global float* v115 = (&_kernel[v114]);
    int v116 = v98 + 6;
    long v117 = v116;
    global float* v118 = (&_kernel[v117]);
        p_027 = v22;
    goto v120;
    label121:;
        goto v__crit_edge30;
    v__crit_edge30:;
    v120:;
    long v124 = p_027;
    long v125 = v124 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v127 = v125 * v26;
    long v128 = v124 - v127;
    long v129 = v30 * v128;
    long v130 = v28 * v125;
    int v131 = get_global_id(0);
    bool v132 = v131 < v7;
    int v133 = get_local_size(1);
    long v134 = v129 + v130;
    if(v132) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v137 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v139 = j_011_us + v31;
    int v140 = v139 * v7;
    int v141 = j_011_us + v9;
    long v142 = v141;
    long v143 = v48 * v142;
        i_010_us = v131;
    goto v145;
    v145:;
    int v146 = i_010_us + v2;
    long v147 = v146;
    long v148 = v46 * v147;
    long v149 = v134 + v148;
    long v150 = v149 + v143;
    long sext7_us = v150 << 32;
    long v151 = sext7_us >> 32;
    global float* v152 = (&v50[v151]);
    global int* v153 = ((global int*)v152);
    int v_val_i8_us = v153[0];
    int v154 = i_010_us + v140;
    long v155 = v154;
    local float* v156 = (&(&_ZN5Eigen1sE)[0][v155]);
    local int* v157 = ((local int*)v156);
    local int* v158 = (v157);
    v158[0] = v_val_i8_us;
    int v160 = v137 + i_010_us;
    bool v161 = v160 < v7;
    if(v161) {
        i_010_us = v160;
        goto v145;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v163 = v133 + j_011_us;
    bool v164 = v163 < v15;
    if(v164) {
        j_011_us = v163;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label167:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v170 = v124 / v35;
    if(v40) {
        goto v__crit_edge26;
    } else {
        goto v_lr_ph25;
    }
    v_lr_ph25:;
    long v172 = v170 * v35;
    long v173 = v124 - v172;
    long v174 = v39 * v173;
    long v175 = v37 * v170;
    int v176 = get_global_id(0);
    bool v177 = v176 > v6;
    int v178 = get_local_size(1);
    long v179 = v174 + v175;
    if(v177) {
        goto v_lr_ph25_split_us_preheader;
    } else {
        goto v_preheader_lr_ph_preheader;
    }
    v_lr_ph25_split_us_preheader:;
        j1_022_us = v32;
    goto v_lr_ph25_split_us;
    v_preheader_lr_ph_preheader:;
    int v182 = get_local_size(0);
    float v183 = _kernel[0];
    float v184 = v51[0];
    float v185 = v52[0];
    float v186 = v53[0];
    float v187 = v54[0];
    float v188 = v55[0];
    float v189 = v56[0];
    float v190 = v58[0];
    float v191 = v61[0];
    float v192 = v64[0];
    float v193 = v67[0];
    float v194 = v70[0];
    float v195 = v73[0];
    float v196 = v76[0];
    float v197 = v79[0];
    float v198 = v82[0];
    float v199 = v85[0];
    float v200 = v88[0];
    float v201 = v91[0];
    float v202 = v94[0];
    float v203 = v97[0];
    float v204 = v100[0];
    float v205 = v103[0];
    float v206 = v106[0];
    float v207 = v109[0];
    float v208 = v112[0];
    float v209 = v115[0];
    float v210 = v118[0];
        j1_022 = v32;
    goto v_preheader_lr_ph;
    v_lr_ph25_split_us:;
    int v212 = v178 + j1_022_us;
    bool v213 = v212 > v14;
    if(v213) {
        goto v__crit_edge26_loopexit;
    } else {
        j1_022_us = v212;
        goto v_lr_ph25_split_us;
    }
    v_lr_ph14_split:;
    int v215 = v133 + j_011;
    bool v216 = v215 < v15;
    if(v216) {
        j_011 = v215;
        goto v_lr_ph14_split;
    } else {
        goto label167;
    }
    v__crit_edge26_loopexit:;
        goto v__crit_edge26;
    label219:;
        goto v__crit_edge26;
    v__crit_edge26:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v222 = p_027 + v20;
    bool v223 = v222 < numPlanes;
    if(v223) {
        p_027 = v222;
        goto v120;
    } else {
        goto label121;
    }
    v_preheader_lr_ph:;
    int v225 = j1_022 + v31;
    int v226 = j1_022 + v9;
    long v227 = v226;
    long v228 = v44 * v227;
    int v229 = v225 + 3;
    int v230 = v229 * v7;
    int v231 = v225 * v7;
    int v232 = v225 + 1;
    int v233 = v232 * v7;
    int v234 = v225 + 2;
    int v235 = v234 * v7;
        i2_020 = v176;
    goto v_preheader;
    v_preheader:;
    int v237 = v231 + i2_020;
    long v238 = v237;
    local float* v239 = (&(&_ZN5Eigen1sE)[0][v238]);
    local float* v240 = (v239);
    float v241 = v240[0];
    float v242 = v241 * v183;
    float v243 = v242 + 0.0f;
    int v244 = v237 + 1;
    long v245 = v244;
    local float* v246 = (&(&_ZN5Eigen1sE)[0][v245]);
    local float* v247 = (v246);
    float v248 = v247[0];
    float v249 = v248 * v184;
    float v250 = v243 + v249;
    int v251 = v237 + 2;
    long v252 = v251;
    local float* v253 = (&(&_ZN5Eigen1sE)[0][v252]);
    local float* v254 = (v253);
    float v255 = v254[0];
    float v256 = v255 * v185;
    float v257 = v250 + v256;
    int v258 = v237 + 3;
    long v259 = v258;
    local float* v260 = (&(&_ZN5Eigen1sE)[0][v259]);
    local float* v261 = (v260);
    float v262 = v261[0];
    float v263 = v262 * v186;
    float v264 = v257 + v263;
    int v265 = v237 + 4;
    long v266 = v265;
    local float* v267 = (&(&_ZN5Eigen1sE)[0][v266]);
    local float* v268 = (v267);
    float v269 = v268[0];
    float v270 = v269 * v187;
    float v271 = v264 + v270;
    int v272 = v237 + 5;
    long v273 = v272;
    local float* v274 = (&(&_ZN5Eigen1sE)[0][v273]);
    local float* v275 = (v274);
    float v276 = v275[0];
    float v277 = v276 * v188;
    float v278 = v271 + v277;
    int v279 = v237 + 6;
    long v280 = v279;
    local float* v281 = (&(&_ZN5Eigen1sE)[0][v280]);
    local float* v282 = (v281);
    float v283 = v282[0];
    float v284 = v283 * v189;
    float v285 = v278 + v284;
    int v286 = v233 + i2_020;
    long v287 = v286;
    local float* v288 = (&(&_ZN5Eigen1sE)[0][v287]);
    local float* v289 = (v288);
    float v290 = v289[0];
    float v291 = v290 * v190;
    float v292 = v285 + v291;
    int v293 = v286 + 1;
    long v294 = v293;
    local float* v295 = (&(&_ZN5Eigen1sE)[0][v294]);
    local float* v296 = (v295);
    float v297 = v296[0];
    float v298 = v297 * v191;
    float v299 = v292 + v298;
    int v300 = v286 + 2;
    long v301 = v300;
    local float* v302 = (&(&_ZN5Eigen1sE)[0][v301]);
    local float* v303 = (v302);
    float v304 = v303[0];
    float v305 = v304 * v192;
    float v306 = v299 + v305;
    int v307 = v286 + 3;
    long v308 = v307;
    local float* v309 = (&(&_ZN5Eigen1sE)[0][v308]);
    local float* v310 = (v309);
    float v311 = v310[0];
    float v312 = v311 * v193;
    float v313 = v306 + v312;
    int v314 = v286 + 4;
    long v315 = v314;
    local float* v316 = (&(&_ZN5Eigen1sE)[0][v315]);
    local float* v317 = (v316);
    float v318 = v317[0];
    float v319 = v318 * v194;
    float v320 = v313 + v319;
    int v321 = v286 + 5;
    long v322 = v321;
    local float* v323 = (&(&_ZN5Eigen1sE)[0][v322]);
    local float* v324 = (v323);
    float v325 = v324[0];
    float v326 = v325 * v195;
    float v327 = v320 + v326;
    int v328 = v286 + 6;
    long v329 = v328;
    local float* v330 = (&(&_ZN5Eigen1sE)[0][v329]);
    local float* v331 = (v330);
    float v332 = v331[0];
    float v333 = v332 * v196;
    float v334 = v327 + v333;
    int v335 = v235 + i2_020;
    long v336 = v335;
    local float* v337 = (&(&_ZN5Eigen1sE)[0][v336]);
    local float* v338 = (v337);
    float v339 = v338[0];
    float v340 = v339 * v197;
    float v341 = v334 + v340;
    int v342 = v335 + 1;
    long v343 = v342;
    local float* v344 = (&(&_ZN5Eigen1sE)[0][v343]);
    local float* v345 = (v344);
    float v346 = v345[0];
    float v347 = v346 * v198;
    float v348 = v341 + v347;
    int v349 = v335 + 2;
    long v350 = v349;
    local float* v351 = (&(&_ZN5Eigen1sE)[0][v350]);
    local float* v352 = (v351);
    float v353 = v352[0];
    float v354 = v353 * v199;
    float v355 = v348 + v354;
    int v356 = v335 + 3;
    long v357 = v356;
    local float* v358 = (&(&_ZN5Eigen1sE)[0][v357]);
    local float* v359 = (v358);
    float v360 = v359[0];
    float v361 = v360 * v200;
    float v362 = v355 + v361;
    int v363 = v335 + 4;
    long v364 = v363;
    local float* v365 = (&(&_ZN5Eigen1sE)[0][v364]);
    local float* v366 = (v365);
    float v367 = v366[0];
    float v368 = v367 * v201;
    float v369 = v362 + v368;
    int v370 = v335 + 5;
    long v371 = v370;
    local float* v372 = (&(&_ZN5Eigen1sE)[0][v371]);
    local float* v373 = (v372);
    float v374 = v373[0];
    float v375 = v374 * v202;
    float v376 = v369 + v375;
    int v377 = v335 + 6;
    long v378 = v377;
    local float* v379 = (&(&_ZN5Eigen1sE)[0][v378]);
    local float* v380 = (v379);
    float v381 = v380[0];
    float v382 = v381 * v203;
    float v383 = v376 + v382;
    int v384 = v230 + i2_020;
    long v385 = v384;
    local float* v386 = (&(&_ZN5Eigen1sE)[0][v385]);
    local float* v387 = (v386);
    float v388 = v387[0];
    float v389 = v388 * v204;
    float v390 = v383 + v389;
    int v391 = v384 + 1;
    long v392 = v391;
    local float* v393 = (&(&_ZN5Eigen1sE)[0][v392]);
    local float* v394 = (v393);
    float v395 = v394[0];
    float v396 = v395 * v205;
    float v397 = v390 + v396;
    int v398 = v384 + 2;
    long v399 = v398;
    local float* v400 = (&(&_ZN5Eigen1sE)[0][v399]);
    local float* v401 = (v400);
    float v402 = v401[0];
    float v403 = v402 * v206;
    float v404 = v397 + v403;
    int v405 = v384 + 3;
    long v406 = v405;
    local float* v407 = (&(&_ZN5Eigen1sE)[0][v406]);
    local float* v408 = (v407);
    float v409 = v408[0];
    float v410 = v409 * v207;
    float v411 = v404 + v410;
    int v412 = v384 + 4;
    long v413 = v412;
    local float* v414 = (&(&_ZN5Eigen1sE)[0][v413]);
    local float* v415 = (v414);
    float v416 = v415[0];
    float v417 = v416 * v208;
    float v418 = v411 + v417;
    int v419 = v384 + 5;
    long v420 = v419;
    local float* v421 = (&(&_ZN5Eigen1sE)[0][v420]);
    local float* v422 = (v421);
    float v423 = v422[0];
    float v424 = v423 * v209;
    float v425 = v418 + v424;
    int v426 = v384 + 6;
    long v427 = v426;
    local float* v428 = (&(&_ZN5Eigen1sE)[0][v427]);
    local float* v429 = (v428);
    float v430 = v429[0];
    float v431 = v430 * v210;
    float v432 = v425 + v431;
    int v433 = i2_020 + v2;
    long v434 = v433;
    long v435 = v42 * v434;
    long v436 = v179 + v435;
    long v437 = v436 + v228;
    long sext5 = v437 << 32;
    long v438 = sext5 >> 32;
    global float* v439 = (&buffer[v438]);
    v439[0] = v432;
    int v441 = v182 + i2_020;
    bool v442 = v441 > v6;
    if(v442) {
        goto v__crit_edge21;
    } else {
        i2_020 = v441;
        goto v_preheader;
    }
    v__crit_edge21:;
    int v444 = v178 + j1_022;
    bool v445 = v444 > v14;
    if(v445) {
        goto label219;
    } else {
        j1_022 = v444;
        goto v_preheader_lr_ph;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELi7ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_40* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_022;
    int i2_022_us;
    int i_010_us;
    int j1_025;
    int j_011;
    int j_011_us;
    int l_019_us;
    int p_030;
    float result_018_us;
    float v_lcssa;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + 7;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + kernelSizeY;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph32;
    } else {
        goto v__crit_edge33;
    }
    v_lr_ph32:;
    global long* v25 = (&indexMapper[0].f2.f0[0]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[0]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[1]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[0]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[0]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    bool v41 = kernelSizeY > 0;
    global long* v42 = (&indexMapper[0].f1.f0[2]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f1.f0[3]);
    long v45 = v44[0];
    global long* v46 = (&indexMapper[0].f0.f0[2]);
    long v47 = v46[0];
    global long* v48 = (&indexMapper[0].f0.f0[3]);
    long v49 = v48[0];
    global float*global * v50 = (&eval[0].f0);
    global float* v51 = v50[0];
        p_030 = v22;
    goto v53;
    label54:;
        goto v__crit_edge33;
    v__crit_edge33:;
    v53:;
    long v57 = p_030;
    long v58 = v57 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v60 = v58 * v26;
    long v61 = v57 - v60;
    long v62 = v30 * v61;
    long v63 = v28 * v58;
    int v64 = get_global_id(0);
    bool v65 = v64 < v7;
    int v66 = get_local_size(1);
    long v67 = v62 + v63;
    if(v65) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v70 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v72 = j_011_us + v31;
    int v73 = v72 * v7;
    int v74 = j_011_us + v9;
    long v75 = v74;
    long v76 = v49 * v75;
        i_010_us = v64;
    goto v78;
    v78:;
    int v79 = i_010_us + v2;
    long v80 = v79;
    long v81 = v47 * v80;
    long v82 = v67 + v81;
    long v83 = v82 + v76;
    long sext7_us = v83 << 32;
    long v84 = sext7_us >> 32;
    global float* v85 = (&v51[v84]);
    global int* v86 = ((global int*)v85);
    int v_val_i8_us = v86[0];
    int v87 = i_010_us + v73;
    long v88 = v87;
    local float* v89 = (&(&_ZN5Eigen1sE)[0][v88]);
    local int* v90 = ((local int*)v89);
    local int* v91 = (v90);
    v91[0] = v_val_i8_us;
    int v93 = v70 + i_010_us;
    bool v94 = v93 < v7;
    if(v94) {
        i_010_us = v93;
        goto v78;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v96 = v66 + j_011_us;
    bool v97 = v96 < v15;
    if(v97) {
        j_011_us = v96;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label100:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v103 = v57 / v35;
    if(v40) {
        goto v__crit_edge29;
    } else {
        goto v_lr_ph28;
    }
    v_lr_ph28:;
    long v105 = v103 * v35;
    long v106 = v57 - v105;
    long v107 = v39 * v106;
    long v108 = v37 * v103;
    int v109 = get_global_id(0);
    bool v110 = v109 > v6;
    int v111 = get_local_size(1);
    long v112 = v107 + v108;
        j1_025 = v32;
    goto v114;
    v_lr_ph14_split:;
    int v115 = v66 + j_011;
    bool v116 = v115 < v15;
    if(v116) {
        j_011 = v115;
        goto v_lr_ph14_split;
    } else {
        goto label100;
    }
    label118:;
        goto v__crit_edge29;
    v__crit_edge29:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v121 = p_030 + v20;
    bool v122 = v121 < numPlanes;
    if(v122) {
        p_030 = v121;
        goto v53;
    } else {
        goto label54;
    }
    v114:;
    if(v110) {
        goto v__crit_edge24;
    } else {
        goto v_preheader_lr_ph;
    }
    v_preheader_lr_ph:;
    int v125 = j1_025 + v9;
    long v126 = v125;
    long v127 = v45 * v126;
    int v128 = get_local_size(0);
    int v129 = j1_025 + v31;
    if(v41) {
        goto v_lr_ph20_us_preheader;
    } else {
        goto v_preheader_preheader;
    }
    v_preheader_preheader:;
        i2_022 = v109;
    goto v_preheader;
    v_lr_ph20_us_preheader:;
        i2_022_us = v109;
    goto v_lr_ph20_us;
    label133:;
    int v134 = l_019_us * kernelSizeX;
    int v135 = v129 + l_019_us;
    int v136 = v135 * v7;
    int v137 = v136 + i2_022_us;
    long v138 = v137;
    local float* v139 = (&(&_ZN5Eigen1sE)[0][v138]);
    local float* v140 = (v139);
    float v141 = v140[0];
    long v142 = v134;
    global float* v143 = (&_kernel[v142]);
    float v144 = v143[0];
    float v145 = v141 * v144;
    float v146 = result_018_us + v145;
    int v147 = v137 + 1;
    long v148 = v147;
    local float* v149 = (&(&_ZN5Eigen1sE)[0][v148]);
    local float* v150 = (v149);
    float v151 = v150[0];
    int v152 = v134 + 1;
    long v153 = v152;
    global float* v154 = (&_kernel[v153]);
    float v155 = v154[0];
    float v156 = v151 * v155;
    float v157 = v146 + v156;
    int v158 = v137 + 2;
    long v159 = v158;
    local float* v160 = (&(&_ZN5Eigen1sE)[0][v159]);
    local float* v161 = (v160);
    float v162 = v161[0];
    int v163 = v134 + 2;
    long v164 = v163;
    global float* v165 = (&_kernel[v164]);
    float v166 = v165[0];
    float v167 = v162 * v166;
    float v168 = v157 + v167;
    int v169 = v137 + 3;
    long v170 = v169;
    local float* v171 = (&(&_ZN5Eigen1sE)[0][v170]);
    local float* v172 = (v171);
    float v173 = v172[0];
    int v174 = v134 + 3;
    long v175 = v174;
    global float* v176 = (&_kernel[v175]);
    float v177 = v176[0];
    float v178 = v173 * v177;
    float v179 = v168 + v178;
    int v180 = v137 + 4;
    long v181 = v180;
    local float* v182 = (&(&_ZN5Eigen1sE)[0][v181]);
    local float* v183 = (v182);
    float v184 = v183[0];
    int v185 = v134 + 4;
    long v186 = v185;
    global float* v187 = (&_kernel[v186]);
    float v188 = v187[0];
    float v189 = v184 * v188;
    float v190 = v179 + v189;
    int v191 = v137 + 5;
    long v192 = v191;
    local float* v193 = (&(&_ZN5Eigen1sE)[0][v192]);
    local float* v194 = (v193);
    float v195 = v194[0];
    int v196 = v134 + 5;
    long v197 = v196;
    global float* v198 = (&_kernel[v197]);
    float v199 = v198[0];
    float v200 = v195 * v199;
    float v201 = v190 + v200;
    int v202 = v137 + 6;
    long v203 = v202;
    local float* v204 = (&(&_ZN5Eigen1sE)[0][v203]);
    local float* v205 = (v204);
    float v206 = v205[0];
    int v207 = v134 + 6;
    long v208 = v207;
    global float* v209 = (&_kernel[v208]);
    float v210 = v209[0];
    float v211 = v206 * v210;
    float v212 = v201 + v211;
    int v213 = l_019_us + 1;
    bool exitcond36 = v213 == kernelSizeY;
    if(exitcond36) {
        v_lcssa = v212;
        goto v__crit_edge21_us;
    } else {
        l_019_us = v213;
result_018_us = v212;
        goto label133;
    }
    v_lr_ph20_us:;
        l_019_us = 0;
result_018_us = 0.0f;
    goto label133;
    v__crit_edge21_us:;
    int v216 = i2_022_us + v2;
    long v217 = v216;
    long v218 = v43 * v217;
    long v219 = v112 + v218;
    long v220 = v219 + v127;
    long sext5_us = v220 << 32;
    long v221 = sext5_us >> 32;
    global float* v222 = (&buffer[v221]);
    v222[0] = v_lcssa;
    int v224 = v128 + i2_022_us;
    bool v225 = v224 > v6;
    if(v225) {
        goto v__crit_edge24_loopexit;
    } else {
        i2_022_us = v224;
        goto v_lr_ph20_us;
    }
    v__crit_edge24_loopexit:;
        goto v__crit_edge24;
    label228:;
        goto v__crit_edge24;
    v__crit_edge24:;
    int v230 = v111 + j1_025;
    bool v231 = v230 > v14;
    if(v231) {
        goto label118;
    } else {
        j1_025 = v230;
        goto v114;
    }
    v_preheader:;
    int v233 = i2_022 + v2;
    long v234 = v233;
    long v235 = v43 * v234;
    long v236 = v112 + v235;
    long v237 = v236 + v127;
    long sext5 = v237 << 32;
    long v238 = sext5 >> 32;
    global float* v239 = (&buffer[v238]);
    v239[0] = 0.0f;
    int v241 = v128 + i2_022;
    bool v242 = v241 > v6;
    if(v242) {
        goto label228;
    } else {
        i2_022 = v241;
        goto v_preheader;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel2DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEELin1ELin1EEEvT_NS_8internal11IndexMapperIT0_T1_Li2EXsrSB_6LayoutEEEPKfiiiiiiiPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_40* indexMapper, global float* _kernel, int numPlanes, int numX, int maxX, int numY, int maxY, int kernelSizeX, int kernelSizeY, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i2_026;
    int i2_026_us;
    int i_010_us;
    int j1_029;
    int j_011;
    int j_011_us;
    int k_017_us_us;
    int k_017_us_us_unr;
    int l_022_us_us;
    int p_034;
    float result_021_us_us;
    float result_116_us_us;
    float result_116_us_us_unr;
    float split25_us;
    float v_lcssa;
    float v_lcssa63;
    float v_lcssa_lcssa;
    float v_lcssa_unr;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    int v2 = v1 * maxX;
    int v3 = v2 + maxX;
    bool v4 = v3 < numX;
    int v_numX = v4 ? v3 : numX;
    int v5 = v2 ^ -1;
    int v6 = v_numX + v5;
    int v7 = v6 + kernelSizeX;
    int v8 = get_group_id(1);
    int v9 = v8 * maxY;
    int v10 = v9 + maxY;
    bool v11 = v10 < numY;
    int v12 = v11 ? v10 : numY;
    int v13 = v9 ^ -1;
    int v14 = v12 + v13;
    int v15 = v14 + kernelSizeY;
    int v16 = get_group_id(2);
    int v17 = get_local_size(2);
    int v18 = v17 * v16;
    int v19 = get_num_groups(2);
    int v20 = v19 * v17;
    int v21 = get_global_id(2);
    int v22 = v21 + v18;
    bool v23 = v22 < numPlanes;
    if(v23) {
        goto v_lr_ph36;
    } else {
        goto v__crit_edge37;
    }
    v_lr_ph36:;
    global long* v25 = (&indexMapper[0].f2.f0[0]);
    long v26 = v25[0];
    global long* v27 = (&indexMapper[0].f0.f0[0]);
    long v28 = v27[0];
    global long* v29 = (&indexMapper[0].f0.f0[1]);
    long v30 = v29[0];
    int v31 = v15 * v21;
    int v32 = get_global_id(1);
    bool v33 = v32 < v15;
    global long* v34 = (&indexMapper[0].f3.f0[0]);
    long v35 = v34[0];
    global long* v36 = (&indexMapper[0].f1.f0[0]);
    long v37 = v36[0];
    global long* v38 = (&indexMapper[0].f1.f0[1]);
    long v39 = v38[0];
    bool v40 = v32 > v14;
    bool v41 = kernelSizeY > 0;
    global long* v42 = (&indexMapper[0].f1.f0[2]);
    long v43 = v42[0];
    global long* v44 = (&indexMapper[0].f1.f0[3]);
    long v45 = v44[0];
    bool v46 = kernelSizeX > 0;
    global long* v47 = (&indexMapper[0].f0.f0[2]);
    long v48 = v47[0];
    global long* v49 = (&indexMapper[0].f0.f0[3]);
    long v50 = v49[0];
    global float*global * v51 = (&eval[0].f0);
    global float* v52 = v51[0];
    int xtraiter = kernelSizeX & 1;
    bool lcmp_mod = xtraiter == 0;
    bool v53 = kernelSizeX == 1;
        p_034 = v22;
    goto v55;
    label56:;
        goto v__crit_edge37;
    v__crit_edge37:;
    v55:;
    long v59 = p_034;
    long v60 = v59 / v26;
    if(v33) {
        goto v_lr_ph14;
    } else {
        goto v__crit_edge15;
    }
    v_lr_ph14:;
    long v62 = v60 * v26;
    long v63 = v59 - v62;
    long v64 = v30 * v63;
    long v65 = v28 * v60;
    int v66 = get_global_id(0);
    bool v67 = v66 < v7;
    int v68 = get_local_size(1);
    long v69 = v64 + v65;
    if(v67) {
        goto v_lr_ph14_split_us_preheader;
    } else {
        goto v_lr_ph14_split_preheader;
    }
    v_lr_ph14_split_preheader:;
        j_011 = v32;
    goto v_lr_ph14_split;
    v_lr_ph14_split_us_preheader:;
    int v72 = get_local_size(0);
        j_011_us = v32;
    goto v_lr_ph14_split_us;
    v_lr_ph14_split_us:;
    int v74 = j_011_us + v31;
    int v75 = v74 * v7;
    int v76 = j_011_us + v9;
    long v77 = v76;
    long v78 = v50 * v77;
        i_010_us = v66;
    goto v80;
    v80:;
    int v81 = i_010_us + v2;
    long v82 = v81;
    long v83 = v48 * v82;
    long v84 = v69 + v83;
    long v85 = v84 + v78;
    long sext7_us = v85 << 32;
    long v86 = sext7_us >> 32;
    global float* v87 = (&v52[v86]);
    global int* v88 = ((global int*)v87);
    int v_val_i8_us = v88[0];
    int v89 = i_010_us + v75;
    long v90 = v89;
    local float* v91 = (&(&_ZN5Eigen1sE)[0][v90]);
    local int* v92 = ((local int*)v91);
    local int* v93 = (v92);
    v93[0] = v_val_i8_us;
    int v95 = v72 + i_010_us;
    bool v96 = v95 < v7;
    if(v96) {
        i_010_us = v95;
        goto v80;
    } else {
        goto v__crit_edge_us;
    }
    v__crit_edge_us:;
    int v98 = v68 + j_011_us;
    bool v99 = v98 < v15;
    if(v99) {
        j_011_us = v98;
        goto v_lr_ph14_split_us;
    } else {
        goto v__crit_edge15_loopexit;
    }
    v__crit_edge15_loopexit:;
        goto v__crit_edge15;
    label102:;
        goto v__crit_edge15;
    v__crit_edge15:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v105 = v59 / v35;
    if(v40) {
        goto v__crit_edge33;
    } else {
        goto v_lr_ph32;
    }
    v_lr_ph32:;
    long v107 = v105 * v35;
    long v108 = v59 - v107;
    long v109 = v39 * v108;
    long v110 = v37 * v105;
    int v111 = get_global_id(0);
    bool v112 = v111 > v6;
    int v113 = get_local_size(1);
    long v114 = v109 + v110;
        j1_029 = v32;
    goto v116;
    v_lr_ph14_split:;
    int v117 = v68 + j_011;
    bool v118 = v117 < v15;
    if(v118) {
        j_011 = v117;
        goto v_lr_ph14_split;
    } else {
        goto label102;
    }
    label120:;
        goto v__crit_edge33;
    v__crit_edge33:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v123 = p_034 + v20;
    bool v124 = v123 < numPlanes;
    if(v124) {
        p_034 = v123;
        goto v55;
    } else {
        goto label56;
    }
    v116:;
    if(v112) {
        goto v__crit_edge28;
    } else {
        goto v_preheader_lr_ph;
    }
    v_preheader_lr_ph:;
    int v127 = j1_029 + v9;
    long v128 = v127;
    long v129 = v45 * v128;
    int v130 = get_local_size(0);
    int v131 = j1_029 + v31;
    if(v41) {
        goto v_lr_ph23_us_preheader;
    } else {
        goto v_preheader_preheader;
    }
    v_preheader_preheader:;
        i2_026 = v111;
    goto v_preheader;
    v_lr_ph23_us_preheader:;
        i2_026_us = v111;
    goto v_lr_ph23_us;
    v_lr_ph23_us:;
    if(v46) {
        goto v_lr_ph19_us_us_preheader;
    } else {
        split25_us = 0.0f;
        goto v__crit_edge24_us;
    }
    v_lr_ph19_us_us_preheader:;
        l_022_us_us = 0;
result_021_us_us = 0.0f;
    goto v_lr_ph19_us_us;
    label137:;
        split25_us = v_lcssa_lcssa;
    goto v__crit_edge24_us;
    v__crit_edge24_us:;
    int v139 = i2_026_us + v2;
    long v140 = v139;
    long v141 = v43 * v140;
    long v142 = v114 + v141;
    long v143 = v142 + v129;
    long sext5_us = v143 << 32;
    long v144 = sext5_us >> 32;
    global float* v145 = (&buffer[v144]);
    v145[0] = split25_us;
    int v147 = v130 + i2_026_us;
    bool v148 = v147 > v6;
    if(v148) {
        goto v__crit_edge28_loopexit;
    } else {
        i2_026_us = v147;
        goto v_lr_ph23_us;
    }
    v_lr_ph19_us_us:;
    int v150 = l_022_us_us * kernelSizeX;
    int v151 = v131 + l_022_us_us;
    int v152 = v151 * v7;
    int v153 = v152 + i2_026_us;
    if(lcmp_mod) {
        k_017_us_us_unr = 0;
result_116_us_us_unr = result_021_us_us;
        goto v_lr_ph19_us_us_split;
    } else {
        goto v155;
    }
    v155:;
    long v156 = v153;
    local float* v157 = (&(&_ZN5Eigen1sE)[0][v156]);
    local float* v158 = (v157);
    float v159 = v158[0];
    long v160 = v150;
    global float* v161 = (&_kernel[v160]);
    float v162 = v161[0];
    float v163 = v159 * v162;
    float v164 = result_021_us_us + v163;
        k_017_us_us_unr = 1;
result_116_us_us_unr = v164;
v_lcssa_unr = v164;
    goto v_lr_ph19_us_us_split;
    v_lr_ph19_us_us_split:;
    if(v53) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge20_us_us;
    } else {
        goto v_lr_ph19_us_us_split_split_preheader;
    }
    v_lr_ph19_us_us_split_split_preheader:;
        k_017_us_us = k_017_us_us_unr;
result_116_us_us = result_116_us_us_unr;
    goto v_lr_ph19_us_us_split_split;
    label168:;
        v_lcssa = v_lcssa63;
    goto v__crit_edge20_us_us;
    v__crit_edge20_us_us:;
    int v170 = l_022_us_us + 1;
    bool exitcond53 = v170 == kernelSizeY;
    if(exitcond53) {
        v_lcssa_lcssa = v_lcssa;
        goto label137;
    } else {
        l_022_us_us = v170;
result_021_us_us = v_lcssa;
        goto v_lr_ph19_us_us;
    }
    v_lr_ph19_us_us_split_split:;
    int v172 = v153 + k_017_us_us;
    long v173 = v172;
    local float* v174 = (&(&_ZN5Eigen1sE)[0][v173]);
    local float* v175 = (v174);
    float v176 = v175[0];
    int v177 = k_017_us_us + v150;
    long v178 = v177;
    global float* v179 = (&_kernel[v178]);
    float v180 = v179[0];
    float v181 = v176 * v180;
    float v182 = result_116_us_us + v181;
    int v183 = k_017_us_us + 1;
    int v184 = v153 + v183;
    long v185 = v184;
    local float* v186 = (&(&_ZN5Eigen1sE)[0][v185]);
    local float* v187 = (v186);
    float v188 = v187[0];
    int v189 = v183 + v150;
    long v190 = v189;
    global float* v191 = (&_kernel[v190]);
    float v192 = v191[0];
    float v193 = v188 * v192;
    float v194 = v182 + v193;
    int v195 = k_017_us_us + 2;
    bool exitcond52_1 = v195 == kernelSizeX;
    if(exitcond52_1) {
        v_lcssa63 = v194;
        goto label168;
    } else {
        k_017_us_us = v195;
result_116_us_us = v194;
        goto v_lr_ph19_us_us_split_split;
    }
    v__crit_edge28_loopexit:;
        goto v__crit_edge28;
    label198:;
        goto v__crit_edge28;
    v__crit_edge28:;
    int v200 = v113 + j1_029;
    bool v201 = v200 > v14;
    if(v201) {
        goto label120;
    } else {
        j1_029 = v200;
        goto v116;
    }
    v_preheader:;
    int v203 = i2_026 + v2;
    long v204 = v203;
    long v205 = v43 * v204;
    long v206 = v114 + v205;
    long v207 = v206 + v129;
    long sext5 = v207 << 32;
    long v208 = sext5 >> 32;
    global float* v209 = (&buffer[v208]);
    v209[0] = 0.0f;
    int v211 = v130 + i2_026;
    bool v212 = v211 > v6;
    if(v212) {
        goto label198;
    } else {
        i2_026 = v211;
        goto v_preheader;
    }
}

kernel void _ZN5Eigen24EigenConvolutionKernel3DINS_15TensorEvaluatorIKNS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEENS_9GpuDeviceEEElNS_6DSizesIlLi4EEEEEvT_NS_8internal11IndexMapperIT0_T1_Li3EXsrSB_6LayoutEEEPKfmmmmmmmmmmPf(global struct Eigen__TensorEvaluator_38* eval, global float* eval_ptr0, global struct class_Eigen__internal__IndexMapper_41* indexMapper, global float* _kernel, long numPlanes, long numX, long maxX, long numY, long maxY, long numZ, long maxZ, long kernelSizeX, long kernelSizeY, long kernelSizeZ, global float* buffer) {
    local float _ZN5Eigen1sE[0];
    int i3_039;
    int i_014_us_us;
    int j2_042;
    int j_015_us56;
    int j_015_us_us;
    int k1_047;
    int k_020;
    int k_020_us;
    int l_026_us_us;
    int l_026_us_us_unr;
    int m_030_us_us;
    int n_035_us;
    int p_052;
    float result_034_us;
    float result_0_lcssa;
    float result_129_us_us;
    float result_225_us_us;
    float result_225_us_us_unr;
    float split33_us;
    float split33_us_lcssa;
    long v175;
    long v182;
    long v208;
    long v69;
    float v_lcssa;
    float v_lcssa88;
    float v_lcssa_lcssa;
    float v_lcssa_unr;
    long v_unr;
eval[0].f0 = eval_ptr0;

    label0:;
    int v1 = get_group_id(0);
    long v2 = v1;
    long v3 = v2 * maxX;
    int v4 = (int)v3;
    long sext = v3 << 32;
    long v5 = sext >> 32;
    long v6 = v5 + maxX;
    bool v7 = v6 < numX;
    long v_numX = v7 ? v6 : numX;
    long v8 = v_numX + 4294967295;
    int v9 = (int)v8;
    int v10 = v9 - v4;
    long v11 = v10;
    long v12 = v11 + kernelSizeX;
    int v13 = (int)v12;
    int v14 = get_group_id(1);
    long v15 = v14;
    long v16 = v15 * maxY;
    int v17 = (int)v16;
    long sext5 = v16 << 32;
    long v18 = sext5 >> 32;
    long v19 = v18 + maxY;
    bool v20 = v19 < numY;
    long v21 = v20 ? v19 : numY;
    long v22 = v21 + 4294967295;
    int v23 = (int)v22;
    int v24 = v23 - v17;
    long v25 = v24;
    long v26 = v25 + kernelSizeY;
    int v27 = (int)v26;
    int v28 = get_group_id(2);
    long v29 = v28;
    long v30 = v29 * maxZ;
    int v31 = (int)v30;
    long sext6 = v30 << 32;
    long v32 = sext6 >> 32;
    long v33 = v32 + maxZ;
    bool v34 = v33 < numZ;
    long v_numZ = v34 ? v33 : numZ;
    long v35 = v_numZ + 4294967295;
    int v36 = (int)v35;
    int v37 = v36 - v31;
    long v38 = v37;
    long v39 = v38 + kernelSizeZ;
    int v40 = (int)v39;
    bool v41 = numPlanes == 0;
    if(v41) {
        goto v__crit_edge55;
    } else {
        goto v_lr_ph54;
    }
    v_lr_ph54:;
    global long* v43 = (&indexMapper[0].f0.f0[0]);
    long v44 = v43[0];
    int v45 = get_global_id(2);
    bool v46 = v45 < v40;
    global long* v47 = (&indexMapper[0].f1.f0[0]);
    long v48 = v47[0];
    bool v49 = v45 > v37;
    bool v50 = kernelSizeZ == 0;
    global long* v51 = (&indexMapper[0].f1.f0[1]);
    long v52 = v51[0];
    global long* v53 = (&indexMapper[0].f1.f0[2]);
    long v54 = v53[0];
    global long* v55 = (&indexMapper[0].f1.f0[3]);
    long v56 = v55[0];
    bool v57 = kernelSizeY == 0;
    bool v58 = kernelSizeX == 0;
    global long* v59 = (&indexMapper[0].f0.f0[1]);
    long v60 = v59[0];
    global long* v61 = (&indexMapper[0].f0.f0[2]);
    long v62 = v61[0];
    global long* v63 = (&indexMapper[0].f0.f0[3]);
    long v64 = v63[0];
    global float*global * v65 = (&eval[0].f0);
    global float* v66 = v65[0];
    bool brmerge = v50 | v57;
    long xtraiter = kernelSizeX & 1;
    bool lcmp_mod = xtraiter == 0;
    bool v67 = kernelSizeX == 1;
        v69 = 0;
p_052 = 0;
    goto v70;
    label71:;
        goto v__crit_edge55;
    v__crit_edge55:;
    v70:;
    long v74 = v44 * v69;
    if(v46) {
        goto v_lr_ph23;
    } else {
        goto v__crit_edge24;
    }
    v_lr_ph23:;
    int v76 = get_global_id(1);
    bool v77 = v76 < v27;
    int v78 = get_local_size(2);
    if(v77) {
        goto v_lr_ph18_us_preheader;
    } else {
        goto v_lr_ph23_split_preheader;
    }
    v_lr_ph23_split_preheader:;
        k_020 = v45;
    goto v_lr_ph23_split;
    v_lr_ph18_us_preheader:;
    int v81 = get_global_id(0);
    bool v82 = v81 < v13;
    int v83 = get_local_size(1);
        k_020_us = v45;
    goto v_lr_ph18_us;
    label85:;
    int v86 = v83 + j_015_us56;
    bool v87 = v86 < v27;
    if(v87) {
        j_015_us56 = v86;
        goto label85;
    } else {
        goto v__crit_edge19_us_loopexit86;
    }
    v_lr_ph18_us:;
    int v89 = k_020_us + v31;
    long v90 = v89;
    long v91 = v64 * v90;
    int v92 = k_020_us * v27;
    if(v82) {
        goto v_lr_ph_us_us_preheader;
    } else {
        goto v_lr_ph18__lr_ph18_split_crit_edge_us_preheader;
    }
    v_lr_ph18__lr_ph18_split_crit_edge_us_preheader:;
        j_015_us56 = v76;
    goto label85;
    v_lr_ph_us_us_preheader:;
    int v95 = get_local_size(0);
        j_015_us_us = v76;
    goto v_lr_ph_us_us;
    label97:;
        goto v__crit_edge19_us;
    v__crit_edge19_us_loopexit86:;
        goto v__crit_edge19_us;
    v__crit_edge19_us:;
    int v100 = v78 + k_020_us;
    bool v101 = v100 < v40;
    if(v101) {
        k_020_us = v100;
        goto v_lr_ph18_us;
    } else {
        goto v__crit_edge24_loopexit;
    }
    v_lr_ph_us_us:;
    int v103 = j_015_us_us + v17;
    long v104 = v103;
    long v105 = v62 * v104;
    int v106 = j_015_us_us + v92;
    int v107 = v106 * v13;
        i_014_us_us = v81;
    goto v109;
    label110:;
    int v111 = v83 + j_015_us_us;
    bool v112 = v111 < v27;
    if(v112) {
        j_015_us_us = v111;
        goto v_lr_ph_us_us;
    } else {
        goto label97;
    }
    v109:;
    int v114 = i_014_us_us + v4;
    long v115 = v114;
    long v116 = v60 * v115;
    long v117 = v116 + v74;
    long v118 = v117 + v105;
    long v119 = v118 + v91;
    long sext10_us_us = v119 << 32;
    long v120 = sext10_us_us >> 32;
    global float* v121 = (&v66[v120]);
    global int* v122 = ((global int*)v121);
    int v_val_i11_us_us = v122[0];
    int v123 = i_014_us_us + v107;
    long v124 = v123;
    local float* v125 = (&(&_ZN5Eigen1sE)[0][v124]);
    local int* v126 = ((local int*)v125);
    local int* v127 = (v126);
    v127[0] = v_val_i11_us_us;
    int v129 = v95 + i_014_us_us;
    bool v130 = v129 < v13;
    if(v130) {
        i_014_us_us = v129;
        goto v109;
    } else {
        goto label110;
    }
    v__crit_edge24_loopexit:;
        goto v__crit_edge24;
    label133:;
        goto v__crit_edge24;
    v__crit_edge24:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    long v136 = v48 * v69;
    if(v49) {
        goto v__crit_edge51;
    } else {
        goto v_lr_ph50;
    }
    v_lr_ph50:;
    int v138 = get_global_id(1);
    bool v139 = v138 > v24;
    int v140 = get_local_size(2);
        k1_047 = v45;
    goto v142;
    v_lr_ph23_split:;
    int v143 = v78 + k_020;
    bool v144 = v143 < v40;
    if(v144) {
        k_020 = v143;
        goto v_lr_ph23_split;
    } else {
        goto label133;
    }
    label146:;
        goto v__crit_edge51;
    v__crit_edge51:;
    barrier(CLK_GLOBAL_MEM_FENCE);
    int v149 = p_052 + 1;
    long v150 = v149;
    bool v151 = v150 < numPlanes;
    if(v151) {
        v69 = v150;
p_052 = v149;
        goto v70;
    } else {
        goto label71;
    }
    v142:;
    if(v139) {
        goto v__crit_edge46;
    } else {
        goto v_lr_ph45;
    }
    v_lr_ph45:;
    int v154 = get_global_id(0);
    bool v155 = v154 > v10;
    int v156 = get_local_size(1);
    int v157 = k1_047 + v31;
    long v158 = v157;
    long v159 = v56 * v158;
        j2_042 = v138;
    goto v161;
    label162:;
        goto v__crit_edge46;
    v__crit_edge46:;
    int v164 = v140 + k1_047;
    bool v165 = v164 > v37;
    if(v165) {
        goto label146;
    } else {
        k1_047 = v164;
        goto v142;
    }
    v161:;
    if(v155) {
        goto v__crit_edge41;
    } else {
        goto v_preheader13_lr_ph;
    }
    v_preheader13_lr_ph:;
    int v168 = j2_042 + v17;
    long v169 = v168;
    long v170 = v54 * v169;
    int v171 = get_local_size(0);
        i3_039 = v154;
    goto v_preheader13;
    v_preheader13:;
    if(brmerge) {
        result_0_lcssa = 0.0f;
        goto v__crit_edge37;
    } else {
        goto v_preheader_lr_ph_us_preheader;
    }
    v_preheader_lr_ph_us_preheader:;
        v175 = 0;
n_035_us = 0;
result_034_us = 0.0f;
    goto v_preheader_lr_ph_us;
    v_preheader_lr_ph_us:;
    int v176 = n_035_us + k1_047;
    int v177 = v176 * v27;
    int v178 = v177 + j2_042;
    long v179 = v175 * kernelSizeY;
    if(v58) {
        split33_us = result_034_us;
        goto v__crit_edge32_us;
    } else {
        goto v_lr_ph27_us_us_preheader;
    }
    v_lr_ph27_us_us_preheader:;
        v182 = 0;
m_030_us_us = 0;
result_129_us_us = result_034_us;
    goto v_lr_ph27_us_us;
    label183:;
        split33_us = v_lcssa_lcssa;
    goto v__crit_edge32_us;
    v__crit_edge32_us:;
    int v185 = n_035_us + 1;
    long v186 = v185;
    bool v187 = v186 < kernelSizeZ;
    if(v187) {
        v175 = v186;
n_035_us = v185;
result_034_us = split33_us;
        goto v_preheader_lr_ph_us;
    } else {
        split33_us_lcssa = split33_us;
        goto v__crit_edge37_loopexit;
    }
    v_lr_ph27_us_us:;
    int v189 = v178 + m_030_us_us;
    int v190 = v189 * v13;
    int v191 = v190 + i3_039;
    long v192 = v182 + v179;
    long v193 = v192 * kernelSizeX;
    if(lcmp_mod) {
        v_unr = 0;
l_026_us_us_unr = 0;
result_225_us_us_unr = result_129_us_us;
        goto v_lr_ph27_us_us_split;
    } else {
        goto v195;
    }
    v195:;
    int v196 = v190 + i3_039;
    long v197 = v196;
    local float* v198 = (&(&_ZN5Eigen1sE)[0][v197]);
    local float* v199 = (v198);
    float v200 = v199[0];
    global float* v201 = (&_kernel[v193]);
    float v202 = v201[0];
    float v203 = v200 * v202;
    float v204 = result_129_us_us + v203;
        v_unr = 1;
l_026_us_us_unr = 1;
result_225_us_us_unr = v204;
v_lcssa_unr = v204;
    goto v_lr_ph27_us_us_split;
    v_lr_ph27_us_us_split:;
    if(v67) {
        v_lcssa = v_lcssa_unr;
        goto v__crit_edge28_us_us;
    } else {
        goto v_lr_ph27_us_us_split_split;
    }
    v_lr_ph27_us_us_split_split:;
        v208 = v_unr;
l_026_us_us = l_026_us_us_unr;
result_225_us_us = result_225_us_us_unr;
    goto v209;
    label210:;
        v_lcssa = v_lcssa88;
    goto v__crit_edge28_us_us;
    v__crit_edge28_us_us:;
    int v212 = m_030_us_us + 1;
    long v213 = v212;
    bool v214 = v213 < kernelSizeY;
    if(v214) {
        v182 = v213;
m_030_us_us = v212;
result_129_us_us = v_lcssa;
        goto v_lr_ph27_us_us;
    } else {
        v_lcssa_lcssa = v_lcssa;
        goto label183;
    }
    v209:;
    int v216 = v191 + l_026_us_us;
    long v217 = v216;
    local float* v218 = (&(&_ZN5Eigen1sE)[0][v217]);
    local float* v219 = (v218);
    float v220 = v219[0];
    long v221 = v208 + v193;
    global float* v222 = (&_kernel[v221]);
    float v223 = v222[0];
    float v224 = v220 * v223;
    float v225 = result_225_us_us + v224;
    int v226 = l_026_us_us + 1;
    long v227 = v226;
    int v228 = v191 + v226;
    long v229 = v228;
    local float* v230 = (&(&_ZN5Eigen1sE)[0][v229]);
    local float* v231 = (v230);
    float v232 = v231[0];
    long v233 = v227 + v193;
    global float* v234 = (&_kernel[v233]);
    float v235 = v234[0];
    float v236 = v232 * v235;
    float v237 = v225 + v236;
    int v238 = l_026_us_us + 2;
    long v239 = v238;
    bool v240 = v239 < kernelSizeX;
    if(v240) {
        v208 = v239;
l_026_us_us = v238;
result_225_us_us = v237;
        goto v209;
    } else {
        v_lcssa88 = v237;
        goto label210;
    }
    label242:;
        goto v__crit_edge41;
    v__crit_edge41:;
    int v244 = v156 + j2_042;
    bool v245 = v244 > v24;
    if(v245) {
        goto label162;
    } else {
        j2_042 = v244;
        goto v161;
    }
    v__crit_edge37_loopexit:;
        result_0_lcssa = split33_us_lcssa;
    goto v__crit_edge37;
    v__crit_edge37:;
    int v248 = i3_039 + v4;
    long v249 = v248;
    long v250 = v52 * v249;
    long v251 = v250 + v136;
    long v252 = v251 + v170;
    long v253 = v252 + v159;
    long sext8 = v253 << 32;
    long v254 = sext8 >> 32;
    global float* v255 = (&buffer[v254]);
    v255[0] = result_0_lcssa;
    int v257 = v171 + i3_039;
    bool v258 = v257 > v10;
    if(v258) {
        goto label242;
    } else {
        i3_039 = v257;
        goto v_preheader13;
    }
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_42* eval, global float* eval_ptr0, global float* eval_ptr1, global float* eval_ptr2, global float* eval_ptr3, global float* eval_ptr4, global float* eval_ptr5, long size) {
    long i_01_i;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f0.f0 = eval_ptr1;
eval[0].f1.f1.f0 = eval_ptr2;
eval[0].f1.f2.f0 = eval_ptr3;
eval[0].f1.f5 = eval_ptr4;
eval[0].f1.f6 = eval_ptr5;

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
    bool v10 = v6 < size;
    if(v10) {
        goto v_lr_ph_i;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;
    }
    v_lr_ph_i:;
    global float*global * v12 = (&eval[0].f1.f5);
    global float* v13 = v12[0];
    global float*global * v14 = (&eval[0].f0.f0);
    global float* v15 = v14[0];
        i_01_i = v6;
    goto v17;
    v17:;
    global float* v18 = (&v13[i_01_i]);
    global int* v19 = ((global int*)v18);
    int v20 = v19[0];
    global float* v21 = (&v15[i_01_i]);
    global int* v22 = ((global int*)v21);
    v22[0] = v20;
    long v24 = i_01_i + v9;
    bool v25 = v24 < size;
    if(v25) {
        i_01_i = v24;
        goto v17;
    } else {
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit;
    }
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit_loopexit:;
        goto _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit;
    _ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1ElEELi0EEEKNS_19TensorConvolutionOpIKNS_5arrayIlLm1EEEKS7_KNS4_INS5_IfLi1ELi1ElEELi0EEEEEEENS_9GpuDeviceEEElLb0EE3runERSL_lll_exit:;
}
