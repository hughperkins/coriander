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

#include "argparsecpp.h"
#include "kernel_dumper.h"

#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IRReader/IRReader.h"

#include <iostream>
#include <fstream>

using namespace std;
using namespace cocl;
using namespace llvm;

// extern bool add_ir_to_cl;

// void convertLlFileToClFile(string llFilename, string ClFilename, string specificFunction);

int main(int argc, char *argv[]) {
    string llFilename;
    string ClFilename;
    string specificFunction = "";
    // bool add_ir_to_cl
    // string rcFile = "";

    argparsecpp::ArgumentParser parser;
    parser.add_string_argument("--inputfile", &llFilename)->required();
    parser.add_string_argument("--outputfile", &ClFilename)->required();
    parser.add_string_argument("--specific_function", &specificFunction)->required();
    // parser.add_bool_argument("--debug", &debug);
    // parser.add_string_argument("--rcfile", &rcFile)
    //     ->help("Path to rcfile, containing default options, set to blank to disable")
    //     ->defaultValue("~/.coclrc");
    // parser.add_bool_argument("--no-load_rcfile", &add_ir_to_cl)->help("Dont load the ~/.coclrc file");
    // parser.add_bool_argument("--add_ir_to_cl", &add_ir_to_cl);
    // parser.add_bool_argument("--run_branching_transforms", &runBranchingTransforms)->help("might make the kernels more acceptable to your gpu driver; buggy though...");
    // parser.add_bool_argument("--branches_as_switch", &branchesAsSwitch)->help("might make the kernels more acceptable to your gpu driver; slow though...");
    // parser.add_bool_argument("--dump_transforms", &dumpTransforms)->help("mostly for dev/debug.  prints the results of branching transforms");
    if(!parser.parse_args(argc, argv)) {
        return -1;
    }

    llvm::LLVMContext context;
    SMDiagnostic smDiagnostic;
    std::unique_ptr<llvm::Module> M = parseIRFile(llFilename, smDiagnostic, context);
    if(!M) {
        smDiagnostic.print("irtoopencl", errs());
        // return 1;
        throw runtime_error("failed to parse IR");
    }

    KernelDumper kernelDumper(M.get(), specificFunction);
    string cl = kernelDumper.toCl();

    ofstream of;
    of.open(ClFilename, ios_base::out);
    of << cl;
    of.close();

    return 0;
}
