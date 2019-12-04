# Paths
export ZSH="/home/tuan/.oh-my-zsh"
export PATH="$PATH:$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.dotnet/tools"
export LEDGER_FILE="/home/tuan/Documents/Finanzen/Ledger/MyBudget.ledger"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_ROOT=/opt/dotnet

# Alias
alias gowinbuild='GOOS=windows GOARCH=amd64 go build'
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

# History
HISTORY_IGNORE='sudo veracrypt *|veracrypt *'

# Source
source $ZSH/oh-my-zsh.sh
