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

#include "InstructionDumper.h"

#include "type_dumper.h"
#include "GlobalNames.h"
#include "LocalNames.h"

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <memory>

#include "gtest/gtest.h"

using namespace std;
using namespace cocl;
using namespace llvm;

namespace {

LLVMContext context;
unique_ptr<Module>M;

TEST(test_instructiondumper, basic) {
    Value *a = ConstantInt::getSigned(IntegerType::get(context, 32), 123);
    Value *b = ConstantInt::getSigned(IntegerType::get(context, 32), 47);
    Instruction *add = BinaryOperator::Create(Instruction::FAdd, a, b);
    GlobalNames globalNames;
    LocalNames localNames;
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;

    std::vector<AllocaInfo> allocaDeclarations;
    std::set<llvm::Value *> variablesToDeclare;
    std::set<llvm::Value *> sharedVariablesToDeclare;
    std::set<std::string> shimFunctionsNeeded; // for __shfldown_3 etc, that we provide as opencl directly
    std::set<llvm::Function *> neededFunctions;

    std::map<llvm::Value *, std::string> globalExpressionByValue;
    std::map<llvm::Value *, std::string> localExpressionByValue;

    InstructionDumper instructionDumper(&globalNames, &localNames, &typeDumper, &functionNamesMap,
        &allocaDeclarations, &variablesToDeclare, &sharedVariablesToDeclare, &shimFunctionsNeeded,
        &neededFunctions,
        &globalExpressionByValue, &localExpressionByValue);
    vector<string> extraInstructions;
    string expr = instructionDumper.dumpInstructionRhs(add, &extraInstructions);

    cout << "expr " << expr << endl;

    instructionDumper.localExpressionByValue->operator[](a) = "v1";
    expr = instructionDumper.dumpInstructionRhs(add, &extraInstructions);
    cout << "expr " << expr << endl;

    a = new AllocaInst(IntegerType::get(context, 32));
    b = new AllocaInst(IntegerType::get(context, 32));
    instructionDumper.localExpressionByValue->operator[](a) = "v3";
    instructionDumper.localExpressionByValue->operator[](b) = "v4";
    add = BinaryOperator::Create(Instruction::Add, a, b);
    expr = instructionDumper.dumpInstructionRhs(add, &extraInstructions);
    cout << "expr " << expr << endl;

    instructionDumper.localExpressionByValue->operator[](add) = "v5";
    expr = instructionDumper.dumpInstructionRhs(add, &extraInstructions);
    cout << "expr " << expr << endl;
}

TEST(test_instructiondumper, globalexpr) {
    Value *a = ConstantInt::getSigned(IntegerType::get(context, 32), 123);
    Value *b = ConstantInt::getSigned(IntegerType::get(context, 32), 47);
    Instruction *add = BinaryOperator::Create(Instruction::FAdd, a, b);
    GlobalNames globalNames;
    LocalNames localNames;
    TypeDumper typeDumper(&globalNames);
    FunctionNamesMap functionNamesMap;

    std::vector<AllocaInfo> allocaDeclarations;
    std::set<llvm::Value *> variablesToDeclare;
    std::set<llvm::Value *> sharedVariablesToDeclare;
    std::set<std::string> shimFunctionsNeeded; // for __shfldown_3 etc, that we provide as opencl directly
    std::set<llvm::Function *> neededFunctions;

    std::map<llvm::Value *, std::string> globalExpressionByValue;
    std::map<llvm::Value *, std::string> localExpressionByValue;

    InstructionDumper instructionDumper(&globalNames, &localNames, &typeDumper, &functionNamesMap,
        &allocaDeclarations, &variablesToDeclare, &sharedVariablesToDeclare, &shimFunctionsNeeded,
        &neededFunctions,
        &globalExpressionByValue, &localExpressionByValue);
    vector<string> extraInstructions;
    string expr = instructionDumper.dumpInstructionRhs(add, &extraInstructions);
    cout << "expr " << expr << endl;
}

}
