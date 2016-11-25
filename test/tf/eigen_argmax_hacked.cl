struct class_Eigen__array {
    int f0[1];
};
struct Eigen__Tuple {
    int f0;
    float f1;
};
struct Eigen__DSizes {
    struct class_Eigen__array f0;
};
struct Eigen__TensorEvaluator_0 {
    global int* f0;
    struct Eigen__DSizes f1;
    global struct Eigen__GpuDevice* f2;
    global struct class_Eigen__TensorMap* f3;
};
struct Eigen__GpuDevice {
    global struct class_Eigen__StreamInterface* f0;
    int f1;
    char f2[4];
};
struct class_Eigen__TensorMap {
    global int* f0;
    struct Eigen__DSizes f1;
    char f2[4];
};
struct class_Eigen__StreamInterface {
};
struct Eigen__TensorEvaluator_4 {
    global float* f0;
    struct Eigen__DSizes f1;
    global struct Eigen__GpuDevice* f2;
    global struct class_Eigen__TensorMap_5* f3;
};
struct class_Eigen__TensorMap_5 {
    global float* f0;
    struct Eigen__DSizes f1;
    char f2[4];
};
struct class_Eigen__array_nopointers {
    int f0[1];
};
struct Eigen__DSizes_nopointers {
    struct class_Eigen__array_nopointers f0;
};
struct Eigen__TensorEvaluator_0_nopointers {
    struct Eigen__DSizes_nopointers f0;
};
struct Eigen__TensorEvaluator_3 {
    struct Eigen__TensorEvaluator_4 f0;
};
struct class_Eigen__array_10 {
    char f0[1];
};
struct Eigen__Sizes {
    char f0;
};
struct Eigen__TensorEvaluator_4_nopointers {
    struct Eigen__DSizes_nopointers f0;
};
struct Eigen__TensorEvaluator_3_nopointers {
    struct Eigen__TensorEvaluator_4_nopointers f0;
};
struct class_Eigen__array_11 {
    int f0;
};
struct Eigen__internal__ArgMaxTupleReducer {
    char f0;
};
struct class_Eigen__array_10_nopointers {
    char f0[1];
};
struct Eigen__TensorEvaluator_9 {
    struct class_Eigen__array_10 f0;
    struct Eigen__Sizes f1;
    struct class_Eigen__array_11 f2;
    struct class_Eigen__array f3;
    struct class_Eigen__array f4;
    struct class_Eigen__array f5;
    struct Eigen__TensorEvaluator_3 f6;
    struct Eigen__internal__ArgMaxTupleReducer f7;
    global struct Eigen__Tuple* f8;
    global struct Eigen__GpuDevice* f9;
};
struct Eigen__Sizes_nopointers {
    char f0;
};
struct Eigen__TensorEvaluator_2 {
    struct Eigen__TensorEvaluator_3 f0;
    struct Eigen__TensorEvaluator_9 f1;
    int f2;
    struct class_Eigen__array f3;
    int f4;
    int f5;
};
struct class_Eigen__array_11_nopointers {
    int f0;
};
struct Eigen__TensorEvaluator {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_2 f1;
};
struct Eigen__internal__ArgMaxTupleReducer_nopointers {
    char f0;
};
struct Eigen__TensorEvaluator_9_nopointers {
    struct class_Eigen__array_10_nopointers f0;
    struct Eigen__Sizes_nopointers f1;
    struct class_Eigen__array_11_nopointers f2;
    struct class_Eigen__array_nopointers f3;
    struct class_Eigen__array_nopointers f4;
    struct class_Eigen__array_nopointers f5;
    struct Eigen__TensorEvaluator_3_nopointers f6;
    struct Eigen__internal__ArgMaxTupleReducer_nopointers f7;
};
struct Eigen__TensorEvaluator_2_nopointers {
    struct Eigen__TensorEvaluator_3_nopointers f0;
    struct Eigen__TensorEvaluator_9_nopointers f1;
    int f2;
    struct class_Eigen__array_nopointers f3;
    int f4;
    int f5;
};
struct Eigen__TensorEvaluator_nopointers {
    struct Eigen__TensorEvaluator_0_nopointers f0;
    struct Eigen__TensorEvaluator_2_nopointers f1;
};

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIiLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_20TensorTupleReducerOpINS0_18ArgMaxTupleReducerINS_5TupleIifEEEEKNS_5arrayIiLm1EEEKNS4_INS5_IfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_nopointers* eval_nopointers, global int* eval_ptr0, uint eval_ptr0_offset, global float* eval_ptr1, uint eval_ptr1_offset, global float* eval_ptr2, uint eval_ptr2_offset, int size, local int *scratch);

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIiLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_20TensorTupleReducerOpINS0_18ArgMaxTupleReducerINS_5TupleIifEEEEKNS_5arrayIiLm1EEEKNS4_INS5_IfLi1ELi1EiEELi16ES7_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_nopointers* eval_nopointers, global int* eval_ptr0, uint eval_ptr0_offset, global float* eval_ptr1, uint eval_ptr1_offset, global float* eval_ptr2, uint eval_ptr2_offset, int size, local int *scratch) {
    eval_ptr2 += eval_ptr2_offset;
    eval_ptr1 += eval_ptr1_offset;
    eval_ptr0 += eval_ptr0_offset;
struct Eigen__TensorEvaluator eval[1];
eval[0].f0.f1.f0.f0[0] = eval_nopointers[0].f0.f0.f0.f0[0];
eval[0].f1.f0.f0.f1.f0.f0[0] = eval_nopointers[0].f1.f0.f0.f0.f0.f0[0];
eval[0].f1.f1.f0.f0[0] = eval_nopointers[0].f1.f1.f0.f0[0];
eval[0].f1.f1.f1.f0 = eval_nopointers[0].f1.f1.f1.f0;
eval[0].f1.f1.f2.f0 = eval_nopointers[0].f1.f1.f2.f0;
eval[0].f1.f1.f3.f0[0] = eval_nopointers[0].f1.f1.f3.f0[0];

//eval_ptr0[0] = eval_nopointers[0].f1.f1.f3.f0[0] + 1;
//eval_ptr0[0] = 125.0f;
//return;

eval[0].f1.f1.f4.f0[0] = eval_nopointers[0].f1.f1.f4.f0[0];
eval[0].f1.f1.f5.f0[0] = eval_nopointers[0].f1.f1.f5.f0[0];
eval[0].f1.f1.f6.f0.f1.f0.f0[0] = eval_nopointers[0].f1.f1.f6.f0.f0.f0.f0[0];
eval[0].f1.f1.f7.f0 = eval_nopointers[0].f1.f1.f7.f0;
eval[0].f1.f2 = eval_nopointers[0].f1.f2;
eval[0].f1.f3.f0[0] = eval_nopointers[0].f1.f3.f0[0];
eval[0].f1.f4 = eval_nopointers[0].f1.f4;
eval[0].f1.f5 = eval_nopointers[0].f1.f5;
eval[0].f0.f0 = eval_ptr0;
eval[0].f1.f0.f0.f0 = eval_ptr1;
eval[0].f1.f1.f6.f0.f0 = eval_ptr2;

    bool v103;
    bool v111;
    bool v70;
    bool v86;
    bool v94;
    float v102;
    float v105;
    float v110;
    float v113;
    float v60;
    float max_so_far;
    float v69;
    float new_max_so_far;
    float v80;
    float v85;
    float v88;
    float v93;
    float v96;
    global float* input_data;
    global int* v126;
    global int* output_data;
    global struct Eigen__Tuple* v36;
    int v107;
    int v112;
    int v114;
    int v117;
    int v124;
    int v128;
    int group_id;
    int local_size;
    int local_id;
    int global_id;
    int num_groups;
    int inner_size;
    int v43;
    int inner_size_mod4;
    int global_pos;
    int v55;
    int v56;
    int segment_offset;
    int v58;
    int v61;
    int idx;
    int best_pos_so_far;
    int count;
    int candidate_pos;
    int new_best_pos_so_far;
    int new_idx;
    int new_count;
    int v77;
    int v78;
    int v79;
    int v81;
    int v82;
    int v90;
    int v99;
    int* v34;
    long v118;

    /* int group_id = call <unk> */;
    group_id = get_group_id(0);
    /* int local_size = call <unk> */;
    local_size = get_local_size(0);
    /* int v22 = mul local_size group_id */;
    /* int local_id = call <unk> */;
    local_id = get_local_id(0);
    /* int global_id = add v22 local_id */;
    global_id = (local_size * group_id) + local_id;
    /* int num_groups = call <unk> */;
    num_groups = get_num_groups(0);
    /* int v26 = mul num_groups local_size */;
    /* bool v27 = icmp global_id size */;
    /* if(v27) */
    if (global_id >= size) {
        goto exit;
    }

    /* struct Eigen__Tuple** v28 = getelementptr eval <unk> <unk> <unk> <unk> */;
    /* int* v30 = getelementptr eval v29 <unk> <unk> <unk> <unk> v29 */;
    /* float** v31 = getelementptr eval v29 <unk> <unk> <unk> <unk> <unk> */;
    /* int* v32 = getelementptr eval v29 <unk> <unk> */;
    /* int** v33 = getelementptr eval v29 <unk> <unk> */;
    /* int* v34 = getelementptr eval v29 <unk> <unk> */;
    v34 = &eval[0].f1.f4;
    /* long* v35 = bitcast v34 */;
    /* struct Eigen__Tuple* v36 = load v28 */;
    v36 = eval[0].f1.f1.f8;
    /* bool v37 = icmp v36 <unk> */;
    /* int inner_size = load v30 */;
    inner_size = eval[0].f1.f1.f3.f0[0];
    /* bool v40 = icmp inner_size <unk> */;
    /* float* input_data = load v31 */;
    input_data = eval_ptr2;
    /* int v43 = load v32 */;
    v43 = eval[0].f1.f2;
    /* bool v44 = icmp v43 0 */;
    /* int* output_data = load v33 */;
    output_data = eval_ptr0;
    /* int v46 = add inner_size <unk> */;
    /* int inner_size_mod4 = and inner_size <unk> */;
    inner_size_mod4 = inner_size & 3;
    /* bool v50 = icmp inner_size_mod4 0 */;
    /* bool v51 = icmp v46 v49 */;
    /* int global_pos = phi global_id */
    global_pos = global_id;

block3:;
    /* if(v37) */
    if (v36 == 0) {
        goto block5;
    }

    /* long v53 = sext global_pos */;
    /* int* v54 = getelementptr v36 v53 0 */;
    /* int v55 = load v54 */;
//eval_ptr0[0] = global_pos;
//eval_ptr0[0] = 125.0f;
//return;
    v56 = v36[global_pos].f0;
    /* int v56 = phi v55 */
    // v56 = v55;
    goto block15;
block5:;
    /* int segment_offset = mul inner_size global_pos */;
    segment_offset = inner_size * global_pos;
    /* if(v40) */
    if (inner_size <= 0) {
        /* int v56 = phi 0 */
        v56 = 0;
        goto block15;
    }

    /* if(v50) */
    if (inner_size_mod4 == 0) {
        /* int v58 = phi 0 */
        v58 = 0;
        /* float v60 = phi -INFINITY */
        v60 = -INFINITY;
        /* int v61 = phi 0 */
        v61 = 0;
        goto block10;
    }

    /* int idx = phi 0 */
    idx = 0;
    /* float max_so_far = phi -INFINITY */
    max_so_far = -INFINITY;
    /* int best_pos_so_far = phi 0 */
    best_pos_so_far = 0;
    /* int count = phi inner_size_mod4 */
    count = inner_size_mod4;

block8:;
    /* int candidate_pos = add idx segment_offset */;
    candidate_pos = idx + segment_offset;
    /* long v67 = sext candidate_pos */;
    /* float* v68 = getelementptr input_data v67 */;
    /* float v69 = load v68 */;
    // v69 = input_data[candidate_pos];
    /* bool v70 = fcmp v69 max_so_far */;
    // v70 = v69 <= max_so_far;
    /* int new_best_pos_so_far = select v70 best_pos_so_far candidate_pos */;
    new_best_pos_so_far = input_data[candidate_pos] <= max_so_far ? best_pos_so_far : candidate_pos;
    /* float new_max_so_far = select v70 max_so_far v69 */;
    new_max_so_far = input_data[candidate_pos] <= max_so_far ? max_so_far : input_data[candidate_pos];
    /* int new_idx = add idx <unk> */;
    new_idx = idx + 1;
    /* int new_count = add count v47 */;
    new_count = count - 1;
    /* bool v76 = icmp new_count 0 */;
    /* if(v76) */
    if(new_count != 0) {
        /* int idx = phi new_idx */
        idx = new_idx;
        /* float max_so_far = phi new_max_so_far */
        max_so_far = new_max_so_far;
        /* int best_pos_so_far = phi new_best_pos_so_far */
        best_pos_so_far = new_best_pos_so_far;
        /* int count = phi new_count */
        count = new_count;
        goto block8;
    }

    /* int v77 = phi new_best_pos_so_far */
    v77 = new_best_pos_so_far;
    /* int v58 = phi new_idx */
    v58 = new_idx;
    /* float v60 = phi new_max_so_far */
    v60 = new_max_so_far;
    /* int v61 = phi new_best_pos_so_far */
    v61 = new_best_pos_so_far;

block10:;
    /* if(v51) */
    if (inner_size < 4) {
        /* int v78 = phi v77 */
        v78 = v77;
        goto block14;
    }

    /* int v79 = phi v58 */
    v79 = v58;
    /* float v80 = phi v60 */
    v80 = v60;
    /* int v81 = phi v61 */
    v81 = v61;

block12:;
    /* int v82 = add v79 segment_offset */;
    v82 = v79 + segment_offset;
    /* long v83 = sext v82 */;
    /* float* v84 = getelementptr input_data v83 */;
    /* float v85 = load v84 */;
    v85 = (&(input_data[v82]))[0];
    /* bool v86 = fcmp v85 v80 */;
    v86 = v85 <= v80;
    /* int v87 = select v86 v81 v82 */;
    /* float v88 = select v86 v80 v85 */;
    v88 = v86 ? v80 : v85;
    /* int v89 = add v79 v74 */;
    /* int v90 = add v89 segment_offset */;
    v90 = (v79 + 1) + segment_offset;
    /* long v91 = sext v90 */;
    /* float* v92 = getelementptr input_data v91 */;
    /* float v93 = load v92 */;
    v93 = (&(input_data[v90]))[0];
    /* bool v94 = fcmp v93 v88 */;
    v94 = v93 <= v88;
    /* int v95 = select v94 v87 v90 */;
    /* float v96 = select v94 v88 v93 */;
    v96 = v94 ? v88 : v93;
    /* int v97 = add v79 <unk> */;
    /* int v99 = add v97 segment_offset */;
    v99 = (v79 + 2) + segment_offset;
    /* long v100 = sext v99 */;
    /* float* v101 = getelementptr input_data v100 */;
    /* float v102 = load v101 */;
    v102 = (&(input_data[v99]))[0];
    /* bool v103 = fcmp v102 v96 */;
    v103 = v102 <= v96;
    /* int v104 = select v103 v95 v99 */;
    /* float v105 = select v103 v96 v102 */;
    v105 = v103 ? v96 : v102;
    /* int v106 = add v79 v49 */;
    /* int v107 = add v106 segment_offset */;
    v107 = (v79 + 3) + segment_offset;
    /* long v108 = sext v107 */;
    /* float* v109 = getelementptr input_data v108 */;
    /* float v110 = load v109 */;
    v110 = (&(input_data[v107]))[0];
    /* bool v111 = fcmp v110 v105 */;
    v111 = v110 <= v105;
    /* int v112 = select v111 v104 v107 */;
    v112 = v111 ? (v103 ? (v94 ? (v86 ? v81 : v82) : v90) : v99) : v107;
    /* float v113 = select v111 v105 v110 */;
    v113 = v111 ? v105 : v110;
    /* int v114 = add v79 <unk> */;
    v114 = v79 + 4;
    /* bool v116 = icmp v114 inner_size */;
    /* if(v116) */
    if(v114 != inner_size) {
        /* int v79 = phi v114 */
        v79 = v114;
        /* float v80 = phi v113 */
        v80 = v113;
        /* int v81 = phi v112 */
        v81 = v112;
        goto block12;
    }

    /* int v78 = phi v112 */
    v78 = v112;

block14:;
    /* int v56 = phi v78 */
    v56 = v78;

block15:;
    /* if(v44) */
    if (v43 < 0) {
        /* int v117 = phi v56 */
        output_data[0] =12344;
        return;
        v117 = v56;
        goto block17;
    }

    /* long v118 = load v35 */;
    v118 = ((long*)v34)[0];
    /* int v119 = trunc v118 */;
    /* int v120 = srem v56 v119 */;
    /* long v121 = lshr v118 <unk> */;
    /* int v123 = trunc v121 */;
    /* int v124 = sdiv v120 v123 */;
    v124 = (v56 % (int)v118) / (int)(v118 >> 32);
    /* int v117 = phi v124 */
    v117 = v124;

block17:;
    /* long v125 = sext global_pos */;
    /* int* v126 = getelementptr output_data v125 */;
    //v126 = &output_data[global_pos];
    /* void v127 = store v117 v126 */;
    output_data[global_pos] = v117;
    /* int v128 = add global_pos v26 */;
    global_pos += (num_groups * local_size);
    /* bool v129 = icmp v128 size */;
    /* if(v129) */
    if (global_pos < size) {
        /* int global_pos = phi v128 */
        goto block3;
    }
v18:;
exit:;
    return;
}

