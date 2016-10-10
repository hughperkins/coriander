struct class_Eigen__array_nopointers {
    int f0[1];
};

struct Eigen__DSizes_nopointers {
    struct class_Eigen__array_nopointers f0;
};

struct Eigen__TensorEvaluator_0_nopointers {
        struct Eigen__DSizes_nopointers f1;
    };

struct Eigen__internal__scalar_constant_op_nopointers {
    float f0;
};

struct Eigen__TensorEvaluator_2_nopointers {
        struct Eigen__DSizes_nopointers f1;
    };

struct Eigen__internal__nullary_wrapper_nopointers {
    char f0;
};

struct Eigen__TensorEvaluator_1_nopointers {
    struct Eigen__internal__scalar_constant_op_nopointers f0;
    char f1[4];
    struct Eigen__TensorEvaluator_2_nopointers f2;
    struct Eigen__internal__nullary_wrapper_nopointers f3;
    char f4[7];
};

struct Eigen__TensorEvaluator_nopointers {
    struct Eigen__TensorEvaluator_0_nopointers f0;
    struct Eigen__TensorEvaluator_1_nopointers f1;
};

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

struct class_Eigen__internal__UniformRandomGenerator_nopointers {
    long f0;
};

struct Eigen__internal__nullary_wrapper_5_nopointers {
    char f0;
};

struct Eigen__TensorEvaluator_4_nopointers {
    struct class_Eigen__internal__UniformRandomGenerator_nopointers f0;
    struct Eigen__TensorEvaluator_2_nopointers f1;
    struct Eigen__internal__nullary_wrapper_5_nopointers f2;
    char f3[7];
};

struct Eigen__TensorEvaluator_3_nopointers {
    struct Eigen__TensorEvaluator_0_nopointers f0;
    struct Eigen__TensorEvaluator_4_nopointers f1;
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




kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_18scalar_constant_opIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_nopointers* eval_nopointers, global float* eval_ptr0, global float* eval_ptr1, int size) {
    int i1_02_i;
    int i_03_i;
struct Eigen__TensorEvaluator eval[1];
eval[0].f0.f1.f0.f0[0] = eval_nopointers[0].f0.f1.f0.f0[0];
eval[0].f1.f0.f0 = eval_nopointers[0].f1.f0.f0;
eval[0].f1.f1[0] = eval_nopointers[0].f1.f1[0];
eval[0].f1.f1[1] = eval_nopointers[0].f1.f1[1];
eval[0].f1.f1[2] = eval_nopointers[0].f1.f1[2];
eval[0].f1.f1[3] = eval_nopointers[0].f1.f1[3];
eval[0].f1.f2.f1.f0.f0[0] = eval_nopointers[0].f1.f2.f1.f0.f0[0];
eval[0].f1.f3.f0 = eval_nopointers[0].f1.f3.f0;
eval[0].f1.f4[0] = eval_nopointers[0].f1.f4[0];
eval[0].f1.f4[1] = eval_nopointers[0].f1.f4[1];
eval[0].f1.f4[2] = eval_nopointers[0].f1.f4[2];
eval[0].f1.f4[3] = eval_nopointers[0].f1.f4[3];
eval[0].f1.f4[4] = eval_nopointers[0].f1.f4[4];
eval[0].f1.f4[5] = eval_nopointers[0].f1.f4[5];
eval[0].f1.f4[6] = eval_nopointers[0].f1.f4[6];
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
    float* v14 = (&eval[0].f1.f0.f0);
    int* v15 = ((int*)v14);
    global float** v16 = (&eval[0].f0.f0);
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
    float* v26 = (&eval[0].f1.f0.f0);
    int* v27 = ((int*)v26);
    global float** v28 = (&eval[0].f0.f0);
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

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi0EiEELi16EEEKNS_20TensorCwiseNullaryOpINS0_22UniformRandomGeneratorIfEEKS7_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_3_nopointers* eval_nopointers, global float* eval_ptr0, global float* eval_ptr1, int size) {
    int i1_02_i;
    int i_03_i;
    long v18;
    long v30;
    long v_lcssa;
    long v_lcssa6;
struct Eigen__TensorEvaluator_3 eval[1];
eval[0].f0.f1.f0.f0[0] = eval_nopointers[0].f0.f1.f0.f0[0];
eval[0].f1.f0.f0 = eval_nopointers[0].f1.f0.f0;
eval[0].f1.f1.f1.f0.f0[0] = eval_nopointers[0].f1.f1.f1.f0.f0[0];
eval[0].f1.f2.f0 = eval_nopointers[0].f1.f2.f0;
eval[0].f1.f3[0] = eval_nopointers[0].f1.f3[0];
eval[0].f1.f3[1] = eval_nopointers[0].f1.f3[1];
eval[0].f1.f3[2] = eval_nopointers[0].f1.f3[2];
eval[0].f1.f3[3] = eval_nopointers[0].f1.f3[3];
eval[0].f1.f3[4] = eval_nopointers[0].f1.f3[4];
eval[0].f1.f3[5] = eval_nopointers[0].f1.f3[5];
eval[0].f1.f3[6] = eval_nopointers[0].f1.f3[6];
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
    long* v14 = (&eval[0].f1.f0.f0);
    global float** v15 = (&eval[0].f0.f0);
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
    long* v26 = (&eval[0].f1.f0.f0);
    global float** v27 = (&eval[0].f0.f0);
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
