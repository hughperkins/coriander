# Installation on Windows

Work in progress. For now, it's just notes of some initial steps.

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
- download teh 64-bit binary msi installer for windows, and run this
  - choose defaults, except for I selected option 'add cmake to the system path for the current user'
7. go to http://python.org , download and install python 2.7.x
8. go to http://releases.llvm.org/download.html#4.0.0 , and download and run the windows 64-bit pre-built binary
- choose option 'add to system path for current user', and install to default path `c:\Program Files\LLVM`
9. install 7zip
10. download the llvm sourcecode, and uncompress using 7zip
11. open cmake gui, and set the sourcecode directory as the llvm sourcecode folder, and a new `build` subdirectory as the build folder
- press 'configure' button
- click 'configure' and 'generate'
12. open msvc2015 express ide
- load the `all_build` project or solution ,from the build directory created using cmake
- scroll down, and look fro the `llvm-tblgen` project, under `utils` section
- right click, 'properties'
- naviaate to 'resources', 'general'
- change suppress start banner to 'no'
- click 'ok'
- right-click `llvm-tblgen`, and do `build`
13. scroll down, locate `llvm-headers` project
- right-click, `build`
14. from the Explorer window, navigate to the `build` folder, and then naviagte to the subfolder `include\llvm\IR`
- open the `intrinsics_gen.vcxproj`, in visual studio, and build it 
15. from the Explorer window, navigate to the `build` folder, and then navigate to the subfolder `include\llvm`
- copy the folders `Config`, `IR`, and `Support` into `c:\program files\include\llvm`
16. open the 'MSBuild Command Prompt for VS2015'
```
cd %USERPROFILE%
cd git/coriander
mkdir build
cd build
cmake-gui ..
# press 'configure'
# msvc2017 native compiler, make sure to choose the one with 'win64' suffix
# press 'configure' then 'generate'
```
17. From the 'MSBuild Command Prompt for VS2015'
```
cd %USERPROFILE%/git/coriander/build
msbuild ALL_BUILD.vcxproj
```
