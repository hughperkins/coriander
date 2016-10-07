"""
"""
import subprocess
import pyopencl as cl
import pytest


@pytest.mark.parametrize("cl_filepath", [
    "test/generated/struct_initializer-device.cl",
    "test/generated/phiaddressspace-device.cl",
    pytest.mark.xfail("test/generated/pointerpointer-device.cl")
])
def test_compile(context, cl_filepath):
    print(subprocess.check_output([
        'make',
        cl_filepath
    ]).decode('utf-8'))

    with open(cl_filepath, 'r') as f:
        sourcecode = f.read()

    cl.Program(context, sourcecode).build()
