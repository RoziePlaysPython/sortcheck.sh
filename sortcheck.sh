#!/bin/bash
# range variables
# amount variables
# name of tested binary

# SORTABLE ARRAY IS PASSED AS A SERIES OF ARGUMENTS TO THE BINARY

if [ $# -le 0 ]; then
    echo "Usage: sh sortcheck.sh <binary_name> <rng_bottom> <rng_top> <rng_count> <test_count>"
    exit 1
fi

bin_name="${1:-./a.out}" # just the default name of a binary
if [ ! -f $bin_name ]; then
    echo "File $bin_name not found!"
    exit 1
fi

low="${2:-0}" # lowest value for random generator
high="${3:-1000}" # highest value for rng
amount="${4:-10}" # amount of values for rng to generate
count="${5:-10}" # amount of test to conduct


echo "$bin_name $low $high $amount $count"

for ((i=0; i<$count; i++)); do
    echo "Test $i" # Outputting from 0 to count-1 like a real programmer
    unsorted=$(shuf -i $low-$high -n $amount) # WHY AREN'T YOU WORKING MOTHAFUCKA
    sorted=$(echo $unsorted | sed "s/ /\n/g" | sort --numeric-sort | xargs) # both sort and format properly (replace newlines with spaces)
    unsorted=$(echo "$unsorted" | xargs) # Now we can format unsorted and it won't get in the way of sort function
    result=$($bin_name $unsorted | xargs)
    if [ "$sorted" != "$result" ]; then # To see every test in progress just move lines 35-37 out of if statement
        echo "ERROR:"
        echo "Input           | $unsorted"
        echo "Expected output | $sorted"
        echo "Actual output   | $result"
    else
        echo "OK!"
    fi
done
