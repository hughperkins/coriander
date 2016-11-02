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

// loosely modeled off Python's `argparse`

#pragma once

#include <string>
#include <map>
#include <cstdlib>
#include <cmath>
#include <memory>


namespace argparsecpp {
    class Option {
    public:
        virtual  bool needsValue() = 0;
        virtual void parse(std::string valueAsString = "") = 0;
        Option *required() {
            this->_required = true;
            return this;
        }
        Option *help(std::string help) {
            this->_help = help;
            return this;
        }
        bool _required = false;
        std::string _help = "";
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
        Option *add_int_argument(std::string option, int *var);
        Option *add_bool_argument(std::string option, bool *var);
        Option *add_float_argument(std::string option, float *var);
        Option *add_string_argument(std::string option, std::string *var);
        bool parse_args(int argc, char *argv[]);
        void print_usage();
    };
}
