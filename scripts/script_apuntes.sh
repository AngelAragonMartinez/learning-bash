#!/bin/bash
# Author: Angel Aragon Martinez
# Date: 2026-05-09
# Description: Variables, arithmetic operations, input reading and arguments in Bash

echo "--- Hello average bash user ---"
echo "--- $(date) ---"
echo "--- Current directory: $(pwd) ---"

name="GG"
echo "Hello $name!"

# Arithmetic operations using let and arithmetic expansion
a=5
b=3
let sum=a+b
echo "Sum1 is --- $sum ---"
sum2=$((a+b))
echo "Sum2 is --- $sum2 ---"
echo "*************************"

echo "--- Data input ---"
read -p "How old are you? " age

if [ "$age" -lt 18 ]; then
	echo "Wow, you are quite young!"
else
	echo "Not so young anymore, haha"
fi
echo "*************************"

# Positional arguments passed to the script
echo "--- Arguments and parameters ---"
echo "Script name: $0"
echo "First parameter: $1"
echo "Second parameter: $2"
echo "Number of parameters: $#"
echo "All arguments: $@"
