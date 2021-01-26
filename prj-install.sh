#!/bin/bash

# Initialize west on the parent directory
cd ..
rm -rf .west
west init -l zephyr-workspace
west config zephyr.base modules/zephyr
west update

# Initialize the project environment
cd zephyr-workspace || return
source env.sh
