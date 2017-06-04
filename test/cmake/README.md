# Testing cmake usage of Coriander

eg, this tests, you make your own project, and want to use Coriander in it. How to do that? This test shows how :-)

To build/run/test, first install coriander, then, from this folder, do:

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
