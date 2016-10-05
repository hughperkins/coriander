# building tensorflow notes

This is *very* draft, work in progress :-P

First step is to compile one single tensorflow cuda file, eg cwise_op_gpu_add.cu.cc, into llvm IR.  ~~This doc is working on this bit for now.~~  This bit is done, in draft.  I had to hack in
a `using namespace std;`, and change gpu architecture to sm30, and then it worked ok.

Run:

[tensorflow/build_cwise_add.sh](https://github.com/hughperkins/cuda-ir-to-opencl/tree/master/tensorflow/build_cwise_add.sh)

## Compiling the output, progress

Currently:
```
$ py.test -sv -k cwise 2>&1 | grep '^E ' | wc -l
1146
```

(out of total ~12,000 lines, so about ~90% is compiling ok, and ~10% needs fixing)
