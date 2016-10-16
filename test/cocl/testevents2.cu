// tests cuEventCreate

#include <iostream>
#include <memory>

using namespace std;

#include <cuda.h>

__global__ void longKernel(float *data, int N, float value) {
    for(int i = 0; i < N; i++) {
        data[i] += value;
    }
}

int main(int argc, char *argv[]) {
    int N = 202400; // * 1024;

    float *hostfloats = new float[N];
    float *gpufloats;
    cudaMalloc(&gpufloats, N * sizeof(float));

    longKernel<<<dim3(102400 / 32, 1, 1), dim3(32, 1, 1)>>>(gpufloats, N, 3.0f);
    cout << "queued kernel x" << endl;

    CUevent event;
    cuEventCreate(&event, CU_EVENT_DISABLE_TIMING);
    CUstream stream;
    cuStreamCreate(&stream, 0);

    cout << "created event" << endl;

    cuEventRecord(event, stream);
    cout << "recoreded event" << endl;

    cout << "event finished? " << (cuEventQuery(event) == 0) << endl;

    cuEventSynchronize(event);
    cout << "synchronized event" << endl;

    cout << "event finished? " << (cuEventQuery(event) == 0) << endl;

    cuEventDestroy(event);
    cout << "destroyed event" << endl;

    // opencl:
    // clCreateUserEvent()   CL_EVENT_COMMAND_ EXECUTION_STATUS
    // clWaitForEvents(num_events, event_list);
    // clEnqueueMarkerWithWaitList
    // clGetEventInfo() 
    // clReleaseEvent

    // cuda:
    // cuEventCreate(CUEvent *, flags)
    // cuEventRecord(CUEvent, CUstream);  => puts into the stream
    // cuEventQuery(CUevent)
    // cuEventSynchronize(CUevent)
    // cuEventDestroy

    cout << "finished" << endl;

    cuStreamDestroy(stream);
    cuEventDestroy(event);
    cudaFree(gpufloats);

    return 0;
}
