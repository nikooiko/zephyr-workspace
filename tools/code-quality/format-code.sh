#!/bin/bash

. $(dirname $0)/goto-root.sh # make sure that the script workspace is the root

echo $($(dirname $0)/get-code.sh) | xargs clang-format $@ -style=file -fallback-style=none 
