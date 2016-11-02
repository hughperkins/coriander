#include "cocl/options.h"

#include <string>
#include <map>
#include <set>
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

    Option *ArgumentParser::add_int_argument(std::string option, int *var) {
        std::unique_ptr<Option> option_(new OptionInt(var));
        options[option] = std::move(option_);
        return options[option].get();
    }
    Option *ArgumentParser::add_bool_argument(std::string option, bool *var) {
        std::unique_ptr<Option> option_(new OptionBool(var));
        options[option] = std::move(option_);
        return options[option].get();
    }
    Option *ArgumentParser::add_float_argument(std::string option, float *var) {
        std::unique_ptr<Option> option_(new OptionFloat(var));
        options[option] = std::move(option_);
        return options[option].get();
    }
    Option *ArgumentParser::add_string_argument(std::string option, std::string *var) {
        std::unique_ptr<Option> option_(new OptionString(var));
        options[option] = std::move(option_);
        return options[option].get();
    }
    void ArgumentParser::print_usage() {
        std::cout << std::endl;
        std::cout << "Usage:" << std::endl;
        for(auto it=options.begin(); it != options.end(); it++) {
            Option *option = it->second.get();
            std::string arg = it->first;
            std::cout << "  " << arg;
            if(option->_required) {
                std::cout << " (required)";
            }
            std::cout << "   " + option->_help << std::endl;
        }
        std::cout << std::endl;
    }
    bool ArgumentParser::parse(int argc, char *argv[]) {
        std::set<std::string> seenOptions;
        for(int i = 1; i < argc; i++) {
            std::string thisArg = argv[i];
            if(thisArg == "-h" || thisArg == "-?" || thisArg == "--help") {
                print_usage();
                return false;
            }
            if(options.find(thisArg) == options.end()) {
                print_usage();
                std::cout << "unknown option " << thisArg << std::endl;
                return false;
            }
            seenOptions.insert(thisArg);
            Option *option = options[thisArg].get();
            if(option->needsValue()) {
                if(i + 1 >= argc) {
                    print_usage();
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
        // check for required options
        for(auto it=options.begin(); it != options.end(); it++) {
            Option *option = it->second.get();
            std::string arg = it->first;
            if(option->_required) {
                if(seenOptions.find(arg) == seenOptions.end()) {
                    print_usage();
                    std::cout << "Please provide a value for " + arg << std::endl;
                    std::cout << std::endl;
                    return false;
                }
            }
        }
        return true;
    }
}
