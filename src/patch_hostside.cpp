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

// For doc, please see the corresponding include file, patch_hostside.h

#include "patch_hostside.h"

#include "cocl_logging.h"

#include "mutations.h"
#include "struct_clone.h"
// #include "ir-to-opencl-common.h"
#include "argparsecpp.h"
#include "type_dumper.h"
#include "GlobalNames.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"

#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
// #include "llvm/IR/IRBuilder.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_os_ostream.h"

#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include <cstdio>
#include <cstdlib>
#include <vector>
#include <map>
#include <set>
#include <stdexcept>
#include <memory>
#include <sstream>
#include <fstream>

using namespace llvm;
using namespace std;
using namespace cocl;

namespace cocl {

static llvm::LLVMContext context;
// static std::string sourcecode_stringname;
static std::string devicellcode_stringname;
static string devicellfilename;

static GlobalNames globalNames;
static TypeDumper typeDumper(&globalNames);
static StructCloner structCloner(&typeDumper, &globalNames);

// static string deviceclfilename;
// static string clfilenamesimple;

// bool single_precision = true;

// this should probably be more of an instance variable probably?
static std::unique_ptr<LaunchCallInfo> launchCallInfo(new LaunchCallInfo);

std::unique_ptr<GenericCallInst> GenericCallInst::create(llvm::InvokeInst *inst) {
    return unique_ptr<GenericCallInst>(new GenericCallInst_Invoke(inst));
}
std::unique_ptr<GenericCallInst> GenericCallInst::create(llvm::CallInst *inst) {
    return unique_ptr<GenericCallInst>(new GenericCallInst_Call(inst));
}

std::ostream &operator<<(std::ostream &os, const LaunchCallInfo &info) {
    raw_os_ostream my_raw_os_ostream(os);
    my_raw_os_ostream << "LaunchCallInfo " << info.kernelName;
    my_raw_os_ostream << "<<<";

    my_raw_os_ostream << ">>>";
    my_raw_os_ostream << "(";
    int i = 0;
    // for(auto it=info.callTypes.begin(); it != info.callTypes.end(); it++) {
    for(auto it=info.params.begin(); it != info.params.end(); it++) {
        if(i > 0){
            my_raw_os_ostream << ", ";
        }
        ParamInfo paramInfo = *it;
        // Type *type = *it;
        paramInfo.type->print(my_raw_os_ostream);
        i++;
    }
    my_raw_os_ostream << ");\n";
    my_raw_os_ostream << "value types: ";
    i = 0;
    for(auto it=info.params.begin(); it != info.params.end(); it++) {
    // for(auto it=info.callValuesByValue.begin(); it != info.callValuesByValue.end(); it++) {
        ParamInfo paramInfo = *it;
        Value *value = paramInfo.value;
        // Value *value = *it;
        if(i > 0) {
            my_raw_os_ostream << ", ";
        }
        my_raw_os_ostream << typeDumper.dumpType(value->getType());
        i ++;
    }
    return os;
}

void PatchHostside::getLaunchTypes(GenericCallInst *inst, LaunchCallInfo *info) {
    // input to this is a cudaLaunch instruction
    // sideeffect is to populate in info:
    // - name of the kernel
    // - type of each of the kernel parameters (without the actual Value's)
    // info->callTypes.clear();
    // info->params.clear();
    // cout << "getLaunchTypes: clearning params" << endl;
    // outs() << "getLaunchTypes()\n";
    Indentor indentor;
    Value *argOperand = inst->getArgOperand(0);
    if(ConstantExpr *expr = dyn_cast<ConstantExpr>(argOperand)) {
        Instruction *instr = expr->getAsInstruction();
        // cout << "instr:" << endl;
        // instr->dump();
        Function *fn = cast<Function>(instr->getOperand(0));
        // cout << "fn:" << endl;
        // fn->dump();
        // cout << endl;
        // instr->getOperand(0)->dump();
        // cout << endl;
        Type *op0type = instr->getOperand(0)->getType();
        Type *op0typepointed = op0type->getPointerElementType();
        int i = 0;
        for(auto it=fn->arg_begin(); it != fn->arg_end(); it++) {
            Argument *arg = &*it;
            // arg->dump()
            // cout << "arg " << i << " byval=" << arg->hasByValAttr() << endl;
            // arg->dump();
            // cout << endl;
            // ParamInfo paramInfo;
            launchCallInfo->params[i].isByVal = arg->hasByValAttr();
            // launchCallInfo->params.push_back(paramInfo);
            i++;
        }
        if(FunctionType *fnType = dyn_cast<FunctionType>(op0typepointed)) {
            // int i = 0;
            int i = 0;
            for(auto it=fnType->param_begin(); it != fnType->param_end(); it++) {
                Type * paramType = *it;
                info->params[i].type = paramType;
                indentor << "arg[" << i << "] type=" << typeDumper.dumpType(paramType) << endl;
                // info->callTypes.push_back(paramType);
                i++;
                // cout << "param " << i << ":" << endl;
                // paramType->dump();
                // fn->getArgumentList()[i]->dump();
                // fn->getArgumentList()[i]->dump();
                // cout << endl;
                // cout << isa<Argument>(paramType);
                // cout << 
                // i++;
            }
        }
        info->kernelName = instr->getOperand(0)->getName();
        // outs() << "got kernel name " << info->kernelName << "\n";
    } else {
        throw std::runtime_error("getlaunchtypes, didnt get ConstantExpr");
    }
}

void PatchHostside::getLaunchArgValue(GenericCallInst *inst, LaunchCallInfo *info, ParamInfo *paramInfo) {
    // input to this is:
    // - inst is cudaSetupArgument instruction, with:
    //   - first operand is a value pointing to the value we want to send to the kernel
    //
    // - output of this method is
    //    populate info with a Value holding the actual concrete value w ewant to send to the kernel
    //    (note a pointer to it, since we Load the pointer)
    // Notes:
    // - the first operand of inst was created as bitcast(i8*)(alloca (type-of-arg))
    // - the alloca instruction is inst->getOperand(0)->getOperand(0)
    // - so if we load from the alloca instruction, we should have the value we want?
    // outs() << "getLaunchArgValue " << "\n";
    Indentor indentor;
    if(!isa<Instruction>(inst->getOperand(0))) {
        outs() << "getlaunchvalue, first operatnd of inst is not an instruction..." << "\n";
        inst->dump();
        outs() << "\n";
        inst->getOperand(0)->dump();
        outs() << "\n";
        throw runtime_error("getlaunchvalue, first operatnd of inst is not an instruction...");
    }
    cout << "getLaunchArgValue inst:" << endl;
    inst->dump();
    // cout << endl;
    Instruction *bitcast = cast<Instruction>(inst->getOperand(0));
    cout << "bitcast:" << endl;
    bitcast->dump();
    // cout << endl;
    // cout << "arg size: " << readInt32Constant(inst->getOperand(1)) << endl;
    // cout << "arg 1: " << endl;
    // inst->getOperand(1)->dump();
    // cout << endl;
    // cout << isa<ConstantInt>(inst->getOperand(1)) << endl;
    int size = (int)cast<ConstantInt>(inst->getOperand(1))->getZExtValue();
    paramInfo->size = size;
    if(isa<GetElementPtrInst>(bitcast)) {
        cout << "its a gep" << endl;
        // bitcast->getOperand(0)->dump();
        // cout << endl;
        // cout << "arg0 type:" << endl;
        // bitcast->getOperand(0)->getType()->dump();
        // cout << endl;
        // cout << "gep type:" << endl;
        // bitcast->getType()->dump();
        // cout << endl;
    }
    Value *alloca = bitcast;
    if(isa<BitCastInst>(bitcast)) {
        alloca = bitcast->getOperand(0);
        indentor << "found bitcast" << endl;
    } else {
        alloca = bitcast;
        indentor << "no bitcast found. first operand was:" << endl;
        bitcast->dump();
    }
    Instruction *load = new LoadInst(alloca, "loadCudaArg");
    load->insertBefore(inst->getInst());
    indentor << "after loading pointer we have" << endl;
    load->dump();
    paramInfo->value = load;
    paramInfo->pointer = alloca;
    // info->callValuesByValue.push_back(load);
    // info->callValuesAsPointers.push_back(alloca);
}

std::ostream &operator<<(std::ostream &os, const PointerInfo &pointerInfo) {
    os << "PointerInfo(offset=" << pointerInfo.offset << ", type=" << typeDumper.dumpType(pointerInfo.type);
    os << " indices=";
    int i = 0;
    for(auto it=pointerInfo.indices.begin(); it != pointerInfo.indices.end(); it++) {
        if(i > 0) {
            os << ",";
        }
        os << *it;
        i++;
    }
    os << ")";
    return os;
}

llvm::Instruction *PatchHostside::addSetKernelArgInst_int(llvm::Instruction *lastInst, llvm::Value *value, llvm::IntegerType *intType) {
    // expected:
    // value->getType() should be an IntegerType
    Module *M = lastInst->getModule();

    int bitLength = intType->getBitWidth();
    string mangledName = "";
    if(bitLength == 32) {
        mangledName = "setKernelArgInt32";
    } else if(bitLength == 64) {
        mangledName = "setKernelArgInt64";
    } else if(bitLength == 8) {
        mangledName = "setKernelArgInt8";
    } else {
        throw std::runtime_error("bitlength " + easycl::toString(bitLength) + " not implemented");
    }
    Function *setKernelArgInt = cast<Function>(M->getOrInsertFunction(
        mangledName,
        Type::getVoidTy(context),
        IntegerType::get(context, bitLength),
        NULL));
    CallInst *call = CallInst::Create(setKernelArgInt, value);
    call->insertAfter(lastInst);
    lastInst = call;
    return lastInst;
}

llvm::Instruction *PatchHostside::addSetKernelArgInst_float(llvm::Instruction *lastInst, llvm::Value *value) {
    // handle primitive floats, which we pass to `setKernelArgFloat`, by value

    Module *M = lastInst->getModule();

    Type *valueType = value->getType();
    // cout << "addSetKernelArgInst_float, value type:" << endl;
    // valueType->dump();
    // cout << endl;
    if(valueType->isDoubleTy()) {
        // cout << "is double" << endl;
        // FPTruncInst *fpTrunc = new FPTruncInst(value, Type::getFloatTy(context), "trunctofloat");
        // fpTrunc->insertAfter(lastInst);
        // lastInst = fpTrunc;
        // value = fpTrunc;
        cout << "Executing functions with doubles as kernel parameters is not supported" << endl;
        cout << "Note that this is not set-in-stone, but is really hard to do." << endl;
        cout << "If you really need this functionality, please post your use-case into https://github.com/hughperkins/coriander/issues/22" << endl;
        throw runtime_error("Executing functions with doubles as kernel parameters is not supported");
    }

    Function *setKernelArgFloat = cast<Function>(M->getOrInsertFunction(
        "setKernelArgFloat",
        Type::getVoidTy(context),
        Type::getFloatTy(context),
        NULL));
    CallInst *call = CallInst::Create(setKernelArgFloat, value);
    call->insertAfter(lastInst);
    return call;
}

llvm::Instruction *PatchHostside::addSetKernelArgInst_pointer(llvm::Instruction *lastInst, llvm::Value *value) {
    // expected: valueType should be the pointer type
    // value should be the value representing the pointer

    // cout << "lastInst:" << endl;
    // lastInst->dump();
    // cout << endl;
    // cout << "lastInst M " << lastInst->getModule() << endl;
    // cout << "value M " << value->getType()->getModule() << endl;


    Indentor indentor;
    Type *valueType = value->getType();
    indentor << "addSetKernelArgInst_pointer "
      << " value->getType()=" << typeDumper.dumpType(value->getType()) << endl;

    // cout << "getting M" << endl;
    Module *M = lastInst->getModule();
    // cout << "M=" << M << endl;

    // value->dump();
    // cout << endl;

    Type *elementType = cast<PointerType>(valueType)->getPointerElementType();
    // cout << "addSetKernelArgInst_pointer elementType:" << endl;
    // elementType->dump();
    // we can probably generalize these to all just send as a pointer to char
    // we'll need to cast them somehow first
    // cout << "got elementtype" << endl;
    // elementType->dump();
    // cout << endl;

    if(elementType->isDoubleTy()) {
        // cout << "is double" << endl;
        // FPTruncInst *fpTrunc = new FPTruncInst(value, Type::getFloatTy(context), "trunctofloat");
        // fpTrunc->insertAfter(lastInst);
        // lastInst = fpTrunc;
        // value = fpTrunc;
        cout << "Executing functions with double arrays as kernel parameters is not supported" << endl;
        cout << "Note that this is not set-in-stone, but is really hard to do." << endl;
        cout << "If you really need this functionality, please post your use-case into https://github.com/hughperkins/coriander/issues/22" << endl;
        throw runtime_error("Executing functions with double arrays as kernel parameters is not supported");
    }

    BitCastInst *bitcast = new BitCastInst(value, PointerType::get(IntegerType::get(context, 8), 0));
    bitcast->insertAfter(lastInst);
    lastInst = bitcast;

    const DataLayout *dataLayout = &M->getDataLayout();
    int allocSize = dataLayout->getTypeAllocSize(elementType);
    // cout << "allocsize " << allocSize << endl;
    int32_t elementSize = allocSize;

    Function *setKernelArgGpuBuffer = cast<Function>(M->getOrInsertFunction(
        "setKernelArgGpuBuffer",
        Type::getVoidTy(context),
        PointerType::get(IntegerType::get(context, 8), 0),
        IntegerType::get(context, 32),
        NULL));
    Value *args[] = {bitcast, createInt32Constant(&context, elementSize)};
    CallInst *call = CallInst::Create(setKernelArgGpuBuffer, ArrayRef<Value *>(args));
    call->insertAfter(lastInst);
    lastInst = call;
    return lastInst;
}

llvm::Instruction *PatchHostside::addSetKernelArgInst_pointerstruct(llvm::Instruction *lastInst, llvm::Value *structPointer) {
    // what this will need to do is:
    // - create a call to pass the gpu buffer, that contains the struct, to hostside_opencl_funcs, at runtime
    // ~~- if the struct contains pointers, then add appropriate calls to pass those at runtime too~~
    // update: we're going to forbid gpuside buffers containing pointers, for now

    // lets deal with the gpuside buffer first, that should be fairly easy-ish:
    lastInst = addSetKernelArgInst_pointer(lastInst, structPointer);

    // we'd better at least assert or something, if there are pointers in the struct
    Module *M = lastInst->getModule();
    Type *valueType = structPointer->getType();
    StructType *structType = cast<StructType>(cast<PointerType>(valueType)->getPointerElementType());
    unique_ptr<StructInfo> structInfo(new StructInfo());
    StructCloner::walkStructType(M, structInfo.get(), 0, 0, vector<int>(), "", structType);
    bool structHasPointers = structInfo->pointerInfos.size() > 0;
    if(structHasPointers) {
        cout << "ERROR: Coriander currently forbids pointers inside gpu-side structs, passed into kernels" << endl;
        cout << "If you need this, please create an issue at https://github.com/hughperkins/Coriander/issues" << endl;
        cout << "Note that it's pretty hard to do though" << endl;
        structPointer->dump();
        cout << endl;
        throw std::runtime_error("ERROR: Coriander currently forbids pointers inside gpu-side structs, passed into kernels");
    }
    return lastInst;
}

llvm::Instruction *PatchHostside::addSetKernelArgInst_byvaluevector(llvm::Instruction *lastInst, llvm::Value *vectorPointer) {
    // so, lets assume its just a hostside blob, that we need to send deviceside, as a blob
    // we should thus find out the blob size
    // we'll need:
    // - element count
    // - element size

    Type *valueType = vectorPointer->getType();
    VectorType *vectorType = cast<VectorType>(valueType);
    // outs() << "vectorType:\n";
    // vectorType->dump();

    // VectorType *vectorType = cast<VectorType>(vectorPointer->getType());
    // vectorType->dump();
    // cout << endl;
    int elementCount = vectorType->getNumElements();
    Type *elementType = vectorType->getElementType();
    int elementSizeBytes = elementType->getPrimitiveSizeInBits() / 8;
    // cout << "PatchHostside::addSetKernelArgInst_byvaluevector count=" << elementCount <<
    //     " elementsizebytes=" << elementSizeBytes << " type=" <<  endl;
    // elementType->dump();
    // cout << endl;
    if(elementType->getPrimitiveSizeInBits() == 0) {
        cout << endl;
        vectorType->dump();
        cout << endl;
        throw runtime_error("PatchHostside::addSetKernelArgInst_byvaluevector: not implemented for non-primitive types");
    }

    int allocSize = elementSizeBytes * elementCount;

    Module *M = lastInst->getModule();

    BitCastInst *bitcast = new BitCastInst(vectorPointer, PointerType::get(IntegerType::get(context, 8), 0));
    bitcast->insertAfter(lastInst);
    lastInst = bitcast;

    Value *args[2];
    args[0] = bitcast;
    args[1] = createInt32Constant(&context, allocSize);

    Function *setKernelArgHostsideBuffer = cast<Function>(M->getOrInsertFunction(
        "setKernelArgHostsideBuffer",
        Type::getVoidTy(context),
        PointerType::get(IntegerType::get(context, 8), 0),
        IntegerType::get(context, 32),
        NULL));

    // cout << "adding setKernelArgHostsideBuffer call" << endl;
    CallInst *call = CallInst::Create(setKernelArgHostsideBuffer, ArrayRef<Value *>(args));
    call->insertAfter(lastInst);
    // call->dump();
    lastInst = call;

    return lastInst;
}

void addMetadata(Instruction *value, string tag) {
    // LLVMContext *context = value->getContext();
    MDNode* mdnode = MDNode::get(context, MDString::get(context, tag));
    value->setMetadata(tag, mdnode);
}

llvm::Instruction *PatchHostside::addSetKernelArgInst_byvaluestruct(llvm::Instruction *lastInst, llvm::Value *structPointer) {
    //
    // what this is going to do is:
    // - create a call to pass the hostside buffer to hostside_opencl_funcs, at runtime
    // - if the struct contains pointers, then add appropriate calls to pass those at runtime too
    //
    // expected parameters:
    // - lastInst: the previous instruction in the bytecode. we'll use this for appending new instructions
    // - structType: the real type of the struct, eg struct Foo (not the type of a pointer to the struct)
    // - structPointer: a value representing a pointer to the struct

    Module *M = lastInst->getModule();
    Indentor indentor;
    // outs() << "got a byvalue struct" << "\n";

    // Type *structType = cast<
    StructType *structType = cast<StructType>(cast<PointerType>(structPointer->getType())->getPointerElementType());
    indentor << "addSetKernelArgInst_byvaluestruct structPointer->getType() "
        << typeDumper.dumpType(structPointer->getType()) << endl;
    // StructType *structType = cast<StructType>(valueType);
    // outs() << "structType:\n";
    // indentor << "  addSetKernelArgInst_byvaluestruct structType=" << typeDumper.dumpType(structType) << endl;

    // if(structType != valueType->getType()) {
    // if(structType != structPointer->getType()->getPointerElementType()) {
    //     indentor << "structPointer type and valueType dont match" << endl;
    //     BitCastInst *castSource = new BitCastInst(structPointer, PointerType::get(structType, 0));
    //     castSource->insertAfter(lastInst);
    //     indentor << "casting " << typeDumper.dumpType(structPointer->getType()) << " into " <<
    //         typeDumper.dumpType(castSource->getType()) << endl;
    //     lastInst = castSource;
    //     structPointer = castSource;
    //     castSource->dump();
    // } else {
    //     indentor << "structPointer type and valuetype match ok" << endl;
    // }
    indentor << "structPointer->getType() " << typeDumper.dumpType(structPointer->getType()) << endl;

    // structType->dump();
    // Type *
    string typeName = structType->getName().str();
    // cout << "typeName [" << typeName << "]" << endl;
    if(typeName == "struct.float4") {
        return PatchHostside::addSetKernelArgInst_pointer(lastInst, structPointer);
    }

    unique_ptr<StructInfo> structInfo(new StructInfo());
    StructCloner::walkStructType(M, structInfo.get(), 0, 0, vector<int>(), "", structType);
    bool structHasPointers = structInfo->pointerInfos.size() > 0;

    // StructType *structType = cast<StructType>(valueType);
    string name = globalNames.getOrCreateName(structType);
    StructType *newType = structCloner.cloneNoPointers(structType);
    indentor << "  newType=" << typeDumper.dumpType(newType) << endl;
    // newType->dump();

    const DataLayout *dataLayout = &M->getDataLayout();
    int allocSize = dataLayout->getTypeAllocSize(newType);
    // outs() << "original typeallocsize " << dataLayout->getTypeAllocSize(value->getType()) << "\n";
    // outs() << "pointerfree typeallocsize " << allocSize << "\n";

    // indentor << " structPointer:" << endl;
    // structPointer->dump();

    Value *sourceStruct = 0;
    if(structHasPointers) {
        Instruction *alloca = new AllocaInst(newType, "newalloca");
        alloca->insertAfter(lastInst);
        lastInst = alloca;

        // BitCastInst *castSource = new BitCastInst(structPointer, PointerType::get(structType, 0));
        // castSource->insertAfter(lastInst);
        // lastInst = castSource;
        // cout << "castSource " << castSource << endl;
        // castSource->dump();

        // cout << "struct has pointers, so cloning" << endl;
        lastInst = structCloner.createHostsideIrCopyPtrfullToNoptr(lastInst, structType, structPointer, alloca);
        sourceStruct = alloca;
    } else {
        // cout << "struct does not have pointers, no need to clone" << endl;
        sourceStruct = structPointer;
    }

    BitCastInst *bitcast = new BitCastInst(sourceStruct, PointerType::get(IntegerType::get(context, 8), 0));
    bitcast->insertAfter(lastInst);
    // LLVMContext& C = Inst->getContext();
    addMetadata(bitcast, "bitcast");
    // MDNode* mdnode = MDNode::get(context, MDString::get(context, "my md string content"));
    // bitcast->setMetadata("my.md.name", mdnode);
    lastInst = bitcast;
    bitcast->dump();

    Value *args[2];
    args[0] = bitcast;
    args[1] = createInt32Constant(&context, allocSize);

    Function *setKernelArgHostsideBuffer = cast<Function>(M->getOrInsertFunction(
        "setKernelArgHostsideBuffer",
        Type::getVoidTy(context),
        PointerType::get(IntegerType::get(context, 8), 0),
        IntegerType::get(context, 32),
        NULL));

    // cout << "adding setKernelArgHostsideBuffer call" << endl;
    CallInst *call = CallInst::Create(setKernelArgHostsideBuffer, ArrayRef<Value *>(args));
    call->insertAfter(lastInst);
    // call->dump();
    lastInst = call;

    // now we have to handle any pointers, send those through too

    // indentor << "  pointers in struct" << endl;
    int i = 0;
    for(auto pointerit=structInfo->pointerInfos.begin(); pointerit != structInfo->pointerInfos.end(); pointerit++) {
        Indentor indentor;
        // cout << "   passing a pointer, from the struct" << endl;
        PointerInfo *pointerInfo = pointerit->get();
        vector<Value *> indices;
        indices.push_back(createInt32Constant(&context, 0));
        indentor << "pointer in struct idx=" << i << " [";
        // indentor << "idxes:";
        for(auto idxit = pointerInfo->indices.begin(); idxit != pointerInfo->indices.end(); idxit++) {
            int idx = *idxit;
            indentor << " " << idx;
            // outs() << "idx " << idx << "\n";
            indices.push_back(createInt32Constant(&context, idx));
        }
        indentor << " ]" << endl;
        GetElementPtrInst *gep = GetElementPtrInst::CreateInBounds(structType, structPointer, ArrayRef<Value *>(&indices[0], &indices[indices.size()]), "getfloatstaraddr");
        gep->insertAfter(lastInst);
        lastInst = gep;

        LoadInst *loadgep = new LoadInst(gep, "loadgep");
        loadgep->insertAfter(lastInst);
        lastInst = loadgep;

        indentor << "loadgep type=" << typeDumper.dumpType(loadgep->getType()) << endl;
        // indentor << "adding"
        lastInst = PatchHostside::addSetKernelArgInst_pointer(lastInst, loadgep);
        i++;
    }
    return lastInst;
}

llvm::Instruction *PatchHostside::addSetKernelArgInst(llvm::Instruction *lastInst, ParamInfo *paramInfo) {
    /*
    This figures out the type of the argument, and dispatches appropriately. All arguments pass through this function,
    including primitives, pointers, structs, ...
    */
    Type *valueType = paramInfo->type;
    Value *value = paramInfo->value;
    Value *valueAsPointerInstr = paramInfo->pointer;
    // bool byValue = paramInfo->isByVal;
    if(paramInfo->size != 4 && paramInfo->size != 8) {
        paramInfo->isByVal = true; // cannot be a pointer
    }
    Indentor indentor;
    indentor << "addSetKernelArgInst() " << typeDumper.dumpType(valueType) <<
        " value.getType=" << typeDumper.dumpType(value->getType()) << " byvalue=" << paramInfo->isByVal << " size=" << paramInfo->size << endl;
    // valueType->dump();
    // value->dump();
    // cout << endl;
    // cout << "byvalue=" << byValue << endl;
    // valueType->dump();
    // value->getType()->dump();
    if(IntegerType *intType = dyn_cast<IntegerType>(valueType)) {
        lastInst = PatchHostside::addSetKernelArgInst_int(lastInst, value, intType);
    } else if(valueType->isFloatingPointTy()) {
        lastInst = PatchHostside::addSetKernelArgInst_float(lastInst, value);
    } else if(paramInfo->isByVal) {
        indentor << "  by value" << endl;
        valueType = cast<PointerType>(valueType)->getElementType();
        // valueType->dump();
        // cout << endl;
        if(isa<StructType>(valueType)) {
            indentor << "  structtype" << endl;
            lastInst = PatchHostside::addSetKernelArgInst_byvaluestruct(lastInst, valueAsPointerInstr);
        } else if(isa<VectorType>(valueType)) {
            indentor << "  got vector arg type" << endl;
            // value->dump();
            // cout << endl;
            // value->getType()->dump();
            // cout << endl;
            // so, this is byval, thus hostside?
            // so send it as a hostside buffer?
            lastInst = PatchHostside::addSetKernelArgInst_byvaluevector(lastInst, valueAsPointerInstr);
        } else {
            valueType->dump();
            value->dump();
            outs() << "\n";
            throw std::runtime_error("byval kernel arg type type not implemented " + typeDumper.dumpType(valueType));
        }
    } else if(valueType->isPointerTy()) {
        indentor << "  pointer" << endl;
        Type *elementType = dyn_cast<PointerType>(valueType)->getPointerElementType();
        if(isa<StructType>(elementType)) {
            // lastInst = PatchHostside::addSetKernelArgInst_pointer(lastInst, value);
            indentor << "  pointer to struct" << endl;
            // lastInst = addSetKernelArgInst_byvaluestruct(lastInst, value);
            lastInst = PatchHostside::addSetKernelArgInst_pointerstruct(lastInst, value);
        } else {
            indentor << "  pointer to non-struct" << endl;
            lastInst = PatchHostside::addSetKernelArgInst_pointer(lastInst, valueAsPointerInstr);
        }
    } else if(isa<StructType>(valueType)) {
        indentor << "  structtype by value (outside byvalue bit)" << endl;
        lastInst = PatchHostside::addSetKernelArgInst_byvaluestruct(lastInst, valueAsPointerInstr);
    } else if(isa<VectorType>(valueType)) {
        indentor << "got vector arg type" << endl;
        // value->dump();
        // cout << endl;
        // value->getType()->dump();
        // cout << endl;
        // so, this is byval, thus hostside?
        // so send it as a hostside buffer?
        lastInst = PatchHostside::addSetKernelArgInst_byvaluevector(lastInst, valueAsPointerInstr);
    } else {
        valueType->dump();
        value->dump();
        outs() << "\n";
        throw std::runtime_error("kernel arg type type not implemented " + typeDumper.dumpType(valueType));
    }
    return lastInst;
}

void PatchHostside::patchCudaLaunch(llvm::Function *F, GenericCallInst *inst, std::vector<llvm::Instruction *> &to_replace_with_zero) {
    // outs() << "============\n";
    // outs() << "cudaLaunch\n";

    Module *M = inst->getModule();
    // cout << "M " << M << endl;

    PatchHostside::getLaunchTypes(inst, launchCallInfo.get());
    to_replace_with_zero.push_back(inst->getInst());
    // outs() << "\n";
    // outs() << "patching launch in " << string(F->getName()) << "\n";

    string kernelName = launchCallInfo->kernelName;
    Instruction *kernelNameValue = addStringInstr(M, "s_" + ::devicellcode_stringname + "_" + kernelName, kernelName);
    kernelNameValue->insertBefore(inst->getInst());

    // this isnt actually needed for running, but hopefully useful for debugging
    Instruction *llSourcecodeValue = addStringInstrExistingGlobal(M, devicellcode_stringname);
    llSourcecodeValue->insertBefore(inst->getInst());

    // Instruction *clSourcecodeValue = addStringInstrExistingGlobal(M, sourcecode_stringname);
    // clSourcecodeValue->insertBefore(inst);

    Function *configureKernel = cast<Function>(F->getParent()->getOrInsertFunction(
        "configureKernel",
        Type::getVoidTy(context),
        PointerType::get(IntegerType::get(context, 8), 0),
        PointerType::get(IntegerType::get(context, 8), 0),
        // PointerType::get(IntegerType::get(context, 8), 0),
        NULL));
    Value *args[] = {kernelNameValue, llSourcecodeValue};
    CallInst *callConfigureKernel = CallInst::Create(configureKernel, ArrayRef<Value *>(&args[0], &args[2]));
    callConfigureKernel->insertBefore(inst->getInst());
    Instruction *lastInst = callConfigureKernel;

    // pass args now
    int i = 0;
    // for(auto argit=launchCallInfo->callValuesByValue.begin(); argit != launchCallInfo->callValuesByValue.end(); argit++) {
    for(auto argit=launchCallInfo->params.begin(); argit != launchCallInfo->params.end(); argit++) {
        ParamInfo *paramInfo = &*argit;
        // Value *value = paramInfo->value;
        // Value *valueAsPointerInstr = launchCallInfo->callValuesAsPointers[i];
        // Value *valueAsPointerInstr = paramInfo->pointer;
        // Type *argType = paramInfo->type;
        // Type *argType = launchCallInfo->callTypes[i];
        cout << "patchCudalaunch, arg " << i << " byval=" << paramInfo->isByVal << " " << typeDumper.dumpType(paramInfo->type) << endl;
        // paramInfo->type->dump();
        // cout << endl;
        // paramInfo->value->dump();
        // cout << endl;
        // argType->dump();
        // cout << endl;
        lastInst = PatchHostside::addSetKernelArgInst(lastInst, paramInfo);
        i++;
    }
    // trigger the kernel...
    Function *kernelGo = cast<Function>(F->getParent()->getOrInsertFunction(
        "kernelGo",
        Type::getVoidTy(context),
        NULL));
    CallInst *kernelGoInst = CallInst::Create(kernelGo);
    kernelGoInst->insertAfter(lastInst);
    lastInst = kernelGoInst;

    launchCallInfo->params.clear();
    // launchCallInfo->callValuesByValue.clear();
    // launchCallInfo->callValuesAsPointers.clear();
    // launchCallInfo.reset(new LaunchCallInfo);
}

void PatchHostside::patchFunction(llvm::Function *F) {
    cout << "=========================" << endl;
    bool is_main = (string(F->getName().str()) == "main");
    if(is_main) cout << "patching " << F->getName().str() << endl;    
    cout << "patching " << F->getName().str() << endl;    
    vector<Instruction *> to_replace_with_zero;
    IntegerType *inttype = IntegerType::get(context, 32);
    ConstantInt *constzero = ConstantInt::getSigned(inttype, 0);
    launchCallInfo->params.clear();
    // cout << "clearning params" << endl;
    // vector<unique_ptr<GenericCallInst> args;
    // vector<unique_ptr<GenericCallInt> launch;
    // // first, we'll fetch all the relevant arg calls, and the launch call
    // // then we will process them
    // // this means we can determine what method is being called, with what parameters,
    // // and have this information to hand, when we process the args
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        for(auto insit=basicBlock->begin(); insit != basicBlock->end(); insit++) {
            Instruction *inst = &*insit;
            if(!isa<CallInst>(inst) && !isa<InvokeInst>(inst)) {
                continue;
            }
            Function *called = 0;
            unique_ptr<GenericCallInst> genCallInst;
            if(CallInst *callInst = dyn_cast<CallInst>(inst)) {
                called = callInst->getCalledFunction();
                genCallInst = GenericCallInst::create(callInst);
            } else if(InvokeInst *callInst = dyn_cast<InvokeInst>(inst)) {
                called = callInst->getCalledFunction();
                genCallInst = GenericCallInst::create(callInst);
            }
            if(called == 0) {
                continue;
            }
            if(!called->hasName()) {
                continue;
            }
            string calledFunctionName = called->getName();
            // if(is_main && calledFunctionName.find("cuda") != string::npos) cout << "calledfunctionname " << calledFunctionName << endl;
            if(calledFunctionName == "cudaSetupArgument") {
                ParamInfo paramInfo;
                PatchHostside::getLaunchArgValue(genCallInst.get(), launchCallInfo.get(), &paramInfo);
                launchCallInfo->params.push_back(paramInfo);
                cout << "got cudasetupargument" << endl;
                // args.push_back(genCallInst);
                to_replace_with_zero.push_back(inst);
            } else if(calledFunctionName == "cudaLaunch") {
                // launch = genCallInst;
                PatchHostside::patchCudaLaunch(F, genCallInst.get(), to_replace_with_zero);
            }
        }
    }
    for(auto it=to_replace_with_zero.begin(); it != to_replace_with_zero.end(); it++) {
        Instruction *inst = *it;
        BasicBlock::iterator ii(inst);
        if(InvokeInst *invoke = dyn_cast<InvokeInst>(inst)) {
            // need to add an uncondtioinal branch, after the old invoke locaiton
            // cout << "replacing an invoke, need to patch in a branch" << endl;
            BasicBlock *oldTarget = invoke->getNormalDest();
            BranchInst *branch = BranchInst::Create(oldTarget);
            branch->insertAfter(inst);
        }
        // AllocaInst *alloca = new AllocaInst(IntegerType::get(context, 32));
        // alloca->insertBefore(inst);
        // StoreInst *store = new StoreInst(constzero, alloca);
        // store->insertBefore(inst);
        // LoadInst *load = new LoadInst(alloca);
        // load->insertBefore(inst);
        // ReplaceInstWithValue(inst->getParent()->getInstList(), ii, load);
        ReplaceInstWithValue(inst->getParent()->getInstList(), ii, constzero);
    }
}

std::string PatchHostside::getBasename(std::string path) {
    // grab anything after final / ,or whole string
    size_t slash_pos = path.rfind('/');
    if(slash_pos == string::npos) {
        return path;
    }
    return path.substr(slash_pos + 1);
}

void PatchHostside::patchModule(Module *M) {
    // entry point: given Module M, traverse all functions, rewriting the launch instructison to call
    // into Coriander runtime

    ifstream f_inll(::devicellfilename);
    string devicell_sourcecode(
        (std::istreambuf_iterator<char>(f_inll)),
        (std::istreambuf_iterator<char>()));

    // ::sourcecode_stringname = "__opencl_sourcecode" + ::deviceclfilename;
    ::devicellcode_stringname = "__devicell_sourcecode" + ::devicellfilename;

    // addGlobalVariable(M, sourcecode_stringname, cl_sourcecode);
    addGlobalVariable(M, devicellcode_stringname, devicell_sourcecode);

    vector<Function *> functionsToRemove;
    for(auto it = M->begin(); it != M->end(); it++) {
        Function *F = &*it;
        string name = F->getName();
            PatchHostside::patchFunction(F);
            verifyFunction(*F);
    }
}

} // namespace cocl

int main(int argc, char *argv[]) {
    SMDiagnostic smDiagnostic;
    argparsecpp::ArgumentParser parser;

    // string devicellfilename;
    string rawhostfilename;
    string patchedhostfilename;

    parser.add_string_argument("--hostrawfile", &rawhostfilename)->required()->help("input file");
    // parser.add_string_argument("--deviceclfile", &::deviceclfilename)->required()->help("input file");
    parser.add_string_argument("--devicellfile", &::devicellfilename)->required()->help("input file");
    parser.add_string_argument("--hostpatchedfile", &patchedhostfilename)->required()->help("output file");
    if(!parser.parse_args(argc, argv)) {
        return -1;
    }

    std::unique_ptr<llvm::Module> module = parseIRFile(rawhostfilename, smDiagnostic, context);
    if(!module) {
        smDiagnostic.print(argv[0], errs());
        return 1;
    }

    try {
        PatchHostside::patchModule(module.get());
    } catch(const runtime_error &e) {
        cout << endl;
        cout << "Something went wrong, sorry." << endl;
        cout << endl;
        cout << "More detail for devs/maintainers:" << endl;
        cout << "  exception: " << e.what() << endl;
        cout << "  rawhost ll file: " << rawhostfilename << "\n";
        // outs() << "reading device cl file " << deviceclfilename << "\n";
        outs() << "  hostpatched file: " << patchedhostfilename << "\n";
        cout << endl;
        return -1;
    }

    AssemblyAnnotationWriter assemblyAnnotationWriter;
    ofstream ofile;
    ofile.open(patchedhostfilename);
    raw_os_ostream my_raw_os_ostream(ofile);
    verifyModule(*module);
    module->print(my_raw_os_ostream, &assemblyAnnotationWriter);
    ofile.close();
    return 0;
}
