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

#include "LocalNames.h"
#include "GlobalNames.h"
#include "type_dumper.h"
#include "function_names_map.h"
// #include "LocalValueInfo.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"

#include <vector>
#include <string>
#include <memory>

namespace cocl {

class LocalValueInfo;

class ClWriter {
public:
    ClWriter(LocalValueInfo *localValueInfo) :
        localValueInfo(localValueInfo) {

    }
    virtual ~ClWriter() {

    }
    virtual void writeDeclaration(std::string indent, TypeDumper *typeDumper, std::ostream &os);  // if we set this as to be assigned, this will write something, otherwise it wont
    virtual void writeInlineCl(std::string indent, std::ostream &os); // writes any cl required, eg if we toggled setAsAssigned, we need to do the assignment
                                          // some instructoins will *always* write something, eg stores

    LocalValueInfo *localValueInfo;
};

class AllocaClWriter : public ClWriter {
public:
    AllocaClWriter(LocalValueInfo *localValueInfo) :
        ClWriter(localValueInfo) {

        }
};

class BinaryClWriter : public ClWriter {
public:
    BinaryClWriter(LocalValueInfo *localValueInfo) :
        ClWriter(localValueInfo) {
            
        }
};

} // namespace cocl
