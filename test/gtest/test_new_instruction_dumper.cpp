#include "type_dumper.h"
#include "GlobalNames.h"
#include "LocalNames.h"
#include "function_names_map.h"
#include "new_instruction_dumper.h"
#include "InstructionDumper.h"

#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
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

class StandaloneBlock{
public:
    StandaloneBlock() {
        M.reset(new Module("mymodule", context));
        F = cast<Function>(M->getOrInsertFunction(
            "mykernel",
            Type::getVoidTy(context),
            NULL
        ));
        F->setCallingConv(CallingConv::C);
        F->dump();
        block = BasicBlock::Create(context, "entry", F);
        block->dump();
    }
    virtual ~StandaloneBlock() {

    }
    LLVMContext context;
    unique_ptr<Module> M;
    Function *F;
    BasicBlock *block;
    // unique_ptrIRBuilder builder;
};

class InstructionDumperWrapper {
public:
    InstructionDumperWrapper() {
        typeDumper.reset(new TypeDumper(&globalNames));
        instructionDumper.reset(new NewInstructionDumper(&globalNames, &localNames, typeDumper.get(), &functionNamesMap,
            &shimFunctionsNeeded,
            &neededFunctions,
            &globalExpressionByValue, &localValueInfos, &allocaDeclarations));
    }
    virtual ~InstructionDumperWrapper() {

    }
    // void runRhsGeneration(Instruction *inst) {
    //     // instructionDumper->runRhsGeneration(inst, &extraInstructions, dumpedFunctions, returnTypeByFunction);
    // }
    // string getExpr(Instruction *inst) {
    //     return instructionDumper->localExpressionByValue->at(inst);
    // }

    GlobalNames globalNames;
    LocalNames localNames;
    unique_ptr<TypeDumper> typeDumper;
    FunctionNamesMap functionNamesMap;

    map<Function *, Type*> returnTypeByFunction;

    std::set<std::string> shimFunctionsNeeded;
    std::set<llvm::Function *> neededFunctions;

    std::map<llvm::Value *, std::string> globalExpressionByValue;
    map<Value *, unique_ptr<LocalValueInfo> > localValueInfos;
    std::vector<AllocaInfo> allocaDeclarations;

    unique_ptr<NewInstructionDumper> instructionDumper;
};

TEST(test_new_instruction_dumper, test_add) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);

    LLVMContext &context = myblock.context;
    // we should create allocas really, and load those.  I guess?
    AllocaInst *a = builder.CreateAlloca(IntegerType::get(context, 32));
    AllocaInst *b = builder.CreateAlloca(IntegerType::get(context, 32));

    LoadInst *aLoad = builder.CreateLoad(a);
    LoadInst *bLoad = builder.CreateLoad(b);

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    // since they are declared, we expect to find them in localnames:
    // wrapper.localNames.getOrCreateName(aLoad, "v_a");
    // wrapper.localNames.getOrCreateName(bLoad, "v_b");

    LocalValueInfo *aLoadInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, aLoad, "v_a");
    aLoadInfo->setExpression(aLoadInfo->name);
    // aLoadInfo->setAsAssigned();
    LocalValueInfo *bLoadInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, bLoad, "v_b");
    bLoadInfo->setExpression(bLoadInfo->name);
    // bLoadInfo->setAsAssigned();

    // Instruction *add = BinaryOperator::Create(Instruction::FAdd, aLoad, bLoad);
    Instruction *add = cast<Instruction>(builder.CreateAdd(aLoad, bLoad));

    LocalValueInfo *addInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, add);
    instructionDumper->runGeneration(addInfo);

    // wrapper.runRhsGeneration(add);
    // string expr = wrapper.getExpr(add);
    string expr = addInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v_a + v_b", expr);

    ostringstream oss;
    addInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    oss.str("");
    addInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    cout << "after setAsAssigned:" << endl;
    addInfo->setAsAssigned();

    oss.str("");
    addInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;

    oss.str("");
    addInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;

    // if we check local names, we should NOT find the add, since we havent declared it
    // ASSERT_FALSE(wrapper.localNames.hasValue(add));

    // but we should find an expression for it:
    /// oh ... we already tested this :-)

    // we should not find a requirement to declare the variable
    // ASSERT_EQ(0u, wrapper.variablesToDeclare.size());
    // ... and no allocas
    // ASSERT_EQ(0u, wrapper.allocaDeclarations.size());
}

TEST(test_new_instruction_dumper, test_alloca) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);

    LLVMContext &context = myblock.context;
    // we should create allocas really, and load those.  I guess?
    AllocaInst *a = builder.CreateAlloca(IntegerType::get(context, 32));

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    // Instruction *add = cast<Instruction>(builder.CreateAdd(aLoad, bLoad));

    LocalValueInfo *aInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, a);
    instructionDumper->runGeneration(aInfo);

    string expr = aInfo->getExpr();
    cout << "expr " << expr << endl;
    // ASSERT_EQ("v_a + v_b", expr);

    ostringstream oss;
    aInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    oss.str("");
    aInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    cout << "after setAsAssigned:" << endl;
    aInfo->setAsAssigned();

    oss.str("");
    aInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;

    oss.str("");
    aInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;

    // if we check local names, we should NOT find the add, since we havent declared it
    // ASSERT_FALSE(wrapper.localNames.hasValue(add));

    // but we should find an expression for it:
    /// oh ... we already tested this :-)

    // we should not find a requirement to declare the variable
    // ASSERT_EQ(0u, wrapper.variablesToDeclare.size());
    // ... and no allocas
    // ASSERT_EQ(0u, wrapper.allocaDeclarations.size());
}

}
