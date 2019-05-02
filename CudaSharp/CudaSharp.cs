using System;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Text;
using LLVM;

namespace CudaSharp
{
    /// <summary>
    /// Generic exception from CudaSharp
    /// </summary>
    public class CudaSharpException : Exception
    {
        /// <summary>
        /// Creates a CudaSharp exception
        /// </summary>
        /// <param name="message">Message</param>
        public CudaSharpException(string message) : base(message)
        {
        }
    }

    /// <summary>
    /// Main CudaSharp class
    /// </summary>
    public static class CudaSharp
    {
        static CudaSharp()
        {
            var extractTo = Path.GetFullPath("LLVM-3.3");
            if (File.Exists(extractTo))
                return;
            var file = File.Open(extractTo, FileMode.OpenOrCreate);
            var llvm34 = Assembly.GetExecutingAssembly().GetManifestResourceStream("CudaSharp.LLVM-3.4.dll");
            if (llvm34 == null)
                throw new CudaSharpException("Could not extract LLVM-3.4.dll");
            llvm34.CopyTo(file);
            file.Close();
        }

        /// <summary>
        /// List of CIL instructions that are unsupported by the library
        /// </summary>
        public static OpCode[] UnsupportedInstructions
        {
            get { return Translator.UnsupportedInstructions; }
        }

        /// <summary>
        /// Translates all supplied methods into a single PTX object using the sm_20 target.
        /// Note that method names may not be accurately translated (kernel name is not MethodInfo.Name), for example anonymous method names.
        /// Use an overload of this function to get the real name.
        /// </summary>
        /// <param name="methods">Methods to translate</param>
        /// <returns>PTX object to be loaded into the GPU or written to a .ptx file on disk</returns>
        public static byte[] Translate(params MethodInfo[] methods)
        {
            string[] dummy;
            return Translate(out dummy, methods);
        }

        /// <summary>
        /// Translates all supplied methods into a single PTX object using the sm_20 target, giving back the kernel names
        /// </summary>
        /// <param name="kernelNames">Resulting kernel names in the ptx object</param>
        /// <param name="methods">Methods to translate</param>
        /// <returns>PTX object to be loaded into the GPU or written to a .ptx file on disk</returns>
        public static byte[] Translate(out string[] kernelNames, params MethodInfo[] methods)
        {
            return Translate(out kernelNames, "sm_20", methods);
        }

        /// <summary>
        /// Translates all supplied methods into a single PTX object using the supplied target, giving back the kernel names
        /// </summary>
        /// <param name="kernelNames">Resulting kernel names in the ptx object</param>
        /// <param name="targetCpu">Target, usually in the form sm_##</param>
        /// <param name="methods">Methods to translate</param>
        /// <returns>PTX object to be loaded into the GPU or written to a .ptx file on disk</returns>
        public static byte[] Translate(out string[] kernelNames, string targetCpu, params MethodInfo[] methods)
        {
            var module = Translator.Translate(Context.Global, methods);
            kernelNames = methods.Select(m => m.Name.StripNameToValidPtx()).ToArray();
            var ptx = PInvokeHelper.EmitInMemory(module, targetCpu);
            return ptx;
        }

        /// <summary>
        /// Translates all supplied methods into a single PTX object using the supplied target, giving back the kernel names and intermediate representations (for debugging)
        /// </summary>
        /// <param name="kernelNames">Resulting kernel names in the ptx object</param>
        /// <param name="llvmIr">LLVM IR of the module</param>
        /// <param name="ptxIr">PTX assembly of the module</param>
        /// <param name="targetCpu">Target, usually in the form sm_##</param>
        /// <param name="methods">Methods to translate</param>
        /// <returns>PTX object to be loaded into the GPU or written to a .ptx file on disk</returns>
        public static byte[] Translate(out string[] kernelNames, out string llvmIr, out string ptxIr, string targetCpu, params MethodInfo[] methods)
        {
            var module = Translator.Translate(Context.Global, methods);
            kernelNames = methods.Select(m => m.Name.StripNameToValidPtx()).ToArray();
            var ptx = PInvokeHelper.EmitInMemory(module, targetCpu);
            llvmIr = Marshal.PtrToStringAnsi(PInvoke.LLVMPrintModuleToString(module));
            ptxIr = Encoding.UTF8.GetString(ptx);
            return ptx;
        }
    }
}