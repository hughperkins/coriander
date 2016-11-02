#include "cocl/options.h"

#include <string>
#include <map>
#include <cstdlib>
#include <cmath>
#include <memory>
#include <iostream>


namespace cocl {
    OptionBool::OptionBool(bool *target) : target(target) {}
    bool OptionBool::needsValue() { return false; }
    void OptionBool::parse(std::string valueString) {
        *target = true;
    }
    OptionString::OptionString(std::string *target) : target(target) {}
    bool OptionString::needsValue() { return true; }
    void OptionString::parse(std::string valueString) {
        *target = valueString;
    }
    OptionFloat::OptionFloat(float *target) : target(target) {}
    bool OptionFloat::needsValue() { return true; }
    void OptionFloat::parse(std::string valueString) {
        *target = atof(valueString.c_str());
    }
    OptionInt::OptionInt(int *target) : target(target) {}
    bool OptionInt::needsValue() { return true; }
    void OptionInt::parse(std::string valueString) {
        *target = atoi(valueString.c_str());
    }

    void ArgumentParser::add_int_argument(std::string option, int *var, std::string help) {
        std::unique_ptr<Option> option_(new OptionInt(var));
        options[option] = std::move(option_);
    }
    void ArgumentParser::add_bool_argument(std::string option, bool *var, std::string help) {
        std::unique_ptr<Option> option_(new OptionBool(var));
        options[option] = std::move(option_);
    }
    void ArgumentParser::add_float_argument(std::string option, float *var, std::string help) {
        std::unique_ptr<Option> option_(new OptionFloat(var));
        options[option] = std::move(option_);
    }
    void ArgumentParser::add_string_argument(std::string option, std::string *var, std::string help) {
        std::unique_ptr<Option> option_(new OptionString(var));
        options[option] = std::move(option_);
    }
    bool ArgumentParser::parse(int argc, char *argv[]) {
        for(int i = 1; i < argc; i++) {
            std::string thisArg = argv[i];
            if(options.find(thisArg) == options.end()) {
                std::cout << "unknown option " << thisArg << std::endl;
                return false;
            }
            Option *option = options[thisArg].get();
            if(option->needsValue()) {
                if(i + 1 >= argc) {
                    std::cout << "no value found for optoin " << thisArg << std::endl;
                    return false;
                }
                std::string valueString = argv[i + 1];
                option->parse(valueString);
                i++;
            } else {
                option->parse("");
            }
        }
    }
}
