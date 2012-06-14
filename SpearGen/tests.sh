#!/usr/bin/bash

# DIR_PATH is used to locate the script's path.
DIR_PATH=`dirname $0`

# Include the environment variables
source $DIR_PATH/pass_vars.sh
SPEAR=/home/tao/Projects/Spear/Spear_x86_64_Linux

cd $TRANS_DIR${MY_PASS}

TEST_TARGETS=(
		hello \
		naive_func.mem2reg \
		mul_add.mem2reg.instnamer \
		last_fermat_4.mem2reg.instnamer \
		common_subexpression \
)

COUNT=0					# Initialise a counter
DASH=---------------
for TARGET in ${TEST_TARGETS[@]};do
    COUNT=`expr $COUNT + 1`		# Increment the counter
	echo "$DASH Test No.$COUNT: $TARGET. Begin... $DASH"
	./run.sh ${TARGET} 2>&1 | diff -s - oracles/${TARGET}.oracle
	echo "$DASH Test No.$COUNT: $TARGET. End...   $DASH"
	echo
done

# Below is used to generate test oracle.
# TARGET= && ./run.sh ${TARGET} 2>&1 | tee oracles/${TARGET}.oracle
# $SPEAR --model --sf oracles/${TARGET}.oracle 