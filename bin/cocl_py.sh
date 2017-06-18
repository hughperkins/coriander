#!/bin/sh

export SCRIPT_DIR=$( cd "$( dirname "$0" )" && pwd )
echo SCRIPT_DIR ${SCRIPT_DIR}

PYOUT=$(${SCRIPT_DIR}/cocl.py)
pyres=$?
# echo PYOUT $PYOUT
eval ${PYOUT}
if [[ $pyres != 0 ]]; then {
    echo $errors
    exit 1
} fi
# echo $?
# echo errors [$errors]
