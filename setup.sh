#!/usr/bin/env bash

# Function to display commands
exe() { echo "$@" ; "$@" ; }

if [[ -d ~/.vim ]]
then
	echo "~/.vim exists already. skipping."

else
	exe ln -s $(dirname "$BASH_SOURCE")/vim ~/.vim 
fi

# Xmonad
if [[ -f ~/.xmonad/xmonad.hs ]]
then
	echo "~/.xmonad/xmonad.hs exists already. skipping."

else
	exe mkdir -p ~/.xmonad
	exe ln -s $(dirname "$BASH_SOURCE")/xmonad.hs ~/.xmonad/xmonad.hs
fi

# Xmobar
if [[ -f ~/.xmobarrc ]]
then
	echo "~/.xmobarrc exists already. skipping."

else
	exe ln -s $(dirname "$BASH_SOURCE")/xmobarrc ~/.xmobarrc 
fi

# kitty
if [[ -d ~/.config/kitty ]]
then
	echo "~/.config/kitty exists already. skipping."

else
	exe mkdir -p ~/.config
	exe ln -s $(dirname "$BASH_SOURCE")/kitty ~/.config/kitty
fi

# tmux
if [[ -f ~/.tmux.conf ]]
then
	echo "~/.tmux.conf exists already. skipping."

else
	exe ln -s $(dirname "$BASH_SOURCE")/tmux.conf ~/.tmux.conf
fi
