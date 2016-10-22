#include "readIR.h"

#include "llvm/Support/raw_os_ostream.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

using namespace std;
using namespace llvm;

uint64_t readIntConstant_uint64(ConstantInt *constant) {
    return constant->getZExtValue();
}

uint32_t readIntConstant_uint32(ConstantInt *constant) {
    assert(constant->getBitWidth() <= 32);
    return (uint32_t)constant->getZExtValue();
}

std::string getName(StructType *type) {
    if(!type->hasName()) {
        type->dump();
        throw runtime_error("type doesnt have name");
    }
    return type->getName();
}

std::string getName(Function *type) {
    if(!type->hasName()) {
        type->dump();
        throw runtime_error("function doesnt have name");
    }
    return type->getName();
}

std::string getName(Value *value) {
    if(!value->hasName()) {
        value->dump();
        throw runtime_error("value doesnt have name");
    }
    return value->getName();
}

int readInt32Constant(Value *value) {
    return cast<ConstantInt>(value)->getSExtValue();
}

float readFloatConstant(Value *value) {
    return cast<ConstantFP>(value)->getValueAPF().convertToFloat();
}
