# My "Plugins"
sources=(
  # 'autojump'
  'aliases'
  'functions'
  'git'
  # 'pyenv'
)

for s in "${sources[@]}"; do
  source $HOME/.config/zsh/include/${s}.zsh
done

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/enes/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/enes/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/enes/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/enes/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/enes/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/enes/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
