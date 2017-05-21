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
def dotdotdot_cl():
    # lets check it's compileable ll first, using llvm
    ll_filepath = 'test/dotdotdot.ll'

    with open(ll_filepath, 'r') as f:
        ll_sourcecode = f.read()

    kernelName = test_common.mangle('test_si', ['float *'])
    cl_sourcecode = test_common.ll_to_cl(ll_sourcecode, kernelName, num_clmems=1)
    print('cl_sourcecode', cl_sourcecode)
    return cl_sourcecode

    # cl_filepath = 'test/generated/dotdotdot.cl'

    # print(subprocess.check_output([
    #     test_common.clang_path,
    #     '-c', ll_filepath,
    #     '-O3',
    #     '-o', '/tmp/~foo'
    # ]).decode('utf-8'))

    # if not path.isdir('test/generated'):
    #     os.makedirs('test/generated')
    # print(subprocess.check_output([
    #     'build/ir-to-opencl',
    #     # '--debug',
    #     '--inputfile', ll_filepath,
    #     '--outputfile', cl_filepath,
    #     '--kernelname', '_Z7test_siPf'
    # ]).decode('utf-8'))
    # return cl_filepath


@pytest.fixture(scope='module')
def dotdotdot(context, dotdotdot_cl):
    kernelName = test_common.mangle('test_si', ['float *'])
    kernel = test_common.build_kernel(context, dotdotdot_cl, kernelName)
    return kernel


def test_program_compiles(dotdotdot):
    pass


# def test_copy_float(extract_value, q, float_data, float_data_gpu):
#     extract_value.__getattr__(test_common.mangle('test_floats', ['float *']))(q, (32,), (32,), float_data_gpu)
#     cl.enqueue_copy(q, float_data, float_data_gpu)
#     q.finish()
#     assert float_data[0] == float_data[1]
