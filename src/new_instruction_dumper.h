#pragma once

#include "LocalValueInfo.h"
#include "InstructionDumper.h"

#include <string>

namespace cocl {

class NewInstructionDumper {
public:
    NewInstructionDumper(
        GlobalNames *globalNames,
        LocalNames *localNames,
        TypeDumper *typeDumper,
        const FunctionNamesMap *functionNamesMap,

        std::set<std::string> *shimFunctionsNeeded,
        std::set<llvm::Function *> *neededFunctions,

        std::map<llvm::Value *, std::string> *globalExpressionByValue,
        std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos
    );

    void dumpIcmp(LocalValueInfo *localValueInfo);
    void dumpFcmp(LocalValueInfo *localValueInfo);

    void dumpExt(LocalValueInfo *localValueInfo);
    void dumpTrunc(LocalValueInfo *localValueInfo);
    void dumpBitCast(LocalValueInfo *localValueInfo);
    void dumpAddrSpaceCast(LocalValueInfo *localValueInfo);
    void dumpBinaryOperator(LocalValueInfo *localValueInfo, std::string opstring);

    void dumpSelect(LocalValueInfo *localValueInfo);
    void dumpGetElementPtr(cocl::LocalValueInfo *localValueInfo);
    void dumpAlloca(cocl::LocalValueInfo *localValueInfo);
    void dumpLoad(cocl::LocalValueInfo *localValueInfo);
    void dumpStore(cocl::LocalValueInfo *localValueInfo);
    void dumpInsertValue(cocl::LocalValueInfo *localValueInfo);
    void dumpExtractValue(cocl::LocalValueInfo *localValueInfo);

    LocalValueInfo *getOperand(llvm::Value *op);
    LocalValueInfo *dumpConstant(llvm::Constant *constant);
    void dumpConstantExpr(LocalValueInfo *localValueInfo);
    // LocalValueInfo *CreateConstantInfo(Consant *constant);
    void dumpMemcpyCharCharLong(LocalValueInfo *localValueInfo);
    void dumpCall(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    void runGeneration(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    cocl::GlobalNames *globalNames = 0;
    cocl::LocalNames *localNames = 0;   // these are names for instructions etc, doesnt say anything about whether they've been declared
                                        // they're always some single idnetifier, eg "v3", never compound, ie never "v1 + v3"
    cocl::TypeDumper *typeDumper = 0;
    const cocl::FunctionNamesMap *functionNamesMap = 0;

    std::set<std::string> *shimFunctionsNeeded = 0; // for __shfldown_3 etc, that we provide as opencl directly
    std::set<llvm::Function *> *neededFunctions = 0;

    std::map<llvm::Value *, std::string> *globalExpressionByValue = 0;
    std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos = 0;

    bool forceSingle = true;
};

} // namespace cocl
