#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Instructions.h"
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <map>
#include <iostream>

using namespace llvm;
using namespace std;


static llvm::LLVMContext TheContext;
static llvm::IRBuilder<> Builder(TheContext);
static std::unique_ptr<llvm::Module> TheModule;
static std::map<std::string, Value *> NamedValues;

class ExprAST;
class PrototypeAST;

std::unique_ptr<ExprAST> LogError(std::string Str) {
    fprintf(stderr, "LogError: %s\n", Str.c_str());
    return nullptr;
}
std::unique_ptr<PrototypeAST> LogErrorP(std::string Str) {
    LogError(Str);
    return nullptr;
}

Value *LogErrorV(std::string Str) {
    LogError(Str);
    return nullptr;
}

class ExprAST {
public:
    virtual ~ExprAST() {}
    virtual Value *codegen() = 0;
};

class NumberExprAST : public ExprAST {
    double Val;
public:
    NumberExprAST(double Val) : Val(Val) {}
    virtual Value *codegen() {
        return ConstantFP::get(TheContext, APFloat(Val));
    }
};

class VariableExprAST : public ExprAST {
    std::string Name;
public:
    VariableExprAST(const std::string &name) : Name(name) {}
    Value *codegen() {
        Value *V = NamedValues[Name];
        if(!V) {
            LogErrorV("unknown variable name " + Name);
        }
        return V;
    }
};

class BinaryExprAST : public ExprAST {
    char Op;
    std::unique_ptr<ExprAST> LHS, RHS;

public:
    BinaryExprAST(char op, std::unique_ptr<ExprAST> LHS,
        std::unique_ptr<ExprAST> RHS)
        : Op(op), LHS(std::move(LHS)), RHS(std::move(RHS)) {}
    Value *codegen() {
        Value *L = LHS->codegen();
        Value *R = RHS->codegen();
        if(!L || !R) {
            return nullptr;
        }

        switch(Op) {
            case '+':
                return Builder.CreateFAdd(L, R, "addtmp");
            case '-':
                return Builder.CreateFSub(L, R, "subtmp");
            case '*':
                return Builder.CreateFMul(L, R, "multmp");
            case '<':
                L = Builder.CreateFCmpULT(L, R, "cmptmp");
                return Builder.CreateUIToFP(L, Type::getDoubleTy(TheContext),
                    "booltmp");
            default:
                return LogErrorV("invalid binary operator");
        }
    }
};

class CallExprAST : public ExprAST {
    std::string Callee;
    std::vector<std::unique_ptr<ExprAST>> Args;

public:
    CallExprAST(const std::string &Callee,
        std::vector<std::unique_ptr<ExprAST>> Args)
        : Callee(Callee), Args(std::move(Args)) {}
    Value *codegen() {
        Function *CalleeF = TheModule->getFunction(Callee);
        if(!CalleeF) {
            return LogErrorV("Unknown function referenced " + Callee);
        }

        if(CalleeF->arg_size() != Args.size()) {
            return LogErrorV("Incorrect number arguments passed to " + Callee);
        }

        std::vector<Value *> ArgsV;
        for(unsigned i = 0, e = Args.size(); i != e; ++i) {
            ArgsV.push_back(Args[i]->codegen());
            if(!ArgsV.back()) {
                return nullptr;
            }
        }

        return Builder.CreateCall(CalleeF, ArgsV, "calltmp");
    }
};

class PrototypeAST {
    std::string Name;
    std::vector<std::string> Args;

public:
    PrototypeAST(const std::string &name, std::vector<std::string> Args)
        : Name(name), Args(std::move(Args)) {}
    Function *codegen() {
        std::vector<Type *> Doubles(Args.size(), Type::getDoubleTy(TheContext));
        FunctionType *FT = FunctionType::get(Type::getDoubleTy(TheContext), Doubles, false);
        Function *F = Function::Create(FT, Function::ExternalLinkage, Name, TheModule.get());

        unsigned Idx = 0;
        for(auto &Arg : F->args()) {
            Arg.setName(Args[Idx++]);
        }
        return F;
    }
    std::string getName() {
        return Name;
    }
};

class FunctionAST {
    std::unique_ptr<PrototypeAST> Proto;
    std::unique_ptr<ExprAST> Body;

public:
    FunctionAST(std::unique_ptr<PrototypeAST> Proto,
        std::unique_ptr<ExprAST> Body)
        : Proto(std::move(Proto)), Body(std::move(Body)) {}
    Function *codegen() {
        Function *TheFunction = TheModule->getFunction(Proto->getName());

        if(!TheFunction) {
            TheFunction = Proto->codegen();
        }

        if(!TheFunction) {
            return nullptr;
        }

        if(!TheFunction->empty()) {
            return (Function*)LogErrorV("Function cannot be redefined " + Proto->getName());
        }

        BasicBlock *BB = BasicBlock::Create(TheContext, "entry", TheFunction);
        Builder.SetInsertPoint(BB);

        NamedValues.clear();
        for(auto &Arg : TheFunction->args()) {
            NamedValues[Arg.getName()] = &Arg;
        }
        if(Value *RetVal = Body->codegen()) {
            Builder.CreateRet(RetVal);
            verifyFunction(*TheFunction);
            return TheFunction;
        }
        TheFunction->eraseFromParent();
        return nullptr;
    }
};

enum Token {
    tok_eof = -1,

    tok_def = -2,
    tok_extern = -3,

    tok_identifier = -4,
    tok_number = -5
};

static std::string IdentifierStr;
static double NumVal;

static int gettok() {
    static int LastChar = ' ';
    while (isspace(LastChar)) {
        LastChar = getchar();
    }
    if (isalpha(LastChar)) {
        IdentifierStr = LastChar;
        while (isalnum((LastChar = getchar()))) {
            IdentifierStr += LastChar;
        }

        if(IdentifierStr == "def") {
            return tok_def;
        }
        if(IdentifierStr == "extern") {
            return tok_extern;
        }
        return tok_identifier;
    }
    if(isdigit(LastChar) || LastChar == '.') {
        std::string NumStr;
        do {
            NumStr += LastChar;
            LastChar = getchar();
        } while(isdigit(LastChar) || LastChar == '.');

        NumVal = strtod(NumStr.c_str(), 0);
        return tok_number;
    }
    if(LastChar == '#') {
        do {
            LastChar = getchar();
        } while(LastChar != EOF && LastChar != '\n' && LastChar != '\r');
        if(LastChar != EOF) {
            return gettok();
        }
    }
    if(LastChar == EOF) {
        return tok_eof;
    }
    int ThisChar = LastChar;
    LastChar = getchar();
    return ThisChar;
}

static int CurTok;
static int getNextToken() {
    return CurTok = gettok();
}

static std::unique_ptr<ExprAST> ParseExpression();
static std::unique_ptr<ExprAST> ParseParenExpr();
static std::unique_ptr<ExprAST> ParseBinOpRHS(int ExprPrec,
    std::unique_ptr<ExprAST> LHS);

static std::unique_ptr<ExprAST> ParseNumberExpr() {
    auto Result = llvm::make_unique<NumberExprAST>(NumVal);
    getNextToken();
    return std::move(Result);
}

static std::unique_ptr<ExprAST> ParseIdentifierExpr() {
    std::string IdName = IdentifierStr;

    getNextToken();

    if(CurTok != '(') {
        return llvm::make_unique<VariableExprAST>(IdName);
    }

    getNextToken();
    std::vector<std::unique_ptr<ExprAST>> Args;
    if(CurTok != ')') {
        while(1) {
            if(auto Arg = ParseExpression()) {
                Args.push_back(std::move(Arg));
            } else {
                return nullptr;
            }

            if(CurTok == ')') {
                break;
            }

            if(CurTok != ',') {
                return LogError("Expected ')' or ',' in argument list");
            }
            getNextToken();
        }
    }

    getNextToken();

    return llvm::make_unique<CallExprAST>(IdName, std::move(Args));
}

static std::unique_ptr<ExprAST> ParsePrimary() {
    switch(CurTok) {
        default:
            return LogError("unknown token when expecting an expression");
        case tok_identifier:
            return ParseIdentifierExpr();
        case tok_number:
            return ParseNumberExpr();
        case '(':
            return ParseParenExpr();
    }
}

static std::map<char, int> BinopPrecedence;

static int GetTokPrecedence() {
    if(!isascii(CurTok)) {
        return -1;
    }

    int TokPrec = BinopPrecedence[CurTok];
    if(TokPrec <= 0) {
        return -1;
    }
    return TokPrec;
}

static std::unique_ptr<ExprAST> ParseExpression() {
    auto LHS = ParsePrimary();
    if(!LHS) {
        return nullptr;
    }
    return ParseBinOpRHS(0, std::move(LHS));
}

static std::unique_ptr<ExprAST> ParseParenExpr() {
    getNextToken();
    auto V = ParseExpression();
    if(!V) {
        return nullptr;
    }
    if(CurTok != ')') {
        return LogError("expected ')'");
    }
    getNextToken();
    return V;
}

static std::unique_ptr<ExprAST> ParseBinOpRHS(int ExprPrec,
    std::unique_ptr<ExprAST> LHS) {
    while(1) {
        int TokPrec = GetTokPrecedence();
        if(TokPrec < ExprPrec) {
            return LHS;
        }
        int BinOp = CurTok;
        getNextToken();

        auto RHS = ParsePrimary();
        if(!RHS) {
            return nullptr;
        }
        int NextPrec = GetTokPrecedence();
        if(TokPrec < NextPrec) {
            RHS = ParseBinOpRHS(TokPrec+1, std::move(RHS));
            if(!RHS) {
                return nullptr;
            }
        }
        LHS = llvm::make_unique<BinaryExprAST>(BinOp, std::move(LHS), std::move(RHS));
    }
}

static std::unique_ptr<PrototypeAST> ParsePrototype() {
    if(CurTok != tok_identifier) {
        return LogErrorP("expected function name in prototype");
    }

    std::string FnName = IdentifierStr;
    getNextToken();

    if(CurTok != '(') {
        return LogErrorP("Expected '(' in prototype");
    }

    std::vector<std::string> ArgNames;
    while(getNextToken() == tok_identifier) {
        ArgNames.push_back(IdentifierStr);
    }
    if(CurTok != ')') {
        return LogErrorP("Expected ')' in prototype");
    }

    getNextToken();

    return llvm::make_unique<PrototypeAST>(FnName, std::move(ArgNames));
}

static std::unique_ptr<FunctionAST> ParseDefinition() {
    getNextToken();
    auto Proto = ParsePrototype();
    if(!Proto) return nullptr;

    if(auto E = ParseExpression()) {
        return llvm::make_unique<FunctionAST>(std::move(Proto), std::move(E));
    }
    return nullptr;
}

static std::unique_ptr<PrototypeAST> ParseExtern() {
    getNextToken();
    return ParsePrototype();
}

static std::unique_ptr<FunctionAST> ParseTopLevelExpr() {
    if(auto E = ParseExpression()) {
        auto Proto = llvm::make_unique<PrototypeAST>("", std::vector<std::string>());
        return llvm::make_unique<FunctionAST>(std::move(Proto), std::move(E));
    }
    return nullptr;
}

std::string dumpValue(Value *value) {
    std::string gencode = "";
    std::string name = value->getName();
    cout << "value name " << name << endl;
    gencode += name;
    return gencode;
}

std::string dumpReturn(ReturnInst *retInst) {
    std::string gencode = "";
    gencode += "return " + dumpValue(retInst->getReturnValue()) + "\n";
    return gencode;
}

std::string dumpBasicBlock(BasicBlock *basicBlock) {
    cout << "dumpBasicBlock" << endl;
    std::string gencode = "";
    for(BasicBlock::iterator it=basicBlock->begin(), e=basicBlock->end(); it != e; it++) {
        cout << "instruction" << endl;
        Instruction *instruction = &*it;
        cout << instruction->getOpcodeName() << endl;
        string opcodeName = instruction->getOpcodeName();
        auto opcode = instruction->getOpcode();
        cout << "opcode " << opcode << endl;
        // cout << "binary operator opcode " << BinaryOps << endl;
        // cout << isa<
        if(opcodeName == "fadd") {
            cout << "FAdd" << endl;
            gencode += string(instruction->getName()) + " = ";
            Value *op1 = instruction->getOperand(0);
            gencode += dumpValue(op1) + " ";
            gencode += "+ ";
            Value *op2 = instruction->getOperand(1);
            gencode += dumpValue(op2) + "\n";
        } else if(opcodeName == "ret") {
            cout << "Ret " << " num operands " << instruction->getNumOperands() << endl;
            gencode += dumpReturn((ReturnInst *)instruction);
        }
    }
    return gencode;
}

void myDump(Function *F) {
    cout << "myDump" << endl;
    Type *retType = F->getReturnType();
    cout << retType->isFloatingPointTy() << " " << retType->getPrimitiveSizeInBits() << endl;
    string fname = F->getName();
    cout << "F has name " << F->hasName() << " " << fname << endl;
    string gencode = "";
    gencode += "float ";
    gencode += fname + "(";
    int i = 0;
    for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
        Argument &arg = *it;
        string argname = "float " + string(arg.getName());
        if(i > 0) {
            gencode += ", ";
        }
        gencode += argname;
        // cout << arg.getName() << endl;
        i++;
    }
    gencode += ") {\n";
    for(auto it=F->begin(); it != F->end(); it++) {
        BasicBlock *basicBlock = &*it;
        gencode += dumpBasicBlock(basicBlock) + "\n";
    }
    gencode += "}\n";
    cout << gencode << endl;
}

static void HandleDefinition() {
    if(auto FnAST = ParseDefinition()) {
        if(auto *FnIR = FnAST->codegen()) {
            fprintf(stderr, "Parsed a function definition\n");
            FnIR->dump();
            myDump(FnIR);
        }
    } else {
        getNextToken();
    }
}

static void HandleExtern() {
    if(auto ProtoAST = ParseExtern()) {
        if(auto *FnIR = ProtoAST->codegen()) {
            fprintf(stderr, "Parsed an extern\n");
            FnIR->dump();
        }
    } else {
        getNextToken();
    }
}

static void HandleTopLevelExpression() {
    if(auto FnAST = ParseTopLevelExpr()) {
        if(auto *FnIR = FnAST->codegen()) {
            fprintf(stderr, "Parsed a top level expr\n");
            FnIR->dump();
        }
    } else {
        getNextToken();
    }
}

static void MainLoop() {
    while(true) {
        fprintf(stderr, "ready> ");
        switch(CurTok) {
            case tok_eof:
                return;
            case ';':
                getNextToken();
                break;
            case tok_def:
                HandleDefinition();
                // printf("def\n");
                // getNextToken();
                break;
            case tok_extern:
                HandleExtern();
                // printf("extern\n");
                // getNextToken();
                break;
            default:
                HandleTopLevelExpression();
                // printf("top level expression\n");
                // getNextToken();
                break;
        }
    }
}

int main(int argc, char *argv[]) {
    BinopPrecedence['<'] = 10;
    BinopPrecedence['+'] = 20;
    BinopPrecedence['-'] = 20;
    BinopPrecedence['*'] = 40;

    fprintf(stderr, "ready> ");
    getNextToken();
    TheModule = llvm::make_unique<Module>("my cool jit", TheContext);
    MainLoop();
    TheModule->dump();

    return 0;
}
