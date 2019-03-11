# Paths
export ZSH="/home/tuan/.oh-my-zsh"
export PATH="$PATH:$HOME/.go/bin"
export GOPATH="$HOME/.go/"

# Alias
alias q="exit"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias xsel='xsel -ib'

# Theme
ZSH_THEME="agnoster"

# Plugins
plugins=(
    git
    history
)

# Source
source $ZSH/oh-my-zsh.sh

