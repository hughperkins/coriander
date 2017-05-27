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
import pyopencl.tools
import pytest
import math
import os
import subprocess
from test import test_common
from test.test_common import offset_type


basename = os.path.basename(__name__).split('.')[-1]
print('basename', basename)


def test_inlining(context, q, float_data, float_data_gpu):

    cu_source = """
__global__ void myKernel(float *data) {
    data[0] = (data[3] * (data[1] + data[2])) / data[4];
    data[7] = (data[3] / (data[1] - data[2])) * data[4];
}
"""
    kernelName = test_common.mangle('myKernel', ['float *'])
    cl_sourcecode = test_common.cu_to_cl(cu_source, kernelName, num_clmems=1)
    print('cl_sourcecode', cl_sourcecode)
    kernel = test_common.build_kernel(context, cl_sourcecode, kernelName)

    for i in range(10):
        float_data[i] = i + 3
    cl.enqueue_copy(q, float_data_gpu, float_data)
    q.finish()
    # prog = cl.Program(context, sourcecode).build()
    # prog.__getattr__(kernelName)(
    kernel(
        q, (32,), (32,),
        float_data_gpu, offset_type(0), cl.LocalMemory(4))
    q.finish()
    float_data2 = np.zeros((1024,), dtype=np.float32)
    cl.enqueue_copy(q, float_data2, float_data_gpu)
    q.finish()
    print('float_data2[0]', float_data2[0])
    d = float_data
    d2 = float_data2
    expect = (d[3] * (d[1] + d[2])) / d[4]
    assert abs(d2[0] - expect) < 1e-5


def test_int_expressions(context, q, int_data, int_data_gpu):

    cu_source = """
__global__ void myKernel(int *data) {
    data[0] = (data[10] | data[11]) == data[12];
}
"""
    kernelName = test_common.mangle('myKernel', ['int *'])
    cl_sourcecode = test_common.cu_to_cl(cu_source, kernelName, num_clmems=1)
    print('cl_sourcecode', cl_sourcecode)
    kernel = test_common.build_kernel(context, cl_sourcecode, kernelName)

    for i in range(50):
        int_data[i] = 0
    int_data[10] = 2
    int_data[11] = 1
    int_data[12] = 1
    cl.enqueue_copy(q, int_data_gpu, int_data)
    q.finish()
    # prog = cl.Program(context, sourcecode).build()
    # prog.__getattr__(kernelName)(
    kernel(
        q, (32,), (32,),
        int_data_gpu, offset_type(0), cl.LocalMemory(4))
    q.finish()
    gpu_data = np.zeros((1024,), dtype=np.int32)
    cl.enqueue_copy(q, gpu_data, int_data_gpu)
    q.finish()
    data = int_data
    actual = gpu_data[0]
    expected = int((data[10] | data[11]) == data[12])
    print('actual', actual, 'expected', expected)
    assert actual == expected
    # print('int_data2[0]', int_data2[0])
    # d = int_data
    # d2 = int_data2
    # expect = (d[3] * (d[1] + d[2])) / d[4]
    # assert abs(d2[0] - expect) < 1e-5
