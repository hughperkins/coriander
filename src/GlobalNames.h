#pragma once

#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Type.h"

#include <map>
#include <string>

namespace cocl {

// class Nameable {
// public:
//     virtual bool isType() { return false }
//     virtual bool isValue() { return false }
//     virtual Value *asValue() { throw runtime_error("Not a value") }
//     virtual Value *asType() { throw runtime_error("Not a type") }
// };

// class NamedType : Nameable {
// public:
//     llvm::Type *type;
//     virtual bool isType() { return true }
//     virtual Value *asType() { return type; }
// };

// class NamedValue : Nameable {
// public:
//     Value *value;
//     virtual bool isValue() { return true }
//     virtual Value *asValue() { return value; }
// };

class GlobalNames {
public:
    std::string getName(llvm::Value *value);
    std::string getOrCreateName(llvm::Value *value, std::string proposedName="");
    bool hasName(llvm::Value *value);
    llvm::Value *getValueByName(std::string name);

    bool hasName(std::string name);

    std::string getName(llvm::Type *type);
    std::string getOrCreateName(llvm::Type *type, std::string proposedName="");
    bool hasName(llvm::Type *type);

protected:
    std::string createName(llvm::Type *type, std::string name);
    std::string createName(llvm::Value *value, std::string name);
    bool isNameAvailable(std::string name);

    std::map<llvm::Value *, std::string> nameByValue;
    std::map<std::string, llvm::Value *> valueByName;

    // std::set<unique_ptr<Nameable>> nameables;
    std::map<llvm::Type *, std::string> nameByType;
    std::map<std::string, llvm::Type *> typeByName;

    int nextIndex = 1;
};

} // namespace cocl
