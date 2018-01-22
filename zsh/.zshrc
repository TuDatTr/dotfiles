# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy.mm.dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    history
    sudo
    wd
    web-search
)

# User configuration

#POWERLEVEL

POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

POWERLEVEL9K_STATUS_OK_BACKGROUND="blue"
POWERLEVEL9K_STATUS_OK_FOREGROUND="orange"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="blue"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

#POWERLEVEL9K_BATTERY_BACKGROUND="color6"
#POWERLEVEL9K_BATTERY_DISCONNECTED="color6"
#POWERLEVEL9K_BATTERY_STAGES="▁▂▃▄▅▆▇█"

POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="color7"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S} "

# PATHS
export TERM="xterm-256color" # in case you are using urxvt, to bypass an error during sshing
PATH=$PATH:~/.local/bin

# User alias
alias df="df -h"
alias mkvirtenv="python -m virtualenv --system-site-packages"
alias e="emacsclient -t"
alias nyan="nyancat"
alias rm="rm -i"
alias dir="du -h -d 1"
alias -s tex=emacs
alias -s cpp=emacs
alias org="e ~/Nextcloud/orgs/man.org"
alias neofetch="neofetch --block_range 0 16"
alias diff="diff -s"

source $ZSH/oh-my-zsh.sh
export GPG_TTY=$(tty)
