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
def test_local_cl():
    cl_filepath = 'test/generated/test_local-device.cl'

    # print(subprocess.check_output([
    #     'make',
    #     cl_filepath
    # ]).decode('utf-8'))
    print(subprocess.check_output([
        'cocl', '-c', '-o', 'test/generated/test_local.o',
        'test/test_local.cu'
    ]).decode('utf-8'))
    return cl_filepath


@pytest.fixture(scope='module')
def test_local(context, test_local_cl):
    with open(test_local_cl, 'r') as f:
        sourcecode = f.read()

    prog = cl.Program(context, sourcecode).build()
    return prog


def test_program_compiles(test_local):
    pass
