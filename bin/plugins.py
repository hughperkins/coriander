#!/usr/env/bin python
import subprocess
import argparse
import os
from os import path
from os.path import join


SCRIPT_DIR = path.dirname(path.realpath(__file__))
CORIANDER_DIR = path.dirname(SCRIPT_DIR)
print('CORIANDER_DIR', CORIANDER_DIR)


def install(repo_url):
    tmpdir = '/tmp/coriander_clone'
    if path.isdir(tmpdir):
        print(subprocess.check_output(['rm', '-Rf', tmpdir]))
    os.makedirs(tmpdir)
    print(subprocess.check_output([
        'git', 'clone', '--recursive', repo_url
    ], cwd='/tmp/coriander_clone'))
    repo_dir = join(tmpdir, os.listdir(tmpdir)[0])
    print('repo_dir', repo_dir)
    build_dir = join(repo_dir, 'build')
    os.makedirs(build_dir)
    print(subprocess.check_output([
        'cmake', '..', '-DCORIANDER_DIR=%s' % CORIANDER_DIR
    ], cwd=build_dir))
    print(subprocess.check_output([
        'make', '-j', '8'
    ], cwd=build_dir))
    print(subprocess.check_output([
        'make', 'install'
    ], cwd=build_dir))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()

    parser_ = subparsers.add_parser('install')
    parser_.add_argument('--repo-url', type=str, required=True, help='eg: https://github.com/hughperkins/coriander-dnn')
    parser_.set_defaults(func=install)

    args = parser.parse_args()
    func = args.func
    args_dict = args.__dict__
    del args_dict['func']
    func(**args_dict)
