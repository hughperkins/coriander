"""
For now, test it compiles (which it wont...)
"""

import subprocess
import pyopencl as cl
import pytest


@pytest.fixture(scope='module')
def extract_value_cl():
    # ll_filepath = 'tensorflow/generated/cwise_op_gpu_add-deviceside.ll'
    cl_filepath = 'tensorflow/generated/cwise_op_gpu_add-deviceside.cl'

    print(subprocess.check_output([
        'make',
        cl_filepath
    ]).decode('utf-8'))

    # if not path.isdir('tensorflow/generated'):
    #     os.makedirs('tensorflow/generated')
    # if not path.isfile(cl_filepath) or path.getctime(ll_filepath) > path.getctime(cl_filepath):
    #     print(subprocess.check_output([
    #         'build/ir-to-opencl',
    #         ll_filepath,
    #         cl_filepath
    #     ]).decode('utf-8'))
    return cl_filepath


@pytest.fixture(scope='module')
def cwise_op_gpu_add(context, extract_value_cl):
    with open(extract_value_cl, 'r') as f:
        sourcecode = f.read()

    prog = cl.Program(context, sourcecode).build()
    return prog


@pytest.mark.xfail
def test_program_compiles(cwise_op_gpu_add):
    pass
