#include "addressspacewalk/connections_walker.h"

#include "argparsecpp.h"

#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/IRReader/IRReader.h"

#include <iostream>
#include <stdexcept>

int main(int argc, char *argv[]) {
    std::string llFilename;
    // string ClFilename;
    std::string kernelname = "";
    // string cmem_indexes = "";
    // bool add_ir_to_cl = false;

    argparsecpp::ArgumentParser parser;
    parser.add_string_argument("--inputfile", &llFilename)->required();
    // parser.add_string_argument("--outputfile", &ClFilename)->required();
    parser.add_string_argument("--kernelname", &kernelname)->required();
    // parser.add_string_argument("--cmem-indexes", &cmem_indexes)->required()->help("comma-separated, eg 0,1,2,1");
    // parser.add_bool_argument("--add_ir_to_cl", &add_ir_to_cl)->help("Adds some approximation of the original IR to the opencl code, for debugging");
    if(!parser.parse_args(argc, argv)) {
        return -1;
    }

    llvm::LLVMContext context;
    llvm::SMDiagnostic smDiagnostic;
    std::unique_ptr<llvm::Module> M = parseIRFile(llFilename, smDiagnostic, context);
    if(!M) {
        smDiagnostic.print("irtoopencl", llvm::errs());
        throw std::runtime_error("failed to parse IR");
    }

    cocl::addressspacewalk::ConnectionsWalker walker(M.get(), kernelname);
    try {
        walker.walk();
        walker.dumpValues();
    } catch(std::runtime_error &e) {
        std::cout << "got exception: " << e.what() << std::endl;
        return -1;
    }

    return 0;
}
