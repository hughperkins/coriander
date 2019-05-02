using System;
using System.Reflection;
using System.Runtime.InteropServices;
using LLVM;
using CC = System.Runtime.InteropServices.CallingConvention;
using Module = LLVM.Module;

namespace CudaSharp
{
    static class PInvokeHelper
    {
        private static bool _initialized;

        public static byte[] EmitInMemory(Module module, string targetCpu)
        {
            if (!_initialized)
            {
                _initialized = true;
                PInvoke.LLVMInitializeNVPTXTarget();
                PInvoke.LLVMInitializeNVPTXTargetMC();
                PInvoke.LLVMInitializeNVPTXTargetInfo();
                PInvoke.LLVMInitializeNVPTXAsmPrinter();
            }
            var triple = Marshal.PtrToStringAnsi(PInvoke.LLVMGetTarget(module));
            IntPtr errorMessage;
            IntPtr target;
            if (PInvoke.LLVMGetTargetFromTriple(triple, out target, out errorMessage))
                throw new CudaSharpException(Marshal.PtrToStringAnsi(errorMessage));
            var targetMachine = PInvoke.LLVMCreateTargetMachine(target, triple, targetCpu, "",
                PInvoke.LlvmCodeGenOptLevel.LlvmCodeGenLevelDefault, PInvoke.LlvmRelocMode.LlvmRelocDefault,
                PInvoke.LlvmCodeModel.LlvmCodeModelDefault);

            IntPtr memoryBuffer;
            PInvoke.LLVMTargetMachineEmitToMemoryBuffer(targetMachine, module, PInvoke.LlvmCodeGenFileType.LlvmAssemblyFile, out errorMessage, out memoryBuffer);

            if (errorMessage != IntPtr.Zero)
            {
                var errorMessageStr = Marshal.PtrToStringAnsi(errorMessage);
                if (string.IsNullOrWhiteSpace(errorMessageStr) == false)
                    throw new CudaSharpException(errorMessageStr);
            }
            var bufferStart = PInvoke.LLVMGetBufferStart(memoryBuffer);
            var bufferLength = PInvoke.LLVMGetBufferSize(memoryBuffer);
            var buffer = new byte[bufferLength.ToInt32()];
            Marshal.Copy(bufferStart, buffer, 0, buffer.Length);
            PInvoke.LLVMDisposeMemoryBuffer(memoryBuffer);
            return buffer;
        }
    }

    static class PInvoke
    {
        const string LlvmDll = "LLVM-3.3";

        public static void SetTarget(this Module module, string triple)
        {
            LLVMSetTarget(module, triple);
        }

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern void LLVMSetTarget(IntPtr module, string triple);

        public static void SetDataLayout(this Module module, string triple)
        {
            LLVMSetDataLayout(module, triple);
        }

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern void LLVMSetDataLayout(IntPtr module, string triple);

        public static void AddNamedMetadataOperand(this Module module, string name, IntPtr value)
        {
            LLVMAddNamedMetadataOperand(module, name, value);
        }

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern void LLVMAddNamedMetadataOperand(IntPtr module, string name, IntPtr value);

        // ReSharper disable once InconsistentNaming
        public static IntPtr MetadataNodeInContext(this Context context, IntPtr[] values)
        {
            return LLVMMDNodeInContext(context, values, (uint)values.Length);
        }

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMMDNodeInContext(IntPtr context, IntPtr[] values, uint count);

        // ReSharper disable once InconsistentNaming
        public static IntPtr LLVMMDStringInContext(IntPtr context, string str)
        {
            return LLVMMDStringInContext(context, str, (uint)str.Length);
        }

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMMDStringInContext(IntPtr context, string str, uint strLen);

        public enum LlvmCodeGenOptLevel
        {
            LlvmCodeGenLevelNone,
            LlvmCodeGenLevelLess,
            LlvmCodeGenLevelDefault,
            LlvmCodeGenLevelAggressive
        }

        public enum LlvmRelocMode
        {
            LlvmRelocDefault,
            LlvmRelocStatic,
            LlvmRelocPic,
            LlvmRelocDynamicNoPic
        }

        public enum LlvmCodeModel
        {
            LlvmCodeModelDefault,
            LlvmCodeModelJitDefault,
            LlvmCodeModelSmall,
            LlvmCodeModelKernel,
            LlvmCodeModelMedium,
            LlvmCodeModelLarge
        }

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern IntPtr LLVMCreateTargetMachine(IntPtr target, string triple, string cpu, string features, LlvmCodeGenOptLevel level, LlvmRelocMode reloc, LlvmCodeModel codeModel);

        public enum LlvmCodeGenFileType
        {
            LlvmAssemblyFile,
            LlvmObjectFile
        };

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern void LLVMInitializeNVPTXAsmPrinter();

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern void LLVMInitializeNVPTXTarget();

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern void LLVMInitializeNVPTXTargetMC();

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern void LLVMInitializeNVPTXTargetInfo();

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern IntPtr LLVMGetTarget(IntPtr module);

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern bool LLVMGetTargetFromTriple(string triple, out IntPtr target, out IntPtr errorMessage);

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern bool LLVMTargetMachineEmitToMemoryBuffer(IntPtr targetMachine, IntPtr module, LlvmCodeGenFileType codegen, out IntPtr errorMessage, out IntPtr memoryBuffer);

        //[DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        //public static extern bool LLVMTargetMachineEmitToFile(IntPtr targetMachine, IntPtr module, string filename, LlvmCodeGenFileType codegen, out IntPtr errorMessage);

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern IntPtr LLVMGetBufferStart(IntPtr memoryBuffer);

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern IntPtr LLVMGetBufferSize(IntPtr memoryBuffer);

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern void LLVMDisposeMemoryBuffer(IntPtr memoryBuffer);

        // internal StructType(IntPtr typeref) : ... { }
        private static readonly ConstructorInfo StructTypeConstructor = typeof(StructType).GetConstructor(BindingFlags.NonPublic | BindingFlags.Instance, null, new[] { typeof(IntPtr) }, null);
        public static StructType GetTypeByName(this Module module, string name)
        {
            var intPtr = LLVMGetTypeByName(module, name);
            if (intPtr == IntPtr.Zero)
                return null;
            return (StructType)StructTypeConstructor.Invoke(new object[] { intPtr });
        }

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMGetTypeByName(IntPtr module, string name);

        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        public static extern IntPtr LLVMPrintModuleToString(IntPtr module);

        // internal Value(IntPtr typeref) : ... { }
        private static readonly ConstructorInfo ValueConstructor = typeof(Value).GetConstructor(BindingFlags.NonPublic | BindingFlags.Instance, null, new[] { typeof(IntPtr) }, null);
        public static Value FloatToUnsignedInt(this InstructionBuilder builder, Value value, LLVM.Type type, string name = "")
        {
            return (Value)ValueConstructor.Invoke(new object[] { LLVMBuildFPToUI(builder, value, type, name) });
        }
        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMBuildFPToUI(IntPtr builder, IntPtr val, IntPtr destTy, string name);

        public static Value FloatToSignedInt(this InstructionBuilder builder, Value value, LLVM.Type type, string name = "")
        {
            return (Value)ValueConstructor.Invoke(new object[] { LLVMBuildFPToSI(builder, value, type, name) });
        }
        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMBuildFPToSI(IntPtr builder, IntPtr val, IntPtr destTy, string name);

        public static Value UnsignedIntToFloat(this InstructionBuilder builder, Value value, LLVM.Type type, string name = "")
        {
            return (Value)ValueConstructor.Invoke(new object[] { LLVMBuildUIToFP(builder, value, type, name) });
        }
        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMBuildUIToFP(IntPtr builder, IntPtr val, IntPtr destTy, string name);

        public static Value SignedIntToFloat(this InstructionBuilder builder, Value value, LLVM.Type type, string name = "")
        {
            return (Value)ValueConstructor.Invoke(new object[] { LLVMBuildSIToFP(builder, value, type, name) });
        }
        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMBuildSIToFP(IntPtr builder, IntPtr val, IntPtr destTy, string name);

        public static Value FloatTrunc(this InstructionBuilder builder, Value value, LLVM.Type type, string name = "")
        {
            return (Value)ValueConstructor.Invoke(new object[] { LLVMBuildFPTrunc(builder, value, type, name) });
        }
        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMBuildFPTrunc(IntPtr builder, IntPtr val, IntPtr destTy, string name);

        public static Value FloatExtend(this InstructionBuilder builder, Value value, LLVM.Type type, string name = "")
        {
            return (Value)ValueConstructor.Invoke(new object[] { LLVMBuildFPExt(builder, value, type, name) });
        }
        [DllImport(LlvmDll, CallingConvention = CC.Cdecl)]
        private static extern IntPtr LLVMBuildFPExt(IntPtr builder, IntPtr val, IntPtr destTy, string name);
    }
}
