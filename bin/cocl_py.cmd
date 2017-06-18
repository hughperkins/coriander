rem export SCRIPT_DIR=$( cd "$( dirname "$0" )" && pwd )
rem echo SCRIPT_DIR ${SCRIPT_DIR}

echo cocl_py.cmd

rem python ..\bin\cocl.py

rem PYOUT=$(${SCRIPT_DIR}/cocl.py)
rem pyres=$?
rem  echo PYOUT $PYOUT
rem eval ${PYOUT}
rem if [[ $pyres != 0 ]]; then {
rem     echo $errors
rem     exit 1
rem } fi
rem  echo $?
rem  echo errors [$errors]

%PYTHON27_PATH% %COCL_BIN%\cocl.py %*
