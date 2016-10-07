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
import pyopencl as cl
import pytest
import os
from os import path
from test import test_common


@pytest.fixture(scope='module')
def union_cl():
    # lets check it's compileable ll first, using llvm
    ll_filepath = 'test/union-device.ll'
    cl_filepath = 'test/generated/union-device.cl'

    print(subprocess.check_output([
        test_common.clang_path,
        '-c', ll_filepath,
        '-O3',
        '-o', '/tmp/~foo'
    ]).decode('utf-8'))

    print(subprocess.check_output([
        'make',
        'build/ir-to-opencl',
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
def union(context, union_cl):
    with open(union_cl, 'r') as f:
        sourcecode = f.read()

    prog = cl.Program(context, sourcecode).build()
    return prog


def test_program_compiles(union):
    pass
