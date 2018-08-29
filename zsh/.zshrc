export ZSH=$HOME/.oh-my-zsh

plugins=(
    git
    history
    sudo
)

ZSH_THEME="powerlevel9k/powerlevel9k"

#POWERLEVEL
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

POWERLEVEL9K_STATUS_OK_BACKGROUND="blue"
POWERLEVEL9K_STATUS_OK_FOREGROUND="orange"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="blue"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="color7"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

POWERLEVEL9k_SHORTEN_STRATEGY="trunctuate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Alias
alias matrix="cmatrix"
alias df="df -h"
alias mkvirtenv="python -m virtualenv --system-site-packages"
alias e="emacsclient -t"
alias ek="pkill emacs"
alias ej="emacs --daemon"
alias nyan="nyancat"
alias rm="rm -I"
alias -s tex=vim
alias -s cpp=vim
alias -s org=vim
alias diff="diff -s"
alias stunden="et $HOME/Nextcloud/Arbeit/Stunden/Stundenzettel.xlsx &; disown %1;"
alias budget="emacs -nw $HOME/Nextcloud/orgs/Budget/MyBudget.ledger"
alias vudget="vim $HOME/Nextcloud/orgs/Budget/MyBudget.ledger"
alias q="exit"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias steam='steam'
alias vrc='vim ~/.vimrc'
alias erc='emacs -nw ~/.emacs.d/config.org'
alias mp3='youtube-dl  -x --audio-format mp3 -o "./%(title)s.%(ext)s"'
alias zrc='vim ~/.zshrc'
alias vpn_eu='sudo openvpn  --config Downloads/AirVPN_Europe_UDP-443.ovpn'
alias vpn_us='sudo openvpn  --config Downloads/AirVPN_America_UDP-443.ovpn'
source $ZSH/oh-my-zsh.sh

# Variables
export TERM="xterm-256color" # in case you are using urxvt, to bypass an error during sshing
export GPG_TTY=$(tty)
export LC_ALL=en_GB.UTF-8
PATH=$PATH:$HOME/.local/bin:/usr/lib/jvm/java-10-openjdk/bin
export EDITOR='vim'
export DEFAULT_EDITOR=$EDITOR
export VISUAL=$EDITOR
export VISUAL_EDITOR=$EDITOR
export STEAM_FRAME_FORCE_CLOSE=1
export HIGHLIGHT_DATADIR="~/.config/highlight/"
export GOPATH="$HOME/workspace/go/"

# Functions
