#pragma once

struct uchar4 {
public:
    __device__ __host__ uchar4() {}
    __device__ __host__ uchar4(unsigned char x, unsigned char y, unsigned char z, unsigned char w) : x(x), y(y), z(z), w(w) {}
    unsigned char x;
    unsigned char y;
    unsigned char z;
    unsigned char w;
};

struct uint4 {
public:
    __device__ __host__ uint4() {}
    __device__ __host__ uint4(unsigned int x, unsigned int y, unsigned int z, unsigned int w) : x(x), y(y), z(z), w(w) {}
    unsigned int x;
    unsigned int y;
    unsigned int z;
    unsigned int w;
};

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

__device__ __host__ uchar4 make_uchar4(unsigned char x, unsigned char y, unsigned char z, unsigned char w);

__device__ __host__ uint4 make_uint4(unsigned int x, unsigned int y, unsigned int z, unsigned int w);
