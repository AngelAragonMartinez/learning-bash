#!/bin/bash
# Author: Angel Aragon Martinez
# Date: 2026-05-09
# Description: Function definition and usage, local/global variables and error handling

# Basic function with no parameters
my_function() {
	echo "Hello from the function"
}

my_function

# Function that receives positional parameters ($1, $2, ...)
my_function_with_params() {
	echo "Hello $1"
}

my_function_with_params GG

name=GG
my_function_2() {
	local msj=", world"
	echo "Hello $msj $name"
}

# Variables declared with 'local' only live inside the function;
# external variables are global and accessible from any function
my_function_2

my_function_with_return() {
	return 1
}

my_function_with_return
echo $?		# $? holds the exit code of the last command (0 = success)

# Error handling with $? and || and && operators
cp file.txt ../bash
if [ "$?" -ne 0 ]; then
	echo "Error copying the file"
fi
cp file.txt ../bash || echo "Error occurred again"
cp script_funciones.sh ../bash && echo "No error occurred"
