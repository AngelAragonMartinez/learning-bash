#!/bin/bash
# Author: Angel Aragon Martinez
# Date: 2026-05-09
# Description: Loops: for, while, until and flow control with break and continue

# for with a list of values
for i in 1 2 3 4 5
do
	echo "Number: $i"
done

# for iterating over files in current directory
for name in *.sh
do
	echo "File: $name"
done

# while: repeats while condition is true
count=1
while [ "$count" -le 5 ];
do
	echo "Counter: $count"
	((count++))
done

# until: repeats until condition becomes true
until [ "$count" -gt 10 ]
do
	echo "Counter: $count"
	((count++))
done

# Loop control: continue skips iteration, break exits the loop
for i in 1 2 3 4 5
do
	if [ "$i" -eq 3 ]; then
		continue
	elif [ "$i" -eq 4 ]; then
		break;
	fi
        echo "Number: $i"
done
