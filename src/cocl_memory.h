#pragma once

#include "CL/cl.h"

namespace cocl {
    enum MemoryType {
        Pinned,
        Device
    };

    class Memory {
    protected:
        Memory(cl_mem clmem, size_t bytes, MemoryType type);

     public:
        static Memory *newPinned(size_t bytes);
        static Memory *newDeviceAlloc(size_t bytes);
        ~Memory();
        void *map();
        void unmap();
        bool needsMap() {
            return type == Pinned;
        }

        cl_mem clmem; // this is assumed to always be valid
        size_t bytes; // should always be valid (ideally > 0...)
        void *hostPointer; // will point to memory area for pinned, otherwise to this object
        MemoryType type;
    };

    typedef Memory *PMemory;
}
