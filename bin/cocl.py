#!/usr/bin/env python
from __future__ import print_function
import os
import platform
import os
from os import path
import sys


print('foo=bar')
print('city=paris')

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
