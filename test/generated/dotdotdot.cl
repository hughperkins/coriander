struct class_Eigen__StreamInterface {
};



void _Z7test_siPf(struct class_Eigen__StreamInterface* data);

void _Z7test_siPf(struct class_Eigen__StreamInterface* data) {
    label0:;
}

kernel void _Z11test_floatsPf(global float* data) {
    label0:;
    global float* v1 = (&data[1]);
    float v2 = v1[0];
    data[0] = v2;
}
