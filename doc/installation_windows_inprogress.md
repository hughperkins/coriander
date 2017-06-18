# Installation on Windows

Work in progress. For now, it's just notes of some initial steps.

## Pre-requisites

- tested on the following system:
  - Windows 2012 R2 64-bit
- disk space:
  - Visual Studio 2015 Express: ~10-15GB
  - LLVM debug build: ~15GB (~6GB if you store it on a compressed volume)

## Procedure

1. I used an aws Windows 2012 R2 instance for this, on a g2.2xlarge.  Other things I tried, and why I abandoned them:
- 32-bit microsft modern.ie vm => 32-bit doesnt seem supported eg by CLBlast, and other libraries
- Windows 2016 => Windows 2016 doesnt seem to have an obvious NVIDIA K520 GPU Driver available
2. Install GPU Driver and GPU-specific OpenCL headers, libraries
3. Installed "Visual Studio Express 2015 for Windows Desktop".  Design decision: why not eg the command tools?
- Visual Studio 2017 command tools => got an error about '-ologo', when compiling llvm.  This might not be insurmountable in fact, since we get this with msvc 2015 too anyway...
- Visual Studio 2015 command tools => llvm requires msvc2015 update 3, and I couldnt see an obvious way of installing update 3, into command tools
4. Downloaded git, 64-bit, from https://git-scm.com/download/win , and run/installed this. (accepted all defaults, during installation)
5. open git command prompt
```
mkdir git
cd git
git clone https://github.com/hughperkins/coriander -b winbuild
cd coriander
git submodule update --init --recursive
```
6. go to https://cmake.org/download/
- download teh 64-bit binary msi installer for windows, and run this. IMPORTANT: should be 3.7.2.  The latest cmake will give errors about `-ologo`, when building llvm
  - choose defaults, except for I selected option 'add cmake to the system path for the current user'
7. go to http://python.org , download and install python 2.7.x
8. go to http://releases.llvm.org/download.html#4.0.0 , and download and run the windows 64-bit pre-built binary
- choose option 'add to system path for current user', and install to default path `c:\Program Files\LLVM`
9. install 7zip
10. download the llvm sourcecode, and uncompress using 7zip
11. open cmake gui, and set the sourcecode directory as the llvm sourcecode folder, and a new `build` subdirectory as the build folder
- press 'configure' button
- select msvc 2015 64-bit compiler
- change `CMAKE_CONFIGURATION_TYPES` to "Debug"
- change `LLVM_TARGETS_TO_BUILD` to "X86"
- click 'configure' and 'generate'
12. open msvc2015 express ide
- load the `all_build` project or solution ,from the build directory created using cmake
- right-click the `ALL_BUILD` project, and select `build`
- any errors about `-ologo`, double-check you are using cmake 3.7.2
- right-click `INSTALL`, and select `build`
13. sanity checking on the llvm build/install:
- if you look in `c:\program files\LLVM\bin`, you should see `llvm-config.exe`
- in `c:\program files\llvm\include\llvm\support`, you should see `Datatypes.h`. Double-check that the extension is `.h`, since this is a genearted file, and the same name exists, with otehr extensions, which are not the files we need
- in `c:\program files\llvm\include\llvm\IR`, you should see `Intrinsics.gen`. Again, the extension is important
- in `c:\program files\llvm\lib`, you should see a bunch of `.lib` files, eg `LLVMCore.lib` and `LLVMSupport.lib`
- open a cmd, and run:
```
"c:\program files\llvm\bin\llvm-config" --libs
```
- it should give a list of llvm library file paths
14. open the 'MSBuild Command Prompt for VS2015'
```
cd %USERPROFILE%
cd git/coriander
mkdir build
cd build
cmake-gui ..
# press 'configure'
# msvc2015 native compiler, make sure to choose the one with 'win64' suffix
# press 'configure' then 'generate'
```
15. in msvc 2015 ide, open the `ALL_BUILD` solution file, from the Coriander build directory
- double-check taht buid configuration is `Debug`, `x64` (in the toolbar, in the middle)
- right-click target 'cocl', in the right-hand pane, and do 'Build'
- right click target 'patch_hostside', and do 'Build'
- right click target 'ir-to-opencl', adn do 'Build'
16. download clang binaries from http://releases.llvm.org/4.0.0/LLVM-4.0.0-win64.exe , and install to default directory, ie `c:\program files\LLVM`
- so this folder now contains two conceptual things:
  - the clang binaries ,from the installer you just ran
  - the llvm headers and libraries, which we build and isntalled earlier
- we need both
