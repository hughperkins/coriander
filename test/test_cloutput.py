import numpy as np
import pyopencl as cl


def mangle(name, param_types):
    mangled = '_Z%s%s' % (len(name), name)
    for param in param_types:
        if param.replace(' ', '') == 'float*':
            mangled += 'Pf'
        if param.replace(' ', '') == 'int*':
            mangled += 'Pi'
    return mangled


def test_cloutput():
    gpu_idx = 0

    platforms = cl.get_platforms()
    i = 0
    for platform in platforms:
        gpu_devices = platform.get_devices(device_type=cl.device_type.GPU)
        if gpu_idx < i + len(gpu_devices):
            ctx = cl.Context(devices=[gpu_devices[gpu_idx - i]])
            break
        i += len(gpu_devices)

    print('context', ctx)
    # ctx = cl.create_some_context()
    q = cl.CommandQueue(ctx)

    mf = cl.mem_flags

    np.random.seed(123)
    int_data = np.random.randint(1024, size=(1024,), dtype=np.int32)
    int_data_res = np.random.randint(1024, size=(1024,), dtype=np.int32)
    float_data = np.random.randn(1024).astype(np.float32)
    float_data_res = np.random.randn(1024).astype(np.float32)

    float_data_gpu = cl.Buffer(ctx, mf.READ_WRITE | mf.COPY_HOST_PTR, hostbuf=float_data)
    int_data_gpu = cl.Buffer(ctx, mf.READ_WRITE | mf.COPY_HOST_PTR, hostbuf=int_data)

    with open('examples/testcudakernel1.cl', 'r') as f:
        sourcecode = f.read()

    prg = cl.Program(ctx, sourcecode).build()

    cl.enqueue_copy(q, float_data_gpu, float_data)
    prg.__getattr__(mangle('foo', ['float *']))(q, (32,), (32,), float_data_gpu)
    q.finish()
    cl.enqueue_copy(q, float_data_res, float_data_gpu)
    assert float_data_res[0] == 123

    cl.enqueue_copy(q, float_data_gpu, float_data)
    prg.__getattr__(mangle('copy_float', ['float *']))(q, (32,), (32,), float_data_gpu)
    q.finish()
    cl.enqueue_copy(q, float_data_res, float_data_gpu)
    assert float_data_res[0] == float_data[1]

    cl.enqueue_copy(q, int_data_gpu, int_data)
    prg.__getattr__(mangle('use_tid2', ['int *']))(q, (32,), (32,), int_data_gpu)
    cl.enqueue_copy(q, int_data_res, int_data_gpu)
    q.finish()
    assert int_data_res[0] == int_data[0] + 0
    assert int_data_res[10] == int_data[10] + 10
    assert int_data_res[31] == int_data[31] + 31

    cl.enqueue_copy(q, float_data_gpu, float_data)
    cl.enqueue_copy(q, int_data_gpu, int_data)
    prg.__getattr__(mangle('use_template1', ['float *', 'int *']))(q, (32,), (32,), float_data_gpu, int_data_gpu)
    cl.enqueue_copy(q, float_data_res, float_data_gpu)
    cl.enqueue_copy(q, int_data_res, int_data_gpu)
    q.finish()

    assert float_data_res[0] == float_data[1] + float_data[2]
    assert int_data_res[0] == int_data[1] + int_data[2]
