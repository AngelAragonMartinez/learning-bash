#!/bin/bash
# Autor: Angel Aragon Martinez
# Fecha: 2026-05-09
# Descripcion: Definicion y uso de funciones, variables locales/globales y manejo de errores

# Funcion basica sin parametros
my_function() {
	echo "Hola desde la funcion"
}

my_function

# Funcion que recibe parametros posicionales ($1, $2, ...)
my_function_with_params() {
	echo "Hola $1"
}

my_function_with_params GG

name=GG
my_function_2() {
	local msj=", mundo"
	echo "Hola $msj $name"
}

# Las variables declaradas con 'local' solo viven dentro de la funcion;
# las externas son globales y accesibles desde cualquier funcion
my_function_2

my_function_with_return() {
	return 1
}

my_function_with_return
echo $?		# $? guarda el codigo de salida del ultimo comando (0 = exito)

# Manejo de errores con $? y operadores || y &&
cp file.txt ../bash
if [ "$?" -ne 0 ]; then
	echo "Error al copiar el archivo"
fi
cp file.txt ../bash || echo "Otra vez se ha producido el error"
cp script_funciones.sh ../bash && echo "No se ha producido un error"
