# Cmake usage, in your own projects

Coriander provides macros `cocl_add_executable` and `cocl_add_library`, for usage in your own cmake projects

## Enable Coriander

Simply add:

```
include(/usr/local/share/cocl/cocl.cmake)
```
.... near the top of your cmake file

## Creating targets

### Executable

```
cocl_add_executable(foo foo.cu)
```

### Library

```
cocl_add_library(mylibrary foo.cu anotherfile.cu somecpp.cpp)
```

## Target configuration

Standard target configuration is available:

### Include directories

You can use `target_include_directories` to add include directories to a target:
```
cocl_add_executable(foo foo.cu)
target_include_directories(foo PRIVATE include)
```

### Link libraries

You can use `target_link_libraries` on targets, as normal:

```
cocl_add_executable(foo foo.cu)
target_link_libraries(foo somelibrary)
```

### Compile flags

You can use `set_target_properties(... PROPERTIES COMPILE_FLAGS ...)` to set defines and so on:
```
cocl_add_executable(foo foo.cu)
set_target_properties(foo PROPERTIES COMPILE_FLAGS -DDEFINE1 -DANOTHER_DEFINE)
```

## Linking with Coriander

You'll need to add the following libraries to your targets:
- `cocl`
- `clblast`
- `clew`
- `easycl`

```
cocl_add_executable(foo foo.cu)
target_link_libraries(foo cocl clblast clew easycl)
```

If you want, you can use the variable `Coriander_LIBRARIES`:
```
target_link_libraries(foo ${Coriander_LIBRARIES})
```

## Example

See [test/cmake](../test/cmake) for an example
