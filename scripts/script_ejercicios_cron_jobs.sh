#!/bin/bash
# Autor: Angel Aragon Martinez
# Fecha: 2026-05-09
# Descripcion: Scripts disenados para ejecucion automatica con cron jobs

# 1. Guarda fecha y hora en un log. Cron: cada minuto
# Crontab: * * * * * /ruta/script_ejercicios_cron_jobs.sh
date >> /home/user/Documentos/curso_mouredev/bash/scripts_bash/archivo.log

# 2. Mensaje fijo en log. Cron: cada 5 minutos
# Crontab: */5 * * * * /ruta/script_ejercicios_cron_jobs.sh
echo "Hola desde cron" >> /home/user/Documentos/curso_mouredev/bash/scripts_bash/archivo.log

# 3. Backup comprimido de una carpeta con fecha. Cron: cada dia a las 2:00 AM
# Crontab: 0 2 * * * /ruta/script_ejercicios_cron_jobs.sh
tar -czvf "/home/user/Documentos/curso_mouredev/bash_$(date +%F).tar.gz" "/home/user/Documentos/curso_mouredev/bash/backup" >> "/home/user/Documentos/curso_mouredev/bash/scripts_bash/archivo.log" 2>&1

# 4. Borra archivos .log de carpeta temporal. Cron: domingos a medianoche
# Crontab: 0 0 * * 0 /ruta/script_ejercicios_cron_jobs.sh
ruta=/home/user/Documentos/curso_mouredev/bash/carpeta_tmp
for archivo in "$ruta"/*.log; do
	rm -v "$archivo"
done >> /home/user/Documentos/curso_mouredev/bash/archivo.log 2>&1

# 5. Crea un archivo con la fecha actual como nombre. Cron: primer dia de cada mes a medianoche
# Crontab: 0 0 1 * * /ruta/script_ejercicios_cron_jobs.sh
fecha=$(date +%F)
archivo="${fecha}.txt"
ruta1="/home/user/Documentos/curso_mouredev/bash/carpeta/$archivo"
ruta2="/home/user/Documentos/curso_mouredev/bash/archivo.log"
touch "$ruta1" && echo "Archivo $archivo creado exitosamente" | tee -a "$ruta2"
