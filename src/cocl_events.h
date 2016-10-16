#include "CL/cl.h"

namespace cocl {
    class Event {
        // since cuda creates events then records them, but opencl doesnt create events until
        // the time of 'record', and the cuda client already has a pointer to the event, before record is called,
        // so we will create our own object to interface between these two behaviors
        // we'll send a CoclEvent to the client, and tell them its a CUevent object. approximately
    public:
        Event();
        ~Event();
        cl_event event = 0;
    };
}
