#!/bin/bash
# Autor: Angel Aragon Martinez
# Fecha: 2026-05-09
# Descripcion: Bucles for, while y until, y control de flujo con break y continue

# for con lista de valores
for i in 1 2 3 4 5
do
	echo "Numero: $i"
done

# for iterando archivos del directorio actual
for name in *.sh
do
	echo "Archivo: $name"
done

# while: se repite mientras la condicion sea verdadera
count=1
while [ "$count" -le 5 ];
do
	echo "Contador: $count"
	((count++))
done

# until: se repite hasta que la condicion sea verdadera
until [ "$count" -gt 10 ]
do
	echo "Contador: $count"
	((count++))
done

# Control de bucles: continue salta iteracion, break detiene el bucle
for i in 1 2 3 4 5
do
	if [ "$i" -eq 3 ]; then
		continue
	elif [ "$i" -eq 4 ]; then
		break;
	fi
        echo "Numero: $i"
done
