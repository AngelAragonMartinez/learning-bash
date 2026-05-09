#!/bin/bash
# Author: Angel Aragon Martinez
# Date: 2026-05-09
# Description: Scripts designed for automatic execution with cron jobs

# 1. Save current date and time to a log file. Cron: every minute
# Crontab: * * * * * /path/to/script_ejercicios_cron_jobs.sh
date >> /home/user/Documentos/curso_mouredev/bash/scripts_bash/archivo.log

# 2. Write a fixed message to a log file. Cron: every 5 minutes
# Crontab: */5 * * * * /path/to/script_ejercicios_cron_jobs.sh
echo "Hello from cron" >> /home/user/Documentos/curso_mouredev/bash/scripts_bash/archivo.log

# 3. Compress a folder into a timestamped backup file. Cron: every day at 2:00 AM
# Crontab: 0 2 * * * /path/to/script_ejercicios_cron_jobs.sh
tar -czvf "/home/user/Documentos/curso_mouredev/bash_$(date +%F).tar.gz" "/home/user/Documentos/curso_mouredev/bash/backup" >> "/home/user/Documentos/curso_mouredev/bash/scripts_bash/archivo.log" 2>&1

# 4. Delete .log files from a temporary folder. Cron: every Sunday at midnight
# Crontab: 0 0 * * 0 /path/to/script_ejercicios_cron_jobs.sh
ruta=/home/user/Documentos/curso_mouredev/bash/carpeta_tmp
for archivo in "$ruta"/*.log; do
	rm -v "$archivo"
done >> /home/user/Documentos/curso_mouredev/bash/archivo.log 2>&1

# 5. Create a file named after the current date. Cron: 1st of every month at midnight
# Crontab: 0 0 1 * * /path/to/script_ejercicios_cron_jobs.sh
fecha=$(date +%F)
archivo="${fecha}.txt"
ruta1="/home/user/Documentos/curso_mouredev/bash/carpeta/$archivo"
ruta2="/home/user/Documentos/curso_mouredev/bash/archivo.log"
touch "$ruta1" && echo "File $archivo created successfully" | tee -a "$ruta2"
