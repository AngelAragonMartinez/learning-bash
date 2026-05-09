#!/bin/bash
# Author: Angel Aragon Martinez
# Date: 2026-05-09
# Description: Conditionals: if-elif-else, case and file existence check

# if-elif-else with a number
num=25

if [ "$num" -ge 10 ]; then
	echo "Number is greater than or equal to 10"
elif [ "$num" -eq 0 ]; then
	echo "The number is 0"
else
	echo "Default condition"
fi

# Interactive menu with case
echo -e "--- Choose an option ---\n1\n2\n3: "
read option

case $option in
	1) echo "You chose 1!";;
	2) echo "You chose 2!";;
	3) echo "You chose 3!";;
	*) echo "Invalid option";;
esac

read -p "Enter your name: " name

# -n checks that the string is not empty
if [ -n "$name" ]; then
	echo "Name is set"
fi

if [ "$num" -ge 18 ] && [ -n "$name" ]; then
	echo "Adult"
fi

# Check file existence with -e
if [ -e "./script_apuntes.sh" ]; then
	echo "File exists"
else
	echo "File does not exist"
fi
