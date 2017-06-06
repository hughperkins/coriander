# Copyright Hugh Perkins 2016
"""
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""
import numpy as np
import pyopencl as cl
import os
import subprocess
from test import test_common
from test.test_common import offset_type


def test_getelementptr_struct_local(context, q, float_data, float_data_gpu):
    cu_source = """
struct MyStruct {
    float* f0;
    float* f1;
};

    __global__ void foo(float *data) {
        struct MyStruct astruct;
        float *floats = astruct.f0;
    }
"""
    kernelName = test_common.mangle('foo', ['float *'])
    cl_sourcecode = test_common.cu_to_cl(cu_source, kernelName, num_clmems=1)
    print('cl_sourcecode', cl_sourcecode)
    kernel = test_common.build_kernel(context, cl_sourcecode, kernelName)
    # float_data_orig = np.copy(float_data)
    # kernel(q, (32,), (32,), float_data_gpu, offset_type(0), cl.LocalMemory(4))
    # cl.enqueue_copy(q, float_data, float_data_gpu)
    # q.finish()
    # # print('before', float_data_orig[:5])
    # print('after', float_data[:5])
    # assert np.abs(float_data_orig[1:32] - float_data[0:31]).max() <= 1e-4


def test_getelementptr_struct_global(context, q, float_data, float_data_gpu):
    cu_source = """
struct MyStruct {
    float* f0;
    float* f1;
};

    __global__ void foo(struct MyStruct mystruct) {
        float *floats = mystruct.f0;
    }
"""
    # kernelName = test_common.mangle('foo', ['float *'])
    kernelName = '_Z3foo8MyStruct'
    cl_sourcecode = test_common.cu_to_cl(cu_source, kernelName, num_clmems=3)
    print('cl_sourcecode', cl_sourcecode)
    kernel = test_common.build_kernel(context, cl_sourcecode, kernelName)
    # float_data_orig = np.copy(float_data)
    # kernel(q, (32,), (32,), float_data_gpu, offset_type(0), cl.LocalMemory(4))
    # cl.enqueue_copy(q, float_data, float_data_gpu)
    # q.finish()
    # # print('before', float_data_orig[:5])
    # print('after', float_data[:5])
    # # assert np.abs(float_data_orig[1:32] - float_data[0:31]).max() <= 1e-4


def test_kernelparam_ll(context, q, float_data, float_data_gpu):
    ll_code = """define void @mykernel(float * %p1) {
    ret void
}
"""
    cl_sourcecode = test_common.ll_to_cl(ll_code, "mykernel", num_clmems=1)
    print('cl_sourcecode', cl_sourcecode)
    assert len([l for l in cl_sourcecode.split('\n') if l.strip().startswith('global float* p1')]) == 1


def test_load_globalfloatstar(context, q, float_data, float_data_gpu):
    ll_code = """define void @mykernel(float * %p1) {
    %1 = load float, float* %p1
    ret void
}
"""
    cl_sourcecode = test_common.ll_to_cl(ll_code, "mykernel", num_clmems=1)
    print('cl_sourcecode', cl_sourcecode)
    assert len([l for l in cl_sourcecode.split('\n') if l.strip() == 'float v2;']) == 1


def x_test_play(context, q, float_data, float_data_gpu):
    cu_source = """
__device__ void process(float *data) {
    *data = 5.0f;
}

__device__ float process2(float value) {
    process(&value);
    return value;
}

__global__ void mykernel(float *data) {
    float v = data[0];
    float *v1 = &v;
    *v1 = 5.0f;
    data[0] = v;
    data[0] = process2(data[0]);
}
"""
    kernelName = test_common.mangle('mykernel', ['float *'])
    cl_sourcecode = test_common.cu_to_cl(cu_source, kernelName, num_clmems=1)
    print('cl_sourcecode', cl_sourcecode)
    # kernel = test_common.build_kernel(context, cl_sourcecode, kernelName)


    # %1 = load float, float* %p1
    # %2 = getelementptr

# def test_addr_of_float(context, q, float_data, float_data_gpu):
#     ll_code = """define void @mykernel(float * %p1) {
#     %1 = alloca float
#     %2 = getelementptr float, float* %1, i64 0
#     %3 = load float, float* %2
#     %4 = getelementptr float, float* %1
#     %5 = load float, float* %4
#     ret void
# }
# """
#     cl_sourcecode = test_common.ll_to_cl(ll_code, "mykernel", num_clmems=1)
#     print('cl_sourcecode', cl_sourcecode)
#     assert len([l for l in cl_sourcecode.split('\n') if l.strip() == 'float v2;']) == 1


def test_addr_of_float(context, q, float_data, float_data_gpu):
    cu_code = """
__attribute__((global)) void mykernel(float *data) {
    float v = data[0];
    float *v1 = &v;
    *v1 = 5.0f;
}
"""
    ll_code = test_common.cu_to_devicell_noopt(cu_code)
    print('ll_code', 'define ' + ll_code.split('define ')[1].split('}')[0] + '}')
    cl_code = test_common.ll_to_cl(ll_code, '_Z8mykernelPf', num_clmems=1)
    print('cl_code', cl_code)


def test_struct_byval(context, q, float_data, float_data_gpu):
    cu_code = """
struct MyStruct {
    float afloat;
    int anint;
    float *floatpointer;
    float **floatstarstar;
};

__attribute__((global)) void mykernel(struct MyStruct myStruct) {
}
"""
    ll_code = test_common.cu_to_devicell_noopt(cu_code)
    print('ll_code', 'define ' + ll_code.split('define ')[1].split('}')[0] + '}')
    cl_code = test_common.ll_to_cl(ll_code, '_Z8mykernel8MyStruct', num_clmems=1)
    print('cl_code', cl_code)


def test_internal_struct(context, q, float_data, float_data_gpu):
    cu_code = """
struct MyStruct {
    float afloat;
    int anint;
    float *floatpointer;
    // float **floatstarstart;
};

__attribute__((device)) void processStruct(MyStruct *myStruct) {
    myStruct->afloat = myStruct->floatpointer[0];
}

__attribute__((global)) void mykernel(float *data) {
    float afloat = data[0];
    float float2 = data[1];
    struct MyStruct myStruct = { afloat, 3, &float2 };
    processStruct(&myStruct);
    data[2] = myStruct.afloat;
}
"""
    ll_code = test_common.cu_to_devicell_noopt(cu_code)
    print('ll_code', 'define ' + ll_code.split('define ')[1].split('}')[0] + '}')
    cl_code = test_common.ll_to_cl(ll_code, '_Z8mykernelPf', num_clmems=1)
    print('cl_code', cl_code)
