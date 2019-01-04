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

// 
//

#pragma once

#include <string>
#include <set>
#include <map>


namespace cocl {

class FunctionNamesMap {
public:
    FunctionNamesMap() {
        populateKnownValues();
    }
    bool isMappedFunction(std::string name) const;
    bool isIgnoredFunction(std::string name) const;
    bool isIgnoredGlobalVariable(std::string name) const;
    std::string getFunctionMappedName(std::string name) const;
protected:
    void populateKnownValues();
    // std::set<std::string> ignoredFunctionNames;
    std::set<std::string> ignoredGlobalVariables;
    std::map<std::string, std::string> knownFunctionsMap; // from cuda to opencl, eg tid.x => get_global_id
};

} // namespace cocl
