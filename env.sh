#!/bin/bash

# In zsh the value of $0 depends on the FUNCTION_ARGZERO option which is
# set by default. FUNCTION_ARGZERO, when it is set, sets $0 temporarily
# to the name of the function/script when executing a shell function or
# sourcing a script. POSIX_ARGZERO option, when it is set, exposes the
# original value of $0 in spite of the current FUNCTION_ARGZERO setting.
#
# Note: The version of zsh need to be 5.0.6 or above. Any versions below
# 5.0.6 maybe encoutner errors when sourcing this script.
if [ -n "$ZSH_VERSION" ]; then
	SCRIPT_NAME="${(%):-%N}"
	if [ $options[posixargzero] != "on" ]; then
		setopt posixargzero
		SHELL_NAME=$(basename -- "$0")
		setopt posixargzero
	else
		SHELL_NAME=$(basename -- "$0")
	fi
else
	SCRIPT_NAME="${BASH_SOURCE[0]}"
	SHELL_NAME=$(basename -- "$0")
fi

SCRIPT_PATH=$(dirname $SCRIPT_NAME)
SCRIPT_ABS_PATH=$(realpath $SCRIPT_PATH)

export PROJECT_DIR=${SCRIPT_ABS_PATH}

alias prj_format=$PROJECT_DIR/tools/code-quality/format-code-apply.sh
alias prj_format_test=$PROJECT_DIR/tools/code-quality/format-code-test.sh
alias prj_vscode="code $PROJECT_DIR/.vscode/zephyr-workspace.code-workspace"

ZEPHYR_ENV_FILE=$PROJECT_DIR/../modules/zephyr/zephyr-env.sh
test -f ${ZEPHYR_ENV_FILE}  && source ${ZEPHYR_ENV_FILE}
export PATH=${PATH}:$PROJECT_DIR/node_modules/.bin/
