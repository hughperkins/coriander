#pragma oncce

struct float4 {
public:
    float4() {}
    float4(float x, float y, float z, float w) : x(x), y(y), z(z), w(w) {}
    float x;
    float y;
    float z;
    float w;
};


struct float2 {
public:
    float2() {}
    float2(float x, float y) : x(x), y(y) {}
    float x;
    float y;
};

struct double2 {
public:
    double2() {}
    double2(double x, double y) : x(x), y(y) {}
    double x;
    double y;
};

float4 make_float4(float x, float y, float z, float w);
float2 make_float2(float x, float y);
double2 make_double2(double x, double y);
