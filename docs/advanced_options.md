# Advanced options

| Option | Description |
|--------|-------------|
| --devicell-opt [option] | Passed to `opt-4.0`, http://llvm.org/docs/Passes.html, affects OpenCL generation |

## `--devicell-opt [option]`

These are passed through to `opt-4.0`, http://llvm.org/docs/Passes.html.  Generally speaking, you dont need to modify these, nor should you. Just use the 
default options, no need to think about it.

The standard options used are:

- `--devicell-opt inline --devicell-opt mem2reg --devicell-opt instcombine --devicell-opt O2`

`opt-4.0` fits in as follows:
- `clang-4.0 -x cuda --device-only` converts the incoming `.cu` file to device-side LLVM IR
- `opt-4.0` optimizes the IR.  `-devicell-opt` options are passed to `opt-4.0` at this point
- the resulting device-side IR is stored into the executable, for use at runtime

You dont really want to mess with these options much/at all because:
- the main impact is how well the OpenCL generation works: too much optimization, or too little, and the OpenCL generation step will have issues
- really, the optimization should be applied after OpenCL generation, by the driver, at runtime
- I spent ages trying different options, and came up with these, that work ok-ish :-)
