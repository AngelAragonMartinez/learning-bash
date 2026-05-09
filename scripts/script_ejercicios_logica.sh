#!/bin/bash
# Author: Angel Aragon Martinez
# Date: 2026-05-09
# Description: Exercises on conditionals, loops and functions in Bash

# 1. Ask for a number and show if it is positive, negative or zero
echo "-1-"
read -p "Enter a number: " num
if [ "$num" -gt 0 ]; then
	echo "Your number is positive"
elif [ "$num" -eq 0 ]; then
	echo "Your number is 0"
else
	echo "Your number is negative"
fi

echo "-2-"
# 2. Ask for two numbers and show which is greater or if they are equal
read -p "Enter two numbers: " num2 num3
if [ "$num2" -gt "$num3" ]; then
	echo "Greater: $num2"
elif [ "$num3" -gt "$num2" ]; then
	echo "Greater: $num3"
else
	echo "They are equal: $num2 and $num3"
fi

echo "-3-"
# 3. Interactive menu with while true; exit by choosing option 4
while true; do
	echo "
	Welcome to interactive commands
	1. Print a custom message
	2. Update the system
	3. View processes
	4. Exit"
	read -p "Select an option: " option

	if [ "$option" -eq 1 ]; then
		read -p "Message to print: " message
		echo "Your message: $message"
		read -p "Press Enter to continue..."
	elif [ "$option" -eq 2 ]; then
		sudo apt update && sudo apt upgrade -y
		echo "System updated"
		read -p "Press Enter to continue..."
	elif [ "$option" -eq 3 ]; then
		htop
	elif [ "$option" -eq 4 ]; then
		echo "Exiting..."
		for i in {1..3}; do
			sleep 0.5
			echo -n "."
		done
		echo -e "\n"
		break
	else
		echo "Invalid option"
	fi
done

# 4. Print numbers from 1 to 10 with for
for i in {1..10}; do
	echo "Number: $i"
done

# 5. Ask for pairs of numbers until both are 0; show total count entered
num4=-1
num5=-1
count=0
until [[ $num4 -eq 0 && $num5 -eq 0 ]]; do
	read -p "Enter two numbers: " num4 num5
	((count += 2))
done
((count -= 2))
echo "Total numbers entered: $count"

# 6. Print numbers from 1 to 10, skipping 5 and stopping at 8
i=0
for i in {1..10}; do
	if [ "$i" -eq 5 ]; then
		continue
	elif [ "$i" -eq 9 ]; then
		break
	fi
	echo "Number: $i"
done

# 7. Function that greets using a global variable captured before calling it
read -p "What is your name? " name
function_saludar() {
	echo "Hello $name, welcome to the script"
}
function_saludar

# 8. Function that receives two integers, calculates their sum and returns it via return
read -p "Enter two integers: " entero1 entero2
function_operaciones() {
	local resultado=$(( $1 + $2 ))
	return $resultado
}
function_operaciones $entero1 $entero2
echo "Sum: $?"

# 9. Try to copy a file; show error message if it fails
read -p "Enter the name of a file to copy: " file
function_file_cp() {
	cp "$1" "$1_backup"
	return $?
}
function_file_cp "$file"
	if [ "$?" -ne 0 ]; then
	echo "Could not copy file '$file'"
	else
	echo "File copied successfully"
	fi

# 10. List all .sh files in the current directory
echo "Listing .sh files in current directory..."
	for archivo in *.sh; do
	echo "File: $archivo"
done
echo "Done! All exercises completed."
