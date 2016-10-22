#pragma once

#include <string>
#include <vector>

class MyClass {
public:
    MyClass(const char *name);
};

extern "C" {
    void registerSourcecode(const char *filename, const char *sourcecode);
}

namespace cocl {
    std::string getClSource(int i);
    int getNumClSources();
}

// std::vector<std::string> &getClSources();

// extern std::vector<std::string> clSources;
