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
            &globalExpressionByValue, &localValueInfos));
    }
    virtual ~InstructionDumperWrapper() {

    }
    void declareVariable(Value *var, string name) {
        LocalValueInfo *valueInfo = LocalValueInfo::getOrCreate(
            &localNames, &localValueInfos, var, name);
        valueInfo->setExpression(valueInfo->name);
    }
    LocalValueInfo *createInfo(Value *var, string name) {        
        LocalValueInfo *valueInfo = LocalValueInfo::getOrCreate(
            &localNames, &localValueInfos, var, name);
        return valueInfo;
    }

    GlobalNames globalNames;
    LocalNames localNames;
    unique_ptr<TypeDumper> typeDumper;
    FunctionNamesMap functionNamesMap;

    map<Function *, Type*> returnTypeByFunction;

    std::set<std::string> shimFunctionsNeeded;
    std::set<llvm::Function *> neededFunctions;

    std::map<llvm::Value *, std::string> globalExpressionByValue;
    map<Value *, unique_ptr<LocalValueInfo> > localValueInfos;
    // std::vector<AllocaInfo> allocaDeclarations;

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

    wrapper.declareVariable(aLoad, "v_a");
    wrapper.declareVariable(bLoad, "v_b");

    Instruction *add = cast<Instruction>(builder.CreateAdd(aLoad, bLoad));
    LocalValueInfo *addInfo = wrapper.createInfo(add, "v1");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(addInfo, returnTypeByFunction);

    // wrapper.runRhsGeneration(add);
    // string expr = wrapper.getExpr(add);
    string expr = addInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("(v_a + v_b)", expr);

    ostringstream oss;
    addInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    addInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    addInfo->setAsAssigned();

    oss.str("");
    addInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int v1;\n", oss.str());

    oss.str("");
    addInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    v1 = v_a + v_b;\n", oss.str());
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
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(aInfo, returnTypeByFunction);

    string expr = aInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v1", expr);

    ostringstream oss;
    aInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int v1[1];\n", oss.str());

    oss.str("");
    aInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    aInfo->setAsAssigned();

    oss.str("");
    aInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int v1[1];\n", oss.str());

    oss.str("");
    aInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    expr = aInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v1", expr);
}

TEST(test_new_instruction_dumper, store) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);

    LLVMContext &context = myblock.context;
    // create an alloca,and store into that?
    AllocaInst *a = builder.CreateAlloca(IntegerType::get(context, 32));
    AllocaInst *b = builder.CreateAlloca(IntegerType::get(context, 32));

    LoadInst *aLoad = builder.CreateLoad(a);

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    wrapper.declareVariable(aLoad, "aLoad");
    wrapper.declareVariable(b, "b");

    StoreInst *bStore = builder.CreateStore(aLoad, b);
    LocalValueInfo *bStoreInfo = wrapper.createInfo(bStore, "bStore");

    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(bStoreInfo, returnTypeByFunction);

    ASSERT_FALSE(bStoreInfo->hasExpr());

    ostringstream oss;
    bStoreInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    bStoreInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    b[0] = aLoad;\n", oss.str());

    cout << "after setAsAssigned:" << endl;
    bStoreInfo->setAsAssigned();

    ASSERT_FALSE(bStoreInfo->hasExpr());

    oss.str("");
    bStoreInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    bStoreInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    b[0] = aLoad;\n", oss.str());
}


TEST(test_new_instruction_dumper, insert_value_already_defined) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;

    Type *structElements[] = {
        IntegerType::get(context, 32),
        IntegerType::get(context, 32)
    };
    StructType *myStructType = StructType::create(
        context, structElements, "struct.mystruct"
    );
    myStructType->dump();
    cout << endl;

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *aAlloca = builder.CreateAlloca(myStructType);
    LoadInst *aLoad = builder.CreateLoad(aAlloca);

    AllocaInst *intAlloca = builder.CreateAlloca(IntegerType::get(context, 32));
    LoadInst *intLoad = builder.CreateLoad(intAlloca);

    unsigned int idxs0[] = {1};
    InsertValueInst *insert = cast<InsertValueInst>(builder.CreateInsertValue(aLoad, intLoad, idxs0));

    myblock.block->dump();

    // LocalValueInfo *aAllocaInfo = LocalValueInfo::getOrCreate(
    //     &wrapper.localNames, &wrapper.localValueInfos, aAlloca, "aAlloca");
    // aAllocaInfo->setExpression(aAllocaInfo->name);

    LocalValueInfo *aLoadInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, aLoad, "aLoad");
    aLoadInfo->setExpression(aLoadInfo->name);

    LocalValueInfo *intLoadInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, intLoad, "intLoad");
    intLoadInfo->setExpression(intLoadInfo->name);

    LocalValueInfo *insertInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, insert);
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(insertInfo, returnTypeByFunction);

    cout << "hasexpr " << insertInfo->hasExpr() << endl;
    ASSERT_TRUE(insertInfo->hasExpr());
    cout << "expr: " << insertInfo->getExpr() << endl;
    ASSERT_EQ("aLoad", insertInfo->getExpr());

    ostringstream oss;
    insertInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    insertInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    aLoad.f1 = intLoad;\n", oss.str());

    ASSERT_FALSE(insertInfo->toBeDeclared);

    cout << "after setAsAssigned:" << endl;
    insertInfo->setAsAssigned();

    cout << "hasexpr " << insertInfo->hasExpr() << endl;
    ASSERT_TRUE(insertInfo->hasExpr());
    cout << "expr: " << insertInfo->getExpr() << endl;

    oss.str("");
    insertInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    insertInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    aLoad.f1 = intLoad;\n", oss.str());
}

TEST(test_new_instruction_dumper, insert_value_from_undef) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;

    Type *structElements[] = {
        IntegerType::get(context, 32),
        IntegerType::get(context, 32)
    };
    StructType *myStructType = StructType::create(
        context, structElements, "struct.mystruct"
    );
    myStructType->dump();
    cout << endl;

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *intAlloca = builder.CreateAlloca(IntegerType::get(context, 32));
    LoadInst *intLoad = builder.CreateLoad(intAlloca);

    LocalValueInfo *intLoadInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, intLoad, "intLoad");
    intLoadInfo->setExpression(intLoadInfo->name);

    Value *undefInput = UndefValue::get(myStructType);
    unsigned int idxs0[] = {0};
    InsertValueInst *insert = cast<InsertValueInst>(builder.CreateInsertValue(undefInput, intLoad, idxs0));

    myblock.block->dump();

    LocalValueInfo *insertInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, insert);
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(insertInfo, returnTypeByFunction);

    cout << "hasexpr " << insertInfo->hasExpr() << endl;
    ASSERT_TRUE(insertInfo->hasExpr());
    cout << "expr: " << insertInfo->getExpr() << endl;
    ASSERT_EQ("v1", insertInfo->getExpr());

    ostringstream oss;
    insertInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    struct mystruct v1;\n", oss.str());

    oss.str("");
    insertInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    v1.f0 = intLoad;\n", oss.str());

    cout << "after setAsAssigned:" << endl;
    insertInfo->setAsAssigned();

    ASSERT_TRUE(insertInfo->toBeDeclared);
}

TEST(test_new_instruction_dumper, insert_value_from_undef_f1) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;

    Type *structElements[] = {
        IntegerType::get(context, 32),
        IntegerType::get(context, 32)
    };
    StructType *myStructType = StructType::create(
        context, structElements, "struct.mystruct"
    );
    myStructType->dump();
    cout << endl;

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *intAlloca = builder.CreateAlloca(IntegerType::get(context, 32));
    LoadInst *intLoad = builder.CreateLoad(intAlloca);

    LocalValueInfo *intLoadInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, intLoad, "intLoad");
    intLoadInfo->setExpression(intLoadInfo->name);

    Value *undefInput = UndefValue::get(myStructType);
    unsigned int idxs0[] = {1};
    InsertValueInst *insert = cast<InsertValueInst>(builder.CreateInsertValue(undefInput, intLoad, idxs0));

    myblock.block->dump();

    LocalValueInfo *insertInfo = LocalValueInfo::getOrCreate(
        &wrapper.localNames, &wrapper.localValueInfos, insert);
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(insertInfo, returnTypeByFunction);

    cout << "hasexpr " << insertInfo->hasExpr() << endl;
    ASSERT_TRUE(insertInfo->hasExpr());
    cout << "expr: " << insertInfo->getExpr() << endl;
    ASSERT_EQ("v1", insertInfo->getExpr());

    ostringstream oss;
    insertInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    struct mystruct v1;\n", oss.str());

    oss.str("");
    insertInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    v1.f1 = intLoad;\n", oss.str());

    cout << "after setAsAssigned:" << endl;
    insertInfo->setAsAssigned();

    ASSERT_TRUE(insertInfo->toBeDeclared);
}

TEST(test_new_instruction_dumper, test_icmp) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(IntegerType::get(context, 32));
    AllocaInst *b = builder.CreateAlloca(IntegerType::get(context, 32));

    LoadInst *aLoad = builder.CreateLoad(a);
    LoadInst *bLoad = builder.CreateLoad(b);

    wrapper.declareVariable(aLoad, "v_a");
    wrapper.declareVariable(bLoad, "v_b");

    ICmpInst *instr = cast<ICmpInst>(builder.CreateICmpSLT(aLoad, bLoad));
    instr->dump();
    cout << endl;
    cout << "instr->  predicate " << instr->getPredicate() << endl;

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v_a < v_b", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    bool myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = v_a < v_b;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_fcmp) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(Type::getFloatTy(context));
    AllocaInst *b = builder.CreateAlloca(Type::getFloatTy(context));

    LoadInst *aLoad = builder.CreateLoad(a);
    LoadInst *bLoad = builder.CreateLoad(b);

    wrapper.declareVariable(aLoad, "v_a");
    wrapper.declareVariable(bLoad, "v_b");

    FCmpInst *instr = cast<FCmpInst>(builder.CreateFCmpOLT(aLoad, bLoad));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v_a < v_b", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    bool myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = v_a < v_b;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_sext) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(IntegerType::get(context, 8));

    LoadInst *aLoad = builder.CreateLoad(a);

    wrapper.declareVariable(aLoad, "v_a");

    Instruction *instr = cast<Instruction>(builder.CreateSExt(aLoad, IntegerType::get(context, 32)));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v_a", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = v_a;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_zext) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(IntegerType::get(context, 8));

    LoadInst *aLoad = builder.CreateLoad(a);

    wrapper.declareVariable(aLoad, "v_a");

    Instruction *instr = cast<Instruction>(builder.CreateZExt(aLoad, IntegerType::get(context, 32)));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v_a", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = v_a;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_fpext) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(Type::getFloatTy(context));

    LoadInst *aLoad = builder.CreateLoad(a);

    wrapper.declareVariable(aLoad, "v_a");

    Instruction *instr = cast<Instruction>(builder.CreateFPExt(aLoad, Type::getDoubleTy(context)));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v_a", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    float myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = v_a;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_fptrunc) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(Type::getDoubleTy(context));

    LoadInst *aLoad = builder.CreateLoad(a);

    wrapper.declareVariable(aLoad, "v_a");

    Instruction *instr = cast<Instruction>(builder.CreateFPTrunc(aLoad, Type::getFloatTy(context)));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("(float)v_a", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    float myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = (float)v_a;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_bitcast) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(Type::getFloatTy(context));

    LoadInst *aLoad = builder.CreateLoad(a);

    wrapper.declareVariable(aLoad, "v_a");

    Instruction *instr = cast<Instruction>(builder.CreateBitCast(aLoad, IntegerType::get(context, 32)));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("*(int *)&(v_a)", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = *(int *)&(v_a);\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_addrspacecast) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *a = builder.CreateAlloca(Type::getFloatTy(context));

    // LoadInst *aLoad = builder.CreateLoad(a);

    wrapper.declareVariable(a, "v_a");

    Instruction *instr = cast<Instruction>(builder.CreateAddrSpaceCast(a, PointerType::get(Type::getFloatTy(context), 1)));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("v_a", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    float* myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    // we just ignore address space casts, since thye're not actually possible in opencl 1.2 :-P,
    // and because, everywhere they're used, ignoring them works ok
    ASSERT_EQ("    myinstr = v_a;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, test_select) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *conditionAlloca = builder.CreateAlloca(IntegerType::get(context, 1));
    AllocaInst *aAlloca = builder.CreateAlloca(Type::getFloatTy(context));
    AllocaInst *bAlloca = builder.CreateAlloca(Type::getFloatTy(context));

    LoadInst *condition = builder.CreateLoad(conditionAlloca);
    LoadInst *a = builder.CreateLoad(aAlloca);
    LoadInst *b = builder.CreateLoad(bAlloca);

    wrapper.declareVariable(condition, "mycondition");
    wrapper.declareVariable(a, "v_a");
    wrapper.declareVariable(b, "v_b");

    Instruction *instr = cast<Instruction>(builder.CreateSelect(condition, a, b));

    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");
    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    string expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("mycondition ? v_a : v_b", expr);

    ostringstream oss;
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    float myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    // we just ignore address space casts, since thye're not actually possible in opencl 1.2 :-P,
    // and because, everywhere they're used, ignoring them works ok
    ASSERT_EQ("    myinstr = mycondition ? v_a : v_b;\n", oss.str());

    expr = instrInfo->getExpr();
    cout << "expr " << expr << endl;
    ASSERT_EQ("myinstr", expr);
}

TEST(test_new_instruction_dumper, getelementptr_struct) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;

    Type *structElements[] = {
        IntegerType::get(context, 32),
        IntegerType::get(context, 32)
    };
    StructType *myStructType = StructType::create(
        context, structElements, "struct.mystruct"
    );
    myStructType->dump();
    cout << endl;

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *structAlloca = builder.CreateAlloca(myStructType);
    // LoadInst *structLoad = builder.CreateLoad(structAlloca);

    // AllocaInst *intAlloca = builder.CreateAlloca(IntegerType::get(context, 32));
    // LoadInst *intLoad = builder.CreateLoad(intAlloca);

    wrapper.declareVariable(structAlloca, "structAlloca");

    // unsigned int idxs0[] = {0};
    GetElementPtrInst *instr = cast<GetElementPtrInst>(builder.CreateConstGEP2_32(myStructType, structAlloca, 0, 1));
    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");

    myblock.block->dump();

    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    cout << "hasexpr " << instrInfo->hasExpr() << endl;
    ASSERT_TRUE(instrInfo->hasExpr());
    cout << "expr: " << instrInfo->getExpr() << endl;
    ASSERT_EQ("(&structAlloca[0].f1)", instrInfo->getExpr());

    ostringstream oss;

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    cout << "hasexpr " << instrInfo->hasExpr() << endl;
    ASSERT_TRUE(instrInfo->hasExpr());
    cout << "expr: " << instrInfo->getExpr() << endl;
    ASSERT_EQ("myinstr", instrInfo->getExpr());

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int* myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = (&structAlloca[0].f1);\n", oss.str());
}

TEST(test_new_instruction_dumper, extractvalue_struct) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;

    Type *structElements[] = {
        IntegerType::get(context, 32),
        IntegerType::get(context, 32)
    };
    StructType *myStructType = StructType::create(
        context, structElements, "struct.mystruct"
    );
    myStructType->dump();
    cout << endl;

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *structAlloca = builder.CreateAlloca(myStructType);
    LoadInst *structLoad = builder.CreateLoad(structAlloca);

    // AllocaInst *intAlloca = builder.CreateAlloca(IntegerType::get(context, 32));
    // LoadInst *intLoad = builder.CreateLoad(intAlloca);

    wrapper.declareVariable(structLoad, "structLoad");

    unsigned int idxs[] = {0};
    ExtractValueInst *instr = cast<ExtractValueInst>(builder.CreateExtractValue(structLoad, ArrayRef<unsigned>(idxs)));
    LocalValueInfo *instrInfo = wrapper.createInfo(instr, "myinstr");

    myblock.block->dump();

    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    cout << "hasexpr " << instrInfo->hasExpr() << endl;
    ASSERT_TRUE(instrInfo->hasExpr());
    cout << "expr: " << instrInfo->getExpr() << endl;
    ASSERT_EQ("structLoad.f0", instrInfo->getExpr());

    ostringstream oss;

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    cout << "hasexpr " << instrInfo->hasExpr() << endl;
    ASSERT_TRUE(instrInfo->hasExpr());
    cout << "expr: " << instrInfo->getExpr() << endl;
    ASSERT_EQ("myinstr", instrInfo->getExpr());

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    int myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = structLoad.f0;\n", oss.str());
}

TEST(test_new_instruction_dumper, callsomething) {
    StandaloneBlock myblock;
    IRBuilder<> builder(myblock.block);
    LLVMContext &context = myblock.context;
    Module *M = myblock.M.get();

    InstructionDumperWrapper wrapper;
    NewInstructionDumper *instructionDumper = wrapper.instructionDumper.get();

    AllocaInst *charArray = builder.CreateAlloca(IntegerType::get(context, 8));
    cout << "charArray:" << endl;
    charArray->dump();
    cout << endl;

    Function *childF = cast<Function>(M->getOrInsertFunction(
        "mychildfunc",
        PointerType::get(IntegerType::get(context, 8), 0),
        PointerType::get(IntegerType::get(context, 8), 0),
        NULL));
    cout << "childF:" << endl;
    childF->dump();
    cout << endl;

    Value *args[] = {charArray};
    CallInst *call = builder.CreateCall(childF, ArrayRef<Value *>(args));
    cout << "call:" << endl;
    call->dump();
    cout << endl;

    wrapper.declareVariable(charArray, "charArray");

    // wrapper.localNames.getOrCreateName(charArray, "myCharArray");
    // ASSERT_EQ(0u, instructionDumper->localExpressionByValue->size());

    LocalValueInfo *instrInfo = wrapper.createInfo(call, "myinstr");

    myblock.block->dump();

    std::map<llvm::Function *, llvm::Type *> returnTypeByFunction;
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    ASSERT_TRUE(instrInfo->needDependencies);
    ASSERT_EQ(1u, instructionDumper->neededFunctions->size());
    cout << "needed function:" << endl;
    (*instructionDumper->neededFunctions->begin())->dump();
    cout << endl;
    ASSERT_EQ(childF, (*instructionDumper->neededFunctions->begin()));
    // ASSERT_EQ(0u, instructionDumper->generatedCl.size());
    // ASSERT_EQ(0u, instructionDumper->variablesToDeclare->size());
    // ASSERT_EQ(0u, instructionDumper->globalExpressionByValue->size());
    // ASSERT_EQ(0u, instructionDumper->localExpressionByValue->size());

    cout << "hasexpr " << instrInfo->hasExpr() << endl;
    ASSERT_FALSE(instrInfo->hasExpr());

    ostringstream oss;

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    cout << "================" << endl;
    cout << "After marking th efunction defined:" << endl;

    returnTypeByFunction[childF] = PointerType::get(IntegerType::get(context, 8), 1);
    instructionDumper->runGeneration(instrInfo, returnTypeByFunction);

    ASSERT_FALSE(instrInfo->needDependencies);
    ASSERT_EQ(1u, instructionDumper->neededFunctions->size());

    cout << "hasexpr " << instrInfo->hasExpr() << endl;
    ASSERT_TRUE(instrInfo->hasExpr());
    cout << "expr: " << instrInfo->getExpr() << endl;
    ASSERT_EQ("mychildfunc(charArray)", instrInfo->getExpr());

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("", oss.str());

    // (*instructionDumper->neededFunctions->begin())->dump();
    // cout << endl;
    // ASSERT_EQ(childF, (*instructionDumper->neededFunctions->begin()));
    // ASSERT_EQ(0u, instructionDumper->generatedCl.size());
    // ASSERT_EQ(0u, instructionDumper->variablesToDeclare->size());
    // ASSERT_EQ(0u, instructionDumper->globalExpressionByValue->size());
    // ASSERT_EQ(1u, instructionDumper->localExpressionByValue->size());
    // auto it = instructionDumper->localExpressionByValue->begin();
    // cout << "localexpr name=[" << it->second << "]" << endl;
    // cout << "local expr value=" << endl;
    // it->first->dump();
    // cout << endl;
    // cout << wrapper.getExpr(call) << endl;
    // ASSERT_EQ("mychildfunc(myCharArray)", it->second);
    // ASSERT_EQ(call, it->first);

    cout << "----------------------------" << endl;
    cout << "after setAsAssigned:" << endl;
    instrInfo->setAsAssigned();

    cout << "hasexpr " << instrInfo->hasExpr() << endl;
    ASSERT_TRUE(instrInfo->hasExpr());
    cout << "expr: " << instrInfo->getExpr() << endl;
    ASSERT_EQ("myinstr", instrInfo->getExpr());

    oss.str("");
    instrInfo->writeDeclaration("    ", wrapper.typeDumper.get(), oss);
    cout << "declaration [" << oss.str() << "]" << endl;
    ASSERT_EQ("    global char* myinstr;\n", oss.str());

    oss.str("");
    instrInfo->writeInlineCl("    ", oss);
    cout << "inelineCl [" << oss.str() << "]" << endl;
    ASSERT_EQ("    myinstr = mychildfunc(charArray);\n", oss.str());
}

}
