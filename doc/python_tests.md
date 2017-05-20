# `py.test` tests

The python tests currently are not maintained, so just ignore these for now please :-)

I used to use these, which run using `py.test`, and `pyopencl`. They were a fairly easy way to get started, and
they run quite quickly. I might re-enable them in the future, but currently I'm using the end-to-end tests, and
the `gtest` tests at the moment, and not really maintaining these. So, I've moved this doc out of the main
README, to keep it cleanish.

## Pre-requisites

```
pip install -r test/requirements.txt
```

## Procedure

```
OFFSET_32BIT=1 \
COCL_OPTIONS='--devicell-opt inline --devicell-opt mem2reg --devicell-opt instcombine --devicell-opt O2' \
py.test -v
```

- python tests are at [test](test)

You can modify the options in `COCL_OPTIONS`.  There are passed to the `cocl` command, see section #Options above.

If you set `OFFSET_32BIT` to off in your cmake options, you should remove the `OFFSET_32BIT=1` optio nwhen running py.test
