#!/bin/bash

. $(dirname $0)/goto-root.sh # make sure that the script workspace is the root

violations=`./tools/code-quality/format-code.sh -i -n 2>&1` # dry-run to keep only violations and redirect stderr to stdout
RET=$?
if [[ ${RET} -ne 0 ]]; then
	echo "Code style test failed!"
	echo ""
	echo "${violations}"
	exit ${RET}
fi

author=$(git log -1 --pretty=format:'%an')
if [[ -z "${violations}" ]]; then
	echo "Kudos ${author}!"
	exit 0;
else
	echo "${violations}"
	echo ""
	echo "Go fix the code nerd..."
	exit -1;
fi