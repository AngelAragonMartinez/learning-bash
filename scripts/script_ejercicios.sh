#!/bin/bash
# Autor: Angel Aragon Martinez
# Fecha: 2026-05-09
# Descripcion: Ejercicios practicos de variables, operaciones aritmeticas y E/S en Bash

echo "--- Ejercicios ---"
echo "1. Imprime en pantalla: Hola, mundo desde Bash."
echo "R: Hola, mundo desde Bash."
echo -e "\n"

echo "2. Muestra la fecha y el directorio actual"
echo -e "Fecha: $(date)\nAdemas, tu directorio actual es:$(pwd)"
echo -e "\n"

echo "3. Guarda tu nombre en una variable y muestralo en pantalla"
read -p "Cual es tu nombre? " var1
echo "Hola $var1!"
echo -e "\n"

echo "4. Declara dos variables numericas, sumalas, restalas y multiplicalas"
read -p "Ingresa tus dos variables bro: " var2 var3
echo -e "\n"
echo "--- Mini Calculadora --"
sum=$((var2+var3))
rest=$((var2-var3))
mult=$((var2*var3))
echo "La suma es: $sum"
echo "La resta es: $rest"
echo "La multiplicacion es: $mult"
echo "-----------------------"
echo -e "\n"

echo "5. Pide dos numeros al usuario y muestra la suma"
read -p "Vuelve a ingresar dos numeros insano: " num1 num2
sum2=$((num1+num2))
echo "La suma es: $sum2"
echo -e "\n"

echo "6. Ingresa 3 argumentos al script y muestra el primero y el tercero"
echo "Argumento 1 ingresado: $1, el argumento 2 ingresado: $2 y el 3 argumento: $3"
echo -e "\n"

echo "7. Muestra el total de argumentos ingresados al script"
echo "Total de argumentos ingresados: $#"
echo -e "\n"

echo "8. Con los primeros dos argumentos recibidos, muestra la suma, resta, multiplicacion y division"
sum3=$(($1 + $2))
rest2=$(($1 - $2))
mult2=$(($1 * $2))
echo "Suma $1 + $2: $sum3"
echo "Resta $1 - $2: $rest2"
echo "Multiplicacion $1 x $2: $mult2"
echo -e "\n"

echo "9. Crea un archivo con el nombre ingresado por el usuario y guarda tu nombre en su interior"
read -p "Ingresa el nombre que deseas que tenga tu archivo.txt: " name_file
read -p "Y ingresa tu nombre: " interior_file
echo "Ejecutando comandos..."
touch "${name_file}.txt"
echo "$interior_file" >> "${name_file}.txt"
ruta_completa=$(realpath "${name_file}.txt")
echo "Listo ! Archivo creado correctamente junto con su contenido en : $ruta_completa"
