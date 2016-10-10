struct class_Eigen__array_nopointers {
    long f0[3];
};

struct Eigen__DSizes_nopointers {
    struct class_Eigen__array_nopointers f0;
};

struct Eigen__TensorEvaluator_0_nopointers {
        struct Eigen__DSizes_nopointers f1;
    };

struct Eigen__internal__scalar_sum_op_nopointers {
    char f0;
};

struct Eigen__TensorEvaluator_2_nopointers {
        struct Eigen__DSizes_nopointers f1;
    };

struct Eigen__internal__scalar_product_op_nopointers {
    char f0;
};

struct Eigen__TensorEvaluator_3_nopointers {
    struct Eigen__internal__scalar_product_op_nopointers f0;
    struct Eigen__TensorEvaluator_2_nopointers f1;
    struct Eigen__TensorEvaluator_2_nopointers f2;
};

struct Eigen__TensorEvaluator_1_nopointers {
    struct Eigen__internal__scalar_sum_op_nopointers f0;
    struct Eigen__TensorEvaluator_2_nopointers f1;
    struct Eigen__TensorEvaluator_3_nopointers f2;
};

struct Eigen__TensorEvaluator_nopointers {
    struct Eigen__TensorEvaluator_0_nopointers f0;
    struct Eigen__TensorEvaluator_1_nopointers f1;
};

struct class_Eigen__array {
    long f0[3];
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

struct Eigen__internal__scalar_sum_op {
    char f0;
};

struct Eigen__TensorEvaluator_2 {
    global float* f0;
    struct Eigen__DSizes f1;
    global struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_product_op {
    char f0;
};

struct Eigen__TensorEvaluator_3 {
    struct Eigen__internal__scalar_product_op f0;
    struct Eigen__TensorEvaluator_2 f1;
    struct Eigen__TensorEvaluator_2 f2;
};

struct Eigen__TensorEvaluator_1 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_2 f1;
    struct Eigen__TensorEvaluator_3 f2;
};

struct Eigen__TensorEvaluator {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_1 f1;
};




kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi0ElEELi0EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKS7_KNS8_INS0_17scalar_product_opIffEESB_SB_EEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_nopointers* eval_nopointers, global float* eval_ptr0, global float* eval_ptr1, global float* eval_ptr2, global float* eval_ptr3, long size) {
    long i_01_i;
struct Eigen__TensorEvaluator eval[1];
eval[0].f0.f1.f0.f0[0] = eval_nopointers[0].f0.f1.f0.f0[0];
eval[0].f0.f1.f0.f0[1] = eval_nopointers[0].f0.f1.f0.f0[1];
eval[0].f0.f1.f0.f0[2] = eval_nopointers[0].f0.f1.f0.f0[2];
eval[0].f1.f0.f0 = eval_nopointers[0].f1.f0.f0;
eval[0].f1.f1.f1.f0.f0[0] = eval_nopointers[0].f1.f1.f1.f0.f0[0];
eval[0].f1.f1.f1.f0.f0[1] = eval_nopointers[0].f1.f1.f1.f0.f0[1];
eval[0].f1.f1.f1.f0.f0[2] = eval_nopointers[0].f1.f1.f1.f0.f0[2];
eval[0].f1.f2.f0.f0 = eval_nopointers[0].f1.f2.f0.f0;
eval[0].f1.f2.f1.f1.f0.f0[0] = eval_nopointers[0].f1.f2.f1.f1.f0.f0[0];
eval[0].f1.f2.f1.f1.f0.f0[1] = eval_nopointers[0].f1.f2.f1.f1.f0.f0[1];
eval[0].f1.f2.f1.f1.f0.f0[2] = eval_nopointers[0].f1.f2.f1.f1.f0.f0[2];
eval[0].f1.f2.f2.f1.f0.f0[0] = eval_nopointers[0].f1.f2.f2.f1.f0.f0[0];
eval[0].f1.f2.f2.f1.f0.f0[1] = eval_nopointers[0].f1.f2.f2.f1.f0.f0[1];
eval[0].f1.f2.f2.f1.f0.f0[2] = eval_nopointers[0].f1.f2.f2.f1.f0.f0[2];
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
    global float** v12 = (&eval[0].f1.f1.f0);
    global float* v13 = v12[0];
    global float** v14 = (&eval[0].f1.f2.f1.f0);
    global float* v15 = v14[0];
    global float** v16 = (&eval[0].f1.f2.f2.f0);
    global float* v17 = v16[0];
    global float** v18 = (&eval[0].f0.f0);
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
