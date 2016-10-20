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
import subprocess
import pyopencl as cl
import pytest
import os
from os import path
from test import test_common


@pytest.fixture(scope='module')
def extract_value_cl():
    # lets check it's compileable ll first, using llvm
    # cu_filepath = 'test/extract_value.cu'
    # ll_filepath = 'test/generated/extract_value.ll'
    ll_filepath = 'test/extract_value.ll'
    cl_filepath = 'test/generated/extract_value.cl'

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
        test_common.clang_path,
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


def test_program_compiles(extract_value):
    pass


def test_copy_float(extract_value, q, float_data, float_data_gpu):
    extract_value.__getattr__(test_common.mangle('test_floats', ['float *']))(q, (32,), (32,), float_data_gpu)
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data[1]
