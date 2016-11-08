"""
Tests the crash dump on error, makes sure we get the ll, cl, and meta
"""
import os
from os import path
import subprocess
from test import test_common
import pytest


@pytest.mark.xfail(reason='since we always rebuild all now, this no longer is implemented to fail correclty')
def test_crashdump():
    """
    So, what we need to do is:
    - use cocl to create a hostraw file (and other files besides, but we'll overwrite them)
    - overwrite the -device.cl file with some broken stuff
    - similar for the -device.ll, so it's easier to read
    - rerun cocl, to create the binary
    - run the binary
    - check dumpfiles are created
    """
    cu_sourcecode = """
__global__ void mykernel(float *data) {
}
int main(int argc, char *argv[]) {
    mykernel<<<dim3(1,1,1), dim3(32,1,1)>>>(0);
    return 0;
}
"""
    with open('/tmp/crashdump.cu', 'w') as f:
        f.write(cu_sourcecode)
    print(subprocess.check_output([
        'bin/cocl',
        '/tmp/crashdump.cu'
    ] + test_common.cocl_options()).decode('utf-8'))
    for file in ['failed-kernel.cl', 'failed-kernel.ll', 'failed-kernel-meta.txt']:
        if path.isfile('/tmp/%s' % file):
            os.unlink('/tmp/%s' % file)
    with open('/tmp/crashdump-device.ll', 'w') as f:
        f.write('my pretend ll file contents')
    with open('/tmp/crashdump-device.cl', 'w') as f:
        f.write('my pretend cl file contents.  this will certainly crash :-P')
    print(subprocess.check_output([
        'bin/cocl',
        '/tmp/crashdump.cu'
    ] + test_common.cocl_options()).decode('utf-8'))
    threw = False
    try:
        print(subprocess.check_output([
            '/tmp/crashdump'
        ]).decode('utf-8'))
    except:
        threw = True
    assert threw
    with open('/tmp/failed-kernel.ll', 'r') as f:
        llfile = f.read()
    with open('/tmp/failed-kernel.cl', 'r') as f:
        clfile = f.read()
    with open('/tmp/failed-kernel-meta.txt', 'r') as f:
        meta = f.read()
    print('ll:\n[%s]' % llfile)
    print('cl:\n[%s]' % clfile)
    print('meta:\n[%s]' % meta)
