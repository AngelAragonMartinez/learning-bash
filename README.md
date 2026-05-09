# learning-bash

A collection of Bash notes and practice scripts written while learning shell scripting.

## Contents

```
learning-bash/
├── notes/
│   └── bash-notes.md        # Consolidated reference: commands, operators, scripting, exercises
└── scripts/
    ├── script_apuntes.sh          # Variables, arithmetic, input reading, arguments
    ├── script_condicionales.sh    # Conditionals: if-elif-else, case, file checks
    ├── script_bucles.sh           # Loops: for, while, until, break/continue
    ├── script_funciones.sh        # Functions, local/global variables, error handling
    ├── script_ejercicios.sh       # Practical exercises: I/O, arithmetic, file creation
    ├── script_ejercicios_logica.sh  # Exercises: conditionals, loops, functions combined
    └── script_ejercicios_cron_jobs.sh  # Scripts designed for cron job automation
```

## How to Run the Scripts

1. Give execute permission (first time only):

```bash
chmod +x scripts/script_name.sh
```

2. Run a script:

```bash
./scripts/script_name.sh
```

3. Some scripts accept positional arguments:

```bash
./scripts/script_ejercicios.sh arg1 arg2 arg3
```

## Notes

- All scripts require `#!/bin/bash` and were written for Linux/Bash environments.
- `script_ejercicios_cron_jobs.sh` contains scripts meant to be scheduled via `crontab -e`, not run directly.
- See `notes/bash-notes.md` for the full reference with commands, operators, and exercises.
