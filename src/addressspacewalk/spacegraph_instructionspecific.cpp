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

#include "addressspacewalk/spacegraph_instructionspecific.h"
#include "addressspacewalk/spacegraph.h"

#include "type_dumper.h"

#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Instructions.h"

#include <iostream>
#include <string>
#include <sstream>
#include <stdexcept>

namespace cocl {
namespace addressspacewalk {

void SpaceGraph::findLinkedValues(SpaceNode *node, llvm::Value *value) {
    llvm::Instruction *instruction = llvm::cast<llvm::Instruction>(value);
    auto opcode = instruction->getOpcode();
        switch(opcode) {
        case llvm::Instruction::Alloca:
            // dumpAlloca(localValueInfo);
            // dont do anything... ?
            break;
        case llvm::Instruction::Load:
        
            // dumpLoad(localValueInfo);
            // break;
        case llvm::Instruction::Store:
            // dumpStore(localValueInfo);
            // break;
        case llvm::Instruction::Call:
            // dumpCall(localValueInfo, returnTypeByFunction);
            // break;
        case llvm::Instruction::FAdd:
            // dumpBinaryOperator(localValueInfo, "+");
            // break;
        case llvm::Instruction::FSub:
            // dumpBinaryOperator(localValueInfo, "-");
            // break;
        case llvm::Instruction::FMul:
            // dumpBinaryOperator(localValueInfo, "*");
            // break;
        case llvm::Instruction::FDiv:
            // dumpBinaryOperator(localValueInfo, "/");
            // break;
        case llvm::Instruction::Sub:
            // dumpBinaryOperator(localValueInfo, "-");
            // break;
        case llvm::Instruction::Add:
            // dumpBinaryOperator(localValueInfo, "+");
            // break;
        case llvm::Instruction::Mul:
            // dumpBinaryOperator(localValueInfo, "*");
            // break;
        case llvm::Instruction::SDiv:
            // dumpBinaryOperator(localValueInfo, "/");
            // break;
        case llvm::Instruction::UDiv:
            // dumpBinaryOperator(localValueInfo, "/");
            // break;
        case llvm::Instruction::SRem:
            // dumpBinaryOperator(localValueInfo, "%");
            // break;
        case llvm::Instruction::And:
            // dumpBinaryOperator(localValueInfo, "&");
            // break;
        case llvm::Instruction::Or:
            // dumpBinaryOperator(localValueInfo, "|");
            // break;
        case llvm::Instruction::Xor:
            // dumpBinaryOperator(localValueInfo, "^");
            // break;
        case llvm::Instruction::LShr:
            // dumpBinaryOperator(localValueInfo, ">>");
            // break;
        case llvm::Instruction::Shl:
            // dumpBinaryOperator(localValueInfo, "<<");
            // break;
        case llvm::Instruction::AShr:
            // dumpBinaryOperator(localValueInfo, ">>");
            // break;

        case llvm::Instruction::ICmp:
            // dumpIcmp(localValueInfo);
            // break;
        case llvm::Instruction::FCmp:
            // dumpFcmp(localValueInfo);
            // break;

        case llvm::Instruction::SExt:
        case llvm::Instruction::ZExt:
        case llvm::Instruction::FPExt:
            // dumpExt(localValueInfo);
            // break;

        case llvm::Instruction::FPTrunc:
        case llvm::Instruction::Trunc:
        case llvm::Instruction::UIToFP:
        case llvm::Instruction::SIToFP:
        case llvm::Instruction::FPToUI:
        case llvm::Instruction::FPToSI:
            // dumpTrunc(localValueInfo);
            // break;

        case llvm::Instruction::BitCast:
            // dumpBitCast(localValueInfo);
            // break;
        case llvm::Instruction::AddrSpaceCast:
            // dumpAddrSpaceCast(localValueInfo);
            // break;
        // // case llvm::Instruction::PtrToInt:
        // //     instructionCode = dumpPtrToInt(cast<PtrToIntInst>(instruction));
        // //     break;
        // // case llvm::Instruction::IntToPtr:
        // //     instructionCode = dumpInttoPtr(cast<IntToPtrInst>(instruction));
        // //     break;
        case llvm::Instruction::Select:
            // dumpSelect(localValueInfo);
            // break;
        case llvm::Instruction::GetElementPtr:
            // dumpGetElementPtr(localValueInfo);
            // break;
        case llvm::Instruction::InsertValue:
            // dumpInsertValue(localValueInfo);
            // break;
        case llvm::Instruction::ExtractValue:
            // dumpExtractValue(localValueInfo);
            // break;
        default:
            std::cout << "opcode string " << instruction->getOpcodeName() << std::endl;
            throw std::runtime_error("unknown opcode");
    }

}

} // addressspacewalk
} // cocl
