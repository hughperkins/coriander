#!/usr/bin/env python

# will install coriander and some key plugins
# assumes:
# - python 2.7
# - running from root of cloned https://github.com/hughperkins/coriander repo
# - have a c++ compiler available
# - cmake installed,  and in the PATH
# - have internet access

from __future__ import print_function
import subprocess
import os
import sys
from os import path
from os.path import join
import platform
import argparse
import time


REQUIRED_LLVM_VERSION = '4.0.0'

current_dir = '.'
llvm_dir = None


def is_py2():
    return int(platform.python_version_tuple()[0]) == 2


def cd(subdir):
    global current_dir
    if subdir.startswith('/'):
        current_dir = subdir
    else:
        current_dir = join(current_dir, subdir)
    print('cd to [%s]' % current_dir)
    if not path.isdir(current_dir):
        print('Folder %s doesnt exist' % current_dir)
        raise Exception('Folder %s doesnt exist' % current_dir)


def cd_repo_root():
    global current_dir
    current_dir = '.'


def run(cmdlist):
    print(' '.join(cmdlist))
    f_out = open('out.txt', 'w', buffering=1)
    f_in = open('out.txt', 'r', buffering=1)
    f_in.seek(0)
    try:
        p = subprocess.Popen(cmdlist, cwd=current_dir, stdout=f_out, stderr=subprocess.STDOUT, bufsize=1)
    except Exception as e:
        print('')
        print('Something went wrong. Sorry about that :-(')
        print('')
        print('Here are some diagnostic details. No need to read them. Please copy and paste into')
        print('an issue at https://github.com/hughperkins/coriander/issues')
        print('')
        print('exception:', e)
        print('current_dir [%s]' % current_dir)
        print('cmdlist', cmdlist)
        sys.exit(-1)
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


def makedir(target, sudo=False):
    if(':' not in target and target[0] != '/'):
        target = join(current_dir, target)
    if not path.isdir(target):
        print('creating folder [%s]' % target)
        if sudo:
            run(['sudo', 'mkdir', '-p', target])
        else:
            os.makedirs(target)


def ensure_dir_exists(target):
    makedir(target)


def is_llvm_dir(p):
    if not path.isdir(p):
        return False
    clangxx_filepath = join(p, 'bin', 'clang++')
    if not path.isfile(clangxx_filepath):
        return False
    llvm_version = run([clangxx_filepath, '--version']).split('clang version ')[1].split(' ')[0]
    print('llvm_version', llvm_version)
    if llvm_version != REQUIRED_LLVM_VERSION:
        return False
    return True


def wget(url, filename=None):
    # run(['wget', '--progress=dot:giga', target_url, '-O', filename])
    if filename is None:
        run(['curl', url, '-O'])
    else:
        run(['curl', url, '-o', filename])


def install_llvm(install_dir):
    global llvm_dir
    # install to current directory?
    cd(install_dir)
    run(['rm', '-f', '-r', 'soft'])
    makedir('soft')
    cd('soft')
    target_url = {
        'Darwin': 'http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-apple-darwin.tar.xz',
        'Linux': 'http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz',
        'Windows': 'http://releases.llvm.org/4.0.0/LLVM-4.0.0-win64.exe'
    }[platform.uname()[0]]
    filename = target_url.split('/')[-1]
    wget(target_url, filename)
    if filename.endswith('.tar.xz'):
        run(['tar', '-xf', filename])
        unzip_name = filename.replace('.tar.xz', '')
        run(['mv', unzip_name, 'llvm-4.0'])
        cd_repo_root()
        llvm_dir = path.abspath(join(install_dir, 'soft', 'llvm-4.0'))
        if is_llvm_dir(llvm_dir):
            print('installed llvm ok to [%s]' % join('soft', 'llvm-4.0'))
        else:
            print('Failed to install LLVM 4.0.  Please retry, or install by hand')
            sys.exit(-1)
    else:
        print('Please install LLVM 4.0.0 by hand, into default location.  It is already downloaded into "soft" sub-directory. Just need to double-click it :-)')
        sys.exit(-1)


def maybe_install_llvm(install_dir):
    global llvm_dir
    for p in ['/usr/local/opt/llvm-4.0', 'C:\\Program Files\\LLVM', join(install_dir, 'soft', 'llvm-4.0')]:
        if is_llvm_dir(p):
            llvm_dir = p
            print('found llvm, with required version %s at %s' % (REQUIRED_LLVM_VERSION, llvm_dir))
            break
    if llvm_dir is None:
        install_llvm(install_dir)


def install_coriander(install_dir):
    global llvm_dir
    makedir('build')
    cd('build')
    run(['cmake', '..', '-DCLANG_HOME=%s' % llvm_dir, '-DCMAKE_INSTALL_PREFIX=%s' % install_dir])
    if platform.uname()[0] in ['Darwin', 'Linux']:
        run(['make', '-j', '8'])
    else:
        run(['cmake', '--build', '.'])
    # if platform.uname()[0] in ['Linux']:
    #     # need sudo :-(
    #     print('Please enter your sudo password:')
    #     run(['sudo', 'cmake', '--build', '.', '--target', 'install'])
    # else:
    run(['cmake', '--build', '.', '--target', 'install'])


# def setup_plugin_perms():
#     if platform.uname()[0] in ['Linux']:
#         makedir('/usr/local/include/coriander_plugins', sudo=True)
#         makedir('/usr/local/lib/coriander_plugins', sudo=True)
#         run(['sudo', 'chmod', 'uog+w', '/usr/local/include/coriander_plugins'])
#         run(['sudo', 'chmod', 'uog+w', '/usr/local/lib/coriander_plugins'])


def install_plugin(install_dir, repo_url, git_branch):
    cd_repo_root()
    run([
        sys.executable,
        join(install_dir, 'bin', 'cocl_plugins.py'), 'install',
        '--repo-url', repo_url,
        '--git-branch', git_branch
    ])


def main(git_branch, install_dir):
    ensure_dir_exists(install_dir)
    maybe_install_llvm(install_dir=install_dir)
    install_coriander(install_dir=install_dir)
    # setup_plugin_perms()
    os.environ['COCL_CMAKE'] = join(install_dir, 'share', 'cocl')
    for repo_url in [
            'https://github.com/hughperkins/coriander-clblast',
            'https://github.com/hughperkins/coriander-dnn']:
        install_plugin(install_dir=install_dir, repo_url=repo_url, git_branch=git_branch)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--git-branch', type=str, default='master', help='mostly for maintainers')
    parser.add_argument('--install-dir', type=str, default='~/coriander', help='where to install to')
    args = parser.parse_args()
    args.install_dir = args.install_dir.replace('~', os.environ['HOME'])
    main(**args.__dict__)
