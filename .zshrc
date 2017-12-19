# Path to your oh-my-zsh installation.
  export ZSH=/home/tuan/.oh-my-zsh

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy.mm.dd"

# Plugins to include at ~/.oh-my-zsh/plugins/
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

POWERLEVEL9K_MODE='awesome-patched'

# Workaround to "rxvt-unicode-256color" as TERM throwing an error while ssh-ing
export TERM="xterm-256color"

# Aliases
alias df="df -h"
alias mkvirtenv="python -m virtualenv --system-site-packages"
alias rm="rm -i"
