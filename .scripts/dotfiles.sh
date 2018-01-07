#!/bin/bash

# A script to manage my dotfiles and copy them to my git
dotfiles=$HOME/workspace/Git/TuDatTr/dotfiles

# -avv for debugging purposes
# -a for normal use
copy(){
#    rsync -avv $HOME/$1 $dotfiles/$1
    rsync -a $HOME/$1 $dotfiles/$1
}

notify-send "Copied dotfiles."

# i3 gaps
# Powerline fonts must be installed
printf "\nCopying i3 configs...\n"
copy .config/i3/

# Termite
printf "\nCopying Termite configs...\n"
copy .config/termite/

# Scripts
printf "\nCopying Scripts...\n"
copy .scripts/

# zsh
printf "\nCopying zsh configs...\n"
copy .zshrc
copy .warprc

# Emacs
# printf "For Emacs (with elpy) following python modules are needed: jedi rope importmagic autopep8 yapf flake8"
# printf "You must also add '~/.local/bin' to your path."
printf "\nCopying emacs configs...\n"
copy .emacs
copy .emacs.d/snippets/

# Latex templates
copy Templates/
