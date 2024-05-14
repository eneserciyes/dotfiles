[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases
export PATH=$HOME/.local/bin:$PATH
export PS1="[\u@\h \W]\$ "
export SINGULARITYENV_PS1=(Singularity)${PS1}

export PYTHONBREAKPOINT="ipdb.set_trace"
export MUJOCO_GL="egl"

unset -f which

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
