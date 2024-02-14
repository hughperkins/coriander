# Plugins

Plugins mean that you can create your own project that extends Coriander in some way.

You can choose to make your plugin depend only on core Coriander, or use one or more existing plugins within your own plugin.

## Example plugin

As an example plugin you can look at: [Coriander-dnn](https://github.com/hughperkins/coriander-dnn).

To install this, first create the following directories, and ensure they are writable:
```
sudo mkdir /usr/local/include/coriander_plugins
sudo mkdir /usr/local/lib/coriander_plugins
sudo chmod uog+w /usr/local/include/coriander_plugins
sudo chmod uog+w /usr/local/lib/coriander_plugins
```

Then, simply run:

```
cocl_plugins.py install --repo-url https://github.com/hughperkins/coriander-dnn
```

## How plugins work

### Plugin build and installation

- [cocl_plugins.py](https://github.com/hughperkins/coriander/blob/c78b3061e9e8c03069076e06e16f3983addfcdbd/bin/cocl_plugins.py) will clone the given repository
- it will make the following assumptions:
  - the repository contains a `CMakeLists.txt`, at the root of the repository
  - the `CMakeLists.txt` can be built and installed using the following commands:
```
mkdir build
cd build
cmake .. -DDCORIANDER_DIR=[coriander directory, eg /usr/local] -DCMAKE_INSTALL_PREFIX=[coriander directory, eg /usr/local]
make -j 8
make install
```
- therefore it will run these commands to build and install the repository, [cocl_plugins.py#L15-L35](https://github.com/hughperkins/coriander/blob/c78b3061e9e8c03069076e06e16f3983addfcdbd/bin/cocl_plugins.py#L15-L35)

### Plugin registration

The plugin can register itself with Coriander in the following ways:

| Register what? | How? |
|---------|---------|
| C/C++ header files, for compiling using `cocl_py` | Install into `${CORIANDER_DIR}/include/coriander_plugins/{plugin name}/ |
| Dynamic/static library, for linking using `cocl_py` | Install into `${CORIANDER_DIR}/lib/coriander_plugins/ |
| CMake exports | Install into ${CORIANDER_DIR}/lib/coriander_plugins/ |
| ... | We can extend this over time |

You can see the code to add headerfiles to the `cocl_py` compilation process at [cocl.py#L255-L260](https://github.com/hughperkins/coriander/blob/c78b3061e9e8c03069076e06e16f3983addfcdbd/bin/cocl.py#L255-L260) , and the code to bring plugin libraries into the `cocl_py` compilation process
is at [cocl.py#L264-L271](https://github.com/hughperkins/coriander/blob/c78b3061e9e8c03069076e06e16f3983addfcdbd/bin/cocl.py#L264-L271)

## Key variables and files

### `cocl_py`

`cocl_py` is a wrapper, built from [bin/cocl.sh.in](bin/cocl.sh.in) or [bin/cocl.cmd.in](bin/cocl.cmd.in), depending on whether
one is running on Windows or Linux.  It has the following variables 'baked in', at build/installation time:

- `CLANG_HOME`: path to llvm 4.0
- `COCL_PATH`: path to `cocl.py`
- `COCL_BIN`: path to `${CORIANDER_DIR}/bin`
- `COCL_LIB`: path to `${CORIANDER_DIR}/lib`
- `COCL_INCLUDE`: path to `${CORIANDER_DIR}/include`
- `PYTHON27_PATH`: path to python2 executable

These variables are sufficient for `cocl_py` to locate the various `Coriander` resources, including plugins.

### cmake includes and exports

__`share/cocl/cocl_vars.cmake`__

Bakes in key variables, at Coriander build/install time, similar to `cocl_py` above, but targeted at cmake usage. It defines the following
variables:

- `CLANG_HOME`
- `COCL_PATH`
- `COCL_BIN`
- `COCL_LIB`
- `COCL_INCLUDE`
- `COCL_CMAKE`: path to ${CORIANDER_DIR}/share/cocl

__cmake targets__

- `lib/cocl/cocl-targets.cmake`: provides cmake targets for: `cocl`, `clew`, `easycl`
- `lib/cocl/coriander_plugins/[plugin name]-targets.cmake`: cmake targets for plugin `[plugin name]`

### `activate`

Bakes in the following variable changes:

- add `${CORIANDER_DIR}/bin` to `PATH`
- set `COCL_CMAKE` to `${CORIANDER_DIR}/share/cocl`

## Future evolution

We can extend this registration process over time, to handle other use-cases. For example it might be nice to factorize the
following components of Coriander into plugins:

- `__shfl`
- kernel-side maths functions, such as `sin`, `log`, etc

Of course, you are free to add additional registration mechanisms, that will work well with your own plugin.
