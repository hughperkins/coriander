using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using LLVM;
using Module = LLVM.Module;
using Type = LLVM.Type;

namespace CudaSharp
{
    static class Translator
    {
        public static Module Translate(Context context, params MethodInfo[] methods)
        {
            var module = new Module("Module", context);

            if (Environment.Is64BitOperatingSystem)
            {
                module.SetTarget("nvptx64-nvidia-cuda");
                module.SetDataLayout("e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64");
            }
            else
            {
                module.SetTarget("nvptx-nvidia-cuda");
                module.SetDataLayout("e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64");
            }

            foreach (var method in methods)
                Translate(module, method);

            return module;
        }

        private static void Translate(Module module, MethodBase method)
        {
            var function = EmitFunction(module, method);
            if (method.IsStatic == false)
                throw new CudaSharpException("Cannot translate instance methods to GPU code");

            var metadataArgs = new[]
            {
                function, PInvoke.LLVMMDStringInContext(module.Context, "kernel"),
                IntegerType.GetInt32(module.Context).Constant(1, true)
            };
            var metadata = module.Context.MetadataNodeInContext(metadataArgs);
            module.AddNamedMetadataOperand("nvvm.annotations", metadata);
        }

        private static Function EmitFunction(Module module, MethodBase method)
        {
            var methodInfo = method as MethodInfo;
            var methodConstructor = method as ConstructorInfo;
            var declaringType = method.DeclaringType;
            if (methodInfo == null && methodConstructor == null)
                throw new CudaSharpException("Unknown MethodBase type " + method.GetType().FullName);
            if (declaringType == null)
                throw new CudaSharpException("Could not find the declaring type of " + method.Name.StripNameToValidPtx());

            var parameters = method.GetParameters().Select(p => p.ParameterType);
            if (methodConstructor != null)
                parameters = new[] { declaringType.MakeByRefType() }.Concat(parameters);
            if (methodInfo != null && methodInfo.IsStatic == false)
            {
                if (declaringType.IsValueType == false)
                    throw new CudaSharpException("Cannot compile object instance methods (did you forget to mark the method as static?)");
                parameters = new[] { declaringType.MakeByRefType() }.Concat(parameters);
            }
            var llvmParameters =
                parameters.Select(t => ConvertType(module, t)).ToArray();
            var funcType = new FunctionType(ConvertType(module, methodInfo == null ? typeof(void) : methodInfo.ReturnType), llvmParameters);

            var intrinsic = method.GetCustomAttribute<Gpu.BuiltinAttribute>();
            if (intrinsic != null)
            {
                var name = intrinsic.Intrinsic;
                var preExisting = module.GetFunction(name);
                if (preExisting != null)
                    return preExisting;
                return module.CreateFunction(name, funcType);
            }

            var function = module.CreateFunction(methodConstructor == null ? method.Name.StripNameToValidPtx() : declaringType.Name.StripNameToValidPtx() + "_ctor", funcType);

            var block = new Block("entry", module.Context, function);
            var writer = new InstructionBuilder(module.Context, block);

            var opcodes = method.Disassemble().ToList();
            FindBranchTargets(opcodes, module.Context, function);

            var body = method.GetMethodBody();
            var efo = new EmitFuncObj(module, function, body, writer, null, new Stack<Value>(),
                body == null ? null : new Value[body.LocalVariables.Count], new Value[llvmParameters.Length]);

            PrintHeader(efo);
            foreach (var opcode in opcodes)
            {
                if (EmitFunctions.ContainsKey(opcode.Opcode) == false)
                    throw new CudaSharpException("Unsupported CIL instruction " + opcode.Opcode);
                var func = EmitFunctions[opcode.Opcode];
                efo.Argument = opcode.Parameter;
                func(efo);
            }

            return function;
        }

        private static void PrintHeader(EmitFuncObj _)
        {
            for (var index = 0; index < _.Parameters.Length; index++)
            {
                _.Parameters[index] = _.Builder.StackAlloc(_.Function[index].Type);
                _.Builder.Store(_.Function[index], _.Parameters[index]);
            }
            for (var index = 0; index < _.Locals.Length; index++)
                _.Locals[index] = _.Builder.StackAlloc(ConvertType(_.Module, _.CilMethod.LocalVariables[index].LocalType));
        }

        private static void FindBranchTargets(IList<OpCodeInstruction> opCodes, Context context, Function function)
        {
            for (var i = 0; i < opCodes.Count; i++)
            {
                var op = opCodes[i];
                var opcode = op.Opcode;
                switch (opcode.FlowControl)
                {
                    case FlowControl.Branch:
                    case FlowControl.Cond_Branch:
                        break;
                    default:
                        continue;
                }

                var target = Convert.ToInt32(op.Parameter);
                target += (int)opCodes[i + 1].InstructionStart;

                var insert = 0;
                while (opCodes[insert].InstructionStart != target)
                    insert++;

                var contBlock = opcode.FlowControl == FlowControl.Cond_Branch ? new Block("", context, function) : null;
                Block block;
                if (opCodes[insert].Opcode == OpCodes.Nop && opCodes[insert].Parameter != null)
                    block = (Block)opCodes[insert].Parameter;
                else
                {
                    opCodes.Insert(insert, new OpCodeInstruction(target, OpCodes.Nop, block = new Block("", context, function)));
                    if (insert < i)
                        i++;
                }
                opCodes[i] = new OpCodeInstruction(op.InstructionStart, op.Opcode, contBlock == null ? (object)block : Tuple.Create(contBlock, block));
            }
        }

        private static Type ConvertType(Module module, System.Type type)
        {
            if (type == typeof(void))
                return Type.GetVoid(module.Context);
            if (type == typeof(bool))
                return IntegerType.Get(module.Context, 1);
            if (type == typeof(byte))
                return IntegerType.Get(module.Context, 8);
            if (type == typeof(short))
                return IntegerType.Get(module.Context, 16);
            if (type == typeof(int))
                return IntegerType.GetInt32(module.Context);
            if (type == typeof(long))
                return IntegerType.Get(module.Context, 64);
            if (type == typeof(float))
                return FloatType.Get(module.Context, 32);
            if (type == typeof(double))
                return FloatType.Get(module.Context, 64);
            if (type.IsArray)
                return PointerType.Get(ConvertType(module, type.GetElementType()), 1);
            if (type.IsByRef)
                return PointerType.Get(ConvertType(module, type.GetElementType()));
            if (type.IsValueType)
            {
                var name = type.Name.StripNameToValidPtx();
                var preExisting = module.GetTypeByName(name);
                if (preExisting != null)
                    return preExisting;
                return new StructType(module.Context, name, AllFields(type).Select(t => ConvertType(module, t.FieldType)));
            }

            throw new CudaSharpException("Type cannot be translated to CUDA: " + type.FullName);
        }

        class EmitFuncObj
        {
            public InstructionBuilder Builder { get; set; }
            public object Argument { get; set; }
            public Context Context { get { return Module.Context; } }
            public Module Module { get; private set; }
            public Function Function { get; private set; }
            public MethodBody CilMethod { get; private set; }
            public Stack<Value> Stack { get; private set; }
            public Value[] Locals { get; private set; }
            public Value[] Parameters { get; private set; }

            public EmitFuncObj(Module module, Function function, MethodBody cilMethod, InstructionBuilder instructionBuilder, object argument, Stack<Value> stack, Value[] locals, Value[] parameters)
            {
                Module = module;
                Function = function;
                CilMethod = cilMethod;
                Builder = instructionBuilder;
                Argument = argument;
                Stack = stack;
                Locals = locals;
                Parameters = parameters;
            }
        }

        private delegate void EmitFunc(EmitFuncObj arg);

        private static readonly Dictionary<OpCode, EmitFunc> EmitFunctions = new Dictionary<OpCode, EmitFunc>
        {
            {OpCodes.Nop, Nop},
            {OpCodes.Pop, _ => _.Stack.Pop()},
            {OpCodes.Dup, _ => _.Stack.Push(_.Stack.Peek())},
            {OpCodes.Ret, _ => { if (_.Stack.Count == 0) _.Builder.Return(); else _.Builder.Return(_.Stack.Pop()); _.Builder = null; }},
            {OpCodes.Ldc_I4, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant((ulong)Convert.ToInt64(_.Argument), true))},
            {OpCodes.Ldc_I4_S, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant((ulong)Convert.ToInt64(_.Argument), true))},
            {OpCodes.Ldc_I4_0, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(0, true))},
            {OpCodes.Ldc_I4_1, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(1, true))},
            {OpCodes.Ldc_I4_2, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(2, true))},
            {OpCodes.Ldc_I4_3, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(3, true))},
            {OpCodes.Ldc_I4_4, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(4, true))},
            {OpCodes.Ldc_I4_5, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(5, true))},
            {OpCodes.Ldc_I4_6, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(6, true))},
            {OpCodes.Ldc_I4_7, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(7, true))},
            {OpCodes.Ldc_I4_8, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(8, true))},
            {OpCodes.Ldc_I4_M1, _ => _.Stack.Push(IntegerType.GetInt32(_.Context).Constant(ulong.MaxValue, true))},
            {OpCodes.Ldc_I8, _ => _.Stack.Push(IntegerType.Get(_.Context, 64).Constant((ulong)Convert.ToInt64(_.Argument), true))},
            {OpCodes.Stelem, StElem},
            {OpCodes.Stelem_I, StElem},
            {OpCodes.Stelem_I1, StElem},
            {OpCodes.Stelem_I2, StElem},
            {OpCodes.Stelem_I4, StElem},
            {OpCodes.Stelem_I8, StElem},
            {OpCodes.Stelem_R4, StElem},
            {OpCodes.Stelem_R8, StElem},
            {OpCodes.Stelem_Ref, StElem},
            {OpCodes.Ldelem, LdElem},
            {OpCodes.Ldelem_I, LdElem},
            {OpCodes.Ldelem_I1, LdElem},
            {OpCodes.Ldelem_I2, LdElem},
            {OpCodes.Ldelem_I4, LdElem},
            {OpCodes.Ldelem_I8, LdElem},
            {OpCodes.Ldelem_R4, LdElem},
            {OpCodes.Ldelem_R8, LdElem},
            {OpCodes.Ldelem_Ref, LdElem},
            {OpCodes.Ldelem_U1, LdElem},
            {OpCodes.Ldelem_U2, LdElem},
            {OpCodes.Ldelem_U4, LdElem},
            {OpCodes.Ldelema, LdElemA},
            {OpCodes.Ldobj, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Stobj, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Ldind_I, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_I1, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_I2, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_I4, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_I8, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_R4, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_R8, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_U1, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_U2, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_U4, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Ldind_Ref, _ => _.Stack.Push(_.Builder.Load(_.Stack.Pop()))},
            {OpCodes.Stind_I, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Stind_I1, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Stind_I2, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Stind_I4, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Stind_I8, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Stind_R4, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Stind_R8, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Stind_Ref, _ => _.Builder.Store(_.Stack.Pop(), _.Stack.Pop())},
            {OpCodes.Conv_I1, _ => ConvertNum(_, IntegerType.Get(_.Context, 8 ), true)},
            {OpCodes.Conv_I2, _ => ConvertNum(_, IntegerType.Get(_.Context, 16), true)},
            {OpCodes.Conv_I4, _ => ConvertNum(_, IntegerType.Get(_.Context, 32), true)},
            {OpCodes.Conv_I8, _ => ConvertNum(_, IntegerType.Get(_.Context, 64), true)},
            {OpCodes.Conv_U1, _ => ConvertNum(_, IntegerType.Get(_.Context, 8 ), false)},
            {OpCodes.Conv_U2, _ => ConvertNum(_, IntegerType.Get(_.Context, 16), false)},
            {OpCodes.Conv_U4, _ => ConvertNum(_, IntegerType.Get(_.Context, 32), false)},
            {OpCodes.Conv_U8, _ => ConvertNum(_, IntegerType.Get(_.Context, 64), false)},
            {OpCodes.Conv_R4, _ => ConvertNum(_, FloatType.Get(_.Context, 32), true)},
            {OpCodes.Conv_R8, _ => ConvertNum(_, FloatType.Get(_.Context, 64), true)},
            {OpCodes.Neg, _ => _.Stack.Push(_.Builder.Negate(_.Stack.Pop()))},
            {OpCodes.Not, _ => _.Stack.Push(_.Builder.Not(_.Stack.Pop()))},
            {OpCodes.Add, _ => _.Stack.Push(_.Builder.Add(_.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Sub, _ => _.Stack.Push(_.Builder.Subtract(_.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Mul, _ => _.Stack.Push(_.Builder.Multiply(_.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Div, _ => _.Stack.Push(_.Builder.Divide(true, _.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Div_Un, _ => _.Stack.Push(_.Builder.Divide(false, _.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Rem, _ => _.Stack.Push(_.Builder.Reminder(true, _.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Rem_Un, _ => _.Stack.Push(_.Builder.Reminder(false, _.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.And, _ => _.Stack.Push(_.Builder.And(_.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Or, _ => _.Stack.Push(_.Builder.Or(_.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Xor, _ => _.Stack.Push(_.Builder.Xor(_.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Shl, _ => _.Stack.Push(_.Builder.ShiftLeft(_.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Shr, _ => _.Stack.Push(_.Builder.ShiftRight(true, _.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Shr_Un, _ => _.Stack.Push(_.Builder.ShiftRight(false, _.Stack.Pop(), _.Stack.Pop()))},
            {OpCodes.Ceq, Ceq},
            {OpCodes.Cgt, Cgt},
            {OpCodes.Cgt_Un, CgtUn},
            {OpCodes.Clt, Clt},
            {OpCodes.Clt_Un, CltUn},
            {OpCodes.Ldloca, _ => LdVarA(_, _.Locals, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldloca_S, _ => LdVarA(_, _.Locals, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldloc, _ => LdVar(_, _.Locals, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldloc_S, _ => LdVar(_, _.Locals, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldloc_0, _ => LdVar(_, _.Locals, 0)},
            {OpCodes.Ldloc_1, _ => LdVar(_, _.Locals, 1)},
            {OpCodes.Ldloc_2, _ => LdVar(_, _.Locals, 2)},
            {OpCodes.Ldloc_3, _ => LdVar(_, _.Locals, 3)},
            {OpCodes.Stloc, _ => StVar(_, _.Locals, Convert.ToInt32(_.Argument))},
            {OpCodes.Stloc_S, _ => StVar(_, _.Locals, Convert.ToInt32(_.Argument))},
            {OpCodes.Stloc_0, _ => StVar(_, _.Locals, 0)},
            {OpCodes.Stloc_1, _ => StVar(_, _.Locals, 1)},
            {OpCodes.Stloc_2, _ => StVar(_, _.Locals, 2)},
            {OpCodes.Stloc_3, _ => StVar(_, _.Locals, 3)},
            {OpCodes.Ldarga, _ => LdVarA(_, _.Parameters, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldarga_S, _ => LdVarA(_, _.Parameters, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldarg, _ => LdVar(_, _.Parameters, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldarg_S, _ => LdVar(_, _.Parameters, Convert.ToInt32(_.Argument))},
            {OpCodes.Ldarg_0, _ => LdVar(_, _.Parameters, 0)},
            {OpCodes.Ldarg_1, _ => LdVar(_, _.Parameters, 1)},
            {OpCodes.Ldarg_2, _ => LdVar(_, _.Parameters, 2)},
            {OpCodes.Ldarg_3, _ => LdVar(_, _.Parameters, 3)},
            {OpCodes.Starg, _ => StVar(_, _.Parameters, Convert.ToInt32(_.Argument))},
            {OpCodes.Starg_S, _ => StVar(_, _.Parameters, Convert.ToInt32(_.Argument))},
            {OpCodes.Br, Br},
            {OpCodes.Br_S, Br},
            {OpCodes.Brtrue, _ => BrCond(_, true)},
            {OpCodes.Brtrue_S, _ => BrCond(_, true)},
            {OpCodes.Brfalse, _ => BrCond(_, false)},
            {OpCodes.Brfalse_S, _ => BrCond(_, false)},
            {OpCodes.Beq, _ => {Ceq(_);BrCond(_, true);}},
            {OpCodes.Beq_S, _ => {Ceq(_);BrCond(_, true);}},
            {OpCodes.Bne_Un, _ => {Ceq(_);BrCond(_, false);}},
            {OpCodes.Bne_Un_S, _ => {Ceq(_);BrCond(_, false);}},
            {OpCodes.Ble, _ => {Cle(_);BrCond(_, true);}},
            {OpCodes.Ble_S, _ => {Cle(_);BrCond(_, true);}},
            {OpCodes.Ble_Un, _ => {CleUn(_);BrCond(_, true);}},
            {OpCodes.Ble_Un_S, _ => {CleUn(_);BrCond(_, true);}},
            {OpCodes.Blt, _ => {Clt(_);BrCond(_, true);}},
            {OpCodes.Blt_S, _ => {Clt(_);BrCond(_, true);}},
            {OpCodes.Blt_Un, _ => {CltUn(_);BrCond(_, true);}},
            {OpCodes.Blt_Un_S, _ => {CltUn(_);BrCond(_, true);}},
            {OpCodes.Bge, _ => {Cge(_);BrCond(_, true);}},
            {OpCodes.Bge_S, _ => {Cge(_);BrCond(_, true);}},
            {OpCodes.Bge_Un, _ => {CgeUn(_);BrCond(_, true);}},
            {OpCodes.Bge_Un_S, _ => {CgeUn(_);BrCond(_, true);}},
            {OpCodes.Bgt, _ => {Cgt(_);BrCond(_, true);}},
            {OpCodes.Bgt_S, _ => {Cgt(_);BrCond(_, true);}},
            {OpCodes.Bgt_Un, _ => {CgtUn(_);BrCond(_, true);}},
            {OpCodes.Bgt_Un_S, _ => {CgtUn(_);BrCond(_, true);}},
            {OpCodes.Tailcall, _ => {}},
            {OpCodes.Call, Call},
            {OpCodes.Ldfld, Ldfld},
            {OpCodes.Stfld, _ => {var value = _.Stack.Pop(); var ptr = _.Stack.Pop(); _.Builder.Store(value, ElementPointer(_, ptr, FieldIndex((FieldInfo)_.Argument)));}},
            {OpCodes.Newobj, _ => { NewobjPreConstructor(_); Call(_); }},
            {OpCodes.Initobj, _ => _.Builder.Store(ConvertType(_.Module, (System.Type)_.Argument).Zero, _.Stack.Pop())},
        };

        private static void Ldfld(EmitFuncObj _)
        {
            var obj = _.Stack.Pop();
            if (obj.Type is PointerType)
                _.Stack.Push(_.Builder.Load(ElementPointer(_, obj, FieldIndex((FieldInfo)_.Argument))));
            else
                _.Stack.Push(_.Builder.Extract(obj, FieldIndex((FieldInfo)_.Argument)));
        }

        private static Value ElementPointer(EmitFuncObj _, Value pointer, int index)
        {
            var zeroConstant = IntegerType.GetInt32(_.Context).Constant(0, false);
            var indexConstant = IntegerType.GetInt32(_.Context).Constant((ulong)index, false);
            return _.Builder.Element(pointer, new Value[] { zeroConstant, indexConstant }); // guarenteed to be pointer type
        }

        private static IEnumerable<FieldInfo> AllFields(System.Type type)
        {
            return type.GetRuntimeFields().Where(f => f.IsStatic == false);
        }

        private static int FieldIndex(FieldInfo field)
        {
            return AllFields(field.DeclaringType).IndexOf(f => f == field);
        }

        private static void NewobjPreConstructor(EmitFuncObj _)
        {
            var stackalloca = _.Builder.StackAlloc(ConvertType(_.Module, ((ConstructorInfo)_.Argument).DeclaringType));

            var altstack = new Stack<Value>();
            var paramLength = ((MethodBase)_.Argument).GetParameters().Length;

            for (var i = 0; i < paramLength; i++)
                altstack.Push(_.Stack.Pop());

            _.Stack.Push(stackalloca);

            for (var i = 0; i < paramLength; i++)
                _.Stack.Push(altstack.Pop());
        }

        private static void Call(EmitFuncObj _)
        {
            var method = (MethodBase)_.Argument;
            var count = method.GetParameters().Length;
            if (method is ConstructorInfo || method.IsStatic == false)
                count++;
            var args = Enumerable.Range(0, count).Select(x => _.Stack.Pop()).Reverse().ToArray();
            var result = _.Builder.Call(EmitFunction(_.Module, method), args);
            if (result.Type.StructuralEquals(Type.GetVoid(_.Context)) == false)
                _.Stack.Push(result);
            else if (method is ConstructorInfo)
                _.Stack.Push(_.Builder.Load(args[0]));
        }

        private static void FlipTopTwoStack(EmitFuncObj _)
        {
            var top = _.Stack.Pop();
            var bottom = _.Stack.Pop();
            _.Stack.Push(top);
            _.Stack.Push(bottom);
        }

        private static void Ceq(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.Equal, PopNoBool(_), PopNoBool(_)));
        }

        private static void Cgt(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.SignedGreater, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static void CgtUn(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.UnsignedGreater, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static void Cge(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.SignedGreaterEqual, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static void CgeUn(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.UnsignedGreaterEqual, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static void Clt(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.SignedLess, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static void CltUn(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.UnsignedLess, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static void Cle(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.SignedLessEqual, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static void CleUn(EmitFuncObj _)
        {
            FlipTopTwoStack(_);
            _.Stack.Push(_.Builder.Compare(IntegerComparison.UnsignedLessEqual, _.Stack.Pop(), _.Stack.Pop()));
        }

        private static readonly OpCode[] UnsupportedInstructionsArr = typeof(OpCodes).GetFields().Select(f => (OpCode)f.GetValue(null)).Where(op => !EmitFunctions.ContainsKey(op)).ToArray();
        public static OpCode[] UnsupportedInstructions
        {
            get { return UnsupportedInstructionsArr; }
        }

        private static Value PopNoBool(EmitFuncObj _)
        {
            var popped = _.Stack.Pop();
            if (popped.Type.StructuralEquals(IntegerType.Get(_.Context, 1)))
                popped = _.Builder.ZeroExtend(popped, IntegerType.GetInt32(_.Context));
            return popped;
        }

        private static void Nop(EmitFuncObj _)
        {
            var block = (Block)_.Argument;
            if (block == null)
                return;
            if (_.Builder != null)
                _.Builder.GoTo(block);
            _.Builder = new InstructionBuilder(_.Context, block);
        }

        private static void Br(EmitFuncObj _)
        {
            _.Builder.GoTo((Block)_.Argument);
            _.Builder = null;
        }

        private static void BrCond(EmitFuncObj _, bool isTrue)
        {
            var tuple = (Tuple<Block, Block>)_.Argument;
            var cont = tuple.Item1;
            var target = tuple.Item2;
            _.Builder.If(_.Stack.Pop(), isTrue ? target : cont, isTrue ? cont : target);
            _.Builder = new InstructionBuilder(_.Context, cont);
        }

        private static void LdVar(EmitFuncObj _, Value[] values, int index)
        {
            _.Stack.Push(_.Builder.Load(values[index]));
        }

        private static void LdVarA(EmitFuncObj _, Value[] values, int index)
        {
            _.Stack.Push(values[index]);
        }

        private static void StVar(EmitFuncObj _, Value[] values, int index)
        {
            _.Builder.Store(_.Stack.Pop(), values[index]);
        }

        private static void StElem(EmitFuncObj _)
        {
            var value = _.Stack.Pop();
            var index = _.Stack.Pop();
            var array = _.Stack.Pop();
            var idx = _.Builder.Element(array, new[] { index });
            _.Builder.Store(value, idx);
        }

        private static void LdElem(EmitFuncObj _)
        {
            var index = _.Stack.Pop();
            var array = _.Stack.Pop();
            var idx = _.Builder.Element(array, new[] { index });
            var load = _.Builder.Load(idx);
            _.Stack.Push(load);
        }

        private static void LdElemA(EmitFuncObj _)
        {
            var index = _.Stack.Pop();
            var array = _.Stack.Pop();
            var idx = _.Builder.Element(array, new[] { index });
            _.Stack.Push(idx);
        }

        private static void ConvertNum(EmitFuncObj _, Type target, bool integerSignedness)
        {
            var value = _.Stack.Pop();
            var valueType = value.Type;
            if (valueType is IntegerType && target is FloatType)
            {
                if (integerSignedness)
                    value = _.Builder.SignedIntToFloat(value, target);
                else
                    value = _.Builder.UnsignedIntToFloat(value, target);
            }
            else if (valueType is FloatType && target is IntegerType)
            {
                if (integerSignedness)
                    value = _.Builder.FloatToSignedInt(value, target);
                else
                    value = _.Builder.FloatToUnsignedInt(value, target);
            }
            else if (valueType is IntegerType && target is IntegerType)
            {
                var valueInt = (IntegerType) valueType;
                var targetInt = (IntegerType) target;
                if (valueInt.Width > targetInt.Width)
                    value = _.Builder.Trunc(value, target);
                else if (integerSignedness)
                    value = _.Builder.SignExtend(value, target);
                else
                    value = _.Builder.ZeroExtend(value, target);
            }
            else
            {
                throw new CudaSharpException(string.Format("Cannot convert {0} to {1}", valueType, target));
            }
            _.Stack.Push(value);
        }
    }
}