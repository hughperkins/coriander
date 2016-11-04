#pragma once

// this si going to try to convert branch instructions into `if`s and stuff
// input: not sure :-P
// output: ditto :-P

#include "llvm/IR/Function.h"

// namespace llvm {
//     class Function;
// }

namespace cocl {
    void handle_branching_simplify(llvm::Function *F);
}
