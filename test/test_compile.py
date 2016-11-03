"""
"""
import subprocess
import pyopencl as cl
import pytest


@pytest.mark.parametrize("cl_filepath", [
    "test/generated/struct_initializer-device.cl",
    "test/generated/phiaddressspace-device.cl",
    # pytest.mark.xfail("test/generated/pointerpointer-device.cl"),
    # pytest.mark.xfail("test/eigen/generated/test_cuda_elementwise_small-device.cl"),
    # "test/eigen/generated/test_cuda_nullary-device.cl",
    # "test/eigen/generated/cxx11_tensor_cuda-device.cl"
])
def test_compile(context, cl_filepath):
    # print(subprocess.check_output([
    #     'make',
    #     cl_filepath
    # ]).decode('utf-8'))

    print(subprocess.check_output([
        'bin/cocl', '-c', '-o', cl_filepath.replace('-device.cl', '.o'),
        cl_filepath.replace('/generated', '').replace('-device.cl', '.cu')
    ]).decode('utf-8'))

    with open(cl_filepath, 'r') as f:
        sourcecode = f.read()

    print('compiling cl for %s ...' % cl_filepath)
    cl.Program(context, sourcecode).build()
    print('  ... %s compiled ok' % cl_filepath)
