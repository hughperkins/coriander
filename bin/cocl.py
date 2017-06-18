#!/usr/bin/env python

# This is designed only to run on python 2.7
# If it happesn to run on python3.5 too, taht's a bonus, but not a design requirements

from __future__ import print_function
import os
import platform
import os
import sys
from os import path
import sys


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
        # echo got include
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
    elif TWOLETTERS == '-O':
        # ignore...
        DONE = True
    elif TWOLETTERS == '-G':
        # ignore
        DONE = True
    elif TWOLETTERS == '-U':
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


if 'CLANG_HOME' not in os.environ:
    errors = """
Please set CLANG_HOME, eg on Ubuntu you might do:
 
    export CLANG_HOME=/usr/lib/llvm-3.8
 
"""
    errors = errors.replace('\n', '\\n')
    print('errors=\'%s\'' % errors)
    sys.exit(1)

CLANG = 'clang++'
ADDFLAGS = ''
NATIVE_COMPILER = 'g++'
SO_SUFFIX = '.so'

if platform.uname()[0] == 'Darwin':
    ADDFLAGS = '-stdlib=libc++'
    NATIVE_COMPILER = 'clang++'
    SO_SUFFIX = '.dylib'

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
print('SCRIPT_DIR', SCRIPT_DIR)
COCL_HOME = path.dirname(SCRIPT_DIR)
print('COCL_HOME', COCL_HOME)

# print('os.cwd', os.getcwd())
PWD = os.getcwd()
print('PWD', PWD)
if path.isfile('%s/bin/patch_hostside' % COCL_HOME):
    COCL_BIN = '%s/bin' % COCL_HOME
    COCL_LIB = '%s/lib' % COCL_HOME
else:
    COCL_BIN = PWD
    COCL_LIB = PWD

i = 1
PASSTHRU = []
INCLUDES = []
while i < len(sys.argv):
    arg = sys.argv[i]
    print('i', i, 'arg', arg)
    if arg in ['-D', '-G']:
        PASSTHRU.append(arg)
    elif arg in ['-O', '-U']:
        pass  # ignore
    elif arg in ['-x']:
        # ignore and skip next (which is 'cuda')
        i += 1
    elif arg == '-I':
        INCLUDES.extend(sys.argv[i + 1].replace(':', ';').split(';'))
    elif arg.startswith('-I'):
        INCLUDES.extend(arg[2:].replace(':', ';').split(';'))
    i += 1
print('INCLUDES', INCLUDES)
