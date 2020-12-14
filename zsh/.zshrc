# Paths
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.dotnet/tools:$HOME:.scripts/"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PenTestTools=$HOME/Local/PenTesting/
export CTF=$HOME/Documents/CTF/
export WORKSPACE=$HOME/workspace_l
export ZSHRC="$HOME/.zshrc"
export VISUAL="emacsclient -t"

# Alias
alias q="exit"
alias b="byobu"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias xsel='xsel -ib'
alias msfconsole="msfconsole -x \"db_connect metasploit@msf\""
alias nmap="nmap -T5 --min-parallelism 100 -Pn"
alias ed="\emacs --daemon"
alias e="emacsclient -t"

# Theme
ZSH_THEME="agnoster"

# Plugins
plugins=(
    git
    history
)

randpw() { < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$1};echo;};

# History
HISTORY_IGNORE='sudo veracrypt *|veracrypt *'
HISTSIZE=10000000
SAVEHIST=10000000

# Source
source $ZSH/oh-my-zsh.sh
