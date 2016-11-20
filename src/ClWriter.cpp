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

#include "ClWriter.h"

#include "LocalValueInfo.h"
#include "mutations.h"

#include <iostream>
using namespace std;
using namespace llvm;

namespace cocl {

void ClWriter::writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os) {  // if we set this as to be assigned, this will write something, otherwise it wont
    for(auto it = localValueInfo->declarationCl.begin(); it != localValueInfo->declarationCl.end(); it++) {
        os << indent << *it << ";\n";
    }
    if(localValueInfo->toBeDeclared) {
        os << indent << typeDumper->dumpType(localValueInfo->value->getType()) << " " << localValueInfo->name << ";\n";
    }
}

void ClWriter::writeInlineCl(std::string indent, std::ostream &os) { // writes any cl required, eg if we toggled setAsAssigned, we need to do the assignment
                                          // some instructoins will *always* write something, eg stores
    for(auto it = localValueInfo->inlineCl.begin(); it != localValueInfo->inlineCl.end(); it++) {
        os << indent << *it << ";\n";
    }
    if(localValueInfo->toBeDeclared) {
        os << indent << localValueInfo->name << " = " << localValueInfo->getExpr() << ";\n";
    }
    // expression = name;
}

} // namespace cocl;
