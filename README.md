# sttm
Simple terminal task manager

Usage:
```bash
sttm  [-h] add <string>|remove <number>|show|clear
```

where:

    -h                     show this help text
    
    add <string>           add a new task to the task list

    edit <number> <string> edit the number-th task of the list
    
    remove <number>        remove the number-th task of the list
    
    show                   show the whole task list
    
    clear                  clear the whole task list

# Installation

Simply, clone the repository to the user folder, give execution permissions to the install file, and execute it:

```bash
cd ~
git clone https://github.com/prototipo/sttm.git
cd sttm
chmod u+x install.sh
./install.sh
```

If you install sttm in this way, then you can use the aliases

```bash
$ t <string> # Add a task with the input string
$ et <number> <string> # Edit the number-th task
$ rt <number> # Removes the number-th task
$ st # Show all tasks
$ ct # Clear all tasks
```