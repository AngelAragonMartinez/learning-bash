#!/bin/bash
# Autor: Angel Aragon Martinez
# Fecha: 2026-05-09
# Descripcion: Estructuras condicionales: if-elif-else, case y comprobacion de archivos

# Condicional if-elif-else con numero
num=25

if [ "$num" -ge 10 ]; then
	echo "Numero mayor o igual a 10"
elif [ "$num" -eq 0 ]; then
	echo "El número es 0"
else
	echo "Condicion por defecto"
fi

# Menú interactivo con case
echo -e "--- Elige una opcion ---\n1\n2\n3: "
read opcion

case $opcion in
	1) echo "Elegiste 1 GG!";;
	2) echo "Elegiste 2 papu:v";;
	3) echo "Elegiste 3 insanoGG";;
	*) echo "Opción inválida";;
esac

read -p "Escribe tu nombre: " name

# -n comprueba que la cadena no esta vacia
if [ -n "$name" ]; then
	echo "El nombre existe"
fi

if [ "$num" -ge 18 ] && [ -n "$name" ]; then
	echo "Mayor de edad"
fi

# Comprobacion de existencia de archivo con -e
if [ -e "./script_apuntes.sh" ]; then
	echo "El archivo existe"
else
	echo "El archivo no existe"
fi
