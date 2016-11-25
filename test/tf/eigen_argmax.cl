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
    float v63;
    float v69;
    float v72;
    float v80;
    float v85;
    float v88;
    float v93;
    float v96;
    global float* v42;
    global int* v126;
    global int* v45;
    global struct Eigen__Tuple* v36;
    int v107;
    int v112;
    int v114;
    int v117;
    int v124;
    int v128;
    int v20;
    int v21;
    int v23;
    int v24;
    int v25;
    int v39;
    int v43;
    int v48;
    int v52;
    int v55;
    int v56;
    int v57;
    int v58;
    int v61;
    int v62;
    int v64;
    int v65;
    int v66;
    int v71;
    int v73;
    int v75;
    int v77;
    int v78;
    int v79;
    int v81;
    int v82;
    int v90;
    int v99;
    int* v34;
    long v118;

v1:;
    /* int v20 = call <unk> */;
    v20 = get_group_id(0);
    /* int v21 = call <unk> */;
    v21 = get_local_size(0);
    /* int v22 = mul v21 v20 */;
    /* int v23 = call <unk> */;
    v23 = get_local_id(0);
    /* int v24 = add v22 v23 */;
    v24 = (v21 * v20) + v23;
    /* int v25 = call <unk> */;
    v25 = get_num_groups(0);
    /* int v26 = mul v25 v21 */;
    /* bool v27 = icmp v24 size */;
    /* if(v27) */
    if (v24 < size) {
        goto v2;
    } else {
        goto v19;
    }
v2:;
    /* struct Eigen__Tuple** v28 = getelementptr eval <unk> <unk> <unk> <unk> */;
    /* int* v30 = getelementptr eval v29 <unk> <unk> <unk> <unk> v29 */;
    /* float** v31 = getelementptr eval v29 <unk> <unk> <unk> <unk> <unk> */;
    /* int* v32 = getelementptr eval v29 <unk> <unk> */;
    /* int** v33 = getelementptr eval v29 <unk> <unk> */;
    /* int* v34 = getelementptr eval v29 <unk> <unk> */;
    v34 = (&(eval[0].f1.f4));
    /* long* v35 = bitcast v34 */;
    /* struct Eigen__Tuple* v36 = load v28 */;
    v36 = (&(eval[0].f1.f1.f8))[0];
    /* bool v37 = icmp v36 <unk> */;
    /* int v39 = load v30 */;
    v39 = (&(eval[0].f1.f1.f3.f0[0]))[0];
    /* bool v40 = icmp v39 <unk> */;
    /* float* v42 = load v31 */;
    v42 = (&(eval[0].f1.f1.f6.f0.f0))[0];
    /* int v43 = load v32 */;
    v43 = (&(eval[0].f1.f2))[0];
    /* bool v44 = icmp v43 v41 */;
    /* int* v45 = load v33 */;
    v45 = (&(eval[0].f0.f0))[0];
    /* int v46 = add v39 <unk> */;
    /* int v48 = and v39 <unk> */;
    v48 = v39 & 3;
    /* bool v50 = icmp v48 v41 */;
    /* bool v51 = icmp v46 v49 */;
    /* int v52 = phi v24 */
    v52 = v24;
    goto v3;
v3:;
    /* if(v37) */
    if (v36 == 0) {
        goto v5;
    } else {
        goto v4;
    }
v4:;
    /* long v53 = sext v52 */;
    /* int* v54 = getelementptr v36 v53 v41 */;
    /* int v55 = load v54 */;
    v55 = (&(v36[v52].f0))[0];
    /* int v56 = phi v55 */
    v56 = v55;
    goto v15;
v5:;
    /* int v57 = mul v39 v52 */;
    v57 = v39 * v52;
    /* if(v40) */
    if (v39 > 0) {
        goto v6;
    } else {
        /* int v56 = phi v41 */
        v56 = 0;
        goto v15;
    }
v6:;
    /* if(v50) */
    if (v48 == 0) {
        /* int v58 = phi v41 */
        v58 = 0;
        /* float v60 = phi v59 */
        v60 = -3.40282e+38f;
        /* int v61 = phi v41 */
        v61 = 0;
        goto v10;
    } else {
        goto v7;
    }
v7:;
    /* int v62 = phi v41 */
    v62 = 0;
    /* float v63 = phi v59 */
    v63 = -3.40282e+38f;
    /* int v64 = phi v41 */
    v64 = 0;
    /* int v65 = phi v48 */
    v65 = v48;
    goto v8;
v8:;
    /* int v66 = add v62 v57 */;
    v66 = v62 + v57;
    /* long v67 = sext v66 */;
    /* float* v68 = getelementptr v42 v67 */;
    /* float v69 = load v68 */;
    v69 = (&(v42[v66]))[0];
    /* bool v70 = fcmp v69 v63 */;
    v70 = v69 <= v63;
    /* int v71 = select v70 v64 v66 */;
    v71 = v70 ? v64 : v66;
    /* float v72 = select v70 v63 v69 */;
    v72 = v70 ? v63 : v69;
    /* int v73 = add v62 <unk> */;
    v73 = v62 + 1;
    /* int v75 = add v65 v47 */;
    v75 = v65 + -1;
    /* bool v76 = icmp v75 v41 */;
    /* if(v76) */
    if (v75 == 0) {
        goto v9;
    } else {
        /* int v62 = phi v73 */
        v62 = v73;
        /* float v63 = phi v72 */
        v63 = v72;
        /* int v64 = phi v71 */
        v64 = v71;
        /* int v65 = phi v75 */
        v65 = v75;
        goto v8;
    }
v9:;
    /* int v77 = phi v71 */
    v77 = v71;
    /* int v58 = phi v73 */
    v58 = v73;
    /* float v60 = phi v72 */
    v60 = v72;
    /* int v61 = phi v71 */
    v61 = v71;
    goto v10;
v10:;
    /* if(v51) */
    if (v39 + -1 < 3) {
        /* int v78 = phi v77 */
        v78 = v77;
        goto v14;
    } else {
        goto v11;
    }
v11:;
    /* int v79 = phi v58 */
    v79 = v58;
    /* float v80 = phi v60 */
    v80 = v60;
    /* int v81 = phi v61 */
    v81 = v61;
    goto v12;
v12:;
    /* int v82 = add v79 v57 */;
    v82 = v79 + v57;
    /* long v83 = sext v82 */;
    /* float* v84 = getelementptr v42 v83 */;
    /* float v85 = load v84 */;
    v85 = (&(v42[v82]))[0];
    /* bool v86 = fcmp v85 v80 */;
    v86 = v85 <= v80;
    /* int v87 = select v86 v81 v82 */;
    /* float v88 = select v86 v80 v85 */;
    v88 = v86 ? v80 : v85;
    /* int v89 = add v79 v74 */;
    /* int v90 = add v89 v57 */;
    v90 = (v79 + 1) + v57;
    /* long v91 = sext v90 */;
    /* float* v92 = getelementptr v42 v91 */;
    /* float v93 = load v92 */;
    v93 = (&(v42[v90]))[0];
    /* bool v94 = fcmp v93 v88 */;
    v94 = v93 <= v88;
    /* int v95 = select v94 v87 v90 */;
    /* float v96 = select v94 v88 v93 */;
    v96 = v94 ? v88 : v93;
    /* int v97 = add v79 <unk> */;
    /* int v99 = add v97 v57 */;
    v99 = (v79 + 2) + v57;
    /* long v100 = sext v99 */;
    /* float* v101 = getelementptr v42 v100 */;
    /* float v102 = load v101 */;
    v102 = (&(v42[v99]))[0];
    /* bool v103 = fcmp v102 v96 */;
    v103 = v102 <= v96;
    /* int v104 = select v103 v95 v99 */;
    /* float v105 = select v103 v96 v102 */;
    v105 = v103 ? v96 : v102;
    /* int v106 = add v79 v49 */;
    /* int v107 = add v106 v57 */;
    v107 = (v79 + 3) + v57;
    /* long v108 = sext v107 */;
    /* float* v109 = getelementptr v42 v108 */;
    /* float v110 = load v109 */;
    v110 = (&(v42[v107]))[0];
    /* bool v111 = fcmp v110 v105 */;
    v111 = v110 <= v105;
    /* int v112 = select v111 v104 v107 */;
    v112 = v111 ? (v103 ? (v94 ? (v86 ? v81 : v82) : v90) : v99) : v107;
    /* float v113 = select v111 v105 v110 */;
    v113 = v111 ? v105 : v110;
    /* int v114 = add v79 <unk> */;
    v114 = v79 + 4;
    /* bool v116 = icmp v114 v39 */;
    /* if(v116) */
    if (v114 == v39) {
        goto v13;
    } else {
        /* int v79 = phi v114 */
        v79 = v114;
        /* float v80 = phi v113 */
        v80 = v113;
        /* int v81 = phi v112 */
        v81 = v112;
        goto v12;
    }
v13:;
    /* int v78 = phi v112 */
    v78 = v112;
    goto v14;
v14:;
    /* int v56 = phi v78 */
    v56 = v78;
    goto v15;
v15:;
    /* if(v44) */
    if (v43 < 0) {
        /* int v117 = phi v56 */
        v117 = v56;
        goto v17;
    } else {
        goto v16;
    }
v16:;
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
    goto v17;
v17:;
    /* long v125 = sext v52 */;
    /* int* v126 = getelementptr v45 v125 */;
    v126 = (&(v45[v52]));
    /* void v127 = store v117 v126 */;
    v126[0] = v117;
    /* int v128 = add v52 v26 */;
    v128 = v52 + (v25 * v21);
    /* bool v129 = icmp v128 size */;
    /* if(v129) */
    if (v128 < size) {
        /* int v52 = phi v128 */
        v52 = v128;
        goto v3;
    } else {
        goto v18;
    }
v18:;
    goto v19;
v19:;
    return;
}

