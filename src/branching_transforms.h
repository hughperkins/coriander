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

#include <vector>
#include "flowcontrolinstructions.h"

namespace cocl {

template<typename T>
void vectorErase(std::vector<T> &targetvector, T &element);
void eraseBlock(flowcontrol::Block *block);
void migrateIncoming(flowcontrol::Block *oldChild, flowcontrol::Block *newChild);
bool mergeSequences(flowcontrol::Block *root);
bool huntTrueIfs(flowcontrol::Block *block);
bool huntFalseIfs(flowcontrol::Block *block);
bool huntTrueIfElses(flowcontrol::Block *block);
bool huntDoWhiles(flowcontrol::Block *block);
void huntWhiles(flowcontrol::Block *block);
bool huntFors(flowcontrol::Block *block);
void runTransforms(flowcontrol::Block *block, bool dumpTransforms);

} // namespace cocl
