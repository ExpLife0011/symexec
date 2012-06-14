#!/usr/bin/bash

# DIR_PATH is used to locate the script's path.
DIR_PATH=`dirname $0`

cd $DIR_PATH/examples

TARGET=${1:-last_fermat_4}
clang -emit-llvm -S -o- ${TARGET}.c | opt -S -mem2reg -instnamer -lowerswitch | tee ${TARGET}.ll

