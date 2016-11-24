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
import pytest


def try_build(context, ll_filepath, kernelname):
    with open(ll_filepath, 'r') as f:
        llcode = f.read()
    clcode = test_common.ll_to_cl(llcode, kernelname)
    test_common.build_kernel(context, clcode, kernelname)


@pytest.mark.xfail(reason='need to (re-)implement global constants first')
def test_program_compiles(context):
    # ok these names were obtained empirically :-P
    # ie, I first ran `cocl`, then examined the resulting testprog-device.ll file to get the names
    kernelNames = [
        'test_union',
        'test_union1',
    ]
    for kernelname in kernelNames:
        try_build(context, 'test/union-device.ll', kernelname)
