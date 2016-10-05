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
def test_classes_cl():
    cl_filepath = 'test/generated/test_classes-device.cl'

    print('running make...')
    print(subprocess.check_output([
        'make',
        cl_filepath
    ]).decode('utf-8'))
    print('... make finished')
    return cl_filepath


def test_build_cl(test_classes_cl):
    pass


@pytest.fixture(scope='module')
def test_classes(context, test_classes_cl):
    with open(test_classes_cl, 'r') as f:
        sourcecode = f.read()

    prog = cl.Program(context, sourcecode).build()
    return prog


def test_program_compiles(test_classes):
    pass
