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

#include "cocl_logging.h"

#include <iostream>
using namespace std;

namespace cocl {

string indent = "";

Indentor::Indentor() {
    indent = indent + "  ";
}
Indentor::~Indentor() {
    // cout << "indent before [" << indent << "]" << endl;
    indent = indent.substr(0, indent.size() - 2);
    // cout << "indent after [" << indent << "]" << endl;
}
Indentor &Indentor::operator<<(const std::string &message) {
    // cout << indent << message << endl;
    // messageSoFar = message
    messageSoFar << message;
    return *this;
}
Indentor &Indentor::operator<<(const char *message) {
    // cout << indent << message << endl;
    // messageSoFar = message
    messageSoFar << message;
    return *this;
}
Indentor &Indentor::operator<<(const int value) {
    // cout << indent << message << endl;
    // messageSoFar = message
    messageSoFar << value;
    return *this;
}
// Indentor &Indentor::operator<<(Indentor &indentor, const std::endl) {
Indentor &Indentor::operator<<(const endl_fn &fn) {
    // cout << indentor.indent << message << endl;
    // cout << "got endl" << endl;
    cout << indent << messageSoFar.str() << endl;
    messageSoFar.str("");
    return *this;
}

} // namespace cocl
