// Copyright Hugh Perkins 2017

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

#include <iostream>
#include <sstream>

namespace cocl {
    extern std::string indent;

    typedef std::ostream &(*endl_fn)(std::ostream &os);
    class Indentor {
        // instantiate this to add one level of indent

    public:
        Indentor();
        virtual ~Indentor();
        virtual Indentor &operator<<(const std::string &message);
        virtual Indentor &operator<<(const char *message);
        virtual Indentor &operator<<(const int value);
        virtual Indentor &operator<<(const endl_fn &fn);
        std::ostringstream messageSoFar;
    };
} // namespace cocl
