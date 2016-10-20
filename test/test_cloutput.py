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
import subprocess
from test import test_common


@pytest.fixture(scope='module')
def testcudakernel1_cl():
    # cl_path = 'test/generated/testcudakernel1-device.cl'
    # print(subprocess.check_output([
    #     'make',
    #     cl_path
    # ]).decode('utf-8'))
    # we need to fix this to be a bit more robust to makefile changes...
    print(subprocess.check_output([
        'cocl',
        '-c', '-o', 'test/generated/testcudakernel1.o',
        'test/testcudakernel1.cu'
    ]).decode('utf-8'))
    cl_path = 'test/generated/testcudakernel1-device.cl'
    return cl_path


def test_cl_generates(testcudakernel1_cl):
    pass


@pytest.fixture(scope='module')
def testcudakernel1(context, testcudakernel1_cl):
    with open(testcudakernel1_cl, 'r') as f:
        sourcecode = f.read()

    prog = cl.Program(context, sourcecode).build()
    return prog


def test_program_compiles(testcudakernel1):
    pass


def test_foo(testcudakernel1, q, float_data, float_data_gpu):
    testcudakernel1.__getattr__(test_common.mangle('foo', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == 123


def test_copy_float(testcudakernel1, q, float_data, float_data_gpu):
    testcudakernel1.__getattr__(test_common.mangle('copy_float', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data[1]


def test_use_tid2(testcudakernel1, q, int_data, int_data_gpu):
    int_data_orig = np.copy(int_data)
    testcudakernel1.__getattr__(test_common.mangle('use_tid2', ['int *']))(q, (32,), (32,), int_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    assert int_data[0] == int_data_orig[0] + 0
    assert int_data[10] == int_data_orig[10] + 10
    assert int_data[31] == int_data_orig[31] + 31


def test_use_template1(testcudakernel1, q, int_data, int_data_gpu, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)
    int_data_orig = np.copy(int_data)

    testcudakernel1.__getattr__(test_common.mangle('use_template1', ['float *', 'int *']))(q, (32,), (32,), float_data_gpu, int_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    assert float_data[0] == float_data_orig[1] + float_data_orig[2]
    assert int_data[0] == int_data_orig[1] + int_data_orig[2]


def test_testFor(testcudakernel1, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)

    testcudakernel1.__getattr__(test_common.mangle('testFor', ['float *', 'int']))(q, (32,), (32,), float_data_gpu, np.int32(32))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert abs(float_data[0] - sum(float_data_orig[0:32])) < 1e-4


def test_ternary(testcudakernel1, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)

    def set_float_value(gpu_buffer, idx, value):
        testcudakernel1.__getattr__(test_common.mangle('setValue', ['float *', 'int', 'float']))(
            q, (32,), (32,), float_data_gpu, np.int32(idx), np.float32(value))

    set_float_value(float_data_gpu, 1, 10)
    testcudakernel1.__getattr__(test_common.mangle('testTernary', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data_orig[2]

    set_float_value(float_data_gpu, 1, -2)
    testcudakernel1.__getattr__(test_common.mangle('testTernary', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data_orig[3]


@pytest.mark.xfail(reason='all structs are passed across as just one for now; following the copy-by-value change')
def test_structs(testcudakernel1, ctx, q, float_data, float_data_gpu, int_data, int_data_gpu):
    # my_struct = np.dtype([("x", np.float32), ("y", np.int32)])  # I dont know why, but seems these are back to front...
    my_struct = np.dtype([("x", np.float32), ("y", np.int32)])  # I dont know why, but seems these are back to front...
    my_struct, my_struct_c_decl = pyopencl.tools.match_dtype_to_c_struct(
        ctx.devices[0], "MyStruct", my_struct)
    my_struct = cl.tools.get_or_register_dtype("MyStruct", my_struct)
    structs = np.empty(2, my_struct)
    structs[0]['x'] = 123
    structs[0]['y'] = 567
    structs[1]['x'] = 33
    structs[1]['y'] = 44
    structs_gpu = cl.array.to_device(q, structs)
    # p = structs_gpu.map_to_host(q)
    # print('p', p)
    # q.finish()
    testcudakernel1.__getattr__(test_common.mangle('testStructs', ['MyStruct *', 'float *', 'int *']))(
        q, (32,), (32,),
        structs_gpu.data, float_data_gpu, int_data_gpu)
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print(float_data[0])
    print(float_data[1])
    print(int_data[0])
    print(int_data[1])
    assert float_data[0] == 123
    assert float_data[1] == 33
    assert int_data[0] == 567
    # assert int_data[1] == 44


@pytest.mark.xfail
def test_float4(testcudakernel1, ctx, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)
    testcudakernel1.__getattr__(test_common.mangle('testFloat4', ['float4 *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()

    print('float_data_orig[:8]', float_data_orig[:8])
    print('float_data[:8]', float_data[:8])
    assert float_data[1] == float_data_orig[4 + 2] * float_data_orig[4 + 3]


@pytest.mark.xfail
def test_float4_test2(testcudakernel1, ctx, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)
    testcudakernel1.__getattr__(test_common.mangle('testFloat4_test2', ['float4 *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()

    print('float_data_orig[:8]', float_data_orig[:8])
    print('float_data[:8]', float_data[:8])
    for i in range(4):
        assert float_data[i] == float_data_orig[i + 4]
