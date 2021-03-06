#!/usr/bin/bash

# DIR_PATH is used to locate the script's path.
DIR_PATH=`dirname $0`

# Include the environment variables
source $DIR_PATH/pass_vars.sh

cd $TRANS_DIR${MY_PASS}

TARGET=naive_func.mem2reg
echo "#############$TARGET TESTING BEGIN################"
./run.sh ${TARGET} 2>&1 | diff -s - oracles/${TARGET}.oracle
echo -e "#############$TARGET TESTING END################\n"
