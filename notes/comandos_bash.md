# Comandos de Bash

## Índice

- [[#Comandos Básicos]]
- [[#Comandos Avanzados]]
- [[#Gestión de Archivos]]
- [[#Administración del Sistema]]
- [[#Procesos]]
- [[#Alias (Atajos)]]
- [[#Scripting]]
- [[#Condicionales]]
- [[#Bucles]]
- [[#Funciones]]
- [[#Cron Jobs (Tareas Programadas)]]

---

# Comandos Básicos

## Hola mundo

```bash
echo "Hola, BASH"
echo $SHELL    # muestra la shell actual
echo $0        # muestra el nombre del proceso actual
```

## Orientación y navegación

```bash
pwd
ls
ls -l
ls -a
ls -la
ls -lh
```

```bash
cd dir
cd ..
cd ~

cd [TAB]        # autocompletado de rutas

cd dir/dir/dir
cd ../../../../
```

> **Ruta absoluta:** parte desde la raíz (`/`). Ejemplo: `/home/usuario/documentos`
> **Ruta relativa:** parte desde el directorio actual. Ejemplo: `../scripts`

## Básicos

```bash
whoami
cal
date
uptime
hostname

uname
uname -a

clear
```

## Anatomía del comando

```
comando [opciones] [argumentos]
```

## Ayuda y documentación

```bash
man ls
ls --help
ls -h
```

---

# Comandos Avanzados

## Lectura de archivos

| Comando | Descripción |
| --- | --- |
| `cat` | Muestra el contenido completo de un archivo |
| `less` | Muestra el contenido paginado (`q` para salir) |
| `more` | Similar a `less`, más básico |
| `head` | Muestra las primeras 10 líneas |
| `head -n 15` | Muestra las primeras 15 líneas |
| `tail` | Muestra las últimas 10 líneas |
| `tail -n 15` | Muestra las últimas 15 líneas |
| `tail -f` | Sigue el archivo en tiempo real (útil para logs) |

## Búsqueda

```bash
grep "dir" file.txt          # busca la palabra "dir" en el archivo
grep -i "dir" file.txt       # búsqueda sin distinguir mayúsculas
grep -r "palabra" dir        # búsqueda recursiva en un directorio
grep -ri "dir" dir           # recursiva e insensible a mayúsculas
grep -v "dir" file.txt       # muestra líneas que NO contienen "dir"
grep -n "dir" file.txt       # muestra el número de línea de cada resultado
```

```bash
wc         # cuenta líneas, palabras y caracteres
wc -l      # solo líneas
wc -w      # solo palabras
wc -c      # solo caracteres
```

## Redirecciones y pipes

| Operador | Descripción |
| --- | --- |
| `>` | Redirige la salida a un archivo (sobreescribe) |
| `>>` | Redirige y añade al final del archivo |
| `<` | Toma la entrada desde un archivo |

```bash
echo "Hola" > nuevo.txt                       # crea/sobreescribe el archivo
tree >> nuevo.txt                             # añade al final
sort < nuevo.txt                              # ordena usando el archivo como entrada
cat comandos.txt | grep "dir" | wc -w         # encadena comandos con pipes
```

## Variables de entorno

### Global

```bash
echo $HOME     # directorio home del usuario
echo $PATH     # rutas donde el sistema busca ejecutables
```

### Local

```bash
name="GG"
echo $name     # las variables locales solo existen en la sesión actual
```

---

# Gestión de Archivos

## Directorios del sistema

| Directorio | Descripción |
| --- | --- |
| `/` | Raíz (directorio principal) |
| `/home` | Carpetas personales de los usuarios |
| `/etc` | Archivos de configuración del sistema |
| `/bin` | Comandos esenciales del sistema |
| `/usr` | Programas instalados por el usuario |
| `/var` | Archivos variables (logs, bases de datos) |
| `/tmp` | Archivos temporales |

> **Árbol completo:** `bin boot dev etc home init lib lib64 media mnt opt proc root run sbin srv sys tmp usr var`

## Manipulación de archivos y directorios

```bash
mkdir dir                      # crea un directorio
touch archivo.txt              # crea un archivo vacío
rm archivo.txt                 # elimina un archivo (no elimina directorios)
rmdir dir                      # elimina un directorio vacío
rm -r dir                      # elimina el directorio y todo su contenido
rm -ri dir                     # como -r pero pregunta antes de eliminar
rm -rf dir                     # eliminación forzada sin confirmación
rm -f archivo.txt              # elimina un archivo forzando (sin error si no existe)
```

```bash
cp origen.txt destino.txt          # copia un archivo
cp -r dir carpetaCopia             # copia un directorio con todo su contenido
cp -a dir dirDestino               # copia preservando todos los atributos
```

```bash
mv archivo.txt dir/                # mueve un archivo a otro directorio
mv dir/archivo.txt ./              # mueve al directorio actual
mv archivo.txt nuevo_nombre.txt    # renombra un archivo
```

## Comodines

| Patrón | Descripción |
| --- | --- |
| `ls *.extension` | Archivos con esa extensión |
| `ls 03*` | Archivos que empiezan con `03` |
| `ls 03*.txt` | Archivos que empiezan con `03` y terminan en `.txt` |
| `ls ????*` | Archivos con al menos 4 caracteres |
| `ls ????.extension` | Exactamente 4 caracteres más extensión |
| `ls D*?` | Empieza con `D` y tiene al menos 2 caracteres |

## Listados avanzados

```bash
tree                    # árbol visual del directorio
tree -a                 # árbol incluyendo archivos ocultos
find . -name "coman*"   # busca archivos por nombre desde el directorio actual
```

## Editores básicos

### nano

| Atajo | Acción |
| --- | --- |
| `Ctrl + W` | Buscar texto |
| `Ctrl + K` | Cortar línea |
| `Ctrl + U` | Pegar línea |
| `Ctrl + O` | Guardar |
| `Ctrl + X` | Salir |

### vim

> vim tiene tres modos: **Normal → Inserción (`i`) → Comando (`:`)**

**En modo normal:**

| Tecla | Acción |
| --- | --- |
| `h / l / k / j` | Izquierda / derecha / arriba / abajo |
| `/` | Buscar texto |
| `dd` | Eliminar línea |
| `yy` | Copiar línea |
| `p` | Pegar línea |
| `u` | Deshacer |
| `:w` | Guardar |
| `:q` | Salir |
| `:wq` | Guardar y salir |

---

# Administración del Sistema

## Tipos de permiso

**Modo simbólico:**

| Símbolo | Permiso |
| --- | --- |
| `r` | Lectura (read) |
| `w` | Escritura (write) |
| `x` | Ejecución (execute) |

**Modo octal:**

| Valor | Permiso |
| --- | --- |
| `4` | Lectura (`r`) |
| `2` | Escritura (`w`) |
| `1` | Ejecución (`x`) |

## Tipos de usuario

| Símbolo | Descripción |
| --- | --- |
| `u` | Propietario (user) |
| `g` | Grupo (group) |
| `o` | Otros (others) |
| `a` | Todos (all) |

### Ver permisos

```bash
ls -l          # archivos
ls -ld dir     # directorios
```

### Ejemplo de salida

```
-rwxr-xr-x 1 usuario

[-][rwx][r-x][r-x]
 ↑   ↑     ↑     ↑
 │   │     │     └── Permisos de otros usuarios (tercer bloque)
 │   │     └──────── Permisos del grupo (segundo bloque)
 │   └────────────── Permisos del propietario (primer bloque)
 └────────────────── Tipo de archivo
```

**Tipos de archivo (primer carácter):**

| Símbolo | Tipo |
| --- | --- |
| `-` | Archivo normal |
| `d` | Directorio |
| `l` | Enlace simbólico |
| `b` | Dispositivo de bloque |
| `c` | Dispositivo de carácter |
| `s` | Socket |
| `p` | Pipe |

> Dentro de cada bloque `[rwx]`: primer elemento = lectura (`r`), segundo = escritura (`w`), tercero = ejecución (`x`). El guión (`-`) indica que **no** tiene ese permiso.

## Modo octal

Los permisos se representan con **3 dígitos** → `[usuario][grupo][otros]`. Cada número es la **suma** del valor de cada permiso:

| Valor | Suma | Simbólico |
| --- | --- | --- |
| `7` | 4+2+1 (lectura + escritura + ejecución) | `rwx` |
| `6` | 4+2 (lectura + escritura) | `rw-` |
| `5` | 4+1 (lectura + ejecución) | `r-x` |
| `4` | 4 (solo lectura) | `r--` |
| `3` | 2+1 (escritura + ejecución) | `-wx` |
| `2` | 2 (solo escritura) | `-w-` |
| `1` | 1 (solo ejecución) | `--x` |

**Ejemplos:**
- `777`: todos los usuarios tienen lectura, escritura y ejecución.
- `764`: propietario `rwx` (7), grupo `rw-` (6), otros `r--` (4).

## Modificación de permisos

**`chmod`** — cambia los permisos de archivos y directorios.

**Modo simbólico:**

```bash
chmod u+x archivo.txt    # añade ejecución al propietario
chmod u-x archivo.txt    # quita ejecución al propietario
chmod u=x archivo.txt    # establece exactamente ejecución al propietario
```

**Modo octal:**

```bash
chmod 777 archivo.txt
mkdir -m 700 carpeta     # crea el directorio con permisos específicos
```

## Cambiar propietario y grupo

```bash
chown user2:grupo archivo.txt    # cambia propietario y grupo
```

### Cambiar solo el grupo

```bash
sudo chgrp nuevo_grupo archivo.txt
```

### Ver usuarios y grupos del sistema

```bash
cat /etc/passwd | cut -d: -f1    # lista usuarios disponibles
cat /etc/group | cut -d: -f1     # lista grupos disponibles
```

## Máscara de permisos (umask)

> Define los permisos que se **restan por defecto** al crear nuevos archivos o directorios.

```bash
umask    # muestra la máscara actual
```

**Ejemplo con `umask 0002`:**

| Dígito | Significado |
| --- | --- |
| `0` | Sistema octal |
| `0` | Sin restricción para el propietario |
| `0` | Sin restricción para el grupo |
| `2` | Quita escritura (`w`) para otros |

Con `umask 0002`, los nuevos archivos y directorios tienen:

| Tipo | Cálculo | Resultado |
| --- | --- | --- |
| Directorio | `777 - 002` | `775` → `rwxrwxr-x` |
| Archivo | `666 - 002` | `664` → `rw-rw-r--` |

> Los archivos con permisos restringidos pueden modificarse con `sudo`:
> ```bash
> sudo rm -rf /directorio_protegido/
> ```

---

# Procesos

```bash
ps             # procesos del usuario actual
ps aux         # todos los procesos del sistema
top            # monitor de procesos en tiempo real
htop           # monitor interactivo (más visual que top)
free           # uso de memoria RAM
free -h        # en formato legible (MB, GB)
df -h          # espacio en disco por partición
du -sh *       # tamaño de cada elemento en el directorio actual
du             # tamaño del directorio actual
du -sh         # tamaño total en formato legible
du -s          # tamaño total sin desglose
```

## Trabajos en primer y segundo plano

> - **Primer plano (foreground):** estado por defecto. La shell se bloquea hasta que el proceso termina. No puedes escribir nuevos comandos.
> - **Segundo plano (background):** el proceso corre en paralelo, liberando la shell para seguir trabajando.
> - **Detenido (stopped):** el proceso está pausado pero sigue en memoria y puede reanudarse.

```bash
jobs             # lista los jobs activos
sleep 100        # simula un proceso que "duerme" N segundos
# Ctrl + Z      → suspende el proceso en primer plano
bg %1            # reanuda el job 1 en segundo plano
fg %1            # trae el job 1 al primer plano
sleep 100 &      # lanza el proceso directamente en segundo plano
```

**Ejemplo:**

```bash
$ sleep 50 &
[1] 1234    # "1234" es el PID del proceso
```

## Eliminar procesos

```bash
kill PID         # envía señal de terminación al proceso
kill -9 PID      # fuerza la terminación inmediata del proceso
```

## Historial

```bash
history               # muestra el historial de comandos
!!                    # repite el último comando
!10                   # ejecuta el comando número 10 del historial
!ls                   # ejecuta el último comando que empezó con "ls"
echo "Hola mundo\!"   # escapar el signo ! con backslash en el historial
history -cw           # borra el historial permanentemente del disco
```

---

# Alias (Atajos)

```bash
alias                            # lista todos los alias activos
alias nombre='ls -la'            # crea un alias temporal (dura la sesión)
nombre                           # usa el alias
unalias nombre                   # elimina el alias
```

---

# Scripting

> Un **script** es un archivo de texto con comandos que la shell ejecuta secuencialmente.

## Crear un script

La extensión es `.sh`.

```bash
nano script_uno.sh
```

**Shebang** (primera línea obligatoria en todos los scripts bash):

```bash
#!/bin/bash

# → comentario en bash
```

Dar permiso de ejecución:

```bash
chmod u+x script_uno.sh
```

Ejecutar el script:

```bash
./script_uno.sh    # el "./" hace referencia al directorio actual
```

## Lectura de datos

```bash
read -p "¿Cuál es tu edad? " edad   # muestra un mensaje y guarda la respuesta en "edad"
```

## Operadores de comparación

### Comparación de archivos

| Operador | Descripción |
| --- | --- |
| `-e` | Existe (archivo o carpeta) |
| `-f` | Es un archivo regular |
| `-d` | Es un directorio |
| `-s` | El archivo NO está vacío |
| `-r` | Tienes permiso de lectura |
| `-w` | Tienes permiso de escritura |
| `-x` | Tienes permiso de ejecución |

### Comparación de números (enteros)

| Operador | Descripción |
| --- | --- |
| `-eq` | Igual a |
| `-ne` | Distinto de (no igual) |
| `-gt` | Mayor que |
| `-ge` | Mayor o igual que |
| `-lt` | Menor que |
| `-le` | Menor o igual que |

### Comparación de texto

| Operador | Descripción |
| --- | --- |
| `==` | Igual |
| `!=` | Distinto |
| `-z` | Vacío (longitud cero) |
| `-n` | No vacío (longitud mayor que cero) |
| `<` | Menor que (alfabéticamente, requiere doble corchete `[[ ]]`) |
| `>` | Mayor que (alfabéticamente, requiere doble corchete `[[ ]]`) |

### Operadores aritméticos

| Operador | Descripción |
| --- | --- |
| `+` | Suma |
| `-` | Resta |
| `*` | Multiplicación |
| `/` | División |
| `%` | Módulo (resto de la división) |

### Operadores lógicos

| Operador | Descripción |
| --- | --- |
| `!` | Negación (invierte el resultado) |
| `&&` | AND (ambas condiciones deben ser verdaderas) |
| `\|\|` | OR (al menos una condición debe ser verdadera) |

## Tipos de `read`

| Opción | Descripción |
| --- | --- |
| `read -s` | Modo oculto (no muestra lo que se escribe) |
| `read -p "Texto"` | Muestra un mensaje antes de leer |
| `read -sp "Texto"` | Combina oculto + mensaje (ideal para contraseñas) |
| `read -n [num]` | Limita la entrada a N caracteres |
| `read -t [seg]` | Define un tiempo de espera (timeout) |
| `read -r` | No interpreta barras invertidas (raw) |
| `read -a [array]` | Guarda las palabras en un arreglo |

## Tipos de `echo`

| Opción | Descripción |
| --- | --- |
| `echo "Texto"` | Imprime texto con salto de línea automático |
| `echo -n "Texto"` | Imprime sin salto de línea |
| `echo -e "Texto"` | Habilita caracteres especiales (`\n`, `\t`, `\a`, colores) |
| `echo -E "Texto"` | Deshabilita caracteres especiales (modo por defecto) |

**Caracteres especiales con `echo -e`:**

| Carácter | Descripción |
| --- | --- |
| `\n` | Salto de línea |
| `\t` | Tabulador |
| `\a` | Alerta sonora (pitido) |
| `\\` | Imprime una barra invertida |

## Argumentos y parámetros

> Los **parámetros posicionales** son argumentos que se pasan al script en orden. Bash los asigna a variables especiales (`$1`, `$2`, `$3`...).

| Variable | Descripción |
| --- | --- |
| `$0` | Nombre del script (o ruta completa) |
| `$1` | Primer argumento |
| `$2` | Segundo argumento |
| `$9` | Noveno argumento |
| `${10}` | Décimo argumento (a partir del 10 van entre llaves) |
| `$#` | Cantidad total de argumentos pasados |
| `$@` | Todos los argumentos como lista (separados individualmente) |
| `$*` | Todos los argumentos como una sola cadena |
| `$?` | Código de salida del último comando (`0` = éxito, distinto de `0` = error) |
| `$$` | PID del script actual |
| `$!` | PID del último proceso lanzado en segundo plano |
| `$USER` | Nombre del usuario que ejecuta el script |
| `$RANDOM` | Número aleatorio |

### Forma de ejecutar el script con argumentos

```bash
./miscript.sh param1 param2 param3
# Ejemplo:
./saludar.sh Juan Perez 25
```

### Reglas de oro

1. Los parámetros se separan por **espacios**.
2. Si un parámetro tiene espacios, usar **comillas** al ejecutar:
   ```bash
   ./script.sh "Buenos Aires" "San Francisco"
   # → $1 será "Buenos Aires" completo
   ```

### Desplazar parámetros (`shift`)

```bash
shift   # elimina el $1 actual y mueve todos a la izquierda ($2 pasa a $1)
        # útil para procesar listas largas de argumentos uno por uno
```

---

# Condicionales

## if-elif-else

```bash
if [ condición ]; then
    # código si es verdadero
elif [ otra_condición ]; then
    # código si la primera falló pero esta es verdadera
else
    # código si ninguna condición se cumplió
fi
```

## case

```bash
case $variable in
    "opcion1")
        # código si es opcion1
        ;;
    "opcion2" | "opcion3")
        # código si es opcion2 O opcion3
        ;;
    *)
        # código por defecto (ninguna opción coincidió)
        ;;
esac
```

---

# Bucles

> Los bucles permiten **repetir un bloque de código**.

## for

### Lista de elementos

```bash
for variable in lista; do
    # comandos
done
```

### Aritmético (estilo C)

```bash
for (( inicialización; condición; incremento )); do
    # comandos
done
```

## while

Se repite **mientras la condición sea verdadera**.

```bash
while [ condición ]; do
    # comandos
done
```

## until

Se repite **mientras la condición sea falsa**.

```bash
until [ condición ]; do
    # comandos (se ejecutan mientras la condición NO se cumpla)
done
```

## do-while

Ejecuta el bloque **al menos una vez**.

```bash
while true; do
    # comandos (siempre se ejecutan la primera vez)

    if [ condición_de_salida ]; then
        break
    fi
done
```

### Control de bucles

| Comando | Descripción |
| --- | --- |
| `continue` | Salta a la siguiente iteración (ignora el resto del bloque) |
| `break` | Sale del bucle inmediatamente |

---

# Funciones

> Las funciones agrupan **comandos reutilizables** en un bloque con nombre.

```bash
nombre_funcion() {
    # comandos
}

nombre_funcion   # llamar a la función
```

> El código de retorno (`$?`) indica si el último comando tuvo éxito: `0` = éxito, distinto de `0` = error.

---

# Cron Jobs (Tareas Programadas)

> Un **cron job** es una tarea programada que se ejecuta automáticamente en un sistema operativo tipo Unix (como Linux) en un momento predefinido.

```bash
crontab -l    # lista los procesos cron automatizados
crontab -e    # abre el editor para crear o editar un proceso cron
xdg-open ./   # abre el directorio actual en el explorador de archivos
```

## Sintaxis

Cada cron se define en **una sola línea** con el siguiente formato:

```
[Minutos] [Horas] [Día del mes] [Mes] [Día de la semana]
```

| Campo | Rango |
| --- | --- |
| Minutos | 0–59 |
| Horas | 0–23 |
| Día del mes | 1–31 |
| Mes | 1–12 |
| Día de la semana | 0–6 (0 = domingo, 6 = sábado) |

**Ejemplos:**

```bash
* * * * *      # se ejecuta cada minuto
*/5 * * * *    # cada 5 minutos
0 9 * * 1      # todos los lunes a las 9:00
0 0 1 * *      # el día 1 de cada mes a medianoche
* 8,12 * * *   # cada minuto de las horas 8 y 12
* * * * 1-5    # cada minuto de lunes a viernes
59 23 31 12 6  # a las 23:59 del 31 de diciembre si es sábado
```

## Definir un cron job

```bash
# 1. Abrir la tabla de cron
crontab -e

# 2. Definir la tarea (script + guardado del log)
* * * * * /ruta/completa/al/script.sh >> /ruta/completa/cron.log

# 3. Guardar y verificar
crontab -l
```

## Borrar la tabla de cron

```bash
crontab -l
```
