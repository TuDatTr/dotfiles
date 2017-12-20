#!/bin/bash

# A script to manage my dotfiles and copy them to my git
dotfiles=$HOME/workspace/Git/dotfiles

copy(){
    rsync -avv $HOME/$1 $dotfiles/$1
}

copy_test(){
    echo rsync -a $HOME/$1 $dotfiles/$1
}

# i3 gaps
# Powerline fonts must be installed

printf "\nCopying i3 configs...\n"
copy .config/i3/

# Termite

printf "\nCopying Termite configs...\n"
copy .config/termite/

# Git
printf "\nCopying Git configs...\n"
copy .gitignore
copy .gitconfig

# Scripts
printf "\nCopying Scripts...\n"
copy .scripts/

# zsh
printf "\nCopying zsh configs...\n"
copy .zshrc

# Emacs
# printf "For Emacs (with elpy) following python modules are needed: jedi rope importmagic autopep8 yapf flake8"
# printf "You must also add '~/.local/bin' to your path."
printf "\nCopying emacs configs...\n"
copy .emacs
copy .emacs.d/





