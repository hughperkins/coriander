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


/*

What this does / how this works
===============================

The input to this module is hostside llvm ir code, probably from a *-hostraw.ll file. This file contains
calls to NVIDIA® CUDA™ kernel launch commands, such as cudaSetupArgument. What we are going to do is
to re-route these into the CUDA-on-CL runtime, performing any appropriate transformations first.

We can receive, amongst other things, arguments such as:
- int32
- int8
- float
- float *
- int32 *
- struct SomeStruct
- struct SomeStruct *
- a struct, containing pointers...

How these are going to be handled. So, in all cases, what we are going to do is to patch into the LLVM IR code
calls to methods in hostside_opencl_funcs.cpp. Then, depending on the type, we're going to handle the value in the IR
code slightly differently:

- int32, int8, float, any primitives basically:
  - a call to one of the methods such as setKernelArgInt64 or setKernelArgFloat will be added to the bytecode
    - the actual value of the primitive will be directly passed, as a parameter in this method
    - we do need a slight hack to get this value, since the original cudaSetupArgument method will pass a pointer, whereas
      we are going to pass the underlying value
    - we get the underlying value by hunting for the upstream alloca

Note: I've moved this to a class, to force me to declare all the methods here :-)  It's a stateless class though, everything
is static :-)

Ok, so the doc is mostly below, inside the class declaration, at the bottom of this file. So go there now :-)

*/

#pragma once

#include "struct_clone.h"

#include <string>
#include <vector>
#include <memory>

#include "llvm/IR/Module.h"
// #include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
// #include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Instructions.h"

namespace cocl {

class LaunchCallInfo {
public:
    LaunchCallInfo() {
        grid_xy_value = 0;
        grid_z_value = 0;
        block_xy_value = 0;
        block_z_value = 0;
    }
    std::string kernelName = "";
    std::vector<llvm::Type *> callTypes;
    std::vector<llvm::Value *> callValuesByValue;
    std::vector<llvm::Value *> callValuesAsPointers;
    llvm::Value *stream;
    llvm::Value *grid_xy_value;
    llvm::Value *grid_z_value;
    llvm::Value *block_xy_value;
    llvm::Value *block_z_value;
};

class GenericCallInst {
    // its children can hold a CallInst or an InvokeInst
    // These instructions do almost the same thing, but their methods are not on a common
    // base/interface class. So, we wrap them here, provide such a common base/interface class
public:
    // GenericCallInst() {}
    virtual ~GenericCallInst() {}
    // The following methods create specialized GenericCallInst methods, encapsulating an InvokeInst
    // or a CallInst
    static std::unique_ptr<GenericCallInst> create(llvm::InvokeInst *inst);
    static std::unique_ptr<GenericCallInst> create(llvm::CallInst *inst);
    virtual llvm::Value *getArgOperand(int idx) = 0;
    virtual llvm::Value *getOperand(int idx) = 0;
    virtual llvm::Module *getModule() = 0;
    virtual llvm::Instruction *getInst() = 0;
    virtual void dump() = 0;
};
std::ostream &operator<<(std::ostream &os, const LaunchCallInfo &info);
std::ostream &operator<<(std::ostream &os, const PointerInfo &pointerInfo);

class GenericCallInst_Call : public GenericCallInst {
public:
    GenericCallInst_Call(llvm::CallInst *inst) : inst(inst) {}
    llvm::CallInst *inst;
    virtual llvm::Value *getArgOperand(int idx) override { return inst->getArgOperand(idx); }
    virtual llvm::Value *getOperand(int idx) override { return inst->getArgOperand(idx); }
    virtual llvm::Module *getModule() override { return inst->getModule(); }
    virtual llvm::Instruction *getInst() override { return inst; }
    virtual void dump() override { inst->dump(); }
};

class GenericCallInst_Invoke : public GenericCallInst {
public:
    GenericCallInst_Invoke(llvm::InvokeInst *inst) : inst(inst) {}
    llvm::InvokeInst *inst;
    virtual llvm::Value *getArgOperand(int idx) override { return inst->getArgOperand(idx); }
    virtual llvm::Value *getOperand(int idx) override { return inst->getArgOperand(idx); }
    virtual llvm::Module *getModule() override { return inst->getModule(); }
    virtual llvm::Instruction *getInst() override { return inst; }
    virtual void dump() override { inst->dump(); }
};

class PatchHostside {
public:
    // returns path without the directory name (I think). this should go into some utiity class really...
    static std::string getBasename(std::string path); 

    static void getLaunchTypes(GenericCallInst *inst, LaunchCallInfo *info);
    static void getLaunchArgValue(GenericCallInst *inst, LaunchCallInfo *info);

    // handle primitive ints and floats (not arrays):
    static llvm::Instruction *addSetKernelArgInst_int(llvm::Instruction *lastInst, llvm::Value *value, llvm::IntegerType *intType);
    static llvm::Instruction *addSetKernelArgInst_float(llvm::Instruction *lastInst, llvm::Value *value);

    // handle generic pointers.  This will arrive in hostside_opencl_funcs at runtime, as a pointer to char,
    // containing a virtual memory pointer (possibly with an offset added)
    // the corresponding hostside_opencl_funcs method will:
    // - look up the virtual mem, to get cl_mem object, and offset
    // - check if it's already received a cl_mem, and if not add it to the list of cl_mems to send to the kernel
    // - record the index number of this cl_mem, into the list of distinct/unique cl_mems
    //
    // The corresponding kernel parameters for this will be:
    // - there will be a cl_mem pointer added, if this cl_mem hasnt already been received at least once
    // - an offset integer parameter will be added
    //
    // the corresponding hostside_opencl_funcs method is:
    //    setKernelArgGpuBuffer(char *memory_as_charstar, int32_t elementSize)
    //
    // The hostside_opencl_funcs method needs no information other than the (virtual) pointer really
    // currently we are providing the elementsize too, to mitigate against a crash on beignet, but I might
    // remove that, whilst I get Mac radeon working :-P (since structs might not have useful element sizes)
    static llvm::Instruction *addSetKernelArgInst_pointer(llvm::Instruction *lastInst, llvm::Value *value);

    // this will add bytecode to pass a pointer to the cpu-side struct object to hostside_opencl_funcs, at runtime
    // the entry point into hostside_opencl_funcs will be:
    //     setKernelArgHostsideBuffer(char *pCpuStruct, int structAllocateSize)
    //
    // The hostside_opencl_funcs method setKernelArgHostsideBuffer expects to receive a host-side allocated struct/buffer
    // setKernelArgHostsideBuffer will:
    // - allocate a gpu buffer
    // - queue an opencl command, to copy the host-side struct into the gpu buffer
    // - add the clmem, and a zero-offset, to the list of kernel parameters
    //
    // Note that the setKernelArgHostsideBuffer method needs no information on the structure of the struct
    //
    // this patch_hostside addSetKernelArgInst_byvaluestruct function is going to handle walking the struct, and sending
    // the other pointers through using additional method calls, likely to setKernelArgGpuBuffer
    static llvm::Instruction *addSetKernelArgInst_byvaluestruct(llvm::Instruction *lastInst, llvm::Value *valueAsPointerInstr);

    // this needs to do the same as addSetKernelArgInst_byvaluestruct , but it passes the struct pointer into the
    // setKernelArgGpuBuffer function, rather than the setKernelArgHostsideBuffer
    // but it still needs to walk the struct, at patching time, compile time, and add calls to pass any pointers
    // in the struct through too
    // hmmmm. actually. I think we'll forbid pointers in gpuside structs for now. unless we have to
    // why? because, how are we going to get those pointers, if they're stored on the gpu :-P
    // like, how are we going to clone it, first issue.  Possible to to do, but a bunch of work, unless we have to
    static llvm::Instruction *addSetKernelArgInst_pointerstruct(llvm::Instruction *lastInst, llvm::Value *structPointer);

    // all setKernelArgs pass through addSetKernelArgInst, which dispatches to other functions
    static llvm::Instruction *addSetKernelArgInst(llvm::Instruction *lastInst, llvm::Value *value, llvm::Value *valueAsPointerInstr);

    static void patchCudaLaunch(llvm::Function *F, GenericCallInst *inst, std::vector<llvm::Instruction *> &to_replace_with_zero);
    static void patchFunction(llvm::Function *F);  // patch all kernel launch commands in function F
    static void patchModule(llvm::Module *M);  // main entry point. Scan through module M, and rewrite kernel launch commands
};

} // namespace cocl
