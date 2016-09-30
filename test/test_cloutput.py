import numpy as np
import pyopencl as cl


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
    int_data = np.random.randint(1024, size=(1024,), dtype=np.int32)
    float_data = np.random.randn(1024).astype(np.float32)

    float_data_gpu = cl.Buffer(ctx, mf.READ_WRITE | mf.COPY_HOST_PTR, hostbuf=float_data)
    int_data_gpu = cl.Buffer(ctx, mf.READ_WRITE | mf.COPY_HOST_PTR, hostbuf=int_data)

    with open('examples/testcudakernel1.cl', 'r') as f:
        sourcecode = f.read()

    prg = cl.Program(ctx, sourcecode).build()

    prg.bar(q, (32,), 3, 5)
    q.finish()
