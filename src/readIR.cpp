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
