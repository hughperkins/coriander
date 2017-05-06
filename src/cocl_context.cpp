// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "cocl/cocl_context.h"

#include "cocl/hostside_opencl_funcs.h"
#include "cocl/cocl_streams.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>
#include "pthread.h"

// #include "CL/cl.h"

#include "EasyCL/EasyCL.h"

using namespace std;
using namespace cocl;
using namespace easycl;

namespace cocl {
    // int globalNumGpus = -1;

    static pthread_key_t key;
    static pthread_once_t key_once = PTHREAD_ONCE_INIT;

    pthread_mutex_t clcontextcreation_mutex = PTHREAD_MUTEX_INITIALIZER;

    static void make_key() {
        (void) pthread_key_create(&key, NULL);
    }
    // int getNumGpus() {
    //     if(globalNumGpus >= 0) {
    //         return globalNumGpus;
    //     }
    //     pthread_mutex_lock(&clcontextcreation_mutex);
    //     globalNumGpus = easycl::DevicesInfo::getNumGpus();
    //     pthread_mutex_unlock(&clcontextcreation_mutex);
    //     return globalNumGpus;
    // }
    Context::Context(int gpuOrdinal) : gpuOrdinal(gpuOrdinal) {
        COCL_PRINT(cout << "Context() " << this << endl);
        pthread_mutex_lock(&clcontextcreation_mutex);
        // int deviceId = getThreadVars()->currentDevice;
        // bool coclDevicesAll = false;
        // if(getenv("COCL_DEVICES_ALL")) {
        //     if(string(getenv("COCL_DEVICES_ALL")) == "1") {
        //         cout << "COCL_DEVICES_ALL=1 activated.  WARNING!  this is a maintainer option, and will likely not do anything useful for you ,and probably cause lots of errors."  << endl;
        //         coclDevicesAll = true;
        //     }
        // }
        // if(coclDevicesAll) {
        //     cl.reset(EasyCL::createForIndexedDevice(device));
        // } else {
        cocl::CoclDevice *coclDevice = cocl::getCoclDeviceByGpuOrdinal(gpuOrdinal);
        cl.reset(EasyCL::createForPlatformDeviceIds(coclDevice->platformId, coclDevice->deviceId));
            // cl.reset(EasyCL::createForIndexedGpu(deviceOrdinal));
        // }
        pthread_mutex_unlock(&clcontextcreation_mutex);
        default_stream.reset(new CoclStream(cl.get()));
    }
    Context::~Context() {
        COCL_PRINT(cout << "~Context() " << this << endl);
    }

    ContextMutex::ContextMutex(Context *context) : context(context) {
        // COCL_PRINT(cout << "locking context mutex " << (void *)getThreadVars() << endl);
        pthread_mutex_lock(&context->mutex);
        // COCL_PRINT(cout << "... got context mutex " << (void *)getThreadVars() << endl);
    }
    ContextMutex::~ContextMutex() {
        // COCL_PRINT(cout << "releasing mutex " << (void *)getThreadVars() << endl);
        pthread_mutex_unlock(&context->mutex);
    }

    ThreadVars::ThreadVars() {
        // currentContext = new Context();
    }
    ThreadVars::~ThreadVars() {
        // if()
    }
    Context *ThreadVars::getContext() {
        if(currentContext == 0) {
            COCL_PRINT(cout << "creating default context" << endl);
            currentContext = new Context(currentGpuOrdinal);
        }
        return currentContext;
    }

    // ThreadVars::currentContext = 0;

    ThreadVars *getThreadVars() {
        // cout << "getThreadVars()" << endl;
        pthread_once(&key_once, make_key);
        ThreadVars *threadVars = (ThreadVars *)pthread_getspecific(key);
        if(threadVars == 0) {
            threadVars = new ThreadVars();
            pthread_setspecific(key, threadVars);
        }
        return threadVars;
    }
}

// extern "C" {
//     size_t cuCtxSynchronize(void);
//     size_t cuCtxCreate_v2(char **pcontext, unsigned int flags, long long device);
//     size_t cuCtxGetCurrent(char **pcontext);
//     size_t cuCtxSetCurrent(char *context);
// }

size_t cuCtxGetDevice(CUdevice *pdevice) {
    COCL_PRINT(cout << "cuCtxGetDevice redirected" << endl);
    throw runtime_error("cuctxgetdevice not implemented");
    return 0;
}

size_t cuCtxSynchronize(void) {
    COCL_PRINT(cout << "cuCtxSynchronize redirected" << endl);
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    cl->finish();
    return 0;
}

size_t cuCtxGetCurrent(char **_ppContext) {
    Context **ppContext = (Context **)_ppContext;
    // cout << "cuCtxGetCurrent redirected" << endl;
    ThreadVars *threadVars = getThreadVars();
    *ppContext = threadVars->currentContext;
    // COCL_PRINT(cout << "cuCtxGetCurrent context=" << (void *)threadVars->currentContext << endl);
    return 0;
}

size_t cuCtxSetCurrent(char *_pContext) {
    // COCL_PRINT(cout << "cuCtxSetCurrent redirected context=" << (void *)_pContext << endl);
    Context *context = (Context *)_pContext;
    ThreadVars *threadVars = getThreadVars();
    threadVars->currentContext = context;
    return 0;
}

size_t cuCtxCreate (char **_ppContext, unsigned int flags, long long device) {
    COCL_PRINT(cout << "cuCtxCreate_v2 redirected device=" << device << " flags=" << flags << endl);
    Context **ppContext = (Context **)_ppContext;
    Context *newContext = new Context(device);
    ThreadVars *threadVars = getThreadVars();
    threadVars->currentContext = newContext;
    COCL_PRINT(cout << "cuCtxCreate_v2 new context=" << (void *)newContext << endl);
    *ppContext = newContext;
    return 0;
}

size_t cuCtxCreate_v2 (char **_ppContext, unsigned int flags, long long device) {
    return cuCtxCreate(_ppContext, flags, device);
}
