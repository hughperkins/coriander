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

#pragma once

#include <string>
#include <sstream>

// #include "llvm/IR/Instructions.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"

// template<typename T>
// std::string toString(T value) {
//     std::ostringstream oss;
//     oss << value;
//     return oss.str();
// }

// // offset: since we're walking a tree, over a base type, what is our offset into
// // the base type?
// void walkStructType(llvm::Module *M, StructInfo *structInfo, int level, int offset, std::vector<int> indices, std::string path, llvm::StructType *type);
// void walkType(llvm::Module *M, StructInfo *structInfo, int level, int offset, std::vector<int> indices, std::string path, llvm::Type *type);
// std::string getIndent(int level);
