#pragma once

struct float4 {
public:
    __attribute__((device)) __attribute__((host)) float4() {}
    __attribute__((device)) __attribute__((host)) float4(float x, float y, float z, float w) : x(x), y(y), z(z), w(w) {}
    float x;
    float y;
    float z;
    float w;
};


struct float2 {
public:
    __attribute__((device)) __attribute__((host)) float2() {}
    __attribute__((device)) __attribute__((host)) float2(float x, float y) : x(x), y(y) {}
    float x;
    float y;
};

struct double2 {
public:
    __attribute__((device)) __attribute__((host)) double2() {}
    __attribute__((device)) __attribute__((host)) double2(double x, double y) : x(x), y(y) {}
    double x;
    double y;
};

__attribute__((device)) __attribute__((host)) float4 make_float4(float x, float y, float z, float w);
__attribute__((device)) __attribute__((host)) float2 make_float2(float x, float y);
__attribute__((device)) __attribute__((host)) double2 make_double2(double x, double y);
