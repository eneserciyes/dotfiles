bindkey -e
autoload -U colors && colors
if [[ -n "$SSH_TTY" ]]; then
	PS1="%{$fg[yellow]%}[ssh] %{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%} $ "
else
	PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%} $ "
fi

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
tcc() {
	local panes=$(tmux display-message -p '#{window_panes}')
	[[ $panes -gt 1 ]] && echo "more than 1 pane" && return 0
	tmux split-window -v -p 20
	tmux select-pane -t 0
	tmux split-window -h -p 30
	tmux send-keys -t 0 'nvim .' Enter
	tmux send-keys -t 1 'claude' Enter
	tmux select-pane -t 0
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
alias ga="git add -u"
alias gaa="git add -A"
alias gc="git commit -m"
alias gs="git status"

autoload -U compinit && compinit
autoload edit-command-line
zmodload zsh/complist
zle -N edit-command-line
bindkey '^Xe' edit-command-line

export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

[[ $LINUX ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
source <(fzf --zsh)
