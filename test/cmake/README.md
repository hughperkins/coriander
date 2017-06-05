# Cmake usage of Coriander

## Example

This folder contains an example of a `cmake` project, containing various `cocl_add_executable` and `cocl_add_libraries` targets.

To build/run/test:
- install coriander
- from this folder, run:

```
mkdir build
cmake .. -DCMAKE_BUILD_TYPE=Debug
make -j 8
```

Thats it :-)

You can run stuff if you want:

```
./cuda_sample
./many_cpp
```

## Doc

More doc on using Coriander in your `cmake` project at [cmake_usage.md](../../doc/cmake_usage.md)
