source ~/.local/share/omakub/defaults/bash/rc
set -h

# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

export PATH="/usr/local/cuda/bin":$PATH
export CUDA_HOME="/usr/local/cuda"

export PATH="/home/enes/.local/scripts/":$PATH
# tmux sessionizer keyboard shortcut -> C-F
bind -x '"\C-f": tmux-sessionizer'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$('/home/enes/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/enes/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/enes/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/enes/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
