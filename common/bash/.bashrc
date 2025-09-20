source ~/.local/share/omarchy/default/bash/rc

alias s='source ~/.bashrc'
alias ez='nvim ~/.bashrc'
alias vim='nvim'
alias ws='cd ~/ws/'
alias work='cd ~/work/'
alias personal='cd ~/personal/'
alias ls='eza -lh --group-directories-first --no-permissions'
alias diskspace="du -S | sort -n -r |more"
alias cat='bat'
alias htop='btop'
alias top='btop'
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn" # show size sort folders
alias c="clear"
alias conda_activate="source ~/miniforge3/bin/activate"

export PYTHONBREAKPOINT=ipdb.set_trace
