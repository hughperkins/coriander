using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CudaSharp
{
    static class Extensions
    {
        public static int IndexOf<T>(this IEnumerable<T> enumerable, Func<T, bool> selector)
        {
            return enumerable.Select((e, i) => new {e, i}).First(pair => selector(pair.e)).i;
        }

        public static string StripNameToValidPtx(this string name)
        {
            var builder = new StringBuilder(name.Length);
            foreach (var c in name.Where(c => char.IsLetterOrDigit(c) || c == '_'))
                builder.Append(c);
            return builder.ToString();
        }
    }
}
