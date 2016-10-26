#pragma once

struct float4 {
public:
    __device__ __host__ float4() {}
    __device__ __host__ float4(float x, float y, float z, float w) : x(x), y(y), z(z), w(w) {}
    float x;
    float y;
    float z;
    float w;
};


struct float2 {
public:
    __device__ __host__ float2() {}
    __device__ __host__ float2(float x, float y) : x(x), y(y) {}
    float x;
    float y;
};

struct double2 {
public:
    __device__ __host__ double2() {}
    __device__ __host__ double2(double x, double y) : x(x), y(y) {}
    double x;
    double y;
};

__device__ __host__ float4 make_float4(float x, float y, float z, float w);
__device__ __host__ float2 make_float2(float x, float y);
__device__ __host__ double2 make_double2(double x, double y);
