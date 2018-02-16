#!/bin/bash

# Simple terminal task manager

# https://github.com/prototipo/sttm

usage="Usage: $(basename "$0")  [-h] add <string>|remove <number>|show|clear

where:
    -h                      show this help text
    add <string>            add a new task to the task list
    edit <number> <string>  edit the number-th task of the list
    remove <number>         remove the number-th task of the list
    show                    show the whole task list
    clear                   clear the whole task list"

tasks_file="$HOME/sttm/tasks"

if [ $# -lt 1 ]; then
    echo "$usage"
    exit 1
fi

case "$1" in
    -h)
	echo "$usage"
	exit
	;;
    
    add)
	if [ $# -lt 2 ]; then
	    echo "$usage"
	    exit 1
	else
	    echo "${@:2}" >> $tasks_file
	fi
	exit
	;;

    edit)
	if [ $# -lt 3 ]; then
	    echo "$usage"
	    exit 1
	else
	    re='^[0-9]+$'
	    d='d'
	    rest="${@:3}"
	    if [[ $2 =~ $re ]] && [ $2 -le $(wc -l < $tasks_file) ]; then
		# sed -i "$2$d" $tasks_file
		sed -i "$2s/.*/$rest/" $tasks_file
		exit
	    else
		echo "$usage"
		exit 1
	    fi
	fi
	exit
	;;
    
    remove)
	if [ $# -lt 2 ]; then
	    echo "$usage"
	    exit 1
	else
	    re='^[0-9]+$'
	    d='d'
	    if [[ $2 =~ $re ]] && [ $2 -le $(wc -l < $tasks_file) ]; then
		sed -i "$2$d" $tasks_file
		exit
	    else
		echo "$usage"
		exit 1
	    fi
	fi
	exit
	;;
    show)
	exec<$tasks_file
	count=0

	echo "TODO list:"
	while read LINE
	do
	    count=$(( $count + 1))
	    echo "$count) $LINE"
	done
	exit
	;;

    clear)
	rm $tasks_file
	touch $tasks_file
	exit
	;;

esac
