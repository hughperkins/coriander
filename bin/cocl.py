#!/usr/bin/env python

# This is designed only to run on python 2.7
# If it happesn to run on python3.5 too, taht's a bonus, but not a design requirements

from __future__ import print_function
import os
import platform
import os
import sys
import re
import subprocess
from os import path
from os.path import join


print('cocl.py args: [%s]' % ' '.join(sys.argv))

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

DEVICE_PARSE_PASSES_STR = ' '.join(['-%s' % o for o in DEVICE_PARSE_PASSES.split(',')])
print('DEVICE_PARSE_PASSES_STR [%s]' % DEVICE_PARSE_PASSES_STR)

ADDFLAGS = ''
NATIVE_COMPILER = 'g++'
SO_SUFFIX = '.so'
if platform.uname()[0] == 'Darwin':
    ADDFLAGS = '-stdlib=libc++'
    NATIVE_COMPILER = 'clang++'
    SO_SUFFIX = '.dylib'

def display_help():
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

PASSTHRU = ''
IROOPENCLARGS = ''
COMPILE_ONLY = False
OPT_G = ''
OUTPATH = ''
CLANG_HOME = ''
COCL_BIN = ''
INCLUDES = []
INFILES = []

args = sys.argv[1:]
while len(args) > 0:
    THISARG = args[0].split('=')[0]
    DONE = False
    TWOLETTERS = args[0][:2]

    if TWOLETTERS == ';':
       # ignore (artifact of cmake file hacking...
       DONE = True
    elif TWOLETTERS == '-I':
        # need to check if theres a space or not
        if THISARG == '-I':
            INCLUDES.append(args[1])
            args = args[1:]
        else:
            INCLUDES.extend([inc.replace('-I', '') for inc in THISARG.split(';')])
        DONE = True
    elif TWOLETTERS == '-D':
        # hacktastic :-D. Would be better to fix the cmake rules, sooner or later...
        DSTRIPPED = THISARG.REPLACE('-D-D', '-D')
        PASSTHRU += ' %s' % DSTRIPPED
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
            OPT_G = '-g'
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
            PASSTHRU += ' %s' % THISARG
        elif THISARG in ['-gencode', '--compile-bindir', '-fno-canonical-system-headers', '-M', '-std']:
            # ignore these
        elif THISARG in ['-iquote', '-isystem', '--compiler-options']:
            # ignore these, and the following token
            args = args[1:]
        else:
            # add as input file
            INFILES.append(THISARG)
    args = args[1:]

SCRIPT_DIR = path.dirname(path.realpath(__file__))

if CLANG_HOME == '':
    COCL_HOME = path.dirname(SCRIPT_DIR)

if COCL_BIN == '':
    COCL_BIN = '%s/bin' % COCL_HOME

if COCL_LIB == '':
    COCL_LIB = '%s/lib' % COCL_HOME

if COCL_INCLUDE == '':
    COCL_INCLUDE = '%s/include' % COCL_HOME

CLANG = 'clang++'

if len(INFILES) == 0:
    print_help()
    print('')
    print('Please specify one or more input sourcecode files')
    print('')
    sys.exit(1)
elif len(INFILES) > 1:
    if OUTPATH != '' and COMPILE_ONLY:
        print('You specified more than one input file, and compile only, and gave an output path')
        print('Whilst any of these things are ok on their own, or as a pair, all three together seems')
        print('hard to understand?  Therefore, not supported')
        sys.exit(-1)

LLVM_COMPILE_FLAGS = subprocess.check_output([
    join(CLANG_HOME, 'bin', 'llvm-config'), '--cppflags', '--cxxflags'
])
print('LLVM_COMPILE_FLAGS [%s]' % LLVM_COMPILE_FLAGS)
for orig, new in {
        '-fno-rtti': '',
        '-NDEBUG': '',
        '-g': '',
        '-fno-exceptions': '-fexceptions',
        '-std=c++0x': '-std=c++11',
        '-O0': '', '-O1': '', '-O2': '', '-O3': ''
    }.items():
        LLVM_COMPILE_FLAGS = LLVM_COMPILE_FLAGS.replace(' %s' % orig, new)
LLVM_COMPILE_FLAGS = re.sub(r' -isysroot [^ ]+', '', LLVM_COMPILE_FLAGS)
print('LLVM_COMPILE_FLAGS [%s]' % LLVM_COMPILE_FLAGS)

# we're going to use LLVM_LL_COMPILE_FLAGS for linking
# technically, we should be using LLVM_LINK_FLAGS for that, but that seems to
# not have the libraries we need, though that might be fixable (and thus clearn)
LLVM_LL_COMPILE_FLAGS = re.sub(r'-I *[^ ]+', ' ', ' %s ' % LLVM_COMPILE_FLAGS)
LLVM_LINK_FLAGS = subprocess.check_output([
    join(CLANG_HOME, 'bin', 'llvm-config'), '--ldflags', '--system-libs', '--libs', 'all'
])
print('LLVM_LINK_FLAGS [%s]' % LLVM_LINK_FLAGS)

# since tf feeds us weird postfixes like '.cu.cc' ,and '.cu.pic.d' (is that a foldername? unclear for now...), so
# we need to do something more robust than just assume the files end in '.cu' or '.o'
#
# gets a file basename and postfix, for unknown postfix
#
# eg:
#
#   in: 'foo/bar/somefile.cu.cc'
#   return: 'foo/bar/somefile', '.cu.cc'
#
def split_path(filepath):
    DIRNAME = path.dirname(filepath)
    BASENAME = path.basename(filepath)

    split_basename = basename.split('.')
    BASEARR0 = split_basename[0]
    POSTFIX = '.' + '.'.join(ARGREST[1:])
    BASEPATH = join(DIRNAME, BASEARR0)
    print('BASEPATH %s' % BASEPATH)
    print('POSTFIX %s' % POSTFIX)
    return BASEPATH, POSTFIX

for infile in INFILES:
    print('infile', infile)
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
    if not path.isdir(OUTDIR):
        print('Creating output folder %s' % OUTDIR)
        os.makedirs(OUTDIR)


def run(cmdline_list):
    print(' '.join(cmdline_list))
    print(subprocess.check_output(cmdline_list))


# device-side: .cu => -deviceside-noopt.ll
# note to self: hmmmm, should we be defining in addition __CUDA_ARCH__ here?
(
    set -x
    ${CLANG_HOME}/bin/clang++ ${PASSTHRU} -DUSE_CLEW \
        -std=c++11 -x cuda \
        -D__CORIANDERCC__ \
        -D__CUDACC__ \
        --cuda-gpu-arch=sm_30 -nocudalib -nocudainc --cuda-device-only -emit-llvm \
        -O${DEVICE_PARSE_OPT_LEVEL} \
        -S \
        ${ADDFLAGS} \
        -Wno-gnu-anonymous-struct \
        -Wno-nested-anon-types \
        ${LLVM_COMPILE_FLAGS} \
        -I${COCL_INCLUDE}/EasyCL \
        -I${COCL_INCLUDE}/cocl \
        -include ${COCL_INCLUDE}/cocl/cocl.h \
        -include ${COCL_INCLUDE}/cocl/fake_funcs.h \
        -include ${COCL_INCLUDE}/cocl/cocl_deviceside.h \
        -I${COCL_INCLUDE} \
        ${INCLUDES} \
        ${INPUTBASEPATH}${INPUTPOSTFIX} -o ${OUTPUTBASEPATH}-device-noopt.ll
)

        # -I${COCL_HOME}/src \
        # -I${COCL_HOME}/src/EasyCL \
        # -I${COCL_HOME}/src/EasyCL/thirdparty/clew/include \

# opt: -device-noopt.ll => -device.ll
(
    set -x
    ${CLANG_HOME}/bin/opt ${DEVICE_PARSE_PASSES_STR} -S \
        -o ${OUTPUTBASEPATH}-device.ll \
        ${OUTPUTBASEPATH}-device-noopt.ll
)

# host-side: -.cu => -hostraw.cll
(
    set -x
    ${CLANG_HOME}/bin/clang++ ${PASSTHRU} \
        ${INCLUDES} -DUSE_CLEW \
        -std=c++11 -x cuda -nocudainc --cuda-host-only -emit-llvm \
        -O${HOSTSIDE_PARSE_OPT_LEVEL} \
        -S \
        ${OPT_G} \
        -D__CUDACC__ \
        -D__CORIANDERCC__ \
        -Wno-gnu-anonymous-struct \
        -Wno-nested-anon-types \
        ${LLVM_COMPILE_FLAGS} \
        -I${COCL_INCLUDE} \
        -I${COCL_INCLUDE}/EasyCL \
        -I${COCL_INCLUDE}/cocl \
        ${ADDFLAGS} \
        ${LLVM_COMPILE_FLAGS} \
        -include ${COCL_INCLUDE}/cocl/cocl.h \
        -include ${COCL_INCLUDE}/cocl/fake_funcs.h \
        -include ${COCL_INCLUDE}/cocl/cocl_hostside.h \
        ${INPUTBASEPATH}${INPUTPOSTFIX} \
        -o ${OUTPUTBASEPATH}-hostraw.ll
)

        # -I${COCL_HOME}/src \
        # -I${COCL_HOME}/src/EasyCL/thirdparty/clew/include \
        # -I${COCL_HOME}/src/EasyCL \

# patch_hostside: -hostraw.ll => -hostpatched.ll
(
    set -x
    ${COCL_BIN}/patch_hostside \
        --hostrawfile ${OUTPUTBASEPATH}-hostraw.ll \
        --devicellfile ${OUTPUTBASEPATH}-device.ll \
        --hostpatchedfile ${OUTPUTBASEPATH}-hostpatched.ll
)

# -hostpatched.ll => .o
(
    set -x
    ${CLANG_HOME}/bin/clang++ \
        ${PASSTHRU} \
        ${LLVM_LL_COMPILE_FLAGS} \
        -DUSE_CLEW \
        -O${HOSTSIDE_COMPILE_OPT_LEVEL} \
        ${OPT_G} \
        -c ${OUTPUTBASEPATH}-hostpatched.ll \
        -o ${OUTPUTBASEPATH}${OUTPUTPOSTFIX}
)

if not COMPILE_ONLY:
    # .o => executable
    cmdline_list = [
        NATIVE_COMPILER,
        '-o', OUTPUTBASEPATH + FINALPOSTFIX,
        OUTPUTBASEPATH + OUTPUTPOSTFIX,
        '-L%s' % COCL_LIB]
    cmdline_list += LLVM_LINK_FLAGS.split(' ')
    if OPT_G != '':
        cmdline_list.append(OPT_G)
    if platform.uname()[0] == 'Windows':
        pass
    else:
        cmdline_list.append([
            '-Wl,-rpath,%s' % COCL_LIB,
            '-Wl,-rpath,$$ORIGIN'
        ])
        cmdline_list += ['-lcocl', '-lclblast', '-leasycl', '-lclew', '-lpthread']
    run(cmdline_list)
