#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>

#include "gtest/gtest.h"

#include "basicblockdumper.h"


using namespace std;
using namespace cocl;
using namespace llvm;


TEST(test_block_dumper, basic) {
    string ll_code = R"(
define i32 @main() {
  ret i32 0
}
)";
    cout << ll_code << endl;
    LLVMContext context;
    unique_ptr<MemoryBuffer> llMemoryBuffer = MemoryBuffer::getMemBuffer(ll_code);
    SMDiagnostic smDiagnostic;
    unique_ptr<Module> M = parseIR(llMemoryBuffer->getMemBufferRef(), smDiagnostic,
                                context);
    if(!M) {
        smDiagnostic.print("irtopencl", errs());
        // return "";
        throw runtime_error("failed to parse IR");
    }
    for(auto it = M->begin(); it != M->end(); it++) {
        cout << "block " << endl;
    }
    Function *F = &*M->begin();
    BasicBlock *block = &*F->begin();
    BasicBlockDumper blockDumper(block);
    string cl = blockDumper.toCl();
    cout << cl << endl;
}
