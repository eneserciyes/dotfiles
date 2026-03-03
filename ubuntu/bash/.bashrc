# If not running interactively, do nothing
case $- in
    *i*) ;;
      *) return;;
esac

# Load Ubuntu's default global bashrc first.
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# History
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
shopt -s histappend

# PATH
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export EDITOR=nvim

# Aliases
source ~/.alias

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
    . "$NVM_DIR/bash_completion"
fi

# Python
export PYTHONBREAKPOINT=ipdb.set_trace

# starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi
