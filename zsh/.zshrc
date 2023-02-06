# Paths
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.dotnet/tools:$HOME/.emacs.d/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PenTestTools=$HOME/Local/PenTesting/
export CTF=$HOME/Documents/CTF/
export WORKSPACE=$HOME/workspace_l
export ZSHRC="$HOME/.zshrc"
export VISUAL="emacsclient -t"
export EDITOR="emacsclient -t"


# History
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# Alias
alias q="exit"
alias b="byobu"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias xsel='xsel -ib'
alias msfconsole="msfconsole -x \"db_connect metasploit@msf\""
alias nmap="nmap -T5 --min-parallelism 100 -Pn"
alias ed="\emacs --daemon"
alias e="open_emacs"
alias df="df -h"
alias picpaste="xclip -selection clipboard -t image/png -o"
alias eledger="e ~/Documents/Finanzen/Ledger/MyBudget.ledger"
alias sshconfig="e ~/.ssh/config"
alias econfig="e ~/.doom.d/init.el"
alias wttr="curl wttr.in/Essen"
alias tvres="xrandr --output HDMI1 --transform 1.02,0,-20,0,1.02,-10,0,0,1"
alias defaultres="xrandr --output HDMI1 --transform 1.00,0,0,0,1.00,0,0,0,1"
alias zshconfig="e ~/.zshrc; source ~/.zshrc;"
alias notify="dunstify \"ping~\""
alias ekill="e -e \"(kill-emacs)\"; ed"
alias latexmk="latexmk -f -pdf -interaction=nonstopmode"
alias picotik="picocom --b 115200 /dev/ttyUSB0"

# Theme
ZSH_THEME="agnoster"

# Plugins
plugins=(
    git
    history
    z
)

randpw() { < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$1};echo;};

# Source
source $ZSH/oh-my-zsh.sh

open_emacs() { emacsclient -c $1 & disown; };
