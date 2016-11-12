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

#include "ir-to-opencl.h"
#include "argparsecpp.h"


#include <iostream>

using namespace std;
using namespace cocl;


void convertLlFileToClFile(string llFilename, string ClFilename, string specificFunction);

int main(int argc, char *argv[]) {
    string target;
    string outputfilepath;
    string specificFunction = "";
    string rcFile = "";

    argparsecpp::ArgumentParser parser;
    parser.add_string_argument("--inputfile", &target)->required();
    parser.add_string_argument("--outputfile", &outputfilepath)->required();
    parser.add_bool_argument("--debug", &debug);
    // parser.add_string_argument("--rcfile", &rcFile)
    //     ->help("Path to rcfile, containing default options, set to blank to disable")
    //     ->defaultValue("~/.coclrc");
    // parser.add_bool_argument("--no-load_rcfile", &add_ir_to_cl)->help("Dont load the ~/.coclrc file");
    parser.add_bool_argument("--add_ir_to_cl", &add_ir_to_cl);
    parser.add_bool_argument("--run_branching_transforms", &runBranchingTransforms)->help("might make the kernels more acceptable to your gpu driver; buggy though...");
    parser.add_bool_argument("--branches_as_switch", &branchesAsSwitch)->help("might make the kernels more acceptable to your gpu driver; slow though...");
    parser.add_bool_argument("--dump_transforms", &dumpTransforms)->help("mostly for dev/debug.  prints the results of branching transforms");
    parser.add_string_argument("--specific_function", &specificFunction)->help("Mostly for dev/debug, just process one specific function");
    if(!parser.parse_args(argc, argv)) {
        return -1;
    }

    convertLlFileToClFile(target, outputfilepath, specificFunction);

    return 0;
}
