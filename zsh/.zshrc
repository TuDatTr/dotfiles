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

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://share.mos4.de/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://share.mos4.de/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://share.mos4.de/$file_name"|tee /dev/null;fi;}

# Source
source $ZSH/oh-my-zsh.sh

