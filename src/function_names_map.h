#pragma once

#include <string>

namespace cocl {

void function_names_map_populateKnownValues();
bool function_names_map_isMappedFunction(std::string name);
bool function_names_map_isIgnoredFunction(std::string name);
bool function_names_map_isIgnoredGlobalVariable(std::string name);
std::string function_names_map_getFunctionMappedName(std::string name);

} // namespace cocl
