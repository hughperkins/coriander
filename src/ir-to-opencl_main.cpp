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

#include "EasyCL/util/easycl_stringhelper.h"

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
    string kernelname = "";
    string cmem_indexes = "";
    bool add_ir_to_cl = false;
    bool offsets_32bits = false;
    // bool dumpCl = false;
    // string rcFile = "";

    argparsecpp::ArgumentParser parser;
    parser.add_string_argument("--inputfile", &llFilename)->required();
    parser.add_string_argument("--outputfile", &ClFilename)->required();
    parser.add_string_argument("--kernelname", &kernelname)->required();
    parser.add_string_argument("--cmem-indexes", &cmem_indexes)->required()->help("comma-separated, eg 0,1,2,1");
    parser.add_bool_argument("--offsets-32bits", &offsets_32bits);
    parser.add_bool_argument("--offsets-32bits", &offsets_32bits);

    // parser.add_bool_argument("--debug", &debug);
    // parser.add_string_argument("--rcfile", &rcFile)
    //     ->help("Path to rcfile, containing default options, set to blank to disable")
    //     ->defaultValue("~/.coclrc");
    // parser.add_bool_argument("--no-load_rcfile", &add_ir_to_cl)->help("Dont load the ~/.coclrc file");
    parser.add_bool_argument("--add_ir_to_cl", &add_ir_to_cl)->help("Adds some approximation of the original IR to the opencl code, for debugging");
    // parser.add_bool_argument("--dump_cl", &dumpCl)->help("prints the opencl code to stdout");
    // parser.add_bool_argument("--run_branching_transforms", &runBranchingTransforms)->help("might make the kernels more acceptable to your gpu driver; buggy though...");
    // parser.add_bool_argument("--branches_as_switch", &branchesAsSwitch)->help("might make the kernels more acceptable to your gpu driver; slow though...");
    // parser.add_bool_argument("--dump_transforms", &dumpTransforms)->help("mostly for dev/debug.  prints the results of branching transforms");
    if(!parser.parse_args(argc, argv)) {
        return -1;
    }

    vector<string> split_cmem_indexes = easycl::split(cmem_indexes, ",");
    int numCmems = 0;
    vector<int> cmemIndexes;
    for(int i = 0; i < (int)split_cmem_indexes.size(); i++) {
        int index = easycl::atoi(split_cmem_indexes[i]);
        cmemIndexes.push_back(index);
        if(index + 1 > numCmems) {
            numCmems = index + 1;
        }
    }
    cout << "numCmems " << numCmems << endl; 

    llvm::LLVMContext context;
    SMDiagnostic smDiagnostic;
    std::unique_ptr<llvm::Module> M = parseIRFile(llFilename, smDiagnostic, context);
    if(!M) {
        smDiagnostic.print("irtoopencl", errs());
        // return 1;
        throw runtime_error("failed to parse IR");
    }

    KernelDumper kernelDumper(M.get(), kernelname, kernelname, offsets_32bits);
    if(add_ir_to_cl) {
        kernelDumper.addIRToCl();
    }
    // if(dumpCl) {
    //     kernelDumper.setDumpCl();
    // }
    try {
        string cl = kernelDumper.toCl(numCmems, cmemIndexes);
        ofstream of;
        of.open(ClFilename, ios_base::out);
        of << cl;
        of.close();
    } catch(runtime_error &e) {
        cout << "got exception: " << e.what() << endl;
        return -1;
    }

    return 0;
}
