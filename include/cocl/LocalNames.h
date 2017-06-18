#pragma once

#include "llvm/IR/Value.h"

#include <map>
#include <string>

namespace cocl {

class LocalNames {
public:
    std::string getName(llvm::Value *value);
    std::string getNameOrEmpty(llvm::Value *value);
    bool hasValue(llvm::Value *value);
    bool hasName(std::string name);
    std::string getOrCreateName(llvm::Value *value, std::string proposedName="");
    std::map<llvm::Value *, std::string> nameByValue;
    std::string dumpNames();
protected:
    std::string createName(llvm::Value *value, std::string name);
    std::map<std::string, llvm::Value *> valueByName;
    int nextIndex = 1;
};

} // namespace cocl
