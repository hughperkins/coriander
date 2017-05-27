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

#include "basicblockdumper.h"

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

#include "gtest/gtest.h"

using namespace std;
using namespace cocl;
using namespace llvm;

namespace {

// LLVMContext context;
// unique_ptr<Module>M;

// string ll_path = "../test/gtest/test_global_constants.ll";  // this is a bit hacky, but fine-ish for now

// Module *getM() {
//     if(M == nullptr) {
//         SMDiagnostic smDiagnostic;
//         M = parseIRFile(StringRef(ll_path), smDiagnostic, context);
//         if(!M) {
//             smDiagnostic.print("irtopencl", errs());
//             // return "";
//             throw runtime_error("failed to parse IR");
//             }
//     }
//     return M.get();
// }

// Function *getFunction(string name) {
//     // Module *M = getM();
//     getM();
//     Function *F = M->getFunction(StringRef(name));
//     if(F == 0) {
//         throw runtime_error("Function " + name + " not found");
//     }
//     return F;
// }

// TEST(test_global_constant, test_union) {
//     Function *F = getFunction("test_union");
//     F->dump();
//     BasicBlock *block = &*F->begin();
//     GlobalNames globalNames;
//     LocalNames localNames;
//     for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
//         Argument *arg = &*it;
//         string name = arg->getName().str();
//         Value *value = arg;
//         localNames.getOrCreateName(value, name);
//     }
//     cout << localNames.dumpNames();
//     TypeDumper typeDumper(&globalNames);
//     FunctionNamesMap functionNamesMap;
//     BasicBlockDumper blockDumper(block, &globalNames, &localNames, &typeDumper, &functionNamesMap);
//     std::set< llvm::Function *> dumpedFunctions;
//     map<Function *, Type *>returnTypeByFunction;
//     blockDumper.runGeneration(dumpedFunctions, returnTypeByFunction);
//     ostringstream oss;
//     blockDumper.toCl(oss);
//     string cl = oss.str();
//     cout << "cl:\n" << cl << endl;
//     cout << "allocas: \n" << blockDumper.getAllocaDeclarations("    ") << endl;

//     // cout << "num shared variables to declare: " << blockDumper.sharedVariablesToDeclare.size() << endl;
//     // ASSERT_EQ(1, blockDumper.sharedVariablesToDeclare.size());
//     // for(auto it=blockDumper.sharedVariablesToDeclare.begin(); it !=blockDumper.sharedVariablesToDeclare.end(); it++) {
//     //     Value *value = *it;
//     //     cout << "shared:" << endl;
//     //     value->dump();
//     //     cout << endl;
//     // }
//     // Value *shared = *blockDumper.sharedVariablesToDeclare.begin();
//     // shared->dump();
// }

} // namespace
