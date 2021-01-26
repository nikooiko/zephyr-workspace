#!/bin/bash

. $(dirname $0)/goto-root.sh # make sure that the script workspace is the root

find {apps} -iname *.h -o -iname *.c -o -iname *.cpp -o -iname *.hpp
