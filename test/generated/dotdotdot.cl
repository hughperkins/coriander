struct class_Eigen__StreamInterface {
};


void _Z7test_siPf(global struct class_Eigen__StreamInterface* data);

void _Z7test_siPf(global struct class_Eigen__StreamInterface* data) {
    label0:;
}

kernel void _Z11test_floatsPf(global float* data) {
    label0:;
    global float* v0 = &data[1];
    float v1 = v0[0];
    data[0] = v1;
}
