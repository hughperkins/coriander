#pragma oncce

class float4 {
public:
    float4() {}
    float4(float x, float y, float z, float w) : x(x), y(y), z(z), w(w) {}
    float x;
    float y;
    float z;
    float w;
};

float4 make_float4(float x, float y, float z, float w) {
    return float4(x,y,z,w);
}

class double2 {
public:
    double2() {}
    double2(double x, double y) : x(x), y(y) {}
    double x;
    double y;
};

double2 make_double2(double x, double y) {
    return double2(x,y);
}
