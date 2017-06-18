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

// shims are things like '__shfldown_3', that dont exist natively in OpenCL

#include <set>
#include <map>
#include <string>

namespace cocl {

class Shims {
public:
    Shims();
    virtual ~Shims() {}
    void use(std::string name);
    void copyFrom(const Shims &source);
    void writeCl(std::ostream &os);
    bool isUsed(std::string name);

protected:
    std::map<std::string, std::string> _shimClByName;
    std::map<std::string, std::set<std::string> > _dependenciesByName;
    std::set<std::string> shimsToBeUsed;
};

} // namespace cocl
