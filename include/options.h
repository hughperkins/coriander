// I sort of hummed and ha'd for ages pondering how to do commandline options.
// lots of people use boost, but I dislike depending on boost; its hard to build boost things on windows, was
// my last experience, not sure if thats still the case
// getopt seems not portable, or cant handle long arguments
// since one can write a parser quite quickly, seems that will be most portbale
// I might facotrize it out into a separate repo, since I hate having to procrastinate for ages on such a simple
// thing as reading commandline options...

#include <string>
#include <map>
#include <cstdlib>
#include <cmath>
#include <memory>
#include <iostream>

namespace cocl {
    class Option {
    public:
        virtual  bool needsValue() = 0;
        virtual void parse(std::string valueAsString = "") = 0;
    };
    class OptionBool : public Option {
    public:
        OptionBool(bool *target) : target(target) {}
        bool *target;
        virtual  bool needsValue() { return false; }
        void parse(std::string valueString) {
            *target = true;
        }
    };
    class OptionString : public Option {
    public:
        OptionString(std::string *target) : target(target) {}
        std::string *target;
        virtual  bool needsValue() { return true; }
        void parse(std::string valueString) {
            *target = valueString;
        }
    };
    class OptionFloat : public Option {
    public:
        OptionFloat(float *target) : target(target) {}
        float *target;
        virtual  bool needsValue() { return true; }
        void parse(std::string valueString) {
            *target = atof(valueString.c_str());
        }
    };
    class OptionInt : public Option {
    public:
        OptionInt(int *target) : target(target) {}
        int *target;
        virtual  bool needsValue() { return true; }
        void parse(std::string valueString) {
            *target = atoi(valueString.c_str());
        }
    };

    class ArgumentParser {
    public:
        std::map<std::string, std::unique_ptr<Option> > options;
        void add_int_argument(std::string option, int *var, std::string help = "") {
            std::unique_ptr<Option> option_(new OptionInt(var));
            options[option] = std::move(option_);
        }
        void add_bool_argument(std::string option, bool *var, std::string help = "") {
            std::unique_ptr<Option> option_(new OptionBool(var));
            options[option] = std::move(option_);
        }
        void add_float_argument(std::string option, float *var, std::string help = "") {
            std::unique_ptr<Option> option_(new OptionFloat(var));
            options[option] = std::move(option_);
        }
        void add_string_argument(std::string option, std::string *var, std::string help = "") {
            std::unique_ptr<Option> option_(new OptionString(var));
            options[option] = std::move(option_);
        }
        bool parse(int argc, char *argv[]) {
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
    };
}
