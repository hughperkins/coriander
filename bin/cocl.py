#!/usr/bin/env python

# This is designed only to run on python 2.7
# If it happesn to run on python3.5 too, taht's a bonus, but not a design requirements

from __future__ import print_function
import platform
import sys
import re
import subprocess
import os
import json
from os import path
from os.path import join


print(' '.join(sys.argv))

DEVICE_PARSE_OPT_LEVEL = os.environ.get('DEVICE_PARSE_OPT_LEVEL', '')
if DEVICE_PARSE_OPT_LEVEL == '':
    DEVICE_PARSE_OPT_LEVEL = '2'

DEVICE_PARSE_PASSES = os.environ.get('DEVICE_PARSE_PASSES', '')
if DEVICE_PARSE_PASSES == '':
    DEVICE_PARSE_PASSES = 'inline,mem2reg,instcombine'

HOSTSIDE_PARSE_OPT_LEVEL = os.environ.get('HOSTSIDE_PARSE_OPT_LEVEL', '')
if HOSTSIDE_PARSE_OPT_LEVEL == '':
    HOSTSIDE_PARSE_OPT_LEVEL = '2'

HOSTSIDE_COMPILE_OPT_LEVEL = os.environ.get('HOSTSIDE_COMPILE_OPT_LEVEL', '')
if HOSTSIDE_COMPILE_OPT_LEVEL == '':
    HOSTSIDE_COMPILE_OPT_LEVEL = '3'

DEVICE_PARSE_PASSES_LIST = ['-%s' % o for o in DEVICE_PARSE_PASSES.split(',')]
# print('DEVICE_PARSE_PASSES_LIST', DEVICE_PARSE_PASSES_LIST)

ADDFLAGS = []
NATIVE_COMPILER = 'g++'
SO_SUFFIX = '.so'
if platform.uname()[0] == 'Darwin':
    ADDFLAGS += ['-stdlib=libc++']
    NATIVE_COMPILER = 'clang++'
    SO_SUFFIX = '.dylib'


def check_output(cmd_list):
    cleaned_cmd_list = [s for s in cmd_list if (s and not s.isspace())]
    res = subprocess.check_output(cleaned_cmd_list)
    if int(platform.python_version_tuple()[0]) == 2:
        return res
    return res.decode('utf-8')


def print_help():
    print("""
Usage: cocl [options] <targetfile>
  -c compile to .o only, dont link
  -o final output filepath
  --clang-home Path to llvm4.0

  Options passed through to clang compiler:
    -fPIC
    -I<INCLUDEDIR>
    -D<SYMBOL>[=<VALUE>]
    -g

  Options ignored currently:
    -O
    -G
    -U
    -M
    -x <something>
    -iquote <something>
    -isystem <something>
    -compiler-options <something>
    -fno-canonical-system-headers
    -std<something>
    -compiler-bindir
    -gencode
""")

PASS_THRU = []
COMPILE_ONLY = False
OPT_G = []
OUTPATH = ''
COCL_HOME = os.environ.get('COCL_HOME', '')
COCL_LIB = os.environ.get('COCL_LIB', '')
COCL_INCLUDE = os.environ.get('COCL_INCLUDE', '')
CLANG_HOME = os.environ.get('CLANG_HOME', '')
COCL_BIN = os.environ.get('COCL_BIN', '')
INCLUDES = []
INFILES = []

args = sys.argv[1:]
while len(args) > 0:
    # THISARG = args[0].split('=')[0]
    THISARG = args[0]
    DONE = False
    TWOLETTERS = args[0].split('=')[0][:2]

    if TWOLETTERS == ';':
       # ignore (artifact of cmake file hacking...
       DONE = True
    elif TWOLETTERS == '-I':
        # need to check if theres a space or not
        if THISARG == '-I':
            INCLUDES += ['-I%s' % args[1]]
            args = args[1:]
        else:
            INCLUDES += THISARG.split(';')
        DONE = True
    elif TWOLETTERS == '-D':
        # hacktastic :-D. Would be better to fix the cmake rules, sooner or later...
        DSTRIPPED = THISARG.REPLACE('-D-D', '-D')
        PASS_THRU += [' %s' % DSTRIPPED]
        DONE = True
    elif TWOLETTERS in ['-O', '-G', '-U']:
        # ignore
        DONE = True
    elif TWOLETTERS == '-x':
        # not sure why we are receiving -x cu? ignore for now
        args = args[1:]
        DONE = True

    if not DONE:
        if THISARG == '-c':
            COMPILE_ONLY = True
        elif THISARG == '-g':
            OPT_G = ['-g']
        elif THISARG == '-o':
            OUTPATH = args[1]
            args = args[1:]
        elif THISARG == '--clang-home':
            CLANG_HOME = args[1]
            args = args[1:]
        elif THISARG == '--cocl-bin':
            COCL_BIN = args[1]
            args = args[1:]
        elif THISARG == '--cocl-lib':
            COCL_LIB = args[1]
            args = args[1:]
        elif THISARG == '--cocl-include':
            COCL_INCLUDE = args[1]
            args = args[1:]
        elif THISARG in ['-?', '-h', '-help']:
            display_help()
            sys.exit(0)
        elif THISARG in ['-ferror-limit', '-fPIC']:
            # pass these through to clang++
            PASS_THRU += [' %s' % THISARG]
        elif THISARG in ['-gencode', '--compile-bindir', '-fno-canonical-system-headers', '-M', '-std']:
            # ignore these
            pass
        elif THISARG in ['-iquote', '-isystem', '--compiler-options']:
            # ignore these, and the following token
            args = args[1:]
        else:
            # add as input file
            INFILES.append(THISARG)
    args = args[1:]

SCRIPT_DIR = path.dirname(path.realpath(__file__))

if CLANG_HOME == '':
    print('Please specify CLANG_HOME, eg using --clang-home /usr/local/opt/llvm-4.0')
    sys.exit(-1)

if COCL_HOME == '':
    COCL_HOME = path.dirname(SCRIPT_DIR)

if COCL_BIN == '':
    COCL_BIN = join(COCL_HOME, 'bin')

if COCL_LIB == '':
    COCL_LIB = join(COCL_HOME, 'lib')

if COCL_INCLUDE == '':
    COCL_INCLUDE = join(COCL_HOME, 'include')

CLANG = 'clang++'

INFILES = [f for f in INFILES if f != '']
if len(INFILES) == 0:
    print_help()
    print('')
    print('Please specify one or more input sourcecode files')
    print('')
    sys.exit(1)
elif len(INFILES) > 1:
    if OUTPATH != '' and COMPILE_ONLY:
        print('')
        print('Error: Cannot simultaneously specify more than one input file, and compile only, and give an output path')
        print('')
        print('you gave the following input files:', INFILES)
        sys.exit(-1)

LLVM_COMPILE_FLAGS = check_output([
    join(CLANG_HOME, 'bin', 'llvm-config'), '--cppflags', '--cxxflags'
]).replace('\n', ' ')
for orig, new in {
        '-fno-rtti': '',
        '-DNDEBUG': '',
        '-g': '',
        '-fno-exceptions': '-fexceptions',
        '-std=c++0x': '-std=c++11',
        '-O0': '', '-O1': '', '-O2': '', '-O3': ''
    }.items():
        LLVM_COMPILE_FLAGS = LLVM_COMPILE_FLAGS.replace(' %s' % orig, new)
LLVM_COMPILE_FLAGS = re.sub(r' -isysroot [^ ]+', '', LLVM_COMPILE_FLAGS)
LLVM_COMPILE_FLAGS_LIST = [flag for flag in LLVM_COMPILE_FLAGS.split(' ') if flag != '']

# we're going to use LLVM_LL_COMPILE_FLAGS for linking
# technically, we should be using LLVM_LINK_FLAGS for that, but that seems to
# not have the libraries we need, though that might be fixable (and thus clearn)
LLVM_LL_COMPILE_FLAGS = re.sub(r'-I *[^ ]+', ' ', ' %s ' % LLVM_COMPILE_FLAGS)
LLVM_LL_COMPILE_FLAGS_LIST = [flag for flag in LLVM_LL_COMPILE_FLAGS.split(' ') if flag != '']
# print('LLVM_LL_COMPILE_FLAGS_LIST', LLVM_LL_COMPILE_FLAGS_LIST)
LLVM_LINK_FLAGS = check_output([
    join(CLANG_HOME, 'bin', 'llvm-config'), '--ldflags', '--system-libs', '--libs', 'all'
]).replace('\n', ' ')
LLVM_LINK_FLAGS_LIST = LLVM_LINK_FLAGS.split(' ')
# print('LLVM_LINK_FLAGS_LIST', LLVM_LINK_FLAGS_LIST)

if platform.uname()[0] == 'Windows':
    # windows llvm was built using msvc, so calling llvm-config will give us msvc
    # compile flags, like /EHsc etc
    # but, we are not going to use msvc to parse the .cu files into bytecode: we are
    # going to use clang++. So, we need to use some different flags somehow
    LLVM_COMPILE_FLAGS_LIST = []
    LLVM_LL_COMPILE_FLAGS_LIST = []

def split_path(filepath):
    """
    since tf feeds us weird postfixes like '.cu.cc' ,and '.cu.pic.d' (is that a foldername? unclear for now...), so
    we need to do something more robust than just assume the files end in '.cu' or '.o'

    gets a file basename and postfix, for unknown postfix

    eg:

      in: 'foo/bar/somefile.cu.cc'
      return: 'foo/bar/somefile', '.cu.cc'
    """
    DIRNAME = path.dirname(filepath)
    BASENAME = path.basename(filepath)

    split_basename = BASENAME.split('.')
    BASEARR0 = split_basename[0]
    POSTFIX = ''
    if len(split_basename) > 1:
        POSTFIX = '.' + '.'.join(split_basename[1:])
    BASEPATH = join(DIRNAME, BASEARR0)
    return BASEPATH, POSTFIX


# handle plugin include directories
# plugins_include_dir = '/usr/local/include/coriander_plugins'   # obviously this should be generalized somewhat
plugins_include_dir = join(COCL_INCLUDE, 'coriander_plugins')
if path.isdir(plugins_include_dir):
    for plugin in os.listdir(plugins_include_dir):
        print('adding %s to includes' % plugin)
        INCLUDES += ['-I' + join(plugins_include_dir, plugin)]
print('INCLUDES', INCLUDES)

# handle plugin libraries
LIBS = []
# plugins_lib_dir = '/usr/local/lib/coriander_plugins'  # should generalize this too...
plugins_lib_dir = join(COCL_LIB, 'coriander_plugins')
if path.isdir(plugins_lib_dir):
    LIBS += ['-L%s' % plugins_lib_dir]
    for lib in os.listdir(plugins_lib_dir):
        if not lib.endswith(".cmake"):
            print('adding %s to libs' % lib)
            # LIBS += ['-l%s' % join(plugins_lib_dir, lib)]
            LIBS += ['-l%s' % lib.replace('lib', '').split('.')[0]]
print('LIBS', LIBS)


def run(cmdline_list):
    print(' '.join(cmdline_list))
    print(check_output(cmdline_list))


for infile in INFILES:
    INPUTBASEPATH, INPUTPOSTFIX = split_path(infile)

    if OUTPATH != '':
        OUTFILE = OUTPATH
    else:
        if COMPILE_ONLY:
            OUTFILE = '%s.o' % INPUTBASEPATH
        else:
            OUTFILE = INPUTBASEPATH

    OUTPUTBASEPATH, OUTPUTPOSTFIX = split_path(OUTFILE)
    if not COMPILE_ONLY:
        FINALPOSTFIX = OUTPUTPOSTFIX
        OUTPUTPOSTFIX = '.o'

    OUTDIR = path.dirname(OUTFILE)
    if OUTDIR == '':
        OUTDIR = '.'
    # print('OUTFILE [%s]' % OUTFILE)
    # print('OUTDIR [%s]' % OUTDIR)
    if not path.isdir(OUTDIR):
        print('Creating output folder %s' % OUTDIR)
        os.makedirs(OUTDIR)

    # device-side: .cu => -deviceside-noopt.ll
    # note to self: hmmmm, should we be defining in addition __CUDA_ARCH__ here?
    run(
        [join(CLANG_HOME, 'bin', 'clang++')] +
        PASS_THRU + [
            '-DUSE_CLEW',
            '-std=c++11', '-x', 'cuda',
            '-D__CORIANDERCC__',
            '-D__CUDACC__',
            '--cuda-gpu-arch=sm_30', '-nocudalib', '-nocudainc', '--cuda-device-only', '-emit-llvm',
            '-O%s' % DEVICE_PARSE_OPT_LEVEL,
            '-S'
        ] + ADDFLAGS + [
            '-Wno-gnu-anonymous-struct',
            '-Wno-nested-anon-types'
        ] + LLVM_COMPILE_FLAGS_LIST + [
            # '-I%s' % join(COCL_INCLUDE, 'EasyCL'),
            # '-I%s' % join(COCL_INCLUDE, 'EasyCL', 'third_party', 'clew', 'include'),
            # '-I%s' % join(COCL_INCLUDE),
            '-I%s' % join(COCL_INCLUDE, 'cocl'),  # for cuda.h
            # '-I%s' % join(COCL_INCLUDE, 'cocl', 'proxy_includes'),
            '-include', join(COCL_INCLUDE, 'cocl', 'cocl.h'),
            '-include', join(COCL_INCLUDE, 'cocl', 'fake_funcs.h'),
            '-include', join(COCL_INCLUDE, 'cocl', 'cocl_deviceside.h'),
            '-I%s' % COCL_INCLUDE,
        ] + INCLUDES + [
            INPUTBASEPATH + INPUTPOSTFIX,
            '-o', '%s-device-noopt.ll' % OUTPUTBASEPATH
        ])
    # opt: -device-noopt.ll => -device.ll
    run(
        [join(CLANG_HOME, 'bin', 'opt')] +
        DEVICE_PARSE_PASSES_LIST + [
            '-S',
            '-o', '%s-device.ll' % OUTPUTBASEPATH,
            '%s-device-noopt.ll' % OUTPUTBASEPATH
        ]
    )

    # host-side: -.cu => -hostraw.cll
    cmdline_list = (
        [join(CLANG_HOME, 'bin', 'clang++')] +
        PASS_THRU +
        INCLUDES +
        [
            '-I', join(COCL_INCLUDE, 'cocl'),
            '-I', join(COCL_INCLUDE, 'cocl', 'proxy_includes'),
            '-DUSE_CLEW',
            '-std=c++11', '-x', 'cuda', '-nocudainc', '--cuda-host-only', '-emit-llvm',
            '-O%s' % HOSTSIDE_PARSE_OPT_LEVEL,
            '-S'
        ] + OPT_G + [
            '-D__CUDACC__',
            '-D__CORIANDERCC__',
            '-Wno-gnu-anonymous-struct',
            '-Wno-nested-anon-types'
        ] + LLVM_COMPILE_FLAGS_LIST + [
            '-I%s' % COCL_INCLUDE,
            # '-I%s' % join(COCL_INCLUDE, 'EasyCL'),
            # '-I%s' % join(COCL_INCLUDE, 'EasyCL', 'third_party', 'clew', 'include'),
            '-I%s' % join(COCL_INCLUDE, 'cocl')  # for cuda.h
        ] + ADDFLAGS + [
            '-include', join(COCL_INCLUDE, 'cocl', 'cocl.h'),
            '-include', join(COCL_INCLUDE, 'cocl', 'fake_funcs.h'),
            '-include', join(COCL_INCLUDE, 'cocl', 'cocl_hostside.h'),
            INPUTBASEPATH + INPUTPOSTFIX,
            '-o', '%s-hostraw.ll' % OUTPUTBASEPATH
        ])
    run(cmdline_list)

    # patch_hostside: -hostraw.ll => -hostpatched.ll
    run([
            join(COCL_BIN, 'patch_hostside'),
            '--hostrawfile', '%s-hostraw.ll' % OUTPUTBASEPATH,
            '--devicellfile', '%s-device.ll' % OUTPUTBASEPATH,
            '--hostpatchedfile', '%s-hostpatched.ll' % OUTPUTBASEPATH
        ])

    # -hostpatched.ll => .o
    run(
        [join(CLANG_HOME, 'bin', 'clang++')] +
        LLVM_LL_COMPILE_FLAGS_LIST + [
            '-DUSE_CLEW',
            '-O%s' % HOSTSIDE_COMPILE_OPT_LEVEL
        ] + OPT_G + [
            '-c', '%s-hostpatched.ll' % OUTPUTBASEPATH,
            '-o', OUTPUTBASEPATH + OUTPUTPOSTFIX
        ]
    )

if not COMPILE_ONLY:
    # .o => executable
    cmdline_list = (
        [
            NATIVE_COMPILER,
            '-o', OUTPUTBASEPATH + FINALPOSTFIX,
            OUTPUTBASEPATH + OUTPUTPOSTFIX,
            '-L%s' % COCL_LIB
        ] +
        OPT_G +
        LLVM_LINK_FLAGS_LIST
    )
    if platform.uname()[0] == 'Windows':
        pass
    else:
        cmdline_list += [
            '-Wl,-rpath,%s' % COCL_LIB,
            '-Wl,-rpath,%s' % plugins_lib_dir,
            '-Wl,-rpath,$$ORIGIN'
        ]
        cmdline_list += ['-lcocl', '-lclblast', '-leasycl', '-lclew', '-lpthread']
    cmdline_list += LIBS
    run(cmdline_list)
