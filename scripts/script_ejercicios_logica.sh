#!/bin/bash
# Autor: Angel Aragon Martinez
# Fecha: 2026-05-09
# Descripcion: Ejercicios de condicionales, bucles y funciones en Bash

# 1. Numero positivo, negativo o cero
echo "-1-"
read -p "Ingresa un numero bro: " num
if [ "$num" -gt 0 ]; then
	echo "Tu numero es positivo"
elif [ "$num" -eq 0 ]; then
	echo "Tu numero es 0"
else
	echo "Tu numero es negativo"
fi

echo "-2-"
# 2. Cual de dos numeros es mayor o si son iguales
read -p "Ingresa dos numeros bro: " num2 num3
if [ "$num2" -gt "$num3" ]; then
	echo "Es mayor: $num2"
elif [ "$num3" -gt "$num2" ]; then
	echo "Es mayor: $num3"
else
	echo "Son iguales $num2 y $num3"
fi

echo "-3-"
# 3. Menu interactivo con while true; se sale eligiendo la opcion 4
while true; do
	echo "
	Bienvenido a los comandos interactivos
	1. Imprime el mensaje que tu quieras
	2. Actualiza el sistema
	3. Ver procesos
	4. Salir"
	read -p "Selecciona una opcion insano: " opcion

	if [ "$opcion" -eq 1 ]; then
		read -p "Mensaje a imprimir: " mensaje
		echo "Tu mensaje es: $mensaje"
		read -p "Presiona Enter para continuar..."
	elif [ "$opcion" -eq 2 ]; then
		sudo apt update && sudo apt upgrade -y
		echo "Sistema actualizado"
		read -p "Presiona Enter para continuar..."
	elif [ "$opcion" -eq 3 ]; then
		htop
	elif [ "$opcion" -eq 4 ]; then
		echo "Saliendo..."
		for i in {1..3}; do
			sleep 0.5
			echo -n "."
		done
		echo -e "\n"
		break
	else
		echo "Comando incorrecto"
	fi
done

# 4. Numeros del 1 al 10 con for
for i in {1..10}; do
	echo "Numero recorrido: $i"
done

# 5. Pide pares de numeros hasta que ambos sean 0; muestra el total introducido
num4=-1
num5=-1
count=0
until [[ $num4 -eq 0 && $num5 -eq 0 ]]; do
	read -p "Introduce dos numeros: " num4 num5
	((count += 2))
done
((count -= 2))
echo "Total de numeros introducidos: $count"

# 6. Numeros del 1 al 10, saltando el 5 y deteniendose en el 8
i=0
for i in {1..10}; do
	if [ "$i" -eq 5 ]; then
		continue
	elif [ "$i" -eq 9 ]; then
		break
	fi
	echo "Numero: $i"
done

# 7. Funcion que saluda usando una variable global capturada antes de llamarla
read -p "Cual es tu nombre we: " name
function_saludar() {
	echo "Hola $name, bienvenido al script"
}
function_saludar

# 8. Funcion que suma dos enteros y devuelve el resultado via return
read -p "Ingresa dos enteros bro: " entero1 entero2
function_operaciones() {
	local resultado=$(( $1 + $2 ))
	return $resultado
}
function_operaciones $entero1 $entero2
echo "La suma es: $?"

# 9. Intenta copiar un archivo; muestra mensaje si falla
read -p "Ingresa el nombre de un archivo que deseas copiar: " file
function_file_cp() {
	cp "$1" "$1_backup"
	return $?
}
function_file_cp "$file"
	if [ "$?" -ne 0 ]; then
	echo "El archivo '$file' no se ha podido copiar"
	else
	echo "Archivo copiado con exito"
	fi

# 10. Lista todos los archivos .sh del directorio actual
# Autor: Angel
# Fecha: 7/mayo/2026
# Descripcion: listado de scripts
echo "Listando archivos con extension .sh en el directorio actual..."
	for archivo in *.sh; do
	echo "Archivo: $archivo"
done
echo "GG! has acabado los ejercicios."
