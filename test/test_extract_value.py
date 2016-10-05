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


This needs CUDA_HOME defined, pointing to eg /usr/local/cuda-7.5
"""
import subprocess
import numpy as np
import pyopencl as cl
import pytest
import os
from os import path


gpu_idx = int(os.environ.get('TARGET_GPU', 0))

mf = cl.mem_flags

clang_path = 'clang++-3.8'


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
def extract_value_cl():
    # lets check it's compileable ll first, using llvm
    # cu_filepath = 'test/extract_value.cu'
    # ll_filepath = 'test/generated/extract_value.ll'
    ll_filepath = 'test/extract_value.ll'
    cl_filepath = 'test/generated/extract_value.cl'

    # cuda_home = os.environ.get('CUDA_HOME', '/usr/local/cuda-7.5')
    # print(subprocess.check_output([
    #     clang_path,
    #     '-I%s/include' % cuda_home,
    #     '-include', 'include/fake_funcs.h',
    #     cu_filepath,
    #     '--cuda-device-only',
    #     '-emit-llvm', '-S',
    #     '-o', ll_filepath
    # ]).decode('utf-8'))

    print(subprocess.check_output([
        clang_path,
        '-c', ll_filepath,
        '-O3',
        '-o', '/tmp/~foo'
    ]).decode('utf-8'))

    if not path.isdir('test/generated'):
        os.makedirs('test/generated')
    print(subprocess.check_output([
        'build/ir-to-opencl',
        '--debug',
        ll_filepath,
        cl_filepath
    ]).decode('utf-8'))
    return cl_filepath


@pytest.fixture(scope='module')
def extract_value(context, extract_value_cl):
    with open(extract_value_cl, 'r') as f:
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


def test_program_compiles(extract_value):
    pass


def test_copy_float(extract_value, q, float_data, float_data_gpu):
    extract_value.__getattr__(mangle('test_floats', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data[1]
