# Paths
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PenTestTools=$HOME/Local/PenTesting/
export CTF=$HOME/Documents/CTF/
export WORKSPACE=$HOME/workspace_l
export ZSHRC="$HOME/.zshrc"
export VISUAL="emacsclient -t"

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
alias e="emacsclient -t"
alias con="source /opt/anaconda/bin/activate root"
alias coff="source /opt/anaconda/bin/deactivate root"

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
