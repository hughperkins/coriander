import pytest
from test import test_common


test_definitions = {
    "test/struct_initializer.cu": ['somekernel', 'somekernel2', 'getFooValue', 'getBarValue'],
    "test/phiaddressspace.cu": ['mykernel'],
    "test/test_local.cu": ['testLocal', 'testLocal2'],
    "test/pointerpointer.cu": ['mykernel', 'myte6kernel']
}


def get_test_definitions():
    tests = []
    for filepath, kernelnames in test_definitions.items():
        for kernelname in kernelnames:
            test = (filepath, kernelname)
            if 'struct' in filepath:
                print('marking xfail')
                test = pytest.mark.xfail(reason='need global constants')(test)
            tests.append(test)
    return tests


@pytest.mark.parametrize("cu_filepath,kernelname", get_test_definitions())
def test_compile(context, cu_filepath, kernelname):
    with open(cu_filepath, 'r') as f:
        cu_code = f.read()

    try:
        cl_code = test_common.cu_to_cl(cu_code, '')
    except:
        pass

    with open('/tmp/testprog-device.ll') as f:
        ll_code = f.read()

    for line in ll_code.split('\n'):
        if line.startswith('define') and kernelname in line:
            mangledname = line.split('@')[1].split('(')[0]
            break

    print('mangledname', mangledname)

    cl_code = test_common.cu_to_cl(cu_code, mangledname)

    test_common.build_kernel(context, cl_code, mangledname[:31])


def test_no_pointer_struct_ointer(context):
    with open("test/pointerpointer.cu", 'r') as f:
        cu_code = f.read()

    cl_code = test_common.cu_to_cl(cu_code, '_Z11myte6kernelP16TensorEvaluator6PfP9GpuDeviceiii')
    kernel_line = None
    for line in cl_code.split('\n'):
        if line.startswith('kernel'):
            kernel_line = line
    assert kernel_line is not None
    assert 'class_GpuDevice_nopointers' in kernel_line
