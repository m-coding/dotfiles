# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
cyan="\033[1;36m"
yellow="\033[1;33m"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$green\u$cyan\$(__git_ps1)$yellow \W $ $reset"

alias subl="C:/Program\ Files/Sublime\ Text\ 2/sublime_text.exe"

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
