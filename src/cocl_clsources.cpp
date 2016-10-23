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

#include "cocl/cocl_clsources.h"

#include <vector>
#include <string>
#include <iostream>

namespace cocl {
    // static std::vector< std::string > clSources;
    std::vector< std::string > *pClSources = 0;

    int getNumClSources() {
        // std::cout << "getnumclsources pclSources=" << (void *)pClSources << std::endl;
        return pClSources->size();
    }
    std::string getClSource(int i) {
        return (*pClSources)[i];
    }
}

using namespace cocl;
void registerSourcecode(const char *sourcecode) {
    // std::cout << "got source code registration from" << std::endl;
    if(pClSources == 0) {
        // std::cout << "initializing pClSources" << std::endl;
        pClSources = new std::vector< std::string >();
    }
    pClSources->push_back(sourcecode);
    // cocl::clSources.push_back(name);
    // std::cout << "clSources size " << pClSources->size() << std::endl;
}

MyClass::MyClass(const char *name) {
    // std::cout << "MyClass " << name << std::endl;
    registerSourcecode(name);
}

// std::vector<std::string> &getClSources() {
//     return clSources;
// }
