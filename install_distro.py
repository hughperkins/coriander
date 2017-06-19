#!/usr/bin/env python

# will install coriander and some key plugins
# assumes:
# - python 2.7
# - running from root of cloned https://github.com/hughperkins/coriander repo
# - have a c++ compiler available
# - cmake installed,  and in the PATH
# - have internet access
#
# platform specific assumptions/requireents:
# 
# linux:
# - need to be able to run `sudo`

from __future__ import print_function
import subprocess
import os
import sys
from os import path
from os.path import join
import platform
import argparse
import time


current_dir = '.'


def is_py2():
    return int(platform.python_version_tuple()[0]) == 2


def makedir(target):
    if not path.isdir(target):
        os.makedirs(target)


def cd(subdir):
    global current_dir
    if subdir.startswith('/'):
        current_dir = subdir
    else:
        current_dir = join(current_dir, subdir)
    print('cd to [%s]' % current_dir)

def cd_repo_root():
    global current_dir
    current_dir = '.'


def run(cmdlist):
    f_out = open('out.txt', 'w', buffering=1)
    f_in = open('out.txt', 'r', buffering=1)
    f_in.seek(0)
    p = subprocess.Popen(cmdlist, cwd=current_dir, stdout=f_out, stderr=subprocess.STDOUT, bufsize=1)
    def print_progress():
        line = f_in.readline()
        while line != '':
            print(line[:-1])
            line = f_in.readline()
        # print(lines)
    p.poll()
    while p.returncode is None:
        print_progress()
        time.sleep(1)
        p.poll()
    print_progress()
    print('p.returncode', p.returncode)
    assert p.returncode == 0


def install_coriander():
    makedir('build')
    cd('build')
    run(['cmake', '..'])
    if platform.uname()[0] in ['Darwin', 'Linux']:
        run(['make', '-j', '8'])
    else:
        run(['cmake', '--build', '.'])
    if platform.uname()[0] in ['Linux']:
        # need sudo :-(
        print('Please enter your sudo password:')
        run(['sudo', 'cmake', '--build', '.', '--target', 'install'])
    else:
        run(['cmake', '--build', '.', '--target', 'install'])


def setup_plugin_perms():
    if platform.uname()[0] in ['Linux']:
        makedir('/usr/local/include/coriander_plugins')
        makedir('/usr/local/lib/coriander_plugins')
        run(['sudo', 'chmod', 'uog+w', '/usr/local/include/coriander_plugins'])
        run(['sudo', 'chmod', 'uog+w', '/usr/local/lib/coriander_plugins'])


def install_plugin(repo_url):
    cd_repo_root()
    run([sys.executable, join('bin', 'cocl_plugins.py'), 'install', '--repo-url', repo_url])


def main():
    install_coriander()
    setup_plugin_perms()
    for plugin in ['https://github.com/hughperkins/coriander-dnn']:
        install_plugin(plugin)


if __name__ == '__main__':
    main()
