# Copyright Hugh Perkins 2016, 2017
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
import math
import pytest
from test import test_common
from test.test_common import offset_type


basename = os.path.basename(__name__).split('.')[-1]
print('basename', basename)


def test_pointers1_using_cl(context, q, int_data, int_data_gpu):
    cl_code = """
kernel void mykernel(global int *data) {
    local int data_segment_begin[0];
    local char on_chip_allocator[24];

    char oca8_value = on_chip_allocator[8];

    local char * pl_oca8 = &(on_chip_allocator[8]);
    pl_oca8[2] = 3;
    data[0] = on_chip_allocator[10];

    *(local int *)pl_oca8 = 123;
    //(local int *)pl_oca8[1] = 125;
    local int *pdest = (local int *)pl_oca8;
    pdest[1] = 125;
    data[0] = ((local int *)on_chip_allocator)[2];
    data[1] = ((local int *)on_chip_allocator)[3];

    local char *local *store_lpl = (local char * local *)&(on_chip_allocator[8]);
    store_lpl[0] = (local char *)data_segment_begin;

    ((local char * local *)&(on_chip_allocator[8]))[0] = (local char *)data_segment_begin;
}
"""
    kernel_name = 'mykernel'
    kernel = test_common.build_kernel(context, cl_code, kernel_name)
    int_data[3] = 123
    cl.enqueue_copy(q, int_data_gpu, int_data)
    kernel(
        q, (32,), (32,),
        int_data_gpu)
    q.finish()
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('int_data[0]', int_data[0])
    print('int_data[1]', int_data[1])


def test_pointers1_using_cu(context, q, int_data, int_data_gpu):
    cu_code = """
__global__ void myKernel(int *data) {
    __shared__ int data_segment_begin[0];
    __shared__ char on_chip_allocator[24];

    char * p_oca8 = &(on_chip_allocator[8]);
}
"""
    ll_code = test_common.cu_to_ll_noopt(cu_code)
    print('ll_code', ll_code.split('\n\nattributes')[0])
    kernel_name = '_Z8myKernelPi'
    cl_code = test_common.ll_to_cl(ll_code, kernel_name, 1)
    print('cl_code', 'kernel'.join(cl_code.split('kernel')[1:]))


def test_pointers1_global1(context, q, int_data, int_data_gpu):
    cu_code = """
__global__ void myKernel(int *data) {
    int *d1 = data;
    int e = d1[2];
    data[0] = e;
}
"""
    ll_code = test_common.cu_to_ll_noopt(cu_code)
    print('ll_code', ll_code.split('\n\nattributes')[0])
    kernel_name = '_Z8myKernelPi'
    cl_code = test_common.ll_to_cl(ll_code, kernel_name, 1)
    cl_code = 'kernel'.join(cl_code.split('kernel')[1:])
    cl_code = cl_code.split('\n    const struct GlobalVars')[0] + '    ...\n' + cl_code.split('pGlobalVars = &globalVars;\n')[1]
    print('cl_code', cl_code)
