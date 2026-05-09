# Ejercicios de Bash

---

## Ejercicios de comandos básicos

**1. Muestra el directorio actual**

```bash
pwd
```

**2. Lista los archivos y carpetas (simple y con detalles)**

```bash
ls
ls -l
```

**3. Navega a tu directorio home y luego sube un nivel**

```bash
cd ~
cd ..
```

**4. Crea un directorio llamado "ejercicios"**

```bash
mkdir ejercicios
```

**5. Crea un archivo vacío llamado "nota.txt" y luego elimínalo**

```bash
touch nota.txt
rm nota.txt
```

**6. Lista los archivos usando comodines**

```bash
ls *.txt
ls ????*
```

**7. Elimina un directorio de manera recursiva**

```bash
rm -r dir
```

**8. Elimina todos los archivos de un mismo tipo**

```bash
rm -f ????*.txt
```

**9. Utiliza el comando `tree`**

```bash
tree
tree -a
```

**10. Busca un archivo concreto en el directorio actual utilizando `find`**

```bash
find . -name "ejercicios.txt"
```

---

## Ejercicios de comandos avanzados

**1. Muestra todo el contenido de un archivo**

```bash
cat comandos.txt
```

**2. Muestra el contenido paginado de un archivo**

```bash
less comandos.txt
```

**3. Muestra las 15 primeras líneas de un archivo**

```bash
head -n 15 comandos.txt
```

**4. Muestra las 15 últimas líneas de un archivo**

```bash
tail -n 15 comandos.txt
```

**5. Busca una palabra en un archivo**

```bash
grep "who" comandos.txt
```

**6. Cuenta las líneas de un archivo**

```bash
wc -l comandos.txt
```

**7. Redirige una salida y guárdala en un archivo**

```bash
tree > nuevo.txt
```

**8. Añade una nueva salida al archivo anterior**

```bash
ls -la >> nuevo.txt
```

**9. Encadena 3 comandos**

```bash
echo "Hola bro?" | grep "bro" | wc -l
```

**10. Crea una variable local y muéstrala**

```bash
user="local"
echo $user
```

---

## Ejercicios de editores básicos

### nano

- Crea un archivo llamado `nota.txt` y escribe tres líneas de texto.
- Abre `nota.txt`, añade una línea al final y guarda los cambios.
- Abre un archivo nuevo llamado `recordatorio.txt`, escribe algo y sal sin guardar.
- Busca una palabra específica en un archivo existente.
- Corta una línea y pégala en otra parte.

### vim

- Crea `apuntes.txt`, entra en modo inserción y escribe una frase.
- Mueve el cursor sin usar las flechas (`h`, `j`, `k`, `l`).
- Borra una línea completa y deshaz el cambio.
- Copia una línea y pégala debajo.
- Guarda los cambios y sal.

---

## Ejercicios de administración

**Crea un archivo y visualiza sus permisos**

```bash
touch archivo.txt
ls -l archivo.txt
```

**Otorga permisos de ejecución solo al propietario en modo simbólico**

```bash
chmod u+x archivo.txt
```

**Cambia sus permisos a `644`**

```bash
chmod 644 archivo.txt
```

**Elimina los permisos para el grupo**

```bash
chmod g-rwx archivo.txt
```

**Haz que solo pueda ejecutarse por el propietario**

```bash
chmod 700 archivo.txt
```

**Crea una carpeta y dale permisos para que solo el usuario pueda acceder**

```bash
mkdir -m 700 carpeta_ejemplo
```

**Cámbiala el propietario a otro usuario de tu sistema (si existe y tienes permisos)**

```bash
sudo chown otro_usuario:otro_grupo archivo.txt
```

**Consulta la máscara de permisos actual y calcula qué permisos tendrán los nuevos archivos**

```bash
umask 027   # archivos → 640 | carpetas → 750
```

**Cambia la máscara, crea un archivo y consulta los permisos por defecto**

```bash
umask 000
touch archivo_nuevo.txt
ls -l archivo_nuevo.txt
```

**Utiliza un comando como superusuario**

```bash
sudo chmod +x script.sh
```

---

## Ejercicios de procesos y alias

**1. Muestra todos los procesos del sistema**

```bash
ps aux
```

**2. Muestra el monitor interactivo de procesos**

```bash
htop
```

**3. Utiliza el comando `free` de manera correcta**

```bash
free -h
```

**4. Lanza `sleep 100`, suspéndelo, mándalo al segundo plano y tráelo al primero**

```bash
sleep 100
# Ctrl + Z
bg %1
fg %1
```

**5. Lanza un proceso como `sleep` y termínalo usando su PID**

```bash
sleep 50 &
kill <PID>
```

**6. Consulta el espacio en disco**

```bash
df -h
```

**7. Consulta el historial**

```bash
history
```

**8. Repite el último comando**

```bash
!!
```

**9. Crea y prueba un alias**

```bash
alias actualizar='sudo apt update && sudo apt upgrade -y'
actualizar
```

**10. Elimina el alias que acabas de crear**

```bash
unalias actualizar
```
