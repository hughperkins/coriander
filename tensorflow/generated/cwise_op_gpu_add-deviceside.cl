struct Eigen__half_impl____half {
    short f0;
};

struct Eigen__half_impl__half_base {
    struct Eigen__half_impl____half f0;
};

struct Eigen__half {
    struct Eigen__half_impl__half_base f0;
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
    struct class_Eigen__StreamInterface* f0;
    int f1;
    char f2[4];
};

struct Eigen__TensorEvaluator_0 {
    struct Eigen__half* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_sum_op {
    char f0;
};

struct Eigen__TensorEvaluator_2 {
    struct Eigen__half* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct class_Eigen__array_5 {
    long f0[1];
};

struct Eigen__DSizes_4 {
    struct class_Eigen__array_5 f0;
};

struct Eigen__TensorEvaluator_3 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_4 f1;
    struct Eigen__GpuDevice* f2;
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

struct Eigen__internal__scalar_left {
    struct Eigen__half* f0;
};

struct Eigen__TensorEvaluator_7 {
    struct Eigen__internal__scalar_left f0;
    struct Eigen__TensorEvaluator_2 f1;
};

struct Eigen__TensorEvaluator_6 {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_7 f1;
};

struct Eigen__internal__scalar_right {
    struct Eigen__half* f0;
};

struct Eigen__TensorEvaluator_9 {
    struct Eigen__internal__scalar_right f0;
    struct Eigen__TensorEvaluator_2 f1;
};

struct Eigen__TensorEvaluator_8 {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_9 f1;
};

struct Eigen__TensorEvaluator_12 {
    struct Eigen__DSizes f0;
    struct class_Eigen__array f1;
    struct class_Eigen__array f2;
    struct Eigen__TensorEvaluator_2 f3;
};

struct Eigen__TensorEvaluator_11 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_2 f1;
    struct Eigen__TensorEvaluator_12 f2;
};

struct Eigen__TensorEvaluator_10 {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_11 f1;
};

struct Eigen__TensorEvaluator_14 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_12 f1;
    struct Eigen__TensorEvaluator_2 f2;
};

struct Eigen__TensorEvaluator_13 {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_14 f1;
};

struct Eigen__TensorEvaluator_16 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_12 f1;
    struct Eigen__TensorEvaluator_12 f2;
};

struct Eigen__TensorEvaluator_15 {
    struct Eigen__TensorEvaluator_0 f0;
    struct Eigen__TensorEvaluator_16 f1;
};

struct class_Eigen__array_20 {
    int f0[2];
};

struct Eigen__DSizes_19 {
    struct class_Eigen__array_20 f0;
};

struct Eigen__TensorEvaluator_18 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_22 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_23 {
    struct Eigen__DSizes_19 f0;
    struct class_Eigen__array_20 f1;
    struct class_Eigen__array_20 f2;
    struct Eigen__TensorEvaluator_22 f3;
};

struct Eigen__TensorEvaluator_21 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_22 f1;
    struct Eigen__TensorEvaluator_23 f2;
};

struct Eigen__TensorEvaluator_17 {
    struct Eigen__TensorEvaluator_18 f0;
    struct Eigen__TensorEvaluator_21 f1;
};

struct Eigen__TensorEvaluator_25 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_23 f1;
    struct Eigen__TensorEvaluator_22 f2;
};

struct Eigen__TensorEvaluator_24 {
    struct Eigen__TensorEvaluator_18 f0;
    struct Eigen__TensorEvaluator_25 f1;
};

struct Eigen__TensorEvaluator_27 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_23 f1;
    struct Eigen__TensorEvaluator_23 f2;
};

struct Eigen__TensorEvaluator_26 {
    struct Eigen__TensorEvaluator_18 f0;
    struct Eigen__TensorEvaluator_27 f1;
};

struct class_Eigen__array_31 {
    int f0[3];
};

struct Eigen__DSizes_30 {
    struct class_Eigen__array_31 f0;
};

struct Eigen__TensorEvaluator_29 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_33 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_34 {
    struct Eigen__DSizes_30 f0;
    struct class_Eigen__array_31 f1;
    struct class_Eigen__array_31 f2;
    struct Eigen__TensorEvaluator_33 f3;
};

struct Eigen__TensorEvaluator_32 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_33 f1;
    struct Eigen__TensorEvaluator_34 f2;
};

struct Eigen__TensorEvaluator_28 {
    struct Eigen__TensorEvaluator_29 f0;
    struct Eigen__TensorEvaluator_32 f1;
};

struct Eigen__TensorEvaluator_36 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_34 f1;
    struct Eigen__TensorEvaluator_33 f2;
};

struct Eigen__TensorEvaluator_35 {
    struct Eigen__TensorEvaluator_29 f0;
    struct Eigen__TensorEvaluator_36 f1;
};

struct Eigen__TensorEvaluator_38 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_34 f1;
    struct Eigen__TensorEvaluator_34 f2;
};

struct Eigen__TensorEvaluator_37 {
    struct Eigen__TensorEvaluator_29 f0;
    struct Eigen__TensorEvaluator_38 f1;
};

struct class_Eigen__array_42 {
    int f0[4];
};

struct Eigen__DSizes_41 {
    struct class_Eigen__array_42 f0;
};

struct Eigen__TensorEvaluator_40 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_44 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_45 {
    struct Eigen__DSizes_41 f0;
    struct class_Eigen__array_42 f1;
    struct class_Eigen__array_42 f2;
    struct Eigen__TensorEvaluator_44 f3;
};

struct Eigen__TensorEvaluator_43 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_44 f1;
    struct Eigen__TensorEvaluator_45 f2;
};

struct Eigen__TensorEvaluator_39 {
    struct Eigen__TensorEvaluator_40 f0;
    struct Eigen__TensorEvaluator_43 f1;
};

struct Eigen__TensorEvaluator_47 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_45 f1;
    struct Eigen__TensorEvaluator_44 f2;
};

struct Eigen__TensorEvaluator_46 {
    struct Eigen__TensorEvaluator_40 f0;
    struct Eigen__TensorEvaluator_47 f1;
};

struct Eigen__TensorEvaluator_49 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_45 f1;
    struct Eigen__TensorEvaluator_45 f2;
};

struct Eigen__TensorEvaluator_48 {
    struct Eigen__TensorEvaluator_40 f0;
    struct Eigen__TensorEvaluator_49 f1;
};

struct class_Eigen__array_53 {
    int f0[5];
};

struct Eigen__DSizes_52 {
    struct class_Eigen__array_53 f0;
};

struct Eigen__TensorEvaluator_51 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_55 {
    struct Eigen__half* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_56 {
    struct Eigen__DSizes_52 f0;
    struct class_Eigen__array_53 f1;
    struct class_Eigen__array_53 f2;
    struct Eigen__TensorEvaluator_55 f3;
};

struct Eigen__TensorEvaluator_54 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_55 f1;
    struct Eigen__TensorEvaluator_56 f2;
};

struct Eigen__TensorEvaluator_50 {
    struct Eigen__TensorEvaluator_51 f0;
    struct Eigen__TensorEvaluator_54 f1;
};

struct Eigen__TensorEvaluator_58 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_56 f1;
    struct Eigen__TensorEvaluator_55 f2;
};

struct Eigen__TensorEvaluator_57 {
    struct Eigen__TensorEvaluator_51 f0;
    struct Eigen__TensorEvaluator_58 f1;
};

struct Eigen__TensorEvaluator_60 {
    struct Eigen__internal__scalar_sum_op f0;
    struct Eigen__TensorEvaluator_56 f1;
    struct Eigen__TensorEvaluator_56 f2;
};

struct Eigen__TensorEvaluator_59 {
    struct Eigen__TensorEvaluator_51 f0;
    struct Eigen__TensorEvaluator_60 f1;
};

struct Eigen__TensorEvaluator_62 {
    float* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_sum_op_64 {
    char f0;
};

struct Eigen__TensorEvaluator_66 {
    float* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_67 {
    float* f0;
    struct Eigen__DSizes_4 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_63 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_66 f1;
    struct Eigen__TensorEvaluator_67 f2;
};

struct Eigen__TensorEvaluator_61 {
    struct Eigen__TensorEvaluator_62 f0;
    struct Eigen__TensorEvaluator_63 f1;
};

struct Eigen__internal__scalar_left_70 {
    float* f0;
};

struct Eigen__TensorEvaluator_69 {
    struct Eigen__internal__scalar_left_70 f0;
    struct Eigen__TensorEvaluator_66 f1;
};

struct Eigen__TensorEvaluator_68 {
    struct Eigen__TensorEvaluator_62 f0;
    struct Eigen__TensorEvaluator_69 f1;
};

struct Eigen__internal__scalar_right_73 {
    float* f0;
};

struct Eigen__TensorEvaluator_72 {
    struct Eigen__internal__scalar_right_73 f0;
    struct Eigen__TensorEvaluator_66 f1;
};

struct Eigen__TensorEvaluator_71 {
    struct Eigen__TensorEvaluator_62 f0;
    struct Eigen__TensorEvaluator_72 f1;
};

struct Eigen__TensorEvaluator_76 {
    struct Eigen__DSizes f0;
    struct class_Eigen__array f1;
    struct class_Eigen__array f2;
    struct Eigen__TensorEvaluator_66 f3;
};

struct Eigen__TensorEvaluator_75 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_66 f1;
    struct Eigen__TensorEvaluator_76 f2;
};

struct Eigen__TensorEvaluator_74 {
    struct Eigen__TensorEvaluator_62 f0;
    struct Eigen__TensorEvaluator_75 f1;
};

struct Eigen__TensorEvaluator_78 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_76 f1;
    struct Eigen__TensorEvaluator_66 f2;
};

struct Eigen__TensorEvaluator_77 {
    struct Eigen__TensorEvaluator_62 f0;
    struct Eigen__TensorEvaluator_78 f1;
};

struct Eigen__TensorEvaluator_80 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_76 f1;
    struct Eigen__TensorEvaluator_76 f2;
};

struct Eigen__TensorEvaluator_79 {
    struct Eigen__TensorEvaluator_62 f0;
    struct Eigen__TensorEvaluator_80 f1;
};

struct Eigen__TensorEvaluator_82 {
    float* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_84 {
    float* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_85 {
    struct Eigen__DSizes_19 f0;
    struct class_Eigen__array_20 f1;
    struct class_Eigen__array_20 f2;
    struct Eigen__TensorEvaluator_84 f3;
};

struct Eigen__TensorEvaluator_83 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_84 f1;
    struct Eigen__TensorEvaluator_85 f2;
};

struct Eigen__TensorEvaluator_81 {
    struct Eigen__TensorEvaluator_82 f0;
    struct Eigen__TensorEvaluator_83 f1;
};

struct Eigen__TensorEvaluator_87 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_85 f1;
    struct Eigen__TensorEvaluator_84 f2;
};

struct Eigen__TensorEvaluator_86 {
    struct Eigen__TensorEvaluator_82 f0;
    struct Eigen__TensorEvaluator_87 f1;
};

struct Eigen__TensorEvaluator_89 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_85 f1;
    struct Eigen__TensorEvaluator_85 f2;
};

struct Eigen__TensorEvaluator_88 {
    struct Eigen__TensorEvaluator_82 f0;
    struct Eigen__TensorEvaluator_89 f1;
};

struct Eigen__TensorEvaluator_91 {
    float* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_93 {
    float* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_94 {
    struct Eigen__DSizes_30 f0;
    struct class_Eigen__array_31 f1;
    struct class_Eigen__array_31 f2;
    struct Eigen__TensorEvaluator_93 f3;
};

struct Eigen__TensorEvaluator_92 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_93 f1;
    struct Eigen__TensorEvaluator_94 f2;
};

struct Eigen__TensorEvaluator_90 {
    struct Eigen__TensorEvaluator_91 f0;
    struct Eigen__TensorEvaluator_92 f1;
};

struct Eigen__TensorEvaluator_96 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_94 f1;
    struct Eigen__TensorEvaluator_93 f2;
};

struct Eigen__TensorEvaluator_95 {
    struct Eigen__TensorEvaluator_91 f0;
    struct Eigen__TensorEvaluator_96 f1;
};

struct Eigen__TensorEvaluator_98 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_94 f1;
    struct Eigen__TensorEvaluator_94 f2;
};

struct Eigen__TensorEvaluator_97 {
    struct Eigen__TensorEvaluator_91 f0;
    struct Eigen__TensorEvaluator_98 f1;
};

struct Eigen__TensorEvaluator_100 {
    float* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_102 {
    float* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_103 {
    struct Eigen__DSizes_41 f0;
    struct class_Eigen__array_42 f1;
    struct class_Eigen__array_42 f2;
    struct Eigen__TensorEvaluator_102 f3;
};

struct Eigen__TensorEvaluator_101 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_102 f1;
    struct Eigen__TensorEvaluator_103 f2;
};

struct Eigen__TensorEvaluator_99 {
    struct Eigen__TensorEvaluator_100 f0;
    struct Eigen__TensorEvaluator_101 f1;
};

struct Eigen__TensorEvaluator_105 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_103 f1;
    struct Eigen__TensorEvaluator_102 f2;
};

struct Eigen__TensorEvaluator_104 {
    struct Eigen__TensorEvaluator_100 f0;
    struct Eigen__TensorEvaluator_105 f1;
};

struct Eigen__TensorEvaluator_107 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_103 f1;
    struct Eigen__TensorEvaluator_103 f2;
};

struct Eigen__TensorEvaluator_106 {
    struct Eigen__TensorEvaluator_100 f0;
    struct Eigen__TensorEvaluator_107 f1;
};

struct Eigen__TensorEvaluator_109 {
    float* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_111 {
    float* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_112 {
    struct Eigen__DSizes_52 f0;
    struct class_Eigen__array_53 f1;
    struct class_Eigen__array_53 f2;
    struct Eigen__TensorEvaluator_111 f3;
};

struct Eigen__TensorEvaluator_110 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_111 f1;
    struct Eigen__TensorEvaluator_112 f2;
};

struct Eigen__TensorEvaluator_108 {
    struct Eigen__TensorEvaluator_109 f0;
    struct Eigen__TensorEvaluator_110 f1;
};

struct Eigen__TensorEvaluator_114 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_112 f1;
    struct Eigen__TensorEvaluator_111 f2;
};

struct Eigen__TensorEvaluator_113 {
    struct Eigen__TensorEvaluator_109 f0;
    struct Eigen__TensorEvaluator_114 f1;
};

struct Eigen__TensorEvaluator_116 {
    struct Eigen__internal__scalar_sum_op_64 f0;
    struct Eigen__TensorEvaluator_112 f1;
    struct Eigen__TensorEvaluator_112 f2;
};

struct Eigen__TensorEvaluator_115 {
    struct Eigen__TensorEvaluator_109 f0;
    struct Eigen__TensorEvaluator_116 f1;
};

struct Eigen__TensorEvaluator_118 {
    float* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_sum_op_120 {
    char f0;
};

struct Eigen__TensorEvaluator_122 {
    float* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_123 {
    float* f0;
    struct Eigen__DSizes_4 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_119 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_122 f1;
    struct Eigen__TensorEvaluator_123 f2;
};

struct Eigen__TensorEvaluator_117 {
    struct Eigen__TensorEvaluator_118 f0;
    struct Eigen__TensorEvaluator_119 f1;
};

struct Eigen__internal__scalar_left_127 {
    float* f0;
};

struct Eigen__TensorEvaluator_126 {
    struct Eigen__internal__scalar_left_127 f0;
    struct Eigen__TensorEvaluator_122 f1;
};

struct Eigen__TensorEvaluator_125 {
    struct Eigen__TensorEvaluator_118 f0;
    struct Eigen__TensorEvaluator_126 f1;
};

struct Eigen__internal__scalar_right_130 {
    float* f0;
};

struct Eigen__TensorEvaluator_129 {
    struct Eigen__internal__scalar_right_130 f0;
    struct Eigen__TensorEvaluator_122 f1;
};

struct Eigen__TensorEvaluator_128 {
    struct Eigen__TensorEvaluator_118 f0;
    struct Eigen__TensorEvaluator_129 f1;
};

struct Eigen__TensorEvaluator_133 {
    struct Eigen__DSizes f0;
    struct class_Eigen__array f1;
    struct class_Eigen__array f2;
    struct Eigen__TensorEvaluator_122 f3;
};

struct Eigen__TensorEvaluator_132 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_122 f1;
    struct Eigen__TensorEvaluator_133 f2;
};

struct Eigen__TensorEvaluator_131 {
    struct Eigen__TensorEvaluator_118 f0;
    struct Eigen__TensorEvaluator_132 f1;
};

struct Eigen__TensorEvaluator_135 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_133 f1;
    struct Eigen__TensorEvaluator_122 f2;
};

struct Eigen__TensorEvaluator_134 {
    struct Eigen__TensorEvaluator_118 f0;
    struct Eigen__TensorEvaluator_135 f1;
};

struct Eigen__TensorEvaluator_137 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_133 f1;
    struct Eigen__TensorEvaluator_133 f2;
};

struct Eigen__TensorEvaluator_136 {
    struct Eigen__TensorEvaluator_118 f0;
    struct Eigen__TensorEvaluator_137 f1;
};

struct Eigen__TensorEvaluator_139 {
    float* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_141 {
    float* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_142 {
    struct Eigen__DSizes_19 f0;
    struct class_Eigen__array_20 f1;
    struct class_Eigen__array_20 f2;
    struct Eigen__TensorEvaluator_141 f3;
};

struct Eigen__TensorEvaluator_140 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_141 f1;
    struct Eigen__TensorEvaluator_142 f2;
};

struct Eigen__TensorEvaluator_138 {
    struct Eigen__TensorEvaluator_139 f0;
    struct Eigen__TensorEvaluator_140 f1;
};

struct Eigen__TensorEvaluator_144 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_142 f1;
    struct Eigen__TensorEvaluator_141 f2;
};

struct Eigen__TensorEvaluator_143 {
    struct Eigen__TensorEvaluator_139 f0;
    struct Eigen__TensorEvaluator_144 f1;
};

struct Eigen__TensorEvaluator_146 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_142 f1;
    struct Eigen__TensorEvaluator_142 f2;
};

struct Eigen__TensorEvaluator_145 {
    struct Eigen__TensorEvaluator_139 f0;
    struct Eigen__TensorEvaluator_146 f1;
};

struct Eigen__TensorEvaluator_148 {
    float* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_150 {
    float* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_151 {
    struct Eigen__DSizes_30 f0;
    struct class_Eigen__array_31 f1;
    struct class_Eigen__array_31 f2;
    struct Eigen__TensorEvaluator_150 f3;
};

struct Eigen__TensorEvaluator_149 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_150 f1;
    struct Eigen__TensorEvaluator_151 f2;
};

struct Eigen__TensorEvaluator_147 {
    struct Eigen__TensorEvaluator_148 f0;
    struct Eigen__TensorEvaluator_149 f1;
};

struct Eigen__TensorEvaluator_153 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_151 f1;
    struct Eigen__TensorEvaluator_150 f2;
};

struct Eigen__TensorEvaluator_152 {
    struct Eigen__TensorEvaluator_148 f0;
    struct Eigen__TensorEvaluator_153 f1;
};

struct Eigen__TensorEvaluator_155 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_151 f1;
    struct Eigen__TensorEvaluator_151 f2;
};

struct Eigen__TensorEvaluator_154 {
    struct Eigen__TensorEvaluator_148 f0;
    struct Eigen__TensorEvaluator_155 f1;
};

struct double2_124 {
    float f0;
    float f1;
};

struct Eigen__TensorEvaluator_157 {
    float* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_159 {
    float* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_160 {
    struct Eigen__DSizes_41 f0;
    struct class_Eigen__array_42 f1;
    struct class_Eigen__array_42 f2;
    struct Eigen__TensorEvaluator_159 f3;
};

struct Eigen__TensorEvaluator_158 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_159 f1;
    struct Eigen__TensorEvaluator_160 f2;
};

struct Eigen__TensorEvaluator_156 {
    struct Eigen__TensorEvaluator_157 f0;
    struct Eigen__TensorEvaluator_158 f1;
};

struct Eigen__TensorEvaluator_162 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_160 f1;
    struct Eigen__TensorEvaluator_159 f2;
};

struct Eigen__TensorEvaluator_161 {
    struct Eigen__TensorEvaluator_157 f0;
    struct Eigen__TensorEvaluator_162 f1;
};

struct Eigen__TensorEvaluator_164 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_160 f1;
    struct Eigen__TensorEvaluator_160 f2;
};

struct Eigen__TensorEvaluator_163 {
    struct Eigen__TensorEvaluator_157 f0;
    struct Eigen__TensorEvaluator_164 f1;
};

struct Eigen__TensorEvaluator_166 {
    float* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_168 {
    float* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_169 {
    struct Eigen__DSizes_52 f0;
    struct class_Eigen__array_53 f1;
    struct class_Eigen__array_53 f2;
    struct Eigen__TensorEvaluator_168 f3;
};

struct Eigen__TensorEvaluator_167 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_168 f1;
    struct Eigen__TensorEvaluator_169 f2;
};

struct Eigen__TensorEvaluator_165 {
    struct Eigen__TensorEvaluator_166 f0;
    struct Eigen__TensorEvaluator_167 f1;
};

struct Eigen__TensorEvaluator_171 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_169 f1;
    struct Eigen__TensorEvaluator_168 f2;
};

struct Eigen__TensorEvaluator_170 {
    struct Eigen__TensorEvaluator_166 f0;
    struct Eigen__TensorEvaluator_171 f1;
};

struct Eigen__TensorEvaluator_173 {
    struct Eigen__internal__scalar_sum_op_120 f0;
    struct Eigen__TensorEvaluator_169 f1;
    struct Eigen__TensorEvaluator_169 f2;
};

struct Eigen__TensorEvaluator_172 {
    struct Eigen__TensorEvaluator_166 f0;
    struct Eigen__TensorEvaluator_173 f1;
};

struct Eigen__TensorEvaluator_175 {
    long* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__internal__scalar_sum_op_177 {
    char f0;
};

struct Eigen__TensorEvaluator_179 {
    long* f0;
    struct Eigen__DSizes f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_180 {
    long* f0;
    struct Eigen__DSizes_4 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_176 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_179 f1;
    struct Eigen__TensorEvaluator_180 f2;
};

struct Eigen__TensorEvaluator_174 {
    struct Eigen__TensorEvaluator_175 f0;
    struct Eigen__TensorEvaluator_176 f1;
};

struct Eigen__internal__scalar_left_183 {
    long* f0;
};

struct Eigen__TensorEvaluator_182 {
    struct Eigen__internal__scalar_left_183 f0;
    struct Eigen__TensorEvaluator_179 f1;
};

struct Eigen__TensorEvaluator_181 {
    struct Eigen__TensorEvaluator_175 f0;
    struct Eigen__TensorEvaluator_182 f1;
};

struct Eigen__internal__scalar_right_186 {
    long* f0;
};

struct Eigen__TensorEvaluator_185 {
    struct Eigen__internal__scalar_right_186 f0;
    struct Eigen__TensorEvaluator_179 f1;
};

struct Eigen__TensorEvaluator_184 {
    struct Eigen__TensorEvaluator_175 f0;
    struct Eigen__TensorEvaluator_185 f1;
};

struct Eigen__TensorEvaluator_189 {
    struct Eigen__DSizes f0;
    struct class_Eigen__array f1;
    struct class_Eigen__array f2;
    struct Eigen__TensorEvaluator_179 f3;
};

struct Eigen__TensorEvaluator_188 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_179 f1;
    struct Eigen__TensorEvaluator_189 f2;
};

struct Eigen__TensorEvaluator_187 {
    struct Eigen__TensorEvaluator_175 f0;
    struct Eigen__TensorEvaluator_188 f1;
};

struct Eigen__TensorEvaluator_191 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_189 f1;
    struct Eigen__TensorEvaluator_179 f2;
};

struct Eigen__TensorEvaluator_190 {
    struct Eigen__TensorEvaluator_175 f0;
    struct Eigen__TensorEvaluator_191 f1;
};

struct Eigen__TensorEvaluator_193 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_189 f1;
    struct Eigen__TensorEvaluator_189 f2;
};

struct Eigen__TensorEvaluator_192 {
    struct Eigen__TensorEvaluator_175 f0;
    struct Eigen__TensorEvaluator_193 f1;
};

struct Eigen__TensorEvaluator_195 {
    long* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_197 {
    long* f0;
    struct Eigen__DSizes_19 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_198 {
    struct Eigen__DSizes_19 f0;
    struct class_Eigen__array_20 f1;
    struct class_Eigen__array_20 f2;
    struct Eigen__TensorEvaluator_197 f3;
};

struct Eigen__TensorEvaluator_196 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_197 f1;
    struct Eigen__TensorEvaluator_198 f2;
};

struct Eigen__TensorEvaluator_194 {
    struct Eigen__TensorEvaluator_195 f0;
    struct Eigen__TensorEvaluator_196 f1;
};

struct Eigen__TensorEvaluator_200 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_198 f1;
    struct Eigen__TensorEvaluator_197 f2;
};

struct Eigen__TensorEvaluator_199 {
    struct Eigen__TensorEvaluator_195 f0;
    struct Eigen__TensorEvaluator_200 f1;
};

struct Eigen__TensorEvaluator_202 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_198 f1;
    struct Eigen__TensorEvaluator_198 f2;
};

struct Eigen__TensorEvaluator_201 {
    struct Eigen__TensorEvaluator_195 f0;
    struct Eigen__TensorEvaluator_202 f1;
};

struct Eigen__TensorEvaluator_204 {
    long* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_206 {
    long* f0;
    struct Eigen__DSizes_30 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_207 {
    struct Eigen__DSizes_30 f0;
    struct class_Eigen__array_31 f1;
    struct class_Eigen__array_31 f2;
    struct Eigen__TensorEvaluator_206 f3;
};

struct Eigen__TensorEvaluator_205 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_206 f1;
    struct Eigen__TensorEvaluator_207 f2;
};

struct Eigen__TensorEvaluator_203 {
    struct Eigen__TensorEvaluator_204 f0;
    struct Eigen__TensorEvaluator_205 f1;
};

struct Eigen__TensorEvaluator_209 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_207 f1;
    struct Eigen__TensorEvaluator_206 f2;
};

struct Eigen__TensorEvaluator_208 {
    struct Eigen__TensorEvaluator_204 f0;
    struct Eigen__TensorEvaluator_209 f1;
};

struct Eigen__TensorEvaluator_211 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_207 f1;
    struct Eigen__TensorEvaluator_207 f2;
};

struct Eigen__TensorEvaluator_210 {
    struct Eigen__TensorEvaluator_204 f0;
    struct Eigen__TensorEvaluator_211 f1;
};

struct Eigen__TensorEvaluator_213 {
    long* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_215 {
    long* f0;
    struct Eigen__DSizes_41 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_216 {
    struct Eigen__DSizes_41 f0;
    struct class_Eigen__array_42 f1;
    struct class_Eigen__array_42 f2;
    struct Eigen__TensorEvaluator_215 f3;
};

struct Eigen__TensorEvaluator_214 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_215 f1;
    struct Eigen__TensorEvaluator_216 f2;
};

struct Eigen__TensorEvaluator_212 {
    struct Eigen__TensorEvaluator_213 f0;
    struct Eigen__TensorEvaluator_214 f1;
};

struct Eigen__TensorEvaluator_218 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_216 f1;
    struct Eigen__TensorEvaluator_215 f2;
};

struct Eigen__TensorEvaluator_217 {
    struct Eigen__TensorEvaluator_213 f0;
    struct Eigen__TensorEvaluator_218 f1;
};

struct Eigen__TensorEvaluator_220 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_216 f1;
    struct Eigen__TensorEvaluator_216 f2;
};

struct Eigen__TensorEvaluator_219 {
    struct Eigen__TensorEvaluator_213 f0;
    struct Eigen__TensorEvaluator_220 f1;
};

struct Eigen__TensorEvaluator_222 {
    long* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_224 {
    long* f0;
    struct Eigen__DSizes_52 f1;
    struct Eigen__GpuDevice* f2;
};

struct Eigen__TensorEvaluator_225 {
    struct Eigen__DSizes_52 f0;
    struct class_Eigen__array_53 f1;
    struct class_Eigen__array_53 f2;
    struct Eigen__TensorEvaluator_224 f3;
};

struct Eigen__TensorEvaluator_223 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_224 f1;
    struct Eigen__TensorEvaluator_225 f2;
};

struct Eigen__TensorEvaluator_221 {
    struct Eigen__TensorEvaluator_222 f0;
    struct Eigen__TensorEvaluator_223 f1;
};

struct Eigen__TensorEvaluator_227 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_225 f1;
    struct Eigen__TensorEvaluator_224 f2;
};

struct Eigen__TensorEvaluator_226 {
    struct Eigen__TensorEvaluator_222 f0;
    struct Eigen__TensorEvaluator_227 f1;
};

struct Eigen__TensorEvaluator_229 {
    struct Eigen__internal__scalar_sum_op_177 f0;
    struct Eigen__TensorEvaluator_225 f1;
    struct Eigen__TensorEvaluator_225 f2;
};

struct Eigen__TensorEvaluator_228 {
    struct Eigen__TensorEvaluator_222 f0;
    struct Eigen__TensorEvaluator_229 f1;
};


kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator* memcopied_eval, long size) {
long i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    long v6 = v5;
    int v7 = get_num_groups(0);
    int v8 = v7 * v2;
    long v9 = v8;
    char*v10 = (char*)eval;
    global char*v12 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v10)[__i] = ((global int2 *)v12)[__i];
    }
    struct Eigen__TensorEvaluator_2* v14 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_2* v15 = &memcopied_eval[0].f1.f1;
    char*v16 = (char*)v14;
    global char*v17 = (global char*)v15;
    #pragma unroll
    for(int __i=0; __i < 6; __i++) {
        (( int2 *)v16)[__i] = ((global int2 *)v17)[__i];
    }
    bool v19 = v6 < size;
    if(v19) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v21 = (char*)v0;
    struct Eigen__half** v22 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_1* v23 = &eval[0].f1;
    short* v24 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v22[0];
        i_01_i = v6;
    goto label2;
    label2:;
    long sext_i_i = i_01_i << 32;
    long v27 = sext_i_i >> 32;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS6_INS7_IS8_Li1ELi1ElEELi16EEEEENS_9GpuDeviceEE5coeffEl(v0, v23, i_01_i);
    short v29 = v24[0];
    short* v30 = &v_pre[v27].f0.f0.f0;
    v30[0] = v29;
    long v33 = i_01_i + v9;
    bool v34 = v33 < size;
    if(v34) {
        i_01_i = v33;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS6_INS7_IS8_Li1ELi1ElEELi16EEEEENS_9GpuDeviceEE5coeffEl(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_1* this, long index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global struct Eigen__half** v0 = &this[0].f1.f0;
    struct Eigen__half* v1 = v0[0];
    long sext = index << 32;
    long v2 = sext >> 32;
    short* v_idx_i = &v1[v2].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    global struct Eigen__half** v3 = &this[0].f2.f0;
    struct Eigen__half* v4 = v3[0];
    short* v_idx_i1 = &v4[index].f0.f0.f0;
    short v_idx_val_i2 = v_idx_i1[0];
    int v5 = v_idx_val_i;
    int v6 = v5 << 13;
    int v7 = v6 & 268427264;
    int v8 = v6 & 260046848;
    bool v9 = v8 == 260046848;
    if(v9) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v11 = v6 | 1879048192;
        o_sroa_0_0_i_i_i_i = v11;
    goto label4;
    label2:;
    int v13 = v7 + 939524096;
    bool v14 = v8 == 0;
    if(v14) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v13;
        goto label4;
    }
    label3:;
    int v16 = v7 + 947912704;
    float v17 = [0];
    floatv18 = (float)v16;
    float v19 = v18 - v17;
    intv20 = (int)v19;
        o_sroa_0_0_i_i_i_i = v20;
    goto label4;
    label4:;
    int v22 = v5 << 16;
    int v23 = v22 & -2147483648;
    int v24 = o_sroa_0_0_i_i_i_i | v23;
    floatv25 = (float)v24;
    int v26 = v_idx_val_i2;
    int v27 = v26 << 13;
    int v28 = v27 & 268427264;
    int v29 = v27 & 260046848;
    bool v30 = v29 == 260046848;
    if(v30) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v32 = v27 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v32;
    goto label8;
    label6:;
    int v34 = v28 + 939524096;
    bool v35 = v29 == 0;
    if(v35) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v34;
        goto label8;
    }
    label7:;
    int v37 = v28 + 947912704;
    float v38 = [0];
    floatv39 = (float)v37;
    float v40 = v39 - v38;
    intv41 = (int)v40;
        o_sroa_0_0_i_i1_i_i = v41;
    goto label8;
    label8:;
    int v43 = v26 << 16;
    int v44 = v43 & -2147483648;
    int v45 = o_sroa_0_0_i_i1_i_i | v44;
    floatv46 = (float)v45;
    float v47 = v25 + v46;
    intv48 = (int)v47;
    int v49 = v48 & -2147483648;
    int v50 = v49 ^ v48;
    int v51 = [0];
    bool v52 = v50 < v51;
    if(v52) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v54 = [0];
    bool v55 = v50 > v54;
    int v56 = v55 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v56;
    goto label13;
    label10:;
    bool v58 = v50 < 947912704;
    if(v58) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v60 = [0];
    floatv61 = (float)v50;
    float v62 = v61 + v60;
    intv63 = (int)v62;
    intv_cast_i_i_i_i = (int)v60;
    int v64 = v63 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v64;
    goto label13;
    label12:;
    int v66 = v48 >> 13;
    int v67 = v66 & 1;
    int v68 = v48 + 134221823;
    int v69 = v68 + v67;
    int v70 = v69 >> 13;
        v_sroa_0_0_i_i_i_i = v70;
    goto label13;
    label13:;
    int v72 = v49 >> 16;
    int v73 = v_sroa_0_0_i_i_i_i | v72;
    short v74 = (short)v73;
    global short* v75 = &agg_result[0].f0.f0.f0;
    v75[0] = v74;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_6* memcopied_eval, int size) {
int i_01_i;
int o_sroa_0_0_i_i_i_i_i_i;
int o_sroa_0_0_i_i1_i_i_i_i;
int v_sroa_0_0_i_i_i_i_i_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global struct Eigen__half** v7 = &memcopied_eval[0].f0.f0;
    struct Eigen__half* v8 = v7[0];
    global struct Eigen__half** v9 = &memcopied_eval[0].f1.f1.f0;
    struct Eigen__half* v10 = v9[0];
    bool v11 = v4 < size;
    if(v11) {
        goto label1;
    } else {
        goto label17;
    }
    label1:;
    global struct Eigen__half** v13 = &memcopied_eval[0].f1.f0.f0;
    struct Eigen__half* v14 = v13[0];
    short* v15 = &v14[0].f0.f0.f0;
    int v16 = [0];
        i_01_i = v4;
    goto label2;
    label2:;
    long v18 = i_01_i;
    short* v_idx_i_i = &v10[v18].f0.f0.f0;
    short v_idx_val_i_i = v_idx_i_i[0];
    short v19 = v15[0];
    int v20 = v19;
    int v21 = v20 << 13;
    int v22 = v21 & 268427264;
    int v23 = v21 & 260046848;
    bool v24 = v23 == 260046848;
    if(v24) {
        goto label3;
    } else {
        goto label4;
    }
    label3:;
    int v26 = v21 | 1879048192;
        o_sroa_0_0_i_i_i_i_i_i = v26;
    goto label6;
    label4:;
    int v28 = v22 + 939524096;
    bool v29 = v23 == 0;
    if(v29) {
        goto label5;
    } else {
        o_sroa_0_0_i_i_i_i_i_i = v28;
        goto label6;
    }
    label5:;
    int v31 = v22 + 947912704;
    float v32 = [0];
    floatv33 = (float)v31;
    float v34 = v33 - v32;
    intv35 = (int)v34;
        o_sroa_0_0_i_i_i_i_i_i = v35;
    goto label6;
    label6:;
    int v37 = v20 << 16;
    int v38 = v37 & -2147483648;
    int v39 = o_sroa_0_0_i_i_i_i_i_i | v38;
    floatv40 = (float)v39;
    int v41 = v_idx_val_i_i;
    int v42 = v41 << 13;
    int v43 = v42 & 268427264;
    int v44 = v42 & 260046848;
    bool v45 = v44 == 260046848;
    if(v45) {
        goto label7;
    } else {
        goto label8;
    }
    label7:;
    int v47 = v42 | 1879048192;
        o_sroa_0_0_i_i1_i_i_i_i = v47;
    goto label10;
    label8:;
    int v49 = v43 + 939524096;
    bool v50 = v44 == 0;
    if(v50) {
        goto label9;
    } else {
        o_sroa_0_0_i_i1_i_i_i_i = v49;
        goto label10;
    }
    label9:;
    int v52 = v43 + 947912704;
    float v53 = [0];
    floatv54 = (float)v52;
    float v55 = v54 - v53;
    intv56 = (int)v55;
        o_sroa_0_0_i_i1_i_i_i_i = v56;
    goto label10;
    label10:;
    int v58 = v41 << 16;
    int v59 = v58 & -2147483648;
    int v60 = o_sroa_0_0_i_i1_i_i_i_i | v59;
    floatv61 = (float)v60;
    float v62 = v40 + v61;
    intv63 = (int)v62;
    int v64 = v63 & -2147483648;
    int v65 = v64 ^ v63;
    bool v66 = v65 < v16;
    if(v66) {
        goto label12;
    } else {
        goto label11;
    }
    label11:;
    int v68 = [0];
    bool v69 = v65 > v68;
    int v70 = v69 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i_i_i = v70;
    goto label15;
    label12:;
    bool v72 = v65 < 947912704;
    if(v72) {
        goto label13;
    } else {
        goto label14;
    }
    label13:;
    float v74 = [0];
    floatv75 = (float)v65;
    float v76 = v75 + v74;
    intv77 = (int)v76;
    intv_cast_i_i_i_i_i_i = (int)v74;
    int v78 = v77 - v_cast_i_i_i_i_i_i;
        v_sroa_0_0_i_i_i_i_i_i = v78;
    goto label15;
    label14:;
    int v80 = v63 >> 13;
    int v81 = v80 & 1;
    int v82 = v63 + 134221823;
    int v83 = v82 + v81;
    int v84 = v83 >> 13;
        v_sroa_0_0_i_i_i_i_i_i = v84;
    goto label15;
    label15:;
    int v86 = v64 >> 16;
    int v87 = v_sroa_0_0_i_i_i_i_i_i | v86;
    short v88 = (short)v87;
    short* v89 = &v8[v18].f0.f0.f0;
    v89[0] = v88;
    int v91 = i_01_i + v6;
    bool v92 = v91 < size;
    if(v92) {
        i_01_i = v91;
        goto label2;
    } else {
        goto label16;
    }
    label16:;
        goto label17;
    label17:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_8* memcopied_eval, int size) {
int i_01_i;
int o_sroa_0_0_i_i_i_i_i_i;
int o_sroa_0_0_i_i1_i_i_i_i;
int v_sroa_0_0_i_i_i_i_i_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global struct Eigen__half** v7 = &memcopied_eval[0].f0.f0;
    struct Eigen__half* v8 = v7[0];
    global struct Eigen__half** v9 = &memcopied_eval[0].f1.f1.f0;
    struct Eigen__half* v10 = v9[0];
    bool v11 = v4 < size;
    if(v11) {
        goto label1;
    } else {
        goto label17;
    }
    label1:;
    global struct Eigen__half** v13 = &memcopied_eval[0].f1.f0.f0;
    struct Eigen__half* v14 = v13[0];
    short* v15 = &v14[0].f0.f0.f0;
    int v16 = [0];
        i_01_i = v4;
    goto label2;
    label2:;
    long v18 = i_01_i;
    short* v_idx_i_i = &v10[v18].f0.f0.f0;
    short v_idx_val_i_i = v_idx_i_i[0];
    int v19 = v_idx_val_i_i;
    int v20 = v19 << 13;
    int v21 = v20 & 268427264;
    int v22 = v20 & 260046848;
    bool v23 = v22 == 260046848;
    if(v23) {
        goto label3;
    } else {
        goto label4;
    }
    label3:;
    int v25 = v20 | 1879048192;
        o_sroa_0_0_i_i_i_i_i_i = v25;
    goto label6;
    label4:;
    int v27 = v21 + 939524096;
    bool v28 = v22 == 0;
    if(v28) {
        goto label5;
    } else {
        o_sroa_0_0_i_i_i_i_i_i = v27;
        goto label6;
    }
    label5:;
    int v30 = v21 + 947912704;
    float v31 = [0];
    floatv32 = (float)v30;
    float v33 = v32 - v31;
    intv34 = (int)v33;
        o_sroa_0_0_i_i_i_i_i_i = v34;
    goto label6;
    label6:;
    int v36 = v19 << 16;
    int v37 = v36 & -2147483648;
    int v38 = o_sroa_0_0_i_i_i_i_i_i | v37;
    floatv39 = (float)v38;
    short v40 = v15[0];
    int v41 = v40;
    int v42 = v41 << 13;
    int v43 = v42 & 268427264;
    int v44 = v42 & 260046848;
    bool v45 = v44 == 260046848;
    if(v45) {
        goto label7;
    } else {
        goto label8;
    }
    label7:;
    int v47 = v42 | 1879048192;
        o_sroa_0_0_i_i1_i_i_i_i = v47;
    goto label10;
    label8:;
    int v49 = v43 + 939524096;
    bool v50 = v44 == 0;
    if(v50) {
        goto label9;
    } else {
        o_sroa_0_0_i_i1_i_i_i_i = v49;
        goto label10;
    }
    label9:;
    int v52 = v43 + 947912704;
    float v53 = [0];
    floatv54 = (float)v52;
    float v55 = v54 - v53;
    intv56 = (int)v55;
        o_sroa_0_0_i_i1_i_i_i_i = v56;
    goto label10;
    label10:;
    int v58 = v41 << 16;
    int v59 = v58 & -2147483648;
    int v60 = o_sroa_0_0_i_i1_i_i_i_i | v59;
    floatv61 = (float)v60;
    float v62 = v39 + v61;
    intv63 = (int)v62;
    int v64 = v63 & -2147483648;
    int v65 = v64 ^ v63;
    bool v66 = v65 < v16;
    if(v66) {
        goto label12;
    } else {
        goto label11;
    }
    label11:;
    int v68 = [0];
    bool v69 = v65 > v68;
    int v70 = v69 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i_i_i = v70;
    goto label15;
    label12:;
    bool v72 = v65 < 947912704;
    if(v72) {
        goto label13;
    } else {
        goto label14;
    }
    label13:;
    float v74 = [0];
    floatv75 = (float)v65;
    float v76 = v75 + v74;
    intv77 = (int)v76;
    intv_cast_i_i_i_i_i_i = (int)v74;
    int v78 = v77 - v_cast_i_i_i_i_i_i;
        v_sroa_0_0_i_i_i_i_i_i = v78;
    goto label15;
    label14:;
    int v80 = v63 >> 13;
    int v81 = v80 & 1;
    int v82 = v63 + 134221823;
    int v83 = v82 + v81;
    int v84 = v83 >> 13;
        v_sroa_0_0_i_i_i_i_i_i = v84;
    goto label15;
    label15:;
    int v86 = v64 >> 16;
    int v87 = v_sroa_0_0_i_i_i_i_i_i | v86;
    short v88 = (short)v87;
    short* v89 = &v8[v18].f0.f0.f0;
    v89[0] = v88;
    int v91 = i_01_i + v6;
    bool v92 = v91 < size;
    if(v92) {
        i_01_i = v91;
        goto label2;
    } else {
        goto label16;
    }
    label16:;
        goto label17;
    label17:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_10* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_10 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_2* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_2* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 8; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_11* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESB_EEEENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESB_EEEENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_11* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global struct Eigen__half** v0 = &this[0].f1.f0;
    struct Eigen__half* v1 = v0[0];
    long v2 = index;
    short* v_idx_i = &v1[v2].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    global int* v3 = &this[0].f2.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = index % v4;
    global struct Eigen__half** v6 = &this[0].f2.f3.f0;
    struct Eigen__half* v7 = v6[0];
    long v8 = v5;
    short* v_idx_i_i_i = &v7[v8].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    int v9 = v_idx_val_i;
    int v10 = v9 << 13;
    int v11 = v10 & 268427264;
    int v12 = v10 & 260046848;
    bool v13 = v12 == 260046848;
    if(v13) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v15 = v10 | 1879048192;
        o_sroa_0_0_i_i_i_i = v15;
    goto label4;
    label2:;
    int v17 = v11 + 939524096;
    bool v18 = v12 == 0;
    if(v18) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v17;
        goto label4;
    }
    label3:;
    int v20 = v11 + 947912704;
    float v21 = [0];
    floatv22 = (float)v20;
    float v23 = v22 - v21;
    intv24 = (int)v23;
        o_sroa_0_0_i_i_i_i = v24;
    goto label4;
    label4:;
    int v26 = v9 << 16;
    int v27 = v26 & -2147483648;
    int v28 = o_sroa_0_0_i_i_i_i | v27;
    floatv29 = (float)v28;
    int v30 = v_idx_val_i_i_i;
    int v31 = v30 << 13;
    int v32 = v31 & 268427264;
    int v33 = v31 & 260046848;
    bool v34 = v33 == 260046848;
    if(v34) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v36 = v31 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v36;
    goto label8;
    label6:;
    int v38 = v32 + 939524096;
    bool v39 = v33 == 0;
    if(v39) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v38;
        goto label8;
    }
    label7:;
    int v41 = v32 + 947912704;
    float v42 = [0];
    floatv43 = (float)v41;
    float v44 = v43 - v42;
    intv45 = (int)v44;
        o_sroa_0_0_i_i1_i_i = v45;
    goto label8;
    label8:;
    int v47 = v30 << 16;
    int v48 = v47 & -2147483648;
    int v49 = o_sroa_0_0_i_i1_i_i | v48;
    floatv50 = (float)v49;
    float v51 = v29 + v50;
    intv52 = (int)v51;
    int v53 = v52 & -2147483648;
    int v54 = v53 ^ v52;
    int v55 = [0];
    bool v56 = v54 < v55;
    if(v56) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v58 = [0];
    bool v59 = v54 > v58;
    int v60 = v59 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v60;
    goto label13;
    label10:;
    bool v62 = v54 < 947912704;
    if(v62) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v64 = [0];
    floatv65 = (float)v54;
    float v66 = v65 + v64;
    intv67 = (int)v66;
    intv_cast_i_i_i_i = (int)v64;
    int v68 = v67 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v68;
    goto label13;
    label12:;
    int v70 = v52 >> 13;
    int v71 = v70 & 1;
    int v72 = v52 + 134221823;
    int v73 = v72 + v71;
    int v74 = v73 >> 13;
        v_sroa_0_0_i_i_i_i = v74;
    goto label13;
    label13:;
    int v76 = v53 >> 16;
    int v77 = v_sroa_0_0_i_i_i_i | v76;
    short v78 = (short)v77;
    global short* v79 = &agg_result[0].f0.f0.f0;
    v79[0] = v78;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_13* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_13 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_12* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_12* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 8; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_14* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_14* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f3.f1.f0.f0[0];
    int v1 = v0[0];
    int v2 = index % v1;
    global struct Eigen__half** v3 = &this[0].f1.f3.f0;
    struct Eigen__half* v4 = v3[0];
    long v5 = v2;
    short* v_idx_i_i_i = &v4[v5].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global struct Eigen__half** v6 = &this[0].f2.f0;
    struct Eigen__half* v7 = v6[0];
    long v8 = index;
    short* v_idx_i = &v7[v8].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    int v9 = v_idx_val_i_i_i;
    int v10 = v9 << 13;
    int v11 = v10 & 268427264;
    int v12 = v10 & 260046848;
    bool v13 = v12 == 260046848;
    if(v13) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v15 = v10 | 1879048192;
        o_sroa_0_0_i_i_i_i = v15;
    goto label4;
    label2:;
    int v17 = v11 + 939524096;
    bool v18 = v12 == 0;
    if(v18) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v17;
        goto label4;
    }
    label3:;
    int v20 = v11 + 947912704;
    float v21 = [0];
    floatv22 = (float)v20;
    float v23 = v22 - v21;
    intv24 = (int)v23;
        o_sroa_0_0_i_i_i_i = v24;
    goto label4;
    label4:;
    int v26 = v9 << 16;
    int v27 = v26 & -2147483648;
    int v28 = o_sroa_0_0_i_i_i_i | v27;
    floatv29 = (float)v28;
    int v30 = v_idx_val_i;
    int v31 = v30 << 13;
    int v32 = v31 & 268427264;
    int v33 = v31 & 260046848;
    bool v34 = v33 == 260046848;
    if(v34) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v36 = v31 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v36;
    goto label8;
    label6:;
    int v38 = v32 + 939524096;
    bool v39 = v33 == 0;
    if(v39) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v38;
        goto label8;
    }
    label7:;
    int v41 = v32 + 947912704;
    float v42 = [0];
    floatv43 = (float)v41;
    float v44 = v43 - v42;
    intv45 = (int)v44;
        o_sroa_0_0_i_i1_i_i = v45;
    goto label8;
    label8:;
    int v47 = v30 << 16;
    int v48 = v47 & -2147483648;
    int v49 = o_sroa_0_0_i_i1_i_i | v48;
    floatv50 = (float)v49;
    float v51 = v29 + v50;
    intv52 = (int)v51;
    int v53 = v52 & -2147483648;
    int v54 = v53 ^ v52;
    int v55 = [0];
    bool v56 = v54 < v55;
    if(v56) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v58 = [0];
    bool v59 = v54 > v58;
    int v60 = v59 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v60;
    goto label13;
    label10:;
    bool v62 = v54 < 947912704;
    if(v62) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v64 = [0];
    floatv65 = (float)v54;
    float v66 = v65 + v64;
    intv67 = (int)v66;
    intv_cast_i_i_i_i = (int)v64;
    int v68 = v67 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v68;
    goto label13;
    label12:;
    int v70 = v52 >> 13;
    int v71 = v70 & 1;
    int v72 = v52 + 134221823;
    int v73 = v72 + v71;
    int v74 = v73 >> 13;
        v_sroa_0_0_i_i_i_i = v74;
    goto label13;
    label13:;
    int v76 = v53 >> 16;
    int v77 = v_sroa_0_0_i_i_i_i | v76;
    short v78 = (short)v77;
    global short* v79 = &agg_result[0].f0.f0.f0;
    v79[0] = v78;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_15* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_15 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_12* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_12* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 10; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_16* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_16* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f3.f1.f0.f0[0];
    int v1 = v0[0];
    int v2 = index % v1;
    global struct Eigen__half** v3 = &this[0].f1.f3.f0;
    struct Eigen__half* v4 = v3[0];
    long v5 = v2;
    short* v_idx_i_i_i = &v4[v5].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global int* v6 = &this[0].f2.f3.f1.f0.f0[0];
    int v7 = v6[0];
    int v8 = index % v7;
    global struct Eigen__half** v9 = &this[0].f2.f3.f0;
    struct Eigen__half* v10 = v9[0];
    long v11 = v8;
    short* v_idx_i_i_i1 = &v10[v11].f0.f0.f0;
    short v_idx_val_i_i_i2 = v_idx_i_i_i1[0];
    int v12 = v_idx_val_i_i_i;
    int v13 = v12 << 13;
    int v14 = v13 & 268427264;
    int v15 = v13 & 260046848;
    bool v16 = v15 == 260046848;
    if(v16) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v18 = v13 | 1879048192;
        o_sroa_0_0_i_i_i_i = v18;
    goto label4;
    label2:;
    int v20 = v14 + 939524096;
    bool v21 = v15 == 0;
    if(v21) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v20;
        goto label4;
    }
    label3:;
    int v23 = v14 + 947912704;
    float v24 = [0];
    floatv25 = (float)v23;
    float v26 = v25 - v24;
    intv27 = (int)v26;
        o_sroa_0_0_i_i_i_i = v27;
    goto label4;
    label4:;
    int v29 = v12 << 16;
    int v30 = v29 & -2147483648;
    int v31 = o_sroa_0_0_i_i_i_i | v30;
    floatv32 = (float)v31;
    int v33 = v_idx_val_i_i_i2;
    int v34 = v33 << 13;
    int v35 = v34 & 268427264;
    int v36 = v34 & 260046848;
    bool v37 = v36 == 260046848;
    if(v37) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v39 = v34 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v39;
    goto label8;
    label6:;
    int v41 = v35 + 939524096;
    bool v42 = v36 == 0;
    if(v42) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v41;
        goto label8;
    }
    label7:;
    int v44 = v35 + 947912704;
    float v45 = [0];
    floatv46 = (float)v44;
    float v47 = v46 - v45;
    intv48 = (int)v47;
        o_sroa_0_0_i_i1_i_i = v48;
    goto label8;
    label8:;
    int v50 = v33 << 16;
    int v51 = v50 & -2147483648;
    int v52 = o_sroa_0_0_i_i1_i_i | v51;
    floatv53 = (float)v52;
    float v54 = v32 + v53;
    intv55 = (int)v54;
    int v56 = v55 & -2147483648;
    int v57 = v56 ^ v55;
    int v58 = [0];
    bool v59 = v57 < v58;
    if(v59) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v61 = [0];
    bool v62 = v57 > v61;
    int v63 = v62 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v63;
    goto label13;
    label10:;
    bool v65 = v57 < 947912704;
    if(v65) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v67 = [0];
    floatv68 = (float)v57;
    float v69 = v68 + v67;
    intv70 = (int)v69;
    intv_cast_i_i_i_i = (int)v67;
    int v71 = v70 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v71;
    goto label13;
    label12:;
    int v73 = v55 >> 13;
    int v74 = v73 & 1;
    int v75 = v55 + 134221823;
    int v76 = v75 + v74;
    int v77 = v76 >> 13;
        v_sroa_0_0_i_i_i_i = v77;
    goto label13;
    label13:;
    int v79 = v56 >> 16;
    int v80 = v_sroa_0_0_i_i_i_i | v79;
    short v81 = (short)v80;
    global short* v82 = &agg_result[0].f0.f0.f0;
    v82[0] = v81;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_17* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_17 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_22* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_22* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 9; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_21* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESB_EEEENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESB_EEEENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_21* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global struct Eigen__half** v0 = &this[0].f1.f0;
    struct Eigen__half* v1 = v0[0];
    long v2 = index;
    short* v_idx_i = &v1[v2].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    global int* v3 = &this[0].f2.f1.f0[0];
    int v4 = v3[0];
    int v5 = index / v4;
    global int* v6 = &this[0].f2.f3.f1.f0.f0[0];
    int v7 = v6[0];
    int v8 = v5 % v7;
    global int* v9 = &this[0].f2.f2.f0[0];
    int v10 = v9[0];
    int v11 = v10 * v8;
    int v12 = v5 * v4;
    int v13 = index - v12;
    global int* v14 = &this[0].f2.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    int v17 = v16 + v11;
    global struct Eigen__half** v18 = &this[0].f2.f3.f0;
    struct Eigen__half* v19 = v18[0];
    long v20 = v17;
    short* v_idx_i_i_i = &v19[v20].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    int v21 = v_idx_val_i;
    int v22 = v21 << 13;
    int v23 = v22 & 268427264;
    int v24 = v22 & 260046848;
    bool v25 = v24 == 260046848;
    if(v25) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v27 = v22 | 1879048192;
        o_sroa_0_0_i_i_i_i = v27;
    goto label4;
    label2:;
    int v29 = v23 + 939524096;
    bool v30 = v24 == 0;
    if(v30) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v29;
        goto label4;
    }
    label3:;
    int v32 = v23 + 947912704;
    float v33 = [0];
    floatv34 = (float)v32;
    float v35 = v34 - v33;
    intv36 = (int)v35;
        o_sroa_0_0_i_i_i_i = v36;
    goto label4;
    label4:;
    int v38 = v21 << 16;
    int v39 = v38 & -2147483648;
    int v40 = o_sroa_0_0_i_i_i_i | v39;
    floatv41 = (float)v40;
    int v42 = v_idx_val_i_i_i;
    int v43 = v42 << 13;
    int v44 = v43 & 268427264;
    int v45 = v43 & 260046848;
    bool v46 = v45 == 260046848;
    if(v46) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v48 = v43 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v48;
    goto label8;
    label6:;
    int v50 = v44 + 939524096;
    bool v51 = v45 == 0;
    if(v51) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v50;
        goto label8;
    }
    label7:;
    int v53 = v44 + 947912704;
    float v54 = [0];
    floatv55 = (float)v53;
    float v56 = v55 - v54;
    intv57 = (int)v56;
        o_sroa_0_0_i_i1_i_i = v57;
    goto label8;
    label8:;
    int v59 = v42 << 16;
    int v60 = v59 & -2147483648;
    int v61 = o_sroa_0_0_i_i1_i_i | v60;
    floatv62 = (float)v61;
    float v63 = v41 + v62;
    intv64 = (int)v63;
    int v65 = v64 & -2147483648;
    int v66 = v65 ^ v64;
    int v67 = [0];
    bool v68 = v66 < v67;
    if(v68) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v70 = [0];
    bool v71 = v66 > v70;
    int v72 = v71 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v72;
    goto label13;
    label10:;
    bool v74 = v66 < 947912704;
    if(v74) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v76 = [0];
    floatv77 = (float)v66;
    float v78 = v77 + v76;
    intv79 = (int)v78;
    intv_cast_i_i_i_i = (int)v76;
    int v80 = v79 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v80;
    goto label13;
    label12:;
    int v82 = v64 >> 13;
    int v83 = v82 & 1;
    int v84 = v64 + 134221823;
    int v85 = v84 + v83;
    int v86 = v85 >> 13;
        v_sroa_0_0_i_i_i_i = v86;
    goto label13;
    label13:;
    int v88 = v65 >> 16;
    int v89 = v_sroa_0_0_i_i_i_i | v88;
    short v90 = (short)v89;
    global short* v91 = &agg_result[0].f0.f0.f0;
    v91[0] = v90;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_24* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_24 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_23* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_23* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 9; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_25* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_25* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f3.f1.f0.f0[1];
    int v12 = v11[0];
    int v13 = v10 % v12;
    int v14 = v13 + v8;
    global struct Eigen__half** v15 = &this[0].f1.f3.f0;
    struct Eigen__half* v16 = v15[0];
    long v17 = v14;
    short* v_idx_i_i_i = &v16[v17].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global struct Eigen__half** v18 = &this[0].f2.f0;
    struct Eigen__half* v19 = v18[0];
    long v20 = index;
    short* v_idx_i = &v19[v20].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    int v21 = v_idx_val_i_i_i;
    int v22 = v21 << 13;
    int v23 = v22 & 268427264;
    int v24 = v22 & 260046848;
    bool v25 = v24 == 260046848;
    if(v25) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v27 = v22 | 1879048192;
        o_sroa_0_0_i_i_i_i = v27;
    goto label4;
    label2:;
    int v29 = v23 + 939524096;
    bool v30 = v24 == 0;
    if(v30) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v29;
        goto label4;
    }
    label3:;
    int v32 = v23 + 947912704;
    float v33 = [0];
    floatv34 = (float)v32;
    float v35 = v34 - v33;
    intv36 = (int)v35;
        o_sroa_0_0_i_i_i_i = v36;
    goto label4;
    label4:;
    int v38 = v21 << 16;
    int v39 = v38 & -2147483648;
    int v40 = o_sroa_0_0_i_i_i_i | v39;
    floatv41 = (float)v40;
    int v42 = v_idx_val_i;
    int v43 = v42 << 13;
    int v44 = v43 & 268427264;
    int v45 = v43 & 260046848;
    bool v46 = v45 == 260046848;
    if(v46) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v48 = v43 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v48;
    goto label8;
    label6:;
    int v50 = v44 + 939524096;
    bool v51 = v45 == 0;
    if(v51) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v50;
        goto label8;
    }
    label7:;
    int v53 = v44 + 947912704;
    float v54 = [0];
    floatv55 = (float)v53;
    float v56 = v55 - v54;
    intv57 = (int)v56;
        o_sroa_0_0_i_i1_i_i = v57;
    goto label8;
    label8:;
    int v59 = v42 << 16;
    int v60 = v59 & -2147483648;
    int v61 = o_sroa_0_0_i_i1_i_i | v60;
    floatv62 = (float)v61;
    float v63 = v41 + v62;
    intv64 = (int)v63;
    int v65 = v64 & -2147483648;
    int v66 = v65 ^ v64;
    int v67 = [0];
    bool v68 = v66 < v67;
    if(v68) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v70 = [0];
    bool v71 = v66 > v70;
    int v72 = v71 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v72;
    goto label13;
    label10:;
    bool v74 = v66 < 947912704;
    if(v74) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v76 = [0];
    floatv77 = (float)v66;
    float v78 = v77 + v76;
    intv79 = (int)v78;
    intv_cast_i_i_i_i = (int)v76;
    int v80 = v79 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v80;
    goto label13;
    label12:;
    int v82 = v64 >> 13;
    int v83 = v82 & 1;
    int v84 = v64 + 134221823;
    int v85 = v84 + v83;
    int v86 = v85 >> 13;
        v_sroa_0_0_i_i_i_i = v86;
    goto label13;
    label13:;
    int v88 = v65 >> 16;
    int v89 = v_sroa_0_0_i_i_i_i | v88;
    short v90 = (short)v89;
    global short* v91 = &agg_result[0].f0.f0.f0;
    v91[0] = v90;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_26* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_26 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_23* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_23* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 12; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_27* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_27* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f3.f1.f0.f0[1];
    int v12 = v11[0];
    int v13 = v10 % v12;
    int v14 = v13 + v8;
    global struct Eigen__half** v15 = &this[0].f1.f3.f0;
    struct Eigen__half* v16 = v15[0];
    long v17 = v14;
    short* v_idx_i_i_i = &v16[v17].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global int* v18 = &this[0].f2.f1.f0[0];
    int v19 = v18[0];
    int v20 = index / v19;
    global int* v21 = &this[0].f2.f3.f1.f0.f0[0];
    int v22 = v21[0];
    int v23 = v20 % v22;
    global int* v24 = &this[0].f2.f2.f0[0];
    int v25 = v24[0];
    int v26 = v25 * v23;
    int v27 = v20 * v19;
    int v28 = index - v27;
    global int* v29 = &this[0].f2.f3.f1.f0.f0[1];
    int v30 = v29[0];
    int v31 = v28 % v30;
    int v32 = v31 + v26;
    global struct Eigen__half** v33 = &this[0].f2.f3.f0;
    struct Eigen__half* v34 = v33[0];
    long v35 = v32;
    short* v_idx_i_i_i1 = &v34[v35].f0.f0.f0;
    short v_idx_val_i_i_i2 = v_idx_i_i_i1[0];
    int v36 = v_idx_val_i_i_i;
    int v37 = v36 << 13;
    int v38 = v37 & 268427264;
    int v39 = v37 & 260046848;
    bool v40 = v39 == 260046848;
    if(v40) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v42 = v37 | 1879048192;
        o_sroa_0_0_i_i_i_i = v42;
    goto label4;
    label2:;
    int v44 = v38 + 939524096;
    bool v45 = v39 == 0;
    if(v45) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v44;
        goto label4;
    }
    label3:;
    int v47 = v38 + 947912704;
    float v48 = [0];
    floatv49 = (float)v47;
    float v50 = v49 - v48;
    intv51 = (int)v50;
        o_sroa_0_0_i_i_i_i = v51;
    goto label4;
    label4:;
    int v53 = v36 << 16;
    int v54 = v53 & -2147483648;
    int v55 = o_sroa_0_0_i_i_i_i | v54;
    floatv56 = (float)v55;
    int v57 = v_idx_val_i_i_i2;
    int v58 = v57 << 13;
    int v59 = v58 & 268427264;
    int v60 = v58 & 260046848;
    bool v61 = v60 == 260046848;
    if(v61) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v63 = v58 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v63;
    goto label8;
    label6:;
    int v65 = v59 + 939524096;
    bool v66 = v60 == 0;
    if(v66) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v65;
        goto label8;
    }
    label7:;
    int v68 = v59 + 947912704;
    float v69 = [0];
    floatv70 = (float)v68;
    float v71 = v70 - v69;
    intv72 = (int)v71;
        o_sroa_0_0_i_i1_i_i = v72;
    goto label8;
    label8:;
    int v74 = v57 << 16;
    int v75 = v74 & -2147483648;
    int v76 = o_sroa_0_0_i_i1_i_i | v75;
    floatv77 = (float)v76;
    float v78 = v56 + v77;
    intv79 = (int)v78;
    int v80 = v79 & -2147483648;
    int v81 = v80 ^ v79;
    int v82 = [0];
    bool v83 = v81 < v82;
    if(v83) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v85 = [0];
    bool v86 = v81 > v85;
    int v87 = v86 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v87;
    goto label13;
    label10:;
    bool v89 = v81 < 947912704;
    if(v89) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v91 = [0];
    floatv92 = (float)v81;
    float v93 = v92 + v91;
    intv94 = (int)v93;
    intv_cast_i_i_i_i = (int)v91;
    int v95 = v94 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v95;
    goto label13;
    label12:;
    int v97 = v79 >> 13;
    int v98 = v97 & 1;
    int v99 = v79 + 134221823;
    int v100 = v99 + v98;
    int v101 = v100 >> 13;
        v_sroa_0_0_i_i_i_i = v101;
    goto label13;
    label13:;
    int v103 = v80 >> 16;
    int v104 = v_sroa_0_0_i_i_i_i | v103;
    short v105 = (short)v104;
    global short* v106 = &agg_result[0].f0.f0.f0;
    v106[0] = v105;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_28* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_28 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_33* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_33* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 13; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_32* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESB_EEEENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESB_EEEENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_32* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global struct Eigen__half** v0 = &this[0].f1.f0;
    struct Eigen__half* v1 = v0[0];
    long v2 = index;
    short* v_idx_i = &v1[v2].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    global int* v3 = &this[0].f2.f1.f0[0];
    int v4 = v3[0];
    int v5 = index / v4;
    global int* v6 = &this[0].f2.f3.f1.f0.f0[0];
    int v7 = v6[0];
    int v8 = v5 % v7;
    global int* v9 = &this[0].f2.f2.f0[0];
    int v10 = v9[0];
    int v11 = v10 * v8;
    int v12 = v5 * v4;
    int v13 = index - v12;
    global int* v14 = &this[0].f2.f1.f0[1];
    int v15 = v14[0];
    int v16 = v13 / v15;
    global int* v17 = &this[0].f2.f3.f1.f0.f0[1];
    int v18 = v17[0];
    int v19 = v16 % v18;
    global int* v20 = &this[0].f2.f2.f0[1];
    int v21 = v20[0];
    int v22 = v21 * v19;
    int v23 = v22 + v11;
    int v24 = v16 * v15;
    int v25 = v13 - v24;
    global int* v26 = &this[0].f2.f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    int v29 = v23 + v28;
    global struct Eigen__half** v30 = &this[0].f2.f3.f0;
    struct Eigen__half* v31 = v30[0];
    long v32 = v29;
    short* v_idx_i_i_i = &v31[v32].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    int v33 = v_idx_val_i;
    int v34 = v33 << 13;
    int v35 = v34 & 268427264;
    int v36 = v34 & 260046848;
    bool v37 = v36 == 260046848;
    if(v37) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v39 = v34 | 1879048192;
        o_sroa_0_0_i_i_i_i = v39;
    goto label4;
    label2:;
    int v41 = v35 + 939524096;
    bool v42 = v36 == 0;
    if(v42) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v41;
        goto label4;
    }
    label3:;
    int v44 = v35 + 947912704;
    float v45 = [0];
    floatv46 = (float)v44;
    float v47 = v46 - v45;
    intv48 = (int)v47;
        o_sroa_0_0_i_i_i_i = v48;
    goto label4;
    label4:;
    int v50 = v33 << 16;
    int v51 = v50 & -2147483648;
    int v52 = o_sroa_0_0_i_i_i_i | v51;
    floatv53 = (float)v52;
    int v54 = v_idx_val_i_i_i;
    int v55 = v54 << 13;
    int v56 = v55 & 268427264;
    int v57 = v55 & 260046848;
    bool v58 = v57 == 260046848;
    if(v58) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v60 = v55 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v60;
    goto label8;
    label6:;
    int v62 = v56 + 939524096;
    bool v63 = v57 == 0;
    if(v63) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v62;
        goto label8;
    }
    label7:;
    int v65 = v56 + 947912704;
    float v66 = [0];
    floatv67 = (float)v65;
    float v68 = v67 - v66;
    intv69 = (int)v68;
        o_sroa_0_0_i_i1_i_i = v69;
    goto label8;
    label8:;
    int v71 = v54 << 16;
    int v72 = v71 & -2147483648;
    int v73 = o_sroa_0_0_i_i1_i_i | v72;
    floatv74 = (float)v73;
    float v75 = v53 + v74;
    intv76 = (int)v75;
    int v77 = v76 & -2147483648;
    int v78 = v77 ^ v76;
    int v79 = [0];
    bool v80 = v78 < v79;
    if(v80) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v82 = [0];
    bool v83 = v78 > v82;
    int v84 = v83 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v84;
    goto label13;
    label10:;
    bool v86 = v78 < 947912704;
    if(v86) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v88 = [0];
    floatv89 = (float)v78;
    float v90 = v89 + v88;
    intv91 = (int)v90;
    intv_cast_i_i_i_i = (int)v88;
    int v92 = v91 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v92;
    goto label13;
    label12:;
    int v94 = v76 >> 13;
    int v95 = v94 & 1;
    int v96 = v76 + 134221823;
    int v97 = v96 + v95;
    int v98 = v97 >> 13;
        v_sroa_0_0_i_i_i_i = v98;
    goto label13;
    label13:;
    int v100 = v77 >> 16;
    int v101 = v_sroa_0_0_i_i_i_i | v100;
    short v102 = (short)v101;
    global short* v103 = &agg_result[0].f0.f0.f0;
    v103[0] = v102;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_35* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__TensorEvaluator_35 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_34* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_34* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 13; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    bool v16 = v4 < size;
    if(v16) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    _ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIS4_S4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKS4_Li3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEE10evalScalarEi(eval, i_01_i);
    int v20 = i_01_i + v6;
    bool v21 = v20 < size;
    if(v21) {
        i_01_i = v20;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIS4_S4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKS4_Li3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEE10evalScalarEi(global struct Eigen__TensorEvaluator_35* this, int i) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    long v0 = i;
    global struct Eigen__half** v1 = &this[0].f0.f0;
    struct Eigen__half* v2 = v1[0];
    global int* v3 = &this[0].f1.f1.f1.f0[0];
    int v4 = v3[0];
    int v5 = i / v4;
    global int* v6 = &this[0].f1.f1.f3.f1.f0.f0[0];
    int v7 = v6[0];
    int v8 = v5 % v7;
    global int* v9 = &this[0].f1.f1.f2.f0[0];
    int v10 = v9[0];
    int v11 = v10 * v8;
    int v12 = v5 * v4;
    int v13 = i - v12;
    global int* v14 = &this[0].f1.f1.f1.f0[1];
    int v15 = v14[0];
    int v16 = v13 / v15;
    global int* v17 = &this[0].f1.f1.f3.f1.f0.f0[1];
    int v18 = v17[0];
    int v19 = v16 % v18;
    global int* v20 = &this[0].f1.f1.f2.f0[1];
    int v21 = v20[0];
    int v22 = v21 * v19;
    int v23 = v22 + v11;
    int v24 = v16 * v15;
    int v25 = v13 - v24;
    global int* v26 = &this[0].f1.f1.f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    int v29 = v23 + v28;
    global struct Eigen__half** v30 = &this[0].f1.f1.f3.f0;
    struct Eigen__half* v31 = v30[0];
    long v32 = v29;
    short* v_idx_i_i_i_i = &v31[v32].f0.f0.f0;
    short v_idx_val_i_i_i_i = v_idx_i_i_i_i[0];
    global struct Eigen__half** v33 = &this[0].f1.f2.f0;
    struct Eigen__half* v34 = v33[0];
    short* v_idx_i_i = &v34[v0].f0.f0.f0;
    short v_idx_val_i_i = v_idx_i_i[0];
    int v35 = v_idx_val_i_i_i_i;
    int v36 = v35 << 13;
    int v37 = v36 & 268427264;
    int v38 = v36 & 260046848;
    bool v39 = v38 == 260046848;
    if(v39) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v41 = v36 | 1879048192;
        o_sroa_0_0_i_i_i_i = v41;
    goto label4;
    label2:;
    int v43 = v37 + 939524096;
    bool v44 = v38 == 0;
    if(v44) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v43;
        goto label4;
    }
    label3:;
    int v46 = v37 + 947912704;
    float v47 = [0];
    floatv48 = (float)v46;
    float v49 = v48 - v47;
    intv50 = (int)v49;
        o_sroa_0_0_i_i_i_i = v50;
    goto label4;
    label4:;
    int v52 = v35 << 16;
    int v53 = v52 & -2147483648;
    int v54 = o_sroa_0_0_i_i_i_i | v53;
    floatv55 = (float)v54;
    int v56 = v_idx_val_i_i;
    int v57 = v56 << 13;
    int v58 = v57 & 268427264;
    int v59 = v57 & 260046848;
    bool v60 = v59 == 260046848;
    if(v60) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v62 = v57 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v62;
    goto label8;
    label6:;
    int v64 = v58 + 939524096;
    bool v65 = v59 == 0;
    if(v65) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v64;
        goto label8;
    }
    label7:;
    int v67 = v58 + 947912704;
    float v68 = [0];
    floatv69 = (float)v67;
    float v70 = v69 - v68;
    intv71 = (int)v70;
        o_sroa_0_0_i_i1_i_i = v71;
    goto label8;
    label8:;
    int v73 = v56 << 16;
    int v74 = v73 & -2147483648;
    int v75 = o_sroa_0_0_i_i1_i_i | v74;
    floatv76 = (float)v75;
    float v77 = v55 + v76;
    intv78 = (int)v77;
    int v79 = v78 & -2147483648;
    int v80 = v79 ^ v78;
    int v81 = [0];
    bool v82 = v80 < v81;
    if(v82) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v84 = [0];
    bool v85 = v80 > v84;
    int v86 = v85 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v86;
    goto label13;
    label10:;
    bool v88 = v80 < 947912704;
    if(v88) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v90 = [0];
    floatv91 = (float)v80;
    float v92 = v91 + v90;
    intv93 = (int)v92;
    intv_cast_i_i_i_i = (int)v90;
    int v94 = v93 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v94;
    goto label13;
    label12:;
    int v96 = v78 >> 13;
    int v97 = v96 & 1;
    int v98 = v78 + 134221823;
    int v99 = v98 + v97;
    int v100 = v99 >> 13;
        v_sroa_0_0_i_i_i_i = v100;
    goto label13;
    label13:;
    int v102 = v79 >> 16;
    int v103 = v_sroa_0_0_i_i_i_i | v102;
    short v104 = (short)v103;
    short* v105 = &v2[v0].f0.f0.f0;
    v105[0] = v104;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_37* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_37 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_34* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_34* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 18; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_38* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_38* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f1.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f1.f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f3.f1.f0.f0[2];
    int v24 = v23[0];
    int v25 = v22 % v24;
    int v26 = v20 + v25;
    global struct Eigen__half** v27 = &this[0].f1.f3.f0;
    struct Eigen__half* v28 = v27[0];
    long v29 = v26;
    short* v_idx_i_i_i = &v28[v29].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global int* v30 = &this[0].f2.f1.f0[0];
    int v31 = v30[0];
    int v32 = index / v31;
    global int* v33 = &this[0].f2.f3.f1.f0.f0[0];
    int v34 = v33[0];
    int v35 = v32 % v34;
    global int* v36 = &this[0].f2.f2.f0[0];
    int v37 = v36[0];
    int v38 = v37 * v35;
    int v39 = v32 * v31;
    int v40 = index - v39;
    global int* v41 = &this[0].f2.f1.f0[1];
    int v42 = v41[0];
    int v43 = v40 / v42;
    global int* v44 = &this[0].f2.f3.f1.f0.f0[1];
    int v45 = v44[0];
    int v46 = v43 % v45;
    global int* v47 = &this[0].f2.f2.f0[1];
    int v48 = v47[0];
    int v49 = v48 * v46;
    int v50 = v49 + v38;
    int v51 = v43 * v42;
    int v52 = v40 - v51;
    global int* v53 = &this[0].f2.f3.f1.f0.f0[2];
    int v54 = v53[0];
    int v55 = v52 % v54;
    int v56 = v50 + v55;
    global struct Eigen__half** v57 = &this[0].f2.f3.f0;
    struct Eigen__half* v58 = v57[0];
    long v59 = v56;
    short* v_idx_i_i_i1 = &v58[v59].f0.f0.f0;
    short v_idx_val_i_i_i2 = v_idx_i_i_i1[0];
    int v60 = v_idx_val_i_i_i;
    int v61 = v60 << 13;
    int v62 = v61 & 268427264;
    int v63 = v61 & 260046848;
    bool v64 = v63 == 260046848;
    if(v64) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v66 = v61 | 1879048192;
        o_sroa_0_0_i_i_i_i = v66;
    goto label4;
    label2:;
    int v68 = v62 + 939524096;
    bool v69 = v63 == 0;
    if(v69) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v68;
        goto label4;
    }
    label3:;
    int v71 = v62 + 947912704;
    float v72 = [0];
    floatv73 = (float)v71;
    float v74 = v73 - v72;
    intv75 = (int)v74;
        o_sroa_0_0_i_i_i_i = v75;
    goto label4;
    label4:;
    int v77 = v60 << 16;
    int v78 = v77 & -2147483648;
    int v79 = o_sroa_0_0_i_i_i_i | v78;
    floatv80 = (float)v79;
    int v81 = v_idx_val_i_i_i2;
    int v82 = v81 << 13;
    int v83 = v82 & 268427264;
    int v84 = v82 & 260046848;
    bool v85 = v84 == 260046848;
    if(v85) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v87 = v82 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v87;
    goto label8;
    label6:;
    int v89 = v83 + 939524096;
    bool v90 = v84 == 0;
    if(v90) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v89;
        goto label8;
    }
    label7:;
    int v92 = v83 + 947912704;
    float v93 = [0];
    floatv94 = (float)v92;
    float v95 = v94 - v93;
    intv96 = (int)v95;
        o_sroa_0_0_i_i1_i_i = v96;
    goto label8;
    label8:;
    int v98 = v81 << 16;
    int v99 = v98 & -2147483648;
    int v100 = o_sroa_0_0_i_i1_i_i | v99;
    floatv101 = (float)v100;
    float v102 = v80 + v101;
    intv103 = (int)v102;
    int v104 = v103 & -2147483648;
    int v105 = v104 ^ v103;
    int v106 = [0];
    bool v107 = v105 < v106;
    if(v107) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v109 = [0];
    bool v110 = v105 > v109;
    int v111 = v110 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v111;
    goto label13;
    label10:;
    bool v113 = v105 < 947912704;
    if(v113) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v115 = [0];
    floatv116 = (float)v105;
    float v117 = v116 + v115;
    intv118 = (int)v117;
    intv_cast_i_i_i_i = (int)v115;
    int v119 = v118 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v119;
    goto label13;
    label12:;
    int v121 = v103 >> 13;
    int v122 = v121 & 1;
    int v123 = v103 + 134221823;
    int v124 = v123 + v122;
    int v125 = v124 >> 13;
        v_sroa_0_0_i_i_i_i = v125;
    goto label13;
    label13:;
    int v127 = v104 >> 16;
    int v128 = v_sroa_0_0_i_i_i_i | v127;
    short v129 = (short)v128;
    global short* v130 = &agg_result[0].f0.f0.f0;
    v130[0] = v129;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_39* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_39 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_44* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_44* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 14; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_43* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESB_EEEENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESB_EEEENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_43* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global struct Eigen__half** v0 = &this[0].f1.f0;
    struct Eigen__half* v1 = v0[0];
    long v2 = index;
    short* v_idx_i = &v1[v2].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    global int* v3 = &this[0].f2.f1.f0[0];
    int v4 = v3[0];
    int v5 = index / v4;
    global int* v6 = &this[0].f2.f3.f1.f0.f0[0];
    int v7 = v6[0];
    int v8 = v5 % v7;
    global int* v9 = &this[0].f2.f2.f0[0];
    int v10 = v9[0];
    int v11 = v10 * v8;
    int v12 = v5 * v4;
    int v13 = index - v12;
    global int* v14 = &this[0].f2.f1.f0[1];
    int v15 = v14[0];
    int v16 = v13 / v15;
    global int* v17 = &this[0].f2.f3.f1.f0.f0[1];
    int v18 = v17[0];
    int v19 = v16 % v18;
    global int* v20 = &this[0].f2.f2.f0[1];
    int v21 = v20[0];
    int v22 = v21 * v19;
    int v23 = v22 + v11;
    int v24 = v16 * v15;
    int v25 = v13 - v24;
    global int* v26 = &this[0].f2.f1.f0[2];
    int v27 = v26[0];
    int v28 = v25 / v27;
    global int* v29 = &this[0].f2.f3.f1.f0.f0[2];
    int v30 = v29[0];
    int v31 = v28 % v30;
    global int* v32 = &this[0].f2.f2.f0[2];
    int v33 = v32[0];
    int v34 = v33 * v31;
    int v35 = v23 + v34;
    int v36 = v28 * v27;
    int v37 = v25 - v36;
    global int* v38 = &this[0].f2.f3.f1.f0.f0[3];
    int v39 = v38[0];
    int v40 = v37 % v39;
    int v41 = v35 + v40;
    global struct Eigen__half** v42 = &this[0].f2.f3.f0;
    struct Eigen__half* v43 = v42[0];
    long v44 = v41;
    short* v_idx_i_i_i = &v43[v44].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    int v45 = v_idx_val_i;
    int v46 = v45 << 13;
    int v47 = v46 & 268427264;
    int v48 = v46 & 260046848;
    bool v49 = v48 == 260046848;
    if(v49) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v51 = v46 | 1879048192;
        o_sroa_0_0_i_i_i_i = v51;
    goto label4;
    label2:;
    int v53 = v47 + 939524096;
    bool v54 = v48 == 0;
    if(v54) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v53;
        goto label4;
    }
    label3:;
    int v56 = v47 + 947912704;
    float v57 = [0];
    floatv58 = (float)v56;
    float v59 = v58 - v57;
    intv60 = (int)v59;
        o_sroa_0_0_i_i_i_i = v60;
    goto label4;
    label4:;
    int v62 = v45 << 16;
    int v63 = v62 & -2147483648;
    int v64 = o_sroa_0_0_i_i_i_i | v63;
    floatv65 = (float)v64;
    int v66 = v_idx_val_i_i_i;
    int v67 = v66 << 13;
    int v68 = v67 & 268427264;
    int v69 = v67 & 260046848;
    bool v70 = v69 == 260046848;
    if(v70) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v72 = v67 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v72;
    goto label8;
    label6:;
    int v74 = v68 + 939524096;
    bool v75 = v69 == 0;
    if(v75) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v74;
        goto label8;
    }
    label7:;
    int v77 = v68 + 947912704;
    float v78 = [0];
    floatv79 = (float)v77;
    float v80 = v79 - v78;
    intv81 = (int)v80;
        o_sroa_0_0_i_i1_i_i = v81;
    goto label8;
    label8:;
    int v83 = v66 << 16;
    int v84 = v83 & -2147483648;
    int v85 = o_sroa_0_0_i_i1_i_i | v84;
    floatv86 = (float)v85;
    float v87 = v65 + v86;
    intv88 = (int)v87;
    int v89 = v88 & -2147483648;
    int v90 = v89 ^ v88;
    int v91 = [0];
    bool v92 = v90 < v91;
    if(v92) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v94 = [0];
    bool v95 = v90 > v94;
    int v96 = v95 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v96;
    goto label13;
    label10:;
    bool v98 = v90 < 947912704;
    if(v98) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v100 = [0];
    floatv101 = (float)v90;
    float v102 = v101 + v100;
    intv103 = (int)v102;
    intv_cast_i_i_i_i = (int)v100;
    int v104 = v103 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v104;
    goto label13;
    label12:;
    int v106 = v88 >> 13;
    int v107 = v106 & 1;
    int v108 = v88 + 134221823;
    int v109 = v108 + v107;
    int v110 = v109 >> 13;
        v_sroa_0_0_i_i_i_i = v110;
    goto label13;
    label13:;
    int v112 = v89 >> 16;
    int v113 = v_sroa_0_0_i_i_i_i | v112;
    short v114 = (short)v113;
    global short* v115 = &agg_result[0].f0.f0.f0;
    v115[0] = v114;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_46* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_46 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_45* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_45* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 14; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_47* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_47* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f1.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f1.f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f1.f0[2];
    int v24 = v23[0];
    int v25 = v22 / v24;
    global int* v26 = &this[0].f1.f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    global int* v29 = &this[0].f1.f2.f0[2];
    int v30 = v29[0];
    int v31 = v30 * v28;
    int v32 = v20 + v31;
    int v33 = v25 * v24;
    int v34 = v22 - v33;
    global int* v35 = &this[0].f1.f3.f1.f0.f0[3];
    int v36 = v35[0];
    int v37 = v34 % v36;
    int v38 = v32 + v37;
    global struct Eigen__half** v39 = &this[0].f1.f3.f0;
    struct Eigen__half* v40 = v39[0];
    long v41 = v38;
    short* v_idx_i_i_i = &v40[v41].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global struct Eigen__half** v42 = &this[0].f2.f0;
    struct Eigen__half* v43 = v42[0];
    long v44 = index;
    short* v_idx_i = &v43[v44].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    int v45 = v_idx_val_i_i_i;
    int v46 = v45 << 13;
    int v47 = v46 & 268427264;
    int v48 = v46 & 260046848;
    bool v49 = v48 == 260046848;
    if(v49) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v51 = v46 | 1879048192;
        o_sroa_0_0_i_i_i_i = v51;
    goto label4;
    label2:;
    int v53 = v47 + 939524096;
    bool v54 = v48 == 0;
    if(v54) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v53;
        goto label4;
    }
    label3:;
    int v56 = v47 + 947912704;
    float v57 = [0];
    floatv58 = (float)v56;
    float v59 = v58 - v57;
    intv60 = (int)v59;
        o_sroa_0_0_i_i_i_i = v60;
    goto label4;
    label4:;
    int v62 = v45 << 16;
    int v63 = v62 & -2147483648;
    int v64 = o_sroa_0_0_i_i_i_i | v63;
    floatv65 = (float)v64;
    int v66 = v_idx_val_i;
    int v67 = v66 << 13;
    int v68 = v67 & 268427264;
    int v69 = v67 & 260046848;
    bool v70 = v69 == 260046848;
    if(v70) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v72 = v67 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v72;
    goto label8;
    label6:;
    int v74 = v68 + 939524096;
    bool v75 = v69 == 0;
    if(v75) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v74;
        goto label8;
    }
    label7:;
    int v77 = v68 + 947912704;
    float v78 = [0];
    floatv79 = (float)v77;
    float v80 = v79 - v78;
    intv81 = (int)v80;
        o_sroa_0_0_i_i1_i_i = v81;
    goto label8;
    label8:;
    int v83 = v66 << 16;
    int v84 = v83 & -2147483648;
    int v85 = o_sroa_0_0_i_i1_i_i | v84;
    floatv86 = (float)v85;
    float v87 = v65 + v86;
    intv88 = (int)v87;
    int v89 = v88 & -2147483648;
    int v90 = v89 ^ v88;
    int v91 = [0];
    bool v92 = v90 < v91;
    if(v92) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v94 = [0];
    bool v95 = v90 > v94;
    int v96 = v95 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v96;
    goto label13;
    label10:;
    bool v98 = v90 < 947912704;
    if(v98) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v100 = [0];
    floatv101 = (float)v90;
    float v102 = v101 + v100;
    intv103 = (int)v102;
    intv_cast_i_i_i_i = (int)v100;
    int v104 = v103 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v104;
    goto label13;
    label12:;
    int v106 = v88 >> 13;
    int v107 = v106 & 1;
    int v108 = v88 + 134221823;
    int v109 = v108 + v107;
    int v110 = v109 >> 13;
        v_sroa_0_0_i_i_i_i = v110;
    goto label13;
    label13:;
    int v112 = v89 >> 16;
    int v113 = v_sroa_0_0_i_i_i_i | v112;
    short v114 = (short)v113;
    global short* v115 = &agg_result[0].f0.f0.f0;
    v115[0] = v114;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_48* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_48 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_45* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_45* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 20; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_49* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_49* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f1.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f1.f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f1.f0[2];
    int v24 = v23[0];
    int v25 = v22 / v24;
    global int* v26 = &this[0].f1.f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    global int* v29 = &this[0].f1.f2.f0[2];
    int v30 = v29[0];
    int v31 = v30 * v28;
    int v32 = v20 + v31;
    int v33 = v25 * v24;
    int v34 = v22 - v33;
    global int* v35 = &this[0].f1.f3.f1.f0.f0[3];
    int v36 = v35[0];
    int v37 = v34 % v36;
    int v38 = v32 + v37;
    global struct Eigen__half** v39 = &this[0].f1.f3.f0;
    struct Eigen__half* v40 = v39[0];
    long v41 = v38;
    short* v_idx_i_i_i = &v40[v41].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global int* v42 = &this[0].f2.f1.f0[0];
    int v43 = v42[0];
    int v44 = index / v43;
    global int* v45 = &this[0].f2.f3.f1.f0.f0[0];
    int v46 = v45[0];
    int v47 = v44 % v46;
    global int* v48 = &this[0].f2.f2.f0[0];
    int v49 = v48[0];
    int v50 = v49 * v47;
    int v51 = v44 * v43;
    int v52 = index - v51;
    global int* v53 = &this[0].f2.f1.f0[1];
    int v54 = v53[0];
    int v55 = v52 / v54;
    global int* v56 = &this[0].f2.f3.f1.f0.f0[1];
    int v57 = v56[0];
    int v58 = v55 % v57;
    global int* v59 = &this[0].f2.f2.f0[1];
    int v60 = v59[0];
    int v61 = v60 * v58;
    int v62 = v61 + v50;
    int v63 = v55 * v54;
    int v64 = v52 - v63;
    global int* v65 = &this[0].f2.f1.f0[2];
    int v66 = v65[0];
    int v67 = v64 / v66;
    global int* v68 = &this[0].f2.f3.f1.f0.f0[2];
    int v69 = v68[0];
    int v70 = v67 % v69;
    global int* v71 = &this[0].f2.f2.f0[2];
    int v72 = v71[0];
    int v73 = v72 * v70;
    int v74 = v62 + v73;
    int v75 = v67 * v66;
    int v76 = v64 - v75;
    global int* v77 = &this[0].f2.f3.f1.f0.f0[3];
    int v78 = v77[0];
    int v79 = v76 % v78;
    int v80 = v74 + v79;
    global struct Eigen__half** v81 = &this[0].f2.f3.f0;
    struct Eigen__half* v82 = v81[0];
    long v83 = v80;
    short* v_idx_i_i_i1 = &v82[v83].f0.f0.f0;
    short v_idx_val_i_i_i2 = v_idx_i_i_i1[0];
    int v84 = v_idx_val_i_i_i;
    int v85 = v84 << 13;
    int v86 = v85 & 268427264;
    int v87 = v85 & 260046848;
    bool v88 = v87 == 260046848;
    if(v88) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v90 = v85 | 1879048192;
        o_sroa_0_0_i_i_i_i = v90;
    goto label4;
    label2:;
    int v92 = v86 + 939524096;
    bool v93 = v87 == 0;
    if(v93) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v92;
        goto label4;
    }
    label3:;
    int v95 = v86 + 947912704;
    float v96 = [0];
    floatv97 = (float)v95;
    float v98 = v97 - v96;
    intv99 = (int)v98;
        o_sroa_0_0_i_i_i_i = v99;
    goto label4;
    label4:;
    int v101 = v84 << 16;
    int v102 = v101 & -2147483648;
    int v103 = o_sroa_0_0_i_i_i_i | v102;
    floatv104 = (float)v103;
    int v105 = v_idx_val_i_i_i2;
    int v106 = v105 << 13;
    int v107 = v106 & 268427264;
    int v108 = v106 & 260046848;
    bool v109 = v108 == 260046848;
    if(v109) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v111 = v106 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v111;
    goto label8;
    label6:;
    int v113 = v107 + 939524096;
    bool v114 = v108 == 0;
    if(v114) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v113;
        goto label8;
    }
    label7:;
    int v116 = v107 + 947912704;
    float v117 = [0];
    floatv118 = (float)v116;
    float v119 = v118 - v117;
    intv120 = (int)v119;
        o_sroa_0_0_i_i1_i_i = v120;
    goto label8;
    label8:;
    int v122 = v105 << 16;
    int v123 = v122 & -2147483648;
    int v124 = o_sroa_0_0_i_i1_i_i | v123;
    floatv125 = (float)v124;
    float v126 = v104 + v125;
    intv127 = (int)v126;
    int v128 = v127 & -2147483648;
    int v129 = v128 ^ v127;
    int v130 = [0];
    bool v131 = v129 < v130;
    if(v131) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v133 = [0];
    bool v134 = v129 > v133;
    int v135 = v134 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v135;
    goto label13;
    label10:;
    bool v137 = v129 < 947912704;
    if(v137) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v139 = [0];
    floatv140 = (float)v129;
    float v141 = v140 + v139;
    intv142 = (int)v141;
    intv_cast_i_i_i_i = (int)v139;
    int v143 = v142 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v143;
    goto label13;
    label12:;
    int v145 = v127 >> 13;
    int v146 = v145 & 1;
    int v147 = v127 + 134221823;
    int v148 = v147 + v146;
    int v149 = v148 >> 13;
        v_sroa_0_0_i_i_i_i = v149;
    goto label13;
    label13:;
    int v151 = v128 >> 16;
    int v152 = v_sroa_0_0_i_i_i_i | v151;
    short v153 = (short)v152;
    global short* v154 = &agg_result[0].f0.f0.f0;
    v154[0] = v153;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_50* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_50 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 5; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_55* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_55* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 18; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_54* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESB_EEEENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESB_EEEENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_54* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global struct Eigen__half** v0 = &this[0].f1.f0;
    struct Eigen__half* v1 = v0[0];
    long v2 = index;
    short* v_idx_i = &v1[v2].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    global int* v3 = &this[0].f2.f1.f0[0];
    int v4 = v3[0];
    int v5 = index / v4;
    global int* v6 = &this[0].f2.f3.f1.f0.f0[0];
    int v7 = v6[0];
    int v8 = v5 % v7;
    global int* v9 = &this[0].f2.f2.f0[0];
    int v10 = v9[0];
    int v11 = v10 * v8;
    int v12 = v5 * v4;
    int v13 = index - v12;
    global int* v14 = &this[0].f2.f1.f0[1];
    int v15 = v14[0];
    int v16 = v13 / v15;
    global int* v17 = &this[0].f2.f3.f1.f0.f0[1];
    int v18 = v17[0];
    int v19 = v16 % v18;
    global int* v20 = &this[0].f2.f2.f0[1];
    int v21 = v20[0];
    int v22 = v21 * v19;
    int v23 = v22 + v11;
    int v24 = v16 * v15;
    int v25 = v13 - v24;
    global int* v26 = &this[0].f2.f1.f0[2];
    int v27 = v26[0];
    int v28 = v25 / v27;
    global int* v29 = &this[0].f2.f3.f1.f0.f0[2];
    int v30 = v29[0];
    int v31 = v28 % v30;
    global int* v32 = &this[0].f2.f2.f0[2];
    int v33 = v32[0];
    int v34 = v33 * v31;
    int v35 = v23 + v34;
    int v36 = v28 * v27;
    int v37 = v25 - v36;
    global int* v38 = &this[0].f2.f1.f0[3];
    int v39 = v38[0];
    int v40 = v37 / v39;
    global int* v41 = &this[0].f2.f3.f1.f0.f0[3];
    int v42 = v41[0];
    int v43 = v40 % v42;
    global int* v44 = &this[0].f2.f2.f0[3];
    int v45 = v44[0];
    int v46 = v45 * v43;
    int v47 = v35 + v46;
    int v48 = v40 * v39;
    int v49 = v37 - v48;
    global int* v50 = &this[0].f2.f3.f1.f0.f0[4];
    int v51 = v50[0];
    int v52 = v49 % v51;
    int v53 = v47 + v52;
    global struct Eigen__half** v54 = &this[0].f2.f3.f0;
    struct Eigen__half* v55 = v54[0];
    long v56 = v53;
    short* v_idx_i_i_i = &v55[v56].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    int v57 = v_idx_val_i;
    int v58 = v57 << 13;
    int v59 = v58 & 268427264;
    int v60 = v58 & 260046848;
    bool v61 = v60 == 260046848;
    if(v61) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v63 = v58 | 1879048192;
        o_sroa_0_0_i_i_i_i = v63;
    goto label4;
    label2:;
    int v65 = v59 + 939524096;
    bool v66 = v60 == 0;
    if(v66) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v65;
        goto label4;
    }
    label3:;
    int v68 = v59 + 947912704;
    float v69 = [0];
    floatv70 = (float)v68;
    float v71 = v70 - v69;
    intv72 = (int)v71;
        o_sroa_0_0_i_i_i_i = v72;
    goto label4;
    label4:;
    int v74 = v57 << 16;
    int v75 = v74 & -2147483648;
    int v76 = o_sroa_0_0_i_i_i_i | v75;
    floatv77 = (float)v76;
    int v78 = v_idx_val_i_i_i;
    int v79 = v78 << 13;
    int v80 = v79 & 268427264;
    int v81 = v79 & 260046848;
    bool v82 = v81 == 260046848;
    if(v82) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v84 = v79 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v84;
    goto label8;
    label6:;
    int v86 = v80 + 939524096;
    bool v87 = v81 == 0;
    if(v87) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v86;
        goto label8;
    }
    label7:;
    int v89 = v80 + 947912704;
    float v90 = [0];
    floatv91 = (float)v89;
    float v92 = v91 - v90;
    intv93 = (int)v92;
        o_sroa_0_0_i_i1_i_i = v93;
    goto label8;
    label8:;
    int v95 = v78 << 16;
    int v96 = v95 & -2147483648;
    int v97 = o_sroa_0_0_i_i1_i_i | v96;
    floatv98 = (float)v97;
    float v99 = v77 + v98;
    intv100 = (int)v99;
    int v101 = v100 & -2147483648;
    int v102 = v101 ^ v100;
    int v103 = [0];
    bool v104 = v102 < v103;
    if(v104) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v106 = [0];
    bool v107 = v102 > v106;
    int v108 = v107 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v108;
    goto label13;
    label10:;
    bool v110 = v102 < 947912704;
    if(v110) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v112 = [0];
    floatv113 = (float)v102;
    float v114 = v113 + v112;
    intv115 = (int)v114;
    intv_cast_i_i_i_i = (int)v112;
    int v116 = v115 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v116;
    goto label13;
    label12:;
    int v118 = v100 >> 13;
    int v119 = v118 & 1;
    int v120 = v100 + 134221823;
    int v121 = v120 + v119;
    int v122 = v121 >> 13;
        v_sroa_0_0_i_i_i_i = v122;
    goto label13;
    label13:;
    int v124 = v101 >> 16;
    int v125 = v_sroa_0_0_i_i_i_i | v124;
    short v126 = (short)v125;
    global short* v127 = &agg_result[0].f0.f0.f0;
    v127[0] = v126;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_57* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_57 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 5; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_56* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_56* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 18; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_58* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_58* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f1.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f1.f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f1.f0[2];
    int v24 = v23[0];
    int v25 = v22 / v24;
    global int* v26 = &this[0].f1.f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    global int* v29 = &this[0].f1.f2.f0[2];
    int v30 = v29[0];
    int v31 = v30 * v28;
    int v32 = v20 + v31;
    int v33 = v25 * v24;
    int v34 = v22 - v33;
    global int* v35 = &this[0].f1.f1.f0[3];
    int v36 = v35[0];
    int v37 = v34 / v36;
    global int* v38 = &this[0].f1.f3.f1.f0.f0[3];
    int v39 = v38[0];
    int v40 = v37 % v39;
    global int* v41 = &this[0].f1.f2.f0[3];
    int v42 = v41[0];
    int v43 = v42 * v40;
    int v44 = v32 + v43;
    int v45 = v37 * v36;
    int v46 = v34 - v45;
    global int* v47 = &this[0].f1.f3.f1.f0.f0[4];
    int v48 = v47[0];
    int v49 = v46 % v48;
    int v50 = v44 + v49;
    global struct Eigen__half** v51 = &this[0].f1.f3.f0;
    struct Eigen__half* v52 = v51[0];
    long v53 = v50;
    short* v_idx_i_i_i = &v52[v53].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global struct Eigen__half** v54 = &this[0].f2.f0;
    struct Eigen__half* v55 = v54[0];
    long v56 = index;
    short* v_idx_i = &v55[v56].f0.f0.f0;
    short v_idx_val_i = v_idx_i[0];
    int v57 = v_idx_val_i_i_i;
    int v58 = v57 << 13;
    int v59 = v58 & 268427264;
    int v60 = v58 & 260046848;
    bool v61 = v60 == 260046848;
    if(v61) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v63 = v58 | 1879048192;
        o_sroa_0_0_i_i_i_i = v63;
    goto label4;
    label2:;
    int v65 = v59 + 939524096;
    bool v66 = v60 == 0;
    if(v66) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v65;
        goto label4;
    }
    label3:;
    int v68 = v59 + 947912704;
    float v69 = [0];
    floatv70 = (float)v68;
    float v71 = v70 - v69;
    intv72 = (int)v71;
        o_sroa_0_0_i_i_i_i = v72;
    goto label4;
    label4:;
    int v74 = v57 << 16;
    int v75 = v74 & -2147483648;
    int v76 = o_sroa_0_0_i_i_i_i | v75;
    floatv77 = (float)v76;
    int v78 = v_idx_val_i;
    int v79 = v78 << 13;
    int v80 = v79 & 268427264;
    int v81 = v79 & 260046848;
    bool v82 = v81 == 260046848;
    if(v82) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v84 = v79 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v84;
    goto label8;
    label6:;
    int v86 = v80 + 939524096;
    bool v87 = v81 == 0;
    if(v87) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v86;
        goto label8;
    }
    label7:;
    int v89 = v80 + 947912704;
    float v90 = [0];
    floatv91 = (float)v89;
    float v92 = v91 - v90;
    intv93 = (int)v92;
        o_sroa_0_0_i_i1_i_i = v93;
    goto label8;
    label8:;
    int v95 = v78 << 16;
    int v96 = v95 & -2147483648;
    int v97 = o_sroa_0_0_i_i1_i_i | v96;
    floatv98 = (float)v97;
    float v99 = v77 + v98;
    intv100 = (int)v99;
    int v101 = v100 & -2147483648;
    int v102 = v101 ^ v100;
    int v103 = [0];
    bool v104 = v102 < v103;
    if(v104) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v106 = [0];
    bool v107 = v102 > v106;
    int v108 = v107 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v108;
    goto label13;
    label10:;
    bool v110 = v102 < 947912704;
    if(v110) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v112 = [0];
    floatv113 = (float)v102;
    float v114 = v113 + v112;
    intv115 = (int)v114;
    intv_cast_i_i_i_i = (int)v112;
    int v116 = v115 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v116;
    goto label13;
    label12:;
    int v118 = v100 >> 13;
    int v119 = v118 & 1;
    int v120 = v100 + 134221823;
    int v121 = v120 + v119;
    int v122 = v121 >> 13;
        v_sroa_0_0_i_i_i_i = v122;
    goto label13;
    label13:;
    int v124 = v101 >> 16;
    int v125 = v_sroa_0_0_i_i_i_i | v124;
    short v126 = (short)v125;
    global short* v127 = &agg_result[0].f0.f0.f0;
    v127[0] = v126;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_59* memcopied_eval, int size) {
int i_01_i;
    label0:;
    struct Eigen__half v0[1];
    struct Eigen__TensorEvaluator_59 eval[1];
    int v1 = get_group_id(0);
    int v2 = get_local_size(0);
    int v3 = v2 * v1;
    int v4 = get_global_id(0);
    int v5 = v3 + v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v2;
    char*v8 = (char*)eval;
    global char*v10 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 5; __i++) {
        (( int2 *)v8)[__i] = ((global int2 *)v10)[__i];
    }
    struct Eigen__TensorEvaluator_56* v12 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_56* v13 = &memcopied_eval[0].f1.f1;
    char*v14 = (char*)v12;
    global char*v15 = (global char*)v13;
    #pragma unroll
    for(int __i=0; __i < 26; __i++) {
        (( int2 *)v14)[__i] = ((global int2 *)v15)[__i];
    }
    bool v17 = v5 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    char*v19 = (char*)v0;
    struct Eigen__half** v20 = &eval[0].f0.f0;
    struct Eigen__TensorEvaluator_60* v21 = &eval[0].f1;
    short* v22 = &v0[0].f0.f0.f0;
    struct Eigen__half* v_pre = v20[0];
        i_01_i = v5;
    goto label2;
    label2:;
    long v25 = i_01_i;
    _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(v0, v21, i_01_i);
    short v27 = v22[0];
    short* v28 = &v_pre[v25].f0.f0.f0;
    v28[0] = v27;
    int v31 = i_01_i + v7;
    bool v32 = v31 < size;
    if(v32) {
        i_01_i = v31;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

void _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(global struct Eigen__half* agg.result, global struct Eigen__TensorEvaluator_60* this, int index) {
int o_sroa_0_0_i_i_i_i;
int o_sroa_0_0_i_i1_i_i;
int v_sroa_0_0_i_i_i_i;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f1.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f1.f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f1.f0[2];
    int v24 = v23[0];
    int v25 = v22 / v24;
    global int* v26 = &this[0].f1.f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    global int* v29 = &this[0].f1.f2.f0[2];
    int v30 = v29[0];
    int v31 = v30 * v28;
    int v32 = v20 + v31;
    int v33 = v25 * v24;
    int v34 = v22 - v33;
    global int* v35 = &this[0].f1.f1.f0[3];
    int v36 = v35[0];
    int v37 = v34 / v36;
    global int* v38 = &this[0].f1.f3.f1.f0.f0[3];
    int v39 = v38[0];
    int v40 = v37 % v39;
    global int* v41 = &this[0].f1.f2.f0[3];
    int v42 = v41[0];
    int v43 = v42 * v40;
    int v44 = v32 + v43;
    int v45 = v37 * v36;
    int v46 = v34 - v45;
    global int* v47 = &this[0].f1.f3.f1.f0.f0[4];
    int v48 = v47[0];
    int v49 = v46 % v48;
    int v50 = v44 + v49;
    global struct Eigen__half** v51 = &this[0].f1.f3.f0;
    struct Eigen__half* v52 = v51[0];
    long v53 = v50;
    short* v_idx_i_i_i = &v52[v53].f0.f0.f0;
    short v_idx_val_i_i_i = v_idx_i_i_i[0];
    global int* v54 = &this[0].f2.f1.f0[0];
    int v55 = v54[0];
    int v56 = index / v55;
    global int* v57 = &this[0].f2.f3.f1.f0.f0[0];
    int v58 = v57[0];
    int v59 = v56 % v58;
    global int* v60 = &this[0].f2.f2.f0[0];
    int v61 = v60[0];
    int v62 = v61 * v59;
    int v63 = v56 * v55;
    int v64 = index - v63;
    global int* v65 = &this[0].f2.f1.f0[1];
    int v66 = v65[0];
    int v67 = v64 / v66;
    global int* v68 = &this[0].f2.f3.f1.f0.f0[1];
    int v69 = v68[0];
    int v70 = v67 % v69;
    global int* v71 = &this[0].f2.f2.f0[1];
    int v72 = v71[0];
    int v73 = v72 * v70;
    int v74 = v73 + v62;
    int v75 = v67 * v66;
    int v76 = v64 - v75;
    global int* v77 = &this[0].f2.f1.f0[2];
    int v78 = v77[0];
    int v79 = v76 / v78;
    global int* v80 = &this[0].f2.f3.f1.f0.f0[2];
    int v81 = v80[0];
    int v82 = v79 % v81;
    global int* v83 = &this[0].f2.f2.f0[2];
    int v84 = v83[0];
    int v85 = v84 * v82;
    int v86 = v74 + v85;
    int v87 = v79 * v78;
    int v88 = v76 - v87;
    global int* v89 = &this[0].f2.f1.f0[3];
    int v90 = v89[0];
    int v91 = v88 / v90;
    global int* v92 = &this[0].f2.f3.f1.f0.f0[3];
    int v93 = v92[0];
    int v94 = v91 % v93;
    global int* v95 = &this[0].f2.f2.f0[3];
    int v96 = v95[0];
    int v97 = v96 * v94;
    int v98 = v86 + v97;
    int v99 = v91 * v90;
    int v100 = v88 - v99;
    global int* v101 = &this[0].f2.f3.f1.f0.f0[4];
    int v102 = v101[0];
    int v103 = v100 % v102;
    int v104 = v98 + v103;
    global struct Eigen__half** v105 = &this[0].f2.f3.f0;
    struct Eigen__half* v106 = v105[0];
    long v107 = v104;
    short* v_idx_i_i_i1 = &v106[v107].f0.f0.f0;
    short v_idx_val_i_i_i2 = v_idx_i_i_i1[0];
    int v108 = v_idx_val_i_i_i;
    int v109 = v108 << 13;
    int v110 = v109 & 268427264;
    int v111 = v109 & 260046848;
    bool v112 = v111 == 260046848;
    if(v112) {
        goto label1;
    } else {
        goto label2;
    }
    label1:;
    int v114 = v109 | 1879048192;
        o_sroa_0_0_i_i_i_i = v114;
    goto label4;
    label2:;
    int v116 = v110 + 939524096;
    bool v117 = v111 == 0;
    if(v117) {
        goto label3;
    } else {
        o_sroa_0_0_i_i_i_i = v116;
        goto label4;
    }
    label3:;
    int v119 = v110 + 947912704;
    float v120 = [0];
    floatv121 = (float)v119;
    float v122 = v121 - v120;
    intv123 = (int)v122;
        o_sroa_0_0_i_i_i_i = v123;
    goto label4;
    label4:;
    int v125 = v108 << 16;
    int v126 = v125 & -2147483648;
    int v127 = o_sroa_0_0_i_i_i_i | v126;
    floatv128 = (float)v127;
    int v129 = v_idx_val_i_i_i2;
    int v130 = v129 << 13;
    int v131 = v130 & 268427264;
    int v132 = v130 & 260046848;
    bool v133 = v132 == 260046848;
    if(v133) {
        goto label5;
    } else {
        goto label6;
    }
    label5:;
    int v135 = v130 | 1879048192;
        o_sroa_0_0_i_i1_i_i = v135;
    goto label8;
    label6:;
    int v137 = v131 + 939524096;
    bool v138 = v132 == 0;
    if(v138) {
        goto label7;
    } else {
        o_sroa_0_0_i_i1_i_i = v137;
        goto label8;
    }
    label7:;
    int v140 = v131 + 947912704;
    float v141 = [0];
    floatv142 = (float)v140;
    float v143 = v142 - v141;
    intv144 = (int)v143;
        o_sroa_0_0_i_i1_i_i = v144;
    goto label8;
    label8:;
    int v146 = v129 << 16;
    int v147 = v146 & -2147483648;
    int v148 = o_sroa_0_0_i_i1_i_i | v147;
    floatv149 = (float)v148;
    float v150 = v128 + v149;
    intv151 = (int)v150;
    int v152 = v151 & -2147483648;
    int v153 = v152 ^ v151;
    int v154 = [0];
    bool v155 = v153 < v154;
    if(v155) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    int v157 = [0];
    bool v158 = v153 > v157;
    int v159 = v158 ? 32256 : 31744;
        v_sroa_0_0_i_i_i_i = v159;
    goto label13;
    label10:;
    bool v161 = v153 < 947912704;
    if(v161) {
        goto label11;
    } else {
        goto label12;
    }
    label11:;
    float v163 = [0];
    floatv164 = (float)v153;
    float v165 = v164 + v163;
    intv166 = (int)v165;
    intv_cast_i_i_i_i = (int)v163;
    int v167 = v166 - v_cast_i_i_i_i;
        v_sroa_0_0_i_i_i_i = v167;
    goto label13;
    label12:;
    int v169 = v151 >> 13;
    int v170 = v169 & 1;
    int v171 = v151 + 134221823;
    int v172 = v171 + v170;
    int v173 = v172 >> 13;
        v_sroa_0_0_i_i_i_i = v173;
    goto label13;
    label13:;
    int v175 = v152 >> 16;
    int v176 = v_sroa_0_0_i_i_i_i | v175;
    short v177 = (short)v176;
    global short* v178 = &agg_result[0].f0.f0.f0;
    v178[0] = v177;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_61* memcopied_eval, long size) {
long i_04_i;
long i1_03_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    long v5 = v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v1;
    long v8 = v7;
    global float** v9 = &memcopied_eval[0].f0.f0;
    float* v10 = v9[0];
    global float** v11 = &memcopied_eval[0].f1.f1.f0;
    float* v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f2.f0;
    float* v14 = v13[0];
    long v15 = size / 4;
    long v16 = v15 << 2;
    long v17 = v8 << 2;
    long v18 = v5 << 2;
    bool v19 = v18 < v16;
    if(v19) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_04_i = v18;
    goto label5;
    label2:;
        goto label3;
    label3:;
    long v23 = v5 + v16;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
        i1_03_i = v23;
    goto label6;
    label5:;
    long sext_i_i_i = i_04_i << 32;
    long v27 = sext_i_i_i >> 32;
    float* v28 = &v12[v27];
    float v29 = v28[0];
    float* v30 = &v28[1];
    float v31 = v30[0];
    float* v32 = &v28[2];
    float v33 = v32[0];
    float* v34 = &v28[3];
    float v35 = v34[0];
    float* v36 = &v14[i_04_i];
    float v37 = v36[0];
    float* v38 = &v36[1];
    float v39 = v38[0];
    float* v40 = &v36[2];
    float v41 = v40[0];
    float* v42 = &v36[3];
    float v43 = v42[0];
    float v44 = v29 + v37;
    float v45 = v31 + v39;
    float v46 = v33 + v41;
    float v47 = v35 + v43;
    float* v48 = &v10[v27];
    v48[0] = v44;
    float* v50 = &v48[1];
    v50[0] = v45;
    float* v52 = &v48[2];
    v52[0] = v46;
    float* v54 = &v48[3];
    v54[0] = v47;
    long v56 = i_04_i + v17;
    bool v57 = v56 < v16;
    if(v57) {
        i_04_i = v56;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long sext_i_i2_i = i1_03_i << 32;
    long v59 = sext_i_i2_i >> 32;
    float* v60 = &v12[v59];
    float v_val_i_i_i_i = v60[0];
    float* v61 = &v14[i1_03_i];
    float v_val_i1_i_i_i = v61[0];
    float v62 = v_val_i_i_i_i + v_val_i1_i_i_i;
    float* v63 = &v10[v59];
    v63[0] = v62;
    long v65 = i1_03_i + v8;
    bool v66 = v65 < size;
    if(v66) {
        i1_03_i = v65;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_68* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global struct Eigen__TensorEvaluator_69* v9 = &memcopied_eval[0].f1;
    global long*v10 = (global long*)v9;
    long v11 = v10[0];
    global float** v12 = &memcopied_eval[0].f1.f1.f0;
    float* v13 = v12[0];
    int v14 = size / 4;
    int v15 = v14 << 2;
    int v16 = v6 << 2;
    int v17 = v4 << 2;
    bool v18 = v17 < v15;
    if(v18) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float* v20 = (float*)v11;
        i_03_i = v17;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v15;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float* v26 = (float*)v11;
        i1_02_i = v23;
    goto label6;
    label5:;
    long v28 = i_03_i;
    float* v29 = &v13[v28];
    float v30 = v29[0];
    float* v31 = &v29[1];
    float v32 = v31[0];
    float* v33 = &v29[2];
    float v34 = v33[0];
    float* v35 = &v29[3];
    float v36 = v35[0];
    float v37 = v20[0];
    float v38 = v30 + v37;
    float v39 = v32 + v37;
    float v40 = v34 + v37;
    float v41 = v36 + v37;
    float* v42 = &v8[v28];
    v42[0] = v38;
    float* v44 = &v42[1];
    v44[0] = v39;
    float* v46 = &v42[2];
    v46[0] = v40;
    float* v48 = &v42[3];
    v48[0] = v41;
    int v50 = i_03_i + v16;
    bool v51 = v50 < v15;
    if(v51) {
        i_03_i = v50;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long v53 = i1_02_i;
    float* v54 = &v13[v53];
    float v_val_i_i_i_i = v54[0];
    float v55 = v26[0];
    float v56 = v_val_i_i_i_i + v55;
    float* v57 = &v8[v53];
    v57[0] = v56;
    int v59 = i1_02_i + v6;
    bool v60 = v59 < size;
    if(v60) {
        i1_02_i = v59;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_71* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global struct Eigen__TensorEvaluator_72* v9 = &memcopied_eval[0].f1;
    global long*v10 = (global long*)v9;
    long v11 = v10[0];
    global float** v12 = &memcopied_eval[0].f1.f1.f0;
    float* v13 = v12[0];
    int v14 = size / 4;
    int v15 = v14 << 2;
    int v16 = v6 << 2;
    int v17 = v4 << 2;
    bool v18 = v17 < v15;
    if(v18) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float* v20 = (float*)v11;
        i_03_i = v17;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v15;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float* v26 = (float*)v11;
        i1_02_i = v23;
    goto label6;
    label5:;
    long v28 = i_03_i;
    float* v29 = &v13[v28];
    float v30 = v29[0];
    float* v31 = &v29[1];
    float v32 = v31[0];
    float* v33 = &v29[2];
    float v34 = v33[0];
    float* v35 = &v29[3];
    float v36 = v35[0];
    float v37 = v20[0];
    float v38 = v30 + v37;
    float v39 = v32 + v37;
    float v40 = v34 + v37;
    float v41 = v36 + v37;
    float* v42 = &v8[v28];
    v42[0] = v38;
    float* v44 = &v42[1];
    v44[0] = v39;
    float* v46 = &v42[2];
    v46[0] = v40;
    float* v48 = &v42[3];
    v48[0] = v41;
    int v50 = i_03_i + v16;
    bool v51 = v50 < v15;
    if(v51) {
        i_03_i = v50;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long v53 = i1_02_i;
    float* v54 = &v13[v53];
    float v_val_i_i_i_i = v54[0];
    float v55 = v26[0];
    float v56 = v_val_i_i_i_i + v55;
    float* v57 = &v8[v53];
    v57[0] = v56;
    int v59 = i1_02_i + v6;
    bool v60 = v59 < size;
    if(v60) {
        i1_02_i = v59;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_74* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
float* v_sroa_6_0_in_i_i_i_i_i;
float* v_sroa_9_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f0;
    float* v10 = v9[0];
    global float** v11 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    int v14 = v13[0];
    int v15 = size / 4;
    int v16 = v15 << 2;
    int v17 = v6 << 2;
    int v18 = v4 << 2;
    bool v19 = v18 < v16;
    if(v19) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v18;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v16;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v23;
    goto label9;
    label5:;
    long v27 = i_03_i;
    float* v28 = &v10[v27];
    float v29 = v28[0];
    float* v30 = &v28[1];
    float v31 = v30[0];
    float* v32 = &v28[2];
    float v33 = v32[0];
    float* v34 = &v28[3];
    float v35 = v34[0];
    int v36 = i_03_i % v14;
    int v37 = v36 + 4;
    bool v38 = v37 > v14;
    long v39 = v36;
    float* v40 = &v12[v39];
    if(v38) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v42 = &v40[1];
    float* v43 = &v40[2];
    float* v44 = &v40[3];
        v_sroa_3_0_in_i_i_i_i_i = v42;
v_sroa_6_0_in_i_i_i_i_i = v43;
v_sroa_9_0_in_i_i_i_i_i = v44;
    goto label8;
    label7:;
    int v46 = i_03_i | 1;
    int v47 = v46 % v14;
    long v48 = v47;
    float* v49 = &v12[v48];
    int v50 = i_03_i | 2;
    int v51 = v50 % v14;
    long v52 = v51;
    float* v53 = &v12[v52];
    int v54 = i_03_i | 3;
    int v55 = v54 % v14;
    long v56 = v55;
    float* v57 = &v12[v56];
        v_sroa_3_0_in_i_i_i_i_i = v49;
v_sroa_6_0_in_i_i_i_i_i = v53;
v_sroa_9_0_in_i_i_i_i_i = v57;
    goto label8;
    label8:;
    float v_sroa_9_0_i_i_i_i_i = v_sroa_9_0_in_i_i_i_i_i[0];
    float v_sroa_6_0_i_i_i_i_i = v_sroa_6_0_in_i_i_i_i_i[0];
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v40[0];
    float v59 = v29 + v_sroa_0_0_i_i_i_i_i;
    float v60 = v31 + v_sroa_3_0_i_i_i_i_i;
    float v61 = v33 + v_sroa_6_0_i_i_i_i_i;
    float v62 = v35 + v_sroa_9_0_i_i_i_i_i;
    float* v63 = &v8[v27];
    v63[0] = v59;
    float* v65 = &v63[1];
    v65[0] = v60;
    float* v67 = &v63[2];
    v67[0] = v61;
    float* v69 = &v63[3];
    v69[0] = v62;
    int v71 = i_03_i + v17;
    bool v72 = v71 < v16;
    if(v72) {
        i_03_i = v71;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    long v74 = i1_02_i;
    float* v75 = &v10[v74];
    float v_val_i_i_i_i = v75[0];
    int v76 = i1_02_i % v14;
    long v77 = v76;
    float* v78 = &v12[v77];
    float v_val_i_i_i_i_i_i = v78[0];
    float v79 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v80 = &v8[v74];
    v80[0] = v79;
    int v82 = i1_02_i + v6;
    bool v83 = v82 < size;
    if(v83) {
        i1_02_i = v82;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_77* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
float* v_sroa_6_0_in_i_i_i_i_i;
float* v_sroa_9_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    int v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f2.f0;
    float* v14 = v13[0];
    int v15 = size / 4;
    int v16 = v15 << 2;
    int v17 = v6 << 2;
    int v18 = v4 << 2;
    bool v19 = v18 < v16;
    if(v19) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v18;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v16;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v23;
    goto label9;
    label5:;
    int v27 = i_03_i % v12;
    int v28 = v27 + 4;
    bool v29 = v28 > v12;
    long v30 = v27;
    float* v31 = &v10[v30];
    if(v29) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v33 = &v31[1];
    float* v34 = &v31[2];
    float* v35 = &v31[3];
        v_sroa_3_0_in_i_i_i_i_i = v33;
v_sroa_6_0_in_i_i_i_i_i = v34;
v_sroa_9_0_in_i_i_i_i_i = v35;
    goto label8;
    label7:;
    int v37 = i_03_i | 1;
    int v38 = v37 % v12;
    long v39 = v38;
    float* v40 = &v10[v39];
    int v41 = i_03_i | 2;
    int v42 = v41 % v12;
    long v43 = v42;
    float* v44 = &v10[v43];
    int v45 = i_03_i | 3;
    int v46 = v45 % v12;
    long v47 = v46;
    float* v48 = &v10[v47];
        v_sroa_3_0_in_i_i_i_i_i = v40;
v_sroa_6_0_in_i_i_i_i_i = v44;
v_sroa_9_0_in_i_i_i_i_i = v48;
    goto label8;
    label8:;
    float v_sroa_9_0_i_i_i_i_i = v_sroa_9_0_in_i_i_i_i_i[0];
    float v_sroa_6_0_i_i_i_i_i = v_sroa_6_0_in_i_i_i_i_i[0];
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v31[0];
    long v50 = i_03_i;
    float* v51 = &v14[v50];
    float v52 = v51[0];
    float* v53 = &v51[1];
    float v54 = v53[0];
    float* v55 = &v51[2];
    float v56 = v55[0];
    float* v57 = &v51[3];
    float v58 = v57[0];
    float v59 = v_sroa_0_0_i_i_i_i_i + v52;
    float v60 = v_sroa_3_0_i_i_i_i_i + v54;
    float v61 = v_sroa_6_0_i_i_i_i_i + v56;
    float v62 = v_sroa_9_0_i_i_i_i_i + v58;
    float* v63 = &v8[v50];
    v63[0] = v59;
    float* v65 = &v63[1];
    v65[0] = v60;
    float* v67 = &v63[2];
    v67[0] = v61;
    float* v69 = &v63[3];
    v69[0] = v62;
    int v71 = i_03_i + v17;
    bool v72 = v71 < v16;
    if(v72) {
        i_03_i = v71;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    int v74 = i1_02_i % v12;
    long v75 = v74;
    float* v76 = &v10[v75];
    float v_val_i_i_i_i_i_i = v76[0];
    long v77 = i1_02_i;
    float* v78 = &v14[v77];
    float v_val_i_i_i_i = v78[0];
    float v79 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v80 = &v8[v77];
    v80[0] = v79;
    int v82 = i1_02_i + v6;
    bool v83 = v82 < size;
    if(v83) {
        i1_02_i = v82;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_79* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
float* v_sroa_6_0_in_i_i_i_i_i;
float* v_sroa_9_0_in_i_i_i_i_i;
float* v_sroa_3_0_in_i_i1_i_i_i;
float* v_sroa_6_0_in_i_i2_i_i_i;
float* v_sroa_9_0_in_i_i3_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    int v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    int v16 = v15[0];
    int v17 = size / 4;
    int v18 = v17 << 2;
    int v19 = v6 << 2;
    int v20 = v4 << 2;
    bool v21 = v20 < v18;
    if(v21) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v20;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v25 = v4 + v18;
    bool v26 = v25 < size;
    if(v26) {
        goto label4;
    } else {
        goto label14;
    }
    label4:;
        i1_02_i = v25;
    goto label12;
    label5:;
    int v29 = i_03_i % v12;
    int v30 = v29 + 4;
    bool v31 = v30 > v12;
    long v32 = v29;
    float* v33 = &v10[v32];
    if(v31) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v35 = &v33[1];
    float* v36 = &v33[2];
    float* v37 = &v33[3];
        v_sroa_3_0_in_i_i_i_i_i = v35;
v_sroa_6_0_in_i_i_i_i_i = v36;
v_sroa_9_0_in_i_i_i_i_i = v37;
    goto label8;
    label7:;
    int v39 = i_03_i | 1;
    int v40 = v39 % v12;
    long v41 = v40;
    float* v42 = &v10[v41];
    int v43 = i_03_i | 2;
    int v44 = v43 % v12;
    long v45 = v44;
    float* v46 = &v10[v45];
    int v47 = i_03_i | 3;
    int v48 = v47 % v12;
    long v49 = v48;
    float* v50 = &v10[v49];
        v_sroa_3_0_in_i_i_i_i_i = v42;
v_sroa_6_0_in_i_i_i_i_i = v46;
v_sroa_9_0_in_i_i_i_i_i = v50;
    goto label8;
    label8:;
    float v_sroa_9_0_i_i_i_i_i = v_sroa_9_0_in_i_i_i_i_i[0];
    float v_sroa_6_0_i_i_i_i_i = v_sroa_6_0_in_i_i_i_i_i[0];
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v33[0];
    int v52 = i_03_i % v16;
    int v53 = v52 + 4;
    bool v54 = v53 > v16;
    long v55 = v52;
    float* v56 = &v14[v55];
    if(v54) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    float* v58 = &v56[1];
    float* v59 = &v56[2];
    float* v60 = &v56[3];
        v_sroa_3_0_in_i_i1_i_i_i = v58;
v_sroa_6_0_in_i_i2_i_i_i = v59;
v_sroa_9_0_in_i_i3_i_i_i = v60;
    goto label11;
    label10:;
    int v62 = i_03_i | 1;
    int v63 = v62 % v16;
    long v64 = v63;
    float* v65 = &v14[v64];
    int v66 = i_03_i | 2;
    int v67 = v66 % v16;
    long v68 = v67;
    float* v69 = &v14[v68];
    int v70 = i_03_i | 3;
    int v71 = v70 % v16;
    long v72 = v71;
    float* v73 = &v14[v72];
        v_sroa_3_0_in_i_i1_i_i_i = v65;
v_sroa_6_0_in_i_i2_i_i_i = v69;
v_sroa_9_0_in_i_i3_i_i_i = v73;
    goto label11;
    label11:;
    float v_sroa_9_0_i_i4_i_i_i = v_sroa_9_0_in_i_i3_i_i_i[0];
    float v_sroa_6_0_i_i5_i_i_i = v_sroa_6_0_in_i_i2_i_i_i[0];
    float v_sroa_3_0_i_i6_i_i_i = v_sroa_3_0_in_i_i1_i_i_i[0];
    float v_sroa_0_0_i_i7_i_i_i = v56[0];
    float v75 = v_sroa_0_0_i_i_i_i_i + v_sroa_0_0_i_i7_i_i_i;
    float v76 = v_sroa_3_0_i_i_i_i_i + v_sroa_3_0_i_i6_i_i_i;
    float v77 = v_sroa_6_0_i_i_i_i_i + v_sroa_6_0_i_i5_i_i_i;
    float v78 = v_sroa_9_0_i_i_i_i_i + v_sroa_9_0_i_i4_i_i_i;
    long v79 = i_03_i;
    float* v80 = &v8[v79];
    v80[0] = v75;
    float* v82 = &v80[1];
    v82[0] = v76;
    float* v84 = &v80[2];
    v84[0] = v77;
    float* v86 = &v80[3];
    v86[0] = v78;
    int v88 = i_03_i + v19;
    bool v89 = v88 < v18;
    if(v89) {
        i_03_i = v88;
        goto label5;
    } else {
        goto label2;
    }
    label12:;
    int v91 = i1_02_i % v12;
    long v92 = v91;
    float* v93 = &v10[v92];
    float v_val_i_i_i_i_i_i = v93[0];
    int v94 = i1_02_i % v16;
    long v95 = v94;
    float* v96 = &v14[v95];
    float v_val_i_i_i1_i_i_i = v96[0];
    float v97 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v98 = i1_02_i;
    float* v99 = &v8[v98];
    v99[0] = v97;
    int v101 = i1_02_i + v6;
    bool v102 = v101 < size;
    if(v102) {
        i1_02_i = v101;
        goto label12;
    } else {
        goto label13;
    }
    label13:;
        goto label14;
    label14:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_81* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i;
float* v_sroa_6_0_in_i_i_i_i;
float* v_sroa_9_0_in_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f2.f0[0];
    int v14 = v13[0];
    global float** v15 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v16 = v15[0];
    global int* v17 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v18 = (global long*)v17;
    long v19 = v18[0];
    int v20 = (int)v19;
    long v21 = v19 >> 32;
    int v22 = (int)v21;
    int v23 = size / 4;
    int v24 = v23 << 2;
    int v25 = v6 << 2;
    int v26 = v4 << 2;
    bool v27 = v26 < v24;
    if(v27) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v26;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v31 = v4 + v24;
    bool v32 = v31 < size;
    if(v32) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v31;
    goto label9;
    label5:;
    long v35 = i_03_i;
    float* v36 = &v10[v35];
    float v37 = v36[0];
    float* v38 = &v36[1];
    float v39 = v38[0];
    float* v40 = &v36[2];
    float v41 = v40[0];
    float* v42 = &v36[3];
    float v43 = v42[0];
    int v44 = i_03_i / v12;
    int v45 = v44 % v20;
    int v46 = v45 * v14;
    int v47 = v44 * v12;
    int v48 = i_03_i - v47;
    int v49 = v48 % v22;
    int v50 = v49 + v46;
    int v51 = v49 + 4;
    bool v52 = v51 > v22;
    long v53 = v50;
    float* v54 = &v16[v53];
    if(v52) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v56 = &v54[1];
    float* v57 = &v54[2];
    float* v58 = &v54[3];
        v_sroa_3_0_in_i_i_i_i = v56;
v_sroa_6_0_in_i_i_i_i = v57;
v_sroa_9_0_in_i_i_i_i = v58;
    goto label8;
    label7:;
    int v60 = i_03_i | 1;
    int v61 = v60 / v12;
    int v62 = v61 % v20;
    int v63 = v62 * v14;
    int v64 = v61 * v12;
    int v65 = v60 - v64;
    int v66 = v65 % v22;
    int v67 = v66 + v63;
    long v68 = v67;
    float* v69 = &v16[v68];
    int v70 = i_03_i | 2;
    int v71 = v70 / v12;
    int v72 = v71 % v20;
    int v73 = v72 * v14;
    int v74 = v71 * v12;
    int v75 = v70 - v74;
    int v76 = v75 % v22;
    int v77 = v76 + v73;
    long v78 = v77;
    float* v79 = &v16[v78];
    int v80 = i_03_i | 3;
    int v81 = v80 / v12;
    int v82 = v81 % v20;
    int v83 = v82 * v14;
    int v84 = v81 * v12;
    int v85 = v80 - v84;
    int v86 = v85 % v22;
    int v87 = v86 + v83;
    long v88 = v87;
    float* v89 = &v16[v88];
        v_sroa_3_0_in_i_i_i_i = v69;
v_sroa_6_0_in_i_i_i_i = v79;
v_sroa_9_0_in_i_i_i_i = v89;
    goto label8;
    label8:;
    float v_sroa_9_0_i_i_i_i = v_sroa_9_0_in_i_i_i_i[0];
    float v_sroa_6_0_i_i_i_i = v_sroa_6_0_in_i_i_i_i[0];
    float v_sroa_3_0_i_i_i_i = v_sroa_3_0_in_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i = v54[0];
    float v91 = v37 + v_sroa_0_0_i_i_i_i;
    float v92 = v39 + v_sroa_3_0_i_i_i_i;
    float v93 = v41 + v_sroa_6_0_i_i_i_i;
    float v94 = v43 + v_sroa_9_0_i_i_i_i;
    float* v95 = &v8[v35];
    v95[0] = v91;
    float* v97 = &v95[1];
    v97[0] = v92;
    float* v99 = &v95[2];
    v99[0] = v93;
    float* v101 = &v95[3];
    v101[0] = v94;
    int v103 = i_03_i + v25;
    bool v104 = v103 < v24;
    if(v104) {
        i_03_i = v103;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    long v106 = i1_02_i;
    float* v107 = &v10[v106];
    float v_val_i_i_i_i = v107[0];
    int v108 = i1_02_i / v12;
    int v109 = v108 % v20;
    int v110 = v109 * v14;
    int v111 = v108 * v12;
    int v112 = i1_02_i - v111;
    int v113 = v112 % v22;
    int v114 = v113 + v110;
    long v115 = v114;
    float* v116 = &v16[v115];
    float v_val_i_i_i_i_i_i = v116[0];
    float v117 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v118 = &v8[v106];
    v118[0] = v117;
    int v120 = i1_02_i + v6;
    bool v121 = v120 < size;
    if(v121) {
        i1_02_i = v120;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_86* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i;
float* v_sroa_6_0_in_i_i_i_i;
float* v_sroa_9_0_in_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f2.f0[0];
    int v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v16 = (global long*)v15;
    long v17 = v16[0];
    int v18 = (int)v17;
    long v19 = v17 >> 32;
    int v20 = (int)v19;
    global float** v21 = &memcopied_eval[0].f1.f2.f0;
    float* v22 = v21[0];
    int v23 = size / 4;
    int v24 = v23 << 2;
    int v25 = v6 << 2;
    int v26 = v4 << 2;
    bool v27 = v26 < v24;
    if(v27) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v26;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v31 = v4 + v24;
    bool v32 = v31 < size;
    if(v32) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v31;
    goto label9;
    label5:;
    int v35 = i_03_i / v10;
    int v36 = v35 % v18;
    int v37 = v36 * v12;
    int v38 = v35 * v10;
    int v39 = i_03_i - v38;
    int v40 = v39 % v20;
    int v41 = v40 + v37;
    int v42 = v40 + 4;
    bool v43 = v42 > v20;
    long v44 = v41;
    float* v45 = &v14[v44];
    if(v43) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v47 = &v45[1];
    float* v48 = &v45[2];
    float* v49 = &v45[3];
        v_sroa_3_0_in_i_i_i_i = v47;
v_sroa_6_0_in_i_i_i_i = v48;
v_sroa_9_0_in_i_i_i_i = v49;
    goto label8;
    label7:;
    int v51 = i_03_i | 1;
    int v52 = v51 / v10;
    int v53 = v52 % v18;
    int v54 = v53 * v12;
    int v55 = v52 * v10;
    int v56 = v51 - v55;
    int v57 = v56 % v20;
    int v58 = v57 + v54;
    long v59 = v58;
    float* v60 = &v14[v59];
    int v61 = i_03_i | 2;
    int v62 = v61 / v10;
    int v63 = v62 % v18;
    int v64 = v63 * v12;
    int v65 = v62 * v10;
    int v66 = v61 - v65;
    int v67 = v66 % v20;
    int v68 = v67 + v64;
    long v69 = v68;
    float* v70 = &v14[v69];
    int v71 = i_03_i | 3;
    int v72 = v71 / v10;
    int v73 = v72 % v18;
    int v74 = v73 * v12;
    int v75 = v72 * v10;
    int v76 = v71 - v75;
    int v77 = v76 % v20;
    int v78 = v77 + v74;
    long v79 = v78;
    float* v80 = &v14[v79];
        v_sroa_3_0_in_i_i_i_i = v60;
v_sroa_6_0_in_i_i_i_i = v70;
v_sroa_9_0_in_i_i_i_i = v80;
    goto label8;
    label8:;
    float v_sroa_9_0_i_i_i_i = v_sroa_9_0_in_i_i_i_i[0];
    float v_sroa_6_0_i_i_i_i = v_sroa_6_0_in_i_i_i_i[0];
    float v_sroa_3_0_i_i_i_i = v_sroa_3_0_in_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i = v45[0];
    long v82 = i_03_i;
    float* v83 = &v22[v82];
    float v84 = v83[0];
    float* v85 = &v83[1];
    float v86 = v85[0];
    float* v87 = &v83[2];
    float v88 = v87[0];
    float* v89 = &v83[3];
    float v90 = v89[0];
    float v91 = v_sroa_0_0_i_i_i_i + v84;
    float v92 = v_sroa_3_0_i_i_i_i + v86;
    float v93 = v_sroa_6_0_i_i_i_i + v88;
    float v94 = v_sroa_9_0_i_i_i_i + v90;
    float* v95 = &v8[v82];
    v95[0] = v91;
    float* v97 = &v95[1];
    v97[0] = v92;
    float* v99 = &v95[2];
    v99[0] = v93;
    float* v101 = &v95[3];
    v101[0] = v94;
    int v103 = i_03_i + v25;
    bool v104 = v103 < v24;
    if(v104) {
        i_03_i = v103;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    int v106 = i1_02_i / v10;
    int v107 = v106 % v18;
    int v108 = v107 * v12;
    int v109 = v106 * v10;
    int v110 = i1_02_i - v109;
    int v111 = v110 % v20;
    int v112 = v111 + v108;
    long v113 = v112;
    float* v114 = &v14[v113];
    float v_val_i_i_i_i_i_i = v114[0];
    long v115 = i1_02_i;
    float* v116 = &v22[v115];
    float v_val_i_i_i_i = v116[0];
    float v117 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v118 = &v8[v115];
    v118[0] = v117;
    int v120 = i1_02_i + v6;
    bool v121 = v120 < size;
    if(v121) {
        i1_02_i = v120;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_88* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_88 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 3; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_85* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_85* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 12; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    struct Eigen__TensorEvaluator_89* v22 = &eval[0].f1;
    float** v23 = &eval[0].f0.f0;
    float* v_pre = v23[0];
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    int v30 = v29[0];
    int* v31 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v32 = (long*)v31;
    long v33 = v32[0];
    int v34 = (int)v33;
    int* v35 = &eval[0].f1.f1.f2.f0[0];
    int v36 = v35[0];
    long v37 = v33 >> 32;
    int v38 = (int)v37;
    float** v39 = &eval[0].f1.f1.f3.f0;
    float* v40 = v39[0];
    int* v41 = &eval[0].f1.f2.f1.f0[0];
    int v42 = v41[0];
    int* v43 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v44 = (long*)v43;
    long v45 = v44[0];
    int v46 = (int)v45;
    int* v47 = &eval[0].f1.f2.f2.f0[0];
    int v48 = v47[0];
    long v49 = v45 >> 32;
    int v50 = (int)v49;
    float** v51 = &eval[0].f1.f2.f3.f0;
    float* v52 = v51[0];
    float** v53 = &eval[0].f0.f0;
    float* v54 = v53[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    float4 v56 = _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE6float4i(v22, i_03_i);
    float v57 = ((float*)&v56)[0];
    float v58 = ((float*)&v56)[1];
    float v59 = ((float*)&v56)[2];
    float v60 = ((float*)&v56)[3];
    long v61 = i_03_i;
    float* v62 = &v_pre[v61];
    v62[0] = v57;
    float* v64 = &v62[1];
    v64[0] = v58;
    float* v66 = &v62[2];
    v66[0] = v59;
    float* v68 = &v62[3];
    v68[0] = v60;
    int v70 = i_03_i + v18;
    bool v71 = v70 < v17;
    if(v71) {
        i_03_i = v70;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v73 = i1_02_i / v30;
    int v74 = v73 % v34;
    int v75 = v74 * v36;
    int v76 = v73 * v30;
    int v77 = i1_02_i - v76;
    int v78 = v77 % v38;
    int v79 = v78 + v75;
    long v80 = v79;
    float* v81 = &v40[v80];
    float v_val_i_i_i_i_i_i = v81[0];
    int v82 = i1_02_i / v42;
    int v83 = v82 % v46;
    int v84 = v83 * v48;
    int v85 = v82 * v42;
    int v86 = i1_02_i - v85;
    int v87 = v86 % v50;
    int v88 = v87 + v84;
    long v89 = v88;
    float* v90 = &v52[v89];
    float v_val_i_i_i1_i_i_i = v90[0];
    float v91 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v92 = i1_02_i;
    float* v93 = &v54[v92];
    v93[0] = v91;
    int v95 = i1_02_i + v6;
    bool v96 = v95 < size;
    if(v96) {
        i1_02_i = v95;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

float4 _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE6float4i(global struct Eigen__TensorEvaluator_89* this, int index) {
float* v_sroa_3_0_in_i_i;
float* v_sroa_6_0_in_i_i;
float* v_sroa_9_0_in_i_i;
float* v_sroa_3_0_in_i_i1;
float* v_sroa_6_0_in_i_i2;
float* v_sroa_9_0_in_i_i3;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f3.f1.f0.f0[1];
    int v12 = v11[0];
    int v13 = v10 % v12;
    int v14 = v13 + v8;
    int v15 = v13 + 4;
    bool v16 = v15 > v12;
    global float** v17 = &this[0].f1.f3.f0;
    float* v18 = v17[0];
    long v19 = v14;
    float* v20 = &v18[v19];
    if(v16) {
        goto label2;
    } else {
        goto label1;
    }
    label1:;
    float* v22 = &v20[1];
    float* v23 = &v20[2];
    float* v24 = &v20[3];
        v_sroa_3_0_in_i_i = v22;
v_sroa_6_0_in_i_i = v23;
v_sroa_9_0_in_i_i = v24;
    goto label3;
    label2:;
    int v26 = index + 1;
    int v27 = v26 / v1;
    int v28 = v27 % v4;
    int v29 = v28 * v7;
    int v30 = v27 * v1;
    int v31 = v26 - v30;
    int v32 = v31 % v12;
    int v33 = v32 + v29;
    long v34 = v33;
    float* v35 = &v18[v34];
    int v36 = index + 2;
    int v37 = v36 / v1;
    int v38 = v37 % v4;
    int v39 = v38 * v7;
    int v40 = v37 * v1;
    int v41 = v36 - v40;
    int v42 = v41 % v12;
    int v43 = v42 + v39;
    long v44 = v43;
    float* v45 = &v18[v44];
    int v46 = index + 3;
    int v47 = v46 / v1;
    int v48 = v47 % v4;
    int v49 = v48 * v7;
    int v50 = v47 * v1;
    int v51 = v46 - v50;
    int v52 = v51 % v12;
    int v53 = v52 + v49;
    long v54 = v53;
    float* v55 = &v18[v54];
        v_sroa_3_0_in_i_i = v35;
v_sroa_6_0_in_i_i = v45;
v_sroa_9_0_in_i_i = v55;
    goto label3;
    label3:;
    float v_sroa_9_0_i_i = v_sroa_9_0_in_i_i[0];
    float v_sroa_6_0_i_i = v_sroa_6_0_in_i_i[0];
    float v_sroa_3_0_i_i = v_sroa_3_0_in_i_i[0];
    float v_sroa_0_0_i_i = v20[0];
    global int* v57 = &this[0].f2.f1.f0[0];
    int v58 = v57[0];
    int v59 = index / v58;
    global int* v60 = &this[0].f2.f3.f1.f0.f0[0];
    int v61 = v60[0];
    int v62 = v59 % v61;
    global int* v63 = &this[0].f2.f2.f0[0];
    int v64 = v63[0];
    int v65 = v64 * v62;
    int v66 = v59 * v58;
    int v67 = index - v66;
    global int* v68 = &this[0].f2.f3.f1.f0.f0[1];
    int v69 = v68[0];
    int v70 = v67 % v69;
    int v71 = v70 + v65;
    int v72 = v70 + 4;
    bool v73 = v72 > v69;
    global float** v74 = &this[0].f2.f3.f0;
    float* v75 = v74[0];
    long v76 = v71;
    float* v77 = &v75[v76];
    if(v73) {
        goto label5;
    } else {
        goto label4;
    }
    label4:;
    float* v79 = &v77[1];
    float* v80 = &v77[2];
    float* v81 = &v77[3];
        v_sroa_3_0_in_i_i1 = v79;
v_sroa_6_0_in_i_i2 = v80;
v_sroa_9_0_in_i_i3 = v81;
    goto label6;
    label5:;
    int v83 = index + 1;
    int v84 = v83 / v58;
    int v85 = v84 % v61;
    int v86 = v85 * v64;
    int v87 = v84 * v58;
    int v88 = v83 - v87;
    int v89 = v88 % v69;
    int v90 = v89 + v86;
    long v91 = v90;
    float* v92 = &v75[v91];
    int v93 = index + 2;
    int v94 = v93 / v58;
    int v95 = v94 % v61;
    int v96 = v95 * v64;
    int v97 = v94 * v58;
    int v98 = v93 - v97;
    int v99 = v98 % v69;
    int v100 = v99 + v96;
    long v101 = v100;
    float* v102 = &v75[v101];
    int v103 = index + 3;
    int v104 = v103 / v58;
    int v105 = v104 % v61;
    int v106 = v105 * v64;
    int v107 = v104 * v58;
    int v108 = v103 - v107;
    int v109 = v108 % v69;
    int v110 = v109 + v106;
    long v111 = v110;
    float* v112 = &v75[v111];
        v_sroa_3_0_in_i_i1 = v92;
v_sroa_6_0_in_i_i2 = v102;
v_sroa_9_0_in_i_i3 = v112;
    goto label6;
    label6:;
    float v_sroa_9_0_i_i4 = v_sroa_9_0_in_i_i3[0];
    float v_sroa_6_0_i_i5 = v_sroa_6_0_in_i_i2[0];
    float v_sroa_3_0_i_i6 = v_sroa_3_0_in_i_i1[0];
    float v_sroa_0_0_i_i7 = v77[0];
    float v114 = v_sroa_0_0_i_i + v_sroa_0_0_i_i7;
    float v115 = v_sroa_3_0_i_i + v_sroa_3_0_i_i6;
    float v116 = v_sroa_6_0_i_i + v_sroa_6_0_i_i5;
    float v117 = v_sroa_9_0_i_i + v_sroa_9_0_i_i4;
    float4 oldret_i_i;
    ((float*)&oldret_i_i)[0] = v114;
    ((float*)&oldret_i_i)[1] = v115;
    float4 oldret2_i_i = oldret_i_i;
    ((float*)&oldret2_i_i)[2] = v116;
    float4 oldret4_i_i = oldret2_i_i;
    ((float*)&oldret4_i_i)[3] = v117;
    float4 oldret6_i_i = oldret4_i_i;
    return oldret6_i_i;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_90* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_90 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_93* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_93* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 13; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float** v22 = &eval[0].f1.f1.f0;
    struct Eigen__TensorEvaluator_94* v23 = &eval[0].f1.f2;
    float** v24 = &eval[0].f0.f0;
    float* v_pre = v22[0];
    float* v_pre1 = v24[0];
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v27 = v4 + v17;
    bool v28 = v27 < size;
    if(v28) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float** v30 = &eval[0].f1.f1.f0;
    float* v31 = v30[0];
    int* v32 = &eval[0].f1.f2.f1.f0[0];
    int v33 = v32[0];
    int* v34 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v35 = (long*)v34;
    long v36 = v35[0];
    int v37 = (int)v36;
    int* v38 = &eval[0].f1.f2.f2.f0[0];
    long*v39 = (long*)v38;
    long v40 = v39[0];
    int v41 = (int)v40;
    int* v42 = &eval[0].f1.f2.f1.f0[1];
    int v43 = v42[0];
    long v44 = v36 >> 32;
    int v45 = (int)v44;
    long v46 = v40 >> 32;
    int v47 = (int)v46;
    int* v48 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    int v49 = v48[0];
    float** v50 = &eval[0].f1.f2.f3.f0;
    float* v51 = v50[0];
    float** v52 = &eval[0].f0.f0;
    float* v53 = v52[0];
        i1_02_i = v27;
    goto label6;
    label5:;
    long v55 = i_03_i;
    float* v56 = &v_pre[v55];
    float v57 = v56[0];
    float* v58 = &v56[1];
    float v59 = v58[0];
    float* v60 = &v56[2];
    float v61 = v60[0];
    float* v62 = &v56[3];
    float v63 = v62[0];
    float4 v64 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v23, i_03_i);
    float v65 = ((float*)&v64)[0];
    float v66 = ((float*)&v64)[1];
    float v67 = ((float*)&v64)[2];
    float v68 = ((float*)&v64)[3];
    float v69 = v57 + v65;
    float v70 = v59 + v66;
    float v71 = v61 + v67;
    float v72 = v63 + v68;
    float* v73 = &v_pre1[v55];
    v73[0] = v69;
    float* v75 = &v73[1];
    v75[0] = v70;
    float* v77 = &v73[2];
    v77[0] = v71;
    float* v79 = &v73[3];
    v79[0] = v72;
    int v81 = i_03_i + v18;
    bool v82 = v81 < v17;
    if(v82) {
        i_03_i = v81;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long v84 = i1_02_i;
    float* v85 = &v31[v84];
    float v_val_i_i_i_i = v85[0];
    int v86 = i1_02_i / v33;
    int v87 = v86 % v37;
    int v88 = v87 * v41;
    int v89 = v86 * v33;
    int v90 = i1_02_i - v89;
    int v91 = v90 / v43;
    int v92 = v91 % v45;
    int v93 = v92 * v47;
    int v94 = v93 + v88;
    int v95 = v91 * v43;
    int v96 = v90 - v95;
    int v97 = v96 % v49;
    int v98 = v94 + v97;
    long v99 = v98;
    float* v100 = &v51[v99];
    float v_val_i_i_i_i_i_i = v100[0];
    float v101 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v102 = &v53[v84];
    v102[0] = v101;
    int v104 = i1_02_i + v6;
    bool v105 = v104 < size;
    if(v105) {
        i1_02_i = v104;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

float4 _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(global struct Eigen__TensorEvaluator_94* this, int index) {
float* v_sroa_3_0_in;
float* v_sroa_6_0_in;
float* v_sroa_9_0_in;
    label0:;
    global int* v0 = &this[0].f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f3.f1.f0.f0[2];
    int v24 = v23[0];
    int v25 = v22 % v24;
    int v26 = v25 + v20;
    int v27 = v25 + 4;
    bool v28 = v27 > v24;
    global float** v29 = &this[0].f3.f0;
    float* v30 = v29[0];
    long v31 = v26;
    float* v32 = &v30[v31];
    if(v28) {
        goto label2;
    } else {
        goto label1;
    }
    label1:;
    float* v34 = &v32[1];
    float* v35 = &v32[2];
    float* v36 = &v32[3];
        v_sroa_3_0_in = v34;
v_sroa_6_0_in = v35;
v_sroa_9_0_in = v36;
    goto label3;
    label2:;
    int v38 = index + 1;
    int v39 = v38 / v1;
    int v40 = v39 % v4;
    int v41 = v7 * v40;
    int v42 = v39 * v1;
    int v43 = v38 - v42;
    int v44 = v43 / v12;
    int v45 = v44 % v15;
    int v46 = v18 * v45;
    int v47 = v46 + v41;
    int v48 = v44 * v12;
    int v49 = v43 - v48;
    int v50 = v49 % v24;
    int v51 = v47 + v50;
    long v52 = v51;
    float* v53 = &v30[v52];
    int v54 = index + 2;
    int v55 = v54 / v1;
    int v56 = v55 % v4;
    int v57 = v7 * v56;
    int v58 = v55 * v1;
    int v59 = v54 - v58;
    int v60 = v59 / v12;
    int v61 = v60 % v15;
    int v62 = v18 * v61;
    int v63 = v62 + v57;
    int v64 = v60 * v12;
    int v65 = v59 - v64;
    int v66 = v65 % v24;
    int v67 = v63 + v66;
    long v68 = v67;
    float* v69 = &v30[v68];
    int v70 = index + 3;
    int v71 = v70 / v1;
    int v72 = v71 % v4;
    int v73 = v7 * v72;
    int v74 = v71 * v1;
    int v75 = v70 - v74;
    int v76 = v75 / v12;
    int v77 = v76 % v15;
    int v78 = v18 * v77;
    int v79 = v78 + v73;
    int v80 = v76 * v12;
    int v81 = v75 - v80;
    int v82 = v81 % v24;
    int v83 = v79 + v82;
    long v84 = v83;
    float* v85 = &v30[v84];
        v_sroa_3_0_in = v53;
v_sroa_6_0_in = v69;
v_sroa_9_0_in = v85;
    goto label3;
    label3:;
    float v_sroa_9_0 = v_sroa_9_0_in[0];
    float v_sroa_6_0 = v_sroa_6_0_in[0];
    float v_sroa_3_0 = v_sroa_3_0_in[0];
    float v_sroa_0_0 = v32[0];
    float4 v87;
    ((float*)&v87)[0] = v_sroa_0_0;
    ((float*)&v87)[1] = v_sroa_3_0;
    float4 v88 = v87;
    ((float*)&v88)[2] = v_sroa_6_0;
    float4 v89 = v88;
    ((float*)&v89)[3] = v_sroa_9_0;
    float4 v90 = v89;
    return v90;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_95* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_95 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_94* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_94* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 13; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float** v22 = &eval[0].f1.f2.f0;
    float** v23 = &eval[0].f0.f0;
    float* v_pre = v22[0];
    float* v_pre1 = v23[0];
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    int v30 = v29[0];
    int* v31 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v32 = (long*)v31;
    long v33 = v32[0];
    int v34 = (int)v33;
    int* v35 = &eval[0].f1.f1.f2.f0[0];
    long*v36 = (long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    int* v39 = &eval[0].f1.f1.f1.f0[1];
    int v40 = v39[0];
    long v41 = v33 >> 32;
    int v42 = (int)v41;
    long v43 = v37 >> 32;
    int v44 = (int)v43;
    int* v45 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    int v46 = v45[0];
    float** v47 = &eval[0].f1.f1.f3.f0;
    float* v48 = v47[0];
    float** v49 = &eval[0].f1.f2.f0;
    float* v50 = v49[0];
    float** v51 = &eval[0].f0.f0;
    float* v52 = v51[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    float4 v54 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v11, i_03_i);
    float v55 = ((float*)&v54)[0];
    float v56 = ((float*)&v54)[1];
    float v57 = ((float*)&v54)[2];
    float v58 = ((float*)&v54)[3];
    long v59 = i_03_i;
    float* v60 = &v_pre[v59];
    float v61 = v60[0];
    float* v62 = &v60[1];
    float v63 = v62[0];
    float* v64 = &v60[2];
    float v65 = v64[0];
    float* v66 = &v60[3];
    float v67 = v66[0];
    float v68 = v55 + v61;
    float v69 = v56 + v63;
    float v70 = v57 + v65;
    float v71 = v58 + v67;
    float* v72 = &v_pre1[v59];
    v72[0] = v68;
    float* v74 = &v72[1];
    v74[0] = v69;
    float* v76 = &v72[2];
    v76[0] = v70;
    float* v78 = &v72[3];
    v78[0] = v71;
    int v80 = i_03_i + v18;
    bool v81 = v80 < v17;
    if(v81) {
        i_03_i = v80;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v83 = i1_02_i / v30;
    int v84 = v83 % v34;
    int v85 = v84 * v38;
    int v86 = v83 * v30;
    int v87 = i1_02_i - v86;
    int v88 = v87 / v40;
    int v89 = v88 % v42;
    int v90 = v89 * v44;
    int v91 = v90 + v85;
    int v92 = v88 * v40;
    int v93 = v87 - v92;
    int v94 = v93 % v46;
    int v95 = v91 + v94;
    long v96 = v95;
    float* v97 = &v48[v96];
    float v_val_i_i_i_i_i_i = v97[0];
    long v98 = i1_02_i;
    float* v99 = &v50[v98];
    float v_val_i_i_i_i = v99[0];
    float v100 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v101 = &v52[v98];
    v101[0] = v100;
    int v103 = i1_02_i + v6;
    bool v104 = v103 < size;
    if(v104) {
        i1_02_i = v103;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_97* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_97 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_94* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_94* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 18; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    struct Eigen__TensorEvaluator_94* v22 = &eval[0].f1.f2;
    float** v23 = &eval[0].f0.f0;
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    int v30 = v29[0];
    int* v31 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v32 = (long*)v31;
    long v33 = v32[0];
    int v34 = (int)v33;
    int* v35 = &eval[0].f1.f1.f2.f0[0];
    long*v36 = (long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    int* v39 = &eval[0].f1.f1.f1.f0[1];
    int v40 = v39[0];
    long v41 = v33 >> 32;
    int v42 = (int)v41;
    long v43 = v37 >> 32;
    int v44 = (int)v43;
    int* v45 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    int v46 = v45[0];
    float** v47 = &eval[0].f1.f1.f3.f0;
    float* v48 = v47[0];
    int* v49 = &eval[0].f1.f2.f1.f0[0];
    int v50 = v49[0];
    int* v51 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v52 = (long*)v51;
    long v53 = v52[0];
    int v54 = (int)v53;
    int* v55 = &eval[0].f1.f2.f2.f0[0];
    long*v56 = (long*)v55;
    long v57 = v56[0];
    int v58 = (int)v57;
    int* v59 = &eval[0].f1.f2.f1.f0[1];
    int v60 = v59[0];
    long v61 = v53 >> 32;
    int v62 = (int)v61;
    long v63 = v57 >> 32;
    int v64 = (int)v63;
    int* v65 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    int v66 = v65[0];
    float** v67 = &eval[0].f1.f2.f3.f0;
    float* v68 = v67[0];
    float** v69 = &eval[0].f0.f0;
    float* v70 = v69[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    float4 v72 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v11, i_03_i);
    float v73 = ((float*)&v72)[0];
    float v74 = ((float*)&v72)[1];
    float v75 = ((float*)&v72)[2];
    float v76 = ((float*)&v72)[3];
    float4 v77 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v22, i_03_i);
    float v78 = ((float*)&v77)[0];
    float v79 = ((float*)&v77)[1];
    float v80 = ((float*)&v77)[2];
    float v81 = ((float*)&v77)[3];
    float v82 = v73 + v78;
    float v83 = v74 + v79;
    float v84 = v75 + v80;
    float v85 = v76 + v81;
    float* v86 = v23[0];
    long v87 = i_03_i;
    float* v88 = &v86[v87];
    v88[0] = v82;
    float* v90 = &v88[1];
    v90[0] = v83;
    float* v92 = &v88[2];
    v92[0] = v84;
    float* v94 = &v88[3];
    v94[0] = v85;
    int v96 = i_03_i + v18;
    bool v97 = v96 < v17;
    if(v97) {
        i_03_i = v96;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v99 = i1_02_i / v30;
    int v100 = v99 % v34;
    int v101 = v100 * v38;
    int v102 = v99 * v30;
    int v103 = i1_02_i - v102;
    int v104 = v103 / v40;
    int v105 = v104 % v42;
    int v106 = v105 * v44;
    int v107 = v106 + v101;
    int v108 = v104 * v40;
    int v109 = v103 - v108;
    int v110 = v109 % v46;
    int v111 = v107 + v110;
    long v112 = v111;
    float* v113 = &v48[v112];
    float v_val_i_i_i_i_i_i = v113[0];
    int v114 = i1_02_i / v50;
    int v115 = v114 % v54;
    int v116 = v115 * v58;
    int v117 = v114 * v50;
    int v118 = i1_02_i - v117;
    int v119 = v118 / v60;
    int v120 = v119 % v62;
    int v121 = v120 * v64;
    int v122 = v121 + v116;
    int v123 = v119 * v60;
    int v124 = v118 - v123;
    int v125 = v124 % v66;
    int v126 = v122 + v125;
    long v127 = v126;
    float* v128 = &v68[v127];
    float v_val_i_i_i1_i_i_i = v128[0];
    float v129 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v130 = i1_02_i;
    float* v131 = &v70[v130];
    v131[0] = v129;
    int v133 = i1_02_i + v6;
    bool v134 = v133 < size;
    if(v134) {
        i1_02_i = v133;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_99* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_99 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_102* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_102* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 14; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float** v22 = &eval[0].f1.f1.f0;
    struct Eigen__TensorEvaluator_103* v23 = &eval[0].f1.f2;
    float** v24 = &eval[0].f0.f0;
    float* v_pre = v22[0];
    float* v_pre1 = v24[0];
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v27 = v4 + v17;
    bool v28 = v27 < size;
    if(v28) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float** v30 = &eval[0].f1.f1.f0;
    float* v31 = v30[0];
    int* v32 = &eval[0].f1.f2.f1.f0[0];
    long*v33 = (long*)v32;
    long v34 = v33[0];
    int v35 = (int)v34;
    int* v36 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v37 = (long*)v36;
    long v38 = v37[0];
    int v39 = (int)v38;
    int* v40 = &eval[0].f1.f2.f2.f0[0];
    long*v41 = (long*)v40;
    long v42 = v41[0];
    int v43 = (int)v42;
    long v44 = v34 >> 32;
    int v45 = (int)v44;
    long v46 = v38 >> 32;
    int v47 = (int)v46;
    long v48 = v42 >> 32;
    int v49 = (int)v48;
    int* v50 = &eval[0].f1.f2.f1.f0[2];
    int v51 = v50[0];
    int* v52 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    long*v53 = (long*)v52;
    long v54 = v53[0];
    int v55 = (int)v54;
    int* v56 = &eval[0].f1.f2.f2.f0[2];
    int v57 = v56[0];
    long v58 = v54 >> 32;
    int v59 = (int)v58;
    float** v60 = &eval[0].f1.f2.f3.f0;
    float* v61 = v60[0];
    float** v62 = &eval[0].f0.f0;
    float* v63 = v62[0];
        i1_02_i = v27;
    goto label6;
    label5:;
    long v65 = i_03_i;
    float* v66 = &v_pre[v65];
    float v67 = v66[0];
    float* v68 = &v66[1];
    float v69 = v68[0];
    float* v70 = &v66[2];
    float v71 = v70[0];
    float* v72 = &v66[3];
    float v73 = v72[0];
    float4 v74 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v23, i_03_i);
    float v75 = ((float*)&v74)[0];
    float v76 = ((float*)&v74)[1];
    float v77 = ((float*)&v74)[2];
    float v78 = ((float*)&v74)[3];
    float v79 = v67 + v75;
    float v80 = v69 + v76;
    float v81 = v71 + v77;
    float v82 = v73 + v78;
    float* v83 = &v_pre1[v65];
    v83[0] = v79;
    float* v85 = &v83[1];
    v85[0] = v80;
    float* v87 = &v83[2];
    v87[0] = v81;
    float* v89 = &v83[3];
    v89[0] = v82;
    int v91 = i_03_i + v18;
    bool v92 = v91 < v17;
    if(v92) {
        i_03_i = v91;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long v94 = i1_02_i;
    float* v95 = &v31[v94];
    float v_val_i_i_i_i = v95[0];
    int v96 = i1_02_i / v35;
    int v97 = v96 % v39;
    int v98 = v97 * v43;
    int v99 = v96 * v35;
    int v100 = i1_02_i - v99;
    int v101 = v100 / v45;
    int v102 = v101 % v47;
    int v103 = v102 * v49;
    int v104 = v103 + v98;
    int v105 = v101 * v45;
    int v106 = v100 - v105;
    int v107 = v106 / v51;
    int v108 = v107 % v55;
    int v109 = v108 * v57;
    int v110 = v104 + v109;
    int v111 = v107 * v51;
    int v112 = v106 - v111;
    int v113 = v112 % v59;
    int v114 = v110 + v113;
    long v115 = v114;
    float* v116 = &v61[v115];
    float v_val_i_i_i_i_i_i = v116[0];
    float v117 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v118 = &v63[v94];
    v118[0] = v117;
    int v120 = i1_02_i + v6;
    bool v121 = v120 < size;
    if(v121) {
        i1_02_i = v120;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

float4 _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(global struct Eigen__TensorEvaluator_103* this, int index) {
float* v_sroa_3_0_in;
float* v_sroa_6_0_in;
float* v_sroa_9_0_in;
    label0:;
    global int* v0 = &this[0].f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f0[2];
    int v24 = v23[0];
    int v25 = v22 / v24;
    global int* v26 = &this[0].f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    global int* v29 = &this[0].f2.f0[2];
    int v30 = v29[0];
    int v31 = v30 * v28;
    int v32 = v31 + v20;
    int v33 = v25 * v24;
    int v34 = v22 - v33;
    global int* v35 = &this[0].f3.f1.f0.f0[3];
    int v36 = v35[0];
    int v37 = v34 % v36;
    int v38 = v37 + v32;
    int v39 = v37 + 4;
    bool v40 = v39 > v36;
    global float** v41 = &this[0].f3.f0;
    float* v42 = v41[0];
    long v43 = v38;
    float* v44 = &v42[v43];
    if(v40) {
        goto label2;
    } else {
        goto label1;
    }
    label1:;
    float* v46 = &v44[1];
    float* v47 = &v44[2];
    float* v48 = &v44[3];
        v_sroa_3_0_in = v46;
v_sroa_6_0_in = v47;
v_sroa_9_0_in = v48;
    goto label3;
    label2:;
    int v50 = index + 1;
    int v51 = v50 / v1;
    int v52 = v51 % v4;
    int v53 = v7 * v52;
    int v54 = v51 * v1;
    int v55 = v50 - v54;
    int v56 = v55 / v12;
    int v57 = v56 % v15;
    int v58 = v18 * v57;
    int v59 = v58 + v53;
    int v60 = v56 * v12;
    int v61 = v55 - v60;
    int v62 = v61 / v24;
    int v63 = v62 % v27;
    int v64 = v30 * v63;
    int v65 = v59 + v64;
    int v66 = v62 * v24;
    int v67 = v61 - v66;
    int v68 = v67 % v36;
    int v69 = v65 + v68;
    long v70 = v69;
    float* v71 = &v42[v70];
    int v72 = index + 2;
    int v73 = v72 / v1;
    int v74 = v73 % v4;
    int v75 = v7 * v74;
    int v76 = v73 * v1;
    int v77 = v72 - v76;
    int v78 = v77 / v12;
    int v79 = v78 % v15;
    int v80 = v18 * v79;
    int v81 = v80 + v75;
    int v82 = v78 * v12;
    int v83 = v77 - v82;
    int v84 = v83 / v24;
    int v85 = v84 % v27;
    int v86 = v30 * v85;
    int v87 = v81 + v86;
    int v88 = v84 * v24;
    int v89 = v83 - v88;
    int v90 = v89 % v36;
    int v91 = v87 + v90;
    long v92 = v91;
    float* v93 = &v42[v92];
    int v94 = index + 3;
    int v95 = v94 / v1;
    int v96 = v95 % v4;
    int v97 = v7 * v96;
    int v98 = v95 * v1;
    int v99 = v94 - v98;
    int v100 = v99 / v12;
    int v101 = v100 % v15;
    int v102 = v18 * v101;
    int v103 = v102 + v97;
    int v104 = v100 * v12;
    int v105 = v99 - v104;
    int v106 = v105 / v24;
    int v107 = v106 % v27;
    int v108 = v30 * v107;
    int v109 = v103 + v108;
    int v110 = v106 * v24;
    int v111 = v105 - v110;
    int v112 = v111 % v36;
    int v113 = v109 + v112;
    long v114 = v113;
    float* v115 = &v42[v114];
        v_sroa_3_0_in = v71;
v_sroa_6_0_in = v93;
v_sroa_9_0_in = v115;
    goto label3;
    label3:;
    float v_sroa_9_0 = v_sroa_9_0_in[0];
    float v_sroa_6_0 = v_sroa_6_0_in[0];
    float v_sroa_3_0 = v_sroa_3_0_in[0];
    float v_sroa_0_0 = v44[0];
    float4 v117;
    ((float*)&v117)[0] = v_sroa_0_0;
    ((float*)&v117)[1] = v_sroa_3_0;
    float4 v118 = v117;
    ((float*)&v118)[2] = v_sroa_6_0;
    float4 v119 = v118;
    ((float*)&v119)[3] = v_sroa_9_0;
    float4 v120 = v119;
    return v120;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_104* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_104 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_103* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_103* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 14; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float** v22 = &eval[0].f1.f2.f0;
    float** v23 = &eval[0].f0.f0;
    float* v_pre = v22[0];
    float* v_pre1 = v23[0];
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    long*v30 = (long*)v29;
    long v31 = v30[0];
    int v32 = (int)v31;
    int* v33 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v34 = (long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    int* v37 = &eval[0].f1.f1.f2.f0[0];
    long*v38 = (long*)v37;
    long v39 = v38[0];
    int v40 = (int)v39;
    long v41 = v31 >> 32;
    int v42 = (int)v41;
    long v43 = v35 >> 32;
    int v44 = (int)v43;
    long v45 = v39 >> 32;
    int v46 = (int)v45;
    int* v47 = &eval[0].f1.f1.f1.f0[2];
    int v48 = v47[0];
    int* v49 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    long*v50 = (long*)v49;
    long v51 = v50[0];
    int v52 = (int)v51;
    int* v53 = &eval[0].f1.f1.f2.f0[2];
    int v54 = v53[0];
    long v55 = v51 >> 32;
    int v56 = (int)v55;
    float** v57 = &eval[0].f1.f1.f3.f0;
    float* v58 = v57[0];
    float** v59 = &eval[0].f1.f2.f0;
    float* v60 = v59[0];
    float** v61 = &eval[0].f0.f0;
    float* v62 = v61[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    float4 v64 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v11, i_03_i);
    float v65 = ((float*)&v64)[0];
    float v66 = ((float*)&v64)[1];
    float v67 = ((float*)&v64)[2];
    float v68 = ((float*)&v64)[3];
    long v69 = i_03_i;
    float* v70 = &v_pre[v69];
    float v71 = v70[0];
    float* v72 = &v70[1];
    float v73 = v72[0];
    float* v74 = &v70[2];
    float v75 = v74[0];
    float* v76 = &v70[3];
    float v77 = v76[0];
    float v78 = v65 + v71;
    float v79 = v66 + v73;
    float v80 = v67 + v75;
    float v81 = v68 + v77;
    float* v82 = &v_pre1[v69];
    v82[0] = v78;
    float* v84 = &v82[1];
    v84[0] = v79;
    float* v86 = &v82[2];
    v86[0] = v80;
    float* v88 = &v82[3];
    v88[0] = v81;
    int v90 = i_03_i + v18;
    bool v91 = v90 < v17;
    if(v91) {
        i_03_i = v90;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v93 = i1_02_i / v32;
    int v94 = v93 % v36;
    int v95 = v94 * v40;
    int v96 = v93 * v32;
    int v97 = i1_02_i - v96;
    int v98 = v97 / v42;
    int v99 = v98 % v44;
    int v100 = v99 * v46;
    int v101 = v100 + v95;
    int v102 = v98 * v42;
    int v103 = v97 - v102;
    int v104 = v103 / v48;
    int v105 = v104 % v52;
    int v106 = v105 * v54;
    int v107 = v101 + v106;
    int v108 = v104 * v48;
    int v109 = v103 - v108;
    int v110 = v109 % v56;
    int v111 = v107 + v110;
    long v112 = v111;
    float* v113 = &v58[v112];
    float v_val_i_i_i_i_i_i = v113[0];
    long v114 = i1_02_i;
    float* v115 = &v60[v114];
    float v_val_i_i_i_i = v115[0];
    float v116 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v117 = &v62[v114];
    v117[0] = v116;
    int v119 = i1_02_i + v6;
    bool v120 = v119 < size;
    if(v120) {
        i1_02_i = v119;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_106* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_106 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_103* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_103* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 20; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    struct Eigen__TensorEvaluator_103* v22 = &eval[0].f1.f2;
    float** v23 = &eval[0].f0.f0;
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    long*v30 = (long*)v29;
    long v31 = v30[0];
    int v32 = (int)v31;
    int* v33 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v34 = (long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    int* v37 = &eval[0].f1.f1.f2.f0[0];
    long*v38 = (long*)v37;
    long v39 = v38[0];
    int v40 = (int)v39;
    long v41 = v31 >> 32;
    int v42 = (int)v41;
    long v43 = v35 >> 32;
    int v44 = (int)v43;
    long v45 = v39 >> 32;
    int v46 = (int)v45;
    int* v47 = &eval[0].f1.f1.f1.f0[2];
    int v48 = v47[0];
    int* v49 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    long*v50 = (long*)v49;
    long v51 = v50[0];
    int v52 = (int)v51;
    int* v53 = &eval[0].f1.f1.f2.f0[2];
    int v54 = v53[0];
    long v55 = v51 >> 32;
    int v56 = (int)v55;
    float** v57 = &eval[0].f1.f1.f3.f0;
    float* v58 = v57[0];
    int* v59 = &eval[0].f1.f2.f1.f0[0];
    long*v60 = (long*)v59;
    long v61 = v60[0];
    int v62 = (int)v61;
    int* v63 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v64 = (long*)v63;
    long v65 = v64[0];
    int v66 = (int)v65;
    int* v67 = &eval[0].f1.f2.f2.f0[0];
    long*v68 = (long*)v67;
    long v69 = v68[0];
    int v70 = (int)v69;
    long v71 = v61 >> 32;
    int v72 = (int)v71;
    long v73 = v65 >> 32;
    int v74 = (int)v73;
    long v75 = v69 >> 32;
    int v76 = (int)v75;
    int* v77 = &eval[0].f1.f2.f1.f0[2];
    int v78 = v77[0];
    int* v79 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    long*v80 = (long*)v79;
    long v81 = v80[0];
    int v82 = (int)v81;
    int* v83 = &eval[0].f1.f2.f2.f0[2];
    int v84 = v83[0];
    long v85 = v81 >> 32;
    int v86 = (int)v85;
    float** v87 = &eval[0].f1.f2.f3.f0;
    float* v88 = v87[0];
    float** v89 = &eval[0].f0.f0;
    float* v90 = v89[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    float4 v92 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v11, i_03_i);
    float v93 = ((float*)&v92)[0];
    float v94 = ((float*)&v92)[1];
    float v95 = ((float*)&v92)[2];
    float v96 = ((float*)&v92)[3];
    float4 v97 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v22, i_03_i);
    float v98 = ((float*)&v97)[0];
    float v99 = ((float*)&v97)[1];
    float v100 = ((float*)&v97)[2];
    float v101 = ((float*)&v97)[3];
    float v102 = v93 + v98;
    float v103 = v94 + v99;
    float v104 = v95 + v100;
    float v105 = v96 + v101;
    float* v106 = v23[0];
    long v107 = i_03_i;
    float* v108 = &v106[v107];
    v108[0] = v102;
    float* v110 = &v108[1];
    v110[0] = v103;
    float* v112 = &v108[2];
    v112[0] = v104;
    float* v114 = &v108[3];
    v114[0] = v105;
    int v116 = i_03_i + v18;
    bool v117 = v116 < v17;
    if(v117) {
        i_03_i = v116;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v119 = i1_02_i / v32;
    int v120 = v119 % v36;
    int v121 = v120 * v40;
    int v122 = v119 * v32;
    int v123 = i1_02_i - v122;
    int v124 = v123 / v42;
    int v125 = v124 % v44;
    int v126 = v125 * v46;
    int v127 = v126 + v121;
    int v128 = v124 * v42;
    int v129 = v123 - v128;
    int v130 = v129 / v48;
    int v131 = v130 % v52;
    int v132 = v131 * v54;
    int v133 = v127 + v132;
    int v134 = v130 * v48;
    int v135 = v129 - v134;
    int v136 = v135 % v56;
    int v137 = v133 + v136;
    long v138 = v137;
    float* v139 = &v58[v138];
    float v_val_i_i_i_i_i_i = v139[0];
    int v140 = i1_02_i / v62;
    int v141 = v140 % v66;
    int v142 = v141 * v70;
    int v143 = v140 * v62;
    int v144 = i1_02_i - v143;
    int v145 = v144 / v72;
    int v146 = v145 % v74;
    int v147 = v146 * v76;
    int v148 = v147 + v142;
    int v149 = v145 * v72;
    int v150 = v144 - v149;
    int v151 = v150 / v78;
    int v152 = v151 % v82;
    int v153 = v152 * v84;
    int v154 = v148 + v153;
    int v155 = v151 * v78;
    int v156 = v150 - v155;
    int v157 = v156 % v86;
    int v158 = v154 + v157;
    long v159 = v158;
    float* v160 = &v88[v159];
    float v_val_i_i_i1_i_i_i = v160[0];
    float v161 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v162 = i1_02_i;
    float* v163 = &v90[v162];
    v163[0] = v161;
    int v165 = i1_02_i + v6;
    bool v166 = v165 < size;
    if(v166) {
        i1_02_i = v165;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_108* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_108 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 5; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_111* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_111* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 18; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float** v22 = &eval[0].f1.f1.f0;
    struct Eigen__TensorEvaluator_112* v23 = &eval[0].f1.f2;
    float** v24 = &eval[0].f0.f0;
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v27 = v4 + v17;
    bool v28 = v27 < size;
    if(v28) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float** v30 = &eval[0].f1.f1.f0;
    float* v31 = v30[0];
    int* v32 = &eval[0].f1.f2.f1.f0[0];
    int v33 = v32[0];
    int* v34 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v35 = (long*)v34;
    long v36 = v35[0];
    int v37 = (int)v36;
    int* v38 = &eval[0].f1.f2.f2.f0[0];
    long*v39 = (long*)v38;
    long v40 = v39[0];
    int v41 = (int)v40;
    int* v42 = &eval[0].f1.f2.f1.f0[1];
    int v43 = v42[0];
    long v44 = v36 >> 32;
    int v45 = (int)v44;
    long v46 = v40 >> 32;
    int v47 = (int)v46;
    int* v48 = &eval[0].f1.f2.f1.f0[2];
    int v49 = v48[0];
    int* v50 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    long*v51 = (long*)v50;
    long v52 = v51[0];
    int v53 = (int)v52;
    int* v54 = &eval[0].f1.f2.f2.f0[2];
    long*v55 = (long*)v54;
    long v56 = v55[0];
    int v57 = (int)v56;
    int* v58 = &eval[0].f1.f2.f1.f0[3];
    int v59 = v58[0];
    long v60 = v52 >> 32;
    int v61 = (int)v60;
    long v62 = v56 >> 32;
    int v63 = (int)v62;
    int* v64 = &eval[0].f1.f2.f3.f1.f0.f0[4];
    int v65 = v64[0];
    float** v66 = &eval[0].f1.f2.f3.f0;
    float* v67 = v66[0];
    float** v68 = &eval[0].f0.f0;
    float* v69 = v68[0];
        i1_02_i = v27;
    goto label6;
    label5:;
    float* v71 = v22[0];
    long v72 = i_03_i;
    float* v73 = &v71[v72];
    float v74 = v73[0];
    float* v75 = &v73[1];
    float v76 = v75[0];
    float* v77 = &v73[2];
    float v78 = v77[0];
    float* v79 = &v73[3];
    float v80 = v79[0];
    float4 v81 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v23, i_03_i);
    float v82 = ((float*)&v81)[0];
    float v83 = ((float*)&v81)[1];
    float v84 = ((float*)&v81)[2];
    float v85 = ((float*)&v81)[3];
    float v86 = v74 + v82;
    float v87 = v76 + v83;
    float v88 = v78 + v84;
    float v89 = v80 + v85;
    float* v90 = v24[0];
    float* v91 = &v90[v72];
    v91[0] = v86;
    float* v93 = &v91[1];
    v93[0] = v87;
    float* v95 = &v91[2];
    v95[0] = v88;
    float* v97 = &v91[3];
    v97[0] = v89;
    int v99 = i_03_i + v18;
    bool v100 = v99 < v17;
    if(v100) {
        i_03_i = v99;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long v102 = i1_02_i;
    float* v103 = &v31[v102];
    float v_val_i_i_i_i = v103[0];
    int v104 = i1_02_i / v33;
    int v105 = v104 % v37;
    int v106 = v105 * v41;
    int v107 = v104 * v33;
    int v108 = i1_02_i - v107;
    int v109 = v108 / v43;
    int v110 = v109 % v45;
    int v111 = v110 * v47;
    int v112 = v111 + v106;
    int v113 = v109 * v43;
    int v114 = v108 - v113;
    int v115 = v114 / v49;
    int v116 = v115 % v53;
    int v117 = v116 * v57;
    int v118 = v112 + v117;
    int v119 = v115 * v49;
    int v120 = v114 - v119;
    int v121 = v120 / v59;
    int v122 = v121 % v61;
    int v123 = v122 * v63;
    int v124 = v118 + v123;
    int v125 = v121 * v59;
    int v126 = v120 - v125;
    int v127 = v126 % v65;
    int v128 = v124 + v127;
    long v129 = v128;
    float* v130 = &v67[v129];
    float v_val_i_i_i_i_i_i = v130[0];
    float v131 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v132 = &v69[v102];
    v132[0] = v131;
    int v134 = i1_02_i + v6;
    bool v135 = v134 < size;
    if(v135) {
        i1_02_i = v134;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

float4 _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(global struct Eigen__TensorEvaluator_112* this, int index) {
int i1_04;
float v_sroa_0_0;
float v_sroa_3_0;
float v_sroa_6_0;
float v_sroa_9_0;
    label0:;
    float values[4];
    global int* v0 = &this[0].f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f0[2];
    int v24 = v23[0];
    int v25 = v22 / v24;
    global int* v26 = &this[0].f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    global int* v29 = &this[0].f2.f0[2];
    int v30 = v29[0];
    int v31 = v30 * v28;
    int v32 = v31 + v20;
    int v33 = v25 * v24;
    int v34 = v22 - v33;
    global int* v35 = &this[0].f1.f0[3];
    int v36 = v35[0];
    int v37 = v34 / v36;
    global int* v38 = &this[0].f3.f1.f0.f0[3];
    int v39 = v38[0];
    int v40 = v37 % v39;
    global int* v41 = &this[0].f2.f0[3];
    int v42 = v41[0];
    int v43 = v42 * v40;
    int v44 = v43 + v32;
    int v45 = v37 * v36;
    int v46 = v34 - v45;
    global struct Eigen__TensorEvaluator_111* v47 = &this[0].f3;
    global int* v48 = &this[0].f3.f1.f0.f0[4];
    int v49 = v48[0];
    int v50 = v46 % v49;
    int v51 = v50 + v44;
    int v52 = v50 + 4;
    bool v53 = v52 > v49;
    if(v53) {
        goto label2;
    } else {
        goto label1;
    }
    label1:;
    global float** v55 = &v47[0].f0;
    float* v56 = v55[0];
    long v57 = v51;
    float* v58 = &v56[v57];
    float v59 = v58[0];
    float* v60 = &v58[1];
    float v61 = v60[0];
    float* v62 = &v58[2];
    float v63 = v62[0];
    float* v64 = &v58[3];
    float v65 = v64[0];
        v_sroa_0_0 = v59;
v_sroa_3_0 = v61;
v_sroa_6_0 = v63;
v_sroa_9_0 = v65;
    goto label5;
    label2:;
    char*v67 = (char*)values;
    global float** v69 = &v47[0].f0;
    float* v70 = v69[0];
    long v71 = v51;
    float* v72 = &v70[v71];
    int*v73 = (int*)v72;
    int v_val_i2 = v73[0];
    int*v74 = (int*)values;
    v74[0] = v_val_i2;
        i1_04 = 1;
    goto label4;
    label3:;
    float* v77 = &(&values)[0][0];
    float v78 = v77[0];
    float* v79 = &(&values)[0][1];
    float v80 = v79[0];
    float* v81 = &(&values)[0][2];
    float v82 = v81[0];
    float* v83 = &(&values)[0][3];
    float v84 = v83[0];
        v_sroa_0_0 = v78;
v_sroa_3_0 = v80;
v_sroa_6_0 = v82;
v_sroa_9_0 = v84;
    goto label5;
    label4:;
    int v87 = i1_04 + index;
    int v88 = v87 / v1;
    int v89 = v88 % v4;
    int v90 = v7 * v89;
    int v91 = v88 * v1;
    int v92 = v87 - v91;
    int v93 = v92 / v12;
    int v94 = v93 % v15;
    int v95 = v18 * v94;
    int v96 = v95 + v90;
    int v97 = v93 * v12;
    int v98 = v92 - v97;
    int v99 = v98 / v24;
    int v100 = v99 % v27;
    int v101 = v30 * v100;
    int v102 = v96 + v101;
    int v103 = v99 * v24;
    int v104 = v98 - v103;
    int v105 = v104 / v36;
    int v106 = v105 % v39;
    int v107 = v42 * v106;
    int v108 = v102 + v107;
    int v109 = v105 * v36;
    int v110 = v104 - v109;
    int v111 = v110 % v49;
    int v112 = v108 + v111;
    long v113 = v112;
    float* v114 = &v70[v113];
    int*v115 = (int*)v114;
    int v_val_i_i3 = v115[0];
    long v116 = i1_04;
    float* v117 = &(&values)[0][v116];
    int*v118 = (int*)v117;
    v118[0] = v_val_i_i3;
    int v120 = i1_04 + 1;
    bool exitcond = v120 == 4;
    if(exitcond) {
        goto label3;
    } else {
        i1_04 = v120;
        goto label4;
    }
    label5:;
    float4 v122;
    ((float*)&v122)[0] = v_sroa_0_0;
    ((float*)&v122)[1] = v_sroa_3_0;
    float4 v123 = v122;
    ((float*)&v123)[2] = v_sroa_6_0;
    float4 v124 = v123;
    ((float*)&v124)[3] = v_sroa_9_0;
    float4 v125 = v124;
    return v125;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_113* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_113 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 5; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_112* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_112* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 18; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float** v22 = &eval[0].f1.f2.f0;
    float** v23 = &eval[0].f0.f0;
    float* v_pre = v22[0];
    float* v_pre1 = v23[0];
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    int v30 = v29[0];
    int* v31 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v32 = (long*)v31;
    long v33 = v32[0];
    int v34 = (int)v33;
    int* v35 = &eval[0].f1.f1.f2.f0[0];
    long*v36 = (long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    int* v39 = &eval[0].f1.f1.f1.f0[1];
    int v40 = v39[0];
    long v41 = v33 >> 32;
    int v42 = (int)v41;
    long v43 = v37 >> 32;
    int v44 = (int)v43;
    int* v45 = &eval[0].f1.f1.f1.f0[2];
    int v46 = v45[0];
    int* v47 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    long*v48 = (long*)v47;
    long v49 = v48[0];
    int v50 = (int)v49;
    int* v51 = &eval[0].f1.f1.f2.f0[2];
    long*v52 = (long*)v51;
    long v53 = v52[0];
    int v54 = (int)v53;
    int* v55 = &eval[0].f1.f1.f1.f0[3];
    int v56 = v55[0];
    long v57 = v49 >> 32;
    int v58 = (int)v57;
    long v59 = v53 >> 32;
    int v60 = (int)v59;
    int* v61 = &eval[0].f1.f1.f3.f1.f0.f0[4];
    int v62 = v61[0];
    float** v63 = &eval[0].f1.f1.f3.f0;
    float* v64 = v63[0];
    float** v65 = &eval[0].f1.f2.f0;
    float* v66 = v65[0];
    float** v67 = &eval[0].f0.f0;
    float* v68 = v67[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    float4 v70 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v11, i_03_i);
    float v71 = ((float*)&v70)[0];
    float v72 = ((float*)&v70)[1];
    float v73 = ((float*)&v70)[2];
    float v74 = ((float*)&v70)[3];
    long v75 = i_03_i;
    float* v76 = &v_pre[v75];
    float v77 = v76[0];
    float* v78 = &v76[1];
    float v79 = v78[0];
    float* v80 = &v76[2];
    float v81 = v80[0];
    float* v82 = &v76[3];
    float v83 = v82[0];
    float v84 = v71 + v77;
    float v85 = v72 + v79;
    float v86 = v73 + v81;
    float v87 = v74 + v83;
    float* v88 = &v_pre1[v75];
    v88[0] = v84;
    float* v90 = &v88[1];
    v90[0] = v85;
    float* v92 = &v88[2];
    v92[0] = v86;
    float* v94 = &v88[3];
    v94[0] = v87;
    int v96 = i_03_i + v18;
    bool v97 = v96 < v17;
    if(v97) {
        i_03_i = v96;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v99 = i1_02_i / v30;
    int v100 = v99 % v34;
    int v101 = v100 * v38;
    int v102 = v99 * v30;
    int v103 = i1_02_i - v102;
    int v104 = v103 / v40;
    int v105 = v104 % v42;
    int v106 = v105 * v44;
    int v107 = v106 + v101;
    int v108 = v104 * v40;
    int v109 = v103 - v108;
    int v110 = v109 / v46;
    int v111 = v110 % v50;
    int v112 = v111 * v54;
    int v113 = v107 + v112;
    int v114 = v110 * v46;
    int v115 = v109 - v114;
    int v116 = v115 / v56;
    int v117 = v116 % v58;
    int v118 = v117 * v60;
    int v119 = v113 + v118;
    int v120 = v116 * v56;
    int v121 = v115 - v120;
    int v122 = v121 % v62;
    int v123 = v119 + v122;
    long v124 = v123;
    float* v125 = &v64[v124];
    float v_val_i_i_i_i_i_i = v125[0];
    long v126 = i1_02_i;
    float* v127 = &v66[v126];
    float v_val_i_i_i_i = v127[0];
    float v128 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v129 = &v68[v126];
    v129[0] = v128;
    int v131 = i1_02_i + v6;
    bool v132 = v131 < size;
    if(v132) {
        i1_02_i = v131;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_115* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_115 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 5; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_112* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_112* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 26; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 4;
    int v17 = v16 << 2;
    int v18 = v6 << 2;
    int v19 = v4 << 2;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    struct Eigen__TensorEvaluator_112* v22 = &eval[0].f1.f2;
    float** v23 = &eval[0].f0.f0;
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float** v29 = &eval[0].f0.f0;
    float* v_pre_i = v29[0];
    int* v30 = &eval[0].f1.f1.f1.f0[0];
    int v31 = v30[0];
    int* v32 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v33 = (long*)v32;
    long v34 = v33[0];
    int v35 = (int)v34;
    int* v36 = &eval[0].f1.f1.f2.f0[0];
    long*v37 = (long*)v36;
    long v38 = v37[0];
    int v39 = (int)v38;
    int* v40 = &eval[0].f1.f1.f1.f0[1];
    int v41 = v40[0];
    long v42 = v34 >> 32;
    int v43 = (int)v42;
    long v44 = v38 >> 32;
    int v45 = (int)v44;
    int* v46 = &eval[0].f1.f1.f1.f0[2];
    int v47 = v46[0];
    int* v48 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    long*v49 = (long*)v48;
    long v50 = v49[0];
    int v51 = (int)v50;
    int* v52 = &eval[0].f1.f1.f2.f0[2];
    long*v53 = (long*)v52;
    long v54 = v53[0];
    int v55 = (int)v54;
    int* v56 = &eval[0].f1.f1.f1.f0[3];
    int v57 = v56[0];
    long v58 = v50 >> 32;
    int v59 = (int)v58;
    long v60 = v54 >> 32;
    int v61 = (int)v60;
    int* v62 = &eval[0].f1.f1.f3.f1.f0.f0[4];
    int v63 = v62[0];
    float** v64 = &eval[0].f1.f1.f3.f0;
    float* v65 = v64[0];
    int* v66 = &eval[0].f1.f2.f1.f0[0];
    int v67 = v66[0];
    int* v68 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v69 = (long*)v68;
    long v70 = v69[0];
    int v71 = (int)v70;
    int* v72 = &eval[0].f1.f2.f2.f0[0];
    long*v73 = (long*)v72;
    long v74 = v73[0];
    int v75 = (int)v74;
    int* v76 = &eval[0].f1.f2.f1.f0[1];
    int v77 = v76[0];
    long v78 = v70 >> 32;
    int v79 = (int)v78;
    long v80 = v74 >> 32;
    int v81 = (int)v80;
    int* v82 = &eval[0].f1.f2.f1.f0[2];
    int v83 = v82[0];
    int* v84 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    long*v85 = (long*)v84;
    long v86 = v85[0];
    int v87 = (int)v86;
    int* v88 = &eval[0].f1.f2.f2.f0[2];
    long*v89 = (long*)v88;
    long v90 = v89[0];
    int v91 = (int)v90;
    int* v92 = &eval[0].f1.f2.f1.f0[3];
    int v93 = v92[0];
    long v94 = v86 >> 32;
    int v95 = (int)v94;
    long v96 = v90 >> 32;
    int v97 = (int)v96;
    int* v98 = &eval[0].f1.f2.f3.f1.f0.f0[4];
    int v99 = v98[0];
    float** v100 = &eval[0].f1.f2.f3.f0;
    float* v101 = v100[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    float4 v103 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v11, i_03_i);
    float v104 = ((float*)&v103)[0];
    float v105 = ((float*)&v103)[1];
    float v106 = ((float*)&v103)[2];
    float v107 = ((float*)&v103)[3];
    float4 v108 = _ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(v22, i_03_i);
    float v109 = ((float*)&v108)[0];
    float v110 = ((float*)&v108)[1];
    float v111 = ((float*)&v108)[2];
    float v112 = ((float*)&v108)[3];
    float v113 = v104 + v109;
    float v114 = v105 + v110;
    float v115 = v106 + v111;
    float v116 = v107 + v112;
    float* v117 = v23[0];
    long v118 = i_03_i;
    float* v119 = &v117[v118];
    v119[0] = v113;
    float* v121 = &v119[1];
    v121[0] = v114;
    float* v123 = &v119[2];
    v123[0] = v115;
    float* v125 = &v119[3];
    v125[0] = v116;
    int v127 = i_03_i + v18;
    bool v128 = v127 < v17;
    if(v128) {
        i_03_i = v127;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v130 = i1_02_i / v31;
    int v131 = v130 % v35;
    int v132 = v39 * v131;
    int v133 = v130 * v31;
    int v134 = i1_02_i - v133;
    int v135 = v134 / v41;
    int v136 = v135 % v43;
    int v137 = v45 * v136;
    int v138 = v137 + v132;
    int v139 = v135 * v41;
    int v140 = v134 - v139;
    int v141 = v140 / v47;
    int v142 = v141 % v51;
    int v143 = v55 * v142;
    int v144 = v138 + v143;
    int v145 = v141 * v47;
    int v146 = v140 - v145;
    int v147 = v146 / v57;
    int v148 = v147 % v59;
    int v149 = v61 * v148;
    int v150 = v144 + v149;
    int v151 = v147 * v57;
    int v152 = v146 - v151;
    int v153 = v152 % v63;
    int v154 = v150 + v153;
    long v155 = v154;
    float* v156 = &v65[v155];
    float v_val_i_i_i_i = v156[0];
    int v157 = i1_02_i / v67;
    int v158 = v157 % v71;
    int v159 = v75 * v158;
    int v160 = v157 * v67;
    int v161 = i1_02_i - v160;
    int v162 = v161 / v77;
    int v163 = v162 % v79;
    int v164 = v81 * v163;
    int v165 = v164 + v159;
    int v166 = v162 * v77;
    int v167 = v161 - v166;
    int v168 = v167 / v83;
    int v169 = v168 % v87;
    int v170 = v91 * v169;
    int v171 = v165 + v170;
    int v172 = v168 * v83;
    int v173 = v167 - v172;
    int v174 = v173 / v93;
    int v175 = v174 % v95;
    int v176 = v97 * v175;
    int v177 = v171 + v176;
    int v178 = v174 * v93;
    int v179 = v173 - v178;
    int v180 = v179 % v99;
    int v181 = v177 + v180;
    long v182 = v181;
    float* v183 = &v101[v182];
    float v_val_i_i_i1_i = v183[0];
    float v184 = v_val_i_i_i_i + v_val_i_i_i1_i;
    long v185 = i1_02_i;
    float* v186 = &v_pre_i[v185];
    v186[0] = v184;
    int v188 = i1_02_i + v6;
    bool v189 = v188 < size;
    if(v189) {
        i1_02_i = v188;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_117* memcopied_eval, long size) {
long i_04_i;
long i1_03_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    long v5 = v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v1;
    long v8 = v7;
    global float** v9 = &memcopied_eval[0].f0.f0;
    float* v10 = v9[0];
    global float** v11 = &memcopied_eval[0].f1.f1.f0;
    float* v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f2.f0;
    float* v14 = v13[0];
    long v15 = size / 2;
    long v16 = v15 << 1;
    long v17 = v8 << 1;
    long v18 = v5 << 1;
    bool v19 = v18 < v16;
    if(v19) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_04_i = v18;
    goto label5;
    label2:;
        goto label3;
    label3:;
    long v23 = v5 + v16;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
        i1_03_i = v23;
    goto label6;
    label5:;
    long sext_i_i_i = i_04_i << 32;
    long v27 = sext_i_i_i >> 32;
    float* v28 = &v12[v27];
    float v29 = v28[0];
    float* v30 = &v28[1];
    float v31 = v30[0];
    float* v32 = &v14[i_04_i];
    float v33 = v32[0];
    float* v34 = &v32[1];
    float v35 = v34[0];
    float v36 = v29 + v33;
    float v37 = v31 + v35;
    float* v38 = &v10[v27];
    v38[0] = v36;
    float* v40 = &v38[1];
    v40[0] = v37;
    long v42 = i_04_i + v17;
    bool v43 = v42 < v16;
    if(v43) {
        i_04_i = v42;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long sext_i_i2_i = i1_03_i << 32;
    long v45 = sext_i_i2_i >> 32;
    float* v46 = &v12[v45];
    float v_val_i_i_i_i = v46[0];
    float* v47 = &v14[i1_03_i];
    float v_val_i1_i_i_i = v47[0];
    float v48 = v_val_i_i_i_i + v_val_i1_i_i_i;
    float* v49 = &v10[v45];
    v49[0] = v48;
    long v51 = i1_03_i + v8;
    bool v52 = v51 < size;
    if(v52) {
        i1_03_i = v51;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_125* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global struct Eigen__TensorEvaluator_126* v9 = &memcopied_eval[0].f1;
    global long*v10 = (global long*)v9;
    long v11 = v10[0];
    global float** v12 = &memcopied_eval[0].f1.f1.f0;
    float* v13 = v12[0];
    int v14 = size / 2;
    int v15 = v14 << 1;
    int v16 = v6 << 1;
    int v17 = v4 << 1;
    bool v18 = v17 < v15;
    if(v18) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float* v20 = (float*)v11;
        i_03_i = v17;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v15;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float* v26 = (float*)v11;
        i1_02_i = v23;
    goto label6;
    label5:;
    long v28 = i_03_i;
    float* v29 = &v13[v28];
    float v30 = v29[0];
    float* v31 = &v29[1];
    float v32 = v31[0];
    float v33 = v20[0];
    float v34 = v30 + v33;
    float v35 = v32 + v33;
    float* v36 = &v8[v28];
    v36[0] = v34;
    float* v38 = &v36[1];
    v38[0] = v35;
    int v40 = i_03_i + v16;
    bool v41 = v40 < v15;
    if(v41) {
        i_03_i = v40;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long v43 = i1_02_i;
    float* v44 = &v13[v43];
    float v_val_i_i_i_i = v44[0];
    float v45 = v26[0];
    float v46 = v_val_i_i_i_i + v45;
    float* v47 = &v8[v43];
    v47[0] = v46;
    int v49 = i1_02_i + v6;
    bool v50 = v49 < size;
    if(v50) {
        i1_02_i = v49;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_128* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global struct Eigen__TensorEvaluator_129* v9 = &memcopied_eval[0].f1;
    global long*v10 = (global long*)v9;
    long v11 = v10[0];
    global float** v12 = &memcopied_eval[0].f1.f1.f0;
    float* v13 = v12[0];
    int v14 = size / 2;
    int v15 = v14 << 1;
    int v16 = v6 << 1;
    int v17 = v4 << 1;
    bool v18 = v17 < v15;
    if(v18) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    float* v20 = (float*)v11;
        i_03_i = v17;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v15;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    float* v26 = (float*)v11;
        i1_02_i = v23;
    goto label6;
    label5:;
    long v28 = i_03_i;
    float* v29 = &v13[v28];
    float v30 = v29[0];
    float* v31 = &v29[1];
    float v32 = v31[0];
    float v33 = v20[0];
    float v34 = v30 + v33;
    float v35 = v32 + v33;
    float* v36 = &v8[v28];
    v36[0] = v34;
    float* v38 = &v36[1];
    v38[0] = v35;
    int v40 = i_03_i + v16;
    bool v41 = v40 < v15;
    if(v41) {
        i_03_i = v40;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    long v43 = i1_02_i;
    float* v44 = &v13[v43];
    float v_val_i_i_i_i = v44[0];
    float v45 = v26[0];
    float v46 = v_val_i_i_i_i + v45;
    float* v47 = &v8[v43];
    v47[0] = v46;
    int v49 = i1_02_i + v6;
    bool v50 = v49 < size;
    if(v50) {
        i1_02_i = v49;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_131* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f0;
    float* v10 = v9[0];
    global float** v11 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    int v14 = v13[0];
    int v15 = size / 2;
    int v16 = v15 << 1;
    int v17 = v6 << 1;
    int v18 = v4 << 1;
    bool v19 = v18 < v16;
    if(v19) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v18;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v16;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v23;
    goto label9;
    label5:;
    long v27 = i_03_i;
    float* v28 = &v10[v27];
    float v29 = v28[0];
    float* v30 = &v28[1];
    float v31 = v30[0];
    int v32 = i_03_i % v14;
    int v33 = v32 + 2;
    bool v34 = v33 > v14;
    long v35 = v32;
    float* v36 = &v12[v35];
    if(v34) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v38 = &v36[1];
        v_sroa_3_0_in_i_i_i_i_i = v38;
    goto label8;
    label7:;
    int v40 = i_03_i | 1;
    int v41 = v40 % v14;
    long v42 = v41;
    float* v43 = &v12[v42];
        v_sroa_3_0_in_i_i_i_i_i = v43;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v36[0];
    float v45 = v29 + v_sroa_0_0_i_i_i_i_i;
    float v46 = v31 + v_sroa_3_0_i_i_i_i_i;
    float* v47 = &v8[v27];
    v47[0] = v45;
    float* v49 = &v47[1];
    v49[0] = v46;
    int v51 = i_03_i + v17;
    bool v52 = v51 < v16;
    if(v52) {
        i_03_i = v51;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    long v54 = i1_02_i;
    float* v55 = &v10[v54];
    float v_val_i_i_i_i = v55[0];
    int v56 = i1_02_i % v14;
    long v57 = v56;
    float* v58 = &v12[v57];
    float v_val_i_i_i_i_i_i = v58[0];
    float v59 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v60 = &v8[v54];
    v60[0] = v59;
    int v62 = i1_02_i + v6;
    bool v63 = v62 < size;
    if(v63) {
        i1_02_i = v62;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_134* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    int v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f2.f0;
    float* v14 = v13[0];
    int v15 = size / 2;
    int v16 = v15 << 1;
    int v17 = v6 << 1;
    int v18 = v4 << 1;
    bool v19 = v18 < v16;
    if(v19) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v18;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v23 = v4 + v16;
    bool v24 = v23 < size;
    if(v24) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v23;
    goto label9;
    label5:;
    int v27 = i_03_i % v12;
    int v28 = v27 + 2;
    bool v29 = v28 > v12;
    long v30 = v27;
    float* v31 = &v10[v30];
    if(v29) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v33 = &v31[1];
        v_sroa_3_0_in_i_i_i_i_i = v33;
    goto label8;
    label7:;
    int v35 = i_03_i | 1;
    int v36 = v35 % v12;
    long v37 = v36;
    float* v38 = &v10[v37];
        v_sroa_3_0_in_i_i_i_i_i = v38;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v31[0];
    long v40 = i_03_i;
    float* v41 = &v14[v40];
    float v42 = v41[0];
    float* v43 = &v41[1];
    float v44 = v43[0];
    float v45 = v_sroa_0_0_i_i_i_i_i + v42;
    float v46 = v_sroa_3_0_i_i_i_i_i + v44;
    float* v47 = &v8[v40];
    v47[0] = v45;
    float* v49 = &v47[1];
    v49[0] = v46;
    int v51 = i_03_i + v17;
    bool v52 = v51 < v16;
    if(v52) {
        i_03_i = v51;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    int v54 = i1_02_i % v12;
    long v55 = v54;
    float* v56 = &v10[v55];
    float v_val_i_i_i_i_i_i = v56[0];
    long v57 = i1_02_i;
    float* v58 = &v14[v57];
    float v_val_i_i_i_i = v58[0];
    float v59 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v60 = &v8[v57];
    v60[0] = v59;
    int v62 = i1_02_i + v6;
    bool v63 = v62 < size;
    if(v63) {
        i1_02_i = v62;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_136* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
float* v_sroa_3_0_in_i_i1_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    int v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    int v16 = v15[0];
    int v17 = size / 2;
    int v18 = v17 << 1;
    int v19 = v6 << 1;
    int v20 = v4 << 1;
    bool v21 = v20 < v18;
    if(v21) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v20;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v25 = v4 + v18;
    bool v26 = v25 < size;
    if(v26) {
        goto label4;
    } else {
        goto label14;
    }
    label4:;
        i1_02_i = v25;
    goto label12;
    label5:;
    int v29 = i_03_i % v12;
    int v30 = v29 + 2;
    bool v31 = v30 > v12;
    long v32 = v29;
    float* v33 = &v10[v32];
    if(v31) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v35 = &v33[1];
        v_sroa_3_0_in_i_i_i_i_i = v35;
    goto label8;
    label7:;
    int v37 = i_03_i | 1;
    int v38 = v37 % v12;
    long v39 = v38;
    float* v40 = &v10[v39];
        v_sroa_3_0_in_i_i_i_i_i = v40;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v33[0];
    int v42 = i_03_i % v16;
    int v43 = v42 + 2;
    bool v44 = v43 > v16;
    long v45 = v42;
    float* v46 = &v14[v45];
    if(v44) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    float* v48 = &v46[1];
        v_sroa_3_0_in_i_i1_i_i_i = v48;
    goto label11;
    label10:;
    int v50 = i_03_i | 1;
    int v51 = v50 % v16;
    long v52 = v51;
    float* v53 = &v14[v52];
        v_sroa_3_0_in_i_i1_i_i_i = v53;
    goto label11;
    label11:;
    float v_sroa_3_0_i_i2_i_i_i = v_sroa_3_0_in_i_i1_i_i_i[0];
    float v_sroa_0_0_i_i3_i_i_i = v46[0];
    float v55 = v_sroa_0_0_i_i_i_i_i + v_sroa_0_0_i_i3_i_i_i;
    float v56 = v_sroa_3_0_i_i_i_i_i + v_sroa_3_0_i_i2_i_i_i;
    long v57 = i_03_i;
    float* v58 = &v8[v57];
    v58[0] = v55;
    float* v60 = &v58[1];
    v60[0] = v56;
    int v62 = i_03_i + v19;
    bool v63 = v62 < v18;
    if(v63) {
        i_03_i = v62;
        goto label5;
    } else {
        goto label2;
    }
    label12:;
    int v65 = i1_02_i % v12;
    long v66 = v65;
    float* v67 = &v10[v66];
    float v_val_i_i_i_i_i_i = v67[0];
    int v68 = i1_02_i % v16;
    long v69 = v68;
    float* v70 = &v14[v69];
    float v_val_i_i_i1_i_i_i = v70[0];
    float v71 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v72 = i1_02_i;
    float* v73 = &v8[v72];
    v73[0] = v71;
    int v75 = i1_02_i + v6;
    bool v76 = v75 < size;
    if(v76) {
        i1_02_i = v75;
        goto label12;
    } else {
        goto label13;
    }
    label13:;
        goto label14;
    label14:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_138* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f2.f0[0];
    int v14 = v13[0];
    global float** v15 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v16 = v15[0];
    global int* v17 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v18 = (global long*)v17;
    long v19 = v18[0];
    int v20 = (int)v19;
    long v21 = v19 >> 32;
    int v22 = (int)v21;
    int v23 = size / 2;
    int v24 = v23 << 1;
    int v25 = v6 << 1;
    int v26 = v4 << 1;
    bool v27 = v26 < v24;
    if(v27) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v26;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v31 = v4 + v24;
    bool v32 = v31 < size;
    if(v32) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v31;
    goto label9;
    label5:;
    long v35 = i_03_i;
    float* v36 = &v10[v35];
    float v37 = v36[0];
    float* v38 = &v36[1];
    float v39 = v38[0];
    int v40 = i_03_i / v12;
    int v41 = v40 % v20;
    int v42 = v41 * v14;
    int v43 = v40 * v12;
    int v44 = i_03_i - v43;
    int v45 = v44 % v22;
    int v46 = v45 + v42;
    int v47 = v45 + 2;
    bool v48 = v47 > v22;
    long v49 = v46;
    float* v50 = &v16[v49];
    if(v48) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v52 = &v50[1];
        v_sroa_3_0_in_i_i_i_i_i = v52;
    goto label8;
    label7:;
    int v54 = i_03_i | 1;
    int v55 = v54 / v12;
    int v56 = v55 % v20;
    int v57 = v56 * v14;
    int v58 = v55 * v12;
    int v59 = v54 - v58;
    int v60 = v59 % v22;
    int v61 = v60 + v57;
    long v62 = v61;
    float* v63 = &v16[v62];
        v_sroa_3_0_in_i_i_i_i_i = v63;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v50[0];
    float v65 = v37 + v_sroa_0_0_i_i_i_i_i;
    float v66 = v39 + v_sroa_3_0_i_i_i_i_i;
    float* v67 = &v8[v35];
    v67[0] = v65;
    float* v69 = &v67[1];
    v69[0] = v66;
    int v71 = i_03_i + v25;
    bool v72 = v71 < v24;
    if(v72) {
        i_03_i = v71;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    long v74 = i1_02_i;
    float* v75 = &v10[v74];
    float v_val_i_i_i_i = v75[0];
    int v76 = i1_02_i / v12;
    int v77 = v76 % v20;
    int v78 = v77 * v14;
    int v79 = v76 * v12;
    int v80 = i1_02_i - v79;
    int v81 = v80 % v22;
    int v82 = v81 + v78;
    long v83 = v82;
    float* v84 = &v16[v83];
    float v_val_i_i_i_i_i_i = v84[0];
    float v85 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v86 = &v8[v74];
    v86[0] = v85;
    int v88 = i1_02_i + v6;
    bool v89 = v88 < size;
    if(v89) {
        i1_02_i = v88;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_143* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f2.f0[0];
    int v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v16 = (global long*)v15;
    long v17 = v16[0];
    int v18 = (int)v17;
    long v19 = v17 >> 32;
    int v20 = (int)v19;
    global float** v21 = &memcopied_eval[0].f1.f2.f0;
    float* v22 = v21[0];
    int v23 = size / 2;
    int v24 = v23 << 1;
    int v25 = v6 << 1;
    int v26 = v4 << 1;
    bool v27 = v26 < v24;
    if(v27) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v26;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v31 = v4 + v24;
    bool v32 = v31 < size;
    if(v32) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v31;
    goto label9;
    label5:;
    int v35 = i_03_i / v10;
    int v36 = v35 % v18;
    int v37 = v36 * v12;
    int v38 = v35 * v10;
    int v39 = i_03_i - v38;
    int v40 = v39 % v20;
    int v41 = v40 + v37;
    int v42 = v40 + 2;
    bool v43 = v42 > v20;
    long v44 = v41;
    float* v45 = &v14[v44];
    if(v43) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v47 = &v45[1];
        v_sroa_3_0_in_i_i_i_i_i = v47;
    goto label8;
    label7:;
    int v49 = i_03_i | 1;
    int v50 = v49 / v10;
    int v51 = v50 % v18;
    int v52 = v51 * v12;
    int v53 = v50 * v10;
    int v54 = v49 - v53;
    int v55 = v54 % v20;
    int v56 = v55 + v52;
    long v57 = v56;
    float* v58 = &v14[v57];
        v_sroa_3_0_in_i_i_i_i_i = v58;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v45[0];
    long v60 = i_03_i;
    float* v61 = &v22[v60];
    float v62 = v61[0];
    float* v63 = &v61[1];
    float v64 = v63[0];
    float v65 = v_sroa_0_0_i_i_i_i_i + v62;
    float v66 = v_sroa_3_0_i_i_i_i_i + v64;
    float* v67 = &v8[v60];
    v67[0] = v65;
    float* v69 = &v67[1];
    v69[0] = v66;
    int v71 = i_03_i + v25;
    bool v72 = v71 < v24;
    if(v72) {
        i_03_i = v71;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    int v74 = i1_02_i / v10;
    int v75 = v74 % v18;
    int v76 = v75 * v12;
    int v77 = v74 * v10;
    int v78 = i1_02_i - v77;
    int v79 = v78 % v20;
    int v80 = v79 + v76;
    long v81 = v80;
    float* v82 = &v14[v81];
    float v_val_i_i_i_i_i_i = v82[0];
    long v83 = i1_02_i;
    float* v84 = &v22[v83];
    float v_val_i_i_i_i = v84[0];
    float v85 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v86 = &v8[v83];
    v86[0] = v85;
    int v88 = i1_02_i + v6;
    bool v89 = v88 < size;
    if(v89) {
        i1_02_i = v88;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_145* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
float* v_sroa_3_0_in_i_i1_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f2.f0[0];
    int v12 = v11[0];
    global float** v13 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v16 = (global long*)v15;
    long v17 = v16[0];
    int v18 = (int)v17;
    long v19 = v17 >> 32;
    int v20 = (int)v19;
    global int* v21 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v22 = v21[0];
    global int* v23 = &memcopied_eval[0].f1.f2.f2.f0[0];
    int v24 = v23[0];
    global float** v25 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v26 = v25[0];
    global int* v27 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v28 = (global long*)v27;
    long v29 = v28[0];
    int v30 = (int)v29;
    long v31 = v29 >> 32;
    int v32 = (int)v31;
    int v33 = size / 2;
    int v34 = v33 << 1;
    int v35 = v6 << 1;
    int v36 = v4 << 1;
    bool v37 = v36 < v34;
    if(v37) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v36;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v41 = v4 + v34;
    bool v42 = v41 < size;
    if(v42) {
        goto label4;
    } else {
        goto label14;
    }
    label4:;
        i1_02_i = v41;
    goto label12;
    label5:;
    int v45 = i_03_i / v10;
    int v46 = v45 % v18;
    int v47 = v46 * v12;
    int v48 = v45 * v10;
    int v49 = i_03_i - v48;
    int v50 = v49 % v20;
    int v51 = v50 + v47;
    int v52 = v50 + 2;
    bool v53 = v52 > v20;
    long v54 = v51;
    float* v55 = &v14[v54];
    if(v53) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v57 = &v55[1];
        v_sroa_3_0_in_i_i_i_i_i = v57;
    goto label8;
    label7:;
    int v59 = i_03_i | 1;
    int v60 = v59 / v10;
    int v61 = v60 % v18;
    int v62 = v61 * v12;
    int v63 = v60 * v10;
    int v64 = v59 - v63;
    int v65 = v64 % v20;
    int v66 = v65 + v62;
    long v67 = v66;
    float* v68 = &v14[v67];
        v_sroa_3_0_in_i_i_i_i_i = v68;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v55[0];
    int v70 = i_03_i / v22;
    int v71 = v70 % v30;
    int v72 = v71 * v24;
    int v73 = v70 * v22;
    int v74 = i_03_i - v73;
    int v75 = v74 % v32;
    int v76 = v75 + v72;
    int v77 = v75 + 2;
    bool v78 = v77 > v32;
    long v79 = v76;
    float* v80 = &v26[v79];
    if(v78) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    float* v82 = &v80[1];
        v_sroa_3_0_in_i_i1_i_i_i = v82;
    goto label11;
    label10:;
    int v84 = i_03_i | 1;
    int v85 = v84 / v22;
    int v86 = v85 % v30;
    int v87 = v86 * v24;
    int v88 = v85 * v22;
    int v89 = v84 - v88;
    int v90 = v89 % v32;
    int v91 = v90 + v87;
    long v92 = v91;
    float* v93 = &v26[v92];
        v_sroa_3_0_in_i_i1_i_i_i = v93;
    goto label11;
    label11:;
    float v_sroa_3_0_i_i2_i_i_i = v_sroa_3_0_in_i_i1_i_i_i[0];
    float v_sroa_0_0_i_i3_i_i_i = v80[0];
    float v95 = v_sroa_0_0_i_i_i_i_i + v_sroa_0_0_i_i3_i_i_i;
    float v96 = v_sroa_3_0_i_i_i_i_i + v_sroa_3_0_i_i2_i_i_i;
    long v97 = i_03_i;
    float* v98 = &v8[v97];
    v98[0] = v95;
    float* v100 = &v98[1];
    v100[0] = v96;
    int v102 = i_03_i + v35;
    bool v103 = v102 < v34;
    if(v103) {
        i_03_i = v102;
        goto label5;
    } else {
        goto label2;
    }
    label12:;
    int v105 = i1_02_i / v10;
    int v106 = v105 % v18;
    int v107 = v106 * v12;
    int v108 = v105 * v10;
    int v109 = i1_02_i - v108;
    int v110 = v109 % v20;
    int v111 = v110 + v107;
    long v112 = v111;
    float* v113 = &v14[v112];
    float v_val_i_i_i_i_i_i = v113[0];
    int v114 = i1_02_i / v22;
    int v115 = v114 % v30;
    int v116 = v115 * v24;
    int v117 = v114 * v22;
    int v118 = i1_02_i - v117;
    int v119 = v118 % v32;
    int v120 = v119 + v116;
    long v121 = v120;
    float* v122 = &v26[v121];
    float v_val_i_i_i1_i_i_i = v122[0];
    float v123 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v124 = i1_02_i;
    float* v125 = &v8[v124];
    v125[0] = v123;
    int v127 = i1_02_i + v6;
    bool v128 = v127 < size;
    if(v128) {
        i1_02_i = v127;
        goto label12;
    } else {
        goto label13;
    }
    label13:;
        goto label14;
    label14:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_147* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f1.f0[1];
    int v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v16 = (global long*)v15;
    long v17 = v16[0];
    int v18 = (int)v17;
    long v19 = v17 >> 32;
    int v20 = (int)v19;
    global float** v21 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v22 = v21[0];
    global int* v23 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v24 = (global long*)v23;
    long v25 = v24[0];
    int v26 = (int)v25;
    long v27 = v25 >> 32;
    int v28 = (int)v27;
    global int* v29 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    int v30 = v29[0];
    int v31 = size / 2;
    int v32 = v31 << 1;
    int v33 = v6 << 1;
    int v34 = v4 << 1;
    bool v35 = v34 < v32;
    if(v35) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v34;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v39 = v4 + v32;
    bool v40 = v39 < size;
    if(v40) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v39;
    goto label9;
    label5:;
    long v43 = i_03_i;
    float* v44 = &v10[v43];
    float v45 = v44[0];
    float* v46 = &v44[1];
    float v47 = v46[0];
    int v48 = i_03_i / v12;
    int v49 = v48 % v26;
    int v50 = v49 * v18;
    int v51 = v48 * v12;
    int v52 = i_03_i - v51;
    int v53 = v52 / v14;
    int v54 = v53 % v28;
    int v55 = v54 * v20;
    int v56 = v55 + v50;
    int v57 = v53 * v14;
    int v58 = v52 - v57;
    int v59 = v58 % v30;
    int v60 = v56 + v59;
    int v61 = v59 + 2;
    bool v62 = v61 > v30;
    long v63 = v60;
    float* v64 = &v22[v63];
    if(v62) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v66 = &v64[1];
        v_sroa_3_0_in_i_i_i_i_i = v66;
    goto label8;
    label7:;
    int v68 = i_03_i | 1;
    int v69 = v68 / v12;
    int v70 = v69 % v26;
    int v71 = v70 * v18;
    int v72 = v69 * v12;
    int v73 = v68 - v72;
    int v74 = v73 / v14;
    int v75 = v74 % v28;
    int v76 = v75 * v20;
    int v77 = v76 + v71;
    int v78 = v74 * v14;
    int v79 = v73 - v78;
    int v80 = v79 % v30;
    int v81 = v77 + v80;
    long v82 = v81;
    float* v83 = &v22[v82];
        v_sroa_3_0_in_i_i_i_i_i = v83;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v64[0];
    float v85 = v45 + v_sroa_0_0_i_i_i_i_i;
    float v86 = v47 + v_sroa_3_0_i_i_i_i_i;
    float* v87 = &v8[v43];
    v87[0] = v85;
    float* v89 = &v87[1];
    v89[0] = v86;
    int v91 = i_03_i + v33;
    bool v92 = v91 < v32;
    if(v92) {
        i_03_i = v91;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    long v94 = i1_02_i;
    float* v95 = &v10[v94];
    float v_val_i_i_i_i = v95[0];
    int v96 = i1_02_i / v12;
    int v97 = v96 % v26;
    int v98 = v97 * v18;
    int v99 = v96 * v12;
    int v100 = i1_02_i - v99;
    int v101 = v100 / v14;
    int v102 = v101 % v28;
    int v103 = v102 * v20;
    int v104 = v103 + v98;
    int v105 = v101 * v14;
    int v106 = v100 - v105;
    int v107 = v106 % v30;
    int v108 = v104 + v107;
    long v109 = v108;
    float* v110 = &v22[v109];
    float v_val_i_i_i_i_i_i = v110[0];
    float v111 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v112 = &v8[v94];
    v112[0] = v111;
    int v114 = i1_02_i + v6;
    bool v115 = v114 < size;
    if(v115) {
        i1_02_i = v114;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_152* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f1.f0[1];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v14 = (global long*)v13;
    long v15 = v14[0];
    int v16 = (int)v15;
    long v17 = v15 >> 32;
    int v18 = (int)v17;
    global float** v19 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v20 = v19[0];
    global int* v21 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v22 = (global long*)v21;
    long v23 = v22[0];
    int v24 = (int)v23;
    long v25 = v23 >> 32;
    int v26 = (int)v25;
    global int* v27 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    int v28 = v27[0];
    global float** v29 = &memcopied_eval[0].f1.f2.f0;
    float* v30 = v29[0];
    int v31 = size / 2;
    int v32 = v31 << 1;
    int v33 = v6 << 1;
    int v34 = v4 << 1;
    bool v35 = v34 < v32;
    if(v35) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v34;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v39 = v4 + v32;
    bool v40 = v39 < size;
    if(v40) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v39;
    goto label9;
    label5:;
    int v43 = i_03_i / v10;
    int v44 = v43 % v24;
    int v45 = v44 * v16;
    int v46 = v43 * v10;
    int v47 = i_03_i - v46;
    int v48 = v47 / v12;
    int v49 = v48 % v26;
    int v50 = v49 * v18;
    int v51 = v50 + v45;
    int v52 = v48 * v12;
    int v53 = v47 - v52;
    int v54 = v53 % v28;
    int v55 = v51 + v54;
    int v56 = v54 + 2;
    bool v57 = v56 > v28;
    long v58 = v55;
    float* v59 = &v20[v58];
    if(v57) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v61 = &v59[1];
        v_sroa_3_0_in_i_i_i_i_i = v61;
    goto label8;
    label7:;
    int v63 = i_03_i | 1;
    int v64 = v63 / v10;
    int v65 = v64 % v24;
    int v66 = v65 * v16;
    int v67 = v64 * v10;
    int v68 = v63 - v67;
    int v69 = v68 / v12;
    int v70 = v69 % v26;
    int v71 = v70 * v18;
    int v72 = v71 + v66;
    int v73 = v69 * v12;
    int v74 = v68 - v73;
    int v75 = v74 % v28;
    int v76 = v72 + v75;
    long v77 = v76;
    float* v78 = &v20[v77];
        v_sroa_3_0_in_i_i_i_i_i = v78;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i_i_i = v_sroa_3_0_in_i_i_i_i_i[0];
    float v_sroa_0_0_i_i_i_i_i = v59[0];
    long v80 = i_03_i;
    float* v81 = &v30[v80];
    float v82 = v81[0];
    float* v83 = &v81[1];
    float v84 = v83[0];
    float v85 = v_sroa_0_0_i_i_i_i_i + v82;
    float v86 = v_sroa_3_0_i_i_i_i_i + v84;
    float* v87 = &v8[v80];
    v87[0] = v85;
    float* v89 = &v87[1];
    v89[0] = v86;
    int v91 = i_03_i + v33;
    bool v92 = v91 < v32;
    if(v92) {
        i_03_i = v91;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    int v94 = i1_02_i / v10;
    int v95 = v94 % v24;
    int v96 = v95 * v16;
    int v97 = v94 * v10;
    int v98 = i1_02_i - v97;
    int v99 = v98 / v12;
    int v100 = v99 % v26;
    int v101 = v100 * v18;
    int v102 = v101 + v96;
    int v103 = v99 * v12;
    int v104 = v98 - v103;
    int v105 = v104 % v28;
    int v106 = v102 + v105;
    long v107 = v106;
    float* v108 = &v20[v107];
    float v_val_i_i_i_i_i_i = v108[0];
    long v109 = i1_02_i;
    float* v110 = &v30[v109];
    float v_val_i_i_i_i = v110[0];
    float v111 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v112 = &v8[v109];
    v112[0] = v111;
    int v114 = i1_02_i + v6;
    bool v115 = v114 < size;
    if(v115) {
        i1_02_i = v114;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_154* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_154 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_151* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_151* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 18; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 2;
    int v17 = v16 << 1;
    int v18 = v6 << 1;
    int v19 = v4 << 1;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    struct Eigen__TensorEvaluator_155* v22 = &eval[0].f1;
    float** v23 = &eval[0].f0.f0;
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    int v30 = v29[0];
    int* v31 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v32 = (long*)v31;
    long v33 = v32[0];
    int v34 = (int)v33;
    int* v35 = &eval[0].f1.f1.f2.f0[0];
    long*v36 = (long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    int* v39 = &eval[0].f1.f1.f1.f0[1];
    int v40 = v39[0];
    long v41 = v33 >> 32;
    int v42 = (int)v41;
    long v43 = v37 >> 32;
    int v44 = (int)v43;
    int* v45 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    int v46 = v45[0];
    float** v47 = &eval[0].f1.f1.f3.f0;
    float* v48 = v47[0];
    int* v49 = &eval[0].f1.f2.f1.f0[0];
    int v50 = v49[0];
    int* v51 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v52 = (long*)v51;
    long v53 = v52[0];
    int v54 = (int)v53;
    int* v55 = &eval[0].f1.f2.f2.f0[0];
    long*v56 = (long*)v55;
    long v57 = v56[0];
    int v58 = (int)v57;
    int* v59 = &eval[0].f1.f2.f1.f0[1];
    int v60 = v59[0];
    long v61 = v53 >> 32;
    int v62 = (int)v61;
    long v63 = v57 >> 32;
    int v64 = (int)v63;
    int* v65 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    int v66 = v65[0];
    float** v67 = &eval[0].f1.f2.f3.f0;
    float* v68 = v67[0];
    float** v69 = &eval[0].f0.f0;
    float* v70 = v69[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    struct double2_124 v72 = _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(v22, i_03_i);
    float v73 = v72.f0;
    float v74 = v72.f1;
    float* v75 = v23[0];
    long v76 = i_03_i;
    float* v77 = &v75[v76];
    v77[0] = v73;
    float* v79 = &v77[1];
    v79[0] = v74;
    int v81 = i_03_i + v18;
    bool v82 = v81 < v17;
    if(v82) {
        i_03_i = v81;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v84 = i1_02_i / v30;
    int v85 = v84 % v34;
    int v86 = v85 * v38;
    int v87 = v84 * v30;
    int v88 = i1_02_i - v87;
    int v89 = v88 / v40;
    int v90 = v89 % v42;
    int v91 = v90 * v44;
    int v92 = v91 + v86;
    int v93 = v89 * v40;
    int v94 = v88 - v93;
    int v95 = v94 % v46;
    int v96 = v92 + v95;
    long v97 = v96;
    float* v98 = &v48[v97];
    float v_val_i_i_i_i_i_i = v98[0];
    int v99 = i1_02_i / v50;
    int v100 = v99 % v54;
    int v101 = v100 * v58;
    int v102 = v99 * v50;
    int v103 = i1_02_i - v102;
    int v104 = v103 / v60;
    int v105 = v104 % v62;
    int v106 = v105 * v64;
    int v107 = v106 + v101;
    int v108 = v104 * v60;
    int v109 = v103 - v108;
    int v110 = v109 % v66;
    int v111 = v107 + v110;
    long v112 = v111;
    float* v113 = &v68[v112];
    float v_val_i_i_i1_i_i_i = v113[0];
    float v114 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v115 = i1_02_i;
    float* v116 = &v70[v115];
    v116[0] = v114;
    int v118 = i1_02_i + v6;
    bool v119 = v118 < size;
    if(v119) {
        i1_02_i = v118;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

struct double2_124 _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(global struct Eigen__TensorEvaluator_155* this, int index) {
float* v_sroa_3_0_in_i_i;
float* v_sroa_3_0_in_i_i1;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f1.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f1.f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f3.f1.f0.f0[2];
    int v24 = v23[0];
    int v25 = v22 % v24;
    int v26 = v20 + v25;
    int v27 = v25 + 2;
    bool v28 = v27 > v24;
    global float** v29 = &this[0].f1.f3.f0;
    float* v30 = v29[0];
    long v31 = v26;
    float* v32 = &v30[v31];
    if(v28) {
        goto label2;
    } else {
        goto label1;
    }
    label1:;
    float* v34 = &v32[1];
        v_sroa_3_0_in_i_i = v34;
    goto label3;
    label2:;
    int v36 = index + 1;
    int v37 = v36 / v1;
    int v38 = v37 % v4;
    int v39 = v38 * v7;
    int v40 = v37 * v1;
    int v41 = v36 - v40;
    int v42 = v41 / v12;
    int v43 = v42 % v15;
    int v44 = v43 * v18;
    int v45 = v44 + v39;
    int v46 = v42 * v12;
    int v47 = v41 - v46;
    int v48 = v47 % v24;
    int v49 = v45 + v48;
    long v50 = v49;
    float* v51 = &v30[v50];
        v_sroa_3_0_in_i_i = v51;
    goto label3;
    label3:;
    float v_sroa_3_0_i_i = v_sroa_3_0_in_i_i[0];
    float v_sroa_0_0_i_i = v32[0];
    global int* v53 = &this[0].f2.f1.f0[0];
    int v54 = v53[0];
    int v55 = index / v54;
    global int* v56 = &this[0].f2.f3.f1.f0.f0[0];
    int v57 = v56[0];
    int v58 = v55 % v57;
    global int* v59 = &this[0].f2.f2.f0[0];
    int v60 = v59[0];
    int v61 = v60 * v58;
    int v62 = v55 * v54;
    int v63 = index - v62;
    global int* v64 = &this[0].f2.f1.f0[1];
    int v65 = v64[0];
    int v66 = v63 / v65;
    global int* v67 = &this[0].f2.f3.f1.f0.f0[1];
    int v68 = v67[0];
    int v69 = v66 % v68;
    global int* v70 = &this[0].f2.f2.f0[1];
    int v71 = v70[0];
    int v72 = v71 * v69;
    int v73 = v72 + v61;
    int v74 = v66 * v65;
    int v75 = v63 - v74;
    global int* v76 = &this[0].f2.f3.f1.f0.f0[2];
    int v77 = v76[0];
    int v78 = v75 % v77;
    int v79 = v73 + v78;
    int v80 = v78 + 2;
    bool v81 = v80 > v77;
    global float** v82 = &this[0].f2.f3.f0;
    float* v83 = v82[0];
    long v84 = v79;
    float* v85 = &v83[v84];
    if(v81) {
        goto label5;
    } else {
        goto label4;
    }
    label4:;
    float* v87 = &v85[1];
        v_sroa_3_0_in_i_i1 = v87;
    goto label6;
    label5:;
    int v89 = index + 1;
    int v90 = v89 / v54;
    int v91 = v90 % v57;
    int v92 = v91 * v60;
    int v93 = v90 * v54;
    int v94 = v89 - v93;
    int v95 = v94 / v65;
    int v96 = v95 % v68;
    int v97 = v96 * v71;
    int v98 = v97 + v92;
    int v99 = v95 * v65;
    int v100 = v94 - v99;
    int v101 = v100 % v77;
    int v102 = v98 + v101;
    long v103 = v102;
    float* v104 = &v83[v103];
        v_sroa_3_0_in_i_i1 = v104;
    goto label6;
    label6:;
    float v_sroa_3_0_i_i2 = v_sroa_3_0_in_i_i1[0];
    float v_sroa_0_0_i_i3 = v85[0];
    float v106 = v_sroa_0_0_i_i + v_sroa_0_0_i_i3;
    float v107 = v_sroa_3_0_i_i + v_sroa_3_0_i_i2;
    struct double2_124 oldret_i_i;
    oldret_i_i.f0 = v106;
    oldret_i_i.f1 = v107;
    struct double2_124 oldret2_i_i = oldret_i_i;
    return oldret2_i_i;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_156* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    global long*v12 = (global long*)v11;
    long v13 = v12[0];
    int v14 = (int)v13;
    long v15 = v13 >> 32;
    int v16 = (int)v15;
    global int* v17 = &memcopied_eval[0].f1.f2.f1.f0[2];
    int v18 = v17[0];
    global int* v19 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v20 = (global long*)v19;
    long v21 = v20[0];
    int v22 = (int)v21;
    long v23 = v21 >> 32;
    int v24 = (int)v23;
    global int* v25 = &memcopied_eval[0].f1.f2.f2.f0[2];
    int v26 = v25[0];
    global float** v27 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v28 = v27[0];
    global int* v29 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v30 = (global long*)v29;
    long v31 = v30[0];
    int v32 = (int)v31;
    long v33 = v31 >> 32;
    int v34 = (int)v33;
    global int* v35 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    global long*v36 = (global long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    long v39 = v37 >> 32;
    int v40 = (int)v39;
    int v41 = size / 2;
    int v42 = v41 << 1;
    int v43 = v6 << 1;
    int v44 = v4 << 1;
    bool v45 = v44 < v42;
    if(v45) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v44;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v49 = v4 + v42;
    bool v50 = v49 < size;
    if(v50) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v49;
    goto label9;
    label5:;
    long v53 = i_03_i;
    float* v54 = &v10[v53];
    float v55 = v54[0];
    float* v56 = &v54[1];
    float v57 = v56[0];
    int v58 = i_03_i / v14;
    int v59 = v58 % v32;
    int v60 = v59 * v22;
    int v61 = v58 * v14;
    int v62 = i_03_i - v61;
    int v63 = v62 / v16;
    int v64 = v63 % v34;
    int v65 = v64 * v24;
    int v66 = v65 + v60;
    int v67 = v63 * v16;
    int v68 = v62 - v67;
    int v69 = v68 / v18;
    int v70 = v69 % v38;
    int v71 = v70 * v26;
    int v72 = v66 + v71;
    int v73 = v69 * v18;
    int v74 = v68 - v73;
    int v75 = v74 % v40;
    int v76 = v72 + v75;
    int v77 = v75 + 2;
    bool v78 = v77 > v40;
    long v79 = v76;
    float* v80 = &v28[v79];
    if(v78) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v82 = &v80[1];
        v_sroa_3_0_in_i_i_i = v82;
    goto label8;
    label7:;
    int v84 = i_03_i | 1;
    int v85 = v84 / v14;
    int v86 = v85 % v32;
    int v87 = v86 * v22;
    int v88 = v85 * v14;
    int v89 = v84 - v88;
    int v90 = v89 / v16;
    int v91 = v90 % v34;
    int v92 = v91 * v24;
    int v93 = v92 + v87;
    int v94 = v90 * v16;
    int v95 = v89 - v94;
    int v96 = v95 / v18;
    int v97 = v96 % v38;
    int v98 = v97 * v26;
    int v99 = v93 + v98;
    int v100 = v96 * v18;
    int v101 = v95 - v100;
    int v102 = v101 % v40;
    int v103 = v99 + v102;
    long v104 = v103;
    float* v105 = &v28[v104];
        v_sroa_3_0_in_i_i_i = v105;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i = v_sroa_3_0_in_i_i_i[0];
    float v_sroa_0_0_i_i_i = v80[0];
    float v107 = v55 + v_sroa_0_0_i_i_i;
    float v108 = v57 + v_sroa_3_0_i_i_i;
    float* v109 = &v8[v53];
    v109[0] = v107;
    float* v111 = &v109[1];
    v111[0] = v108;
    int v113 = i_03_i + v43;
    bool v114 = v113 < v42;
    if(v114) {
        i_03_i = v113;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    long v116 = i1_02_i;
    float* v117 = &v10[v116];
    float v_val_i_i_i_i = v117[0];
    int v118 = i1_02_i / v14;
    int v119 = v118 % v32;
    int v120 = v119 * v22;
    int v121 = v118 * v14;
    int v122 = i1_02_i - v121;
    int v123 = v122 / v16;
    int v124 = v123 % v34;
    int v125 = v124 * v24;
    int v126 = v125 + v120;
    int v127 = v123 * v16;
    int v128 = v122 - v127;
    int v129 = v128 / v18;
    int v130 = v129 % v38;
    int v131 = v130 * v26;
    int v132 = v126 + v131;
    int v133 = v129 * v18;
    int v134 = v128 - v133;
    int v135 = v134 % v40;
    int v136 = v132 + v135;
    long v137 = v136;
    float* v138 = &v28[v137];
    float v_val_i_i_i_i_i_i = v138[0];
    float v139 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v140 = &v8[v116];
    v140[0] = v139;
    int v142 = i1_02_i + v6;
    bool v143 = v142 < size;
    if(v143) {
        i1_02_i = v142;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_161* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i_i_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    global long*v10 = (global long*)v9;
    long v11 = v10[0];
    int v12 = (int)v11;
    long v13 = v11 >> 32;
    int v14 = (int)v13;
    global int* v15 = &memcopied_eval[0].f1.f1.f1.f0[2];
    int v16 = v15[0];
    global int* v17 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v18 = (global long*)v17;
    long v19 = v18[0];
    int v20 = (int)v19;
    long v21 = v19 >> 32;
    int v22 = (int)v21;
    global int* v23 = &memcopied_eval[0].f1.f1.f2.f0[2];
    int v24 = v23[0];
    global float** v25 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v26 = v25[0];
    global int* v27 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v28 = (global long*)v27;
    long v29 = v28[0];
    int v30 = (int)v29;
    long v31 = v29 >> 32;
    int v32 = (int)v31;
    global int* v33 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global float** v39 = &memcopied_eval[0].f1.f2.f0;
    float* v40 = v39[0];
    int v41 = size / 2;
    int v42 = v41 << 1;
    int v43 = v6 << 1;
    int v44 = v4 << 1;
    bool v45 = v44 < v42;
    if(v45) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v44;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v49 = v4 + v42;
    bool v50 = v49 < size;
    if(v50) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v49;
    goto label9;
    label5:;
    int v53 = i_03_i / v12;
    int v54 = v53 % v30;
    int v55 = v54 * v20;
    int v56 = v53 * v12;
    int v57 = i_03_i - v56;
    int v58 = v57 / v14;
    int v59 = v58 % v32;
    int v60 = v59 * v22;
    int v61 = v60 + v55;
    int v62 = v58 * v14;
    int v63 = v57 - v62;
    int v64 = v63 / v16;
    int v65 = v64 % v36;
    int v66 = v65 * v24;
    int v67 = v61 + v66;
    int v68 = v64 * v16;
    int v69 = v63 - v68;
    int v70 = v69 % v38;
    int v71 = v67 + v70;
    int v72 = v70 + 2;
    bool v73 = v72 > v38;
    long v74 = v71;
    float* v75 = &v26[v74];
    if(v73) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v77 = &v75[1];
        v_sroa_3_0_in_i_i_i = v77;
    goto label8;
    label7:;
    int v79 = i_03_i | 1;
    int v80 = v79 / v12;
    int v81 = v80 % v30;
    int v82 = v81 * v20;
    int v83 = v80 * v12;
    int v84 = v79 - v83;
    int v85 = v84 / v14;
    int v86 = v85 % v32;
    int v87 = v86 * v22;
    int v88 = v87 + v82;
    int v89 = v85 * v14;
    int v90 = v84 - v89;
    int v91 = v90 / v16;
    int v92 = v91 % v36;
    int v93 = v92 * v24;
    int v94 = v88 + v93;
    int v95 = v91 * v16;
    int v96 = v90 - v95;
    int v97 = v96 % v38;
    int v98 = v94 + v97;
    long v99 = v98;
    float* v100 = &v26[v99];
        v_sroa_3_0_in_i_i_i = v100;
    goto label8;
    label8:;
    float v_sroa_3_0_i_i_i = v_sroa_3_0_in_i_i_i[0];
    float v_sroa_0_0_i_i_i = v75[0];
    long v102 = i_03_i;
    float* v103 = &v40[v102];
    float v104 = v103[0];
    float* v105 = &v103[1];
    float v106 = v105[0];
    float v107 = v_sroa_0_0_i_i_i + v104;
    float v108 = v_sroa_3_0_i_i_i + v106;
    float* v109 = &v8[v102];
    v109[0] = v107;
    float* v111 = &v109[1];
    v111[0] = v108;
    int v113 = i_03_i + v43;
    bool v114 = v113 < v42;
    if(v114) {
        i_03_i = v113;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    int v116 = i1_02_i / v12;
    int v117 = v116 % v30;
    int v118 = v117 * v20;
    int v119 = v116 * v12;
    int v120 = i1_02_i - v119;
    int v121 = v120 / v14;
    int v122 = v121 % v32;
    int v123 = v122 * v22;
    int v124 = v123 + v118;
    int v125 = v121 * v14;
    int v126 = v120 - v125;
    int v127 = v126 / v16;
    int v128 = v127 % v36;
    int v129 = v128 * v24;
    int v130 = v124 + v129;
    int v131 = v127 * v16;
    int v132 = v126 - v131;
    int v133 = v132 % v38;
    int v134 = v130 + v133;
    long v135 = v134;
    float* v136 = &v26[v135];
    float v_val_i_i_i_i_i_i = v136[0];
    long v137 = i1_02_i;
    float* v138 = &v40[v137];
    float v_val_i_i_i_i = v138[0];
    float v139 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v140 = &v8[v137];
    v140[0] = v139;
    int v142 = i1_02_i + v6;
    bool v143 = v142 < size;
    if(v143) {
        i1_02_i = v142;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_163* memcopied_eval, int size) {
int i_03_i;
int i1_02_i;
    label0:;
    struct Eigen__TensorEvaluator_163 eval[1];
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    char*v7 = (char*)eval;
    global char*v9 = (global char*)memcopied_eval;
    #pragma unroll
    for(int __i=0; __i < 4; __i++) {
        (( int2 *)v7)[__i] = ((global int2 *)v9)[__i];
    }
    struct Eigen__TensorEvaluator_160* v11 = &eval[0].f1.f1;
    global struct Eigen__TensorEvaluator_160* v12 = &memcopied_eval[0].f1.f1;
    char*v13 = (char*)v11;
    global char*v14 = (global char*)v12;
    #pragma unroll
    for(int __i=0; __i < 20; __i++) {
        (( int2 *)v13)[__i] = ((global int2 *)v14)[__i];
    }
    int v16 = size / 2;
    int v17 = v16 << 1;
    int v18 = v6 << 1;
    int v19 = v4 << 1;
    bool v20 = v19 < v17;
    if(v20) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
    struct Eigen__TensorEvaluator_164* v22 = &eval[0].f1;
    float** v23 = &eval[0].f0.f0;
        i_03_i = v19;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v26 = v4 + v17;
    bool v27 = v26 < size;
    if(v27) {
        goto label4;
    } else {
        goto label8;
    }
    label4:;
    int* v29 = &eval[0].f1.f1.f1.f0[0];
    long*v30 = (long*)v29;
    long v31 = v30[0];
    int v32 = (int)v31;
    int* v33 = &eval[0].f1.f1.f3.f1.f0.f0[0];
    long*v34 = (long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    int* v37 = &eval[0].f1.f1.f2.f0[0];
    long*v38 = (long*)v37;
    long v39 = v38[0];
    int v40 = (int)v39;
    long v41 = v31 >> 32;
    int v42 = (int)v41;
    long v43 = v35 >> 32;
    int v44 = (int)v43;
    long v45 = v39 >> 32;
    int v46 = (int)v45;
    int* v47 = &eval[0].f1.f1.f1.f0[2];
    int v48 = v47[0];
    int* v49 = &eval[0].f1.f1.f3.f1.f0.f0[2];
    long*v50 = (long*)v49;
    long v51 = v50[0];
    int v52 = (int)v51;
    int* v53 = &eval[0].f1.f1.f2.f0[2];
    int v54 = v53[0];
    long v55 = v51 >> 32;
    int v56 = (int)v55;
    float** v57 = &eval[0].f1.f1.f3.f0;
    float* v58 = v57[0];
    int* v59 = &eval[0].f1.f2.f1.f0[0];
    long*v60 = (long*)v59;
    long v61 = v60[0];
    int v62 = (int)v61;
    int* v63 = &eval[0].f1.f2.f3.f1.f0.f0[0];
    long*v64 = (long*)v63;
    long v65 = v64[0];
    int v66 = (int)v65;
    int* v67 = &eval[0].f1.f2.f2.f0[0];
    long*v68 = (long*)v67;
    long v69 = v68[0];
    int v70 = (int)v69;
    long v71 = v61 >> 32;
    int v72 = (int)v71;
    long v73 = v65 >> 32;
    int v74 = (int)v73;
    long v75 = v69 >> 32;
    int v76 = (int)v75;
    int* v77 = &eval[0].f1.f2.f1.f0[2];
    int v78 = v77[0];
    int* v79 = &eval[0].f1.f2.f3.f1.f0.f0[2];
    long*v80 = (long*)v79;
    long v81 = v80[0];
    int v82 = (int)v81;
    int* v83 = &eval[0].f1.f2.f2.f0[2];
    int v84 = v83[0];
    long v85 = v81 >> 32;
    int v86 = (int)v85;
    float** v87 = &eval[0].f1.f2.f3.f0;
    float* v88 = v87[0];
    float** v89 = &eval[0].f0.f0;
    float* v90 = v89[0];
        i1_02_i = v26;
    goto label6;
    label5:;
    struct double2_124 v92 = _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(v22, i_03_i);
    float v93 = v92.f0;
    float v94 = v92.f1;
    float* v95 = v23[0];
    long v96 = i_03_i;
    float* v97 = &v95[v96];
    v97[0] = v93;
    float* v99 = &v97[1];
    v99[0] = v94;
    int v101 = i_03_i + v18;
    bool v102 = v101 < v17;
    if(v102) {
        i_03_i = v101;
        goto label5;
    } else {
        goto label2;
    }
    label6:;
    int v104 = i1_02_i / v32;
    int v105 = v104 % v36;
    int v106 = v105 * v40;
    int v107 = v104 * v32;
    int v108 = i1_02_i - v107;
    int v109 = v108 / v42;
    int v110 = v109 % v44;
    int v111 = v110 * v46;
    int v112 = v111 + v106;
    int v113 = v109 * v42;
    int v114 = v108 - v113;
    int v115 = v114 / v48;
    int v116 = v115 % v52;
    int v117 = v116 * v54;
    int v118 = v112 + v117;
    int v119 = v115 * v48;
    int v120 = v114 - v119;
    int v121 = v120 % v56;
    int v122 = v118 + v121;
    long v123 = v122;
    float* v124 = &v58[v123];
    float v_val_i_i_i_i_i_i = v124[0];
    int v125 = i1_02_i / v62;
    int v126 = v125 % v66;
    int v127 = v126 * v70;
    int v128 = v125 * v62;
    int v129 = i1_02_i - v128;
    int v130 = v129 / v72;
    int v131 = v130 % v74;
    int v132 = v131 * v76;
    int v133 = v132 + v127;
    int v134 = v130 * v72;
    int v135 = v129 - v134;
    int v136 = v135 / v78;
    int v137 = v136 % v82;
    int v138 = v137 * v84;
    int v139 = v133 + v138;
    int v140 = v136 * v78;
    int v141 = v135 - v140;
    int v142 = v141 % v86;
    int v143 = v139 + v142;
    long v144 = v143;
    float* v145 = &v88[v144];
    float v_val_i_i_i1_i_i_i = v145[0];
    float v146 = v_val_i_i_i_i_i_i + v_val_i_i_i1_i_i_i;
    long v147 = i1_02_i;
    float* v148 = &v90[v147];
    v148[0] = v146;
    int v150 = i1_02_i + v6;
    bool v151 = v150 < size;
    if(v151) {
        i1_02_i = v150;
        goto label6;
    } else {
        goto label7;
    }
    label7:;
        goto label8;
    label8:;
}

struct double2_124 _ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(global struct Eigen__TensorEvaluator_164* this, int index) {
float* v_sroa_3_0_in_i_i;
float* v_sroa_3_0_in_i_i1;
    label0:;
    global int* v0 = &this[0].f1.f1.f0[0];
    int v1 = v0[0];
    int v2 = index / v1;
    global int* v3 = &this[0].f1.f3.f1.f0.f0[0];
    int v4 = v3[0];
    int v5 = v2 % v4;
    global int* v6 = &this[0].f1.f2.f0[0];
    int v7 = v6[0];
    int v8 = v7 * v5;
    int v9 = v2 * v1;
    int v10 = index - v9;
    global int* v11 = &this[0].f1.f1.f0[1];
    int v12 = v11[0];
    int v13 = v10 / v12;
    global int* v14 = &this[0].f1.f3.f1.f0.f0[1];
    int v15 = v14[0];
    int v16 = v13 % v15;
    global int* v17 = &this[0].f1.f2.f0[1];
    int v18 = v17[0];
    int v19 = v18 * v16;
    int v20 = v19 + v8;
    int v21 = v13 * v12;
    int v22 = v10 - v21;
    global int* v23 = &this[0].f1.f1.f0[2];
    int v24 = v23[0];
    int v25 = v22 / v24;
    global int* v26 = &this[0].f1.f3.f1.f0.f0[2];
    int v27 = v26[0];
    int v28 = v25 % v27;
    global int* v29 = &this[0].f1.f2.f0[2];
    int v30 = v29[0];
    int v31 = v30 * v28;
    int v32 = v20 + v31;
    int v33 = v25 * v24;
    int v34 = v22 - v33;
    global int* v35 = &this[0].f1.f3.f1.f0.f0[3];
    int v36 = v35[0];
    int v37 = v34 % v36;
    int v38 = v32 + v37;
    int v39 = v37 + 2;
    bool v40 = v39 > v36;
    global float** v41 = &this[0].f1.f3.f0;
    float* v42 = v41[0];
    long v43 = v38;
    float* v44 = &v42[v43];
    if(v40) {
        goto label2;
    } else {
        goto label1;
    }
    label1:;
    float* v46 = &v44[1];
        v_sroa_3_0_in_i_i = v46;
    goto label3;
    label2:;
    int v48 = index + 1;
    int v49 = v48 / v1;
    int v50 = v49 % v4;
    int v51 = v50 * v7;
    int v52 = v49 * v1;
    int v53 = v48 - v52;
    int v54 = v53 / v12;
    int v55 = v54 % v15;
    int v56 = v55 * v18;
    int v57 = v56 + v51;
    int v58 = v54 * v12;
    int v59 = v53 - v58;
    int v60 = v59 / v24;
    int v61 = v60 % v27;
    int v62 = v61 * v30;
    int v63 = v57 + v62;
    int v64 = v60 * v24;
    int v65 = v59 - v64;
    int v66 = v65 % v36;
    int v67 = v63 + v66;
    long v68 = v67;
    float* v69 = &v42[v68];
        v_sroa_3_0_in_i_i = v69;
    goto label3;
    label3:;
    float v_sroa_3_0_i_i = v_sroa_3_0_in_i_i[0];
    float v_sroa_0_0_i_i = v44[0];
    global int* v71 = &this[0].f2.f1.f0[0];
    int v72 = v71[0];
    int v73 = index / v72;
    global int* v74 = &this[0].f2.f3.f1.f0.f0[0];
    int v75 = v74[0];
    int v76 = v73 % v75;
    global int* v77 = &this[0].f2.f2.f0[0];
    int v78 = v77[0];
    int v79 = v78 * v76;
    int v80 = v73 * v72;
    int v81 = index - v80;
    global int* v82 = &this[0].f2.f1.f0[1];
    int v83 = v82[0];
    int v84 = v81 / v83;
    global int* v85 = &this[0].f2.f3.f1.f0.f0[1];
    int v86 = v85[0];
    int v87 = v84 % v86;
    global int* v88 = &this[0].f2.f2.f0[1];
    int v89 = v88[0];
    int v90 = v89 * v87;
    int v91 = v90 + v79;
    int v92 = v84 * v83;
    int v93 = v81 - v92;
    global int* v94 = &this[0].f2.f1.f0[2];
    int v95 = v94[0];
    int v96 = v93 / v95;
    global int* v97 = &this[0].f2.f3.f1.f0.f0[2];
    int v98 = v97[0];
    int v99 = v96 % v98;
    global int* v100 = &this[0].f2.f2.f0[2];
    int v101 = v100[0];
    int v102 = v101 * v99;
    int v103 = v91 + v102;
    int v104 = v96 * v95;
    int v105 = v93 - v104;
    global int* v106 = &this[0].f2.f3.f1.f0.f0[3];
    int v107 = v106[0];
    int v108 = v105 % v107;
    int v109 = v103 + v108;
    int v110 = v108 + 2;
    bool v111 = v110 > v107;
    global float** v112 = &this[0].f2.f3.f0;
    float* v113 = v112[0];
    long v114 = v109;
    float* v115 = &v113[v114];
    if(v111) {
        goto label5;
    } else {
        goto label4;
    }
    label4:;
    float* v117 = &v115[1];
        v_sroa_3_0_in_i_i1 = v117;
    goto label6;
    label5:;
    int v119 = index + 1;
    int v120 = v119 / v72;
    int v121 = v120 % v75;
    int v122 = v121 * v78;
    int v123 = v120 * v72;
    int v124 = v119 - v123;
    int v125 = v124 / v83;
    int v126 = v125 % v86;
    int v127 = v126 * v89;
    int v128 = v127 + v122;
    int v129 = v125 * v83;
    int v130 = v124 - v129;
    int v131 = v130 / v95;
    int v132 = v131 % v98;
    int v133 = v132 * v101;
    int v134 = v128 + v133;
    int v135 = v131 * v95;
    int v136 = v130 - v135;
    int v137 = v136 % v107;
    int v138 = v134 + v137;
    long v139 = v138;
    float* v140 = &v113[v139];
        v_sroa_3_0_in_i_i1 = v140;
    goto label6;
    label6:;
    float v_sroa_3_0_i_i2 = v_sroa_3_0_in_i_i1[0];
    float v_sroa_0_0_i_i3 = v115[0];
    float v142 = v_sroa_0_0_i_i + v_sroa_0_0_i_i3;
    float v143 = v_sroa_3_0_i_i + v_sroa_3_0_i_i2;
    struct double2_124 oldret_i_i;
    oldret_i_i.f0 = v142;
    oldret_i_i.f1 = v143;
    struct double2_124 oldret2_i_i = oldret_i_i;
    return oldret2_i_i;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_165* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global float** v9 = &memcopied_eval[0].f1.f1.f0;
    float* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f1.f0[1];
    global long*v14 = (global long*)v13;
    long v15 = v14[0];
    int v16 = (int)v15;
    long v17 = v15 >> 32;
    int v18 = (int)v17;
    global int* v19 = &memcopied_eval[0].f1.f2.f1.f0[3];
    int v20 = v19[0];
    global int* v21 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v22 = (global long*)v21;
    long v23 = v22[0];
    int v24 = (int)v23;
    long v25 = v23 >> 32;
    int v26 = (int)v25;
    global int* v27 = &memcopied_eval[0].f1.f2.f2.f0[2];
    global long*v28 = (global long*)v27;
    long v29 = v28[0];
    int v30 = (int)v29;
    long v31 = v29 >> 32;
    int v32 = (int)v31;
    global float** v33 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v34 = v33[0];
    global int* v35 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v36 = (global long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    long v39 = v37 >> 32;
    int v40 = (int)v39;
    global int* v41 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    global long*v42 = (global long*)v41;
    long v43 = v42[0];
    int v44 = (int)v43;
    long v45 = v43 >> 32;
    int v46 = (int)v45;
    global int* v47 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[4];
    int v48 = v47[0];
    int v49 = size / 2;
    int v50 = v49 << 1;
    int v51 = v6 << 1;
    int v52 = v4 << 1;
    bool v53 = v52 < v50;
    if(v53) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v52;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v57 = v4 + v50;
    bool v58 = v57 < size;
    if(v58) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v57;
    goto label9;
    label5:;
    long v61 = i_03_i;
    float* v62 = &v10[v61];
    float v63 = v62[0];
    float* v64 = &v62[1];
    float v65 = v64[0];
    int v66 = i_03_i / v12;
    int v67 = v66 % v38;
    int v68 = v67 * v24;
    int v69 = v66 * v12;
    int v70 = i_03_i - v69;
    int v71 = v70 / v16;
    int v72 = v71 % v40;
    int v73 = v72 * v26;
    int v74 = v73 + v68;
    int v75 = v71 * v16;
    int v76 = v70 - v75;
    int v77 = v76 / v18;
    int v78 = v77 % v44;
    int v79 = v78 * v30;
    int v80 = v74 + v79;
    int v81 = v77 * v18;
    int v82 = v76 - v81;
    int v83 = v82 / v20;
    int v84 = v83 % v46;
    int v85 = v84 * v32;
    int v86 = v80 + v85;
    int v87 = v83 * v20;
    int v88 = v82 - v87;
    int v89 = v88 % v48;
    int v90 = v86 + v89;
    int v91 = v89 + 2;
    bool v92 = v91 > v48;
    long v93 = v90;
    float* v94 = &v34[v93];
    if(v92) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v96 = &v94[1];
        v_sroa_3_0_in_i = v96;
    goto label8;
    label7:;
    int v98 = i_03_i | 1;
    int v99 = v98 / v12;
    int v100 = v99 % v38;
    int v101 = v100 * v24;
    int v102 = v99 * v12;
    int v103 = v98 - v102;
    int v104 = v103 / v16;
    int v105 = v104 % v40;
    int v106 = v105 * v26;
    int v107 = v106 + v101;
    int v108 = v104 * v16;
    int v109 = v103 - v108;
    int v110 = v109 / v18;
    int v111 = v110 % v44;
    int v112 = v111 * v30;
    int v113 = v107 + v112;
    int v114 = v110 * v18;
    int v115 = v109 - v114;
    int v116 = v115 / v20;
    int v117 = v116 % v46;
    int v118 = v117 * v32;
    int v119 = v113 + v118;
    int v120 = v116 * v20;
    int v121 = v115 - v120;
    int v122 = v121 % v48;
    int v123 = v119 + v122;
    long v124 = v123;
    float* v125 = &v34[v124];
        v_sroa_3_0_in_i = v125;
    goto label8;
    label8:;
    float v_sroa_3_0_i = v_sroa_3_0_in_i[0];
    float v_sroa_0_0_i = v94[0];
    float v127 = v63 + v_sroa_0_0_i;
    float v128 = v65 + v_sroa_3_0_i;
    float* v129 = &v8[v61];
    v129[0] = v127;
    float* v131 = &v129[1];
    v131[0] = v128;
    int v133 = i_03_i + v51;
    bool v134 = v133 < v50;
    if(v134) {
        i_03_i = v133;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    long v136 = i1_02_i;
    float* v137 = &v10[v136];
    float v_val_i_i_i_i = v137[0];
    int v138 = i1_02_i / v12;
    int v139 = v138 % v38;
    int v140 = v139 * v24;
    int v141 = v138 * v12;
    int v142 = i1_02_i - v141;
    int v143 = v142 / v16;
    int v144 = v143 % v40;
    int v145 = v144 * v26;
    int v146 = v145 + v140;
    int v147 = v143 * v16;
    int v148 = v142 - v147;
    int v149 = v148 / v18;
    int v150 = v149 % v44;
    int v151 = v150 * v30;
    int v152 = v146 + v151;
    int v153 = v149 * v18;
    int v154 = v148 - v153;
    int v155 = v154 / v20;
    int v156 = v155 % v46;
    int v157 = v156 * v32;
    int v158 = v152 + v157;
    int v159 = v155 * v20;
    int v160 = v154 - v159;
    int v161 = v160 % v48;
    int v162 = v158 + v161;
    long v163 = v162;
    float* v164 = &v34[v163];
    float v_val_i_i_i_i_i_i = v164[0];
    float v165 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    float* v166 = &v8[v136];
    v166[0] = v165;
    int v168 = i1_02_i + v6;
    bool v169 = v168 < size;
    if(v169) {
        i1_02_i = v168;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_170* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f1.f0[1];
    global long*v12 = (global long*)v11;
    long v13 = v12[0];
    int v14 = (int)v13;
    long v15 = v13 >> 32;
    int v16 = (int)v15;
    global int* v17 = &memcopied_eval[0].f1.f1.f1.f0[3];
    int v18 = v17[0];
    global int* v19 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v20 = (global long*)v19;
    long v21 = v20[0];
    int v22 = (int)v21;
    long v23 = v21 >> 32;
    int v24 = (int)v23;
    global int* v25 = &memcopied_eval[0].f1.f1.f2.f0[2];
    global long*v26 = (global long*)v25;
    long v27 = v26[0];
    int v28 = (int)v27;
    long v29 = v27 >> 32;
    int v30 = (int)v29;
    global float** v31 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v32 = v31[0];
    global int* v33 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global int* v39 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    global long*v40 = (global long*)v39;
    long v41 = v40[0];
    int v42 = (int)v41;
    long v43 = v41 >> 32;
    int v44 = (int)v43;
    global int* v45 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[4];
    int v46 = v45[0];
    global float** v47 = &memcopied_eval[0].f1.f2.f0;
    float* v48 = v47[0];
    int v49 = size / 2;
    int v50 = v49 << 1;
    int v51 = v6 << 1;
    int v52 = v4 << 1;
    bool v53 = v52 < v50;
    if(v53) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v52;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v57 = v4 + v50;
    bool v58 = v57 < size;
    if(v58) {
        goto label4;
    } else {
        goto label11;
    }
    label4:;
        i1_02_i = v57;
    goto label9;
    label5:;
    int v61 = i_03_i / v10;
    int v62 = v61 % v36;
    int v63 = v62 * v22;
    int v64 = v61 * v10;
    int v65 = i_03_i - v64;
    int v66 = v65 / v14;
    int v67 = v66 % v38;
    int v68 = v67 * v24;
    int v69 = v68 + v63;
    int v70 = v66 * v14;
    int v71 = v65 - v70;
    int v72 = v71 / v16;
    int v73 = v72 % v42;
    int v74 = v73 * v28;
    int v75 = v69 + v74;
    int v76 = v72 * v16;
    int v77 = v71 - v76;
    int v78 = v77 / v18;
    int v79 = v78 % v44;
    int v80 = v79 * v30;
    int v81 = v75 + v80;
    int v82 = v78 * v18;
    int v83 = v77 - v82;
    int v84 = v83 % v46;
    int v85 = v81 + v84;
    int v86 = v84 + 2;
    bool v87 = v86 > v46;
    long v88 = v85;
    float* v89 = &v32[v88];
    if(v87) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v91 = &v89[1];
        v_sroa_3_0_in_i = v91;
    goto label8;
    label7:;
    int v93 = i_03_i | 1;
    int v94 = v93 / v10;
    int v95 = v94 % v36;
    int v96 = v95 * v22;
    int v97 = v94 * v10;
    int v98 = v93 - v97;
    int v99 = v98 / v14;
    int v100 = v99 % v38;
    int v101 = v100 * v24;
    int v102 = v101 + v96;
    int v103 = v99 * v14;
    int v104 = v98 - v103;
    int v105 = v104 / v16;
    int v106 = v105 % v42;
    int v107 = v106 * v28;
    int v108 = v102 + v107;
    int v109 = v105 * v16;
    int v110 = v104 - v109;
    int v111 = v110 / v18;
    int v112 = v111 % v44;
    int v113 = v112 * v30;
    int v114 = v108 + v113;
    int v115 = v111 * v18;
    int v116 = v110 - v115;
    int v117 = v116 % v46;
    int v118 = v114 + v117;
    long v119 = v118;
    float* v120 = &v32[v119];
        v_sroa_3_0_in_i = v120;
    goto label8;
    label8:;
    float v_sroa_3_0_i = v_sroa_3_0_in_i[0];
    float v_sroa_0_0_i = v89[0];
    long v122 = i_03_i;
    float* v123 = &v48[v122];
    float v124 = v123[0];
    float* v125 = &v123[1];
    float v126 = v125[0];
    float v127 = v_sroa_0_0_i + v124;
    float v128 = v_sroa_3_0_i + v126;
    float* v129 = &v8[v122];
    v129[0] = v127;
    float* v131 = &v129[1];
    v131[0] = v128;
    int v133 = i_03_i + v51;
    bool v134 = v133 < v50;
    if(v134) {
        i_03_i = v133;
        goto label5;
    } else {
        goto label2;
    }
    label9:;
    int v136 = i1_02_i / v10;
    int v137 = v136 % v36;
    int v138 = v137 * v22;
    int v139 = v136 * v10;
    int v140 = i1_02_i - v139;
    int v141 = v140 / v14;
    int v142 = v141 % v38;
    int v143 = v142 * v24;
    int v144 = v143 + v138;
    int v145 = v141 * v14;
    int v146 = v140 - v145;
    int v147 = v146 / v16;
    int v148 = v147 % v42;
    int v149 = v148 * v28;
    int v150 = v144 + v149;
    int v151 = v147 * v16;
    int v152 = v146 - v151;
    int v153 = v152 / v18;
    int v154 = v153 % v44;
    int v155 = v154 * v30;
    int v156 = v150 + v155;
    int v157 = v153 * v18;
    int v158 = v152 - v157;
    int v159 = v158 % v46;
    int v160 = v156 + v159;
    long v161 = v160;
    float* v162 = &v32[v161];
    float v_val_i_i_i_i_i_i = v162[0];
    long v163 = i1_02_i;
    float* v164 = &v48[v163];
    float v_val_i_i_i_i = v164[0];
    float v165 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    float* v166 = &v8[v163];
    v166[0] = v165;
    int v168 = i1_02_i + v6;
    bool v169 = v168 < size;
    if(v169) {
        i1_02_i = v168;
        goto label9;
    } else {
        goto label10;
    }
    label10:;
        goto label11;
    label11:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_172* memcopied_eval, int size) {
int i_03_i;
float* v_sroa_3_0_in_i1;
float* v_sroa_3_0_in_i;
int i1_02_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global float** v7 = &memcopied_eval[0].f0.f0;
    float* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f1.f0[1];
    global long*v12 = (global long*)v11;
    long v13 = v12[0];
    int v14 = (int)v13;
    long v15 = v13 >> 32;
    int v16 = (int)v15;
    global int* v17 = &memcopied_eval[0].f1.f1.f1.f0[3];
    int v18 = v17[0];
    global int* v19 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v20 = (global long*)v19;
    long v21 = v20[0];
    int v22 = (int)v21;
    long v23 = v21 >> 32;
    int v24 = (int)v23;
    global int* v25 = &memcopied_eval[0].f1.f1.f2.f0[2];
    global long*v26 = (global long*)v25;
    long v27 = v26[0];
    int v28 = (int)v27;
    long v29 = v27 >> 32;
    int v30 = (int)v29;
    global float** v31 = &memcopied_eval[0].f1.f1.f3.f0;
    float* v32 = v31[0];
    global int* v33 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global int* v39 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    global long*v40 = (global long*)v39;
    long v41 = v40[0];
    int v42 = (int)v41;
    long v43 = v41 >> 32;
    int v44 = (int)v43;
    global int* v45 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[4];
    int v46 = v45[0];
    global int* v47 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v48 = v47[0];
    global int* v49 = &memcopied_eval[0].f1.f2.f1.f0[1];
    global long*v50 = (global long*)v49;
    long v51 = v50[0];
    int v52 = (int)v51;
    long v53 = v51 >> 32;
    int v54 = (int)v53;
    global int* v55 = &memcopied_eval[0].f1.f2.f1.f0[3];
    int v56 = v55[0];
    global int* v57 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v58 = (global long*)v57;
    long v59 = v58[0];
    int v60 = (int)v59;
    long v61 = v59 >> 32;
    int v62 = (int)v61;
    global int* v63 = &memcopied_eval[0].f1.f2.f2.f0[2];
    global long*v64 = (global long*)v63;
    long v65 = v64[0];
    int v66 = (int)v65;
    long v67 = v65 >> 32;
    int v68 = (int)v67;
    global float** v69 = &memcopied_eval[0].f1.f2.f3.f0;
    float* v70 = v69[0];
    global int* v71 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v72 = (global long*)v71;
    long v73 = v72[0];
    int v74 = (int)v73;
    long v75 = v73 >> 32;
    int v76 = (int)v75;
    global int* v77 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    global long*v78 = (global long*)v77;
    long v79 = v78[0];
    int v80 = (int)v79;
    long v81 = v79 >> 32;
    int v82 = (int)v81;
    global int* v83 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[4];
    int v84 = v83[0];
    int v85 = size / 2;
    int v86 = v85 << 1;
    int v87 = v6 << 1;
    int v88 = v4 << 1;
    bool v89 = v88 < v86;
    if(v89) {
        goto label1;
    } else {
        goto label3;
    }
    label1:;
        i_03_i = v88;
    goto label5;
    label2:;
        goto label3;
    label3:;
    int v93 = v4 + v86;
    bool v94 = v93 < size;
    if(v94) {
        goto label4;
    } else {
        goto label14;
    }
    label4:;
        i1_02_i = v93;
    goto label12;
    label5:;
    int v97 = i_03_i / v10;
    int v98 = v97 % v36;
    int v99 = v98 * v22;
    int v100 = v97 * v10;
    int v101 = i_03_i - v100;
    int v102 = v101 / v14;
    int v103 = v102 % v38;
    int v104 = v103 * v24;
    int v105 = v104 + v99;
    int v106 = v102 * v14;
    int v107 = v101 - v106;
    int v108 = v107 / v16;
    int v109 = v108 % v42;
    int v110 = v109 * v28;
    int v111 = v105 + v110;
    int v112 = v108 * v16;
    int v113 = v107 - v112;
    int v114 = v113 / v18;
    int v115 = v114 % v44;
    int v116 = v115 * v30;
    int v117 = v111 + v116;
    int v118 = v114 * v18;
    int v119 = v113 - v118;
    int v120 = v119 % v46;
    int v121 = v117 + v120;
    int v122 = v120 + 2;
    bool v123 = v122 > v46;
    long v124 = v121;
    float* v125 = &v32[v124];
    if(v123) {
        goto label7;
    } else {
        goto label6;
    }
    label6:;
    float* v127 = &v125[1];
        v_sroa_3_0_in_i1 = v127;
    goto label8;
    label7:;
    int v129 = i_03_i | 1;
    int v130 = v129 / v10;
    int v131 = v130 % v36;
    int v132 = v131 * v22;
    int v133 = v130 * v10;
    int v134 = v129 - v133;
    int v135 = v134 / v14;
    int v136 = v135 % v38;
    int v137 = v136 * v24;
    int v138 = v137 + v132;
    int v139 = v135 * v14;
    int v140 = v134 - v139;
    int v141 = v140 / v16;
    int v142 = v141 % v42;
    int v143 = v142 * v28;
    int v144 = v138 + v143;
    int v145 = v141 * v16;
    int v146 = v140 - v145;
    int v147 = v146 / v18;
    int v148 = v147 % v44;
    int v149 = v148 * v30;
    int v150 = v144 + v149;
    int v151 = v147 * v18;
    int v152 = v146 - v151;
    int v153 = v152 % v46;
    int v154 = v150 + v153;
    long v155 = v154;
    float* v156 = &v32[v155];
        v_sroa_3_0_in_i1 = v156;
    goto label8;
    label8:;
    float v_sroa_3_0_i2 = v_sroa_3_0_in_i1[0];
    float v_sroa_0_0_i3 = v125[0];
    int v158 = i_03_i / v48;
    int v159 = v158 % v74;
    int v160 = v159 * v60;
    int v161 = v158 * v48;
    int v162 = i_03_i - v161;
    int v163 = v162 / v52;
    int v164 = v163 % v76;
    int v165 = v164 * v62;
    int v166 = v165 + v160;
    int v167 = v163 * v52;
    int v168 = v162 - v167;
    int v169 = v168 / v54;
    int v170 = v169 % v80;
    int v171 = v170 * v66;
    int v172 = v166 + v171;
    int v173 = v169 * v54;
    int v174 = v168 - v173;
    int v175 = v174 / v56;
    int v176 = v175 % v82;
    int v177 = v176 * v68;
    int v178 = v172 + v177;
    int v179 = v175 * v56;
    int v180 = v174 - v179;
    int v181 = v180 % v84;
    int v182 = v178 + v181;
    int v183 = v181 + 2;
    bool v184 = v183 > v84;
    long v185 = v182;
    float* v186 = &v70[v185];
    if(v184) {
        goto label10;
    } else {
        goto label9;
    }
    label9:;
    float* v188 = &v186[1];
        v_sroa_3_0_in_i = v188;
    goto label11;
    label10:;
    int v190 = i_03_i | 1;
    int v191 = v190 / v48;
    int v192 = v191 % v74;
    int v193 = v192 * v60;
    int v194 = v191 * v48;
    int v195 = v190 - v194;
    int v196 = v195 / v52;
    int v197 = v196 % v76;
    int v198 = v197 * v62;
    int v199 = v198 + v193;
    int v200 = v196 * v52;
    int v201 = v195 - v200;
    int v202 = v201 / v54;
    int v203 = v202 % v80;
    int v204 = v203 * v66;
    int v205 = v199 + v204;
    int v206 = v202 * v54;
    int v207 = v201 - v206;
    int v208 = v207 / v56;
    int v209 = v208 % v82;
    int v210 = v209 * v68;
    int v211 = v205 + v210;
    int v212 = v208 * v56;
    int v213 = v207 - v212;
    int v214 = v213 % v84;
    int v215 = v211 + v214;
    long v216 = v215;
    float* v217 = &v70[v216];
        v_sroa_3_0_in_i = v217;
    goto label11;
    label11:;
    float v_sroa_3_0_i = v_sroa_3_0_in_i[0];
    float v_sroa_0_0_i = v186[0];
    float v219 = v_sroa_0_0_i3 + v_sroa_0_0_i;
    float v220 = v_sroa_3_0_i2 + v_sroa_3_0_i;
    long v221 = i_03_i;
    float* v222 = &v8[v221];
    v222[0] = v219;
    float* v224 = &v222[1];
    v224[0] = v220;
    int v226 = i_03_i + v87;
    bool v227 = v226 < v86;
    if(v227) {
        i_03_i = v226;
        goto label5;
    } else {
        goto label2;
    }
    label12:;
    int v229 = i1_02_i / v10;
    int v230 = v229 % v36;
    int v231 = v230 * v22;
    int v232 = v229 * v10;
    int v233 = i1_02_i - v232;
    int v234 = v233 / v14;
    int v235 = v234 % v38;
    int v236 = v235 * v24;
    int v237 = v236 + v231;
    int v238 = v234 * v14;
    int v239 = v233 - v238;
    int v240 = v239 / v16;
    int v241 = v240 % v42;
    int v242 = v241 * v28;
    int v243 = v237 + v242;
    int v244 = v240 * v16;
    int v245 = v239 - v244;
    int v246 = v245 / v18;
    int v247 = v246 % v44;
    int v248 = v247 * v30;
    int v249 = v243 + v248;
    int v250 = v246 * v18;
    int v251 = v245 - v250;
    int v252 = v251 % v46;
    int v253 = v249 + v252;
    long v254 = v253;
    float* v255 = &v32[v254];
    float v_val_i_i_i_i = v255[0];
    int v256 = i1_02_i / v48;
    int v257 = v256 % v74;
    int v258 = v257 * v60;
    int v259 = v256 * v48;
    int v260 = i1_02_i - v259;
    int v261 = v260 / v52;
    int v262 = v261 % v76;
    int v263 = v262 * v62;
    int v264 = v263 + v258;
    int v265 = v261 * v52;
    int v266 = v260 - v265;
    int v267 = v266 / v54;
    int v268 = v267 % v80;
    int v269 = v268 * v66;
    int v270 = v264 + v269;
    int v271 = v267 * v54;
    int v272 = v266 - v271;
    int v273 = v272 / v56;
    int v274 = v273 % v82;
    int v275 = v274 * v68;
    int v276 = v270 + v275;
    int v277 = v273 * v56;
    int v278 = v272 - v277;
    int v279 = v278 % v84;
    int v280 = v276 + v279;
    long v281 = v280;
    float* v282 = &v70[v281];
    float v_val_i_i_i1_i = v282[0];
    float v283 = v_val_i_i_i_i + v_val_i_i_i1_i;
    long v284 = i1_02_i;
    float* v285 = &v8[v284];
    v285[0] = v283;
    int v287 = i1_02_i + v6;
    bool v288 = v287 < size;
    if(v288) {
        i1_02_i = v287;
        goto label12;
    } else {
        goto label13;
    }
    label13:;
        goto label14;
    label14:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(global struct Eigen__TensorEvaluator_174* memcopied_eval, long size) {
long i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    long v5 = v4;
    int v6 = get_num_groups(0);
    int v7 = v6 * v1;
    long v8 = v7;
    global long** v9 = &memcopied_eval[0].f0.f0;
    long* v10 = v9[0];
    global long** v11 = &memcopied_eval[0].f1.f1.f0;
    long* v12 = v11[0];
    global long** v13 = &memcopied_eval[0].f1.f2.f0;
    long* v14 = v13[0];
    bool v15 = v5 < size;
    if(v15) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v5;
    goto label2;
    label2:;
    long sext_i_i_i = i_01_i << 32;
    long v18 = sext_i_i_i >> 32;
    long* v19 = &v12[v18];
    long v_val_i_i_i_i = v19[0];
    long* v20 = &v14[i_01_i];
    long v_val_i1_i_i_i = v20[0];
    long v21 = v_val_i1_i_i_i + v_val_i_i_i_i;
    long* v22 = &v10[v18];
    v22[0] = v21;
    long v24 = i_01_i + v8;
    bool v25 = v24 < size;
    if(v25) {
        i_01_i = v24;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_181* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f0;
    long* v10 = v9[0];
    bool v11 = v4 < size;
    if(v11) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    global long** v13 = &memcopied_eval[0].f1.f0.f0;
    long* v14 = v13[0];
        i_01_i = v4;
    goto label2;
    label2:;
    long v16 = i_01_i;
    long* v17 = &v10[v16];
    long v_val_i_i_i_i = v17[0];
    long v18 = v14[0];
    long v19 = v18 + v_val_i_i_i_i;
    long* v20 = &v8[v16];
    v20[0] = v19;
    int v22 = i_01_i + v6;
    bool v23 = v22 < size;
    if(v23) {
        i_01_i = v22;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_184* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f0;
    long* v10 = v9[0];
    bool v11 = v4 < size;
    if(v11) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
    global long** v13 = &memcopied_eval[0].f1.f0.f0;
    long* v14 = v13[0];
        i_01_i = v4;
    goto label2;
    label2:;
    long v16 = i_01_i;
    long* v17 = &v10[v16];
    long v_val_i_i_i_i = v17[0];
    long v18 = v14[0];
    long v19 = v18 + v_val_i_i_i_i;
    long* v20 = &v8[v16];
    v20[0] = v19;
    int v22 = i_01_i + v6;
    bool v23 = v22 < size;
    if(v23) {
        i_01_i = v22;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_187* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f0;
    long* v10 = v9[0];
    global long** v11 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    int v14 = v13[0];
    bool v15 = v4 < size;
    if(v15) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    long v18 = i_01_i;
    long* v19 = &v10[v18];
    long v_val_i_i_i_i = v19[0];
    int v20 = i_01_i % v14;
    long v21 = v20;
    long* v22 = &v12[v21];
    long v_val_i_i_i_i_i_i = v22[0];
    long v23 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    long* v24 = &v8[v18];
    v24[0] = v23;
    int v26 = i_01_i + v6;
    bool v27 = v26 < size;
    if(v27) {
        i_01_i = v26;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_190* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    int v12 = v11[0];
    global long** v13 = &memcopied_eval[0].f1.f2.f0;
    long* v14 = v13[0];
    bool v15 = v4 < size;
    if(v15) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v18 = i_01_i % v12;
    long v19 = v18;
    long* v20 = &v10[v19];
    long v_val_i_i_i_i_i_i = v20[0];
    long v21 = i_01_i;
    long* v22 = &v14[v21];
    long v_val_i_i_i_i = v22[0];
    long v23 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    long* v24 = &v8[v21];
    v24[0] = v23;
    int v26 = i_01_i + v6;
    bool v27 = v26 < size;
    if(v27) {
        i_01_i = v26;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_192* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    int v12 = v11[0];
    global long** v13 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    int v16 = v15[0];
    bool v17 = v4 < size;
    if(v17) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v20 = i_01_i % v12;
    long v21 = v20;
    long* v22 = &v10[v21];
    long v_val_i_i_i_i_i_i = v22[0];
    int v23 = i_01_i % v16;
    long v24 = v23;
    long* v25 = &v14[v24];
    long v_val_i_i_i1_i_i_i = v25[0];
    long v26 = v_val_i_i_i1_i_i_i + v_val_i_i_i_i_i_i;
    long v27 = i_01_i;
    long* v28 = &v8[v27];
    v28[0] = v26;
    int v30 = i_01_i + v6;
    bool v31 = v30 < size;
    if(v31) {
        i_01_i = v30;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_194* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f0;
    long* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f2.f0[0];
    int v14 = v13[0];
    global long** v15 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v16 = v15[0];
    global int* v17 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v18 = (global long*)v17;
    long v19 = v18[0];
    int v20 = (int)v19;
    long v21 = v19 >> 32;
    int v22 = (int)v21;
    bool v23 = v4 < size;
    if(v23) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    long v26 = i_01_i;
    long* v27 = &v10[v26];
    long v_val_i_i_i_i = v27[0];
    int v28 = i_01_i / v12;
    int v29 = v28 % v20;
    int v30 = v29 * v14;
    int v31 = v28 * v12;
    int v32 = i_01_i - v31;
    int v33 = v32 % v22;
    int v34 = v33 + v30;
    long v35 = v34;
    long* v36 = &v16[v35];
    long v_val_i_i_i_i_i_i = v36[0];
    long v37 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    long* v38 = &v8[v26];
    v38[0] = v37;
    int v40 = i_01_i + v6;
    bool v41 = v40 < size;
    if(v41) {
        i_01_i = v40;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_199* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f2.f0[0];
    int v12 = v11[0];
    global long** v13 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v16 = (global long*)v15;
    long v17 = v16[0];
    int v18 = (int)v17;
    long v19 = v17 >> 32;
    int v20 = (int)v19;
    global long** v21 = &memcopied_eval[0].f1.f2.f0;
    long* v22 = v21[0];
    bool v23 = v4 < size;
    if(v23) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v26 = i_01_i / v10;
    int v27 = v26 % v18;
    int v28 = v27 * v12;
    int v29 = v26 * v10;
    int v30 = i_01_i - v29;
    int v31 = v30 % v20;
    int v32 = v31 + v28;
    long v33 = v32;
    long* v34 = &v14[v33];
    long v_val_i_i_i_i_i_i = v34[0];
    long v35 = i_01_i;
    long* v36 = &v22[v35];
    long v_val_i_i_i_i = v36[0];
    long v37 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    long* v38 = &v8[v35];
    v38[0] = v37;
    int v40 = i_01_i + v6;
    bool v41 = v40 < size;
    if(v41) {
        i_01_i = v40;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_201* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f2.f0[0];
    int v12 = v11[0];
    global long** v13 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v16 = (global long*)v15;
    long v17 = v16[0];
    int v18 = (int)v17;
    long v19 = v17 >> 32;
    int v20 = (int)v19;
    global int* v21 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v22 = v21[0];
    global int* v23 = &memcopied_eval[0].f1.f2.f2.f0[0];
    int v24 = v23[0];
    global long** v25 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v26 = v25[0];
    global int* v27 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v28 = (global long*)v27;
    long v29 = v28[0];
    int v30 = (int)v29;
    long v31 = v29 >> 32;
    int v32 = (int)v31;
    bool v33 = v4 < size;
    if(v33) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v36 = i_01_i / v10;
    int v37 = v36 % v18;
    int v38 = v37 * v12;
    int v39 = v36 * v10;
    int v40 = i_01_i - v39;
    int v41 = v40 % v20;
    int v42 = v41 + v38;
    long v43 = v42;
    long* v44 = &v14[v43];
    long v_val_i_i_i_i_i_i = v44[0];
    int v45 = i_01_i / v22;
    int v46 = v45 % v30;
    int v47 = v46 * v24;
    int v48 = v45 * v22;
    int v49 = i_01_i - v48;
    int v50 = v49 % v32;
    int v51 = v50 + v47;
    long v52 = v51;
    long* v53 = &v26[v52];
    long v_val_i_i_i1_i_i_i = v53[0];
    long v54 = v_val_i_i_i1_i_i_i + v_val_i_i_i_i_i_i;
    long v55 = i_01_i;
    long* v56 = &v8[v55];
    v56[0] = v54;
    int v58 = i_01_i + v6;
    bool v59 = v58 < size;
    if(v59) {
        i_01_i = v58;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_203* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f0;
    long* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f1.f0[1];
    int v14 = v13[0];
    global int* v15 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v16 = (global long*)v15;
    long v17 = v16[0];
    int v18 = (int)v17;
    long v19 = v17 >> 32;
    int v20 = (int)v19;
    global long** v21 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v22 = v21[0];
    global int* v23 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v24 = (global long*)v23;
    long v25 = v24[0];
    int v26 = (int)v25;
    long v27 = v25 >> 32;
    int v28 = (int)v27;
    global int* v29 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    int v30 = v29[0];
    bool v31 = v4 < size;
    if(v31) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    long v34 = i_01_i;
    long* v35 = &v10[v34];
    long v_val_i_i_i_i = v35[0];
    int v36 = i_01_i / v12;
    int v37 = v36 % v26;
    int v38 = v37 * v18;
    int v39 = v36 * v12;
    int v40 = i_01_i - v39;
    int v41 = v40 / v14;
    int v42 = v41 % v28;
    int v43 = v42 * v20;
    int v44 = v43 + v38;
    int v45 = v41 * v14;
    int v46 = v40 - v45;
    int v47 = v46 % v30;
    int v48 = v44 + v47;
    long v49 = v48;
    long* v50 = &v22[v49];
    long v_val_i_i_i_i_i_i = v50[0];
    long v51 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    long* v52 = &v8[v34];
    v52[0] = v51;
    int v54 = i_01_i + v6;
    bool v55 = v54 < size;
    if(v55) {
        i_01_i = v54;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_208* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f1.f0[1];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v14 = (global long*)v13;
    long v15 = v14[0];
    int v16 = (int)v15;
    long v17 = v15 >> 32;
    int v18 = (int)v17;
    global long** v19 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v20 = v19[0];
    global int* v21 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v22 = (global long*)v21;
    long v23 = v22[0];
    int v24 = (int)v23;
    long v25 = v23 >> 32;
    int v26 = (int)v25;
    global int* v27 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    int v28 = v27[0];
    global long** v29 = &memcopied_eval[0].f1.f2.f0;
    long* v30 = v29[0];
    bool v31 = v4 < size;
    if(v31) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v34 = i_01_i / v10;
    int v35 = v34 % v24;
    int v36 = v35 * v16;
    int v37 = v34 * v10;
    int v38 = i_01_i - v37;
    int v39 = v38 / v12;
    int v40 = v39 % v26;
    int v41 = v40 * v18;
    int v42 = v41 + v36;
    int v43 = v39 * v12;
    int v44 = v38 - v43;
    int v45 = v44 % v28;
    int v46 = v42 + v45;
    long v47 = v46;
    long* v48 = &v20[v47];
    long v_val_i_i_i_i_i_i = v48[0];
    long v49 = i_01_i;
    long* v50 = &v30[v49];
    long v_val_i_i_i_i = v50[0];
    long v51 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    long* v52 = &v8[v49];
    v52[0] = v51;
    int v54 = i_01_i + v6;
    bool v55 = v54 < size;
    if(v55) {
        i_01_i = v54;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_210* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f1.f0[1];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v14 = (global long*)v13;
    long v15 = v14[0];
    int v16 = (int)v15;
    long v17 = v15 >> 32;
    int v18 = (int)v17;
    global long** v19 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v20 = v19[0];
    global int* v21 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v22 = (global long*)v21;
    long v23 = v22[0];
    int v24 = (int)v23;
    long v25 = v23 >> 32;
    int v26 = (int)v25;
    global int* v27 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    int v28 = v27[0];
    global int* v29 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v30 = v29[0];
    global int* v31 = &memcopied_eval[0].f1.f2.f1.f0[1];
    int v32 = v31[0];
    global int* v33 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global long** v39 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v40 = v39[0];
    global int* v41 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v42 = (global long*)v41;
    long v43 = v42[0];
    int v44 = (int)v43;
    long v45 = v43 >> 32;
    int v46 = (int)v45;
    global int* v47 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    int v48 = v47[0];
    bool v49 = v4 < size;
    if(v49) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v52 = i_01_i / v10;
    int v53 = v52 % v24;
    int v54 = v53 * v16;
    int v55 = v52 * v10;
    int v56 = i_01_i - v55;
    int v57 = v56 / v12;
    int v58 = v57 % v26;
    int v59 = v58 * v18;
    int v60 = v59 + v54;
    int v61 = v57 * v12;
    int v62 = v56 - v61;
    int v63 = v62 % v28;
    int v64 = v60 + v63;
    long v65 = v64;
    long* v66 = &v20[v65];
    long v_val_i_i_i_i_i_i = v66[0];
    int v67 = i_01_i / v30;
    int v68 = v67 % v44;
    int v69 = v68 * v36;
    int v70 = v67 * v30;
    int v71 = i_01_i - v70;
    int v72 = v71 / v32;
    int v73 = v72 % v46;
    int v74 = v73 * v38;
    int v75 = v74 + v69;
    int v76 = v72 * v32;
    int v77 = v71 - v76;
    int v78 = v77 % v48;
    int v79 = v75 + v78;
    long v80 = v79;
    long* v81 = &v40[v80];
    long v_val_i_i_i1_i_i_i = v81[0];
    long v82 = v_val_i_i_i1_i_i_i + v_val_i_i_i_i_i_i;
    long v83 = i_01_i;
    long* v84 = &v8[v83];
    v84[0] = v82;
    int v86 = i_01_i + v6;
    bool v87 = v86 < size;
    if(v87) {
        i_01_i = v86;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_212* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f0;
    long* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    global long*v12 = (global long*)v11;
    long v13 = v12[0];
    int v14 = (int)v13;
    long v15 = v13 >> 32;
    int v16 = (int)v15;
    global int* v17 = &memcopied_eval[0].f1.f2.f1.f0[2];
    int v18 = v17[0];
    global int* v19 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v20 = (global long*)v19;
    long v21 = v20[0];
    int v22 = (int)v21;
    long v23 = v21 >> 32;
    int v24 = (int)v23;
    global int* v25 = &memcopied_eval[0].f1.f2.f2.f0[2];
    int v26 = v25[0];
    global long** v27 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v28 = v27[0];
    global int* v29 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v30 = (global long*)v29;
    long v31 = v30[0];
    int v32 = (int)v31;
    long v33 = v31 >> 32;
    int v34 = (int)v33;
    global int* v35 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    global long*v36 = (global long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    long v39 = v37 >> 32;
    int v40 = (int)v39;
    bool v41 = v4 < size;
    if(v41) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    long v44 = i_01_i;
    long* v45 = &v10[v44];
    long v_val_i_i_i_i = v45[0];
    int v46 = i_01_i / v14;
    int v47 = v46 % v32;
    int v48 = v47 * v22;
    int v49 = v46 * v14;
    int v50 = i_01_i - v49;
    int v51 = v50 / v16;
    int v52 = v51 % v34;
    int v53 = v52 * v24;
    int v54 = v53 + v48;
    int v55 = v51 * v16;
    int v56 = v50 - v55;
    int v57 = v56 / v18;
    int v58 = v57 % v38;
    int v59 = v58 * v26;
    int v60 = v54 + v59;
    int v61 = v57 * v18;
    int v62 = v56 - v61;
    int v63 = v62 % v40;
    int v64 = v60 + v63;
    long v65 = v64;
    long* v66 = &v28[v65];
    long v_val_i_i_i_i_i_i = v66[0];
    long v67 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    long* v68 = &v8[v44];
    v68[0] = v67;
    int v70 = i_01_i + v6;
    bool v71 = v70 < size;
    if(v71) {
        i_01_i = v70;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_217* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    global long*v10 = (global long*)v9;
    long v11 = v10[0];
    int v12 = (int)v11;
    long v13 = v11 >> 32;
    int v14 = (int)v13;
    global int* v15 = &memcopied_eval[0].f1.f1.f1.f0[2];
    int v16 = v15[0];
    global int* v17 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v18 = (global long*)v17;
    long v19 = v18[0];
    int v20 = (int)v19;
    long v21 = v19 >> 32;
    int v22 = (int)v21;
    global int* v23 = &memcopied_eval[0].f1.f1.f2.f0[2];
    int v24 = v23[0];
    global long** v25 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v26 = v25[0];
    global int* v27 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v28 = (global long*)v27;
    long v29 = v28[0];
    int v30 = (int)v29;
    long v31 = v29 >> 32;
    int v32 = (int)v31;
    global int* v33 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global long** v39 = &memcopied_eval[0].f1.f2.f0;
    long* v40 = v39[0];
    bool v41 = v4 < size;
    if(v41) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v44 = i_01_i / v12;
    int v45 = v44 % v30;
    int v46 = v45 * v20;
    int v47 = v44 * v12;
    int v48 = i_01_i - v47;
    int v49 = v48 / v14;
    int v50 = v49 % v32;
    int v51 = v50 * v22;
    int v52 = v51 + v46;
    int v53 = v49 * v14;
    int v54 = v48 - v53;
    int v55 = v54 / v16;
    int v56 = v55 % v36;
    int v57 = v56 * v24;
    int v58 = v52 + v57;
    int v59 = v55 * v16;
    int v60 = v54 - v59;
    int v61 = v60 % v38;
    int v62 = v58 + v61;
    long v63 = v62;
    long* v64 = &v26[v63];
    long v_val_i_i_i_i_i_i = v64[0];
    long v65 = i_01_i;
    long* v66 = &v40[v65];
    long v_val_i_i_i_i = v66[0];
    long v67 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    long* v68 = &v8[v65];
    v68[0] = v67;
    int v70 = i_01_i + v6;
    bool v71 = v70 < size;
    if(v71) {
        i_01_i = v70;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_219* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    global long*v10 = (global long*)v9;
    long v11 = v10[0];
    int v12 = (int)v11;
    long v13 = v11 >> 32;
    int v14 = (int)v13;
    global int* v15 = &memcopied_eval[0].f1.f1.f1.f0[2];
    int v16 = v15[0];
    global int* v17 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v18 = (global long*)v17;
    long v19 = v18[0];
    int v20 = (int)v19;
    long v21 = v19 >> 32;
    int v22 = (int)v21;
    global int* v23 = &memcopied_eval[0].f1.f1.f2.f0[2];
    int v24 = v23[0];
    global long** v25 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v26 = v25[0];
    global int* v27 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v28 = (global long*)v27;
    long v29 = v28[0];
    int v30 = (int)v29;
    long v31 = v29 >> 32;
    int v32 = (int)v31;
    global int* v33 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global int* v39 = &memcopied_eval[0].f1.f2.f1.f0[0];
    global long*v40 = (global long*)v39;
    long v41 = v40[0];
    int v42 = (int)v41;
    long v43 = v41 >> 32;
    int v44 = (int)v43;
    global int* v45 = &memcopied_eval[0].f1.f2.f1.f0[2];
    int v46 = v45[0];
    global int* v47 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v48 = (global long*)v47;
    long v49 = v48[0];
    int v50 = (int)v49;
    long v51 = v49 >> 32;
    int v52 = (int)v51;
    global int* v53 = &memcopied_eval[0].f1.f2.f2.f0[2];
    int v54 = v53[0];
    global long** v55 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v56 = v55[0];
    global int* v57 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v58 = (global long*)v57;
    long v59 = v58[0];
    int v60 = (int)v59;
    long v61 = v59 >> 32;
    int v62 = (int)v61;
    global int* v63 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    global long*v64 = (global long*)v63;
    long v65 = v64[0];
    int v66 = (int)v65;
    long v67 = v65 >> 32;
    int v68 = (int)v67;
    bool v69 = v4 < size;
    if(v69) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v72 = i_01_i / v12;
    int v73 = v72 % v30;
    int v74 = v73 * v20;
    int v75 = v72 * v12;
    int v76 = i_01_i - v75;
    int v77 = v76 / v14;
    int v78 = v77 % v32;
    int v79 = v78 * v22;
    int v80 = v79 + v74;
    int v81 = v77 * v14;
    int v82 = v76 - v81;
    int v83 = v82 / v16;
    int v84 = v83 % v36;
    int v85 = v84 * v24;
    int v86 = v80 + v85;
    int v87 = v83 * v16;
    int v88 = v82 - v87;
    int v89 = v88 % v38;
    int v90 = v86 + v89;
    long v91 = v90;
    long* v92 = &v26[v91];
    long v_val_i_i_i_i_i_i = v92[0];
    int v93 = i_01_i / v42;
    int v94 = v93 % v60;
    int v95 = v94 * v50;
    int v96 = v93 * v42;
    int v97 = i_01_i - v96;
    int v98 = v97 / v44;
    int v99 = v98 % v62;
    int v100 = v99 * v52;
    int v101 = v100 + v95;
    int v102 = v98 * v44;
    int v103 = v97 - v102;
    int v104 = v103 / v46;
    int v105 = v104 % v66;
    int v106 = v105 * v54;
    int v107 = v101 + v106;
    int v108 = v104 * v46;
    int v109 = v103 - v108;
    int v110 = v109 % v68;
    int v111 = v107 + v110;
    long v112 = v111;
    long* v113 = &v56[v112];
    long v_val_i_i_i1_i_i_i = v113[0];
    long v114 = v_val_i_i_i1_i_i_i + v_val_i_i_i_i_i_i;
    long v115 = i_01_i;
    long* v116 = &v8[v115];
    v116[0] = v114;
    int v118 = i_01_i + v6;
    bool v119 = v118 < size;
    if(v119) {
        i_01_i = v118;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_221* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global long** v9 = &memcopied_eval[0].f1.f1.f0;
    long* v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v12 = v11[0];
    global int* v13 = &memcopied_eval[0].f1.f2.f1.f0[1];
    global long*v14 = (global long*)v13;
    long v15 = v14[0];
    int v16 = (int)v15;
    long v17 = v15 >> 32;
    int v18 = (int)v17;
    global int* v19 = &memcopied_eval[0].f1.f2.f1.f0[3];
    int v20 = v19[0];
    global int* v21 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v22 = (global long*)v21;
    long v23 = v22[0];
    int v24 = (int)v23;
    long v25 = v23 >> 32;
    int v26 = (int)v25;
    global int* v27 = &memcopied_eval[0].f1.f2.f2.f0[2];
    global long*v28 = (global long*)v27;
    long v29 = v28[0];
    int v30 = (int)v29;
    long v31 = v29 >> 32;
    int v32 = (int)v31;
    global long** v33 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v34 = v33[0];
    global int* v35 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v36 = (global long*)v35;
    long v37 = v36[0];
    int v38 = (int)v37;
    long v39 = v37 >> 32;
    int v40 = (int)v39;
    global int* v41 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    global long*v42 = (global long*)v41;
    long v43 = v42[0];
    int v44 = (int)v43;
    long v45 = v43 >> 32;
    int v46 = (int)v45;
    global int* v47 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[4];
    int v48 = v47[0];
    bool v49 = v4 < size;
    if(v49) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    long v52 = i_01_i;
    long* v53 = &v10[v52];
    long v_val_i_i_i_i = v53[0];
    int v54 = i_01_i / v12;
    int v55 = v54 % v38;
    int v56 = v55 * v24;
    int v57 = v54 * v12;
    int v58 = i_01_i - v57;
    int v59 = v58 / v16;
    int v60 = v59 % v40;
    int v61 = v60 * v26;
    int v62 = v61 + v56;
    int v63 = v59 * v16;
    int v64 = v58 - v63;
    int v65 = v64 / v18;
    int v66 = v65 % v44;
    int v67 = v66 * v30;
    int v68 = v62 + v67;
    int v69 = v65 * v18;
    int v70 = v64 - v69;
    int v71 = v70 / v20;
    int v72 = v71 % v46;
    int v73 = v72 * v32;
    int v74 = v68 + v73;
    int v75 = v71 * v20;
    int v76 = v70 - v75;
    int v77 = v76 % v48;
    int v78 = v74 + v77;
    long v79 = v78;
    long* v80 = &v34[v79];
    long v_val_i_i_i_i_i_i = v80[0];
    long v81 = v_val_i_i_i_i_i_i + v_val_i_i_i_i;
    long* v82 = &v8[v52];
    v82[0] = v81;
    int v84 = i_01_i + v6;
    bool v85 = v84 < size;
    if(v85) {
        i_01_i = v84;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_226* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f1.f0[1];
    global long*v12 = (global long*)v11;
    long v13 = v12[0];
    int v14 = (int)v13;
    long v15 = v13 >> 32;
    int v16 = (int)v15;
    global int* v17 = &memcopied_eval[0].f1.f1.f1.f0[3];
    int v18 = v17[0];
    global int* v19 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v20 = (global long*)v19;
    long v21 = v20[0];
    int v22 = (int)v21;
    long v23 = v21 >> 32;
    int v24 = (int)v23;
    global int* v25 = &memcopied_eval[0].f1.f1.f2.f0[2];
    global long*v26 = (global long*)v25;
    long v27 = v26[0];
    int v28 = (int)v27;
    long v29 = v27 >> 32;
    int v30 = (int)v29;
    global long** v31 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v32 = v31[0];
    global int* v33 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global int* v39 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    global long*v40 = (global long*)v39;
    long v41 = v40[0];
    int v42 = (int)v41;
    long v43 = v41 >> 32;
    int v44 = (int)v43;
    global int* v45 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[4];
    int v46 = v45[0];
    global long** v47 = &memcopied_eval[0].f1.f2.f0;
    long* v48 = v47[0];
    bool v49 = v4 < size;
    if(v49) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v52 = i_01_i / v10;
    int v53 = v52 % v36;
    int v54 = v53 * v22;
    int v55 = v52 * v10;
    int v56 = i_01_i - v55;
    int v57 = v56 / v14;
    int v58 = v57 % v38;
    int v59 = v58 * v24;
    int v60 = v59 + v54;
    int v61 = v57 * v14;
    int v62 = v56 - v61;
    int v63 = v62 / v16;
    int v64 = v63 % v42;
    int v65 = v64 * v28;
    int v66 = v60 + v65;
    int v67 = v63 * v16;
    int v68 = v62 - v67;
    int v69 = v68 / v18;
    int v70 = v69 % v44;
    int v71 = v70 * v30;
    int v72 = v66 + v71;
    int v73 = v69 * v18;
    int v74 = v68 - v73;
    int v75 = v74 % v46;
    int v76 = v72 + v75;
    long v77 = v76;
    long* v78 = &v32[v77];
    long v_val_i_i_i_i_i_i = v78[0];
    long v79 = i_01_i;
    long* v80 = &v48[v79];
    long v_val_i_i_i_i = v80[0];
    long v81 = v_val_i_i_i_i + v_val_i_i_i_i_i_i;
    long* v82 = &v8[v79];
    v82[0] = v81;
    int v84 = i_01_i + v6;
    bool v85 = v84 < size;
    if(v85) {
        i_01_i = v84;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}

kernel void _ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(global struct Eigen__TensorEvaluator_228* memcopied_eval, int size) {
int i_01_i;
    label0:;
    int v0 = get_group_id(0);
    int v1 = get_local_size(0);
    int v2 = v1 * v0;
    int v3 = get_global_id(0);
    int v4 = v2 + v3;
    int v5 = get_num_groups(0);
    int v6 = v5 * v1;
    global long** v7 = &memcopied_eval[0].f0.f0;
    long* v8 = v7[0];
    global int* v9 = &memcopied_eval[0].f1.f1.f1.f0[0];
    int v10 = v9[0];
    global int* v11 = &memcopied_eval[0].f1.f1.f1.f0[1];
    global long*v12 = (global long*)v11;
    long v13 = v12[0];
    int v14 = (int)v13;
    long v15 = v13 >> 32;
    int v16 = (int)v15;
    global int* v17 = &memcopied_eval[0].f1.f1.f1.f0[3];
    int v18 = v17[0];
    global int* v19 = &memcopied_eval[0].f1.f1.f2.f0[0];
    global long*v20 = (global long*)v19;
    long v21 = v20[0];
    int v22 = (int)v21;
    long v23 = v21 >> 32;
    int v24 = (int)v23;
    global int* v25 = &memcopied_eval[0].f1.f1.f2.f0[2];
    global long*v26 = (global long*)v25;
    long v27 = v26[0];
    int v28 = (int)v27;
    long v29 = v27 >> 32;
    int v30 = (int)v29;
    global long** v31 = &memcopied_eval[0].f1.f1.f3.f0;
    long* v32 = v31[0];
    global int* v33 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[0];
    global long*v34 = (global long*)v33;
    long v35 = v34[0];
    int v36 = (int)v35;
    long v37 = v35 >> 32;
    int v38 = (int)v37;
    global int* v39 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[2];
    global long*v40 = (global long*)v39;
    long v41 = v40[0];
    int v42 = (int)v41;
    long v43 = v41 >> 32;
    int v44 = (int)v43;
    global int* v45 = &memcopied_eval[0].f1.f1.f3.f1.f0.f0[4];
    int v46 = v45[0];
    global int* v47 = &memcopied_eval[0].f1.f2.f1.f0[0];
    int v48 = v47[0];
    global int* v49 = &memcopied_eval[0].f1.f2.f1.f0[1];
    global long*v50 = (global long*)v49;
    long v51 = v50[0];
    int v52 = (int)v51;
    long v53 = v51 >> 32;
    int v54 = (int)v53;
    global int* v55 = &memcopied_eval[0].f1.f2.f1.f0[3];
    int v56 = v55[0];
    global int* v57 = &memcopied_eval[0].f1.f2.f2.f0[0];
    global long*v58 = (global long*)v57;
    long v59 = v58[0];
    int v60 = (int)v59;
    long v61 = v59 >> 32;
    int v62 = (int)v61;
    global int* v63 = &memcopied_eval[0].f1.f2.f2.f0[2];
    global long*v64 = (global long*)v63;
    long v65 = v64[0];
    int v66 = (int)v65;
    long v67 = v65 >> 32;
    int v68 = (int)v67;
    global long** v69 = &memcopied_eval[0].f1.f2.f3.f0;
    long* v70 = v69[0];
    global int* v71 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[0];
    global long*v72 = (global long*)v71;
    long v73 = v72[0];
    int v74 = (int)v73;
    long v75 = v73 >> 32;
    int v76 = (int)v75;
    global int* v77 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[2];
    global long*v78 = (global long*)v77;
    long v79 = v78[0];
    int v80 = (int)v79;
    long v81 = v79 >> 32;
    int v82 = (int)v81;
    global int* v83 = &memcopied_eval[0].f1.f2.f3.f1.f0.f0[4];
    int v84 = v83[0];
    bool v85 = v4 < size;
    if(v85) {
        goto label1;
    } else {
        goto label4;
    }
    label1:;
        i_01_i = v4;
    goto label2;
    label2:;
    int v88 = i_01_i / v10;
    int v89 = v88 % v36;
    int v90 = v89 * v22;
    int v91 = v88 * v10;
    int v92 = i_01_i - v91;
    int v93 = v92 / v14;
    int v94 = v93 % v38;
    int v95 = v94 * v24;
    int v96 = v95 + v90;
    int v97 = v93 * v14;
    int v98 = v92 - v97;
    int v99 = v98 / v16;
    int v100 = v99 % v42;
    int v101 = v100 * v28;
    int v102 = v96 + v101;
    int v103 = v99 * v16;
    int v104 = v98 - v103;
    int v105 = v104 / v18;
    int v106 = v105 % v44;
    int v107 = v106 * v30;
    int v108 = v102 + v107;
    int v109 = v105 * v18;
    int v110 = v104 - v109;
    int v111 = v110 % v46;
    int v112 = v108 + v111;
    long v113 = v112;
    long* v114 = &v32[v113];
    long v_val_i_i_i_i = v114[0];
    int v115 = i_01_i / v48;
    int v116 = v115 % v74;
    int v117 = v116 * v60;
    int v118 = v115 * v48;
    int v119 = i_01_i - v118;
    int v120 = v119 / v52;
    int v121 = v120 % v76;
    int v122 = v121 * v62;
    int v123 = v122 + v117;
    int v124 = v120 * v52;
    int v125 = v119 - v124;
    int v126 = v125 / v54;
    int v127 = v126 % v80;
    int v128 = v127 * v66;
    int v129 = v123 + v128;
    int v130 = v126 * v54;
    int v131 = v125 - v130;
    int v132 = v131 / v56;
    int v133 = v132 % v82;
    int v134 = v133 * v68;
    int v135 = v129 + v134;
    int v136 = v132 * v56;
    int v137 = v131 - v136;
    int v138 = v137 % v84;
    int v139 = v135 + v138;
    long v140 = v139;
    long* v141 = &v70[v140];
    long v_val_i_i_i1_i = v141[0];
    long v142 = v_val_i_i_i1_i + v_val_i_i_i_i;
    long v143 = i_01_i;
    long* v144 = &v8[v143];
    v144[0] = v142;
    int v146 = i_01_i + v6;
    bool v147 = v146 < size;
    if(v147) {
        i_01_i = v146;
        goto label2;
    } else {
        goto label3;
    }
    label3:;
        goto label4;
    label4:;
}
