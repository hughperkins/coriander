// input: IR from cuda compilation

#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/ValueSymbolTable.h"
// #include "llvm/IR/Core.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <map>
#include <iostream>
#include <stdexcept>
#include <sstream>

using namespace llvm;
using namespace std;

static llvm::LLVMContext TheContext;
static llvm::IRBuilder<> Builder(TheContext);
static std::unique_ptr<llvm::Module> TheModule;
static std::map<std::string, Value *> NamedValues;

map<Value *, string> nameByValue;

std::string dumpType(Type *type) {
    Type::TypeID typeID = type->getTypeID();
    Type *elementType = 0;
    std::string elementTypeString = "";
    switch(typeID) {
        case Type::VoidTyID:
            return "void";
        case Type::FloatTyID:
            return "float";
        case Type::DoubleTyID:
            return "double";
        case Type::PointerTyID:
            // cout << "point type" << endl;
            elementType = type->getPointerElementType();
            elementTypeString = dumpType(elementType);
            // cout << "elementtypestring " << elementTypeString << endl;
            return elementTypeString + "*";
        case Type::IntegerTyID:
            switch(type->getPrimitiveSizeInBits()) {
                case 32:
                    return "int";
                default:
                    cout << "integer size " << type->getPrimitiveSizeInBits() << endl;
                    throw runtime_error("unrecognized size");
            }
        default:
            cout << "type id " << typeID << endl;
            throw runtime_error("unrecognized type");
    }
}

std::string dumpValue(Value *value) {
    std::string gencode = "";
    // std::string name = "unknown";
    // if(value->hasName()) {
    //     name = value->getName();
    // }
    // cout << "value name " << name << endl;
    unsigned int valueTy = value->getValueID();
    // cout << "Valuety " << valueTy << endl;
    switch(valueTy) {
        case AShrOperator::ConstantIntVal:
            cout << "constant " << ((ConstantInt *)value)->getSExtValue() << endl;
    }
    string name = nameByValue[value];
    gencode += name;
    return gencode;
}

int getIntConstant(Value *value) {
    unsigned int valueTy = value->getValueID();
    if(valueTy != AShrOperator::ConstantIntVal) {
        throw runtime_error("not a constant int");
    }
    return ((ConstantInt *)value)->getSExtValue();
}

string dumpConstant(Constant *constant) {
    unsigned int valueTy = constant->getValueID();
    ostringstream oss;
    if(valueTy == AShrOperator::ConstantIntVal) {
        // return ((ConstantInt *)value)->getSExtValue();
        oss << "int:" << ((ConstantInt *)constant)->getSExtValue();
    } else if(GlobalValue::classof(constant)) {
        GlobalValue *global = (GlobalValue *)constant;
        PointerType *pointerType = global->getType();
        Type *elementType = pointerType->getPointerElementType();
        cout << "element type " << elementType << endl;
    } else {
        cout << "valueTy " << valueTy << endl;
        cout << GlobalValue::classof(constant) << endl;
        oss << "unknown";
    }
    // return "unknown";
    return oss.str();
}

string dumpOperand(Value *value) {
    unsigned int valueTy = value->getValueID();
    if(valueTy == AShrOperator::ConstantIntVal) {
        int intvalue = getIntConstant(value);
        ostringstream oss;
        oss << intvalue;
        return oss.str();
    }
    string name = nameByValue[value];
    // cout << "dumpoperand name " << name << endl;
    return name;
}

void storeValueName(Value *value) {
    if(value->hasName()) {
        nameByValue[value] = string(value->getName());
    } else {
        int idx = nameByValue.size();
        ostringstream oss;
        oss << "v" << idx;
        string name = oss.str();
        nameByValue[value] = name;
    }
}

std::string dumpReturn(ReturnInst *retInst) {
    std::string gencode = "";
    Value *retValue = retInst->getReturnValue();
    if(retValue != 0) {
        gencode += "return " + dumpOperand(retValue) + ";\n";
    }
    return gencode;
}

std::string dumpAlloca(Instruction *alloca) {
    std::string gencode = "";
    std::string typestring = dumpType(alloca->getType()->getPointerElementType());
    cout << "alloca typestring " << typestring << endl;
    // cout << dumpValue(alloca->getOperand(0));
    int count = getIntConstant(alloca->getOperand(0));
    cout << "count " << count << endl;
    // cout << alloca << endl;
    // cout << "hasname " << alloca->hasName() << endl;
    // cout << "name " << string(alloca->getName()) << endl;
    // gencode = typestring + 
    // cout << "value name " << string(alloca->getValueName()) << endl;
    return gencode;
}

std::string dumpBasicBlock(BasicBlock *basicBlock) {
    cout << "dumpBasicBlock" << endl;
    std::string gencode = "";
    for(BasicBlock::iterator it=basicBlock->begin(), e=basicBlock->end(); it != e; it++) {
        // cout << "instruction" << endl;
        Instruction *instruction = &*it;
        // cout << instruction->getOpcodeName() << endl;
        // string opcodeName = instruction->getOpcodeName();
        auto opcode = instruction->getOpcode();
        // cout << "ops:" << endl;
        storeValueName(instruction);
        // string resultName = dumpOperand(instruction);
        string resultName = nameByValue[instruction];
        string resultType = dumpType(instruction->getType());
        // cout << "resultType " << resultType << endl;
        cout << resultType << " " << resultName << " =";
        cout << " " << string(instruction->getOpcodeName());
        for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
            Value *op = &*it->get();
            // User *user = &*it->getUser();
            // cout << "   " << op << " " << dumpType(op->getType());
            cout << " " << dumpOperand(op);
        }
        cout << endl;
        if(opcode == Instruction::FAdd) {
            cout << "FAdd" << endl;
            gencode += resultType + " " + resultName + " = ";
            Value *op1 = instruction->getOperand(0);
            gencode += dumpValue(op1) + " ";
            gencode += "+ ";
            Value *op2 = instruction->getOperand(1);
            gencode += dumpValue(op2) + ";\n";
        } else if(opcode == Instruction::Alloca) {
            // cout << "alloca" << endl;
            gencode += dumpAlloca(instruction);
        } else if(opcode == Instruction::Store) {
            cout << "store" << endl;
        } else if(opcode == Instruction::Call) {
            cout << "call" << endl;
        } else if(opcode == Instruction::Load) {
            cout << "load" << endl;
        } else if(opcode == Instruction::ICmp) {
            cout << "icmp" << endl;
        } else if(opcode == Instruction::Br) {
            cout << "br" << endl;
        } else if(opcode == Instruction::SExt) {
            cout << "sext" << endl;
        } else if(opcode == Instruction::BitCast) {
            cout << "bitcast" << endl;
        } else if(opcode == Instruction::GetElementPtr) {
            cout << "getelementptr" << endl;
        } else if(opcode == Instruction::Ret) {
            cout << "Ret " << " num operands " << instruction->getNumOperands() << endl;
            gencode += dumpReturn((ReturnInst *)instruction);
        } else {
            cout << "opcode string " << instruction->getOpcodeName() << endl;
            throw runtime_error("unknown opcode");
        }
    }
    return gencode;
}

// __global__ void foo(float *data, int N) {
//     int tid = threadIdx.x;
//     if(tid < N) {
//         data[tid] += 3.0f;
//     }
// }

// __global__ void foo(float *data) {
//     data[0] = 123.0f;
// }

// define void @_Z3fooPf(float* %data) #0 {
//   %1 = alloca float*, align 8
//   store float* %data, float** %1, align 8
//   %2 = load float*, float** %1, align 8
//   %3 = getelementptr inbounds float, float* %2, i64 0
//   store float 1.230000e+02, float* %3, align 4
//   ret void
// }

void myDump(Function *F) {
    // cout << "myDump" << endl;
    Type *retType = F->getReturnType();
    std::string retTypeString = dumpType(retType);
    // cout << retType->isFloatingPointTy() << " " << retType->getPrimitiveSizeInBits() << endl;
    string fname = F->getName();
    // cout << "F has name " << F->hasName() << " " << fname << endl;
    string gencode = "";
    gencode += dumpType(retType) + " " + fname + "(";
    // gencode += fname + "(";
    int i = 0;
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument *arg = &*it;
        storeValueName(arg);
        string argname = dumpType(arg->getType()) + " " + string(arg->getName());
        if(i > 0) {
            gencode += ", ";
        }
        gencode += argname;
        // cout << "gencode to now " << gencode << endl;
        // cout << arg.getName() << endl;
        i++;
    }
    gencode += ") {\n";
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        gencode += dumpBasicBlock(basicBlock);
    }
    gencode += "}\n";
    cout << gencode << endl;
}

void dumpModule(Module *M) {
    for(auto it=M->named_metadata_begin(); it != M->named_metadata_end(); it++) {
        NamedMDNode *namedMDNode = &*it;
        cout << "namedmdnode " << namedMDNode << endl;
        cout << "name " << string(namedMDNode->getName()) << endl;
        for(auto it2=namedMDNode->op_begin(); it2 != namedMDNode->op_end(); it2++) {
            MDNode *mdNode = *it2;
            cout << "   got an mdnode " << endl;
            for(auto it3=mdNode->op_begin(); it3 != mdNode->op_end(); it3++) {
                const MDOperand *op = it3;
                // cout << "      got an op" << endl;
                Metadata *metadata = op->get();
                // cout << "      got a metadata " << metadata << endl;
                if(metadata != 0) {
                    cout << "      metadata " << metadata->getMetadataID() << endl;
                    // cout << ConstantAsMetadata::classof(metadata) << endl;
                    if(MDString::classof(metadata)) {
                        cout << string(((MDString *)metadata)->getString()) << endl;
                    } else if(ConstantAsMetadata::classof(metadata)) {
                        Constant *constant = ((ConstantAsMetadata *)metadata)->getValue();
                        cout << dumpConstant(constant) << endl;
                    }
                }
            }
        }
    }
    // cout << string(M->)

    // for(auto it=M->global_begin(); it != M->global_end(); it++) {
    //     GlobalVariable *global = &*it;
    //     cout << "global " << global << endl;
    //     cout << string(global->getName()) << endl;
    // }

    // for(auto it=M->alias_begin(); it != M->alias_end(); it++) {
    //     GlobalAlias *alias = &*it;
    //     cout << "alias " << alias << endl;
    //     cout << string(alias->getName()) << endl;
    // }

    // SymbolTable 
    // for(auto it=M->getValueSymbolTable().begin(); it != M->getValueSymbolTable().end(); it++) {
    //     cout << "value symbol " << string(it->getName()) << endl;
    // }

    for(auto it = M->begin(); it != M->end(); it++) {
        cout << "function " << string(it->getName()) << endl;
        string name = it->getName();
        if(name != "_ZL21__nvvm_reflect_anchorv" && name != "__nvvm_reflect") {
        // if(string(it->getName()) == "_Z3fooPfi") {
            Function *F = &*it;
            myDump(F);
        }
    }
}

int main(int argc, char *argv[]) {
    SMDiagnostic Err;
    if(argc != 2) {
        cout << "Usage: " << argv[0] << " target.ll" << endl;
        return 1;
    }
    TheModule = parseIRFile(argv[1], Err, TheContext);
    if(!TheModule) {
        Err.print(argv[0], errs());
        return 1;
    }
    // TheModule = llvm::make_unique<Module>("my cool jit", TheContext);
    dumpModule(TheModule.get());
    return 0;
}
