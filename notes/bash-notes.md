# Bash Notes

## Table of Contents

- [Basic Commands](#basic-commands)
- [File Management](#file-management)
- [Text Editors](#text-editors)
- [Redirections & Pipes](#redirections--pipes)
- [Environment Variables](#environment-variables)
- [Permissions & Ownership](#permissions--ownership)
- [Processes & Jobs](#processes--jobs)
- [History & Aliases](#history--aliases)
- [Scripting Basics](#scripting-basics)
- [Conditionals](#conditionals)
- [Loops](#loops)
- [Functions](#functions)
- [Cron Jobs](#cron-jobs)
- [Exercises](#exercises)

---

## Basic Commands

### Hello World

```bash
echo "Hello, BASH"
echo $SHELL    # show current shell
echo $0        # show current process name
```

### Navigation

```bash
pwd            # show current directory
ls             # list files
ls -l          # list with details
ls -a          # include hidden files
ls -la         # details + hidden
ls -lh         # human-readable sizes
```

```bash
cd dir         # enter directory
cd ..          # go up one level
cd ~           # go to home
cd [TAB]       # path autocomplete
cd dir/dir/dir # nested navigation
```

> **Absolute path:** starts from root (`/`). Example: `/home/user/documents`
> **Relative path:** starts from current directory. Example: `../scripts`

### System Info

```bash
whoami         # current user
cal            # calendar
date           # current date/time
uptime         # system uptime
hostname       # machine name
uname -a       # full system info
clear          # clear screen
```

### Command Anatomy

```
command [options] [arguments]
```

### Help & Documentation

```bash
man ls         # manual page
ls --help      # quick help
ls -h          # short help flag
```

---

## File Management

### System Directories

| Directory | Description |
| --- | --- |
| `/` | Root (main directory) |
| `/home` | User personal folders |
| `/etc` | System configuration files |
| `/bin` | Essential system commands |
| `/usr` | User-installed programs |
| `/var` | Variable data (logs, databases) |
| `/tmp` | Temporary files |

### File & Directory Operations

```bash
mkdir dir                      # create directory
touch file.txt                 # create empty file
rm file.txt                    # delete file (not directories)
rmdir dir                      # delete empty directory
rm -r dir                      # delete directory recursively
rm -ri dir                     # recursive with confirmation
rm -rf dir                     # force delete, no confirmation
rm -f file.txt                 # force delete file (no error if missing)
```

```bash
cp source.txt dest.txt         # copy file
cp -r dir copy_dir             # copy directory with all contents
cp -a dir dest_dir             # copy preserving all attributes
```

```bash
mv file.txt dir/               # move file to another directory
mv dir/file.txt ./             # move to current directory
mv file.txt new_name.txt       # rename file
```

### Wildcards

| Pattern | Description |
| --- | --- |
| `ls *.ext` | Files with that extension |
| `ls 03*` | Files starting with `03` |
| `ls 03*.txt` | Files starting with `03` ending in `.txt` |
| `ls ????*` | Files with at least 4 characters |
| `ls ????.ext` | Exactly 4 characters plus extension |
| `ls D*?` | Starts with `D` and has at least 2 characters |

### Advanced Listing

```bash
tree                    # visual directory tree
tree -a                 # tree including hidden files
find . -name "file*"    # search files by name from current directory
```

---

## Text Editors

### nano

| Shortcut | Action |
| --- | --- |
| `Ctrl + W` | Search text |
| `Ctrl + K` | Cut line |
| `Ctrl + U` | Paste line |
| `Ctrl + O` | Save |
| `Ctrl + X` | Exit |

### vim

> vim has three modes: **Normal → Insert (`i`) → Command (`:`)**

**In normal mode:**

| Key | Action |
| --- | --- |
| `h / l / k / j` | Left / right / up / down |
| `/` | Search text |
| `dd` | Delete line |
| `yy` | Copy line |
| `p` | Paste line |
| `u` | Undo |
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |

---

## Redirections & Pipes

| Operator | Description |
| --- | --- |
| `>` | Redirect output to file (overwrites) |
| `>>` | Redirect and append to file |
| `<` | Take input from file |

```bash
echo "Hello" > new.txt                    # create/overwrite file
tree >> new.txt                           # append to file
sort < new.txt                            # sort using file as input
cat file.txt | grep "dir" | wc -w         # chain commands with pipes
```

### Reading File Content

| Command | Description |
| --- | --- |
| `cat` | Show full file content |
| `less` | Paginated view (`q` to quit) |
| `more` | Similar to `less`, more basic |
| `head` | Show first 10 lines |
| `head -n 15` | Show first 15 lines |
| `tail` | Show last 10 lines |
| `tail -n 15` | Show last 15 lines |
| `tail -f` | Follow file in real time (useful for logs) |

### Search

```bash
grep "word" file.txt          # search for "word" in file
grep -i "word" file.txt       # case-insensitive search
grep -r "word" dir            # recursive search in directory
grep -ri "word" dir           # recursive + case-insensitive
grep -v "word" file.txt       # show lines that do NOT contain "word"
grep -n "word" file.txt       # show line numbers with results
```

```bash
wc         # count lines, words and characters
wc -l      # lines only
wc -w      # words only
wc -c      # characters only
```

---

## Environment Variables

### Global

```bash
echo $HOME     # user home directory
echo $PATH     # paths where the system looks for executables
```

### Local

```bash
name="GG"
echo $name     # local variables exist only in the current session
```

---

## Permissions & Ownership

### Permission Types

**Symbolic mode:**

| Symbol | Permission |
| --- | --- |
| `r` | Read |
| `w` | Write |
| `x` | Execute |

**Octal mode:**

| Value | Permission |
| --- | --- |
| `4` | Read (`r`) |
| `2` | Write (`w`) |
| `1` | Execute (`x`) |

### User Types

| Symbol | Description |
| --- | --- |
| `u` | Owner (user) |
| `g` | Group |
| `o` | Others |
| `a` | All |

### Viewing Permissions

```bash
ls -l          # files
ls -ld dir     # directories
```

### Permission Output Format

```
-rwxr-xr-x 1 user

[-][rwx][r-x][r-x]
 ↑   ↑     ↑     ↑
 │   │     │     └── Others permissions (third block)
 │   │     └──────── Group permissions (second block)
 │   └────────────── Owner permissions (first block)
 └────────────────── File type
```

**File type (first character):**

| Symbol | Type |
| --- | --- |
| `-` | Regular file |
| `d` | Directory |
| `l` | Symbolic link |
| `b` | Block device |
| `c` | Character device |
| `s` | Socket |
| `p` | Pipe |

### Octal Mode

Permissions are represented with **3 digits** → `[owner][group][others]`. Each number is the **sum** of each permission's value:

| Value | Sum | Symbolic |
| --- | --- | --- |
| `7` | 4+2+1 (read + write + execute) | `rwx` |
| `6` | 4+2 (read + write) | `rw-` |
| `5` | 4+1 (read + execute) | `r-x` |
| `4` | 4 (read only) | `r--` |
| `3` | 2+1 (write + execute) | `-wx` |
| `2` | 2 (write only) | `-w-` |
| `1` | 1 (execute only) | `--x` |

**Examples:**
- `777`: all users have read, write and execute.
- `764`: owner `rwx` (7), group `rw-` (6), others `r--` (4).

### Changing Permissions

**`chmod`** — changes file and directory permissions.

**Symbolic mode:**

```bash
chmod u+x file.txt    # add execute for owner
chmod u-x file.txt    # remove execute from owner
chmod u=x file.txt    # set exactly execute for owner
```

**Octal mode:**

```bash
chmod 777 file.txt
mkdir -m 700 folder    # create directory with specific permissions
```

### Changing Owner & Group

```bash
chown user2:group file.txt    # change owner and group
sudo chgrp new_group file.txt # change group only
```

### Listing Users & Groups

```bash
cat /etc/passwd | cut -d: -f1    # list available users
cat /etc/group | cut -d: -f1     # list available groups
```

### Permission Mask (umask)

> Defines the permissions **subtracted by default** when creating new files or directories.

```bash
umask    # show current mask
```

**Example with `umask 0002`:**

| Type | Calculation | Result |
| --- | --- | --- |
| Directory | `777 - 002` | `775` → `rwxrwxr-x` |
| File | `666 - 002` | `664` → `rw-rw-r--` |

---

## Processes & Jobs

```bash
ps             # current user processes
ps aux         # all system processes
top            # real-time process monitor
htop           # interactive monitor (more visual than top)
free           # RAM usage
free -h        # human-readable format (MB, GB)
df -h          # disk space by partition
du -sh *       # size of each item in current directory
du -sh         # total size in human-readable format
```

### Foreground & Background

> - **Foreground:** default state. Shell blocks until process ends.
> - **Background:** process runs in parallel, shell is free for new commands.
> - **Stopped:** process is paused but stays in memory and can be resumed.

```bash
jobs             # list active jobs
sleep 100        # simulate a process that "sleeps" N seconds
# Ctrl + Z      → suspend foreground process
bg %1            # resume job 1 in background
fg %1            # bring job 1 to foreground
sleep 100 &      # launch process directly in background
```

**Example:**

```bash
$ sleep 50 &
[1] 1234    # "1234" is the process PID
```

### Killing Processes

```bash
kill PID         # send termination signal to process
kill -9 PID      # force immediate termination
```

---

## History & Aliases

```bash
history               # show command history
!!                    # repeat last command
!10                   # run command number 10 from history
!ls                   # run last command that started with "ls"
history -cw           # permanently clear history from disk
```

```bash
alias                            # list all active aliases
alias name='ls -la'              # create temporary alias (session only)
name                             # use the alias
unalias name                     # remove alias
```

---

## Scripting Basics

> A **script** is a text file with commands that the shell executes sequentially.

### Creating a Script

The extension is `.sh`.

```bash
nano my_script.sh
```

**Shebang** (mandatory first line in all bash scripts):

```bash
#!/bin/bash

# → comment in bash
```

Give execute permission:

```bash
chmod u+x my_script.sh
```

Run the script:

```bash
./my_script.sh    # "./" refers to the current directory
```

### Reading Input

```bash
read -p "What is your age? " age   # show message and save answer in "age"
```

### read Options

| Option | Description |
| --- | --- |
| `read -s` | Silent mode (input not shown) |
| `read -p "Text"` | Show message before reading |
| `read -sp "Text"` | Silent + message (ideal for passwords) |
| `read -n [num]` | Limit input to N characters |
| `read -t [sec]` | Set a timeout |
| `read -r` | Raw mode (no backslash interpretation) |
| `read -a [array]` | Save words into an array |

### echo Options

| Option | Description |
| --- | --- |
| `echo "Text"` | Print text with automatic newline |
| `echo -n "Text"` | Print without newline |
| `echo -e "Text"` | Enable special characters (`\n`, `\t`, `\a`, colors) |
| `echo -E "Text"` | Disable special characters (default mode) |

**Special characters with `echo -e`:**

| Character | Description |
| --- | --- |
| `\n` | Newline |
| `\t` | Tab |
| `\a` | Alert (beep) |
| `\\` | Print a backslash |

### Comparison Operators

#### File Comparison

| Operator | Description |
| --- | --- |
| `-e` | Exists (file or directory) |
| `-f` | Is a regular file |
| `-d` | Is a directory |
| `-s` | File is NOT empty |
| `-r` | You have read permission |
| `-w` | You have write permission |
| `-x` | You have execute permission |

#### Number Comparison (integers)

| Operator | Description |
| --- | --- |
| `-eq` | Equal to |
| `-ne` | Not equal to |
| `-gt` | Greater than |
| `-ge` | Greater than or equal |
| `-lt` | Less than |
| `-le` | Less than or equal |

#### String Comparison

| Operator | Description |
| --- | --- |
| `==` | Equal |
| `!=` | Not equal |
| `-z` | Empty (zero length) |
| `-n` | Not empty (length greater than zero) |
| `<` | Less than (alphabetically, requires `[[ ]]`) |
| `>` | Greater than (alphabetically, requires `[[ ]]`) |

#### Arithmetic Operators

| Operator | Description |
| --- | --- |
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `%` | Modulo (remainder) |

#### Logical Operators

| Operator | Description |
| --- | --- |
| `!` | Negation (inverts result) |
| `&&` | AND (both conditions must be true) |
| `\|\|` | OR (at least one condition must be true) |

### Special Variables (Arguments & Parameters)

| Variable | Description |
| --- | --- |
| `$0` | Script name (or full path) |
| `$1` | First argument |
| `$2` | Second argument |
| `${10}` | Tenth argument (use braces from 10 onwards) |
| `$#` | Total number of arguments passed |
| `$@` | All arguments as a list (individually separated) |
| `$*` | All arguments as a single string |
| `$?` | Exit code of last command (`0` = success, non-zero = error) |
| `$$` | PID of current script |
| `$!` | PID of last background process |
| `$USER` | Name of user running the script |
| `$RANDOM` | Random number |

**Running a script with arguments:**

```bash
./myscript.sh param1 param2 param3
```

**Shifting parameters:**

```bash
shift   # removes current $1 and shifts all parameters left ($2 becomes $1)
```

---

## Conditionals

### if-elif-else

```bash
if [ condition ]; then
    # code if true
elif [ other_condition ]; then
    # code if first failed but this is true
else
    # code if no condition was met
fi
```

### case

```bash
case $variable in
    "option1")
        # code for option1
        ;;
    "option2" | "option3")
        # code for option2 OR option3
        ;;
    *)
        # default code (no option matched)
        ;;
esac
```

---

## Loops

> Loops allow **repeating a block of code**.

### for

**List of elements:**

```bash
for variable in list; do
    # commands
done
```

**C-style arithmetic:**

```bash
for (( init; condition; increment )); do
    # commands
done
```

### while

Repeats **while the condition is true**.

```bash
while [ condition ]; do
    # commands
done
```

### until

Repeats **while the condition is false**.

```bash
until [ condition ]; do
    # commands (run while condition is NOT met)
done
```

### do-while

Executes the block **at least once**.

```bash
while true; do
    # commands (always run at least once)

    if [ exit_condition ]; then
        break
    fi
done
```

### Loop Control

| Command | Description |
| --- | --- |
| `continue` | Skip to next iteration |
| `break` | Exit the loop immediately |

---

## Functions

> Functions group **reusable commands** in a named block.

```bash
function_name() {
    # commands
}

function_name   # call the function
```

> The return code (`$?`) indicates if the last command succeeded: `0` = success, non-zero = error.
> Variables declared with `local` only live inside the function; external variables are global.

---

## Cron Jobs

> A **cron job** is a scheduled task that runs automatically on a Unix-like system at a predefined time.

```bash
crontab -l    # list scheduled cron jobs
crontab -e    # open editor to create or edit a cron job
```

### Syntax

Each cron job is defined in **one line** with this format:

```
[Minutes] [Hours] [Day of month] [Month] [Day of week] /path/to/script.sh
```

| Field | Range |
| --- | --- |
| Minutes | 0–59 |
| Hours | 0–23 |
| Day of month | 1–31 |
| Month | 1–12 |
| Day of week | 0–6 (0 = Sunday, 6 = Saturday) |

**Examples:**

```bash
* * * * *      # every minute
*/5 * * * *    # every 5 minutes
0 9 * * 1      # every Monday at 9:00
0 0 1 * *      # 1st of every month at midnight
* 8,12 * * *   # every minute during hours 8 and 12
* * * * 1-5    # every minute Monday through Friday
```

### Setting Up a Cron Job

```bash
# 1. Open the cron table
crontab -e

# 2. Define the task (script + log output)
* * * * * /full/path/to/script.sh >> /full/path/to/cron.log 2>&1

# 3. Save and verify
crontab -l
```

---

## Exercises

### Basic Commands

**1. Show the current directory**

```bash
pwd
```

**2. List files and folders (simple and with details)**

```bash
ls
ls -l
```

**3. Navigate to home directory then go up one level**

```bash
cd ~
cd ..
```

**4. Create a directory called "exercises"**

```bash
mkdir exercises
```

**5. Create an empty file called "note.txt" then delete it**

```bash
touch note.txt
rm note.txt
```

**6. List files using wildcards**

```bash
ls *.txt
ls ????*
```

**7. Delete a directory recursively**

```bash
rm -r dir
```

**8. Delete all files of the same type**

```bash
rm -f ????*.txt
```

**9. Use the `tree` command**

```bash
tree
tree -a
```

**10. Search for a specific file using `find`**

```bash
find . -name "exercises.txt"
```

---

### Advanced Commands

**1. Show full content of a file**

```bash
cat commands.txt
```

**2. Show paginated content of a file**

```bash
less commands.txt
```

**3. Show the first 15 lines of a file**

```bash
head -n 15 commands.txt
```

**4. Show the last 15 lines of a file**

```bash
tail -n 15 commands.txt
```

**5. Search for a word in a file**

```bash
grep "who" commands.txt
```

**6. Count the lines of a file**

```bash
wc -l commands.txt
```

**7. Redirect output and save it to a file**

```bash
tree > new.txt
```

**8. Append new output to the previous file**

```bash
ls -la >> new.txt
```

**9. Chain 3 commands**

```bash
echo "Hello bro?" | grep "bro" | wc -l
```

**10. Create a local variable and display it**

```bash
user="local"
echo $user
```

---

### Text Editors

**nano**

- Create a file called `note.txt` and write three lines of text.
- Open `note.txt`, add a line at the end and save changes.
- Open a new file called `reminder.txt`, write something and exit without saving.
- Search for a specific word in an existing file.
- Cut a line and paste it somewhere else.

**vim**

- Create `notes.txt`, enter insert mode and write a sentence.
- Move the cursor without using arrow keys (`h`, `j`, `k`, `l`).
- Delete a complete line and undo the change.
- Copy a line and paste it below.
- Save changes and quit.

---

### Permissions

**Create a file and view its permissions**

```bash
touch file.txt
ls -l file.txt
```

**Add execute permission for owner only (symbolic)**

```bash
chmod u+x file.txt
```

**Change permissions to `644`**

```bash
chmod 644 file.txt
```

**Remove group permissions**

```bash
chmod g-rwx file.txt
```

**Make it executable by owner only**

```bash
chmod 700 file.txt
```

**Create a folder accessible only by the owner**

```bash
mkdir -m 700 example_folder
```

**Change owner to another user**

```bash
sudo chown other_user:other_group file.txt
```

**Check current umask and calculate default permissions**

```bash
umask 027   # files → 640 | directories → 750
```

**Change mask, create a file and check default permissions**

```bash
umask 000
touch new_file.txt
ls -l new_file.txt
```

---

### Processes & Aliases

**1. Show all system processes**

```bash
ps aux
```

**2. Show interactive process monitor**

```bash
htop
```

**3. Use the `free` command properly**

```bash
free -h
```

**4. Launch `sleep 100`, suspend it, send to background, bring to foreground**

```bash
sleep 100
# Ctrl + Z
bg %1
fg %1
```

**5. Launch a process like `sleep` and kill it using its PID**

```bash
sleep 50 &
kill <PID>
```

**6. Check disk space**

```bash
df -h
```

**7. Check command history**

```bash
history
```

**8. Repeat the last command**

```bash
!!
```

**9. Create and test an alias**

```bash
alias update='sudo apt update && sudo apt upgrade -y'
update
```

**10. Remove the alias you just created**

```bash
unalias update
```
