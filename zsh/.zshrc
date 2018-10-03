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
alias -s cpp=vim
alias -s org=vim
alias -s tex=vim
alias budget="emacs -nw $HOME/Nextcloud/orgs/Budget/MyBudget.ledger"
alias df="df -h"
alias diff="diff -s"
alias e="emacsclient -t"
alias ej="emacs --daemon"
alias ek="pkill emacs"
alias erc='emacs -nw ~/.emacs.d/config.org'
alias matrix="cmatrix"
alias mkvirtenv="python -m virtualenv --system-site-packages"
alias mp3='youtube-dl  --embed-thumbnail -x --audio-format mp3 -o "./%(title)s.%(ext)s"'
alias nyan="nyancat"
alias pastebin='vim ~/Nextcloud/pastebin.txt'
alias q="exit"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rm="rm -I"
alias steam='steam'
alias vpn_eu='sudo openvpn  --config Downloads/AirVPN_Europe_UDP-443.ovpn'
alias vpn_us='sudo openvpn  --config Downloads/AirVPN_America_UDP-443.ovpn'
alias vrc='vim ~/.vimrc'
alias vudget="vim $HOME/Nextcloud/orgs/Budget/MyBudget.ledger"
alias watch='watch --color'
alias zrc='vim ~/.zshrc'
alias wallpaper='~/.scripts/colorscheme.sh'


source $ZSH/oh-my-zsh.sh

# Variables
PATH=$PATH:$HOME/.local/bin:/usr/lib/jvm/java-10-openjdk/bin
export DEFAULT_EDITOR=$EDITOR
export EDITOR='vim'
export GOPATH="$HOME/workspace/go/"
export GPG_TTY=$(tty)
export HIGHLIGHT_DATADIR="~/.config/highlight/"
export LC_ALL=en_US.UTF-8
export STEAM_FRAME_FORCE_CLOSE=1
export TERM="xterm-256color" # in case you are using urxvt, to bypass an error during sshing
export VISUAL=$EDITOR
export VISUAL_EDITOR=$EDITOR

# Functions
