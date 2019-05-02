using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;

namespace CudaSharp
{
    static class Disasm
    {
        static readonly Dictionary<short, OpCode> OpcodeLookupTable = typeof(OpCodes).GetFields().Select(f => (OpCode)f.GetValue(null)).ToDictionary(op => op.Value);

        public static IEnumerable<OpCodeInstruction> Disassemble(this MethodBase method)
        {
            var module = method.Module;
            var methodBody = method.GetMethodBody();
            if (methodBody == null)
                throw new CudaSharpException("Could not get method body of " + method.Name);
            var stream = new BinaryReader(new MemoryStream(methodBody.GetILAsByteArray()));
            while (stream.BaseStream.Position < stream.BaseStream.Length)
            {
                var instructionStart = stream.BaseStream.Position;
                var byteOpcode = stream.ReadByte();
                var shortOpcode = byteOpcode == 0xfe
                    ? BitConverter.ToInt16(BitConverter.IsLittleEndian ? new[] { stream.ReadByte(), byteOpcode } : new[] { byteOpcode, stream.ReadByte() }, 0)
                    : byteOpcode;
                var opcode = OpcodeLookupTable[shortOpcode];
                object parameter;
                switch (opcode.OperandType)
                {
                    case OperandType.InlineBrTarget:
                        parameter = stream.ReadInt32();
                        break;
                    case OperandType.InlineField:
                        parameter = module.ResolveField(stream.ReadInt32());
                        break;
                    case OperandType.InlineI:
                        parameter = stream.ReadInt32();
                        break;
                    case OperandType.InlineI8:
                        parameter = stream.ReadInt64();
                        break;
                    case OperandType.InlineMethod:
                        parameter = module.ResolveMethod(stream.ReadInt32());
                        break;
                    case OperandType.InlineNone:
                        parameter = null;
                        break;
                    case OperandType.InlineR:
                        parameter = stream.ReadDouble();
                        break;
                    case OperandType.InlineSig:
                        parameter = module.ResolveSignature(stream.ReadInt32());
                        break;
                    case OperandType.InlineString:
                        parameter = module.ResolveString(stream.ReadInt32());
                        break;
                    case OperandType.InlineSwitch:
                        parameter = stream.ReadInt32();
                        break;
                    case OperandType.InlineTok:
                        parameter = module.ResolveMember(stream.ReadInt32());
                        break;
                    case OperandType.InlineType:
                        parameter = module.ResolveType(stream.ReadInt32());
                        break;
                    case OperandType.InlineVar:
                        parameter = stream.ReadInt16();
                        break;
                    case OperandType.ShortInlineBrTarget:
                        parameter = stream.ReadSByte();
                        break;
                    case OperandType.ShortInlineI:
                        parameter = stream.ReadSByte();
                        break;
                    case OperandType.ShortInlineR:
                        parameter = stream.ReadSingle();
                        break;
                    case OperandType.ShortInlineVar:
                        parameter = stream.ReadByte();
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
                yield return new OpCodeInstruction(instructionStart, opcode, parameter);
            }
        }
    }

    struct OpCodeInstruction
    {
        private readonly long _instructionStart;
        private readonly OpCode _opcode;
        private readonly object _parameter;

        public OpCodeInstruction(long instructionStart, OpCode opcode, object parameter)
        {
            _instructionStart = instructionStart;
            _opcode = opcode;
            _parameter = parameter;
        }

        public long InstructionStart
        {
            get { return _instructionStart; }
        }

        public OpCode Opcode
        {
            get { return _opcode; }
        }

        public object Parameter
        {
            get { return _parameter; }
        }

        public override string ToString()
        {
            return string.Format("{0}: {1} - {2}", _instructionStart, _opcode, _parameter);
        }
    }
}