#/usr/bin/env python
# designed to be run with python 2.7, from the root of the repo

import os
import sys
import subprocess
import platform
from os import path
from os.path import join
import time
import argparse


current_dir = path.abspath(os.getcwd())

def cd(subdir):
    global current_dir
    if subdir.startswith('/'):
        current_dir = subdir
    else:
        current_dir = join(current_dir, subdir)
    print('cd to [%s]' % current_dir)


def cd_repo_root():
    global current_dir
    current_dir = path.abspath(os.getcwd())  # since python never really changes its actual cwd


def run(cmdlist):
    global recursion_level
    print(' '.join(cmdlist))
    f_out = open('jenkins-out%s.txt', 'w', buffering=1)
    f_in = open('jenkins-out%s.txt', 'r', buffering=1)
    f_in.seek(0)
    p = subprocess.Popen(cmdlist, cwd=current_dir, stdout=f_out, stderr=subprocess.STDOUT, bufsize=1)
    res = ''
    def print_progress():
        line = f_in.readline()
        # if not is_py2():
        #     line = line.decode('utf-8')
        res_lines = ''
        while line != '':
            print(line[:-1])
            res_lines += line
            line = f_in.readline()
            # if not is_py2():
            #     line = line.decode('utf-8')
        return res_lines
        # print(lines)
    p.poll()
    while p.returncode is None:
        res += print_progress()
        time.sleep(1)
        p.poll()
    res += print_progress()
    print('p.returncode', p.returncode)
    assert p.returncode == 0
    return res


def maybe_rmtree(tree_dir):
    if path.isdir(tree_dir):
        if platform.uname()[0] == 'Windows':
            run(['rmdir', '/s', '/q', '"%s"' % tree_dir])
        else:
            run(['rm', '-Rf', tree_dir])


def clean_coriander():
    coriander_dir = join(os.environ['HOME'], 'coriander')
    maybe_rmtree(coriander_dir)


def main(git_branch):
    # BASEDIR = os.getcwd()

    clean_coriander()

    run(['python2', 'install_distro.py', '--git-branch', git_branch])

    run(['hg', 'clone', 'https://bitbucket.org/hughperkins/eigen', '-b', 'tf-coriander'])
    # mkdir build
    EIGEN_HOME = join(os.getcwd(), 'eigen')
    cd('build')
    run(['cmake', '-DEIGEN_TESTS=ON', '-DEIGEN_HOME=%s' % EIGEN_HOME, '..'])
    run(['make', '-j', '16'])
    so_suffix = '.so'
    if platform.uname()[0] == 'Darwin':
        so_suffix = '.dylib'
    elif platform.uname()[0] == 'Windows':
        so_suffix = '.dll'
    artifacts_list = []
    for libname in ['cocl', 'clew', 'clblast', 'easycl']:
        artifacts_list.append('lib%s%s' % (libname, so_suffix))
    run(['zip', '../artifacts.zip'] + artifacts_list)
    run(['make', '-j', '16', 'gtest-tests'])
    run(['make', '-j', '16', 'endtoend-tests'])
    run(['make', '-j', '16', 'eigen-tests'])
    run(['make', 'run-gtest-tests'])
    run(['make', 'run-endtoend-tests'])
    run(['make', 'run-eigen-tests'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--git-branch', type=str, default='master', help='mostly affects plugins')
    args = parser.parse_args()
    main(**args.__dict__)
