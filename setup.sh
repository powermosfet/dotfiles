#!/usr/bin/env bash

# Function to display commands
exe() { echo "$@" ; "$@" ; }

if [[ -d ~/.vim ]]
then
	echo "~/.vim exists already. skipping."

else
	exe ln -s $(dirname "$BASH_SOURCE")/vim ~/.vim 
fi
