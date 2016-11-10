import os
import subprocess
import numpy as np


clang_path = 'clang++-3.8'


# partial read/write seem not implemented in the version of pyopencl I have
# logged an issue at https://github.com/pyopencl/pyopencl/issues/153
def enqueue_write_buffer_ext(cl, queue, mem, hostbuf, device_offset=0, size=None,
                             wait_for=None, is_blocking=True):
    ptr_event = cl.cffi_cl._ffi.new('clobj_t*')
    c_buf, actual_size, c_ref = cl.cffi_cl._c_buffer_from_obj(hostbuf, retain=True)
    if size is None:
        size = actual_size
    c_wait_for, num_wait_for = cl.cffi_cl._clobj_list(wait_for)
    nanny_event = cl.cffi_cl.NannyEvent._handle(hostbuf, c_ref)
    cl.cffi_cl._handle_error(cl.cffi_cl._lib.enqueue_write_buffer(
        ptr_event, queue.ptr, mem.ptr, c_buf, size, device_offset, c_wait_for, num_wait_for, bool(True),
        nanny_event))
    return cl.cffi_cl.NannyEvent._create(ptr_event[0])


def enqueue_read_buffer_ext(cl, queue, mem, hostbuf, device_offset=0, size=None,
                            wait_for=None, is_blocking=True):
    ptr_event = cl.cffi_cl._ffi.new('clobj_t*')
    c_buf, actual_size, c_ref = cl.cffi_cl._c_buffer_from_obj(hostbuf, retain=True)
    if size is None:
        size = actual_size
    c_wait_for, num_wait_for = cl.cffi_cl._clobj_list(wait_for)
    nanny_event = cl.cffi_cl.NannyEvent._handle(hostbuf, c_ref)
    cl.cffi_cl._handle_error(cl.cffi_cl._lib.enqueue_read_buffer(
        ptr_event, queue.ptr, mem.ptr, c_buf, size, device_offset, c_wait_for, num_wait_for, bool(True),
        nanny_event))
    return cl.cffi_cl.NannyEvent._create(ptr_event[0])


def cocl_options():
    options = []
    # if os.environ.get('COCL_BRANCHES_AS_SWITCH', '0') != '0':
    #     options.append('--branches_as_switch')

    # if os.environ.get('COCL_RUN_TRANSFORMS', '0') != '0':
    #     options.append('--run_transforms')

    options = os.environ.get('COCL_OPTIONS', '').split()

    print('options', options)
    return options


def offset_type(offset):
    if 'OFFSET_32BIT' in os.environ:
        return np.uint32(offset)
    return np.int64(offset)


def mangle(name, param_types):
    mangled = '_Z%s%s' % (len(name), name)
    for param in param_types:
        if param.replace(' ', '') == 'float*':
            mangled += 'Pf'
        elif param.replace(' ', '') == 'double*':
            mangled += 'Pd'
        elif param.replace(' ', '') == 'int*':
            mangled += 'Pi'
        elif param.replace(' ', '') == 'int':
            mangled += 'i'
        elif param.replace(' ', '') == 'long':
            mangled += 'l'
        elif param.replace(' ', '') == 'float':
            mangled += 'f'
        elif param.endswith('*'):
            # assume pointer to struct
            param = param.replace(' ', '').replace('*', '')
            mangled += 'P%s%s' % (len(param), param)
        else:
            raise Exception('not implemented %s' % param)
    return mangled


def compile_code(cl, context, kernelSource):
    for file in os.listdir('/tmp'):
        if file.startswith('testprog'):
            os.unlink('/tmp/%s' % file)
    with open('/tmp/testprog.cu', 'w') as f:
        f.write(kernelSource)
    # args = get_cl_generation_options()
    # if not branching_transformations:
    #     args.append('--no_branching_transforms')
    res = subprocess.run([
        'bin/cocl',
        '-c',
        '/tmp/testprog.cu'
    ] + cocl_options(), stdout=subprocess.PIPE)
    print(' '.join(res.args))
    print(res.stdout.decode('utf-8'))
    assert res.returncode == 0
    with open('/tmp/testprog-device.cl', 'r') as f:
        cl_sourcecode = f.read()
    prog = cl.Program(context, cl_sourcecode).build()
    return prog


def compile_code_v2(cl, context, kernelSource):
    """
    returns dict
    """
    for file in os.listdir('/tmp'):
        if file.startswith('testprog'):
            os.unlink('/tmp/%s' % file)
    with open('/tmp/testprog.cu', 'w') as f:
        f.write(kernelSource)
    res = subprocess.run([
        'bin/cocl',
        '-c',
        '/tmp/testprog.cu'
    ] + cocl_options(), stdout=subprocess.PIPE)
    print(' '.join(res.args))
    print(res.stdout.decode('utf-8'))
    assert res.returncode == 0
    with open('/tmp/testprog-device.cl', 'r') as f:
        cl_sourcecode = f.read()
    prog = cl.Program(context, cl_sourcecode).build()
    return {'prog': prog, 'cl_sourcecode': cl_sourcecode}
