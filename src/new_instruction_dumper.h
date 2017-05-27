#pragma once

#include "LocalValueInfo.h"
#include "InstructionDumper.h"

// #include "llvm/Support/Casting.h"

#include <string>
#include <stdexcept>

namespace cocl {

class NeedValueDependencyException : public std::exception {
public:
    NeedValueDependencyException(llvm::Value *value) : value(value) {
    }
    virtual const char* what() const throw()
    {
        value->dump();
        return "Need dependent value";
    }
    llvm::Value *value;
};

// class Dependency {
// public:
//     virtual ~Dependency() {}

// // http://llvm.org/docs/HowToSetUpLLVMStyleRTTI.html
//     enum DependencyKind {
//         DependencyKind_Base,
//         DependencyKind_Function,
//         DependencyKind_Value
//     };
//     Dependency(DependencyKind kind=DependencyKind_Base) : Kind(kind) {}
//     DependencyKind getKind() const { return Kind; }
//     static bool classof(const Dependency *target) {
//         return target->getKind() == DependencyKind_Base;
//     }

// private:
//     const DependencyKind Kind;
// };

// class FunctionDependency : public Dependency {
// public:
//     FunctionDependency(llvm::Function *F) : Dependency(DependencyKind_Function), F(F) {}
//     virtual ~FunctionDependency() {}

//     static bool classof(const Dependency *target) {
//         return target->getKind() == DependencyKind_Function;
//     }

//     llvm::Function *F;
// };

// class ValueDependency : public Dependency {
// public:
//     ValueDependency(llvm::Value *value) : Dependency(DependencyKind_Value), value(value) {}
//     virtual ~ValueDependency() {}

//     static bool classof(const Dependency *target) {
//         return target->getKind() == DependencyKind_Value;
//     }

//     llvm::Value *value;
// };

class NewInstructionDumper {
public:
    NewInstructionDumper(
        llvm::Module *M,
        GlobalNames *globalNames,
        LocalNames *localNames,
        TypeDumper *typeDumper,
        const FunctionNamesMap *functionNamesMap,

        std::set<std::string> *shimFunctionsNeeded,
        std::set<llvm::Function *> *neededFunctions,

        std::map<llvm::Value *, std::string> *globalExpressionByValue,
        std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos
        // std::map<std::string, std::string> *shortFnNameByOrigName
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
    // void dumpMemcpyCharCharLong(LocalValueInfo *localValueInfo);
    void dumpMemcpy(LocalValueInfo *localValueInfo, int align);
    void dumpCall(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    void runGeneration(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction);

    NewInstructionDumper *addIRToCl(bool set=true) {
        _addIRToCl = set;
        return this;
    }

    llvm::Module *M = 0;

    cocl::GlobalNames *globalNames = 0;
    cocl::LocalNames *localNames = 0;   // these are names for instructions etc, doesnt say anything about whether they've been declared
                                        // they're always some single idnetifier, eg "v3", never compound, ie never "v1 + v3"
    cocl::TypeDumper *typeDumper = 0;
    const cocl::FunctionNamesMap *functionNamesMap = 0;

    std::set<std::string> *shimFunctionsNeeded = 0; // for __shfldown_3 etc, that we provide as opencl directly
    std::set<llvm::Function *> *neededFunctions = 0;
    // std::map<std::string, std::string> *shortFnNameByOrigName = 0;
    // std::set<std::unique_ptr<Dependency> > neededDependencies; // this will probably replace neededFunctions soon, but for now is only for needed values

    std::map<llvm::Value *, std::string> *globalExpressionByValue = 0;
    std::map<llvm::Value *, std::unique_ptr<LocalValueInfo > > *localValueInfos = 0;

    bool forceSingle = true;
    bool _addIRToCl = false;
};

} // namespace cocl
