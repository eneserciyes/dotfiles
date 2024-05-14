### ALIAS ####
# NYU greene
alias conda_load="module load anaconda3/2020.07"
alias dl="conda activate /home/me2646/team-wenma/env"
alias scr="cd /scratch/me2646/"
# General
alias grep="grep --colour='auto'"
alias ip='ipython --no-banner'
alias pip-update="pip install --upgrade pip && pip freeze --local | grep -v \
'^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias py="python3"
alias jn='jupyter-notebook --ip=0.0.0.0 --port=8888'
alias jn-remote="jupyter-notebook --ip='*' --no-browser --port=8889"
alias jl='jupyter-lab --ip=0.0.0.0 --port=8888'
alias pl="ip --pylab"
alias deac="conda deactivate"
alias nv="nvidia-smi"
alias update="source ~/.zshrc"
export E_OVERLAY="/scratch/me2646/enes_setup/overlay-15GB-500K.ext3"
export E_IMAGE="/scratch/work/public/singularity/cuda12.2.2-cudnn8.9.4-devel-ubuntu22.04.3.sif" 
alias sing="singularity exec --nv --overlay $E_OVERLAY:ro $E_IMAGE /bin/bash"
alias singw="singularity exec --nv --overlay $E_OVERLAY $E_IMAGE /bin/bash"
# alias python3="python"

# navigational convenience
alias ll="ls -l"
alias l="ls -al"
alias ls="ls -G --color=auto"
alias back="cd - > /dev/null"
alias   ..='cd ../'
alias  ...='cd ../../'
alias ....='cd ../../../'
alias   .3='cd ../../../'
alias   .4='cd ../../../../'
alias   .5='cd ../../../../../'
alias c='clear'

#slurm
alias sq="squeue -u me2646"


# tmux
alias tn="tmux"
alias ta="tmux attach"
alias tl="tmux list-sessions"
alias t0="tmux attach -t 0"
alias t1="tmux attach -t 1"
alias t2="tmux attach -t 2"
alias t3="tmux attach -t 3"
alias t4="tmux attach -t 4"
alias t5="tmux attach -t 5"
alias tk0="tmux kill-session -t 0"
alias tk1="tmux kill-session -t 1"
alias tk2="tmux kill-session -t 2"
alias tk3="tmux kill-session -t 3"
alias tk4="tmux kill-session -t 4"
alias tk5="tmux kill-session -t 5"

# Custom
alias fs6000="ssh fs6000"
jn-connect() {
  ssh -N -L localhost:8889:localhost:8889 fs6000
}
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# Git
alias gis='git status'
alias gid='git diff'
alias gc='git add-commit -m'
alias push='git push'
alias pull='git pull'

