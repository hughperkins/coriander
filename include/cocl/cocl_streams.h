#pragma once

// #include "EasyCL.h"
#include "cocl_events.h"
#include "pthread.h"

extern "C" {
    size_t cuStreamCreate(char **pqueue, unsigned int flags);
    size_t cudaStreamSynchronize(char *pqueue);
    size_t cuStreamQuery(char *stream);

    size_t cuStreamDestroy_v2(char *queue);
    size_t cuStreamSynchronize(char *queue);
    size_t cuStreamWaitEvent(char *queue, cocl::Event *event, unsigned int flags);

    size_t cudaStreamQuery(char *stream);

    typedef void (*cudacallbacktype)(char *stream, size_t status, void*userdata);
    size_t cudaStreamAddCallback(char *stream, cudacallbacktype callback, void *userdata, int flags);
}

typedef char * cudaStream_t;
typedef void (*cudacallbacktype)(char *stream, size_t status, void*userdata);

namespace easycl {
    class EasyCL;
    class CLQueue;
}

namespace cocl {
    class CoclCallbackInfo {
    public:
        cudacallbacktype callback;
        void *userdata;
        char *_queue;
    };
    void coclCallback(cl_event event, cl_int status, void *userdata);

    // a coclstream:
    // - is associated with one virtual cuda stream, from the point of view of the client
    // - is associated with exactly one opencl queue
    // - has a lock associated with it, so if there are more than one thread using it, they're method calls
    //   will run sequentially, not in parallel
    class CoclStream {
    public:
        CoclStream(easycl::EasyCL *cl);
        ~CoclStream();
        easycl::CLQueue *clqueue;
        // pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    };
    // class StreamLock {
    // public:
    //     StreamLock(CoclStream *stream);
    //     ~StreamLock();
    //     CoclStream *stream;
    // };
}
