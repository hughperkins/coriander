# Copyright Hugh Perkins 2016
"""
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""
from test import test_common


def try_build(context, filepath, kernelname):
    with open(filepath, 'r') as f:
        cucode = f.read()
    clcode = test_common.cu_to_cl(cucode, kernelname, num_clmems=4)
    test_common.build_kernel(context, clcode, kernelname)


def test_program_compiles(context):
    # ok these names were obtained empirically :-P
    # ie, I first ran `cocl`, then examined the resulting testprog-device.ll file to get the names
    kernelNames = [
        '_Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi',
        '_Z11doSomethingIiEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi',
        '_Z11doSomethingIcEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi'
    ]
    for kernelname in kernelNames:
        try_build(context, 'test/test_classes.cu', kernelname)
