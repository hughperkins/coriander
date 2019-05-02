using System;

namespace CudaSharp
{
    /// <summary>
    /// Various GPU intrinsics
    /// </summary>
    public static class Gpu
    {
        /// <summary>
        /// Apply this attribute to a method if you want it to be compiled to a GPU intrinsic (use the LLVM intrinsic name, not the traditional C library one)
        /// </summary>
        [AttributeUsage(AttributeTargets.Method)]
        public class BuiltinAttribute : Attribute
        {
            private readonly string _intrinsic;

            /// <summary>
            /// Applies the intrinsic instead of calling the method
            /// </summary>
            /// <param name="intrinsic">The intrinsic to call</param>
            public BuiltinAttribute(string intrinsic)
            {
                _intrinsic = intrinsic;
            }

            /// <summary>
            /// Gets the intrinsic function name
            /// </summary>
            public string Intrinsic
            {
                get { return _intrinsic; }
            }
        }

        private static Exception Exception { get { return new Exception("Cannot use methods from the Gpu class on the CPU"); } }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The thread index X (threadIdx.x in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.tid.x")]
        public static int ThreadX() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The thread index Y (threadIdx.y in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.tid.y")]
        public static int ThreadY() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The thread index Z (threadIdx.z in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.tid.z")]
        public static int ThreadZ() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The block index X (blockIdx.x in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.ctaid.x")]
        public static int BlockX() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The block index Y (blockIdx.y in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.ctaid.y")]
        public static int BlockY() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The block index Z (blockIdx.z in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.ctaid.z")]
        public static int BlockZ() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The thread size X (threadDim.x in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.ntid.x")]
        public static int ThreadDimX() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The thread size Y (threadDim.y in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.ntid.y")]
        public static int ThreadDimY() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The thread size Z (threadDim.z in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.ntid.z")]
        public static int ThreadDimZ() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The block size X (blockDim.x in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.nctaid.x")]
        public static int BlockDimX() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The block size Y (blockDim.y in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.nctaid.y")]
        public static int BlockDimY() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The block size Z (blockDim.z in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.nctaid.z")]
        public static int BlockDimZ() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU
        /// </summary>
        /// <returns>The warp size (does not exist in cuda C)</returns>
        [Builtin("llvm.nvvm.read.ptx.sreg.warpsize")]
        public static int WarpSize() { throw Exception; }

        /// <summary>
        /// Do not call this method from the CPU.
        /// This method is the equivalent of cuda C's __syncthreads() function
        /// </summary>
        [Builtin("llvm.nvvm.barrier0")]
        public static void Barrier() { throw Exception; }
    }
}