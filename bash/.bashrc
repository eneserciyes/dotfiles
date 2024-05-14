module load neovim/0.9.5

export XDG_CONFIG_HOME=$HOME/.config
VIM="nvim"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     export MACHINE=Linux;;
    Darwin*)    export MACHINE=Mac;;
esac

PERSONAL=$XDG_CONFIG_HOME/personal
source $PERSONAL/env
source $PERSONAL/alias

export PS1="[\u@\h \W]\$ "
export SINGULARITYENV_PS1=(Singularity)${PS1}

export CC="gcc"
export CXX="g++"
export GIT_EDITOR=$VIM
export DOTFILES=$HOME/projects/dotfiles
export PYTHONBREAKPOINT="ipdb.set_trace"
export MUJOCO_GL="egl"

# [ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

addToPathFront $HOME/.local/scripts
addToPathFront $HOME/.local/bin

# bindkey -s ^f "tmux-sessionizer\n"

unset -f which

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
