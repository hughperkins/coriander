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
import os


gpu_idx = int(os.environ.get('TARGET_GPU', 0))

mf = cl.mem_flags


def mangle(name, param_types):
    mangled = '_Z%s%s' % (len(name), name)
    for param in param_types:
        if param.replace(' ', '') == 'float*':
            mangled += 'Pf'
        elif param.replace(' ', '') == 'int*':
            mangled += 'Pi'
        elif param.replace(' ', '') == 'int':
            mangled += 'i'
        elif param.replace(' ', '') == 'float':
            mangled += 'f'
        elif param.endswith('*'):
            # assume pointer to struct
            param = param.replace(' ', '').replace('*', '')
            mangled += 'P%s%s' % (len(param), param)
        else:
            raise Exception('not implemented %s' % param)
    return mangled


@pytest.fixture(scope='module')
def context():
    platforms = cl.get_platforms()
    i = 0
    ctx = None
    for platform in platforms:
        gpu_devices = platform.get_devices(device_type=cl.device_type.GPU)
        if gpu_idx < i + len(gpu_devices):
            ctx = cl.Context(devices=[gpu_devices[gpu_idx - i]])
            break
        i += len(gpu_devices)

    if ctx is None:
        raise Exception('unable to find gpu at index %s' % gpu_idx)
    print('context', ctx)
    # ctx = cl.create_some_context()
    return ctx


@pytest.fixture(scope='module')
def queue(context):
    q = cl.CommandQueue(context)
    return q


@pytest.fixture(scope='module')
def q(queue):
    return queue


@pytest.fixture(scope='module')
def ctx(context):
    return context


@pytest.fixture(scope='module')
def testcudakernel1(context):
    with open('examples/generated/testcudakernel1.cl', 'r') as f:
        sourcecode = f.read()

    prog = cl.Program(context, sourcecode).build()
    return prog


@pytest.fixture
def int_data():
    np.random.seed(123)
    int_data = np.random.randint(1024, size=(1024,), dtype=np.int32)
    return int_data


@pytest.fixture
def float_data():
    np.random.seed(124)
    float_data = np.random.randn(1024).astype(np.float32)
    return float_data


@pytest.fixture
def int_data_gpu(int_data, ctx):
    int_data_gpu = cl.Buffer(ctx, mf.READ_WRITE | mf.COPY_HOST_PTR, hostbuf=int_data)
    return int_data_gpu


@pytest.fixture
def float_data_gpu(float_data, ctx):
    float_data_gpu = cl.Buffer(ctx, mf.READ_WRITE | mf.COPY_HOST_PTR, hostbuf=float_data)
    return float_data_gpu


def test_program_compiles(testcudakernel1):
    pass


def test_foo(testcudakernel1, q, float_data, float_data_gpu):
    testcudakernel1.__getattr__(mangle('foo', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == 123


def test_copy_float(testcudakernel1, q, float_data, float_data_gpu):
    testcudakernel1.__getattr__(mangle('copy_float', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data[1]


def test_use_tid2(testcudakernel1, q, int_data, int_data_gpu):
    int_data_orig = np.copy(int_data)
    testcudakernel1.__getattr__(mangle('use_tid2', ['int *']))(q, (32,), (32,), int_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    assert int_data[0] == int_data_orig[0] + 0
    assert int_data[10] == int_data_orig[10] + 10
    assert int_data[31] == int_data_orig[31] + 31


def test_use_template1(testcudakernel1, q, int_data, int_data_gpu, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)
    int_data_orig = np.copy(int_data)

    testcudakernel1.__getattr__(mangle('use_template1', ['float *', 'int *']))(q, (32,), (32,), float_data_gpu, int_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    assert float_data[0] == float_data_orig[1] + float_data_orig[2]
    assert int_data[0] == int_data_orig[1] + int_data_orig[2]


def test_testFor(testcudakernel1, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)

    testcudakernel1.__getattr__(mangle('testFor', ['float *', 'int']))(q, (32,), (32,), float_data_gpu, np.int32(32))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert abs(float_data[0] - sum(float_data_orig[0:32])) < 1e-4


def test_ternary(testcudakernel1, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)

    def set_float_value(gpu_buffer, idx, value):
        testcudakernel1.__getattr__(mangle('setValue', ['float *', 'int', 'float']))(
            q, (32,), (32,), float_data_gpu, np.int32(idx), np.float32(value))

    set_float_value(float_data_gpu, 1, 10)
    testcudakernel1.__getattr__(mangle('testTernary', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data_orig[2]

    set_float_value(float_data_gpu, 1, -2)
    testcudakernel1.__getattr__(mangle('testTernary', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data_orig[3]


def test_structs(testcudakernel1, ctx, q, float_data, float_data_gpu, int_data, int_data_gpu):
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
    testcudakernel1.__getattr__(mangle('testStructs', ['MyStruct *', 'float *', 'int *']))(
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
