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


basename = os.path.basename(__name__).split('.')[-1]
print('basename', basename)


def test_floatconstants(context, q, float_data, float_data_gpu):

    code = """
__device__ float4 getvals() {
    return make_float4(0xFFF0000000000000, 0x7FF0000000000000, INFINITY, -INFINITY);
}

__global__ void myKernel(float *data) {
    data[0] = 18442240474082181120.0f; // 0xFFF0000000000000
    data[1] = 9218868437227405312.0f; // 0x7FF0000000000000
    float4 vals = getvals();
    data[2] = vals.x;
    data[3] = vals.y;
    data[4] = vals.w;
    data[5] = vals.z;
    data[6] = INFINITY;
    data[7] = -INFINITY;
    // data[8] = 0xFFEFFFFFFFFFFFFF;
}
"""
    prog = test_common.compile_code(cl, context, code)
    prog.__getattr__(test_common.mangle('myKernel', ['float *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    print('float_data[1]', float_data[1])
    print('float_data[2]', float_data[2])
    print('float_data[3]', float_data[3])
    print('float_data[4]', float_data[4])
    print('float_data[5]', float_data[5])
    print('float_data[6]', float_data[6])
    print('float_data[7]', float_data[7])
    # print('float_data[8]', float_data[8])
    assert float_data[0] > 100000000
    assert float_data[1] > 100000000
    assert float_data[2] > 100000000
    assert float_data[3] > 100000000
    assert float_data[4] < -100000000
    assert float_data[5] > 100000000
    assert float_data[6] > 100000000
    assert float_data[7] < -100000000


def test_doubleconstants(context, q, float_data, float_data_gpu):

    code = """
__global__ void myKernel(double *data) {
    data[0] = 18442240474082181120.0f; // 0xFFF0000000000000
    data[1] = 9218868437227405312.0f; // 0x7FF0000000000000
    data[6] = INFINITY;
    data[7] = -INFINITY;
    // data[8] = 0xFFEFFFFFFFFFFFFF;
}
"""
    prog = test_common.compile_code(cl, context, code)
    prog.__getattr__(test_common.mangle('myKernel', ['double *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    print('float_data[1]', float_data[1])
    print('float_data[6]', float_data[6])
    print('float_data[7]', float_data[7])
    assert float_data[0] > 100000000
    assert float_data[1] > 100000000
    assert float_data[6] > 100000000
    assert float_data[7] < -100000000


def test_ieeefloats():
    """
    we're going to create an ll file, and convert to cl, and see what pops out
    """
    print(subprocess.check_output([
        'ir-to-opencl',
        'test/testdoubles.ll',
        '/tmp/out.cl'
    ]).decode('utf-8'))
    with open('/tmp/out.cl') as f:
        content = f.read()
    values = {}
    for line in content.split('\n'):
        if 'data[' in line:
            index = int(line.split('[')[1].split(']')[0])
            value = line.strip().split('=')[1].strip().replace(';', '')
            values[index] = value
    print('values[6]', values[6])
    print('values[7]', values[7])
    print('values[8]', values[8])
    assert 'nan' not in values[6]
    assert 'nan' not in values[7]
    assert 'nan' not in values[8]
    assert values[6] == '-INFINITY'
    assert values[7] == 'INFINITY'
    assert values[8] == '-INFINITY'


def test_pow(context, q, float_data, float_data_gpu):

    code = """
__global__ void myKernel(float *data) {
    data[0] = pow(data[1], data[2]);
    data[3] = pow(data[4], data[5]);
    data[5] = pow(data[7], data[8]);
}
"""
    prog = test_common.compile_code(cl, context, code)
    float_data[1] = 1.5
    float_data[2] = 4.6
    float_data[4] = -1.5
    float_data[5] = 4.6
    float_data[7] = 1.5
    float_data[8] = -4.6
    cl.enqueue_copy(q, float_data_gpu, float_data)
    prog.__getattr__(test_common.mangle('myKernel', ['float *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    print('float_data[3]', float_data[3])
    print('float_data[6]', float_data[6])
    expected = pow(float_data[1], float_data[2])
    assert abs(float_data[0] - expected) <= 1e-4


def test_sqrt(context, q, float_data, float_data_gpu):

    code = """
__global__ void myKernel(float *data) {
    data[threadIdx.x] = sqrt(data[threadIdx.x]);
}
"""
    prog = test_common.compile_code(cl, context, code)
    # float_data[1] = 1.5
    # float_data[2] = 4.6
    # float_data[4] = -1.5
    # float_data[5] = 4.6
    # float_data[7] = 1.5
    # float_data[8] = -4.6
    cl.enqueue_copy(q, float_data_gpu, float_data)
    prog.__getattr__(test_common.mangle('myKernel', ['float *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    for i in range(8):
        print('float_data[]', i, float_data[i])


def test_fptosi(context, q, float_data, float_data_gpu, int_data, int_data_gpu):

    code = """
__global__ void myKernel(float *float_data, int *int_data) {
    int_data[0] = (int)float_data[0];
}
"""
    prog = test_common.compile_code(cl, context, code)
    float_data[0] = 4.7
    float_data[1] = 1.5
    float_data[2] = 4.6
    cl.enqueue_copy(q, float_data_gpu, float_data)
    prog.__getattr__(test_common.mangle('myKernel', ['float *', 'int *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0),
        int_data_gpu, np.int64(0),
        cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('int_data[0]', int_data[0])
    # expected = pow(float_data[1], float_data[2])
    assert int_data[0] == 4


def test_sitofp(context, q, float_data, float_data_gpu, int_data, int_data_gpu):

    code = """
__global__ void myKernel(float *float_data, int *int_data) {
    float_data[0] = (float)int_data[0];
}
"""
    prog = test_common.compile_code(cl, context, code)
    int_data[0] = 5
    int_data[1] = 2
    int_data[2] = 4
    cl.enqueue_copy(q, int_data_gpu, int_data)
    prog.__getattr__(test_common.mangle('myKernel', ['float *', 'int *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0),
        int_data_gpu, np.int64(0),
        cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    # expected = pow(float_data[1], float_data[2])
    assert float_data[0] == 5
