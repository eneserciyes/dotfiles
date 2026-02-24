# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
shopt -s histappend

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Aliases
source ~/.alias

# Zoxide
eval "$(zoxide init bash)"

# Python
export PYTHONBREAKPOINT=ipdb.set_trace

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
