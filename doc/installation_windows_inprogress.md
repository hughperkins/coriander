# Installation on Windows

Work in progress. For now, it's just notes of some initial steps.

1. (~~installed an ie8 + windows 2010 vm from microsoft modern.ie site~~ Looks like should be 64-bit windows. ~~went aws Windows Server 2016 in the end~~ NVIDIA K520 driver doesnt work on win2016, switched to Server 2012 R2)
2. ~~installed all windows updates, did the reboot~~ (no need to run 'update' when running from aws; at least, the msvc installer doesnt require it)
2b. Install GPU Driver and GPU-specific OpenCL headers, libraries
3. installed http://landinghub.visualstudio.com/visual-cpp-build-tools

<img src="img/msvc_cmdlinetools_setup.png?raw=true" />

4. Downloaded git, 64-bit, from https://git-scm.com/download/win , and run/installed this. (accepted all defaults, during installation)
5. open git command prompt
```
mkdir git
cd git
git clone https://github.com/hughperkins/coriander -b winbuild
cd coriander
git submodule update --init --recursive
```
5. go to https://cmake.org/download/
6. download teh 64-bit binary msi installer for windows, and run this
- choose defaults, except for I selected option 'add cmake to the system path for the current user'
7. go to http://python.org , download and install python 2.7.x
8. go to http://releases.llvm.org/download.html#4.0.0 , and download and run the windows 64-bit pre-built binary
- choose option 'add to system path for current user', and install to default path `c:\Program Files\LLVM`
9. install 7zip
10. download the llvm sourcecode, and uncompress using 7zip
11. open cmake gui, and set the sourcecode directory as the llvm sourcecode folder, and a new `build` subdirectory as the build folder
- press 'configure' button
- ~~unselect `LLVM_BUILD_RUNTIME`, `LLVM_BUILD_TOOLS`, `LLVM_BUILD_UTILS`~~
- click 'configure' and 'generate'
7. open an msvc2017 developer prompt, cd into the llvm source `build` folder, and do:
```
msbuild llvm-headers.vcxproj
```
- THIS FAILS => going to retry with msvc2015 tools
8.
```
cd %USERPROFILE%
cd git/coriander
mkdir build
cd build
cmake-gui ..
# press 'configure'
# msvc2017 native compiler, make sure to choose the one with 'win64' suffix
msbuild ALL_BUILD.vcxproj
```
