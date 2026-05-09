#!/bin/bash
# Autor: Angel Aragon Martinez
# Fecha: 2026-05-09
# Descripcion: Variables, operaciones aritmeticas, lectura de datos y argumentos en Bash

echo "--- Hola usuario promedio de bash ---"
echo "--- $(date) ---"
echo "--- Directorio actual: $(pwd) ---"

name="GG"
echo "Hola $name!"

# Operaciones aritmeticas con let y con expansion
a=5
b=3
let sum=a+b
echo "La suma1 es --- $sum ---"
sum2=$((a+b))
echo "La suma2 es --- $sum2 ---"
echo "*************************"

echo "--- Lectura de datos ---"
read -p "¿Cuántos años tienes? " respuesta

if [ "$respuesta" -lt 18 ]; then
	echo "Fua papu estas bien jovenazo, GG HJDPT"
else
	echo "Viejo boludo"
fi
echo "*************************"

# Argumentos posicionales del script
echo "--- Argumentos y parametros ---"
echo "El nombre del script es: $0"
echo "El primer parametro es: $1"
echo "El segundo parametro es: $2"
echo "Numero de parametros: $#"
echo "Todos los argumentos: $@"
