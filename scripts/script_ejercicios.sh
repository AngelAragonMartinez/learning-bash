#!/bin/bash
# Author: Angel Aragon Martinez
# Date: 2026-05-09
# Description: Practical exercises on variables, arithmetic operations and I/O in Bash

echo "--- Exercises ---"
echo "1. Print on screen: Hello, world from Bash."
echo "R: Hello, world from Bash."
echo -e "\n"

echo "2. Show the current date and directory"
echo -e "Date: $(date)\nCurrent directory: $(pwd)"
echo -e "\n"

echo "3. Store your name in a variable and display it"
read -p "What is your name? " var1
echo "Hello $var1!"
echo -e "\n"

echo "4. Declare two numeric variables, add, subtract and multiply them"
read -p "Enter two numbers: " var2 var3
echo -e "\n"
echo "--- Mini Calculator ---"
sum=$((var2+var3))
rest=$((var2-var3))
mult=$((var2*var3))
echo "Sum: $sum"
echo "Subtraction: $rest"
echo "Multiplication: $mult"
echo "-----------------------"
echo -e "\n"

echo "5. Ask the user for two numbers and show their sum"
read -p "Enter two more numbers: " num1 num2
sum2=$((num1+num2))
echo "Sum: $sum2"
echo -e "\n"

echo "6. Pass 3 arguments to the script and show the first and third"
echo "Argument 1: $1, Argument 2: $2, Argument 3: $3"
echo -e "\n"

echo "7. Show the total number of arguments passed to the script"
echo "Total arguments: $#"
echo -e "\n"

echo "8. Using the first two arguments, show sum, subtraction and multiplication"
sum3=$(($1 + $2))
rest2=$(($1 - $2))
mult2=$(($1 * $2))
echo "Sum $1 + $2: $sum3"
echo "Subtraction $1 - $2: $rest2"
echo "Multiplication $1 x $2: $mult2"
echo -e "\n"

echo "9. Create a file with a user-provided name and write your name inside it"
read -p "Enter the name for your .txt file: " name_file
read -p "Enter your name: " interior_file
echo "Running commands..."
touch "${name_file}.txt"
echo "$interior_file" >> "${name_file}.txt"
ruta_completa=$(realpath "${name_file}.txt")
echo "Done! File created at: $ruta_completa"
