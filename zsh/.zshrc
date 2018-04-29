export ZSH=$HOME/.oh-my-zsh

plugins=(
    git
    history
    sudo
    wd
    web-search
)

ZSH_THEME="powerlevel9k/powerlevel9k"
HIST_STAMPS="yyyy.mm.dd"

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

# Alias
alias df="df -h"
alias mkvirtenv="python -m virtualenv --system-site-packages"
alias e="emacsclient -t"
alias ek="pkill emacs"
alias ed="emacs --daemon"
alias nyan="nyancat"
alias rm="rm -i"
alias -s tex=e
alias -s cpp=e
alias -s org=e
alias diff="diff -s"
alias budget="e $HOME/Nextcloud/orgs/Budget/MyBudget.ledger"
alias q="exit"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias steam='steam -silent %U'
source $ZSH/oh-my-zsh.sh

# Variables
export TERM="xterm-256color" # in case you are using urxvt, to bypass an error during sshing
export GPG_TTY=$(tty)
export LC_ALL=en_GB.UTF-8
PATH=$PATH:$HOME/.local/bin:/usr/lib/jvm/java-10-openjdk/bin
export EDITOR='emacsclient -t'
export DEFAULT_EDITOR='emacsclient -t'
export VISUAL='emacsclient -ct'
export VISUAL_EDITOR='emacsclient -ct'
export STEAM_FRAME_FORCE_CLOSE=1
