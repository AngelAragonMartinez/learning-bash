# Bash Notes

## Basic Commands

### Hello World
- `echo "Hola, BASH"` — print text
- `echo $SHELL` — show current shell
- `echo $0` — show shell name

### Navigation
- `pwd` — show current directory
- `ls` / `ls -l` / `ls -a` / `ls -la` / `ls -lh` — list files
- `cd dir` — enter directory
- `cd ..` — go up one level
- `cd ~` — go to home

### Basic Commands
- `whoami` — current user
- `cal` — calendar
- `date` — current date/time
- `uptime` — system uptime
- `hostname` — machine name
- `uname -a` — system info
- `clear` — clear screen

### Help
- `man ls` — manual
- `ls --help` — quick help

---

## File Management

### Default Directories
- `/` — root
- `/home` — user files
- `/etc` — config files
- `/bin` — binaries
- `/usr` — user programs
- `/var` — variable data
- `/tmp` — temporary files

### File & Directory Operations
- `mkdir dir` — create directory
- `touch file` — create empty file
- `rm file` — delete file
- `rmdir dir` — delete empty directory
- `rm -r dir` — delete directory recursively
- `rm -ri dir` — delete with confirmation
- `rm -rf dir` — force delete
- `cp file copy.txt` — copy file
- `cp -r dir newdir` — copy directory
- `mv file dir/` — move file
- `mv file newname.txt` — rename file

### Wildcards
- `ls *.txt` — all .txt files
- `ls 03*` — files starting with 03
- `ls ????*` — files with 4+ chars

### Advanced Listing
- `tree` — directory tree
- `tree -a` — include hidden
- `find . -name "file*"` — search by name

---

## Exercises

### Navigation
1. `pwd` — show current directory
2. `cd ~/Documents` — go to Documents
3. `cd /mnt/c/Users/Angel/Documents/` — absolute path
4. `cd ..` — go up one level
5. `ls` / `ls -l` / `ls -la` — list variations
6. `man ls` — read manual
7. `git --help` — command help
8. `whoami && date && cal` — user, date, calendar
9. `cd Documents/curso_mouredev/curso_bash/`
10. `clear`

### File Management
1. `mkdir dir` — create directory
2. `rmdir dir` — delete empty directory
3. `cp file file && cp file ../../ruta` — copy file
4. `mv ../file.txt file.txt` — move file
5. `mv file.txt newname.txt` — rename
6. `ls ????*sav` — wildcard list
7. `rm -r dir` — recursive delete
8. `rm -f ????*.txt` — delete by pattern
9. `tree` / `tree -a`
10. `find . -name "ejercicios.txt.save"`
