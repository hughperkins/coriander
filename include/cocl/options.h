// I sort of hummed and ha'd for ages pondering how to do commandline options.
// lots of people use boost, but I dislike depending on boost; its hard to build boost things on windows, was
// my last experience, not sure if thats still the case
// getopt seems not portable, or cant handle long arguments
// since one can write a parser quite quickly, seems that will be most portbale
// I might facotrize it out into a separate repo, since I hate having to procrastinate for ages on such a simple
// thing as reading commandline options...

#pragma once

#include <string>
#include <map>
#include <cstdlib>
#include <cmath>
#include <memory>


namespace cocl {
    class Option {
    public:
        virtual  bool needsValue() = 0;
        virtual void parse(std::string valueAsString = "") = 0;
    };
    class OptionBool : public Option {
    public:
        OptionBool(bool *target);
        bool *target;
        virtual  bool needsValue();
        void parse(std::string valueString);
    };
    class OptionString : public Option {
    public:
        OptionString(std::string *target);
        std::string *target;
        virtual  bool needsValue();
        void parse(std::string valueString);
    };
    class OptionFloat : public Option {
    public:
        OptionFloat(float *target);
        float *target;
        virtual  bool needsValue();
        void parse(std::string valueString);
    };
    class OptionInt : public Option {
    public:
        OptionInt(int *target);
        int *target;
        virtual  bool needsValue();
        void parse(std::string valueString);
    };

    class ArgumentParser {
    public:
        std::map<std::string, std::unique_ptr<Option> > options;
        void add_int_argument(std::string option, int *var, std::string help = "");
        void add_bool_argument(std::string option, bool *var, std::string help = "");
        void add_float_argument(std::string option, float *var, std::string help = "");
        void add_string_argument(std::string option, std::string *var, std::string help = "");
        bool parse(int argc, char *argv[]);
    };
}
