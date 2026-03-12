bindkey -e
PS1="%{$fg[red]%}%m%{$reset_color%}:%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "
source <(fzf --zsh)

if [[ "$(uname)" == "Darwin" ]]; then
	MAC=1
else
	LINUX=1
fi


finder() {
    open .
}
mkcd() {
  mkdir -p "$1" && cd "$1"
}

zle -N finder
bindkey '^f' finder


export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin/:$PATH"

export GG_WS="$HOME/ws/"
export GG_AP="$HOME/ws/ari-pilot"
export GG_DO="$HOME/Downloads"

export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export HISTIGNORE='exit:cd:ls:bg:fg:history:f:fd:vim'

alias src="source ~/.config/zsh/.zshrc"
alias venv="source .venv/bin/activate"
alias c="claude"
alias cr="claude --resume" 
alias vim="nvim"
alias vi="nvim"
alias im="nvim"
alias ta="tmux attach"
alias cd-w="cd ${GG_WS}"
alias cd-a="cd ${GG_AP}"
alias cd-d="cd ${GG_DO}"
alias chx="chmod +x"
alias ls="ls -C -t -U -A -p --color=auto" 

autoload -U compinit && compinit
autoload -U colors && colors
autoload edit-command-line
zmodload zsh/complist
zle -N edit-command-line
bindkey '^Xe' edit-command-line

export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
[[ $LINUX ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
