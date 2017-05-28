// Copyright Hugh Perkins 2016, 2017

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

#include "EasyCL/EasyCL.h"

using namespace std;
using namespace cocl;
using namespace easycl;

#undef COCL_PRINT
#define COCL_PRINT(x)

#define OFFSETS_32BIT_ENV_VAR "COCL_OFFSETS_32BIT"

namespace cocl {
    static pthread_key_t key;
    static pthread_once_t key_once = PTHREAD_ONCE_INIT;

    pthread_mutex_t clcontextcreation_mutex = PTHREAD_MUTEX_INITIALIZER;

    static void make_key() {
        (void) pthread_key_create(&key, NULL);
    }
    Context::Context(int gpuOrdinal) : gpuOrdinal(gpuOrdinal) {
        COCL_PRINT(cout << "Context() " << this << endl);
        pthread_mutex_lock(&clcontextcreation_mutex);
        cocl::CoclDevice *coclDevice = cocl::getCoclDeviceByGpuOrdinal(gpuOrdinal);
        cl.reset(EasyCL::createForPlatformDeviceIds(coclDevice->platformId, coclDevice->deviceId));
        pthread_mutex_unlock(&clcontextcreation_mutex);
        default_stream.reset(new CoclStream(cl.get()));
    }
    Context::~Context() {
        COCL_PRINT(cout << "~Context() " << this << endl);
    }

    ContextMutex::ContextMutex(Context *context) : context(context) {
        pthread_mutex_lock(&context->mutex);
    }
    ContextMutex::~ContextMutex() {
        pthread_mutex_unlock(&context->mutex);
    }

    ThreadVars::ThreadVars() {
        if(getenv(OFFSETS_32BIT_ENV_VAR) != 0) {
            if(string(getenv(OFFSETS_32BIT_ENV_VAR)) == "1") {
                cout << OFFSETS_32BIT_ENV_VAR << " enabled" << endl;
                this->offsets_32bit = true;
            }
        }
    }
    ThreadVars::~ThreadVars() {
    }
    Context *ThreadVars::getContext() {
        if(currentContext == 0) {
            COCL_PRINT(cout << "creating default context" << endl);
            currentContext = new Context(currentGpuOrdinal);
        }
        return currentContext;
    }

    ThreadVars *getThreadVars() {
        pthread_once(&key_once, make_key);
        ThreadVars *threadVars = (ThreadVars *)pthread_getspecific(key);
        if(threadVars == 0) {
            threadVars = new ThreadVars();
            pthread_setspecific(key, threadVars);
        }
        return threadVars;
    }
}

size_t cuCtxGetDevice(CUdevice *pdevice) {
    COCL_PRINT(cout << "cuCtxGetDevice" << endl);
    throw runtime_error("cuctxgetdevice not implemented");
    return 0;
}

size_t cuCtxSynchronize(void) {
    COCL_PRINT(cout << "cuCtxSynchronize" << endl);
    ThreadVars *v = getThreadVars();
    EasyCL *cl = v->getContext()->getCl();
    cl->finish();
    return 0;
}

size_t cuCtxGetCurrent(char **_ppContext) {
    Context **ppContext = (Context **)_ppContext;
    ThreadVars *threadVars = getThreadVars();
    *ppContext = threadVars->currentContext;
    COCL_PRINT(cout << "cuCtxGetCurrent context=" << (void *)threadVars->currentContext << endl);
    return 0;
}

size_t cuCtxSetCurrent(char *_pContext) {
    COCL_PRINT(cout << "cuCtxSetCurrent context=" << (void *)_pContext << endl);
    Context *context = (Context *)_pContext;
    ThreadVars *threadVars = getThreadVars();
    threadVars->currentContext = context;
    return 0;
}

size_t cuCtxCreate (char **_ppContext, unsigned int flags, long long device) {
    COCL_PRINT(cout << "cuCtxCreate_v2 device=" << device << " flags=" << flags << endl);
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
