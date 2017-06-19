#!/usr/bin/env python
import subprocess
import argparse
import sys
import os
import platform
from os import path
from os.path import join


SCRIPT_DIR = path.dirname(path.realpath(__file__))
# CORIANDER_DIR = path.dirname(SCRIPT_DIR)
CORIANDER_DIR = '/usr/local'
print('CORIANDER_DIR', CORIANDER_DIR)


def check_output(cmdlist, cwd=None):
    res = subprocess.check_output(cmdlist, cwd=cwd)
    if int(platform.python_version_tuple()[0]) == 2:
        return res
    return res.decode('utf-8')


def check_folder_writable(target):
    wrote_ok = False
    try:
        writecheck_path = join(target, 'writecheck.txt')
        with open(writecheck_path, 'w') as f:
            f.write('test')
        os.unlink(writecheck_path)
        wrote_ok = True
    except:
        pass
    if not wrote_ok:
        print('Please ensure the directory %s is writable' % target)
        sys.exit(-1)


def check_folder_exists(target):
    if not path.isdir(target):
        print('Please create the directory %s, and ensure you can write to it' % target)
        sys.exit(1)


def run_install_checks():
    """
    We need non-sudo write access into `{CORIANDER_DIR}/include/coriander_plugins`, and 
    `{CORIANDER_DIR}/lib/coriander_plugins`
    """
    INCLUDES_DIR = join(CORIANDER_DIR, 'include', 'coriander_plugins')
    check_folder_exists(INCLUDES_DIR)
    check_folder_writable(INCLUDES_DIR)

    LIB_DIR = join(CORIANDER_DIR, 'lib', 'coriander_plugins')
    check_folder_exists(LIB_DIR)
    check_folder_writable(LIB_DIR)


def install(repo_url):
    run_install_checks()

    tmpdir = '/tmp/coriander_clone'
    if path.isdir(tmpdir):
        print(check_output(['rm', '-Rf', tmpdir]))
    os.makedirs(tmpdir)
    print(check_output([
        'git', 'clone', '--recursive', repo_url
    ], cwd='/tmp/coriander_clone'))
    repo_dir = join(tmpdir, os.listdir(tmpdir)[0])
    print('repo_dir', repo_dir)
    build_dir = join(repo_dir, 'build')
    os.makedirs(build_dir)
    print(check_output([
        'cmake', '..', '-DCORIANDER_DIR=%s' % CORIANDER_DIR, '-DCMAKE_INSTALL_PREFIX=%s' % CORIANDER_DIR
    ], cwd=build_dir))
    print(check_output([
        'make', '-j', '8'
    ], cwd=build_dir))
    print(check_output([
        'make', 'install'
    ], cwd=build_dir))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()

    parser_ = subparsers.add_parser('install')
    parser_.add_argument('--repo-url', type=str, required=True, help='eg: https://github.com/hughperkins/coriander-dnn')
    parser_.set_defaults(func=install)

    args = parser.parse_args()
    if 'func' not in args.__dict__:
        print('please choose a function, eg install')
    else:
        func = args.func
        args_dict = args.__dict__
        del args_dict['func']
        func(**args_dict)
