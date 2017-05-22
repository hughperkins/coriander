#include "new_instruction_dumper.h"

#include "ClWriter.h"
#include "LocalNames.h"
#include "GlobalNames.h"
#include "type_dumper.h"
#include "function_names_map.h"
#include "LocalValueInfo.h"
#include "mutations.h"
#include "ExpressionsHelper.h"
#include "readIR.h"
#include "EasyCL/util/easycl_stringhelper.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include <vector>
#include <string>
#include <memory>
#include <iostream>

using namespace std;
using namespace llvm;

namespace cocl {

NewInstructionDumper::NewInstructionDumper(
        llvm::Module *M,
        GlobalNames *globalNames, LocalNames *localNames, TypeDumper *typeDumper, const FunctionNamesMap *functionNamesMap,

        std::set<std::string> *shimFunctionsNeeded,
        std::set<llvm::Function *> *neededFunctions,

        std::map<llvm::Value *, std::string> *globalExpressionByValue,
        std::map<llvm::Value *, unique_ptr<LocalValueInfo > > *localValueInfos
        // std::map<std::string, std::string> *shortFnNameByOrigName
        // std::vector<AllocaInfo> *allocaDeclarations
        ) :
    M(M),
    globalNames(globalNames),
    localNames(localNames),
    typeDumper(typeDumper),
    functionNamesMap(functionNamesMap),

    shimFunctionsNeeded(shimFunctionsNeeded),
    neededFunctions(neededFunctions),

    globalExpressionByValue(globalExpressionByValue),
    localValueInfos(localValueInfos)
    // shortFnNameByOrigName(shortFnNameByOrigName)
    // allocaDeclarations(allocaDeclarations)
        {
    if(M == 0) {
        cout << "NewInstructionDumper constr() M is 0" << endl;
        throw runtime_error("NewInstructionDumper constr() M is 0");
    }
}

LocalValueInfo *NewInstructionDumper::dumpConstant(llvm::Constant *constant) {
// maybe this should be somewhere more generic?
// string BasicBlockDumper::dumpConstant(Constant *constant) {
    LocalValueInfo *constantInfo = LocalValueInfo::getOrCreate(localNames, localValueInfos, constant, constant->getName().str());
    // cout << "dumpConstant " << constantInfo->name << endl;
    // constant->dump();
    // cout << endl;
    unsigned int valueTy = constant->getValueID();
    // ostringstream oss;
    if(ConstantInt *constantInt = dyn_cast<ConstantInt>(constant)) {
        // cout << "constantint" << endl;
        constantInfo->setAddressSpace(0);
        constantInfo->setExpression(easycl::toString(constantInt->getSExtValue()));
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        // string constantintval = oss.str();
        // return constantintval;
        return constantInfo;
    } else if(isa<ConstantStruct>(constant)) {
        throw runtime_error("constantStruct not implemented in basicblockdumper.dumpconstant");
    } else if(isa<ConstantExpr>(constant)) {
        // cout << "constantexpr " << constantInfo->name << endl;
        // cout << "constantexpr" << endl;
        // return dumpConstantExpr(expr);
        dumpConstantExpr(constantInfo);
        // cout << "dumpconstant, constantexpr, " << constantInfo->name << " needs declraation? " << constantInfo->toBeDeclared << endl;
        return constantInfo;
        // throw runtime_error("constantExpr not implemented in basicblockdumper.dumpconstnat");
        // Instruction *instr = expr->getAsInstruction();
        // cout << "dumping:" << endl;
        // instr->dump();
        // copyAddressSpace(constant, instr);
        // string dcires = dumpInstruction(instr);
        // cout << "calling dci" << endl;
        // string dcires = dumpChainedInstruction(0, instr, true);
        // cout << "dcires " << dcires << endl;
        // // copyAddressSpace(instr, constant);
        // nameByValue[constant] = dcires;
        // cout << "exprByValue has constant? " << (exprByValue.find(constant) != exprByValue.end()) << endl;
        // exprByValue[constant] = dcires;
        // return dcires;
    } else if(ConstantFP *constantFP = dyn_cast<ConstantFP>(constant)) {
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        constantInfo->setAddressSpace(0);
        constantInfo->setExpression(dumpFloatConstant(forceSingle, constantFP));
        return constantInfo;
    } else if(GlobalValue *global = dyn_cast<GlobalValue>(constant)) {
        // cout << "dumpconstnat, globalvalue" << endl;
        // throw runtime_error("GlobalValue not implemented in basicblockdumper.dumpconstant");
        if(PointerType *pointerType = dyn_cast<PointerType>(global->getType())) {
            int addressspace = pointerType->getAddressSpace();
            if(addressspace == 3) {  // if it's local memory, it's not really 'global', juts return the name
                // cout << "dumpconstnat, globalvalue, addressspace 3 " << constantInfo->name << endl;
                // sharedVariablesToDeclare->insert(global);
                // string name = global->getName().str();
                // name = localNames->getOrCreateName(global, name);

                // LocalValueInfo *localValueInfo = LocalValueInfo::getOrCreate(localNames, localValueInfos, global, name);
                constantInfo->clWriter.reset(new SharedClWriter(constantInfo));
                constantInfo->setAddressSpace(3);
                constantInfo->setAsAssigned();
                constantInfo->setExpression(constantInfo->name);
                // localValueInfo->declarationCl.push_back(
                //     typeDumper->dumpType(pointerType) + " " + name + "[1]");
                // }
                // (*localExpressionByValue)[global] = name;
                // cout << "shared memory, creating in localnames name=" << name << endl;
                // constantInfo->
                // oss << name;
                // cout << "returning constantinfo" << endl;
                // cout << "dumpconstant, globalvalue, addresspace 3 " <<  constantInfo->name << " needs declraation? " << constantInfo->toBeDeclared << endl;
                return constantInfo;
                // return name;
            }
        }
        // at about this point we should pehaps swap to come global-specific class to handle this?
        if(globalNames->hasName(constant)) {
            // cout << "found constnat in globalanesm, returning" << endl;
           // return globalNames->getName(constant);
            // hmmmm, shouldwe be handling global values too???
            constantInfo->clWriter.reset(new ClWriter(constantInfo));
            constantInfo->setAddressSpace(4);
            constantInfo->setExpression(globalNames->getName(constant));
            // oss << globalNames->getName(constant);
            // cout << "dumpconstant, globalvalue, constant, add 4 " << constantInfo->name << " needs declraation? " << constantInfo->toBeDeclared << endl;
            return constantInfo;
        }
        string name = global->getName().str();
        // cout << "using global's native name " << name << endl;
        string ourinstrstr = "(&" + name + ")";
        updateAddressSpace(constant, 4);  // 4 means constant
        constantInfo->setAddressSpace(4);
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        // cout << "adding to globalExpressionByValue [" << ourinstrstr << "]" << endl;
        globalExpressionByValue->operator[](constant) = ourinstrstr;

        constantInfo->setExpression(ourinstrstr);
        // oss << ourinstrstr;
        // cout << "dumpconstant, globalvalue, not addresspace 3 " << constantInfo->name << " needs declraation? " << constantInfo->toBeDeclared << endl;
        return constantInfo;
        // return ourinstrstr;
    } else if(isa<UndefValue>(constant)) {
        // return "";
        cout << "undef, not hnalded" << endl;
        throw runtime_error("dumpconstnat, doesnt handle undef, for now");
        // return;
    } else if(isa<ConstantPointerNull>(constant)) {
        // return "0";
        // oss << "0";
        constantInfo->clWriter.reset(new ClWriter(constantInfo));
        constantInfo->setAddressSpace(0);
        constantInfo->setExpression("0");
        return constantInfo;
    } else {
        cout << "dumpconstant, unhandled valuetype valueTy " << valueTy << endl;
        // oss << "unknown";
        constant->dump();
        cout << endl;
        throw runtime_error("unknown constnat type");
    }
    // return oss.str();
}

// lets assumes hit is always local for now
// we'll create some separate thing for global constants, maybe just copy and paste, so we
// dont have to think about how to generalize local vs constant instruction dumping...
void NewInstructionDumper::dumpConstantExpr(LocalValueInfo *localValueInfo) {
    ConstantExpr *expr = cast<ConstantExpr>(localValueInfo->value);
    // this means things like:
    // shared memory 
    // cout << "dumping constnat expr " << localValueInfo->name << ":" << endl;
    // expr->dump();
    // cout << endl;
    Instruction *instr = expr->getAsInstruction();
    // cout << "dumpConstantExpr" << endl;
    // instr->dump();
    // cout << endl;
    // LocalValueInfo *localValueInfo = LocalValueInfo::getOrCreate(localnames, localValueInfos, instr,)
    // InstructionDumper childInstructionDumper;
    // string rhs = dumpInstruction(instr);
    // vector<string> excessLines;
    // std::set< llvm::Function *> dumpedFunctions;
    std::map<llvm::Function *, llvm::Type*> returnTypeByFunction;
    LocalValueInfo *instrValueInfo = LocalValueInfo::getOrCreate(localNames, localValueInfos, instr);
    // instrValueInfo->_storeAllocatedValue.reset(instr);
    runGeneration(instrValueInfo, returnTypeByFunction);
    // cout << "dumpconstantexpr" << endl;
    // ostringstream temposs;
    // cout << instrValueInfo->name << " needs declraation? " << instrValueInfo->toBeDeclared << endl;
    // runRhsGeneration(instrValueInfo, returnTypeByFunction);

    string rhs = instrValueInfo->getExpr();
    // string rhs = (*localExpressionByValue)[instr];
    // string rhs = dumpInstructionRhs(instr, &excessLines);
    // cout << "dumpConstantExpr rhs: [" << rhs << "]" << endl;
    // if(excessLines.size() > 0) {
    //     throw runtime_error("InstructionDumper::dumpConstantExpr cannot handle excess lines > 0");
    // }
    localValueInfo->setAddressSpaceFrom(instrValueInfo);
    localValueInfo->setExpression(rhs);
    // return rhs;  // this is kind of broken for now...
    // throw 
    // string thisinstrstr = "";
    // if((*localExpressionByValue).find(instr) != localExpressionByValue->end()) {
    //     thisinstrstr = (*localExpressionByValue)[instr];
    // } else {
    //     thisinstrstr = (*globalExpressionByValue)[instr];
    // }
    // string thisinstrstr = globalExpressionByValue->operator[](instr);
    // cout << "thisinstrstr: [" << thisinstrstr << "]" << endl;
    // return thisinstrstr;
    // throw runtime_error("not implemented");
}

LocalValueInfo *NewInstructionDumper::getOperand(Value *op) {
    if(localValueInfos->find(op) != localValueInfos->end()) {
        return localValueInfos->at(op).get();
    }
    if(Constant *constant = dyn_cast<Constant>(op)) {
        LocalValueInfo *valueInfo = dumpConstant(constant);
        return valueInfo;
        // ostringstream oss;
        // dumpConstant(oss, constant);
        // return oss.str();
    }
    // cout << "newinstrucoitndumper::getoperand: need dependent value:" << endl;
    // op->dump();
    throw NeedValueDependencyException(op);

    // needDependencies.insert(new ValueDependency(op));
    // return 0;
    // cout << "getoperand not implemented for:" << endl;
    // cout << endl;
    // throw runtime_error("not implemented");
}

void NewInstructionDumper::dumpIcmp(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    CmpInst *instr = cast<CmpInst>(localValueInfo->value);
    localValueInfo->setAddressSpace(0);

    // cout << "newinstructiondumpre, dumpicmp, instr:" << endl;
    // instr->dump();
    // cout << endl;
    string gencode = "";
    // CmpInst::Predicate predicate = instr->getSignedPredicate();  // note: we should detect signedness...
    CmpInst::Predicate predicate = instr->getPredicate();  // note: we should detect signedness...
    // cout << "predicate " << instr->getPredicate() << endl;
    // cout << "signed predicate " << predicate << endl;
    // cout << "unsigned predicate " << instr->getUnsignedPredicate() << endl;
    string predicate_string = "";
    switch(predicate) {
        case CmpInst::ICMP_SLT:
        case CmpInst::ICMP_ULT:
            // cout << "slt" << endl;
            predicate_string = "<";
            break;
        case CmpInst::ICMP_SGT:
        case CmpInst::ICMP_UGT:
            // cout << "sgt" << endl;
            predicate_string = ">";
            break;
        case CmpInst::ICMP_SGE:
        case CmpInst::ICMP_UGE:
            // cout << "sge" << endl;
            predicate_string = ">=";
            break;
        case CmpInst::ICMP_SLE:
        case CmpInst::ICMP_ULE:
            predicate_string = "<=";
            break;
        case CmpInst::ICMP_EQ:
            predicate_string = "==";
            break;
        case CmpInst::ICMP_NE:
            predicate_string = "!=";
            break;
        default:
            cout << "predicate " << predicate << endl;
            throw runtime_error("predicate not supported");
    }
    // cout << "newinstructiondumepr::dumpIcmp, predicatestring: " << predicate_string << endl;

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    // LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();
    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();

    // handle case like `a & 3 == 0`
    if(op0.find('&') == string::npos) {
        op0 = stripOuterParams(op0);
    }
    if(op1.find('&') == string::npos) {
        op1 = stripOuterParams(op1);
    }
    gencode += op0;
    gencode += " " + predicate_string + " ";
    gencode += op1;

    localValueInfo->setExpression(gencode);
    // return gencode;
}

void NewInstructionDumper::dumpFcmp(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    CmpInst *instr = cast<CmpInst>(localValueInfo->value);
    localValueInfo->setAddressSpace(0);

    string gencode = "";
    CmpInst::Predicate predicate = instr->getPredicate();
    string predicate_string = "";
    switch(predicate) {
        case CmpInst::FCMP_ULT:
        case CmpInst::FCMP_OLT:
            predicate_string = "<";
            break;
        case CmpInst::FCMP_UGT:
        case CmpInst::FCMP_OGT:
            predicate_string = ">";
            break;
        case CmpInst::FCMP_UGE:
        case CmpInst::FCMP_OGE:
            predicate_string = ">=";
            break;
        case CmpInst::FCMP_ULE:
        case CmpInst::FCMP_OLE:
            predicate_string = "<=";
            break;
        case CmpInst::FCMP_UEQ:
        case CmpInst::FCMP_OEQ:
            predicate_string = "==";
            break;
        case CmpInst::FCMP_UNE:
        case CmpInst::FCMP_ONE:
            predicate_string = "!=";
            break;
        default:
            cout << "predicate " << predicate << endl;
            throw runtime_error("predicate not supported");
    }

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    // LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();
    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();

    op0 = stripOuterParams(op0);
    op1 = stripOuterParams(op1);
    gencode += op0;
    gencode += " " + predicate_string + " ";
    gencode += op1;

    localValueInfo->setExpression(gencode);
}

void NewInstructionDumper::dumpExt(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    string op0 = op0info->getExpr();

    localValueInfo->setExpression(op0);
}

void NewInstructionDumper::dumpTrunc(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    string op0 = op0info->getExpr();

    // since this is float point trunc, lets just assume we're going from double to float
    // fix any exceptiosn to this rule later
    string typestr = typeDumper->dumpType(instr->getType());
    localValueInfo->setExpression("(" + typestr + ")" + op0);
}

void NewInstructionDumper::dumpBitCast(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    BitCastInst *instr = cast<BitCastInst>(localValueInfo->value);

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    string op0 = op0info->getExpr();

    // we will split the code into two parts:
    // assignment, like:  v3 = incoming-expression;
    // bitcast, like v4 = *(int *)&v3;
    // actually, we can do this by just tweaking the conitions in which we do assign
    // lets do that for now

    string gencode = "";
    string op0str = op0;
    localValueInfo->setAddressSpace(0);
    if(PointerType *srcType = dyn_cast<PointerType>(instr->getSrcTy())) {
        if(PointerType *destType = dyn_cast<PointerType>(instr->getDestTy())) {
            Type *castType = PointerType::get(destType->getElementType(), srcType->getAddressSpace());
            gencode += "((" + typeDumper->dumpType(castType) + ")" + op0str + ")";
            copyAddressSpace(instr->getOperand(0), instr);
            localValueInfo->setAddressSpaceFrom(instr->getOperand(0));
        }
    } else {
        // just pass through?
        // cout << "bitcast, not a pointer" << endl;
        gencode += "*(" + typeDumper->dumpType(instr->getDestTy()) + " *)&(" + op0str + ")";
    }
    localValueInfo->setExpression(gencode);
}

void NewInstructionDumper::dumpAddrSpaceCast(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    AddrSpaceCastInst *instr = cast<AddrSpaceCastInst>(localValueInfo->value);

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    string op0 = op0info->getExpr();

    string gencode = "";
    string op0str = op0;
    copyAddressSpace(instr->getOperand(0), instr);
    localValueInfo->setAddressSpaceFrom(instr->getOperand(0));
    // hackily ignore casts if shared address space
    // actually, just ignore all address space casts, since they're all illegal in opencl...
    // gencode += "((" + typeDumper->dumpType(instr->getType()) + ")" + op0str + ")";
    gencode += op0str;
    localValueInfo->setExpression(gencode);
    // return gencode;
}

void NewInstructionDumper::dumpSelect(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));
    LocalValueInfo *op2info = getOperand(instr->getOperand(2));

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    // LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();
    // LocalValueInfo *op2info = localValueInfos->at(instr->getOperand(2)).get();

    string op0 = op0info->getExpr();
    string op1 = op1info->getExpr();
    string op2 = op2info->getExpr();

    string gencode = "";
    copyAddressSpace(instr->getOperand(1), instr);
    localValueInfo->setAddressSpaceFrom(instr->getOperand(1));
    gencode += op0 + " ? ";
    gencode += op1 + " : ";
    gencode += op2;
    gencode = "(" + gencode + ")";

    localValueInfo->setExpression(gencode);
    // return gencode;
}

void NewInstructionDumper::dumpGetElementPtr(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    GetElementPtrInst *instr = cast<GetElementPtrInst>(localValueInfo->value);

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    LocalValueInfo *op0info = getOperand(instr->getOperand(0));

    string gencode = "";
    int numOperands = instr->getNumOperands();
    string rhs = "";
    rhs += "" + op0info->getExpr();  // dumpOperand(instr->getOperand(0));
    Type *currentType = instr->getOperand(0)->getType();
    PointerType *op0typeptr = dyn_cast<PointerType>(instr->getOperand(0)->getType());
    if(op0typeptr == 0) {
        throw runtime_error("dumpgetelementptr op0typeptr is 0");
    }
    int addressspace = op0typeptr->getAddressSpace();
    if(addressspace == 3) { // local/shared memory
        // pointer into shared memory.
        // so, this isnt a local value in llvm, its a global one
        // so, we need to choose to add it as a local variable
        Value *sharedValue = instr->getOperand(0);
        LocalValueInfo *sharedInfo = LocalValueInfo::getOrCreate(
            localNames, localValueInfos, sharedValue, sharedValue->getName().str());
        // sharedInfo->clWriter.reset(new SharedClWriter(sharedInfo));
        sharedInfo->setAddressSpace(3);
        // sharedInfo->setAsAssigned();
        // sharedVariablesToDeclare->insert();
    }
    for(int d=0; d < numOperands - 1; d++) {
        Type *newType = 0;
        if(SequentialType *seqType = dyn_cast<SequentialType>(currentType)) {
            if(d == 0) {
                if(isa<ArrayType>(seqType->getElementType())) {
                    rhs = "(&" + rhs + ")";
                }
            }
            // LocalValueInfo *thisInfo = localValueInfos->at(instr->getOperand(d + 1)).get();
            LocalValueInfo *thisInfo = getOperand(instr->getOperand(d + 1));
            string idxstring = thisInfo->getExpr();
            idxstring = stripOuterParams(idxstring);
            rhs += string("[") + idxstring + "]";
            currentType->dump();
            cout << endl;
            newType = seqType->getElementType();
        } else if(PointerType *pointerType = dyn_cast<PointerType>(currentType)) {
            // PointerType *pointerType = cast<PointerType>(currentType);
            // if(d == 0) {
            //     if(isa<ArrayType>(cast<SequentialType>(currentType)->getElementType())) {
            //         rhs = "(&" + rhs + ")";
            //     }
            // }
            // LocalValueInfo *thisInfo = localValueInfos->at(instr->getOperand(d + 1)).get();
            LocalValueInfo *thisInfo = getOperand(instr->getOperand(d + 1));
            string idxstring = thisInfo->getExpr();
            idxstring = stripOuterParams(idxstring);
            rhs += string("[") + idxstring + "]";
            currentType->dump();
            cout << endl;
            newType = pointerType->getElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            string structName = getName(structtype);
            if(structName == "struct.float4") {
                int idx = readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, addressspace);
                newType = elementType;
                rhs = "((" + typeDumper->dumpType(castType) + ")&" + rhs + ")";
                rhs += string("[") + easycl::toString(idx) + "]";
            } else {
                // generic struct
                int idx = readInt32Constant(instr->getOperand(d + 1));
                Type *elementType = structtype->getElementType(idx);
                rhs += string(".f") + easycl::toString(idx);
                newType = elementType;
                if(isa<PointerType>(newType)) {
                    // if its a pointer in a struct, hackily assume gloal for now
                    addressspace = 1;
                } else {
                    // addressspace = 0;
                }
            }
        } else {
            cout << "type unimplemeneted in gep:" << endl;
            currentType->dump();
            cout << endl;
            cout << "isa pointer " << isa<PointerType>(currentType) << endl;
            cout << "isa struct " << isa<StructType>(currentType) << endl;
            cout << "isa composite " << isa<CompositeType>(currentType) << endl;
            cout << "isa sequential " << isa<SequentialType>(currentType) << endl;
            cout << "isa type " << isa<Type>(currentType) << endl;
            throw runtime_error("type not implemented in gep");
        }
        // if new type is a pointer, and old type was a struct, then we assume its a global pointer, and therefore
        // update the addressspace to be global, ie 1.  This is a bit hacky I know
        currentType = newType;
    }
    updateAddressSpace(instr, addressspace);
    localValueInfo->setAddressSpace(addressspace);
    rhs = "(" + stripOuterParams(rhs) + ")";
    rhs = "(&" + rhs + ")";
    // cout << "gep rhs=" << rhs << endl;

    localValueInfo->setExpression(rhs);
    // return rhs;
}

void NewInstructionDumper::dumpLoad(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);

    string rhs = getOperand(instr->getOperand(0))->getExpr() + "[0]";
    copyAddressSpace(instr->getOperand(0), instr);
    localValueInfo->setAddressSpaceFrom(instr->getOperand(0));
    // return rhs;
    localValueInfo->setExpression(rhs);
}

void NewInstructionDumper::dumpStore(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new StoreClWriter(localValueInfo));
    StoreInst *instr = cast<StoreInst>(localValueInfo->value);
    // string gencode = "";
    localValueInfo->setAddressSpaceFrom(instr->getOperand(1));
    copyAddressSpace(instr->getOperand(0), instr->getOperand(1));

    LocalValueInfo *op0info = getOperand(instr->getOperand(0));
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    // LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();

    string rhs = op0info->getExpr(); // dumpOperand(instr->getOperand(0));
    rhs = stripOuterParams(rhs);
    string inlinecode = op1info->getExpr() + "[0] = " + rhs;
    // cout << "dumpStore, gencode=[" << inlinecode << "]" << endl;
    localValueInfo->inlineCl.push_back(inlinecode);
    // localValueInfo->setExpression(o1info->getExpr());
    // (*localExpressionByValue)[instr] = 
    // return gencode;
}

void NewInstructionDumper::dumpAlloca(cocl::LocalValueInfo *localValueInfo) {
    // string gencode = "";
    // AllocaInst *alloca = cast<AllocaInst>(localValueInfo->value);
    AllocaInfo allocaInfo;
    localValueInfo->clWriter.reset(new AllocaClWriter(localValueInfo));
    string name = localValueInfo->name;
    localValueInfo->setExpression(name);
}

void NewInstructionDumper::dumpExtractValue(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new ClWriter(localValueInfo));
    ExtractValueInst *instr = cast<ExtractValueInst>(localValueInfo->value);
    // string gencode = "";

    // string incomingOperand = getOperand(instr->getAggregateOperand());
    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    // Type *currentType = instr->getAggregateOperand()->getType();


    LocalValueInfo *aggInfo = getOperand(instr->getAggregateOperand());
    localValueInfo->setAddressSpaceFrom(aggInfo);
    copyAddressSpace(instr, aggInfo->value);

    // LocalValueInfo *op0info = localValueInfos->at(instr->getOperand(0)).get();
    ostringstream gencode;
    // string lhs = "";
    ostringstream rhs;

    // string incomingOperand = dumpOperand(instr->getAggregateOperand());
    // LocalValueInfo *incomingOperandInfo = this->getOperand(instr->getAggregateOperand());
    // string incomingOperand = incomingOperandInfo->getExpr();
    string incomingOperand = aggInfo->getExpr();
    // cout << "incomingOperand " << incomingOperand << endl;
    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getAggregateOperand()->getType();
    rhs << incomingOperand;
    ArrayRef<unsigned> indices = instr->getIndices();
    int numIndices = instr->getNumIndices();
    // cout << "  numIndices=" << numIndices << endl;
    for(int d=0; d < numIndices; d++) {
        int idx = indices[d];
        Type *newType = 0;
        if(currentType->isPointerTy()) {
            // cout << "pointer or array" << endl;
            // cout << "ispointerty? " << currentType->isPointerTy() << endl;
            // cout << "isa<ArrayType>? " << isa<ArrayType>(currentType) << endl;
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    // cout << "element type is arraytype" << endl;
                    string oldRhs = rhs.str();
                    rhs.str("");
                    rhs << "(&" << oldRhs << ")";
                }
            }
            // if(numIndices > 0) {
            // cout << "d + 1" << (d + 1) << endl;
            // Value *operand = instr->getOperand(d + 1);
            // cout << "got operand " << d << endl;
            LocalValueInfo *thisInfo = getOperand(instr->getOperand(d + 1));
            rhs << "[" << thisInfo->getExpr() << "]";
            newType = currentType->getPointerElementType();
        } else if(isa<ArrayType>(currentType)) {
            // cout << "pointer or array" << endl;
            // cout << "ispointerty? " << currentType->isPointerTy() << endl;
            // cout << "  isa<ArrayType>? " << isa<ArrayType>(currentType) << endl;
            // cout << "  d=" << d << endl;
            // if(d == 0) {
            //     if(isa<ArrayType>(currentType->getPointerElementType())) {
            //         cout << "element type is arraytype" << endl;
            //         lhs = "(&" + lhs + ")";
            //     }
            // }
            // if(numIndices > 0) {
            // cout << "d + 1" << (d + 1) << endl;
            Value *operand = instr->getOperand(d);
            // int index = indices[d];
            // cout << "  idx=" << idx << endl;
            // LocalValueInfo *thisInfo = getOperand(instr->getOperand(d));
            rhs << "[" << idx << "]";
            // cout << "  rhs [" << rhs.str() << "]" << endl;
            newType = currentType->getPointerElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            // cout << "struct" << endl;
            string structName = getName(structtype);
            if(structName == "struct.float4") {
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, 0);
                newType = elementType;
                string oldRhs = rhs.str();
                rhs.str("");
                rhs << "((" << typeDumper->dumpType(castType) << ")&" << oldRhs << ")";
                rhs << "[" << idx << "]";
            } else {
                // generic struct
                Type *elementType = structtype->getElementType(idx);
                rhs << ".f" << idx;
                newType = elementType;
            }
        } else {
            cout << "NewInstructionDumper::dumpExtractValue unimplemented type" << endl;
            currentType->dump();
            throw runtime_error("type not implemented in extractvalue");
        }
        currentType = newType;
    }
    // gencode << rhs.str();
    // return gencode;
    // cout << "  dumpExtractValue, rhs=[" << rhs.str() << "]" << endl;
    // cout << "gencode " << gencode << endl;
    localValueInfo->setExpression(rhs.str());
}

void NewInstructionDumper::dumpInsertValue(cocl::LocalValueInfo *localValueInfo) {
    localValueInfo->clWriter.reset(new InsertValueClWriter(localValueInfo));
    InsertValueClWriter *clWriter = cast<InsertValueClWriter>(localValueInfo->clWriter.get());
    InsertValueInst *instr = cast<InsertValueInst>(localValueInfo->value);

    // bool incomingIsUndef = false;
    LocalValueInfo *op0info = 0;
    if(isa<UndefValue>(instr->getOperand(0))) {
        clWriter->fromUndef = true;
    } else {
        op0info = getOperand(instr->getOperand(0));
        // op0info = localValueInfos->at(instr->getOperand(0)).get();
    }
    LocalValueInfo *op1info = getOperand(instr->getOperand(1));
    // LocalValueInfo *op1info = localValueInfos->at(instr->getOperand(1)).get();

    string lhs = "";

    // cout << "lhs undef value? " << isa<UndefValue>(instr->getOperand(0)) << endl;
    // string incomingOperand = dumpOperand(instr->getOperand(0));
    // if rhs is empty, that means its 'undef', so we better declare it, I guess...
    Type *currentType = instr->getType();
    // bool declaredVar = false;
    string incomingOperand = "";
    if(clWriter->fromUndef) {
        // cout << "incomingoperand is undef, so adding insertvalue instr to variables to declare" << endl;
        localValueInfo->toBeDeclared = true;
        // variablesToDeclare->insert(instr);
        // localNames->getOrCreateName(instr);
        // incomingOperand = dumpOperand(instr);
        localValueInfo->toBeDeclared = true;
        localValueInfo->setExpression(localValueInfo->name);
        incomingOperand = localValueInfo->getExpr();
        // declaredVar = true;
    } else {
        incomingOperand = op0info->getExpr();
    }
    lhs += incomingOperand;
    ArrayRef<unsigned> indices = instr->getIndices();
    int numIndices = instr->getNumIndices();
    for(int d=0; d < numIndices; d++) {
        int idx = indices[d];
        Type *newType = 0;
        if(currentType->isPointerTy() || isa<ArrayType>(currentType)) {
            // cout << "insertvalue: pointer or array type" << endl;
            if(d == 0) {
                if(isa<ArrayType>(currentType->getPointerElementType())) {
                    lhs = "(&" + lhs + ")";
                }
            }
            // Value *thisop = instr->getOperand(d + 1);
            // LocalValueInfo* thisvalueinfo = localValueInfos->at(thisop).get();
            // lhs += string("[") + thisvalueinfo->getExpr() + "]";
            lhs += string("[") + easycl::toString(idx) + "]";
            newType = currentType->getPointerElementType();
        } else if(StructType *structtype = dyn_cast<StructType>(currentType)) {
            // cout << "insertvalue: struct type" << endl;
            string structName = getName(structtype);
            if(structName == "struct.float4") {
                // cout << "is struct.float4" << endl;
                Type *elementType = structtype->getElementType(idx);
                Type *castType = PointerType::get(elementType, 0);
                newType = elementType;
                lhs = "((" + typeDumper->dumpType(castType) + ")&" + lhs + ")";
                lhs += string("[") + easycl::toString(idx) + "]";
            } else {
                // generic struct
                // cout << "is generic struct" << endl;
                Type *elementType = structtype->getElementType(idx);
                lhs += string(".f") + easycl::toString(idx);
                newType = elementType;
            }
        } else {
            currentType->dump();
            throw runtime_error("type not implemented in insertvalue");
        }
        currentType = newType;
    }
    // std::vector<std::string> res;
    // string updateline = lhs + " = " + dumpOperand(instr->getOperand(1));
    string updateline = lhs + " = " + op1info->getExpr();
    // extralines->push_back(updateline);
    localValueInfo->inlineCl.push_back(updateline);
    // res.push_back(lhs + " = " + dumpOperand(instr->getOperand(1)));
    // cout << "dumpinsertvalue lhs=" << lhs << endl;
    // if(false && declaredVar) {
    //     // variablesToDeclare->insert(instr);
    //     string assignline = dumpOperand(instr) + " = " + incomingOperand;
    //     cout << "declaredvar=" << declaredVar << " so adding line " << assignline << endl;
    //     extralines->push_back(assignline);
    // }
    // (*localExpressionByValue)[instr] = dumpOperand(instr);
    // (*localExpressionByValue)[instr] = incomingOperand;
    localValueInfo->setExpression(incomingOperand);
    // return "";
}

void NewInstructionDumper::dumpBinaryOperator(LocalValueInfo *localValueInfo, std::string opstring) {
    Instruction *instr = cast<Instruction>(localValueInfo->value);
    string gencode = "";
    // copyAddressSpace(instr->getOperand(0), instr);
    // Value *op1 = instr->getOperand(0);
    // LocalValueInfo *op1info = localValueInfos->at(op1).get();
    LocalValueInfo *op1info = getOperand(instr->getOperand(0));
    // gencode += dumpOperand(op1) + " ";
    gencode += op1info->getExpr() + " ";

    gencode += opstring + " ";

    // Value *op2 = instr->getOperand(1);
    // LocalValueInfo *op2info = localValueInfos->at(op2).get();
    LocalValueInfo *op2info = getOperand(instr->getOperand(1));
    gencode += op2info->getExpr();

    localValueInfo->setExpression("(" + gencode + ")");
    localValueInfo->setAddressSpace(0);
    localValueInfo->clWriter.reset(new BinaryClWriter(localValueInfo));
    // localValueInfo->setAddressSpace()
    // return gencode;
}

void NewInstructionDumper::dumpMemcpyCharCharLong(LocalValueInfo *localValueInfo) {
    // std::string gencode = "";
    localValueInfo->clWriter.reset(new NoExpressionClWriter(localValueInfo));
    Instruction *instr = cast<Instruction>(localValueInfo->value);
    int totalLength = cast<ConstantInt>(instr->getOperand(2))->getSExtValue();
    int align = cast<ConstantInt>(instr->getOperand(3))->getSExtValue();
    string dstAddressSpaceStr = typeDumper->dumpAddressSpace(instr->getOperand(0)->getType());
    string srcAddressSpaceStr = typeDumper->dumpAddressSpace(instr->getOperand(1)->getType());
    string elementTypeString = "";
    if(align == 4) {
        elementTypeString = "int";
    } else if(align == 8) {
        elementTypeString = "int2";
    } else if(align == 16) {
        elementTypeString = "int4";
    } else {
        throw runtime_error("not implemented dumpmemcpy for align " + easycl::toString(align));
    }
    int numElements = totalLength / align;
    if(numElements >1) {
        // localValueInfo->inlineCl.push_back("#pragma unroll");
        localValueInfo->inlineCl.push_back("for(int __i=0; __i < " + easycl::toString(numElements) + "; __i++) {");
        localValueInfo->inlineCl.push_back("    ((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(0))->getExpr() + ")[__i] = " +
            "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(1))->getExpr() + ")[__i]");
        localValueInfo->inlineCl.push_back("}\n");
    } else {
        localValueInfo->inlineCl.push_back("((" + dstAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(0))->getExpr() + ")[0] = " +
            "((" + srcAddressSpaceStr + " " + elementTypeString + " *)" + getOperand(instr->getOperand(1))->getExpr() + ")[0]");
    }
    // return gencode;
    // localValueInfo
}

void NewInstructionDumper::dumpCall(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    localValueInfo->clWriter.reset(new CallClWriter(localValueInfo));
    // ClWriter *clWriter = cast<ClWriter>(localValueInfo->clWriter.get());
    CallInst *instr = cast<CallInst>(localValueInfo->value);

    // string gencode = "";
    Value *calledValue = instr->getCalledValue();
    string calledName = calledValue->getName().str();
    // if(calledName.size() > 32) {
    //     calledName = calledName.substr(0, 31);
    //     calledValue->setName(calledName);
    // }
    string functionName = instr->getCalledValue()->getName().str();
    cout << "called function: [" << functionName << "]" << endl;
    bool internalfunc = false;
    if(functionName == "llvm.ptx.read.tid.x" || functionName == "llvm.nvvm.read.ptx.sreg.tid.x") { // second on is llvm 4.0, first is 3.8
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_id(0)");
        return;
    } else if(functionName == "llvm.ptx.read.tid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_id(1)");
        return;
    } else if(functionName == "llvm.ptx.read.tid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_id(2)");
        return;
    } else if(functionName == "llvm.ptx.read.ctaid.x") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_group_id(0)");
        return;
    } else if(functionName == "llvm.ptx.read.ctaid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_group_id(1)");
        return;
    } else if(functionName == "llvm.ptx.read.ctaid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_group_id(2)");
        return;
    } else if(functionName == "llvm.ptx.read.nctaid.x") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_num_groups(0)");
        return;
    } else if(functionName == "llvm.ptx.read.nctaid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_num_groups(1)");
        return;
    } else if(functionName == "llvm.ptx.read.nctaid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_num_groups(2)");
        return;
    } else if(functionName == "llvm.ptx.read.ntid.x") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_size(0)");
        return;
    } else if(functionName == "llvm.ptx.read.ntid.y") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_size(1)");
        return;
    } else if(functionName == "llvm.ptx.read.ntid.z") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("get_local_size(2)");
        return;
    } else if(functionName == "llvm.cuda.syncthreads" || functionName == "_Z11syncthreadsv") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("barrier(CLK_GLOBAL_MEM_FENCE)");
        return;
    } else if(functionName == "_Z8__umulhiii") {
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("0");
        return;
    } else if(functionName == "llvm.dbg.value") {
        // ignore
        localValueInfo->skip();
        // localValueInfo->setAddressSpace(0);
        // localValueInfo->setExpression("");
        return;
    } else if(functionName == "llvm.dbg.declare") {
        // ignore
        localValueInfo->skip();
        // localValueInfo->setAddressSpace(0);
        // localValueInfo->setExpression("");
        // return "";
        return;
    } else if(functionName == "_Z11__shfl_downIfET_S0_ii") {
        string gencode = "";
        gencode += "__shfl_down_3(scratch, ";
        int i = 0;
        for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
            Value *op = &*it->get();
            if(i > 0) {
                gencode += ", ";
            }
            gencode += stripOuterParams(getOperand(op)->getExpr());
            i++;
        }
        gencode += ")";
        // cout << "inserting " << functionName << " into shimfunctionsneeded" << endl;
        shimFunctionsNeeded->insert("__shfl_down_3");
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression(gencode);
        return;
    } else if(functionName == "_Z11__shfl_downIfET_S0_i") {
        string gencode = "__shfl_down_2(scratch, ";
        int i = 0;
        for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
            Value *op = &*it->get();
            if(i > 0) {
                gencode += ", ";
            }
            gencode += stripOuterParams(getOperand(op)->getExpr());
            i++;
        }
        gencode += ")";
        // cout << "inserting " << functionName << " into shimfunctionsneeded" << endl;
        shimFunctionsNeeded->insert("__shfl_down_2");
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression(gencode);
        return;
        // return gencode;
    } else if(functionName == "_Z13__threadfencev") {
        // Not sure if this is correct?
        // seems to be correct-ish???
        // what I understand:
        // (from https://stackoverflow.com/questions/5232689/cuda-threadfence/5233737#5233737 )
        // threadfence orders writes to memory, so if you do:
        // - write data
        // - threadfence
        // - write flag
        // => then if another thread sees the flag, the data that was written is guaranteed to be visible
        // to it too
        // I *think* that barrier(CLK_GLOBAL_MEM_FENCE) achieves the same thing, though it might be
        // a bit too "strong" (ie slow)?
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("barrier(CLK_GLOBAL_MEM_FENCE)");
        return;
    } else if(functionName == "llvm.lifetime.start") {
        // return "";  // just ignore for now
        localValueInfo->skip();
        // localValueInfo->setAddressSpace(0);
        // localValueInfo->setExpression("");
        return;
    } else if(functionName == "llvm.lifetime.end") {
        // return "";  // just ignore for now
        localValueInfo->skip();
        // localValueInfo->setAddressSpace(0);
        // localValueInfo->setExpression("");
        return;
    } else if(functionName == "_Z11make_float4ffff") {
        // change this into something like: (float4)(a, b, c, d)
        functionName = "(float4)";
        internalfunc = true;
    } else if(functionName == "_GLOBAL__sub_I_struct_initializer.cu") {
        cerr << "WARNING: skipping _GLOBAL__sub_I_struct_initializer.cu" << endl;
        // return "";
        localValueInfo->setAddressSpace(0);
        localValueInfo->setExpression("");
        return;
    } else if(functionName == "__nvvm_reflect") {
        localValueInfo->setExpression("0"); //ignore, (but pretend to return 0)
        localValueInfo->setAddressSpace(0);
        return;
    } else if(functionName == "llvm.memcpy.p0i8.p0i8.i64") {
        dumpMemcpyCharCharLong(localValueInfo);  // just ignore for now
        return;
    } else if(functionNamesMap->isMappedFunction(functionName)) {
        functionName = functionNamesMap->getFunctionMappedName(functionName);
        internalfunc = true;
    }
    string gencode = functionName + "(";
    int i = 0;
    for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
        Value *op = &*it->get();
        if(i > 0) {
            gencode += ", ";
        }
        gencode += stripOuterParams(getOperand(op)->getExpr());
        i++;
    }
    if(!internalfunc) {
        if(i > 0) {
            gencode += ", ";
        }
        localValueInfo->needDependencies = false;
        gencode += "scratch";
        // Module *M = instr->getModule();
        // std::string shortFunctionName = functionName;
        // if(shortFnNameByOrigName->find(functionName) != shortFnNameByOrigName->end()) {
        //     // string origFunctionName = functionName;
        //     shortFunctionName = shortFnNameByOrigName->operator[](functionName);
        //     cout << "new_instruction_dumper dumpCall() functionName=" << functionName << " => " << shortFunctionName << endl;
        // }
        // cout << "M " << M << endl;
        // Function *F = M->getFunction(StringRef(functionName));
        Function *F = M->getFunction(functionName);
        if(F != 0) {
            // check arguments...
            bool addressSpacesMatch = true;
            // auto callit = instr->arg_begin();
            int i = 0;
            ostringstream manglingpostfix;
            for(auto it=F->arg_begin(); it != F->arg_end(); it++) {
                Value *callArg = instr->getArgOperand(i);
                Argument *calleeArg = &*it;
                if(PointerType *callPtr = dyn_cast<PointerType>(callArg->getType())) {
                    PointerType *calleePtr = cast<PointerType>(calleeArg->getType());
                    char thisaddressspacechar = 'p'; // private
                    switch(callPtr->getAddressSpace()) {
                        case 0:
                            break;
                        case 1:
                            thisaddressspacechar = 'g';  // global
                            break;
                        case 3:
                            thisaddressspacechar = 's';  // shared
                            break;
                        case 4:
                            thisaddressspacechar = 'c';  // constant
                            break;
                        default:
                            cout << "address space: " << callPtr->getAddressSpace() << endl;
                            throw runtime_error("unhandled address space");
                    }
                    manglingpostfix << thisaddressspacechar;
                    if(callPtr->getAddressSpace() != calleePtr->getAddressSpace()) {
                        addressSpacesMatch = false;
                        // cout << "arg " << callArg->getName().str() << " needs address space mutation" << endl;
                        // break;
                    }
                }
                i++;
            }
            if(!addressSpacesMatch) {
                string newName = F->getName().str() + "_" + manglingpostfix.str();
                // cout << "new name [" << newName << "]" << endl;
                bool alreadyExists = globalNames->hasName(newName);
                // cout << "alreadyeists? " << alreadyExists << endl;

                // int numArgs = instr->getNumArgOperands();
                // cout << "numArgs " << numArgs << endl;
                int i;

                Function *newFunc = 0;
                if(!alreadyExists) {
                    // cout << "cloning new funciton " << newName << endl;
                    ValueToValueMapTy valueMap;
                    #if(LLVM_VERSION_MAJOR == 4)
                    #pragma message("clang 4 detected")
                    newFunc = CloneFunction(F,
                                   valueMap);
                    #else
                    newFunc = CloneFunction(F,
                                   valueMap,
                                   false);
                    #endif
                    newFunc->setName(newName);
                    i = 0;
                    for(auto it=newFunc->arg_begin(); it != newFunc->arg_end(); it++) {
                        // Argument *callArg = callit->;
                        Value *callArg = instr->getArgOperand(i);
                        Argument *calleeArg = &*it;
                        copyAddressSpace(callArg, calleeArg);
                        i++;
                    }
                    if(globalNames->getOrCreateName(newFunc, newName) != newName) {
                        cout << "somehow created same name twice" << endl;
                        throw runtime_error("somehow created same name twice");
                    }
                }
                newFunc = cast<Function>(globalNames->getValueByName(newName));
                // at this point, we only really want to insert it into needed functions if 
                // its not there already yet
                // also we need to mangle the name anyway....
                // maybe we use the name mangling to check if it's already there???
                // cout << "inserting new funciton into neededfunctions" << endl;
                neededFunctions->insert(newFunc);
                if(isa<PointerType>(newFunc->getReturnType()) && returnTypeByFunction.find(newFunc) == returnTypeByFunction.end()) {
                    // needDependencies = true;
                    localValueInfo->needDependencies = true;
                    return;
                }
                F = newFunc;
                functionName = newName;
            } else {
                neededFunctions->insert(F);
                if(isa<PointerType>(F->getReturnType()) && returnTypeByFunction.find(F) == returnTypeByFunction.end()) {
                    // needDependencies = true;
                    localValueInfo->needDependencies = true;
                    return;
                }
            // do we need to walk this function first?
            // check the return code
            }

            gencode = functionName + "(";
            i = 0;
            for(auto it=instr->arg_begin(); it != instr->arg_end(); it++) {
                Value *op = &*it->get();
                if(i > 0) {
                    gencode += ", ";
                }
                gencode += stripOuterParams(getOperand(op)->getExpr());
                i++;
            }
            if(i > 0) {
                gencode += ", ";
            }
            gencode += "scratch";
            if(isa<PointerType>(F->getReturnType())) {
                Type *returnType = returnTypeByFunction.at(F);
                // cout << "function return type:" << endl;
                // returnType->dump();
                // cout << endl;
                if(PointerType *retptr = dyn_cast<PointerType>(returnType)) {
                    int functionReturnAddressSpace = retptr->getAddressSpace();
                    // cout << " updating call instruction to addressspace " << functionReturnAddressSpace << endl;
                    updateAddressSpace(instr, functionReturnAddressSpace);
                    localValueInfo->setAddressSpace(functionReturnAddressSpace);
                }
            }
        } else {
            cout << "couldnt find function " + functionName << endl;
            // cout << "here are available functions:" << endl;
            // for(auto it = M->begin(); it != M->end(); it++) {
            //     Function *thisF = &*it;
            //     cout << "    " << thisF->getName().str() << endl;
            // }
            throw runtime_error("couldnt find function " + functionName);
        }
    }
    gencode += ")";
    // return gencode;
    // cout << "dumpCall gencode[" << gencode << "]" << endl;
    localValueInfo->setExpression(gencode);
}

void NewInstructionDumper::runGeneration(LocalValueInfo *localValueInfo, const std::map<llvm::Function *, llvm::Type *> &returnTypeByFunction) {
    Instruction *instruction = cast<Instruction>(localValueInfo->value);
    // needDependencies = false;
    localValueInfo->needDependencies = false;
    auto opcode = instruction->getOpcode();
    if(_addIRToCl) {
        string originalInstruction = "";
        originalInstruction += typeDumper->dumpType(instruction->getType()) + " " + localValueInfo->name + " =";
        originalInstruction += " " + string(instruction->getOpcodeName());
        for(auto it=instruction->op_begin(); it != instruction->op_end(); it++) {
            Value *op = &*it->get();
            originalInstruction += " ";
            // originalInstruction += getOperand(op)->getExpr();
            if(localNames->hasValue(op)) {
                originalInstruction += localNames->getName(op);
            } else {
                originalInstruction += "<unk>";
            }
            // if(origNameByValue.find(op) != origNameByValue.end()) {
            //     originalInstruction += origNameByValue[op];
            // } else {
            //     originalInstruction += "<unk>";
            // }
        }
        localValueInfo->inlineCl.push_back("/* " + originalInstruction + " */");
    }
    string instructionCode = "";
    switch(opcode) {
        case Instruction::FAdd:
            dumpBinaryOperator(localValueInfo, "+");
            break;
        case Instruction::FSub:
            dumpBinaryOperator(localValueInfo, "-");
            break;
        case Instruction::FMul:
            dumpBinaryOperator(localValueInfo, "*");
            break;
        case Instruction::FDiv:
            dumpBinaryOperator(localValueInfo, "/");
            break;
        case Instruction::Sub:
            dumpBinaryOperator(localValueInfo, "-");
            break;
        case Instruction::Add:
            dumpBinaryOperator(localValueInfo, "+");
            break;
        case Instruction::Mul:
            dumpBinaryOperator(localValueInfo, "*");
            break;
        case Instruction::SDiv:
            dumpBinaryOperator(localValueInfo, "/");
            break;
        case Instruction::UDiv:
            dumpBinaryOperator(localValueInfo, "/");
            break;
        case Instruction::SRem:
            dumpBinaryOperator(localValueInfo, "%");
            break;
        case Instruction::And:
            dumpBinaryOperator(localValueInfo, "&");
            break;
        case Instruction::Or:
            dumpBinaryOperator(localValueInfo, "|");
            break;
        case Instruction::Xor:
            dumpBinaryOperator(localValueInfo, "^");
            break;
        case Instruction::LShr:
            dumpBinaryOperator(localValueInfo, ">>");
            break;
        case Instruction::Shl:
            dumpBinaryOperator(localValueInfo, "<<");
            break;
        case Instruction::AShr:
            dumpBinaryOperator(localValueInfo, ">>");
            break;

        case Instruction::ICmp:
            dumpIcmp(localValueInfo);
            break;
        case Instruction::FCmp:
            dumpFcmp(localValueInfo);
            break;

        case Instruction::SExt:
        case Instruction::ZExt:
        case Instruction::FPExt:
            dumpExt(localValueInfo);
            break;

        case Instruction::FPTrunc:
        case Instruction::Trunc:
        case Instruction::UIToFP:
        case Instruction::SIToFP:
        case Instruction::FPToUI:
        case Instruction::FPToSI:
            dumpTrunc(localValueInfo);
            break;

        case Instruction::BitCast:
            dumpBitCast(localValueInfo);
            break;
        case Instruction::AddrSpaceCast:
            dumpAddrSpaceCast(localValueInfo);
            break;
        // // case Instruction::PtrToInt:
        // //     instructionCode = dumpPtrToInt(cast<PtrToIntInst>(instruction));
        // //     break;
        // // case Instruction::IntToPtr:
        // //     instructionCode = dumpInttoPtr(cast<IntToPtrInst>(instruction));
        // //     break;
        case Instruction::Select:
            dumpSelect(localValueInfo);
            break;
        case Instruction::GetElementPtr:
            dumpGetElementPtr(localValueInfo);
            break;
        case Instruction::InsertValue:
            dumpInsertValue(localValueInfo);
            break;
        case Instruction::ExtractValue:
            dumpExtractValue(localValueInfo);
            break;
        case Instruction::Store:
            dumpStore(localValueInfo);
            break;
        case Instruction::Call:
            dumpCall(localValueInfo, returnTypeByFunction);
            break;
        case Instruction::Load:
            dumpLoad(localValueInfo);
            break;
        case Instruction::Alloca:
            dumpAlloca(localValueInfo);
            // return "";
            // return;
            break;
            // return true;
        // case Instruction::Br:
        //     instructionCode = dumpBranch(cast<BranchInst>(instruction));
        //     return instructionCode;
        //     // break;
        // case Instruction::Ret:
        //     instructionCode = dumpReturn(cast<ReturnInst>(instruction));
        //     return instructionCode + ";\n";
        //     // break;
        // case Instruction::PHI:
        //     addPHIDeclaration(cast<PHINode>(instruction));
        //     return "";
        //     // break;
        default:
            cout << "opcode string " << instruction->getOpcodeName() << endl;
            throw runtime_error("unknown opcode");
    }
}

} // namespace cocl
